/*
 * drivers/net/phy/at803x.c
 *
 * Driver for Atheros 803x PHY
 *
 * Author: Matus Ujhelyi <ujhelyi.m@gmail.com>
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 */

#include <linux/phy.h>
#include <linux/module.h>
#include <linux/string.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/of_gpio.h>
#include <linux/gpio/consumer.h>
#include <linux/phy.h>

#define AT803X_INTR_ENABLE			0x12
#define AT803X_INTR_ENABLE_AUTONEG_ERR		BIT(15)
#define AT803X_INTR_ENABLE_SPEED_CHANGED	BIT(14)
#define AT803X_INTR_ENABLE_DUPLEX_CHANGED	BIT(13)
#define AT803X_INTR_ENABLE_PAGE_RECEIVED	BIT(12)
#define AT803X_INTR_ENABLE_LINK_FAIL		BIT(11)
#define AT803X_INTR_ENABLE_LINK_SUCCESS		BIT(10)
#define AT803X_INTR_ENABLE_WIRESPEED_DOWNGRADE	BIT(5)
#define AT803X_INTR_ENABLE_POLARITY_CHANGED	BIT(1)
#define AT803X_INTR_ENABLE_WOL			BIT(0)

#define AT803X_INTR_STATUS			0x13

#define AT803X_SMART_SPEED			0x14
#define AT803X_LED_CONTROL			0x18

#define AT803X_DEVICE_ADDR			0x03
#define AT803X_LOC_MAC_ADDR_0_15_OFFSET		0x804C
#define AT803X_LOC_MAC_ADDR_16_31_OFFSET	0x804B
#define AT803X_LOC_MAC_ADDR_32_47_OFFSET	0x804A
#define AT803X_SMARTEEE_CTL3_OFFSET		0x805D
#define AT803X_MMD_ACCESS_CONTROL		0x0D
#define AT803X_MMD_ACCESS_CONTROL_DATA		0x0E
#define AT803X_FUNC_DATA			0x4003
#define AT803X_REG_CHIP_CONFIG			0x1f
#define AT803X_BT_BX_REG_SEL			0x8000
#define AT803X_SMARTEEE_DISABLED_VAL		0x1000

#define AT803X_DEBUG_ADDR			0x1D
#define AT803X_DEBUG_DATA			0x1E

#define AT803X_MODE_CFG_MASK			0x0F
#define AT803X_MODE_CFG_SGMII			0x01

#define AT803X_PSSR			0x11	/*PHY-Specific Status Register*/
#define AT803X_PSSR_MR_AN_COMPLETE	0x0200

#define AT803X_DEBUG_REG_0			0x00
#define AT803X_DEBUG_RX_CLK_DLY_EN		BIT(15)

#define AT803X_DEBUG_REG_5			0x05
#define AT803X_DEBUG_TX_CLK_DLY_EN		BIT(8)

#define AT803X_DEBUG_REG_31			0x1f
#define AT803X_VDDIO_1P8V_EN			0x8

#define ATH8030_PHY_ID 0x004dd076
#define ATH8031_PHY_ID 0x004dd074
#define ATH8035_PHY_ID 0x004dd072
#define AT803X_PHY_ID_MASK			0xffffffef

/* LED_ACT is busy on blinding even if no any frame transferring,
 * it may cause by PHY/RJ45 power supply issue, the fixup flag just
 * to do sw workaround for the issue.
 */
#define AT803X_LED_ACT_BLINDING_WORKAROUND	(1 << 0)
#define AT803X_EEE_FEATURE_DISABLE		(1 << 1)
#define AT803X_VDDIO_1P8V			(1 << 2)

MODULE_DESCRIPTION("Atheros 803x PHY driver");
MODULE_AUTHOR("Matus Ujhelyi");
MODULE_LICENSE("GPL");

struct at803x_priv {
	bool phy_reset:1;
	struct gpio_desc *gpiod_reset;
	u32 quirks;
};

struct at803x_context {
	u16 bmcr;
	u16 advertise;
	u16 control1000;
	u16 int_enable;
	u16 smart_speed;
	u16 led_control;
};

static int at803x_debug_reg_read(struct phy_device *phydev, u16 reg)
{
	int ret;

	ret = phy_write(phydev, AT803X_DEBUG_ADDR, reg);
	if (ret < 0)
		return ret;

	return phy_read(phydev, AT803X_DEBUG_DATA);
}

static int at803x_debug_reg_mask(struct phy_device *phydev, u16 reg,
				 u16 clear, u16 set)
{
	u16 val;
	int ret;

	ret = at803x_debug_reg_read(phydev, reg);
	if (ret < 0)
		return ret;

	val = ret & 0xffff;
	val &= ~clear;
	val |= set;

	return phy_write(phydev, AT803X_DEBUG_DATA, val);
}

static inline int at803x_set_rx_delay(struct phy_device *phydev, bool is_enabled)
{
	if (is_enabled)
		return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_0, 0,
						AT803X_DEBUG_RX_CLK_DLY_EN);
	else
		return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_0,
						AT803X_DEBUG_RX_CLK_DLY_EN, 0);
}

static inline int at803x_set_tx_delay(struct phy_device *phydev, bool is_enabled)
{
	if (is_enabled)
		return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_5, 0,
						AT803X_DEBUG_TX_CLK_DLY_EN);
	else
		return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_5,
						AT803X_DEBUG_TX_CLK_DLY_EN, 0);
}

static inline int at803x_set_vddio_1p8v(struct phy_device *phydev)
{
	return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_31, 0,
					AT803X_VDDIO_1P8V_EN);
}

static int at803x_disable_eee(struct phy_device *phydev)
{
	int ret;

	ret = phy_write(phydev, AT803X_MMD_ACCESS_CONTROL,
				  AT803X_DEVICE_ADDR);
	if (ret < 0)
		return ret;

	ret = phy_write(phydev, AT803X_MMD_ACCESS_CONTROL_DATA,
				  AT803X_SMARTEEE_CTL3_OFFSET);
	if (ret < 0)
		return ret;

	ret = phy_write(phydev, AT803X_MMD_ACCESS_CONTROL,
				  AT803X_FUNC_DATA);
	if (ret < 0)
		return ret;

	ret = phy_write(phydev, AT803X_MMD_ACCESS_CONTROL_DATA,
				  AT803X_SMARTEEE_DISABLED_VAL);
	if (ret < 0)
		return ret;

	return 0;
}

/* save relevant PHY registers to private copy */
static void at803x_context_save(struct phy_device *phydev,
				struct at803x_context *context)
{
	context->bmcr = phy_read(phydev, MII_BMCR);
	context->advertise = phy_read(phydev, MII_ADVERTISE);
	context->control1000 = phy_read(phydev, MII_CTRL1000);
	context->int_enable = phy_read(phydev, AT803X_INTR_ENABLE);
	context->smart_speed = phy_read(phydev, AT803X_SMART_SPEED);
	context->led_control = phy_read(phydev, AT803X_LED_CONTROL);
}

/* restore relevant PHY registers from private copy */
static void at803x_context_restore(struct phy_device *phydev,
				   const struct at803x_context *context)
{
	phy_write(phydev, MII_BMCR, context->bmcr);
	phy_write(phydev, MII_ADVERTISE, context->advertise);
	phy_write(phydev, MII_CTRL1000, context->control1000);
	phy_write(phydev, AT803X_INTR_ENABLE, context->int_enable);
	phy_write(phydev, AT803X_SMART_SPEED, context->smart_speed);
	phy_write(phydev, AT803X_LED_CONTROL, context->led_control);
}

static int at803x_set_wol(struct phy_device *phydev,
			  struct ethtool_wolinfo *wol)
{
	struct net_device *ndev = phydev->attached_dev;
	const u8 *mac;
	int ret;
	u32 value;
	unsigned int i, offsets[] = {
		AT803X_LOC_MAC_ADDR_32_47_OFFSET,
		AT803X_LOC_MAC_ADDR_16_31_OFFSET,
		AT803X_LOC_MAC_ADDR_0_15_OFFSET,
	};

	if (!ndev)
		return -ENODEV;

	if (wol->wolopts & WAKE_MAGIC) {
		mac = (const u8 *) ndev->dev_addr;

		if (!is_valid_ether_addr(mac))
			return -EINVAL;

		for (i = 0; i < 3; i++) {
			phy_write(phydev, AT803X_MMD_ACCESS_CONTROL,
				  AT803X_DEVICE_ADDR);
			phy_write(phydev, AT803X_MMD_ACCESS_CONTROL_DATA,
				  offsets[i]);
			phy_write(phydev, AT803X_MMD_ACCESS_CONTROL,
				  AT803X_FUNC_DATA);
			phy_write(phydev, AT803X_MMD_ACCESS_CONTROL_DATA,
				  mac[(i * 2) + 1] | (mac[(i * 2)] << 8));
		}

		value = phy_read(phydev, AT803X_INTR_ENABLE);
		value |= AT803X_INTR_ENABLE_WOL;
		ret = phy_write(phydev, AT803X_INTR_ENABLE, value);
		if (ret)
			return ret;
		value = phy_read(phydev, AT803X_INTR_STATUS);
	} else {
		value = phy_read(phydev, AT803X_INTR_ENABLE);
		value &= (~AT803X_INTR_ENABLE_WOL);
		ret = phy_write(phydev, AT803X_INTR_ENABLE, value);
		if (ret)
			return ret;
		value = phy_read(phydev, AT803X_INTR_STATUS);
	}

	return ret;
}

static void at803x_get_wol(struct phy_device *phydev,
			   struct ethtool_wolinfo *wol)
{
	u32 value;

	wol->supported = WAKE_MAGIC;
	wol->wolopts = 0;

	value = phy_read(phydev, AT803X_INTR_ENABLE);
	if (value & AT803X_INTR_ENABLE_WOL)
		wol->wolopts |= WAKE_MAGIC;
}

static int at803x_suspend(struct phy_device *phydev)
{
	int value;
	int wol_enabled;

	mutex_lock(&phydev->lock);

	value = phy_read(phydev, AT803X_INTR_ENABLE);
	wol_enabled = value & AT803X_INTR_ENABLE_WOL;

	value = phy_read(phydev, MII_BMCR);

	if (wol_enabled)
		value |= BMCR_ISOLATE;
	else
		value |= BMCR_PDOWN;

	phy_write(phydev, MII_BMCR, value);

	mutex_unlock(&phydev->lock);

	return 0;
}

static int at803x_resume(struct phy_device *phydev)
{
	int value;

	value = phy_read(phydev, MII_BMCR);
	value &= ~(BMCR_PDOWN | BMCR_ISOLATE);
	phy_write(phydev, MII_BMCR, value);

	return 0;
}

static int at803x_probe(struct phy_device *phydev)
{
	struct device *dev = &phydev->mdio.dev;
	struct at803x_priv *priv;
	struct gpio_desc *gpiod_reset;

	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
	if (!priv)
		return -ENOMEM;

	if (of_property_read_bool(dev->of_node, "at803x,led-act-blind-workaround"))
		priv->quirks |= AT803X_LED_ACT_BLINDING_WORKAROUND;

	if (of_property_read_bool(dev->of_node, "at803x,eee-disabled"))
		priv->quirks |= AT803X_EEE_FEATURE_DISABLE;

	if (of_property_read_bool(dev->of_node, "at803x,vddio-1p8v"))
		priv->quirks |= AT803X_VDDIO_1P8V;

	if (phydev->drv->phy_id != ATH8030_PHY_ID)
		goto does_not_require_reset_workaround;

	gpiod_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(gpiod_reset))
		return PTR_ERR(gpiod_reset);

	priv->gpiod_reset = gpiod_reset;

does_not_require_reset_workaround:
	phydev->priv = priv;

	return 0;
}

static int at803x_config_init(struct phy_device *phydev)
{
	int ret;
	struct at803x_priv *priv = phydev->priv;

	ret = genphy_config_init(phydev);
	if (ret < 0)
		return ret;

	/* Firstly clear the default status in HW reset or
	 * the bits set by bootloader.
	 */
	ret = at803x_set_rx_delay(phydev, false);
	if (ret < 0)
		return ret;
	ret = at803x_set_tx_delay(phydev, false);
	if (ret < 0)
		return ret;

	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_RXID ||
			phydev->interface == PHY_INTERFACE_MODE_RGMII_ID) {
		ret = at803x_set_rx_delay(phydev, true);
		if (ret < 0)
			return ret;
	}

	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID ||
			phydev->interface == PHY_INTERFACE_MODE_RGMII_ID) {
		ret = at803x_set_tx_delay(phydev, true);
		if (ret < 0)
			return ret;
	}

	if (priv->quirks & AT803X_VDDIO_1P8V) {
		ret = at803x_set_vddio_1p8v(phydev);
		if (ret < 0)
			return ret;
	}

	if (priv->quirks & AT803X_EEE_FEATURE_DISABLE) {
		ret = at803x_disable_eee(phydev);
		if (ret < 0)
			return ret;
	}

	return 0;
}

static int at803x_ack_interrupt(struct phy_device *phydev)
{
	int err;

	err = phy_read(phydev, AT803X_INTR_STATUS);

	return (err < 0) ? err : 0;
}

static int at803x_config_intr(struct phy_device *phydev)
{
	int err;
	int value;

	value = phy_read(phydev, AT803X_INTR_ENABLE);

	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
		value |= AT803X_INTR_ENABLE_AUTONEG_ERR;
		value |= AT803X_INTR_ENABLE_SPEED_CHANGED;
		value |= AT803X_INTR_ENABLE_DUPLEX_CHANGED;
		value |= AT803X_INTR_ENABLE_LINK_FAIL;
		value |= AT803X_INTR_ENABLE_LINK_SUCCESS;

		err = phy_write(phydev, AT803X_INTR_ENABLE, value);
	}
	else
		err = phy_write(phydev, AT803X_INTR_ENABLE, 0);

	return err;
}

static void at803x_link_change_notify(struct phy_device *phydev)
{
	struct at803x_priv *priv = phydev->priv;

	/*
	 * Conduct a hardware reset for AT8030 every time a link loss is
	 * signalled. This is necessary to circumvent a hardware bug that
	 * occurs when the cable is unplugged while TX packets are pending
	 * in the FIFO. In such cases, the FIFO enters an error mode it
	 * cannot recover from by software.
	 */
	if (phydev->state == PHY_NOLINK) {
		if (priv->gpiod_reset && !priv->phy_reset) {
			struct at803x_context context;

			at803x_context_save(phydev, &context);

			gpiod_set_value(priv->gpiod_reset, 1);
			msleep(1);
			gpiod_set_value(priv->gpiod_reset, 0);
			msleep(1);

			at803x_context_restore(phydev, &context);

			phydev_dbg(phydev, "%s(): phy was reset\n",
				   __func__);
			priv->phy_reset = true;
		}
	} else {
		priv->phy_reset = false;
	}
}

int at803x_config_aneg(struct phy_device *phydev)
{
	struct at803x_priv *priv = phydev->priv;
	int result;

	/* Only restart aneg if we are advertising something different
	 * than we were before.
	 */
	result = genphy_config_aneg_check(phydev);
	if (result > 0) {
		/* do autonegotiation here */
		result = phy_read(phydev, MII_BMCR);
		if (result < 0)
			return result;

		/* firstly power down here */
		if (priv->quirks & AT803X_LED_ACT_BLINDING_WORKAROUND) {
			phy_write(phydev, MII_BMCR, BMCR_PDOWN);
			msleep(1);
		}

		result |= BMCR_ANENABLE | BMCR_ANRESTART;
		/* Don't isolate the PHY if we're negotiating */
		result &= ~BMCR_ISOLATE;

		result = phy_write(phydev, MII_BMCR, result);
	}

	return result;
}

static int at803x_aneg_done(struct phy_device *phydev)
{
	int ccr;

	int aneg_done = genphy_aneg_done(phydev);
	if (aneg_done != BMSR_ANEGCOMPLETE)
		return aneg_done;

	/*
	 * in SGMII mode, if copper side autoneg is successful,
	 * also check SGMII side autoneg result
	 */
	ccr = phy_read(phydev, AT803X_REG_CHIP_CONFIG);
	if ((ccr & AT803X_MODE_CFG_MASK) != AT803X_MODE_CFG_SGMII)
		return aneg_done;

	/* switch to SGMII/fiber page */
	phy_write(phydev, AT803X_REG_CHIP_CONFIG, ccr & ~AT803X_BT_BX_REG_SEL);

	/* check if the SGMII link is OK. */
	if (!(phy_read(phydev, AT803X_PSSR) & AT803X_PSSR_MR_AN_COMPLETE)) {
		pr_warn("803x_aneg_done: SGMII link is not ok\n");
		aneg_done = 0;
	}
	/* switch back to copper page */
	phy_write(phydev, AT803X_REG_CHIP_CONFIG, ccr | AT803X_BT_BX_REG_SEL);

	return aneg_done;
}

static struct phy_driver at803x_driver[] = {
{
	/* ATHEROS 8035 */
	.phy_id			= ATH8035_PHY_ID,
	.name			= "Atheros 8035 ethernet",
	.phy_id_mask		= AT803X_PHY_ID_MASK,
	.probe			= at803x_probe,
	.config_init		= at803x_config_init,
	.set_wol		= at803x_set_wol,
	.get_wol		= at803x_get_wol,
	.suspend		= at803x_suspend,
	.resume			= at803x_resume,
	.features		= PHY_GBIT_FEATURES,
	.flags			= PHY_HAS_INTERRUPT,
	.config_aneg		= genphy_config_aneg,
	.read_status		= genphy_read_status,
	.ack_interrupt		= at803x_ack_interrupt,
	.config_intr		= at803x_config_intr,
}, {
	/* ATHEROS 8030 */
	.phy_id			= ATH8030_PHY_ID,
	.name			= "Atheros 8030 ethernet",
	.phy_id_mask		= AT803X_PHY_ID_MASK,
	.probe			= at803x_probe,
	.config_init		= at803x_config_init,
	.link_change_notify	= at803x_link_change_notify,
	.set_wol		= at803x_set_wol,
	.get_wol		= at803x_get_wol,
	.suspend		= at803x_suspend,
	.resume			= at803x_resume,
	.features		= PHY_BASIC_FEATURES,
	.flags			= PHY_HAS_INTERRUPT,
	.config_aneg		= genphy_config_aneg,
	.read_status		= genphy_read_status,
	.ack_interrupt		= at803x_ack_interrupt,
	.config_intr		= at803x_config_intr,
}, {
	/* ATHEROS 8031 */
	.phy_id			= ATH8031_PHY_ID,
	.name			= "Atheros 8031 ethernet",
	.phy_id_mask		= AT803X_PHY_ID_MASK,
	.probe			= at803x_probe,
	.config_init		= at803x_config_init,
	.set_wol		= at803x_set_wol,
	.get_wol		= at803x_get_wol,
	.suspend		= at803x_suspend,
	.resume			= at803x_resume,
	.features		= PHY_GBIT_FEATURES,
	.flags			= PHY_HAS_INTERRUPT,
	.config_aneg		= at803x_config_aneg,
	.read_status		= genphy_read_status,
	.aneg_done		= at803x_aneg_done,
	.ack_interrupt		= &at803x_ack_interrupt,
	.config_intr		= &at803x_config_intr,
} };

module_phy_driver(at803x_driver);

static struct mdio_device_id __maybe_unused atheros_tbl[] = {
	{ ATH8030_PHY_ID, AT803X_PHY_ID_MASK },
	{ ATH8031_PHY_ID, AT803X_PHY_ID_MASK },
	{ ATH8035_PHY_ID, AT803X_PHY_ID_MASK },
	{ }
};

MODULE_DEVICE_TABLE(mdio, atheros_tbl);

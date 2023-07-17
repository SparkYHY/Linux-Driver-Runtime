// SPDX-License-Identifier: GPL-2.0+
//
// DSP Audio platform driver
//
// Copyright 2018 NXP

#include <linux/clk.h>
#include <linux/module.h>
#include <linux/pm_runtime.h>
#include <sound/soc.h>
#include <sound/core.h>
#include <sound/compress_driver.h>

#include "fsl_dsp_cpu.h"

static int dsp_audio_startup(struct snd_pcm_substream *substream,
			     struct snd_soc_dai *cpu_dai) {
	return 0;
}


static void dsp_audio_shutdown(struct snd_pcm_substream *substream,
			       struct snd_soc_dai *cpu_dai) {
}

static const struct snd_soc_dai_ops dsp_audio_dai_ops = {
	.startup = dsp_audio_startup,
	.shutdown = dsp_audio_shutdown,
};

static struct snd_soc_dai_driver dsp_audio_dai = {
	.name = "dsp-audio-cpu-dai",
	.compress_new = snd_soc_new_compress,
	.ops = &dsp_audio_dai_ops,
	.playback = {
		.stream_name = "Compress Playback",
		.channels_min = 1,
	},
};

static const struct snd_soc_component_driver audio_dsp_component = {
	.name           = "audio-dsp",
};

static int dsp_audio_probe(struct platform_device *pdev)
{
	struct fsl_dsp_audio *dsp_audio;
	int ret;

	dsp_audio = devm_kzalloc(&pdev->dev, sizeof(*dsp_audio), GFP_KERNEL);
	if (dsp_audio == NULL)
		return -ENOMEM;

	dev_dbg(&pdev->dev, "probing DSP device....\n");

	/* intialise sof device */
	dev_set_drvdata(&pdev->dev, dsp_audio);

	pm_runtime_enable(&pdev->dev);

	/* now register audio DSP platform driver */
	ret = snd_soc_register_component(&pdev->dev, &audio_dsp_component,
			&dsp_audio_dai, 1);
	if (ret < 0) {
		dev_err(&pdev->dev,
			"error: failed to register DSP DAI driver %d\n", ret);
		goto err;
	}

        return 0;

err:
	return ret;
}

static int dsp_audio_remove(struct platform_device *pdev)
{
	snd_soc_unregister_component(&pdev->dev);
	return 0;
}


static const struct of_device_id dsp_audio_ids[] = {
	{ .compatible = "fsl,dsp-audio"},
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, dsp_audio_ids);

static struct platform_driver dsp_audio_driver = {
	.driver = {
		.name = "dsp-audio",
		.of_match_table = dsp_audio_ids,
	},
	.probe = dsp_audio_probe,
	.remove = dsp_audio_remove,
};
module_platform_driver(dsp_audio_driver);


#include <initcall.h>
#include <inttypes.h>
#include <kernel/export.h>
#include <mm/core_mmu.h>
#include <mm/core_memprot.h>
#include <malloc.h>
#include <registers/imx6.h>
#include <ldr/ldr_dac.h>

register_phys_mem(MEM_AREA_IO_SEC, IPU1_BASE, IPU1_SIZE);
register_phys_mem(MEM_AREA_IO_NSEC, IPU1_BASE, IPU1_SIZE);

register_phys_mem(MEM_AREA_IO_SEC, ANALOG_BASE, ANALOG_SIZE);
register_phys_mem(MEM_AREA_IO_NSEC, ANALOG_BASE, ANALOG_SIZE);

vaddr_t get_device_base(paddr_t base) {
	vaddr_t res;

	res = core_mmu_get_va(base, MEM_AREA_IO_SEC);

	return res;
}
TEE_EXPORT_SYMBOL(get_device_base);

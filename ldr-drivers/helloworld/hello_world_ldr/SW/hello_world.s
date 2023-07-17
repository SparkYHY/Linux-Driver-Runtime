
hello_world.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <test_export>:
   0:	e1a01000 	mov	r1, r0
   4:	e3000000 	movw	r0, #0
   8:	e92d4010 	push	{r4, lr}
   c:	e3400000 	movt	r0, #0
  10:	ebfffffe 	bl	0 <printk>
  14:	e3a00000 	mov	r0, #0
  18:	e8bd8010 	pop	{r4, pc}

0000001c <sw_probe>:
  1c:	e1a01000 	mov	r1, r0
  20:	e3000000 	movw	r0, #0
  24:	e92d4010 	push	{r4, lr}
  28:	e3a0205c 	mov	r2, #92	; 0x5c
  2c:	e3400000 	movt	r0, #0
  30:	ebfffffe 	bl	0 <memcpy>
  34:	e3a00000 	mov	r0, #0
  38:	e8bd8010 	pop	{r4, pc}

Disassembly of section .init.text:

00000000 <init_module>:
   0:	e3001000 	movw	r1, #0
   4:	e3000000 	movw	r0, #0
   8:	e92d4010 	push	{r4, lr}
   c:	e3401000 	movt	r1, #0
  10:	e3400000 	movt	r0, #0
  14:	ebfffffe 	bl	0 <printk>
  18:	e3002000 	movw	r2, #0
  1c:	e3001000 	movw	r1, #0
  20:	e3402000 	movt	r2, #0
  24:	e3401000 	movt	r1, #0
  28:	e3020235 	movw	r0, #8757	; 0x2235
  2c:	ebfffffe 	bl	0 <ldr_sw_driver_register>
  30:	e3a00000 	mov	r0, #0
  34:	e8bd8010 	pop	{r4, pc}

Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	e3000000 	movw	r0, #0
   4:	e3400000 	movt	r0, #0
   8:	eafffffe 	b	0 <printk>


mma8451_sw.ko:     file format elf32-littlearm


Disassembly of section .note.gnu.build-id:

00000000 <.note.gnu.build-id>:
   0:	00000004 	andeq	r0, r0, r4
   4:	00000014 	andeq	r0, r0, r4, lsl r0
   8:	00000003 	andeq	r0, r0, r3
   c:	00554e47 	subseq	r4, r5, r7, asr #28
  10:	faeb142d 	blx	ffac50cc <dispatch+0xffac4ee0>
  14:	6bb78720 	blvs	fede1c9c <dispatch+0xfede1ab0>
  18:	7f0d616e 	svcvc	0x000d616e
  1c:	eb0bddd9 	bl	2f7788 <dispatch+0x2f759c>
  20:	4a9be605 	bmi	fe6f983c <dispatch+0xfe6f9650>

Disassembly of section .text:

00000000 <sw_probe>:
   0:	e1a03000 	mov	r3, r0
   4:	e92d4070 	push	{r4, r5, r6, lr}
   8:	e3005000 	movw	r5, #0
   c:	e5931004 	ldr	r1, [r3, #4]
  10:	e3405000 	movt	r5, #0
  14:	e3006000 	movw	r6, #0
  18:	e5932008 	ldr	r2, [r3, #8]
  1c:	e3406000 	movt	r6, #0
  20:	e5900000 	ldr	r0, [r0]
  24:	e1a04005 	mov	r4, r5
  28:	e8a40007 	stmia	r4!, {r0, r1, r2}
  2c:	e1a00006 	mov	r0, r6
  30:	e3a01014 	mov	r1, #20
  34:	ebfffffe 	bl	0 <__memzero>
  38:	e3001000 	movw	r1, #0
  3c:	e1a02004 	mov	r2, r4
  40:	e1a00006 	mov	r0, r6
  44:	e3401000 	movt	r1, #0
  48:	ebfffffe 	bl	0 <__mutex_init>
  4c:	e3a00f6e 	mov	r0, #440	; 0x1b8
  50:	ebfffffe 	bl	0 <ldr_malloc>
  54:	e3a02000 	mov	r2, #0
  58:	e1a03000 	mov	r3, r0
  5c:	e3a01707 	mov	r1, #1835008	; 0x1c0000
  60:	e585000c 	str	r0, [r5, #12]
  64:	e5831000 	str	r1, [r3]
  68:	e1a00002 	mov	r0, r2
  6c:	e1c320b4 	strh	r2, [r3, #4]
  70:	e8bd8070 	pop	{r4, r5, r6, pc}

00000074 <sw_mma8451_read_data>:
  74:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
  78:	e3004000 	movw	r4, #0
  7c:	e24dd00c 	sub	sp, sp, #12
  80:	e3404000 	movt	r4, #0
  84:	e1a07000 	mov	r7, r0
  88:	e28d3001 	add	r3, sp, #1
  8c:	e594000c 	ldr	r0, [r4, #12]
  90:	e3a02007 	mov	r2, #7
  94:	e3a01001 	mov	r1, #1
  98:	ebfffffe 	bl	0 <i2c_smbus_read_i2c_block_data>
  9c:	e3500006 	cmp	r0, #6
  a0:	da00003d 	ble	19c <sw_mma8451_read_data+0x128>
  a4:	e3004000 	movw	r4, #0
  a8:	e3404000 	movt	r4, #0
  ac:	e1d431b2 	ldrh	r3, [r4, #18]
  b0:	e3130004 	tst	r3, #4
  b4:	1a000033 	bne	188 <sw_mma8451_read_data+0x114>
  b8:	e28d0001 	add	r0, sp, #1
  bc:	e3a01007 	mov	r1, #7
  c0:	ebfffffe 	bl	0 <ldr_dump>
  c4:	e1d402ba 	ldrh	r0, [r4, #42]	; 0x2a
  c8:	e5dd1001 	ldrb	r1, [sp, #1]
  cc:	e5dd9002 	ldrb	r9, [sp, #2]
  d0:	e5dd2003 	ldrb	r2, [sp, #3]
  d4:	e7e00150 	ubfx	r0, r0, #2, #1
  d8:	e5dd8004 	ldrb	r8, [sp, #4]
  dc:	e3500000 	cmp	r0, #0
  e0:	e5dd3005 	ldrb	r3, [sp, #5]
  e4:	01a05000 	moveq	r5, r0
  e8:	e5dd6006 	ldrb	r6, [sp, #6]
  ec:	e1899401 	orr	r9, r9, r1, lsl #8
  f0:	e1888402 	orr	r8, r8, r2, lsl #8
  f4:	e6bf9079 	sxth	r9, r9
  f8:	e1866403 	orr	r6, r6, r3, lsl #8
  fc:	e6bf8078 	sxth	r8, r8
 100:	e6bf6076 	sxth	r6, r6
 104:	1a000019 	bne	170 <sw_mma8451_read_data+0xfc>
 108:	e1d434b2 	ldrh	r3, [r4, #66]	; 0x42
 10c:	e3130004 	tst	r3, #4
 110:	1a00000a 	bne	140 <sw_mma8451_read_data+0xcc>
 114:	e3570000 	cmp	r7, #0
 118:	0a00002b 	beq	1cc <sw_mma8451_read_data+0x158>
 11c:	e1c790b0 	strh	r9, [r7]
 120:	e1c780b4 	strh	r8, [r7, #4]
 124:	e1c760b8 	strh	r6, [r7, #8]
 128:	e1d435ba 	ldrh	r3, [r4, #90]	; 0x5a
 12c:	e3130004 	tst	r3, #4
 130:	1a000007 	bne	154 <sw_mma8451_read_data+0xe0>
 134:	e1a00005 	mov	r0, r5
 138:	e28dd00c 	add	sp, sp, #12
 13c:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
 140:	e3001000 	movw	r1, #0
 144:	e59f0094 	ldr	r0, [pc, #148]	; 1e0 <sw_mma8451_read_data+0x16c>
 148:	e3401000 	movt	r1, #0
 14c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 150:	eaffffef 	b	114 <sw_mma8451_read_data+0xa0>
 154:	e3001000 	movw	r1, #0
 158:	e59f0084 	ldr	r0, [pc, #132]	; 1e4 <sw_mma8451_read_data+0x170>
 15c:	e3401000 	movt	r1, #0
 160:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 164:	e1a00005 	mov	r0, r5
 168:	e28dd00c 	add	sp, sp, #12
 16c:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
 170:	e3001000 	movw	r1, #0
 174:	e59f006c 	ldr	r0, [pc, #108]	; 1e8 <sw_mma8451_read_data+0x174>
 178:	e3401000 	movt	r1, #0
 17c:	e3a05000 	mov	r5, #0
 180:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 184:	eaffffdf 	b	108 <sw_mma8451_read_data+0x94>
 188:	e3001000 	movw	r1, #0
 18c:	e1a00004 	mov	r0, r4
 190:	e3401000 	movt	r1, #0
 194:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 198:	eaffffc6 	b	b8 <sw_mma8451_read_data+0x44>
 19c:	e594000c 	ldr	r0, [r4, #12]
 1a0:	e3001000 	movw	r1, #0
 1a4:	e3a06000 	mov	r6, #0
 1a8:	e3401000 	movt	r1, #0
 1ac:	e3004000 	movw	r4, #0
 1b0:	e1a08006 	mov	r8, r6
 1b4:	e2800020 	add	r0, r0, #32
 1b8:	e3404000 	movt	r4, #0
 1bc:	ebfffffe 	bl	0 <dev_err>
 1c0:	e1a09006 	mov	r9, r6
 1c4:	e3e05004 	mvn	r5, #4
 1c8:	eaffffce 	b	108 <sw_mma8451_read_data+0x94>
 1cc:	e3000000 	movw	r0, #0
 1d0:	e3e05000 	mvn	r5, #0
 1d4:	e3400000 	movt	r0, #0
 1d8:	ebfffffe 	bl	0 <printk>
 1dc:	eaffffd4 	b	134 <sw_mma8451_read_data+0xc0>
 1e0:	00000030 	andeq	r0, r0, r0, lsr r0
 1e4:	00000048 	andeq	r0, r0, r8, asr #32
 1e8:	00000018 	andeq	r0, r0, r8, lsl r0

000001ec <dispatch>:
 1ec:	e3500000 	cmp	r0, #0
 1f0:	e92d4070 	push	{r4, r5, r6, lr}
 1f4:	e1a05001 	mov	r5, r1
 1f8:	0a00000e 	beq	238 <dispatch+0x4c>
 1fc:	e3500001 	cmp	r0, #1
 200:	1a000022 	bne	290 <dispatch+0xa4>
 204:	e3004000 	movw	r4, #0
 208:	e3404000 	movt	r4, #0
 20c:	e1d432ba 	ldrh	r3, [r4, #42]	; 0x2a
 210:	e3130004 	tst	r3, #4
 214:	1a000013 	bne	268 <dispatch+0x7c>
 218:	e1a00005 	mov	r0, r5
 21c:	ebfffffe 	bl	74 <sw_mma8451_read_data>
 220:	e1d434b2 	ldrh	r3, [r4, #66]	; 0x42
 224:	e1a05000 	mov	r5, r0
 228:	e3130004 	tst	r3, #4
 22c:	1a000012 	bne	27c <dispatch+0x90>
 230:	e1a00005 	mov	r0, r5
 234:	e8bd8070 	pop	{r4, r5, r6, pc}
 238:	e3000000 	movw	r0, #0
 23c:	e3400000 	movt	r0, #0
 240:	e1d031b2 	ldrh	r3, [r0, #18]
 244:	e3130004 	tst	r3, #4
 248:	1a000002 	bne	258 <dispatch+0x6c>
 24c:	e1a00005 	mov	r0, r5
 250:	e8bd4070 	pop	{r4, r5, r6, lr}
 254:	eafffffe 	b	0 <sw_probe>
 258:	e3001000 	movw	r1, #0
 25c:	e3401000 	movt	r1, #0
 260:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 264:	eafffff8 	b	24c <dispatch+0x60>
 268:	e3001000 	movw	r1, #0
 26c:	e2840018 	add	r0, r4, #24
 270:	e3401000 	movt	r1, #0
 274:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 278:	eaffffe6 	b	218 <dispatch+0x2c>
 27c:	e3001000 	movw	r1, #0
 280:	e59f001c 	ldr	r0, [pc, #28]	; 2a4 <dispatch+0xb8>
 284:	e3401000 	movt	r1, #0
 288:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 28c:	eaffffe7 	b	230 <dispatch+0x44>
 290:	e3000000 	movw	r0, #0
 294:	e3a05000 	mov	r5, #0
 298:	e3400000 	movt	r0, #0
 29c:	ebfffffe 	bl	0 <printk>
 2a0:	eaffffe2 	b	230 <dispatch+0x44>
 2a4:	000000c0 	andeq	r0, r0, r0, asr #1

Disassembly of section .init.text:

00000000 <init_module>:
   0:	e3003000 	movw	r3, #0
   4:	e92d4010 	push	{r4, lr}
   8:	e3403000 	movt	r3, #0
   c:	e1a04003 	mov	r4, r3
  10:	e1d327b2 	ldrh	r2, [r3, #114]	; 0x72
  14:	e3120004 	tst	r2, #4
  18:	0a000005 	beq	34 <init_module+0x34>
  1c:	e3002000 	movw	r2, #0
  20:	e3001000 	movw	r1, #0
  24:	e3402000 	movt	r2, #0
  28:	e3401000 	movt	r1, #0
  2c:	e2830060 	add	r0, r3, #96	; 0x60
  30:	ebfffffe 	bl	0 <__dynamic_pr_debug>
  34:	e3002000 	movw	r2, #0
  38:	e3001000 	movw	r1, #0
  3c:	e3402000 	movt	r2, #0
  40:	e3401000 	movt	r1, #0
  44:	e3a00002 	mov	r0, #2
  48:	ebfffffe 	bl	0 <ldr_sw_driver_register>
  4c:	e1d438ba 	ldrh	r3, [r4, #138]	; 0x8a
  50:	e3130004 	tst	r3, #4
  54:	0a000003 	beq	68 <init_module+0x68>
  58:	e3001000 	movw	r1, #0
  5c:	e59f000c 	ldr	r0, [pc, #12]	; 70 <init_module+0x70>
  60:	e3401000 	movt	r1, #0
  64:	ebfffffe 	bl	0 <__dynamic_pr_debug>
  68:	e3a00000 	mov	r0, #0
  6c:	e8bd8010 	pop	{r4, pc}
  70:	00000078 	andeq	r0, r0, r8, ror r0

Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	e12fff1e 	bx	lr

Disassembly of section .rodata:

00000000 <__func__.29344>:
   0:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
   4:	5f313534 	svcpl	0x00313534
   8:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
   c:	00000000 	andeq	r0, r0, r0

00000010 <__func__.29153>:
  10:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
  14:	5f313534 	svcpl	0x00313534
  18:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
  1c:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  20:	00000061 	andeq	r0, r0, r1, rrx

00000024 <__func__.29332>:
  24:	6d5f7773 	ldclvs	7, cr7, [pc, #-460]	; fffffe60 <dispatch+0xfffffc74>
  28:	3438616d 	ldrtcc	r6, [r8], #-365	; 0xfffffe93
  2c:	725f3135 	subsvc	r3, pc, #1073741837	; 0x4000000d
  30:	5f646165 	svcpl	0x00646165
  34:	61746164 	cmnvs	r4, r4, ror #2
  38:	00000000 	andeq	r0, r0, r0

0000003c <__mod_i2c__mma8451_id_device_table>:
  3c:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
  40:	00313534 	eorseq	r3, r1, r4, lsr r5
	...

0000006c <__func__.29057>:
  6c:	70736964 	rsbsvc	r6, r3, r4, ror #18
  70:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
	...

Disassembly of section .ARM.exidx.init.text:

00000000 <.ARM.exidx.init.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section .ARM.exidx.exit.text:

00000000 <.ARM.exidx.exit.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80b0b0b0 	ldrhthi	fp, [r0], r0

Disassembly of section .modinfo:

00000000 <__UNIQUE_ID_license10>:
   0:	6563696c 	strbvs	r6, [r3, #-2412]!	; 0xfffff694
   4:	3d65736e 	stclcc	3, cr7, [r5, #-440]!	; 0xfffffe48
   8:	004c5047 	subeq	r5, ip, r7, asr #32

0000000c <__UNIQUE_ID_description9>:
   c:	63736564 	cmnvs	r3, #100, 10	; 0x19000000
  10:	74706972 	ldrbtvc	r6, [r0], #-2418	; 0xfffff68e
  14:	3d6e6f69 	stclcc	15, cr6, [lr, #-420]!	; 0xfffffe5c
  18:	38414d4d 	stmdacc	r1, {r0, r2, r3, r6, r8, sl, fp, lr}^
  1c:	20313534 	eorscs	r3, r1, r4, lsr r5
  20:	78412d33 	stmdavc	r1, {r0, r1, r4, r5, r8, sl, fp, sp}^
  24:	4f207369 	svcmi	0x00207369
  28:	6e656972 			; <UNDEFINED> instruction: 0x6e656972
  2c:	69746174 	ldmdbvs	r4!, {r2, r4, r5, r6, r8, sp, lr}^
  30:	4d2f6e6f 	stcmi	14, cr6, [pc, #-444]!	; fffffe7c <dispatch+0xfffffc90>
  34:	6f69746f 	svcvs	0x0069746f
  38:	6544206e 	strbvs	r2, [r4, #-110]	; 0xffffff92
  3c:	74636574 	strbtvc	r6, [r3], #-1396	; 0xfffffa8c
  40:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  44:	736e6553 	cmnvc	lr, #348127232	; 0x14c00000
  48:	6420726f 	strtvs	r7, [r0], #-623	; 0xfffffd91
  4c:	65766972 	ldrbvs	r6, [r6, #-2418]!	; 0xfffff68e
  50:	75610072 	strbvc	r0, [r1, #-114]!	; 0xffffff8e

00000052 <__UNIQUE_ID_author8>:
  52:	68747561 	ldmdavs	r4!, {r0, r5, r6, r8, sl, ip, sp, lr}^
  56:	463d726f 	ldrtmi	r7, [sp], -pc, ror #4
  5a:	73656572 	cmnvc	r5, #478150656	; 0x1c800000
  5e:	656c6163 	strbvs	r6, [ip, #-355]!	; 0xfffffe9d
  62:	6d655320 	stclvs	3, cr5, [r5, #-128]!	; 0xffffff80
  66:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
  6a:	74637564 	strbtvc	r7, [r3], #-1380	; 0xfffffa9c
  6e:	202c726f 	eorcs	r7, ip, pc, ror #4
  72:	2e636e49 	cdpcs	14, 6, cr6, cr3, cr9, {2}
	...

00000078 <__UNIQUE_ID_srcversion11>:
  78:	76637273 			; <UNDEFINED> instruction: 0x76637273
  7c:	69737265 	ldmdbvs	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
  80:	333d6e6f 	teqcc	sp, #1776	; 0x6f0
  84:	35303644 	ldrcc	r3, [r0, #-1604]!	; 0xfffff9bc
  88:	30413530 	subcc	r3, r1, r0, lsr r5
  8c:	38323341 	ldmdacc	r2!, {r0, r6, r8, r9, ip, sp}
  90:	42384345 	eorsmi	r4, r8, #335544321	; 0x14000001
  94:	33363346 	teqcc	r6, #402653185	; 0x18000001
  98:	61004541 	tstvs	r0, r1, asr #10

0000009b <__UNIQUE_ID_alias10>:
  9b:	61696c61 	cmnvs	r9, r1, ror #24
  9f:	32693d73 	rsbcc	r3, r9, #7360	; 0x1cc0
  a3:	6d6d3a63 	vpushvs	{s7-s105}
  a7:	35343861 	ldrcc	r3, [r4, #-2145]!	; 0xfffff79f
  ab:	00000031 	andeq	r0, r0, r1, lsr r0
	...

000000b0 <__module_depends>:
  b0:	65706564 	ldrbvs	r6, [r0, #-1380]!	; 0xfffffa9c
  b4:	3d73646e 	cfldrdcc	mvd6, [r3, #-440]!	; 0xfffffe48
	...

000000b9 <__UNIQUE_ID_name9>:
  b9:	656d616e 	strbvs	r6, [sp, #-366]!	; 0xfffffe92
  bd:	616d6d3d 	cmnvs	sp, sp, lsr sp
  c1:	31353438 	teqcc	r5, r8, lsr r4
  c5:	0077735f 	rsbseq	r7, r7, pc, asr r3

000000c9 <__UNIQUE_ID_vermagic8>:
  c9:	6d726576 	cfldr64vs	mvdx6, [r2, #-472]!	; 0xfffffe28
  cd:	63696761 	cmnvs	r9, #25427968	; 0x1840000
  d1:	312e343d 			; <UNDEFINED> instruction: 0x312e343d
  d5:	38392e34 	ldmdacc	r9!, {r2, r4, r5, r9, sl, fp, sp}
  d9:	6265672d 	rsbvs	r6, r5, #11796480	; 0xb40000
  dd:	66656562 	strbtvs	r6, [r5], -r2, ror #10
  e1:	4d532031 	ldclmi	0, cr2, [r3, #-196]	; 0xffffff3c
  e5:	72702050 	rsbsvc	r2, r0, #80	; 0x50
  e9:	706d6565 	rsbvc	r6, sp, r5, ror #10
  ed:	6f6d2074 	svcvs	0x006d2074
  f1:	6e755f64 	cdpvs	15, 7, cr5, cr5, cr4, {3}
  f5:	64616f6c 	strbtvs	r6, [r1], #-3948	; 0xfffff094
  f9:	646f6d20 	strbtvs	r6, [pc], #-3360	; 101 <__UNIQUE_ID_vermagic8+0x38>
  fd:	73726576 	cmnvc	r2, #494927872	; 0x1d800000
 101:	736e6f69 	cmnvc	lr, #420	; 0x1a4
 105:	4d524120 	ldfmie	f4, [r2, #-128]	; 0xffffff80
 109:	70203776 	eorvc	r3, r0, r6, ror r7
 10d:	20387632 	eorscs	r7, r8, r2, lsr r6
	...

Disassembly of section .rodata.str1.4:

00000000 <.LC0>:
   0:	616d6d26 	cmnvs	sp, r6, lsr #26
   4:	31353438 	teqcc	r5, r8, lsr r4
   8:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
   c:	0000006b 	andeq	r0, r0, fp, rrx

00000010 <.LC1>:
  10:	20633269 	rsbcs	r3, r3, r9, ror #4
  14:	636f6c62 	cmnvs	pc, #25088	; 0x6200
  18:	6572206b 	ldrbvs	r2, [r2, #-107]!	; 0xffffff95
  1c:	66206461 	strtvs	r6, [r0], -r1, ror #8
  20:	656c6961 	strbvs	r6, [ip, #-2401]!	; 0xfffff69f
  24:	00000a64 	andeq	r0, r0, r4, ror #20

00000028 <.LC2>:
  28:	5f633269 	svcpl	0x00633269
  2c:	75626d73 	strbvc	r6, [r2, #-3443]!	; 0xfffff28d
  30:	65725f73 	ldrbvs	r5, [r2, #-3955]!	; 0xfffff08d
  34:	695f6461 	ldmdbvs	pc, {r0, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
  38:	625f6332 	subsvs	r6, pc, #-939524096	; 0xc8000000
  3c:	6b636f6c 	blvs	18dbdf4 <dispatch+0x18dbc08>
  40:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  44:	20292861 	eorcs	r2, r9, r1, ror #16
  48:	63637573 	cmnvs	r3, #482344960	; 0x1cc00000
  4c:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
  50:	0000000a 	andeq	r0, r0, sl

00000054 <.LC3>:
  54:	61746164 	cmnvs	r4, r4, ror #2
  58:	2d657220 	sfmcs	f7, 2, [r5, #-128]!	; 0xffffff80
  5c:	61727261 	cmnvs	r2, r1, ror #4
  60:	6d65676e 	stclvs	7, cr6, [r5, #-440]!	; 0xfffffe48
  64:	20746e65 	rsbscs	r6, r4, r5, ror #28
  68:	63637573 	cmnvs	r3, #482344960	; 0x1cc00000
  6c:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
  70:	0000000a 	andeq	r0, r0, sl

00000074 <.LC4>:
  74:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
  78:	5f313534 	svcpl	0x00313534
  7c:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
  80:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  84:	20292861 	eorcs	r2, r9, r1, ror #16
  88:	63637573 	cmnvs	r3, #482344960	; 0x1cc00000
  8c:	2e737365 	cdpcs	3, 7, cr7, cr3, cr5, {3}
  90:	0000000a 	andeq	r0, r0, sl

00000094 <.LC5>:
  94:	52453301 	subpl	r3, r5, #67108864	; 0x4000000
  98:	3a524f52 	bcc	1493de8 <dispatch+0x1493bfc>
  9c:	4c554e20 	mrrcmi	14, 2, r4, r5, cr0
  a0:	6170204c 	cmnvs	r0, ip, asr #32
  a4:	206d6172 	rsbcs	r6, sp, r2, ror r1
  a8:	66667562 	strbtvs	r7, [r6], -r2, ror #10
  ac:	0a2e7265 	beq	b9ca48 <dispatch+0xb9c85c>
  b0:	00000000 	andeq	r0, r0, r0

000000b4 <.LC6>:
  b4:	20646e65 	rsbcs	r6, r4, r5, ror #28
  b8:	7320666f 			; <UNDEFINED> instruction: 0x7320666f
  bc:	6d6d5f77 	stclvs	15, cr5, [sp, #-476]!	; 0xfffffe24
  c0:	35343861 	ldrcc	r3, [r4, #-2145]!	; 0xfffff79f
  c4:	65725f31 	ldrbvs	r5, [r2, #-3889]!	; 0xfffff0cf
  c8:	645f6461 	ldrbvs	r6, [pc], #-1121	; d0 <.LC6+0x1c>
  cc:	28617461 	stmdacs	r1!, {r0, r5, r6, sl, ip, sp, lr}^
  d0:	000a2e29 	andeq	r2, sl, r9, lsr #28

000000d4 <.LC7>:
  d4:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
  d8:	25206564 	strcs	r6, [r0, #-1380]!	; 0xfffffa9c
  dc:	000a2e73 	andeq	r2, sl, r3, ror lr

000000e0 <.LC8>:
  e0:	6d207773 	stcvs	7, cr7, [r0, #-460]!	; 0xfffffe34
  e4:	3438616d 	ldrtcc	r6, [r8], #-365	; 0xfffffe93
  e8:	69203135 	stmdbvs	r0!, {r0, r2, r4, r5, r8, ip, sp}
  ec:	2874696e 	ldmdacs	r4!, {r1, r2, r3, r5, r6, r8, fp, sp, lr}^
  f0:	75732029 	ldrbvc	r2, [r3, #-41]!	; 0xffffffd7
  f4:	73656363 	cmnvc	r5, #-1946157055	; 0x8c000001
  f8:	000a2e73 	andeq	r2, sl, r3, ror lr
  fc:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 100:	5f313534 	svcpl	0x00313534
 104:	00007773 	andeq	r7, r0, r3, ror r7
 108:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 54 <.LC3>
 10c:	6f6e2f65 	svcvs	0x006e2f65
 110:	5f6e616c 	svcpl	0x006e616c
 114:	2f6e6179 	svccs	0x006e6179
 118:	6b736544 	blvs	1cd9630 <dispatch+0x1cd9444>
 11c:	2f706f74 	svccs	0x00706f74
 120:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 124:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 128:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 12c:	6d6d2f73 	stclvs	15, cr2, [sp, #-460]!	; 0xfffffe34
 130:	35343861 	ldrcc	r3, [r4, #-2145]!	; 0xfffff79f
 134:	65745f31 	ldrbvs	r5, [r4, #-3889]!	; 0xfffff0cf
 138:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 13c:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 140:	2f57532f 	svccs	0x0057532f
 144:	5f63786d 	svcpl	0x0063786d
 148:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 14c:	2e313534 	mrccs	5, 1, r3, cr1, cr4, {1}
 150:	00000063 	andeq	r0, r0, r3, rrx

00000154 <.LC0>:
 154:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 158:	73206564 			; <UNDEFINED> instruction: 0x73206564
 15c:	72705f77 	rsbsvc	r5, r0, #476	; 0x1dc
 160:	2865626f 	stmdacs	r5!, {r0, r1, r2, r3, r5, r6, r9, sp, lr}^
 164:	000a2e29 	andeq	r2, sl, r9, lsr #28

00000168 <.LC1>:
 168:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 16c:	73206564 			; <UNDEFINED> instruction: 0x73206564
 170:	6d6d5f77 	stclvs	15, cr5, [sp, #-476]!	; 0xfffffe24
 174:	35343861 	ldrcc	r3, [r4, #-2145]!	; 0xfffff79f
 178:	65725f31 	ldrbvs	r5, [r2, #-3889]!	; 0xfffff0cf
 17c:	645f6461 	ldrbvs	r6, [pc], #-1121	; 184 <.LC1+0x1c>
 180:	28617461 	stmdacs	r1!, {r0, r5, r6, sl, ip, sp, lr}^
 184:	000a2e29 	andeq	r2, sl, r9, lsr #28

00000188 <.LC2>:
 188:	6d5f7773 	ldclvs	7, cr7, [pc, #-460]	; ffffffc4 <dispatch+0xfffffdd8>
 18c:	3438616d 	ldrtcc	r6, [r8], #-365	; 0xfffffe93
 190:	725f3135 	subsvc	r3, pc, #1073741837	; 0x4000000d
 194:	5f646165 	svcpl	0x00646165
 198:	61746164 	cmnvs	r4, r4, ror #2
 19c:	73202928 			; <UNDEFINED> instruction: 0x73202928
 1a0:	65636375 	strbvs	r6, [r3, #-885]!	; 0xfffffc8b
 1a4:	0a2e7373 	beq	b9cf78 <dispatch+0xb9cd8c>
 1a8:	00000000 	andeq	r0, r0, r0

000001ac <.LC3>:
 1ac:	52453301 	subpl	r3, r5, #67108864	; 0x4000000
 1b0:	3a524f52 	bcc	1493f00 <dispatch+0x1493d14>
 1b4:	6b6e5520 	blvs	1b9563c <dispatch+0x1b95450>
 1b8:	6e776f6e 	cdpvs	15, 7, cr6, cr7, cr14, {3}
 1bc:	6e756620 	cdpvs	6, 7, cr6, cr5, cr0, {1}
 1c0:	6f697463 	svcvs	0x00697463
 1c4:	000a2e6e 	andeq	r2, sl, lr, ror #28
 1c8:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
 1cc:	5f313534 	svcpl	0x00313534
 1d0:	00007773 	andeq	r7, r0, r3, ror r7
 1d4:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 120 <.LC8+0x40>
 1d8:	6f6e2f65 	svcvs	0x006e2f65
 1dc:	5f6e616c 	svcpl	0x006e616c
 1e0:	2f6e6179 	svccs	0x006e6179
 1e4:	6b736544 	blvs	1cd96fc <dispatch+0x1cd9510>
 1e8:	2f706f74 	svccs	0x00706f74
 1ec:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 1f0:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 1f4:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 1f8:	6d6d2f73 	stclvs	15, cr2, [sp, #-460]!	; 0xfffffe34
 1fc:	35343861 	ldrcc	r3, [r4, #-2145]!	; 0xfffff79f
 200:	65745f31 	ldrbvs	r5, [r4, #-3889]!	; 0xfffff0cf
 204:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 208:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 20c:	2f57532f 	svccs	0x0057532f
 210:	70736964 	rsbsvc	r6, r3, r4, ror #18
 214:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
 218:	632e7265 			; <UNDEFINED> instruction: 0x632e7265
	...

Disassembly of section .data:

00000000 <mma8451_lock>:
	...
   c:	0000000c 	andeq	r0, r0, ip
  10:	0000000c 	andeq	r0, r0, ip

Disassembly of section __verbose:

00000000 <descriptor.29152>:
   0:	000000fc 	strdeq	r0, [r0], -ip
   4:	00000010 	andeq	r0, r0, r0, lsl r0
   8:	00000108 	andeq	r0, r0, r8, lsl #2
   c:	00000028 	andeq	r0, r0, r8, lsr #32
  10:	000000d5 	ldrdeq	r0, [r0], -r5
  14:	00000000 	andeq	r0, r0, r0

00000018 <descriptor.29154>:
  18:	000000fc 	strdeq	r0, [r0], -ip
  1c:	00000010 	andeq	r0, r0, r0, lsl r0
  20:	00000108 	andeq	r0, r0, r8, lsl #2
  24:	00000054 	andeq	r0, r0, r4, asr r0
  28:	000000dc 	ldrdeq	r0, [r0], -ip
  2c:	00000000 	andeq	r0, r0, r0

00000030 <descriptor.29331>:
  30:	000000fc 	strdeq	r0, [r0], -ip
  34:	00000024 	andeq	r0, r0, r4, lsr #32
  38:	00000108 	andeq	r0, r0, r8, lsl #2
  3c:	00000074 	andeq	r0, r0, r4, ror r0
  40:	00000275 	andeq	r0, r0, r5, ror r2
  44:	00000000 	andeq	r0, r0, r0

00000048 <descriptor.29339>:
  48:	000000fc 	strdeq	r0, [r0], -ip
  4c:	00000024 	andeq	r0, r0, r4, lsr #32
  50:	00000108 	andeq	r0, r0, r8, lsl #2
  54:	000000b4 	strheq	r0, [r0], -r4
  58:	00000285 	andeq	r0, r0, r5, lsl #5
  5c:	00000000 	andeq	r0, r0, r0

00000060 <descriptor.29343>:
  60:	000000fc 	strdeq	r0, [r0], -ip
  64:	00000000 	andeq	r0, r0, r0
  68:	00000108 	andeq	r0, r0, r8, lsl #2
  6c:	000000d4 	ldrdeq	r0, [r0], -r4
  70:	0000028d 	andeq	r0, r0, sp, lsl #5
  74:	00000000 	andeq	r0, r0, r0

00000078 <descriptor.29345>:
  78:	000000fc 	strdeq	r0, [r0], -ip
  7c:	00000000 	andeq	r0, r0, r0
  80:	00000108 	andeq	r0, r0, r8, lsl #2
  84:	000000e0 	andeq	r0, r0, r0, ror #1
  88:	00000290 	muleq	r0, r0, r2
  8c:	00000000 	andeq	r0, r0, r0

00000090 <descriptor.29056>:
  90:	000001c8 	andeq	r0, r0, r8, asr #3
  94:	0000006c 	andeq	r0, r0, ip, rrx
  98:	000001d4 	ldrdeq	r0, [r0], -r4
  9c:	00000154 	andeq	r0, r0, r4, asr r1
  a0:	00000018 	andeq	r0, r0, r8, lsl r0
  a4:	00000000 	andeq	r0, r0, r0

000000a8 <descriptor.29060>:
  a8:	000001c8 	andeq	r0, r0, r8, asr #3
  ac:	0000006c 	andeq	r0, r0, ip, rrx
  b0:	000001d4 	ldrdeq	r0, [r0], -r4
  b4:	00000168 	andeq	r0, r0, r8, ror #2
  b8:	0000001d 	andeq	r0, r0, sp, lsl r0
  bc:	00000000 	andeq	r0, r0, r0

000000c0 <descriptor.29061>:
  c0:	000001c8 	andeq	r0, r0, r8, asr #3
  c4:	0000006c 	andeq	r0, r0, ip, rrx
  c8:	000001d4 	ldrdeq	r0, [r0], -r4
  cc:	00000188 	andeq	r0, r0, r8, lsl #3
  d0:	0000001f 	andeq	r0, r0, pc, lsl r0
  d4:	00000000 	andeq	r0, r0, r0

Disassembly of section .gnu.linkonce.this_module:

00000000 <__this_module>:
	...
   c:	38616d6d 	stmdacc	r1!, {r0, r2, r3, r5, r6, r8, sl, fp, sp, lr}^
  10:	5f313534 	svcpl	0x00313534
  14:	00007773 	andeq	r7, r0, r3, ror r7
	...

Disassembly of section .ARM.exidx:

00000000 <.ARM.exidx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80aab0b0 	strhthi	fp, [sl], r0
   8:	00000074 	andeq	r0, r0, r4, ror r0
   c:	8002adb0 			; <UNDEFINED> instruction: 0x8002adb0
  10:	000001ec 	andeq	r0, r0, ip, ror #3
  14:	80aab0b0 	strhthi	fp, [sl], r0

Disassembly of section __versions:

00000000 <____versions>:
   0:	833850da 	teqhi	r8, #218	; 0xda
   4:	75646f6d 	strbvc	r6, [r4, #-3949]!	; 0xfffff093
   8:	6c5f656c 	cfldr64vs	mvdx6, [pc], {108}	; 0x6c
   c:	756f7961 	strbvc	r7, [pc, #-2401]!	; fffff6b3 <dispatch+0xfffff4c7>
  10:	00000074 	andeq	r0, r0, r4, ror r0
	...
  40:	8a84fcd7 	bhi	fe13f3a4 <dispatch+0xfe13f1b8>
  44:	5f633269 	svcpl	0x00633269
  48:	75626d73 	strbvc	r6, [r2, #-3443]!	; 0xfffff28d
  4c:	65725f73 	ldrbvs	r5, [r2, #-3955]!	; 0xfffff08d
  50:	695f6461 	ldmdbvs	pc, {r0, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
  54:	625f6332 	subsvs	r6, pc, #-939524096	; 0xc8000000
  58:	6b636f6c 	blvs	18dbe10 <dispatch+0x18dbc24>
  5c:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  60:	00000061 	andeq	r0, r0, r1, rrx
	...
  80:	44b1d426 	ldrtmi	sp, [r1], #1062	; 0x426
  84:	79645f5f 	stmdbvc	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
  88:	696d616e 	stmdbvs	sp!, {r1, r2, r3, r5, r6, r8, sp, lr}^
  8c:	72705f63 	rsbsvc	r5, r0, #396	; 0x18c
  90:	6265645f 	rsbvs	r6, r5, #1593835520	; 0x5f000000
  94:	00006775 	andeq	r6, r0, r5, ror r7
	...
  c0:	0fa2a45e 	svceq	0x00a2a45e
  c4:	656d5f5f 	strbvs	r5, [sp, #-3935]!	; 0xfffff0a1
  c8:	72657a6d 	rsbvc	r7, r5, #446464	; 0x6d000
  cc:	0000006f 	andeq	r0, r0, pc, rrx
	...
 100:	3a4760a1 	bcc	11d838c <dispatch+0x11d81a0>
 104:	5f766564 	svcpl	0x00766564
 108:	00727265 	rsbseq	r7, r2, r5, ror #4
	...
 140:	2aee63f4 	bcs	ffb99118 <dispatch+0xffb98f2c>
 144:	756d5f5f 	strbvc	r5, [sp, #-3935]!	; 0xfffff0a1
 148:	5f786574 	svcpl	0x00786574
 14c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
	...
 180:	27e1a049 	strbcs	sl, [r1, r9, asr #32]!
 184:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 188:	00006b74 	andeq	r6, r0, r4, ror fp
	...
 1c0:	efd6cf06 	svc	0x00d6cf06
 1c4:	65615f5f 	strbvs	r5, [r1, #-3935]!	; 0xfffff0a1
 1c8:	5f696261 	svcpl	0x00696261
 1cc:	69776e75 	ldmdbvs	r7!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 1d0:	635f646e 	cmpvs	pc, #1845493760	; 0x6e000000
 1d4:	705f7070 	subsvc	r7, pc, r0, ror r0	; <UNPREDICTABLE>
 1d8:	00003072 	andeq	r3, r0, r2, ror r0
	...

Disassembly of section .bss:

00000000 <mma_status>:
	...

0000000c <mma8451_i2c_client>:
   c:	00000000 	andeq	r0, r0, r0

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	movtmi	r4, #14080	; 0x3700
   4:	4c28203a 	stcmi	0, cr2, [r8], #-232	; 0xffffff18
   8:	72616e69 	rsbvc	r6, r1, #1680	; 0x690
   c:	4347206f 	movtmi	r2, #28783	; 0x706f
  10:	2e372043 	cdpcs	0, 3, cr2, cr7, cr3, {2}
  14:	30322d35 	eorscc	r2, r2, r5, lsr sp
  18:	312e3931 			; <UNDEFINED> instruction: 0x312e3931
  1c:	37202932 			; <UNDEFINED> instruction: 0x37202932
  20:	302e352e 	eorcc	r3, lr, lr, lsr #10
  24:	43470000 	movtmi	r0, #28672	; 0x7000
  28:	28203a43 	stmdacs	r0!, {r0, r1, r6, r9, fp, ip, sp}
  2c:	616e694c 	cmnvs	lr, ip, asr #18
  30:	47206f72 			; <UNDEFINED> instruction: 0x47206f72
  34:	37204343 	strcc	r4, [r0, -r3, asr #6]!
  38:	322d352e 	eorcc	r3, sp, #192937984	; 0xb800000
  3c:	2e393130 	mrccs	1, 1, r3, cr9, cr0, {1}
  40:	20293231 	eorcs	r3, r9, r1, lsr r2
  44:	2e352e37 	mrccs	14, 1, r2, cr5, cr7, {1}
  48:	47000030 	smladxmi	r0, r0, r0, r0
  4c:	203a4343 	eorscs	r4, sl, r3, asr #6
  50:	6e694c28 	cdpvs	12, 6, cr4, cr9, cr8, {1}
  54:	206f7261 	rsbcs	r7, pc, r1, ror #4
  58:	20434347 	subcs	r4, r3, r7, asr #6
  5c:	2d352e37 	ldccs	14, cr2, [r5, #-220]!	; 0xffffff24
  60:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
  64:	2932312e 	ldmdbcs	r2!, {r1, r2, r3, r5, r8, ip, sp}
  68:	352e3720 	strcc	r3, [lr, #-1824]!	; 0xfffff8e0
  6c:	Address 0x000000000000006c is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00003041 	andeq	r3, r0, r1, asr #32
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000026 	andeq	r0, r0, r6, lsr #32
  10:	412d3705 			; <UNDEFINED> instruction: 0x412d3705
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	12020a02 	andne	r0, r2, #8192	; 0x2000
  20:	15011402 	strne	r1, [r1, #-1026]	; 0xfffffbfe
  24:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  28:	1a011901 	bne	46434 <dispatch+0x46248>
  2c:	22021e02 	andcs	r1, r2, #2, 28
  30:	Address 0x0000000000000030 is out of bounds.



mag3110_sw_io_sw.ko:     file format elf32-littlearm


Disassembly of section .note.gnu.build-id:

00000000 <.note.gnu.build-id>:
   0:	00000004 	andeq	r0, r0, r4
   4:	00000014 	andeq	r0, r0, r4, lsl r0
   8:	00000003 	andeq	r0, r0, r3
   c:	00554e47 	subseq	r4, r5, r7, asr #28
  10:	6236abda 	eorsvs	sl, r6, #223232	; 0x36800
  14:	921d066e 	andsls	r0, sp, #115343360	; 0x6e00000
  18:	160aedf2 			; <UNDEFINED> instruction: 0x160aedf2
  1c:	93ff51f0 	mvnsls	r5, #240, 2	; 0x3c
  20:	730b36e1 	movwvc	r3, #46817	; 0xb6e1

Disassembly of section .text:

00000000 <mag3110_enable_show>:
   0:	e92d4070 	push	{r4, r5, r6, lr}
   4:	e3004000 	movw	r4, #0
   8:	e3404000 	movt	r4, #0
   c:	e1a05002 	mov	r5, r2
  10:	e1a00004 	mov	r0, r4
  14:	ebfffffe 	bl	0 <mutex_lock>
  18:	e3003000 	movw	r3, #0
  1c:	e3a01010 	mov	r1, #16
  20:	e3403000 	movt	r3, #0
  24:	e5933000 	ldr	r3, [r3]
  28:	e5930000 	ldr	r0, [r3]
  2c:	ebfffffe 	bl	0 <i2c_smbus_read_byte_data>
  30:	e1a06000 	mov	r6, r0
  34:	e1a00004 	mov	r0, r4
  38:	ebfffffe 	bl	0 <mutex_unlock>
  3c:	e3001000 	movw	r1, #0
  40:	e2062001 	and	r2, r6, #1
  44:	e1a00005 	mov	r0, r5
  48:	e3401000 	movt	r1, #0
  4c:	ebfffffe 	bl	0 <sprintf>
  50:	e3a00002 	mov	r0, #2
  54:	e8bd8070 	pop	{r4, r5, r6, pc}

00000058 <mag3110_read_data>:
  58:	e3003000 	movw	r3, #0
  5c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
  60:	e3403000 	movt	r3, #0
  64:	e24dd008 	sub	sp, sp, #8
  68:	e5934000 	ldr	r4, [r3]
  6c:	e3540000 	cmp	r4, #0
  70:	0a000032 	beq	140 <mag3110_read_data+0xe8>
  74:	e594301c 	ldr	r3, [r4, #28]
  78:	e1a06002 	mov	r6, r2
  7c:	e1a07001 	mov	r7, r1
  80:	e1a08000 	mov	r8, r0
  84:	e3530000 	cmp	r3, #0
  88:	0a00002c 	beq	140 <mag3110_read_data+0xe8>
  8c:	e3a01000 	mov	r1, #0
  90:	e5940000 	ldr	r0, [r4]
  94:	ebfffffe 	bl	0 <i2c_smbus_read_byte_data>
  98:	e3100008 	tst	r0, #8
  9c:	0afffffa 	beq	8c <mag3110_read_data+0x34>
  a0:	e3a03000 	mov	r3, #0
  a4:	e5c43018 	strb	r3, [r4, #24]
  a8:	ea000004 	b	c0 <mag3110_read_data+0x68>
  ac:	e5945000 	ldr	r5, [r4]
  b0:	e1a00005 	mov	r0, r5
  b4:	ebfffffe 	bl	0 <i2c_smbus_read_i2c_block_data>
  b8:	e3500005 	cmp	r0, #5
  bc:	da000019 	ble	128 <mag3110_read_data+0xd0>
  c0:	e3a01000 	mov	r1, #0
  c4:	e5940000 	ldr	r0, [r4]
  c8:	ebfffffe 	bl	0 <i2c_smbus_read_byte_data>
  cc:	e2505000 	subs	r5, r0, #0
  d0:	e28d3002 	add	r3, sp, #2
  d4:	e3a02006 	mov	r2, #6
  d8:	e3a01001 	mov	r1, #1
  dc:	1afffff2 	bne	ac <mag3110_read_data+0x54>
  e0:	e5dd3002 	ldrb	r3, [sp, #2]
  e4:	e1a01002 	mov	r1, r2
  e8:	e5ddc003 	ldrb	ip, [sp, #3]
  ec:	e28d0002 	add	r0, sp, #2
  f0:	e5dd4004 	ldrb	r4, [sp, #4]
  f4:	e5dd2005 	ldrb	r2, [sp, #5]
  f8:	e5dde006 	ldrb	lr, [sp, #6]
  fc:	e18cc403 	orr	ip, ip, r3, lsl #8
 100:	e5dd3007 	ldrb	r3, [sp, #7]
 104:	e1822404 	orr	r2, r2, r4, lsl #8
 108:	e1c8c0b0 	strh	ip, [r8]
 10c:	e183340e 	orr	r3, r3, lr, lsl #8
 110:	e1c720b0 	strh	r2, [r7]
 114:	e1c630b0 	strh	r3, [r6]
 118:	ebfffffe 	bl	0 <ldr_dump>
 11c:	e1a00005 	mov	r0, r5
 120:	e28dd008 	add	sp, sp, #8
 124:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
 128:	e3001000 	movw	r1, #0
 12c:	e2850020 	add	r0, r5, #32
 130:	e3401000 	movt	r1, #0
 134:	ebfffffe 	bl	0 <dev_err>
 138:	e3e00000 	mvn	r0, #0
 13c:	eafffff7 	b	120 <mag3110_read_data+0xc8>
 140:	e3e00015 	mvn	r0, #21
 144:	eafffff5 	b	120 <mag3110_read_data+0xc8>

00000148 <mag3110_enable_store>:
 148:	e92d40f0 	push	{r4, r5, r6, r7, lr}
 14c:	e1a01002 	mov	r1, r2
 150:	e24dd014 	sub	sp, sp, #20
 154:	e1a05000 	mov	r5, r0
 158:	e28d2004 	add	r2, sp, #4
 15c:	e1a00001 	mov	r0, r1
 160:	e3a0100a 	mov	r1, #10
 164:	e1a06003 	mov	r6, r3
 168:	ebfffffe 	bl	0 <_kstrtol>
 16c:	e2504000 	subs	r4, r0, #0
 170:	0a000006 	beq	190 <mag3110_enable_store+0x48>
 174:	e3001000 	movw	r1, #0
 178:	e1a00005 	mov	r0, r5
 17c:	e3401000 	movt	r1, #0
 180:	ebfffffe 	bl	0 <dev_err>
 184:	e1a00004 	mov	r0, r4
 188:	e28dd014 	add	sp, sp, #20
 18c:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
 190:	e3000000 	movw	r0, #0
 194:	e3005000 	movw	r5, #0
 198:	e3405000 	movt	r5, #0
 19c:	e3400000 	movt	r0, #0
 1a0:	ebfffffe 	bl	0 <mutex_lock>
 1a4:	e5953000 	ldr	r3, [r5]
 1a8:	e3000000 	movw	r0, #0
 1ac:	e59d1004 	ldr	r1, [sp, #4]
 1b0:	e3400000 	movt	r0, #0
 1b4:	e3004000 	movw	r4, #0
 1b8:	e5937000 	ldr	r7, [r3]
 1bc:	e3404000 	movt	r4, #0
 1c0:	ebfffffe 	bl	0 <printk>
 1c4:	e5952000 	ldr	r2, [r5]
 1c8:	e3003000 	movw	r3, #0
 1cc:	e3403000 	movt	r3, #0
 1d0:	e3000000 	movw	r0, #0
 1d4:	e3400000 	movt	r0, #0
 1d8:	e592101c 	ldr	r1, [r2, #28]
 1dc:	e3510000 	cmp	r1, #0
 1e0:	11a01003 	movne	r1, r3
 1e4:	01a01004 	moveq	r1, r4
 1e8:	ebfffffe 	bl	0 <printk>
 1ec:	e1a00007 	mov	r0, r7
 1f0:	e3a01010 	mov	r1, #16
 1f4:	ebfffffe 	bl	0 <i2c_smbus_read_byte_data>
 1f8:	e59d3004 	ldr	r3, [sp, #4]
 1fc:	e3530000 	cmp	r3, #0
 200:	e5953000 	ldr	r3, [r5]
 204:	e593301c 	ldr	r3, [r3, #28]
 208:	0a000016 	beq	268 <mag3110_enable_store+0x120>
 20c:	e3530000 	cmp	r3, #0
 210:	0a00001d 	beq	28c <mag3110_enable_store+0x144>
 214:	e3001000 	movw	r1, #0
 218:	e3401000 	movt	r1, #0
 21c:	e3000000 	movw	r0, #0
 220:	e3400000 	movt	r0, #0
 224:	ebfffffe 	bl	0 <printk>
 228:	e3a00064 	mov	r0, #100	; 0x64
 22c:	ebfffffe 	bl	0 <msleep>
 230:	e5950000 	ldr	r0, [r5]
 234:	e28d300a 	add	r3, sp, #10
 238:	e3a02006 	mov	r2, #6
 23c:	e3a01001 	mov	r1, #1
 240:	e5904000 	ldr	r4, [r0]
 244:	e1a00004 	mov	r0, r4
 248:	ebfffffe 	bl	0 <i2c_smbus_read_i2c_block_data>
 24c:	e3500005 	cmp	r0, #5
 250:	da000019 	ble	2bc <mag3110_enable_store+0x174>
 254:	e3000000 	movw	r0, #0
 258:	e1a04006 	mov	r4, r6
 25c:	e3400000 	movt	r0, #0
 260:	ebfffffe 	bl	0 <mutex_unlock>
 264:	eaffffc6 	b	184 <mag3110_enable_store+0x3c>
 268:	e3530001 	cmp	r3, #1
 26c:	0a000017 	beq	2d0 <mag3110_enable_store+0x188>
 270:	e5953000 	ldr	r3, [r5]
 274:	e593301c 	ldr	r3, [r3, #28]
 278:	e3530000 	cmp	r3, #0
 27c:	1affffe4 	bne	214 <mag3110_enable_store+0xcc>
 280:	e3001000 	movw	r1, #0
 284:	e3401000 	movt	r1, #0
 288:	eaffffe3 	b	21c <mag3110_enable_store+0xd4>
 28c:	e3802001 	orr	r2, r0, #1
 290:	e3a01010 	mov	r1, #16
 294:	e6ef2072 	uxtb	r2, r2
 298:	e1a00007 	mov	r0, r7
 29c:	ebfffffe 	bl	0 <i2c_smbus_write_byte_data>
 2a0:	e3500000 	cmp	r0, #0
 2a4:	ba000014 	blt	2fc <mag3110_enable_store+0x1b4>
 2a8:	1afffff0 	bne	270 <mag3110_enable_store+0x128>
 2ac:	e5953000 	ldr	r3, [r5]
 2b0:	e3a02001 	mov	r2, #1
 2b4:	e583201c 	str	r2, [r3, #28]
 2b8:	eaffffd5 	b	214 <mag3110_enable_store+0xcc>
 2bc:	e3001000 	movw	r1, #0
 2c0:	e2840020 	add	r0, r4, #32
 2c4:	e3401000 	movt	r1, #0
 2c8:	ebfffffe 	bl	0 <dev_err>
 2cc:	eaffffe0 	b	254 <mag3110_enable_store+0x10c>
 2d0:	e20020fe 	and	r2, r0, #254	; 0xfe
 2d4:	e3a01010 	mov	r1, #16
 2d8:	e1a00007 	mov	r0, r7
 2dc:	ebfffffe 	bl	0 <i2c_smbus_write_byte_data>
 2e0:	e3500000 	cmp	r0, #0
 2e4:	ba000004 	blt	2fc <mag3110_enable_store+0x1b4>
 2e8:	e5953000 	ldr	r3, [r5]
 2ec:	01a01004 	moveq	r1, r4
 2f0:	0583001c 	streq	r0, [r3, #28]
 2f4:	0affffc8 	beq	21c <mag3110_enable_store+0xd4>
 2f8:	eaffffdc 	b	270 <mag3110_enable_store+0x128>
 2fc:	e3001000 	movw	r1, #0
 300:	e2870020 	add	r0, r7, #32
 304:	e3401000 	movt	r1, #0
 308:	ebfffffe 	bl	0 <dev_err>
 30c:	eaffffd7 	b	270 <mag3110_enable_store+0x128>

00000310 <sw_probe>:
 310:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 314:	e1a06000 	mov	r6, r0
 318:	e24dd014 	sub	sp, sp, #20
 31c:	e3a00028 	mov	r0, #40	; 0x28
 320:	e3008000 	movw	r8, #0
 324:	ebfffffe 	bl	0 <ldr_malloc>
 328:	e3500000 	cmp	r0, #0
 32c:	e3408000 	movt	r8, #0
 330:	e5880000 	str	r0, [r8]
 334:	0a000089 	beq	560 <sw_probe+0x250>
 338:	e1a02006 	mov	r2, r6
 33c:	e1a03000 	mov	r3, r0
 340:	e2861020 	add	r1, r6, #32
 344:	e5926000 	ldr	r6, [r2]
 348:	e2822010 	add	r2, r2, #16
 34c:	e512e00c 	ldr	lr, [r2, #-12]
 350:	e2833010 	add	r3, r3, #16
 354:	e512c008 	ldr	ip, [r2, #-8]
 358:	e5120004 	ldr	r0, [r2, #-4]
 35c:	e1520001 	cmp	r2, r1
 360:	e5036010 	str	r6, [r3, #-16]
 364:	e503e00c 	str	lr, [r3, #-12]
 368:	e503c008 	str	ip, [r3, #-8]
 36c:	e5030004 	str	r0, [r3, #-4]
 370:	1afffff3 	bne	344 <sw_probe+0x34>
 374:	e592c000 	ldr	ip, [r2]
 378:	e3000000 	movw	r0, #0
 37c:	e5922004 	ldr	r2, [r2, #4]
 380:	e3400000 	movt	r0, #0
 384:	e3a01014 	mov	r1, #20
 388:	e583c000 	str	ip, [r3]
 38c:	e5832004 	str	r2, [r3, #4]
 390:	ebfffffe 	bl	0 <__memzero>
 394:	e3001000 	movw	r1, #0
 398:	e3000000 	movw	r0, #0
 39c:	e3401000 	movt	r1, #0
 3a0:	e59f21f0 	ldr	r2, [pc, #496]	; 598 <sw_probe+0x288>
 3a4:	e3400000 	movt	r0, #0
 3a8:	ebfffffe 	bl	0 <__mutex_init>
 3ac:	e3a00f6e 	mov	r0, #440	; 0x1b8
 3b0:	e5986000 	ldr	r6, [r8]
 3b4:	ebfffffe 	bl	0 <ldr_malloc>
 3b8:	e5983000 	ldr	r3, [r8]
 3bc:	e3a0e000 	mov	lr, #0
 3c0:	e5860000 	str	r0, [r6]
 3c4:	e3a0c00e 	mov	ip, #14
 3c8:	e3a02002 	mov	r2, #2
 3cc:	e1a0100c 	mov	r1, ip
 3d0:	e5930000 	ldr	r0, [r3]
 3d4:	e1c0e0b0 	strh	lr, [r0]
 3d8:	e1a00002 	mov	r0, r2
 3dc:	e593e000 	ldr	lr, [r3]
 3e0:	e1cec0b2 	strh	ip, [lr, #2]
 3e4:	e5933000 	ldr	r3, [r3]
 3e8:	e1c320b4 	strh	r2, [r3, #4]
 3ec:	ebfffffe 	bl	0 <imx_i2c_probe>
 3f0:	e2501000 	subs	r1, r0, #0
 3f4:	1a000061 	bne	580 <sw_probe+0x270>
 3f8:	e5983000 	ldr	r3, [r8]
 3fc:	e3a01007 	mov	r1, #7
 400:	e5930000 	ldr	r0, [r3]
 404:	ebfffffe 	bl	0 <i2c_smbus_read_byte_data>
 408:	e35000c4 	cmp	r0, #196	; 0xc4
 40c:	e1a01000 	mov	r1, r0
 410:	1a000054 	bne	568 <sw_probe+0x258>
 414:	e3003000 	movw	r3, #0
 418:	e3000000 	movw	r0, #0
 41c:	e1a06003 	mov	r6, r3
 420:	e3400000 	movt	r0, #0
 424:	ebfffffe 	bl	0 <printk>
 428:	e3a01000 	mov	r1, #0
 42c:	e1a03006 	mov	r3, r6
 430:	e3403000 	movt	r3, #0
 434:	e59f215c 	ldr	r2, [pc, #348]	; 598 <sw_probe+0x288>
 438:	e1a00001 	mov	r0, r1
 43c:	e58d3004 	str	r3, [sp, #4]
 440:	ebfffeee 	bl	0 <mag3110_enable_show>
 444:	e3000000 	movw	r0, #0
 448:	e59f1148 	ldr	r1, [pc, #328]	; 598 <sw_probe+0x288>
 44c:	e3400000 	movt	r0, #0
 450:	e3a06000 	mov	r6, #0
 454:	ebfffffe 	bl	0 <printk>
 458:	e3a03031 	mov	r3, #49	; 0x31
 45c:	e1a01006 	mov	r1, r6
 460:	e1c830b4 	strh	r3, [r8, #4]
 464:	e1a00006 	mov	r0, r6
 468:	e3a03001 	mov	r3, #1
 46c:	e59f2124 	ldr	r2, [pc, #292]	; 598 <sw_probe+0x288>
 470:	ebffff34 	bl	148 <mag3110_enable_store>
 474:	e1a01006 	mov	r1, r6
 478:	e59f2118 	ldr	r2, [pc, #280]	; 598 <sw_probe+0x288>
 47c:	e1a00006 	mov	r0, r6
 480:	ebfffede 	bl	0 <mag3110_enable_show>
 484:	e3000000 	movw	r0, #0
 488:	e59f1108 	ldr	r1, [pc, #264]	; 598 <sw_probe+0x288>
 48c:	e3400000 	movt	r0, #0
 490:	ebfffffe 	bl	0 <printk>
 494:	ebfffffe 	bl	0 <ktime_get>
 498:	e3a070f0 	mov	r7, #240	; 0xf0
 49c:	e1a08000 	mov	r8, r0
 4a0:	e1a09001 	mov	r9, r1
 4a4:	e28d200e 	add	r2, sp, #14
 4a8:	e28d100c 	add	r1, sp, #12
 4ac:	e28d000a 	add	r0, sp, #10
 4b0:	ebfffee8 	bl	58 <mag3110_read_data>
 4b4:	e2577001 	subs	r7, r7, #1
 4b8:	1afffff9 	bne	4a4 <sw_probe+0x194>
 4bc:	ebfffffe 	bl	0 <ktime_get>
 4c0:	e1500008 	cmp	r0, r8
 4c4:	e0d13009 	sbcs	r3, r1, r9
 4c8:	aa000001 	bge	4d4 <sw_probe+0x1c4>
 4cc:	e2500001 	subs	r0, r0, #1
 4d0:	e2a11000 	adc	r1, r1, #0
 4d4:	e050a008 	subs	sl, r0, r8
 4d8:	e3a0c000 	mov	ip, #0
 4dc:	e0c1b009 	sbc	fp, r1, r9
 4e0:	e28f90a8 	add	r9, pc, #168	; 0xa8
 4e4:	e1c980d0 	ldrd	r8, [r9]
 4e8:	e1a01fcb 	asr	r1, fp, #31
 4ec:	e021400a 	eor	r4, r1, sl
 4f0:	e021500b 	eor	r5, r1, fp
 4f4:	e0544001 	subs	r4, r4, r1
 4f8:	e0c55001 	sbc	r5, r5, r1
 4fc:	e0810498 	umull	r0, r1, r8, r4
 500:	e3a00000 	mov	r0, #0
 504:	e0a01499 	umlal	r1, r0, r9, r4
 508:	e0ac1598 	umlal	r1, ip, r8, r5
 50c:	e3a01000 	mov	r1, #0
 510:	e09c0000 	adds	r0, ip, r0
 514:	e2a11000 	adc	r1, r1, #0
 518:	e0a10599 	umlal	r0, r1, r9, r5
 51c:	e35a0000 	cmp	sl, #0
 520:	e1a02920 	lsr	r2, r0, #18
 524:	e2dbc000 	sbcs	ip, fp, #0
 528:	e1a03921 	lsr	r3, r1, #18
 52c:	e1822701 	orr	r2, r2, r1, lsl #14
 530:	aa000001 	bge	53c <sw_probe+0x22c>
 534:	e2722000 	rsbs	r2, r2, #0
 538:	e2e33000 	rsc	r3, r3, #0
 53c:	e1a01006 	mov	r1, r6
 540:	e59d0004 	ldr	r0, [sp, #4]
 544:	e2866001 	add	r6, r6, #1
 548:	ebfffffe 	bl	0 <printk>
 54c:	e356001e 	cmp	r6, #30
 550:	1affffcf 	bne	494 <sw_probe+0x184>
 554:	e3a00000 	mov	r0, #0
 558:	e28dd014 	add	sp, sp, #20
 55c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
 560:	e3e00000 	mvn	r0, #0
 564:	eafffffb 	b	558 <sw_probe+0x248>
 568:	e3000000 	movw	r0, #0
 56c:	e3a020c4 	mov	r2, #196	; 0xc4
 570:	e3400000 	movt	r0, #0
 574:	ebfffffe 	bl	0 <printk>
 578:	e3e00015 	mvn	r0, #21
 57c:	eafffff5 	b	558 <sw_probe+0x248>
 580:	e3000000 	movw	r0, #0
 584:	e3400000 	movt	r0, #0
 588:	ebfffffe 	bl	0 <printk>
 58c:	eaffff99 	b	3f8 <sw_probe+0xe8>
 590:	d7b634db 	sbfxle	r3, fp, #9, #23
 594:	431bde82 	tstmi	fp, #2080	; 0x820
 598:	00000004 	andeq	r0, r0, r4

0000059c <dispatch>:
 59c:	e3500000 	cmp	r0, #0
 5a0:	e92d4010 	push	{r4, lr}
 5a4:	1a00000e 	bne	5e4 <dispatch+0x48>
 5a8:	e3000000 	movw	r0, #0
 5ac:	e1a04001 	mov	r4, r1
 5b0:	e3400000 	movt	r0, #0
 5b4:	e1d031b2 	ldrh	r3, [r0, #18]
 5b8:	e3130004 	tst	r3, #4
 5bc:	1a000002 	bne	5cc <dispatch+0x30>
 5c0:	e1a00004 	mov	r0, r4
 5c4:	e8bd4010 	pop	{r4, lr}
 5c8:	eafffffe 	b	310 <sw_probe>
 5cc:	e3001000 	movw	r1, #0
 5d0:	e3401000 	movt	r1, #0
 5d4:	ebfffffe 	bl	0 <__dynamic_pr_debug>
 5d8:	e1a00004 	mov	r0, r4
 5dc:	e8bd4010 	pop	{r4, lr}
 5e0:	eafffffe 	b	310 <sw_probe>
 5e4:	e3000000 	movw	r0, #0
 5e8:	e3400000 	movt	r0, #0
 5ec:	ebfffffe 	bl	0 <printk>
 5f0:	e3a00000 	mov	r0, #0
 5f4:	e8bd8010 	pop	{r4, pc}

Disassembly of section .init.text:

00000000 <init_module>:
   0:	e3001000 	movw	r1, #0
   4:	e3000000 	movw	r0, #0
   8:	e92d4010 	push	{r4, lr}
   c:	e3401000 	movt	r1, #0
  10:	e3400000 	movt	r0, #0
  14:	ebfffffe 	bl	0 <printk>
  18:	e3001000 	movw	r1, #0
  1c:	e59f2030 	ldr	r2, [pc, #48]	; 54 <init_module+0x54>
  20:	e3401000 	movt	r1, #0
  24:	e3a00003 	mov	r0, #3
  28:	ebfffffe 	bl	0 <ldr_sw_driver_register>
  2c:	e3000000 	movw	r0, #0
  30:	e3400000 	movt	r0, #0
  34:	e1d031b2 	ldrh	r3, [r0, #18]
  38:	e3130004 	tst	r3, #4
  3c:	0a000003 	beq	50 <init_module+0x50>
  40:	e3001000 	movw	r1, #0
  44:	e3a0200a 	mov	r2, #10
  48:	e3401000 	movt	r1, #0
  4c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
  50:	e8bd8010 	pop	{r4, pc}
  54:	00000024 	andeq	r0, r0, r4, lsr #32

Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	e12fff1e 	bx	lr

Disassembly of section __ksymtab:

00000000 <__ksymtab_mag3110_enable_show>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000015 	andeq	r0, r0, r5, lsl r0

00000008 <__ksymtab_mag3110_enable_store>:
	...

00000010 <__ksymtab_mag3110_read_data>:
  10:	00000000 	andeq	r0, r0, r0
  14:	00000029 	andeq	r0, r0, r9, lsr #32

Disassembly of section __kcrctab:

00000000 <__kcrctab>:
	...

Disassembly of section .rodata:

00000000 <__func__.29545>:
   0:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
   4:	5f303131 	svcpl	0x00303131
   8:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
   c:	00000000 	andeq	r0, r0, r0

00000010 <__mod_i2c__mag3110_id_device_table>:
  10:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
  14:	00303131 	eorseq	r3, r0, r1, lsr r1
	...

00000040 <__func__.29054>:
  40:	70736964 	rsbsvc	r6, r3, r4, ror #18
  44:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
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
  18:	65657246 	strbvs	r7, [r5, #-582]!	; 0xfffffdba
  1c:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
  20:	616d2065 	cmnvs	sp, r5, rrx
  24:	31313367 	teqcc	r1, r7, ror #6
  28:	2d332030 	ldccs	0, cr2, [r3, #-192]!	; 0xffffff40
  2c:	73697861 	cmnvc	r9, #6356992	; 0x610000
  30:	67616d20 	strbvs	r6, [r1, -r0, lsr #26]!
  34:	6f74656e 	svcvs	0x0074656e
  38:	6574656d 	ldrbvs	r6, [r4, #-1389]!	; 0xfffffa93
  3c:	72642072 	rsbvc	r2, r4, #114	; 0x72
  40:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
	...

00000045 <__UNIQUE_ID_author8>:
  45:	68747561 	ldmdavs	r4!, {r0, r5, r6, r8, sl, ip, sp, lr}^
  49:	463d726f 	ldrtmi	r7, [sp], -pc, ror #4
  4d:	73656572 	cmnvc	r5, #478150656	; 0x1c800000
  51:	656c6163 	strbvs	r6, [ip, #-355]!	; 0xfffffe9d
  55:	6d655320 	stclvs	3, cr5, [r5, #-128]!	; 0xffffff80
  59:	6e6f6369 	cdpvs	3, 6, cr6, cr15, cr9, {3}
  5d:	74637564 	strbtvc	r7, [r3], #-1380	; 0xfffffa9c
  61:	202c726f 	eorcs	r7, ip, pc, ror #4
  65:	2e636e49 	cdpcs	14, 6, cr6, cr3, cr9, {2}
  69:	73000000 	movwvc	r0, #0

0000006c <__UNIQUE_ID_srcversion11>:
  6c:	76637273 			; <UNDEFINED> instruction: 0x76637273
  70:	69737265 	ldmdbvs	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
  74:	313d6e6f 	teqcc	sp, pc, ror #28
  78:	45453937 	strbmi	r3, [r5, #-2359]	; 0xfffff6c9
  7c:	41443843 	cmpmi	r4, r3, asr #16
  80:	38464133 	stmdacc	r6, {r0, r1, r4, r5, r8, lr}^
  84:	43314437 	teqmi	r1, #922746880	; 0x37000000
  88:	30314132 	eorscc	r4, r1, r2, lsr r1
  8c:	61003445 	tstvs	r0, r5, asr #8

0000008f <__UNIQUE_ID_alias10>:
  8f:	61696c61 	cmnvs	r9, r1, ror #24
  93:	32693d73 	rsbcc	r3, r9, #7360	; 0x1cc0
  97:	616d3a63 	cmnvs	sp, r3, ror #20
  9b:	31313367 	teqcc	r1, r7, ror #6
  9f:	00000030 	andeq	r0, r0, r0, lsr r0
	...

000000a4 <__module_depends>:
  a4:	65706564 	ldrbvs	r6, [r0, #-1380]!	; 0xfffffa9c
  a8:	3d73646e 	cfldrdcc	mvd6, [r3, #-440]!	; 0xfffffe48
	...

000000ad <__UNIQUE_ID_name9>:
  ad:	656d616e 	strbvs	r6, [sp, #-366]!	; 0xfffffe92
  b1:	67616d3d 			; <UNDEFINED> instruction: 0x67616d3d
  b5:	30313133 	eorscc	r3, r1, r3, lsr r1
  b9:	5f77735f 	svcpl	0x0077735f
  bd:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  c1:	65760077 	ldrbvs	r0, [r6, #-119]!	; 0xffffff89

000000c3 <__UNIQUE_ID_vermagic8>:
  c3:	6d726576 	cfldr64vs	mvdx6, [r2, #-472]!	; 0xfffffe28
  c7:	63696761 	cmnvs	r9, #25427968	; 0x1840000
  cb:	312e343d 			; <UNDEFINED> instruction: 0x312e343d
  cf:	38392e34 	ldmdacc	r9!, {r2, r4, r5, r9, sl, fp, sp}
  d3:	3734672d 	ldrcc	r6, [r4, -sp, lsr #14]!
  d7:	33393538 	teqcc	r9, #56, 10	; 0xe000000
  db:	20343364 	eorscs	r3, r4, r4, ror #6
  df:	20504d53 	subscs	r4, r0, r3, asr sp
  e3:	65657270 	strbvs	r7, [r5, #-624]!	; 0xfffffd90
  e7:	2074706d 	rsbscs	r7, r4, sp, rrx
  eb:	5f646f6d 	svcpl	0x00646f6d
  ef:	6f6c6e75 	svcvs	0x006c6e75
  f3:	6d206461 	cfstrsvs	mvf6, [r0, #-388]!	; 0xfffffe7c
  f7:	6576646f 	ldrbvs	r6, [r6, #-1135]!	; 0xfffffb91
  fb:	6f697372 	svcvs	0x00697372
  ff:	4120736e 			; <UNDEFINED> instruction: 0x4120736e
 103:	37764d52 			; <UNDEFINED> instruction: 0x37764d52
 107:	76327020 	ldrtvc	r7, [r2], -r0, lsr #32
 10b:	Address 0x000000000000010b is out of bounds.


Disassembly of section .rodata.str1.4:

00000000 <.LC0>:
   0:	000a6425 	andeq	r6, sl, r5, lsr #8

00000004 <.LC1>:
   4:	20633269 	rsbcs	r3, r3, r9, ror #4
   8:	636f6c62 	cmnvs	pc, #25088	; 0x6200
   c:	6572206b 	ldrbvs	r2, [r2, #-107]!	; 0xffffff95
  10:	66206461 	strtvs	r6, [r0], -r1, ror #8
  14:	656c6961 	strbvs	r6, [ip, #-2401]!	; 0xfffff69f
  18:	00000a64 	andeq	r0, r0, r4, ror #20

0000001c <.LC2>:
  1c:	49544341 	ldmdbmi	r4, {r0, r6, r8, r9, lr}^
  20:	00444556 	subeq	r4, r4, r6, asr r5

00000024 <.LC3>:
  24:	4e415453 	mcrmi	4, 2, r5, cr1, cr3, {2}
  28:	00594244 	subseq	r4, r9, r4, asr #4

0000002c <.LC4>:
  2c:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
  30:	7420676e 	strtvc	r6, [r0], #-1902	; 0xfffff892
  34:	6f6c206f 	svcvs	0x006c206f
  38:	6520676e 	strvs	r6, [r0, #-1902]!	; 0xfffff892
  3c:	726f7272 	rsbvc	r7, pc, #536870919	; 0x20000007
  40:	0000000a 	andeq	r0, r0, sl

00000044 <.LC5>:
  44:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
  48:	203a656c 	eorscs	r6, sl, ip, ror #10
  4c:	0a2e6425 	beq	b990e8 <dispatch+0xb98b4c>
  50:	00000000 	andeq	r0, r0, r0

00000054 <.LC6>:
  54:	5f67616d 	svcpl	0x0067616d
  58:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
  5c:	62207375 	eorvs	r7, r0, #-738197503	; 0xd4000001
  60:	726f6665 	rsbvc	r6, pc, #105906176	; 0x6500000
  64:	6e652065 	cdpvs	0, 6, cr2, cr5, cr5, {3}
  68:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
  6c:	7325203a 			; <UNDEFINED> instruction: 0x7325203a
  70:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000074 <.LC7>:
  74:	20633269 	rsbcs	r3, r3, r9, ror #4
  78:	74697277 	strbtvc	r7, [r9], #-631	; 0xfffffd89
  7c:	61662065 	cmnvs	r6, r5, rrx
  80:	64656c69 	strbtvs	r6, [r5], #-3177	; 0xfffff397
  84:	0000000a 	andeq	r0, r0, sl

00000088 <.LC8>:
  88:	5f67616d 	svcpl	0x0067616d
  8c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
  90:	203a7375 	eorscs	r7, sl, r5, ror r3
  94:	0a2e7325 	beq	b9cd30 <dispatch+0xb9c794>
  98:	00000000 	andeq	r0, r0, r0

0000009c <.LC9>:
  9c:	67616d26 	strbvs	r6, [r1, -r6, lsr #26]!
  a0:	30313133 	eorscc	r3, r1, r3, lsr r1
  a4:	636f6c5f 	cmnvs	pc, #24320	; 0x5f00
  a8:	0000006b 	andeq	r0, r0, fp, rrx

000000ac <.LC10>:
  ac:	52453301 	subpl	r3, r5, #67108864	; 0x4000000
  b0:	3a524f52 	bcc	1493e00 <dispatch+0x1493864>
  b4:	67616d20 	strbvs	r6, [r1, -r0, lsr #26]!
  b8:	30313133 	eorscc	r3, r1, r3, lsr r1
  bc:	63326920 	teqvs	r2, #32, 18	; 0x80000
  c0:	6f727020 	svcvs	0x00727020
  c4:	66206562 	strtvs	r6, [r0], -r2, ror #10
  c8:	736c6961 	cmnvc	ip, #1589248	; 0x184000
  cc:	7265202e 	rsbvc	r2, r5, #46	; 0x2e
  d0:	6f632072 	svcvs	0x00632072
  d4:	203a6564 	eorscs	r6, sl, r4, ror #10
  d8:	30257830 	eorcc	r7, r5, r0, lsr r8
  dc:	0a2e7838 	beq	b9e1c4 <dispatch+0xb9dc28>
  e0:	00000000 	andeq	r0, r0, r0

000000e4 <.LC11>:
  e4:	65723301 	ldrbvs	r3, [r2, #-769]!	; 0xfffffcff
  e8:	63206461 			; <UNDEFINED> instruction: 0x63206461
  ec:	20706968 	rsbscs	r6, r0, r8, ror #18
  f0:	30204449 	eorcc	r4, r0, r9, asr #8
  f4:	20782578 	rsbscs	r2, r8, r8, ror r5
  f8:	6e207369 	cdpvs	3, 2, cr7, cr0, cr9, {3}
  fc:	6520746f 	strvs	r7, [r0, #-1135]!	; 0xfffffb91
 100:	6c617571 	cfstr64vs	mvdx7, [r1], #-452	; 0xfffffe3c
 104:	206f7420 	rsbcs	r7, pc, r0, lsr #8
 108:	78257830 	stmdavc	r5!, {r4, r5, fp, ip, sp, lr}
 10c:	00000a21 	andeq	r0, r0, r1, lsr #20

00000110 <.LC12>:
 110:	74736574 	ldrbtvc	r6, [r3], #-1396	; 0xfffffa8c
 114:	67616d20 	strbvs	r6, [r1, -r0, lsr #26]!
 118:	30313133 	eorscc	r3, r1, r3, lsr r1
 11c:	20777320 	rsbscs	r7, r7, r0, lsr #6
 120:	2e4f2f49 	cdpcs	15, 4, cr2, cr15, cr9, {2}
 124:	0000000a 	andeq	r0, r0, sl

00000128 <.LC13>:
 128:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
 12c:	20303131 	eorscs	r3, r0, r1, lsr r1
 130:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 134:	7320656c 			; <UNDEFINED> instruction: 0x7320656c
 138:	65746174 	ldrbvs	r6, [r4, #-372]!	; 0xfffffe8c
 13c:	7325203a 			; <UNDEFINED> instruction: 0x7325203a
 140:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000144 <.LC14>:
 144:	6e756f72 	mrcvs	15, 3, r6, cr5, cr2, {3}
 148:	64252064 	strtvs	r2, [r5], #-100	; 0xffffff9c
 14c:	6c25203a 	stcvs	0, cr2, [r5], #-232	; 0xffffff18
 150:	00000a64 	andeq	r0, r0, r4, ror #20

00000154 <.LC15>:
 154:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 158:	25206564 	strcs	r6, [r0, #-1380]!	; 0xfffffa9c
 15c:	000a2e73 	andeq	r2, sl, r3, ror lr

00000160 <.LC16>:
 160:	00006425 	andeq	r6, r0, r5, lsr #8
 164:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
 168:	5f303131 	svcpl	0x00303131
 16c:	695f7773 	ldmdbvs	pc, {r0, r1, r4, r5, r6, r8, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 170:	77735f6f 	ldrbvc	r5, [r3, -pc, ror #30]!
 174:	00000000 	andeq	r0, r0, r0
 178:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; c4 <.LC10+0x18>
 17c:	6f6e2f65 	svcvs	0x006e2f65
 180:	5f6e616c 	svcpl	0x006e616c
 184:	2f6e6179 	svccs	0x006e6179
 188:	6b736544 	blvs	1cd96a0 <dispatch+0x1cd9104>
 18c:	2f706f74 	svccs	0x00706f74
 190:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 194:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 198:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 19c:	616d2f73 	smcvs	54003	; 0xd2f3
 1a0:	31313367 	teqcc	r1, r7, ror #6
 1a4:	65745f30 	ldrbvs	r5, [r4, #-3888]!	; 0xfffff0d0
 1a8:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 1ac:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 1b0:	5f77735f 	svcpl	0x0077735f
 1b4:	532f6f69 			; <UNDEFINED> instruction: 0x532f6f69
 1b8:	786d2f57 	stmdavc	sp!, {r0, r1, r2, r4, r6, r8, r9, sl, fp, sp}^
 1bc:	616d5f63 	cmnvs	sp, r3, ror #30
 1c0:	31313367 	teqcc	r1, r7, ror #6
 1c4:	00632e30 	rsbeq	r2, r3, r0, lsr lr

000001c8 <.LC0>:
 1c8:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 1cc:	73206564 			; <UNDEFINED> instruction: 0x73206564
 1d0:	72705f77 	rsbsvc	r5, r0, #476	; 0x1dc
 1d4:	2865626f 	stmdacs	r5!, {r0, r1, r2, r3, r5, r6, r9, sp, lr}^
 1d8:	000a2e29 	andeq	r2, sl, r9, lsr #28

000001dc <.LC1>:
 1dc:	52453301 	subpl	r3, r5, #67108864	; 0x4000000
 1e0:	3a524f52 	bcc	1493f30 <dispatch+0x1493994>
 1e4:	6b6e5520 	blvs	1b9566c <dispatch+0x1b950d0>
 1e8:	6e776f6e 	cdpvs	15, 7, cr6, cr7, cr14, {3}
 1ec:	6e756620 	cdpvs	6, 7, cr6, cr5, cr0, {1}
 1f0:	6f697463 	svcvs	0x00697463
 1f4:	000a2e6e 	andeq	r2, sl, lr, ror #28
 1f8:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
 1fc:	5f303131 	svcpl	0x00303131
 200:	695f7773 	ldmdbvs	pc, {r0, r1, r4, r5, r6, r8, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 204:	77735f6f 	ldrbvc	r5, [r3, -pc, ror #30]!
 208:	00000000 	andeq	r0, r0, r0
 20c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 158 <.LC15+0x4>
 210:	6f6e2f65 	svcvs	0x006e2f65
 214:	5f6e616c 	svcpl	0x006e616c
 218:	2f6e6179 	svccs	0x006e6179
 21c:	6b736544 	blvs	1cd9734 <dispatch+0x1cd9198>
 220:	2f706f74 	svccs	0x00706f74
 224:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 228:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 22c:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 230:	616d2f73 	smcvs	54003	; 0xd2f3
 234:	31313367 	teqcc	r1, r7, ror #6
 238:	65745f30 	ldrbvs	r5, [r4, #-3888]!	; 0xfffff0d0
 23c:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 240:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 244:	5f77735f 	svcpl	0x0077735f
 248:	532f6f69 			; <UNDEFINED> instruction: 0x532f6f69
 24c:	69642f57 	stmdbvs	r4!, {r0, r1, r2, r4, r6, r8, r9, sl, fp, sp}^
 250:	74617073 	strbtvc	r7, [r1], #-115	; 0xffffff8d
 254:	72656863 	rsbvc	r6, r5, #6488064	; 0x630000
 258:	Address 0x0000000000000258 is out of bounds.


Disassembly of section __ksymtab_strings:

00000000 <__kstrtab_mag3110_enable_store>:
   0:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
   4:	5f303131 	svcpl	0x00303131
   8:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
   c:	735f656c 	cmpvc	pc, #108, 10	; 0x1b000000
  10:	65726f74 	ldrbvs	r6, [r2, #-3956]!	; 0xfffff08c
	...

00000015 <__kstrtab_mag3110_enable_show>:
  15:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
  19:	5f303131 	svcpl	0x00303131
  1d:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
  21:	735f656c 	cmpvc	pc, #108, 10	; 0x1b000000
  25:	00776f68 	rsbseq	r6, r7, r8, ror #30

00000029 <__kstrtab_mag3110_read_data>:
  29:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
  2d:	5f303131 	svcpl	0x00303131
  31:	64616572 	strbtvs	r6, [r1], #-1394	; 0xfffffa8e
  35:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  39:	Address 0x0000000000000039 is out of bounds.


Disassembly of section .data:

00000000 <mag3110_lock>:
	...
   c:	0000000c 	andeq	r0, r0, ip
  10:	0000000c 	andeq	r0, r0, ip

Disassembly of section __verbose:

00000000 <descriptor.29546>:
   0:	00000164 	andeq	r0, r0, r4, ror #2
   4:	00000000 	andeq	r0, r0, r0
   8:	00000178 	andeq	r0, r0, r8, ror r1
   c:	00000160 	andeq	r0, r0, r0, ror #2
  10:	00000255 	andeq	r0, r0, r5, asr r2
  14:	00000000 	andeq	r0, r0, r0

00000018 <descriptor.29053>:
  18:	000001f8 	strdeq	r0, [r0], -r8
  1c:	00000040 	andeq	r0, r0, r0, asr #32
  20:	0000020c 	andeq	r0, r0, ip, lsl #4
  24:	000001c8 	andeq	r0, r0, r8, asr #3
  28:	00000018 	andeq	r0, r0, r8, lsl r0
  2c:	00000000 	andeq	r0, r0, r0

Disassembly of section .gnu.linkonce.this_module:

00000000 <__this_module>:
	...
   c:	3367616d 	cmncc	r7, #1073741851	; 0x4000001b
  10:	5f303131 	svcpl	0x00303131
  14:	695f7773 	ldmdbvs	pc, {r0, r1, r4, r5, r6, r8, r9, sl, ip, sp, lr}^	; <UNPREDICTABLE>
  18:	77735f6f 	ldrbvc	r5, [r3, -pc, ror #30]!
	...

Disassembly of section .ARM.exidx:

00000000 <.ARM.exidx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80aab0b0 	strhthi	fp, [sl], r0
   8:	00000058 	andeq	r0, r0, r8, asr r0
   c:	8001acb0 			; <UNDEFINED> instruction: 0x8001acb0
  10:	00000148 	andeq	r0, r0, r8, asr #2
  14:	8004abb0 			; <UNDEFINED> instruction: 0x8004abb0
  18:	00000310 	andeq	r0, r0, r0, lsl r3
  1c:	8004afb0 			; <UNDEFINED> instruction: 0x8004afb0
  20:	0000059c 	muleq	r0, ip, r5
  24:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section __versions:

00000000 <____versions>:
   0:	833850da 	teqhi	r8, #218	; 0xda
   4:	75646f6d 	strbvc	r6, [r4, #-3949]!	; 0xfffff093
   8:	6c5f656c 	cfldr64vs	mvdx6, [pc], {108}	; 0x6c
   c:	756f7961 	strbvc	r7, [pc, #-2401]!	; fffff6b3 <__crc_mag3110_enable_show+0x263cd56a>
  10:	00000074 	andeq	r0, r0, r4, ror r0
	...
  40:	f9a482f9 			; <UNDEFINED> instruction: 0xf9a482f9
  44:	656c736d 	strbvs	r7, [ip, #-877]!	; 0xfffffc93
  48:	00007065 	andeq	r7, r0, r5, rrx
	...
  80:	92833d44 	addls	r3, r3, #68, 26	; 0x1100
  84:	5f633269 	svcpl	0x00633269
  88:	75626d73 	strbvc	r6, [r2, #-3443]!	; 0xfffff28d
  8c:	65725f73 	ldrbvs	r5, [r2, #-3955]!	; 0xfffff08d
  90:	625f6461 	subsvs	r6, pc, #1627389952	; 0x61000000
  94:	5f657479 	svcpl	0x00657479
  98:	61746164 	cmnvs	r4, r4, ror #2
	...
  c0:	8a84fcd7 	bhi	fe13f424 <__crc_mag3110_enable_show+0x2450d2db>
  c4:	5f633269 	svcpl	0x00633269
  c8:	75626d73 	strbvc	r6, [r2, #-3443]!	; 0xfffff28d
  cc:	65725f73 	ldrbvs	r5, [r2, #-3955]!	; 0xfffff08d
  d0:	695f6461 	ldmdbvs	pc, {r0, r5, r6, sl, sp, lr}^	; <UNPREDICTABLE>
  d4:	625f6332 	subsvs	r6, pc, #-939524096	; 0xc8000000
  d8:	6b636f6c 	blvs	18dbe90 <dispatch+0x18db8f4>
  dc:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
  e0:	00000061 	andeq	r0, r0, r1, rrx
	...
 100:	51da14c3 	bicspl	r1, sl, r3, asr #9
 104:	5f633269 	svcpl	0x00633269
 108:	75626d73 	strbvc	r6, [r2, #-3443]!	; 0xfffff28d
 10c:	72775f73 	rsbsvc	r5, r7, #460	; 0x1cc
 110:	5f657469 	svcpl	0x00657469
 114:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
 118:	7461645f 	strbtvc	r6, [r1], #-1119	; 0xfffffba1
 11c:	00000061 	andeq	r0, r0, r1, rrx
	...
 140:	7adeb8d4 	bvc	ff7ae498 <__crc_mag3110_enable_show+0x25b7c34f>
 144:	6d69746b 	cfstrdvs	mvd7, [r9, #-428]!	; 0xfffffe54
 148:	65675f65 	strbvs	r5, [r7, #-3941]!	; 0xfffff09b
 14c:	00000074 	andeq	r0, r0, r4, ror r0
	...
 180:	44b1d426 	ldrtmi	sp, [r1], #1062	; 0x426
 184:	79645f5f 	stmdbvc	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 188:	696d616e 	stmdbvs	sp!, {r1, r2, r3, r5, r6, r8, sp, lr}^
 18c:	72705f63 	rsbsvc	r5, r0, #396	; 0x18c
 190:	6265645f 	rsbvs	r6, r5, #1593835520	; 0x5f000000
 194:	00006775 	andeq	r6, r0, r5, ror r7
	...
 1c0:	e4ca3b4f 	strb	r3, [sl], #2895	; 0xb4f
 1c4:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0xfffffa93
 1c8:	6e755f78 	mrcvs	15, 3, r5, cr5, cr8, {3}
 1cc:	6b636f6c 	blvs	18dbf84 <dispatch+0x18db9e8>
	...
 200:	91715312 	cmnls	r1, r2, lsl r3
 204:	69727073 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, ip, sp, lr}^
 208:	0066746e 	rsbeq	r7, r6, lr, ror #8
	...
 240:	0fa2a45e 	svceq	0x00a2a45e
 244:	656d5f5f 	strbvs	r5, [sp, #-3935]!	; 0xfffff0a1
 248:	72657a6d 	rsbvc	r7, r5, #446464	; 0x6d000
 24c:	0000006f 	andeq	r0, r0, pc, rrx
	...
 280:	3a4760a1 	bcc	11d850c <dispatch+0x11d7f70>
 284:	5f766564 	svcpl	0x00766564
 288:	00727265 	rsbseq	r7, r2, r5, ror #4
	...
 2c0:	2aee63f4 	bcs	ffb99298 <__crc_mag3110_enable_show+0x25f6714f>
 2c4:	756d5f5f 	strbvc	r5, [sp, #-3935]!	; 0xfffff0a1
 2c8:	5f786574 	svcpl	0x00786574
 2cc:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
	...
 300:	27e1a049 	strbcs	sl, [r1, r9, asr #32]!
 304:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 308:	00006b74 	andeq	r6, r0, r4, ror fp
	...
 340:	11a13e31 			; <UNDEFINED> instruction: 0x11a13e31
 344:	74736b5f 	ldrbtvc	r6, [r3], #-2911	; 0xfffff4a1
 348:	6c6f7472 	cfstrdvs	mvd7, [pc], #-456	; 188 <____versions+0x188>
	...
 380:	fd16e532 	ldc2	5, cr14, [r6, #-200]	; 0xffffff38
 384:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0xfffffa93
 388:	6f6c5f78 	svcvs	0x006c5f78
 38c:	00006b63 	andeq	r6, r0, r3, ror #22
	...
 3c0:	efd6cf06 	svc	0x00d6cf06
 3c4:	65615f5f 	strbvs	r5, [r1, #-3935]!	; 0xfffff0a1
 3c8:	5f696261 	svcpl	0x00696261
 3cc:	69776e75 	ldmdbvs	r7!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 3d0:	635f646e 	cmpvs	pc, #1845493760	; 0x6e000000
 3d4:	705f7070 	subsvc	r7, pc, r0, ror r0	; <UNPREDICTABLE>
 3d8:	00003072 	andeq	r3, r0, r2, ror r0
	...

Disassembly of section .bss:

00000000 <mag3110_pdata>:
   0:	00000000 	andeq	r0, r0, r0

00000004 <buf>:
	...

00000024 <dum>:
	...

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
  28:	1a011901 	bne	46434 <dispatch+0x45e98>
  2c:	22021e02 	andcs	r1, r2, #2, 28
  30:	Address 0x0000000000000030 is out of bounds.


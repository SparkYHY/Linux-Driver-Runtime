
ipu_common.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <ipu_get_soc>:
       0:	e3500001 	cmp	r0, #1
       4:	da000001 	ble	10 <ipu_get_soc+0x10>
       8:	e3e00012 	mvn	r0, #18
       c:	e12fff1e 	bx	lr
      10:	e3003000 	movw	r3, #0
      14:	e3012ee4 	movw	r2, #7908	; 0x1ee4
      18:	e3403000 	movt	r3, #0
      1c:	e0203092 	mla	r0, r2, r0, r3
      20:	e5d03008 	ldrb	r3, [r0, #8]
      24:	e3530000 	cmp	r3, #0
      28:	03e00012 	mvneq	r0, #18
      2c:	e12fff1e 	bx	lr

00000030 <ipu_get_channel_offset>:
      30:	e3051659 	movw	r1, #22105	; 0x5659
      34:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
      38:	e3431631 	movt	r1, #13873	; 0x3631
      3c:	e59dc020 	ldr	ip, [sp, #32]
      40:	e1500001 	cmp	r0, r1
      44:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
      48:	e59d1018 	ldr	r1, [sp, #24]
      4c:	e59d4028 	ldr	r4, [sp, #40]	; 0x28
      50:	e59de02c 	ldr	lr, [sp, #44]	; 0x2c
      54:	0a0000d8 	beq	3bc <ipu_get_channel_offset+0x38c>
      58:	8a000031 	bhi	124 <ipu_get_channel_offset+0xf4>
      5c:	e3055659 	movw	r5, #22105	; 0x5659
      60:	e3435231 	movt	r5, #12849	; 0x3231
      64:	e1500005 	cmp	r0, r5
      68:	0a0000ba 	beq	358 <ipu_get_channel_offset+0x328>
      6c:	8a00007f 	bhi	270 <ipu_get_channel_offset+0x240>
      70:	e3035535 	movw	r5, #13621	; 0x3535
      74:	e3435135 	movt	r5, #12597	; 0x3135
      78:	e1500005 	cmp	r0, r5
      7c:	0a0000b0 	beq	344 <ipu_get_channel_offset+0x314>
      80:	e3055049 	movw	r5, #20553	; 0x5049
      84:	9a000061 	bls	210 <ipu_get_channel_offset+0x1e0>
      88:	e3435155 	movt	r5, #12629	; 0x3155
      8c:	e1500005 	cmp	r0, r5
      90:	0a0000ab 	beq	344 <ipu_get_channel_offset+0x314>
      94:	9a000102 	bls	4a4 <ipu_get_channel_offset+0x474>
      98:	e3055559 	movw	r5, #21849	; 0x5559
      9c:	e3435231 	movt	r5, #12849	; 0x3231
      a0:	e1500005 	cmp	r0, r5
      a4:	1a0000f9 	bne	490 <ipu_get_channel_offset+0x460>
      a8:	e1a050a3 	lsr	r5, r3, #1
      ac:	e06660a6 	rsb	r6, r6, r6, lsr #1
      b0:	e0070c95 	mul	r7, r5, ip
      b4:	e0838006 	add	r8, r3, r6
      b8:	e1e0000c 	mvn	r0, ip
      bc:	e3510000 	cmp	r1, #0
      c0:	e0800002 	add	r0, r0, r2
      c4:	e0020295 	mul	r2, r5, r2
      c8:	e1a070a7 	lsr	r7, r7, #1
      cc:	e0885007 	add	r5, r8, r7
      d0:	e0205093 	mla	r0, r3, r0, r5
      d4:	e08020a2 	add	r2, r0, r2, lsr #1
      d8:	e5840000 	str	r0, [r4]
      dc:	e58e2000 	str	r2, [lr]
      e0:	0a000057 	beq	244 <ipu_get_channel_offset+0x214>
      e4:	e003039c 	mul	r3, ip, r3
      e8:	e59d001c 	ldr	r0, [sp, #28]
      ec:	e0811006 	add	r1, r1, r6
      f0:	e5945000 	ldr	r5, [r4]
      f4:	e3500000 	cmp	r0, #0
      f8:	e0411003 	sub	r1, r1, r3
      fc:	e0811007 	add	r1, r1, r7
     100:	1a000055 	bne	25c <ipu_get_channel_offset+0x22c>
     104:	e1510005 	cmp	r1, r5
     108:	9a000003 	bls	11c <ipu_get_channel_offset+0xec>
     10c:	e5841000 	str	r1, [r4]
     110:	e59e3000 	ldr	r3, [lr]
     114:	e1530002 	cmp	r3, r2
     118:	358e2000 	strcc	r2, [lr]
     11c:	e3a00000 	mov	r0, #0
     120:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
     124:	e3055034 	movw	r5, #20532	; 0x5034
     128:	e3455238 	movt	r5, #21048	; 0x5238
     12c:	e1500005 	cmp	r0, r5
     130:	0a000083 	beq	344 <ipu_get_channel_offset+0x314>
     134:	8a000070 	bhi	2fc <ipu_get_channel_offset+0x2cc>
     138:	e3035434 	movw	r5, #13364	; 0x3434
     13c:	e3455034 	movt	r5, #20532	; 0x5034
     140:	e1500005 	cmp	r0, r5
     144:	0a000024 	beq	1dc <ipu_get_channel_offset+0x1ac>
     148:	8a0000da 	bhi	4b8 <ipu_get_channel_offset+0x488>
     14c:	e3045742 	movw	r5, #18242	; 0x4742
     150:	e3445152 	movt	r5, #16722	; 0x4152
     154:	e1500005 	cmp	r0, r5
     158:	0a000079 	beq	344 <ipu_get_channel_offset+0x314>
     15c:	e3035234 	movw	r5, #12852	; 0x3234
     160:	e3455032 	movt	r5, #20530	; 0x5032
     164:	e1500005 	cmp	r0, r5
     168:	1a0000ed 	bne	524 <ipu_get_channel_offset+0x4f4>
     16c:	e1a050a3 	lsr	r5, r3, #1
     170:	e06660a6 	rsb	r6, r6, r6, lsr #1
     174:	e0070c95 	mul	r7, r5, ip
     178:	e0838006 	add	r8, r3, r6
     17c:	e1e0000c 	mvn	r0, ip
     180:	e3510000 	cmp	r1, #0
     184:	e0800002 	add	r0, r0, r2
     188:	e0888007 	add	r8, r8, r7
     18c:	e0208093 	mla	r0, r3, r0, r8
     190:	e0220295 	mla	r2, r5, r2, r0
     194:	e5840000 	str	r0, [r4]
     198:	e58e2000 	str	r2, [lr]
     19c:	0a0000a2 	beq	42c <ipu_get_channel_offset+0x3fc>
     1a0:	e59d001c 	ldr	r0, [sp, #28]
     1a4:	e003039c 	mul	r3, ip, r3
     1a8:	e0811006 	add	r1, r1, r6
     1ac:	e5945000 	ldr	r5, [r4]
     1b0:	e0811007 	add	r1, r1, r7
     1b4:	e3500000 	cmp	r0, #0
     1b8:	e0411003 	sub	r1, r1, r3
     1bc:	0affffd0 	beq	104 <ipu_get_channel_offset+0xd4>
     1c0:	e59d201c 	ldr	r2, [sp, #28]
     1c4:	e0826006 	add	r6, r2, r6
     1c8:	e0866007 	add	r6, r6, r7
     1cc:	e0462003 	sub	r2, r6, r3
     1d0:	e1510005 	cmp	r1, r5
     1d4:	8affffcc 	bhi	10c <ipu_get_channel_offset+0xdc>
     1d8:	eaffffcc 	b	110 <ipu_get_channel_offset+0xe0>
     1dc:	e2422001 	sub	r2, r2, #1
     1e0:	e3510000 	cmp	r1, #0
     1e4:	e0233293 	mla	r3, r3, r2, r3
     1e8:	e1a02083 	lsl	r2, r3, #1
     1ec:	e5843000 	str	r3, [r4]
     1f0:	e59d301c 	ldr	r3, [sp, #28]
     1f4:	e58e2000 	str	r2, [lr]
     1f8:	0a000087 	beq	41c <ipu_get_channel_offset+0x3ec>
     1fc:	e3530000 	cmp	r3, #0
     200:	e5945000 	ldr	r5, [r4]
     204:	0affffbe 	beq	104 <ipu_get_channel_offset+0xd4>
     208:	e59d201c 	ldr	r2, [sp, #28]
     20c:	eaffffef 	b	1d0 <ipu_get_channel_offset+0x1a0>
     210:	e3435055 	movt	r5, #12373	; 0x3055
     214:	e1500005 	cmp	r0, r5
     218:	0a000049 	beq	344 <ipu_get_channel_offset+0x314>
     21c:	e305564e 	movw	r5, #22094	; 0x564e
     220:	e3435132 	movt	r5, #12594	; 0x3132
     224:	e1500005 	cmp	r0, r5
     228:	0a000022 	beq	2b8 <ipu_get_channel_offset+0x288>
     22c:	e3035449 	movw	r5, #13385	; 0x3449
     230:	e3435032 	movt	r5, #12338	; 0x3032
     234:	e1500005 	cmp	r0, r5
     238:	0affff9a 	beq	a8 <ipu_get_channel_offset+0x78>
     23c:	e3e00015 	mvn	r0, #21
     240:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
     244:	e59d201c 	ldr	r2, [sp, #28]
     248:	e5941000 	ldr	r1, [r4]
     24c:	e3520000 	cmp	r2, #0
     250:	0affffb1 	beq	11c <ipu_get_channel_offset+0xec>
     254:	e003039c 	mul	r3, ip, r3
     258:	e1a05001 	mov	r5, r1
     25c:	e59d201c 	ldr	r2, [sp, #28]
     260:	e0826006 	add	r6, r2, r6
     264:	e0462003 	sub	r2, r6, r3
     268:	e0822007 	add	r2, r2, r7
     26c:	eaffffd7 	b	1d0 <ipu_get_channel_offset+0x1a0>
     270:	e3035434 	movw	r5, #13364	; 0x3434
     274:	e3435434 	movt	r5, #13364	; 0x3434
     278:	e1500005 	cmp	r0, r5
     27c:	0a000030 	beq	344 <ipu_get_channel_offset+0x314>
     280:	9a00009a 	bls	4f0 <ipu_get_channel_offset+0x4c0>
     284:	e3045752 	movw	r5, #18258	; 0x4752
     288:	e3435442 	movt	r5, #13378	; 0x3442
     28c:	e1500005 	cmp	r0, r5
     290:	0a00002b 	beq	344 <ipu_get_channel_offset+0x314>
     294:	9a000078 	bls	47c <ipu_get_channel_offset+0x44c>
     298:	e3045742 	movw	r5, #18242	; 0x4742
     29c:	e3435452 	movt	r5, #13394	; 0x3452
     2a0:	e1500005 	cmp	r0, r5
     2a4:	0a000026 	beq	344 <ipu_get_channel_offset+0x314>
     2a8:	e305564e 	movw	r5, #22094	; 0x564e
     2ac:	e3435631 	movt	r5, #13873	; 0x3631
     2b0:	e1500005 	cmp	r0, r5
     2b4:	1affffe0 	bne	23c <ipu_get_channel_offset+0x20c>
     2b8:	e005039c 	mul	r5, ip, r3
     2bc:	e1e0c00c 	mvn	ip, ip
     2c0:	e08cc002 	add	ip, ip, r2
     2c4:	e3510000 	cmp	r1, #0
     2c8:	e3a02000 	mov	r2, #0
     2cc:	e1a000a5 	lsr	r0, r5, #1
     2d0:	e0836000 	add	r6, r3, r0
     2d4:	e0236c93 	mla	r3, r3, ip, r6
     2d8:	e5843000 	str	r3, [r4]
     2dc:	e58e2000 	str	r2, [lr]
     2e0:	0affff8d 	beq	11c <ipu_get_channel_offset+0xec>
     2e4:	e5943000 	ldr	r3, [r4]
     2e8:	e0400005 	sub	r0, r0, r5
     2ec:	e0811000 	add	r1, r1, r0
     2f0:	e1510003 	cmp	r1, r3
     2f4:	8affff84 	bhi	10c <ipu_get_channel_offset+0xdc>
     2f8:	eaffff87 	b	11c <ipu_get_channel_offset+0xec>
     2fc:	e3043934 	movw	r3, #18740	; 0x4934
     300:	e3453338 	movt	r3, #21304	; 0x5338
     304:	e1500003 	cmp	r0, r3
     308:	0a00000d 	beq	344 <ipu_get_channel_offset+0x314>
     30c:	9a00004d 	bls	448 <ipu_get_channel_offset+0x418>
     310:	e3053941 	movw	r3, #22849	; 0x5941
     314:	e3453655 	movt	r3, #22101	; 0x5655
     318:	e1500003 	cmp	r0, r3
     31c:	0a000008 	beq	344 <ipu_get_channel_offset+0x314>
     320:	9a000084 	bls	538 <ipu_get_channel_offset+0x508>
     324:	e3053559 	movw	r3, #21849	; 0x5559
     328:	e3453659 	movt	r3, #22105	; 0x5659
     32c:	e1500003 	cmp	r0, r3
     330:	0a000003 	beq	344 <ipu_get_channel_offset+0x314>
     334:	e3053955 	movw	r3, #22869	; 0x5955
     338:	e3453956 	movt	r3, #22870	; 0x5956
     33c:	e1500003 	cmp	r0, r3
     340:	1affffbd 	bne	23c <ipu_get_channel_offset+0x20c>
     344:	e3a03000 	mov	r3, #0
     348:	e5843000 	str	r3, [r4]
     34c:	e1a00003 	mov	r0, r3
     350:	e58e3000 	str	r3, [lr]
     354:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
     358:	e1a050a3 	lsr	r5, r3, #1
     35c:	e06660a6 	rsb	r6, r6, r6, lsr #1
     360:	e0070c95 	mul	r7, r5, ip
     364:	e0838006 	add	r8, r3, r6
     368:	e1e0000c 	mvn	r0, ip
     36c:	e3510000 	cmp	r1, #0
     370:	e0800002 	add	r0, r0, r2
     374:	e0020295 	mul	r2, r5, r2
     378:	10811006 	addne	r1, r1, r6
     37c:	e1a070a7 	lsr	r7, r7, #1
     380:	e0885007 	add	r5, r8, r7
     384:	e0205093 	mla	r0, r3, r0, r5
     388:	1061139c 	mlsne	r1, ip, r3, r1
     38c:	e58e0000 	str	r0, [lr]
     390:	e08050a2 	add	r5, r0, r2, lsr #1
     394:	e59d201c 	ldr	r2, [sp, #28]
     398:	10811007 	addne	r1, r1, r7
     39c:	01a01005 	moveq	r1, r5
     3a0:	e3520000 	cmp	r2, #0
     3a4:	e5845000 	str	r5, [r4]
     3a8:	0a000019 	beq	414 <ipu_get_channel_offset+0x3e4>
     3ac:	e0822006 	add	r2, r2, r6
     3b0:	e063239c 	mls	r3, ip, r3, r2
     3b4:	e0832007 	add	r2, r3, r7
     3b8:	eaffff84 	b	1d0 <ipu_get_channel_offset+0x1a0>
     3bc:	e1a050a3 	lsr	r5, r3, #1
     3c0:	e06660a6 	rsb	r6, r6, r6, lsr #1
     3c4:	e0070c95 	mul	r7, r5, ip
     3c8:	e0838006 	add	r8, r3, r6
     3cc:	e1e0000c 	mvn	r0, ip
     3d0:	e3510000 	cmp	r1, #0
     3d4:	e0800002 	add	r0, r0, r2
     3d8:	10811006 	addne	r1, r1, r6
     3dc:	e0888007 	add	r8, r8, r7
     3e0:	10811007 	addne	r1, r1, r7
     3e4:	e0208093 	mla	r0, r3, r0, r8
     3e8:	1061139c 	mlsne	r1, ip, r3, r1
     3ec:	e58e0000 	str	r0, [lr]
     3f0:	e0250295 	mla	r5, r5, r2, r0
     3f4:	e59d201c 	ldr	r2, [sp, #28]
     3f8:	01a01005 	moveq	r1, r5
     3fc:	e3520000 	cmp	r2, #0
     400:	e5845000 	str	r5, [r4]
     404:	10826006 	addne	r6, r2, r6
     408:	10862007 	addne	r2, r6, r7
     40c:	1062239c 	mlsne	r2, ip, r3, r2
     410:	1affff6e 	bne	1d0 <ipu_get_channel_offset+0x1a0>
     414:	e59e2000 	ldr	r2, [lr]
     418:	eaffff39 	b	104 <ipu_get_channel_offset+0xd4>
     41c:	e3530000 	cmp	r3, #0
     420:	0affff3d 	beq	11c <ipu_get_channel_offset+0xec>
     424:	e59d201c 	ldr	r2, [sp, #28]
     428:	eaffff38 	b	110 <ipu_get_channel_offset+0xe0>
     42c:	e59d201c 	ldr	r2, [sp, #28]
     430:	e5941000 	ldr	r1, [r4]
     434:	e3520000 	cmp	r2, #0
     438:	0affff37 	beq	11c <ipu_get_channel_offset+0xec>
     43c:	e003039c 	mul	r3, ip, r3
     440:	e1a05001 	mov	r5, r1
     444:	eaffff5d 	b	1c0 <ipu_get_channel_offset+0x190>
     448:	e3043935 	movw	r3, #18741	; 0x4935
     44c:	e3453334 	movt	r3, #21300	; 0x5334
     450:	e1500003 	cmp	r0, r3
     454:	0affffba 	beq	344 <ipu_get_channel_offset+0x314>
     458:	e3053035 	movw	r3, #20533	; 0x5035
     45c:	e3453334 	movt	r3, #21300	; 0x5334
     460:	e1500003 	cmp	r0, r3
     464:	0affffb6 	beq	344 <ipu_get_channel_offset+0x314>
     468:	e3043241 	movw	r3, #16961	; 0x4241
     46c:	e3453247 	movt	r3, #21063	; 0x5247
     470:	e1500003 	cmp	r0, r3
     474:	1affff70 	bne	23c <ipu_get_channel_offset+0x20c>
     478:	eaffffb1 	b	344 <ipu_get_channel_offset+0x314>
     47c:	e3033459 	movw	r3, #13401	; 0x3459
     480:	e3433434 	movt	r3, #13364	; 0x3434
     484:	e1500003 	cmp	r0, r3
     488:	1affff6b 	bne	23c <ipu_get_channel_offset+0x20c>
     48c:	eaffffac 	b	344 <ipu_get_channel_offset+0x314>
     490:	e305564e 	movw	r5, #22094	; 0x564e
     494:	e3435231 	movt	r5, #12849	; 0x3231
     498:	e1500005 	cmp	r0, r5
     49c:	0affff85 	beq	2b8 <ipu_get_channel_offset+0x288>
     4a0:	eaffff65 	b	23c <ipu_get_channel_offset+0x20c>
     4a4:	e305564e 	movw	r5, #22094	; 0x564e
     4a8:	e3435136 	movt	r5, #12598	; 0x3136
     4ac:	e1500005 	cmp	r0, r5
     4b0:	0affff80 	beq	2b8 <ipu_get_channel_offset+0x288>
     4b4:	eaffff60 	b	23c <ipu_get_channel_offset+0x20c>
     4b8:	e3043935 	movw	r3, #18741	; 0x4935
     4bc:	e3453234 	movt	r3, #21044	; 0x5234
     4c0:	e1500003 	cmp	r0, r3
     4c4:	0affff9e 	beq	344 <ipu_get_channel_offset+0x314>
     4c8:	9a00001f 	bls	54c <ipu_get_channel_offset+0x51c>
     4cc:	e3053035 	movw	r3, #20533	; 0x5035
     4d0:	e3453234 	movt	r3, #21044	; 0x5234
     4d4:	e1500003 	cmp	r0, r3
     4d8:	0affff99 	beq	344 <ipu_get_channel_offset+0x314>
     4dc:	e3043934 	movw	r3, #18740	; 0x4934
     4e0:	e3453238 	movt	r3, #21048	; 0x5238
     4e4:	e1500003 	cmp	r0, r3
     4e8:	1affff53 	bne	23c <ipu_get_channel_offset+0x20c>
     4ec:	eaffff94 	b	344 <ipu_get_channel_offset+0x314>
     4f0:	e3043752 	movw	r3, #18258	; 0x4752
     4f4:	e3433342 	movt	r3, #13122	; 0x3342
     4f8:	e1500003 	cmp	r0, r3
     4fc:	0affff90 	beq	344 <ipu_get_channel_offset+0x314>
     500:	e3043742 	movw	r3, #18242	; 0x4742
     504:	e3433352 	movt	r3, #13138	; 0x3352
     508:	e1500003 	cmp	r0, r3
     50c:	0affff8c 	beq	344 <ipu_get_channel_offset+0x314>
     510:	e3053049 	movw	r3, #20553	; 0x5049
     514:	e3433255 	movt	r3, #12885	; 0x3255
     518:	e1500003 	cmp	r0, r3
     51c:	1affff46 	bne	23c <ipu_get_channel_offset+0x20c>
     520:	eaffff87 	b	344 <ipu_get_channel_offset+0x314>
     524:	e3043752 	movw	r3, #18258	; 0x4752
     528:	e3443142 	movt	r3, #16706	; 0x4142
     52c:	e1500003 	cmp	r0, r3
     530:	1affff41 	bne	23c <ipu_get_channel_offset+0x20c>
     534:	eaffff82 	b	344 <ipu_get_channel_offset+0x314>
     538:	e3053034 	movw	r3, #20532	; 0x5034
     53c:	e3453338 	movt	r3, #21304	; 0x5338
     540:	e1500003 	cmp	r0, r3
     544:	1affff3c 	bne	23c <ipu_get_channel_offset+0x20c>
     548:	eaffff7d 	b	344 <ipu_get_channel_offset+0x314>
     54c:	e3043752 	movw	r3, #18258	; 0x4752
     550:	e3453042 	movt	r3, #20546	; 0x5042
     554:	e1500003 	cmp	r0, r3
     558:	1affff37 	bne	23c <ipu_get_channel_offset+0x20c>
     55c:	eaffff78 	b	344 <ipu_get_channel_offset+0x314>

00000560 <ipu_is_channel_busy>:
     560:	e1a0c921 	lsr	ip, r1, #18
     564:	e92d4010 	push	{r4, lr}
     568:	e2804a01 	add	r4, r0, #4096	; 0x1000
     56c:	e20ce03f 	and	lr, ip, #63	; 0x3f
     570:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
     574:	e1a022ae 	lsr	r2, lr, #5
     578:	e2822001 	add	r2, r2, #1
     57c:	e0833102 	add	r3, r3, r2, lsl #2
     580:	e5933000 	ldr	r3, [r3]
     584:	f57ff04f 	dsb	sy
     588:	e35e003f 	cmp	lr, #63	; 0x3f
     58c:	0a000003 	beq	5a0 <ipu_is_channel_busy+0x40>
     590:	e20cc01f 	and	ip, ip, #31
     594:	e3a00001 	mov	r0, #1
     598:	e0133c10 	ands	r3, r3, r0, lsl ip
     59c:	18bd8010 	popne	{r4, pc}
     5a0:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
     5a4:	e201003f 	and	r0, r1, #63	; 0x3f
     5a8:	e1a022a0 	lsr	r2, r0, #5
     5ac:	e2822001 	add	r2, r2, #1
     5b0:	e0833102 	add	r3, r3, r2, lsl #2
     5b4:	e5933000 	ldr	r3, [r3]
     5b8:	f57ff04f 	dsb	sy
     5bc:	e350003f 	cmp	r0, #63	; 0x3f
     5c0:	0a000005 	beq	5dc <ipu_is_channel_busy+0x7c>
     5c4:	e3a02001 	mov	r2, #1
     5c8:	e201101f 	and	r1, r1, #31
     5cc:	e0133112 	ands	r3, r3, r2, lsl r1
     5d0:	11a00002 	movne	r0, r2
     5d4:	03a00000 	moveq	r0, #0
     5d8:	e8bd8010 	pop	{r4, pc}
     5dc:	e3a00000 	mov	r0, #0
     5e0:	e8bd8010 	pop	{r4, pc}

000005e4 <ipu_check_buffer_ready>:
     5e4:	e0822082 	add	r2, r2, r2, lsl #1
     5e8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
     5ec:	e2806d79 	add	r6, r0, #7744	; 0x1e40
     5f0:	e1a04082 	lsl	r4, r2, #1
     5f4:	e2866020 	add	r6, r6, #32
     5f8:	e1a08003 	mov	r8, r3
     5fc:	e1a05000 	mov	r5, r0
     600:	e1a00006 	mov	r0, r6
     604:	e1a04431 	lsr	r4, r1, r4
     608:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
     60c:	e3580000 	cmp	r8, #0
     610:	e1a01000 	mov	r1, r0
     614:	e204703f 	and	r7, r4, #63	; 0x3f
     618:	1a000014 	bne	670 <ipu_check_buffer_ready+0x8c>
     61c:	e5953004 	ldr	r3, [r5, #4]
     620:	e1a022a7 	lsr	r2, r7, #5
     624:	e3530000 	cmp	r3, #0
     628:	1282209a 	addne	r2, r2, #154	; 0x9a
     62c:	02822050 	addeq	r2, r2, #80	; 0x50
     630:	e1a02102 	lsl	r2, r2, #2
     634:	e2853a01 	add	r3, r5, #4096	; 0x1000
     638:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
     63c:	e0832002 	add	r2, r3, r2
     640:	e5925000 	ldr	r5, [r2]
     644:	f57ff04f 	dsb	sy
     648:	e1a00006 	mov	r0, r6
     64c:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
     650:	e357003f 	cmp	r7, #63	; 0x3f
     654:	0a000016 	beq	6b4 <ipu_check_buffer_ready+0xd0>
     658:	e204401f 	and	r4, r4, #31
     65c:	e3a03001 	mov	r3, #1
     660:	e0153413 	ands	r3, r5, r3, lsl r4
     664:	13a00001 	movne	r0, #1
     668:	03a00000 	moveq	r0, #0
     66c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
     670:	e3580001 	cmp	r8, #1
     674:	e5953004 	ldr	r3, [r5, #4]
     678:	0a00000f 	beq	6bc <ipu_check_buffer_ready+0xd8>
     67c:	e3530000 	cmp	r3, #0
     680:	11a032a7 	lsrne	r3, r7, #5
     684:	03a02f4b 	moveq	r2, #300	; 0x12c
     688:	128330a2 	addne	r3, r3, #162	; 0xa2
     68c:	11a02103 	lslne	r2, r3, #2
     690:	e2853a01 	add	r3, r5, #4096	; 0x1000
     694:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
     698:	e0833002 	add	r3, r3, r2
     69c:	e5935000 	ldr	r5, [r3]
     6a0:	f57ff04f 	dsb	sy
     6a4:	e1a00006 	mov	r0, r6
     6a8:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
     6ac:	e357003f 	cmp	r7, #63	; 0x3f
     6b0:	1affffe8 	bne	658 <ipu_check_buffer_ready+0x74>
     6b4:	e3a00000 	mov	r0, #0
     6b8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
     6bc:	e1a022a7 	lsr	r2, r7, #5
     6c0:	e3530000 	cmp	r3, #0
     6c4:	1282209c 	addne	r2, r2, #156	; 0x9c
     6c8:	02822052 	addeq	r2, r2, #82	; 0x52
     6cc:	e1a02102 	lsl	r2, r2, #2
     6d0:	eaffffd7 	b	634 <ipu_check_buffer_ready+0x50>

000006d4 <bytes_per_pixel>:
     6d4:	e3043752 	movw	r3, #18258	; 0x4752
     6d8:	e3453042 	movt	r3, #20546	; 0x5042
     6dc:	e1500003 	cmp	r0, r3
     6e0:	0a000043 	beq	7f4 <bytes_per_pixel+0x120>
     6e4:	8a000022 	bhi	774 <bytes_per_pixel+0xa0>
     6e8:	e3033434 	movw	r3, #13364	; 0x3434
     6ec:	e3433434 	movt	r3, #13364	; 0x3434
     6f0:	e1500003 	cmp	r0, r3
     6f4:	0a00003e 	beq	7f4 <bytes_per_pixel+0x120>
     6f8:	8a00000e 	bhi	738 <bytes_per_pixel+0x64>
     6fc:	e3053049 	movw	r3, #20553	; 0x5049
     700:	e3433255 	movt	r3, #12885	; 0x3255
     704:	e1500003 	cmp	r0, r3
     708:	0a000039 	beq	7f4 <bytes_per_pixel+0x120>
     70c:	9a00003a 	bls	7fc <bytes_per_pixel+0x128>
     710:	e3043752 	movw	r3, #18258	; 0x4752
     714:	e3433342 	movt	r3, #13122	; 0x3342
     718:	e1500003 	cmp	r0, r3
     71c:	0a000003 	beq	730 <bytes_per_pixel+0x5c>
     720:	e3043742 	movw	r3, #18242	; 0x4742
     724:	e3433352 	movt	r3, #13138	; 0x3352
     728:	e1500003 	cmp	r0, r3
     72c:	1a00000e 	bne	76c <bytes_per_pixel+0x98>
     730:	e3a00003 	mov	r0, #3
     734:	e12fff1e 	bx	lr
     738:	e3043742 	movw	r3, #18242	; 0x4742
     73c:	e3433452 	movt	r3, #13394	; 0x3452
     740:	e1500003 	cmp	r0, r3
     744:	0a000020 	beq	7cc <bytes_per_pixel+0xf8>
     748:	8a000034 	bhi	820 <bytes_per_pixel+0x14c>
     74c:	e3033459 	movw	r3, #13401	; 0x3459
     750:	e3433434 	movt	r3, #13364	; 0x3434
     754:	e1500003 	cmp	r0, r3
     758:	0afffff4 	beq	730 <bytes_per_pixel+0x5c>
     75c:	e3043752 	movw	r3, #18258	; 0x4752
     760:	e3433442 	movt	r3, #13378	; 0x3442
     764:	e1500003 	cmp	r0, r3
     768:	0a000017 	beq	7cc <bytes_per_pixel+0xf8>
     76c:	e3a00001 	mov	r0, #1
     770:	e12fff1e 	bx	lr
     774:	e3043935 	movw	r3, #18741	; 0x4935
     778:	e3453334 	movt	r3, #21300	; 0x5334
     77c:	e1500003 	cmp	r0, r3
     780:	0a000011 	beq	7cc <bytes_per_pixel+0xf8>
     784:	9a00002e 	bls	844 <bytes_per_pixel+0x170>
     788:	e3053034 	movw	r3, #20532	; 0x5034
     78c:	e3453338 	movt	r3, #21304	; 0x5338
     790:	e1500003 	cmp	r0, r3
     794:	0a000016 	beq	7f4 <bytes_per_pixel+0x120>
     798:	9a00000d 	bls	7d4 <bytes_per_pixel+0x100>
     79c:	e3053559 	movw	r3, #21849	; 0x5559
     7a0:	e3453659 	movt	r3, #22105	; 0x5659
     7a4:	e1500003 	cmp	r0, r3
     7a8:	0a000011 	beq	7f4 <bytes_per_pixel+0x120>
     7ac:	e3053955 	movw	r3, #22869	; 0x5955
     7b0:	e3453956 	movt	r3, #22870	; 0x5956
     7b4:	e1500003 	cmp	r0, r3
     7b8:	0a00000d 	beq	7f4 <bytes_per_pixel+0x120>
     7bc:	e3053941 	movw	r3, #22849	; 0x5941
     7c0:	e3453655 	movt	r3, #22101	; 0x5655
     7c4:	e1500003 	cmp	r0, r3
     7c8:	1affffe7 	bne	76c <bytes_per_pixel+0x98>
     7cc:	e3a00004 	mov	r0, #4
     7d0:	e12fff1e 	bx	lr
     7d4:	e3053035 	movw	r3, #20533	; 0x5035
     7d8:	e3453334 	movt	r3, #21300	; 0x5334
     7dc:	e1500003 	cmp	r0, r3
     7e0:	0afffff9 	beq	7cc <bytes_per_pixel+0xf8>
     7e4:	e3043934 	movw	r3, #18740	; 0x4934
     7e8:	e3453338 	movt	r3, #21304	; 0x5338
     7ec:	e1500003 	cmp	r0, r3
     7f0:	1affffdd 	bne	76c <bytes_per_pixel+0x98>
     7f4:	e3a00002 	mov	r0, #2
     7f8:	e12fff1e 	bx	lr
     7fc:	e3033535 	movw	r3, #13621	; 0x3535
     800:	e3433135 	movt	r3, #12597	; 0x3135
     804:	e1500003 	cmp	r0, r3
     808:	0afffff9 	beq	7f4 <bytes_per_pixel+0x120>
     80c:	e3053049 	movw	r3, #20553	; 0x5049
     810:	e3433155 	movt	r3, #12629	; 0x3155
     814:	e1500003 	cmp	r0, r3
     818:	1affffd3 	bne	76c <bytes_per_pixel+0x98>
     81c:	eaffffea 	b	7cc <bytes_per_pixel+0xf8>
     820:	e3043752 	movw	r3, #18258	; 0x4752
     824:	e3443142 	movt	r3, #16706	; 0x4142
     828:	e1500003 	cmp	r0, r3
     82c:	0affffe6 	beq	7cc <bytes_per_pixel+0xf8>
     830:	e3043742 	movw	r3, #18242	; 0x4742
     834:	e3443152 	movt	r3, #16722	; 0x4152
     838:	e1500003 	cmp	r0, r3
     83c:	1affffca 	bne	76c <bytes_per_pixel+0x98>
     840:	eaffffe1 	b	7cc <bytes_per_pixel+0xf8>
     844:	e3043934 	movw	r3, #18740	; 0x4934
     848:	e3453238 	movt	r3, #21048	; 0x5238
     84c:	e1500003 	cmp	r0, r3
     850:	0affffe7 	beq	7f4 <bytes_per_pixel+0x120>
     854:	8a000008 	bhi	87c <bytes_per_pixel+0x1a8>
     858:	e3043935 	movw	r3, #18741	; 0x4935
     85c:	e3453234 	movt	r3, #21044	; 0x5234
     860:	e1500003 	cmp	r0, r3
     864:	0affffd8 	beq	7cc <bytes_per_pixel+0xf8>
     868:	e3053035 	movw	r3, #20533	; 0x5035
     86c:	e3453234 	movt	r3, #21044	; 0x5234
     870:	e1500003 	cmp	r0, r3
     874:	1affffbc 	bne	76c <bytes_per_pixel+0x98>
     878:	eaffffd3 	b	7cc <bytes_per_pixel+0xf8>
     87c:	e3053034 	movw	r3, #20532	; 0x5034
     880:	e3453238 	movt	r3, #21048	; 0x5238
     884:	e1500003 	cmp	r0, r3
     888:	0affffd9 	beq	7f4 <bytes_per_pixel+0x120>
     88c:	e3043241 	movw	r3, #16961	; 0x4241
     890:	e3453247 	movt	r3, #21063	; 0x5247
     894:	e1500003 	cmp	r0, r3
     898:	1affffb3 	bne	76c <bytes_per_pixel+0x98>
     89c:	eaffffca 	b	7cc <bytes_per_pixel+0xf8>

000008a0 <format_to_colorspace>:
     8a0:	e3043752 	movw	r3, #18258	; 0x4752
     8a4:	e3443142 	movt	r3, #16706	; 0x4142
     8a8:	e1500003 	cmp	r0, r3
     8ac:	0a000012 	beq	8fc <format_to_colorspace+0x5c>
     8b0:	9a000013 	bls	904 <format_to_colorspace+0x64>
     8b4:	e3053034 	movw	r3, #20532	; 0x5034
     8b8:	e3453238 	movt	r3, #21048	; 0x5238
     8bc:	e1500003 	cmp	r0, r3
     8c0:	0a00000d 	beq	8fc <format_to_colorspace+0x5c>
     8c4:	8a000022 	bhi	954 <format_to_colorspace+0xb4>
     8c8:	e3043935 	movw	r3, #18741	; 0x4935
     8cc:	e3453234 	movt	r3, #21044	; 0x5234
     8d0:	e1500003 	cmp	r0, r3
     8d4:	0a000008 	beq	8fc <format_to_colorspace+0x5c>
     8d8:	9a000038 	bls	9c0 <format_to_colorspace+0x120>
     8dc:	e3053035 	movw	r3, #20533	; 0x5035
     8e0:	e3453234 	movt	r3, #21044	; 0x5234
     8e4:	e1500003 	cmp	r0, r3
     8e8:	0a000003 	beq	8fc <format_to_colorspace+0x5c>
     8ec:	e3043934 	movw	r3, #18740	; 0x4934
     8f0:	e3453238 	movt	r3, #21048	; 0x5238
     8f4:	e1500003 	cmp	r0, r3
     8f8:	1a000013 	bne	94c <format_to_colorspace+0xac>
     8fc:	e3a00000 	mov	r0, #0
     900:	e12fff1e 	bx	lr
     904:	e3033434 	movw	r3, #13364	; 0x3434
     908:	e3433434 	movt	r3, #13364	; 0x3434
     90c:	e1500003 	cmp	r0, r3
     910:	0afffff9 	beq	8fc <format_to_colorspace+0x5c>
     914:	e3043752 	movw	r3, #18258	; 0x4752
     918:	8a00001b 	bhi	98c <format_to_colorspace+0xec>
     91c:	e3433342 	movt	r3, #13122	; 0x3342
     920:	e1500003 	cmp	r0, r3
     924:	0afffff4 	beq	8fc <format_to_colorspace+0x5c>
     928:	9a00003f 	bls	a2c <format_to_colorspace+0x18c>
     92c:	e3043247 	movw	r3, #16967	; 0x4247
     930:	e3433352 	movt	r3, #13138	; 0x3352
     934:	e1500003 	cmp	r0, r3
     938:	0affffef 	beq	8fc <format_to_colorspace+0x5c>
     93c:	e3043742 	movw	r3, #18242	; 0x4742
     940:	e3433352 	movt	r3, #13138	; 0x3352
     944:	e1500003 	cmp	r0, r3
     948:	0affffeb 	beq	8fc <format_to_colorspace+0x5c>
     94c:	e3a00001 	mov	r0, #1
     950:	e12fff1e 	bx	lr
     954:	e3053035 	movw	r3, #20533	; 0x5035
     958:	e3453334 	movt	r3, #21300	; 0x5334
     95c:	e1500003 	cmp	r0, r3
     960:	0affffe5 	beq	8fc <format_to_colorspace+0x5c>
     964:	9a00001e 	bls	9e4 <format_to_colorspace+0x144>
     968:	e3043934 	movw	r3, #18740	; 0x4934
     96c:	e3453338 	movt	r3, #21304	; 0x5338
     970:	e1500003 	cmp	r0, r3
     974:	0affffe0 	beq	8fc <format_to_colorspace+0x5c>
     978:	e3053034 	movw	r3, #20532	; 0x5034
     97c:	e3453338 	movt	r3, #21304	; 0x5338
     980:	e1500003 	cmp	r0, r3
     984:	1afffff0 	bne	94c <format_to_colorspace+0xac>
     988:	eaffffdb 	b	8fc <format_to_colorspace+0x5c>
     98c:	e3433642 	movt	r3, #13890	; 0x3642
     990:	e1500003 	cmp	r0, r3
     994:	0affffd8 	beq	8fc <format_to_colorspace+0x5c>
     998:	9a00001a 	bls	a08 <format_to_colorspace+0x168>
     99c:	e305364c 	movw	r3, #22092	; 0x564c
     9a0:	e3433644 	movt	r3, #13892	; 0x3644
     9a4:	e1500003 	cmp	r0, r3
     9a8:	0affffd3 	beq	8fc <format_to_colorspace+0x5c>
     9ac:	e305364c 	movw	r3, #22092	; 0x564c
     9b0:	e3433844 	movt	r3, #14404	; 0x3844
     9b4:	e1500003 	cmp	r0, r3
     9b8:	1affffe3 	bne	94c <format_to_colorspace+0xac>
     9bc:	eaffffce 	b	8fc <format_to_colorspace+0x5c>
     9c0:	e3043742 	movw	r3, #18242	; 0x4742
     9c4:	e3443152 	movt	r3, #16722	; 0x4152
     9c8:	e1500003 	cmp	r0, r3
     9cc:	0affffca 	beq	8fc <format_to_colorspace+0x5c>
     9d0:	e3043752 	movw	r3, #18258	; 0x4752
     9d4:	e3453042 	movt	r3, #20546	; 0x5042
     9d8:	e1500003 	cmp	r0, r3
     9dc:	1affffda 	bne	94c <format_to_colorspace+0xac>
     9e0:	eaffffc5 	b	8fc <format_to_colorspace+0x5c>
     9e4:	e3043241 	movw	r3, #16961	; 0x4241
     9e8:	e3453247 	movt	r3, #21063	; 0x5247
     9ec:	e1500003 	cmp	r0, r3
     9f0:	0affffc1 	beq	8fc <format_to_colorspace+0x5c>
     9f4:	e3043935 	movw	r3, #18741	; 0x4935
     9f8:	e3453334 	movt	r3, #21300	; 0x5334
     9fc:	e1500003 	cmp	r0, r3
     a00:	1affffd1 	bne	94c <format_to_colorspace+0xac>
     a04:	eaffffbc 	b	8fc <format_to_colorspace+0x5c>
     a08:	e3043752 	movw	r3, #18258	; 0x4752
     a0c:	e3433442 	movt	r3, #13378	; 0x3442
     a10:	e1500003 	cmp	r0, r3
     a14:	0affffb8 	beq	8fc <format_to_colorspace+0x5c>
     a18:	e3043742 	movw	r3, #18242	; 0x4742
     a1c:	e3433452 	movt	r3, #13394	; 0x3452
     a20:	e1500003 	cmp	r0, r3
     a24:	1affffc8 	bne	94c <format_to_colorspace+0xac>
     a28:	eaffffb3 	b	8fc <format_to_colorspace+0x5c>
     a2c:	e3033535 	movw	r3, #13621	; 0x3535
     a30:	e3433135 	movt	r3, #12597	; 0x3135
     a34:	e1500003 	cmp	r0, r3
     a38:	1affffc3 	bne	94c <format_to_colorspace+0xac>
     a3c:	eaffffae 	b	8fc <format_to_colorspace+0x5c>

00000a40 <ipu_ch_param_bad_alpha_pos>:
     a40:	e3043742 	movw	r3, #18242	; 0x4742
     a44:	e3433452 	movt	r3, #13394	; 0x3452
     a48:	e1500003 	cmp	r0, r3
     a4c:	0a00000d 	beq	a88 <ipu_ch_param_bad_alpha_pos+0x48>
     a50:	e3043752 	movw	r3, #18258	; 0x4752
     a54:	9a000008 	bls	a7c <ipu_ch_param_bad_alpha_pos+0x3c>
     a58:	e3443142 	movt	r3, #16706	; 0x4142
     a5c:	e1500003 	cmp	r0, r3
     a60:	0a000008 	beq	a88 <ipu_ch_param_bad_alpha_pos+0x48>
     a64:	e3043742 	movw	r3, #18242	; 0x4742
     a68:	e3443152 	movt	r3, #16722	; 0x4152
     a6c:	e1500003 	cmp	r0, r3
     a70:	0a000004 	beq	a88 <ipu_ch_param_bad_alpha_pos+0x48>
     a74:	e3a00000 	mov	r0, #0
     a78:	e12fff1e 	bx	lr
     a7c:	e3433442 	movt	r3, #13378	; 0x3442
     a80:	e1500003 	cmp	r0, r3
     a84:	1afffffa 	bne	a74 <ipu_ch_param_bad_alpha_pos+0x34>
     a88:	e3a00001 	mov	r0, #1
     a8c:	e12fff1e 	bx	lr

00000a90 <ipu_pixel_format_is_gpu_tile>:
     a90:	e3053034 	movw	r3, #20532	; 0x5034
     a94:	e3453238 	movt	r3, #21048	; 0x5238
     a98:	e1500003 	cmp	r0, r3
     a9c:	0a00000d 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     aa0:	e3053035 	movw	r3, #20533	; 0x5035
     aa4:	9a00000d 	bls	ae0 <ipu_pixel_format_is_gpu_tile+0x50>
     aa8:	e3453334 	movt	r3, #21300	; 0x5334
     aac:	e1500003 	cmp	r0, r3
     ab0:	0a000008 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     ab4:	9a000016 	bls	b14 <ipu_pixel_format_is_gpu_tile+0x84>
     ab8:	e3043934 	movw	r3, #18740	; 0x4934
     abc:	e3453338 	movt	r3, #21304	; 0x5338
     ac0:	e1500003 	cmp	r0, r3
     ac4:	0a000003 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     ac8:	e3053034 	movw	r3, #20532	; 0x5034
     acc:	e3453338 	movt	r3, #21304	; 0x5338
     ad0:	e1500003 	cmp	r0, r3
     ad4:	1a00000c 	bne	b0c <ipu_pixel_format_is_gpu_tile+0x7c>
     ad8:	e3a00001 	mov	r0, #1
     adc:	e12fff1e 	bx	lr
     ae0:	e3453234 	movt	r3, #21044	; 0x5234
     ae4:	e1500003 	cmp	r0, r3
     ae8:	0afffffa 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     aec:	e3043934 	movw	r3, #18740	; 0x4934
     af0:	e3453238 	movt	r3, #21048	; 0x5238
     af4:	e1500003 	cmp	r0, r3
     af8:	0afffff6 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     afc:	e3043935 	movw	r3, #18741	; 0x4935
     b00:	e3453234 	movt	r3, #21044	; 0x5234
     b04:	e1500003 	cmp	r0, r3
     b08:	0afffff2 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     b0c:	e3a00000 	mov	r0, #0
     b10:	e12fff1e 	bx	lr
     b14:	e3043935 	movw	r3, #18741	; 0x4935
     b18:	e3453334 	movt	r3, #21300	; 0x5334
     b1c:	e1500003 	cmp	r0, r3
     b20:	0affffec 	beq	ad8 <ipu_pixel_format_is_gpu_tile+0x48>
     b24:	e3a00000 	mov	r0, #0
     b28:	e12fff1e 	bx	lr

00000b2c <ipu_pixel_format_is_split_gpu_tile>:
     b2c:	e3053034 	movw	r3, #20532	; 0x5034
     b30:	e3453238 	movt	r3, #21048	; 0x5238
     b34:	e1500003 	cmp	r0, r3
     b38:	0a00000d 	beq	b74 <ipu_pixel_format_is_split_gpu_tile+0x48>
     b3c:	e3053035 	movw	r3, #20533	; 0x5035
     b40:	9a000008 	bls	b68 <ipu_pixel_format_is_split_gpu_tile+0x3c>
     b44:	e3453334 	movt	r3, #21300	; 0x5334
     b48:	e1500003 	cmp	r0, r3
     b4c:	0a000008 	beq	b74 <ipu_pixel_format_is_split_gpu_tile+0x48>
     b50:	e3053034 	movw	r3, #20532	; 0x5034
     b54:	e3453338 	movt	r3, #21304	; 0x5338
     b58:	e1500003 	cmp	r0, r3
     b5c:	0a000004 	beq	b74 <ipu_pixel_format_is_split_gpu_tile+0x48>
     b60:	e3a00000 	mov	r0, #0
     b64:	e12fff1e 	bx	lr
     b68:	e3453234 	movt	r3, #21044	; 0x5234
     b6c:	e1500003 	cmp	r0, r3
     b70:	1afffffa 	bne	b60 <ipu_pixel_format_is_split_gpu_tile+0x34>
     b74:	e3a00001 	mov	r0, #1
     b78:	e12fff1e 	bx	lr

00000b7c <ipu_pixel_format_is_pre_yuv>:
     b7c:	e305364e 	movw	r3, #22094	; 0x564e
     b80:	e3433132 	movt	r3, #12594	; 0x3132
     b84:	e1500003 	cmp	r0, r3
     b88:	0a000005 	beq	ba4 <ipu_pixel_format_is_pre_yuv+0x28>
     b8c:	e305364e 	movw	r3, #22094	; 0x564e
     b90:	e3433136 	movt	r3, #12598	; 0x3136
     b94:	e1500003 	cmp	r0, r3
     b98:	0a000001 	beq	ba4 <ipu_pixel_format_is_pre_yuv+0x28>
     b9c:	e3a00000 	mov	r0, #0
     ba0:	e12fff1e 	bx	lr
     ba4:	e3a00001 	mov	r0, #1
     ba8:	e12fff1e 	bx	lr

00000bac <ipu_pixel_format_is_multiplanar_yuv>:
     bac:	e3053659 	movw	r3, #22105	; 0x5659
     bb0:	e3433231 	movt	r3, #12849	; 0x3231
     bb4:	e1500003 	cmp	r0, r3
     bb8:	0a00000d 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     bbc:	9a00000e 	bls	bfc <ipu_pixel_format_is_multiplanar_yuv+0x50>
     bc0:	e3053659 	movw	r3, #22105	; 0x5659
     bc4:	e3433955 	movt	r3, #14677	; 0x3955
     bc8:	e1500003 	cmp	r0, r3
     bcc:	0a000008 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     bd0:	8a000022 	bhi	c60 <ipu_pixel_format_is_multiplanar_yuv+0xb4>
     bd4:	e305364e 	movw	r3, #22094	; 0x564e
     bd8:	e3433631 	movt	r3, #13873	; 0x3631
     bdc:	e1500003 	cmp	r0, r3
     be0:	0a000003 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     be4:	e3053659 	movw	r3, #22105	; 0x5659
     be8:	e3433631 	movt	r3, #13873	; 0x3631
     bec:	e1500003 	cmp	r0, r3
     bf0:	1a000022 	bne	c80 <ipu_pixel_format_is_multiplanar_yuv+0xd4>
     bf4:	e3a00001 	mov	r0, #1
     bf8:	e12fff1e 	bx	lr
     bfc:	e305364e 	movw	r3, #22094	; 0x564e
     c00:	e3433136 	movt	r3, #12598	; 0x3136
     c04:	e1500003 	cmp	r0, r3
     c08:	0afffff9 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c0c:	8a000009 	bhi	c38 <ipu_pixel_format_is_multiplanar_yuv+0x8c>
     c10:	e3033449 	movw	r3, #13385	; 0x3449
     c14:	e3433032 	movt	r3, #12338	; 0x3032
     c18:	e1500003 	cmp	r0, r3
     c1c:	0afffff4 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c20:	e305364e 	movw	r3, #22094	; 0x564e
     c24:	e3433132 	movt	r3, #12594	; 0x3132
     c28:	e1500003 	cmp	r0, r3
     c2c:	0afffff0 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c30:	e3a00000 	mov	r0, #0
     c34:	e12fff1e 	bx	lr
     c38:	e3053559 	movw	r3, #21849	; 0x5559
     c3c:	e3433231 	movt	r3, #12849	; 0x3231
     c40:	e1500003 	cmp	r0, r3
     c44:	0affffea 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c48:	e305364e 	movw	r3, #22094	; 0x564e
     c4c:	e3433231 	movt	r3, #12849	; 0x3231
     c50:	e1500003 	cmp	r0, r3
     c54:	0affffe6 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c58:	e3a00000 	mov	r0, #0
     c5c:	e12fff1e 	bx	lr
     c60:	e3033234 	movw	r3, #12852	; 0x3234
     c64:	e3453032 	movt	r3, #20530	; 0x5032
     c68:	e1500003 	cmp	r0, r3
     c6c:	0affffe0 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c70:	e3033434 	movw	r3, #13364	; 0x3434
     c74:	e3453034 	movt	r3, #20532	; 0x5034
     c78:	e1500003 	cmp	r0, r3
     c7c:	0affffdc 	beq	bf4 <ipu_pixel_format_is_multiplanar_yuv+0x48>
     c80:	e3a00000 	mov	r0, #0
     c84:	e12fff1e 	bx	lr

00000c88 <ipu_disable_hsp_clk>:
     c88:	e590000c 	ldr	r0, [r0, #12]
     c8c:	eafffffe 	b	0 <clk_disable>

00000c90 <ipu_update_channel_offset>:
     c90:	e0822082 	add	r2, r2, r2, lsl #1
     c94:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
     c98:	e2807d79 	add	r7, r0, #7744	; 0x1e40
     c9c:	e1a08082 	lsl	r8, r2, #1
     ca0:	e2877020 	add	r7, r7, #32
     ca4:	e1a0b000 	mov	fp, r0
     ca8:	e1a08831 	lsr	r8, r1, r8
     cac:	e24dd00c 	sub	sp, sp, #12
     cb0:	e1a00007 	mov	r0, r7
     cb4:	e1dd93b4 	ldrh	r9, [sp, #52]	; 0x34
     cb8:	e1a06003 	mov	r6, r3
     cbc:	e208503f 	and	r5, r8, #63	; 0x3f
     cc0:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
     cc4:	e59b2004 	ldr	r2, [fp, #4]
     cc8:	e1a032a5 	lsr	r3, r5, #5
     ccc:	e28b4a01 	add	r4, fp, #4096	; 0x1000
     cd0:	e1a0a000 	mov	sl, r0
     cd4:	e3520000 	cmp	r2, #0
     cd8:	1283209a 	addne	r2, r3, #154	; 0x9a
     cdc:	02832050 	addeq	r2, r3, #80	; 0x50
     ce0:	e1a00102 	lsl	r0, r2, #2
     ce4:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
     ce8:	e0822000 	add	r2, r2, r0
     cec:	e5920000 	ldr	r0, [r2]
     cf0:	f57ff04f 	dsb	sy
     cf4:	e355003f 	cmp	r5, #63	; 0x3f
     cf8:	0a000128 	beq	11a0 <ipu_update_channel_offset+0x510>
     cfc:	e208201f 	and	r2, r8, #31
     d00:	e3a0c001 	mov	ip, #1
     d04:	e1a0221c 	lsl	r2, ip, r2
     d08:	e1120000 	tst	r2, r0
     d0c:	1a000121 	bne	1198 <ipu_update_channel_offset+0x508>
     d10:	e59b0004 	ldr	r0, [fp, #4]
     d14:	e3500000 	cmp	r0, #0
     d18:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
     d1c:	1283c09c 	addne	ip, r3, #156	; 0x9c
     d20:	0283c052 	addeq	ip, r3, #82	; 0x52
     d24:	e1a0c10c 	lsl	ip, ip, #2
     d28:	e080000c 	add	r0, r0, ip
     d2c:	e5900000 	ldr	r0, [r0]
     d30:	f57ff04f 	dsb	sy
     d34:	e1100002 	tst	r0, r2
     d38:	1a000116 	bne	1198 <ipu_update_channel_offset+0x508>
     d3c:	e59b0004 	ldr	r0, [fp, #4]
     d40:	e3500000 	cmp	r0, #0
     d44:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
     d48:	1283c0a2 	addne	ip, r3, #162	; 0xa2
     d4c:	03a0cf4b 	moveq	ip, #300	; 0x12c
     d50:	11a0c10c 	lslne	ip, ip, #2
     d54:	e080000c 	add	r0, r0, ip
     d58:	e5900000 	ldr	r0, [r0]
     d5c:	f57ff04f 	dsb	sy
     d60:	e1100002 	tst	r0, r2
     d64:	0a000014 	beq	dbc <ipu_update_channel_offset+0x12c>
     d68:	e59b0004 	ldr	r0, [fp, #4]
     d6c:	e3500000 	cmp	r0, #0
     d70:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
     d74:	1283305e 	addne	r3, r3, #94	; 0x5e
     d78:	03a03f4b 	moveq	r3, #300	; 0x12c
     d7c:	11a03103 	lslne	r3, r3, #2
     d80:	e0803003 	add	r3, r0, r3
     d84:	e5933000 	ldr	r3, [r3]
     d88:	f57ff04f 	dsb	sy
     d8c:	e1130002 	tst	r3, r2
     d90:	0a000009 	beq	dbc <ipu_update_channel_offset+0x12c>
     d94:	e2453008 	sub	r3, r5, #8
     d98:	e355000d 	cmp	r5, #13
     d9c:	13530002 	cmpne	r3, #2
     da0:	9a0000f9 	bls	118c <ipu_update_channel_offset+0x4fc>
     da4:	e208803d 	and	r8, r8, #61	; 0x3d
     da8:	e3580015 	cmp	r8, #21
     dac:	0a0000f6 	beq	118c <ipu_update_channel_offset+0x4fc>
     db0:	e245301b 	sub	r3, r5, #27
     db4:	e3530001 	cmp	r3, #1
     db8:	9a0000f3 	bls	118c <ipu_update_channel_offset+0x4fc>
     dbc:	e3053659 	movw	r3, #22105	; 0x5659
     dc0:	e3433631 	movt	r3, #13873	; 0x3631
     dc4:	e1560003 	cmp	r6, r3
     dc8:	0a0001ad 	beq	1484 <ipu_update_channel_offset+0x7f4>
     dcc:	8a0000b3 	bhi	10a0 <ipu_update_channel_offset+0x410>
     dd0:	e3053659 	movw	r3, #22105	; 0x5659
     dd4:	e3433231 	movt	r3, #12849	; 0x3231
     dd8:	e1560003 	cmp	r6, r3
     ddc:	0a000176 	beq	13bc <ipu_update_channel_offset+0x72c>
     de0:	8a0001d7 	bhi	1544 <ipu_update_channel_offset+0x8b4>
     de4:	e3033535 	movw	r3, #13621	; 0x3535
     de8:	e3433135 	movt	r3, #12597	; 0x3135
     dec:	e1560003 	cmp	r6, r3
     df0:	0a00016d 	beq	13ac <ipu_update_channel_offset+0x71c>
     df4:	e3053049 	movw	r3, #20553	; 0x5049
     df8:	9a0000fe 	bls	11f8 <ipu_update_channel_offset+0x568>
     dfc:	e3433155 	movt	r3, #12629	; 0x3155
     e00:	e1560003 	cmp	r6, r3
     e04:	0a000168 	beq	13ac <ipu_update_channel_offset+0x71c>
     e08:	9a000233 	bls	16dc <ipu_update_channel_offset+0xa4c>
     e0c:	e3053559 	movw	r3, #21849	; 0x5559
     e10:	e3433231 	movt	r3, #12849	; 0x3231
     e14:	e1560003 	cmp	r6, r3
     e18:	1a00022a 	bne	16c8 <ipu_update_channel_offset+0xa38>
     e1c:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
     e20:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
     e24:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
     e28:	e1a0c0a3 	lsr	ip, r3, #1
     e2c:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
     e30:	e002029c 	mul	r2, ip, r2
     e34:	e06330a3 	rsb	r3, r3, r3, lsr #1
     e38:	e0810003 	add	r0, r1, r3
     e3c:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
     e40:	e1a020a2 	lsr	r2, r2, #1
     e44:	e1e06001 	mvn	r6, r1
     e48:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
     e4c:	e086e009 	add	lr, r6, r9
     e50:	e0800002 	add	r0, r0, r2
     e54:	e3510000 	cmp	r1, #0
     e58:	e0010c99 	mul	r1, r9, ip
     e5c:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
     e60:	e0260e9c 	mla	r6, ip, lr, r0
     e64:	e08610a1 	add	r1, r6, r1, lsr #1
     e68:	0a0000ff 	beq	126c <ipu_update_channel_offset+0x5dc>
     e6c:	e59d0044 	ldr	r0, [sp, #68]	; 0x44
     e70:	e0090c90 	mul	r9, r0, ip
     e74:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
     e78:	e0800003 	add	r0, r0, r3
     e7c:	e0400009 	sub	r0, r0, r9
     e80:	e0800002 	add	r0, r0, r2
     e84:	e1560000 	cmp	r6, r0
     e88:	31a06000 	movcc	r6, r0
     e8c:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
     e90:	e3500000 	cmp	r0, #0
     e94:	1a0000fa 	bne	1284 <ipu_update_channel_offset+0x5f4>
     e98:	e1a091a1 	lsr	r9, r1, #3
     e9c:	e201b007 	and	fp, r1, #7
     ea0:	e58d103c 	str	r1, [sp, #60]	; 0x3c
     ea4:	e3560402 	cmp	r6, #33554432	; 0x2000000
     ea8:	e2063007 	and	r3, r6, #7
     eac:	e1a081a6 	lsr	r8, r6, #3
     eb0:	2a000128 	bcs	1358 <ipu_update_channel_offset+0x6c8>
     eb4:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
     eb8:	e3520402 	cmp	r2, #33554432	; 0x2000000
     ebc:	3a000006 	bcc	edc <ipu_update_channel_offset+0x24c>
     ec0:	e3001000 	movw	r1, #0
     ec4:	e1a02005 	mov	r2, r5
     ec8:	e3401000 	movt	r1, #0
     ecc:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
     ed0:	e58d3000 	str	r3, [sp]
     ed4:	ebfffffe 	bl	0 <dev_warn>
     ed8:	e59d3000 	ldr	r3, [sp]
     edc:	e3530000 	cmp	r3, #0
     ee0:	1a000110 	bne	1328 <ipu_update_channel_offset+0x698>
     ee4:	e35b0000 	cmp	fp, #0
     ee8:	0a000004 	beq	f00 <ipu_update_channel_offset+0x270>
     eec:	e3001000 	movw	r1, #0
     ef0:	e1a02005 	mov	r2, r5
     ef4:	e3401000 	movt	r1, #0
     ef8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
     efc:	ebfffffe 	bl	0 <dev_warn>
     f00:	e1a0b305 	lsl	fp, r5, #6
     f04:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     f08:	e28bb004 	add	fp, fp, #4
     f0c:	e083300b 	add	r3, r3, fp
     f10:	e5930000 	ldr	r0, [r3]
     f14:	f57ff04f 	dsb	sy
     f18:	e5941d78 	ldr	r1, [r4, #3448]	; 0xd78
     f1c:	e28b2004 	add	r2, fp, #4
     f20:	e0811002 	add	r1, r1, r2
     f24:	e5913000 	ldr	r3, [r1]
     f28:	f57ff04f 	dsb	sy
     f2c:	e1a03903 	lsl	r3, r3, #18
     f30:	e203370f 	and	r3, r3, #3932160	; 0x3c0000
     f34:	e1833720 	orr	r3, r3, r0, lsr #14
     f38:	e1580003 	cmp	r8, r3
     f3c:	1a0000db 	bne	12b0 <ipu_update_channel_offset+0x620>
     f40:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     f44:	e0833002 	add	r3, r3, r2
     f48:	e5933000 	ldr	r3, [r3]
     f4c:	f57ff04f 	dsb	sy
     f50:	e7f53253 	ubfx	r3, r3, #4, #22
     f54:	e1590003 	cmp	r9, r3
     f58:	0a00000e 	beq	f98 <ipu_update_channel_offset+0x308>
     f5c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     f60:	e58d2000 	str	r2, [sp]
     f64:	e0833002 	add	r3, r3, r2
     f68:	e5931000 	ldr	r1, [r3]
     f6c:	f57ff04f 	dsb	sy
     f70:	e3a0300f 	mov	r3, #15
     f74:	e34f3c00 	movt	r3, #64512	; 0xfc00
     f78:	e0033001 	and	r3, r3, r1
     f7c:	e183b209 	orr	fp, r3, r9, lsl #4
     f80:	f57ff04e 	dsb	st
     f84:	ebfffffe 	bl	0 <arm_heavy_mb>
     f88:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     f8c:	e59d2000 	ldr	r2, [sp]
     f90:	e0832002 	add	r2, r3, r2
     f94:	e582b000 	str	fp, [r2]
     f98:	e2455008 	sub	r5, r5, #8
     f9c:	e3550014 	cmp	r5, #20
     fa0:	8a00003c 	bhi	1098 <ipu_update_channel_offset+0x408>
     fa4:	e3003000 	movw	r3, #0
     fa8:	e3403000 	movt	r3, #0
     fac:	e7935105 	ldr	r5, [r3, r5, lsl #2]
     fb0:	e3550000 	cmp	r5, #0
     fb4:	da000037 	ble	1098 <ipu_update_channel_offset+0x408>
     fb8:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     fbc:	e1a05305 	lsl	r5, r5, #6
     fc0:	e2855004 	add	r5, r5, #4
     fc4:	e0833005 	add	r3, r3, r5
     fc8:	e5931000 	ldr	r1, [r3]
     fcc:	f57ff04f 	dsb	sy
     fd0:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
     fd4:	e285b004 	add	fp, r5, #4
     fd8:	e082200b 	add	r2, r2, fp
     fdc:	e5923000 	ldr	r3, [r2]
     fe0:	f57ff04f 	dsb	sy
     fe4:	e1a03903 	lsl	r3, r3, #18
     fe8:	e203370f 	and	r3, r3, #3932160	; 0x3c0000
     fec:	e1833721 	orr	r3, r3, r1, lsr #14
     ff0:	e1580003 	cmp	r8, r3
     ff4:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
     ff8:	0083300b 	addeq	r3, r3, fp
     ffc:	0a000013 	beq	1050 <ipu_update_channel_offset+0x3c0>
    1000:	e0833005 	add	r3, r3, r5
    1004:	e5933000 	ldr	r3, [r3]
    1008:	f57ff04f 	dsb	sy
    100c:	e7ed3053 	ubfx	r3, r3, #0, #14
    1010:	e1838708 	orr	r8, r3, r8, lsl #14
    1014:	f57ff04e 	dsb	st
    1018:	ebfffffe 	bl	0 <arm_heavy_mb>
    101c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    1020:	e0835005 	add	r5, r3, r5
    1024:	e5858000 	str	r8, [r5]
    1028:	e083300b 	add	r3, r3, fp
    102c:	e5933000 	ldr	r3, [r3]
    1030:	f57ff04f 	dsb	sy
    1034:	e3c3300f 	bic	r3, r3, #15
    1038:	e1836aa6 	orr	r6, r3, r6, lsr #21
    103c:	f57ff04e 	dsb	st
    1040:	ebfffffe 	bl	0 <arm_heavy_mb>
    1044:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    1048:	e083300b 	add	r3, r3, fp
    104c:	e5836000 	str	r6, [r3]
    1050:	e5933000 	ldr	r3, [r3]
    1054:	f57ff04f 	dsb	sy
    1058:	e7f53253 	ubfx	r3, r3, #4, #22
    105c:	e1590003 	cmp	r9, r3
    1060:	0a00000c 	beq	1098 <ipu_update_channel_offset+0x408>
    1064:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    1068:	e083300b 	add	r3, r3, fp
    106c:	e5932000 	ldr	r2, [r3]
    1070:	f57ff04f 	dsb	sy
    1074:	e3a0300f 	mov	r3, #15
    1078:	e34f3c00 	movt	r3, #64512	; 0xfc00
    107c:	e0033002 	and	r3, r3, r2
    1080:	e1839209 	orr	r9, r3, r9, lsl #4
    1084:	f57ff04e 	dsb	st
    1088:	ebfffffe 	bl	0 <arm_heavy_mb>
    108c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    1090:	e083b00b 	add	fp, r3, fp
    1094:	e58b9000 	str	r9, [fp]
    1098:	e3a04000 	mov	r4, #0
    109c:	ea000065 	b	1238 <ipu_update_channel_offset+0x5a8>
    10a0:	e3053034 	movw	r3, #20532	; 0x5034
    10a4:	e3453238 	movt	r3, #21048	; 0x5238
    10a8:	e1560003 	cmp	r6, r3
    10ac:	0a0000be 	beq	13ac <ipu_update_channel_offset+0x71c>
    10b0:	8a00014c 	bhi	15e8 <ipu_update_channel_offset+0x958>
    10b4:	e3033434 	movw	r3, #13364	; 0x3434
    10b8:	e3453034 	movt	r3, #20532	; 0x5034
    10bc:	e1560003 	cmp	r6, r3
    10c0:	0a000038 	beq	11a8 <ipu_update_channel_offset+0x518>
    10c4:	8a0000ab 	bhi	1378 <ipu_update_channel_offset+0x6e8>
    10c8:	e3043742 	movw	r3, #18242	; 0x4742
    10cc:	e3443152 	movt	r3, #16722	; 0x4152
    10d0:	e1560003 	cmp	r6, r3
    10d4:	0a0000b4 	beq	13ac <ipu_update_channel_offset+0x71c>
    10d8:	e3033234 	movw	r3, #12852	; 0x3234
    10dc:	e3453032 	movt	r3, #20530	; 0x5032
    10e0:	e1560003 	cmp	r6, r3
    10e4:	1a00018d 	bne	1720 <ipu_update_channel_offset+0xa90>
    10e8:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    10ec:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    10f0:	e1a020a3 	lsr	r2, r3, #1
    10f4:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    10f8:	e00c0192 	mul	ip, r2, r1
    10fc:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    1100:	e06330a3 	rsb	r3, r3, r3, lsr #1
    1104:	e0810003 	add	r0, r1, r3
    1108:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    110c:	e080000c 	add	r0, r0, ip
    1110:	e1e06001 	mvn	r6, r1
    1114:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    1118:	e0866009 	add	r6, r6, r9
    111c:	e3510000 	cmp	r1, #0
    1120:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    1124:	e0260691 	mla	r6, r1, r6, r0
    1128:	e0216299 	mla	r1, r9, r2, r6
    112c:	0a000140 	beq	1634 <ipu_update_channel_offset+0x9a4>
    1130:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    1134:	e59d0038 	ldr	r0, [sp, #56]	; 0x38
    1138:	e0090092 	mul	r9, r2, r0
    113c:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    1140:	e0822003 	add	r2, r2, r3
    1144:	e082200c 	add	r2, r2, ip
    1148:	e0422009 	sub	r2, r2, r9
    114c:	e1560002 	cmp	r6, r2
    1150:	31a06002 	movcc	r6, r2
    1154:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    1158:	e3520000 	cmp	r2, #0
    115c:	0affff4d 	beq	e98 <ipu_update_channel_offset+0x208>
    1160:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    1164:	e0823003 	add	r3, r2, r3
    1168:	e083c00c 	add	ip, r3, ip
    116c:	e04cc009 	sub	ip, ip, r9
    1170:	e15c0001 	cmp	ip, r1
    1174:	21a0300c 	movcs	r3, ip
    1178:	31a03001 	movcc	r3, r1
    117c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    1180:	e203b007 	and	fp, r3, #7
    1184:	e1a091a3 	lsr	r9, r3, #3
    1188:	eaffff45 	b	ea4 <ipu_update_channel_offset+0x214>
    118c:	e59b3004 	ldr	r3, [fp, #4]
    1190:	e3530000 	cmp	r3, #0
    1194:	0affff08 	beq	dbc <ipu_update_channel_offset+0x12c>
    1198:	e3e0400c 	mvn	r4, #12
    119c:	ea000025 	b	1238 <ipu_update_channel_offset+0x5a8>
    11a0:	e3a02000 	mov	r2, #0
    11a4:	eafffed9 	b	d10 <ipu_update_channel_offset+0x80>
    11a8:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
    11ac:	e2496001 	sub	r6, r9, #1
    11b0:	e3530000 	cmp	r3, #0
    11b4:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    11b8:	e0263693 	mla	r6, r3, r6, r3
    11bc:	e1a03086 	lsl	r3, r6, #1
    11c0:	0a000022 	beq	1250 <ipu_update_channel_offset+0x5c0>
    11c4:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    11c8:	e1560002 	cmp	r6, r2
    11cc:	31a06002 	movcc	r6, r2
    11d0:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    11d4:	e3520000 	cmp	r2, #0
    11d8:	0a00001f 	beq	125c <ipu_update_channel_offset+0x5cc>
    11dc:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    11e0:	e1520003 	cmp	r2, r3
    11e4:	21a03002 	movcs	r3, r2
    11e8:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    11ec:	e203b007 	and	fp, r3, #7
    11f0:	e1a091a3 	lsr	r9, r3, #3
    11f4:	eaffff2a 	b	ea4 <ipu_update_channel_offset+0x214>
    11f8:	e3433055 	movt	r3, #12373	; 0x3055
    11fc:	e1560003 	cmp	r6, r3
    1200:	0a000069 	beq	13ac <ipu_update_channel_offset+0x71c>
    1204:	e305364e 	movw	r3, #22094	; 0x564e
    1208:	e3433132 	movt	r3, #12594	; 0x3132
    120c:	e1560003 	cmp	r6, r3
    1210:	0a0000dd 	beq	158c <ipu_update_channel_offset+0x8fc>
    1214:	e3033449 	movw	r3, #13385	; 0x3449
    1218:	e3433032 	movt	r3, #12338	; 0x3032
    121c:	e1560003 	cmp	r6, r3
    1220:	0afffefd 	beq	e1c <ipu_update_channel_offset+0x18c>
    1224:	e3001000 	movw	r1, #0
    1228:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    122c:	e3401000 	movt	r1, #0
    1230:	e3a04000 	mov	r4, #0
    1234:	ebfffffe 	bl	0 <dev_err>
    1238:	e1a00007 	mov	r0, r7
    123c:	e1a0100a 	mov	r1, sl
    1240:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    1244:	e1a00004 	mov	r0, r4
    1248:	e28dd00c 	add	sp, sp, #12
    124c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1250:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    1254:	e3520000 	cmp	r2, #0
    1258:	1affffdf 	bne	11dc <ipu_update_channel_offset+0x54c>
    125c:	e203b007 	and	fp, r3, #7
    1260:	e1a091a3 	lsr	r9, r3, #3
    1264:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    1268:	eaffff0d 	b	ea4 <ipu_update_channel_offset+0x214>
    126c:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    1270:	e3500000 	cmp	r0, #0
    1274:	0affff07 	beq	e98 <ipu_update_channel_offset+0x208>
    1278:	e59d0044 	ldr	r0, [sp, #68]	; 0x44
    127c:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    1280:	e0090c90 	mul	r9, r0, ip
    1284:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    1288:	e0803003 	add	r3, r0, r3
    128c:	e0832002 	add	r2, r3, r2
    1290:	e0422009 	sub	r2, r2, r9
    1294:	e1520001 	cmp	r2, r1
    1298:	21a03002 	movcs	r3, r2
    129c:	31a03001 	movcc	r3, r1
    12a0:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    12a4:	e203b007 	and	fp, r3, #7
    12a8:	e1a091a3 	lsr	r9, r3, #3
    12ac:	eafffefc 	b	ea4 <ipu_update_channel_offset+0x214>
    12b0:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    12b4:	e58d2004 	str	r2, [sp, #4]
    12b8:	e083300b 	add	r3, r3, fp
    12bc:	e5933000 	ldr	r3, [r3]
    12c0:	f57ff04f 	dsb	sy
    12c4:	e7ed3053 	ubfx	r3, r3, #0, #14
    12c8:	e1833708 	orr	r3, r3, r8, lsl #14
    12cc:	e58d3000 	str	r3, [sp]
    12d0:	f57ff04e 	dsb	st
    12d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    12d8:	e5941d78 	ldr	r1, [r4, #3448]	; 0xd78
    12dc:	e59d3000 	ldr	r3, [sp]
    12e0:	e081b00b 	add	fp, r1, fp
    12e4:	e58b3000 	str	r3, [fp]
    12e8:	e59d2004 	ldr	r2, [sp, #4]
    12ec:	e0811002 	add	r1, r1, r2
    12f0:	e58d2000 	str	r2, [sp]
    12f4:	e591b000 	ldr	fp, [r1]
    12f8:	f57ff04f 	dsb	sy
    12fc:	e3cbb00f 	bic	fp, fp, #15
    1300:	e18bbaa6 	orr	fp, fp, r6, lsr #21
    1304:	f57ff04e 	dsb	st
    1308:	ebfffffe 	bl	0 <arm_heavy_mb>
    130c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    1310:	e59d2000 	ldr	r2, [sp]
    1314:	e0833002 	add	r3, r3, r2
    1318:	e583b000 	str	fp, [r3]
    131c:	eaffff09 	b	f48 <ipu_update_channel_offset+0x2b8>
    1320:	e59db03c 	ldr	fp, [sp, #60]	; 0x3c
    1324:	e1a0900b 	mov	r9, fp
    1328:	e3001000 	movw	r1, #0
    132c:	e1a02005 	mov	r2, r5
    1330:	e3401000 	movt	r1, #0
    1334:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    1338:	ebfffffe 	bl	0 <dev_warn>
    133c:	eafffee8 	b	ee4 <ipu_update_channel_offset+0x254>
    1340:	e3560402 	cmp	r6, #33554432	; 0x2000000
    1344:	e2063007 	and	r3, r6, #7
    1348:	e1a081a6 	lsr	r8, r6, #3
    134c:	3a0000bf 	bcc	1650 <ipu_update_channel_offset+0x9c0>
    1350:	e59d903c 	ldr	r9, [sp, #60]	; 0x3c
    1354:	e1a0b009 	mov	fp, r9
    1358:	e3001000 	movw	r1, #0
    135c:	e1a02005 	mov	r2, r5
    1360:	e3401000 	movt	r1, #0
    1364:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    1368:	e58d3000 	str	r3, [sp]
    136c:	ebfffffe 	bl	0 <dev_warn>
    1370:	e59d3000 	ldr	r3, [sp]
    1374:	eafffece 	b	eb4 <ipu_update_channel_offset+0x224>
    1378:	e3043935 	movw	r3, #18741	; 0x4935
    137c:	e3453234 	movt	r3, #21044	; 0x5234
    1380:	e1560003 	cmp	r6, r3
    1384:	0a000008 	beq	13ac <ipu_update_channel_offset+0x71c>
    1388:	9a0000e9 	bls	1734 <ipu_update_channel_offset+0xaa4>
    138c:	e3053035 	movw	r3, #20533	; 0x5035
    1390:	e3453234 	movt	r3, #21044	; 0x5234
    1394:	e1560003 	cmp	r6, r3
    1398:	0a000003 	beq	13ac <ipu_update_channel_offset+0x71c>
    139c:	e3043934 	movw	r3, #18740	; 0x4934
    13a0:	e3453238 	movt	r3, #21048	; 0x5238
    13a4:	e1560003 	cmp	r6, r3
    13a8:	1affff9d 	bne	1224 <ipu_update_channel_offset+0x594>
    13ac:	e3a08000 	mov	r8, #0
    13b0:	e1a06008 	mov	r6, r8
    13b4:	e1a09008 	mov	r9, r8
    13b8:	eafffed0 	b	f00 <ipu_update_channel_offset+0x270>
    13bc:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    13c0:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    13c4:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    13c8:	e1a060a3 	lsr	r6, r3, #1
    13cc:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    13d0:	e0020296 	mul	r2, r6, r2
    13d4:	e06330a3 	rsb	r3, r3, r3, lsr #1
    13d8:	e0060699 	mul	r6, r9, r6
    13dc:	e081e003 	add	lr, r1, r3
    13e0:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    13e4:	e1a020a2 	lsr	r2, r2, #1
    13e8:	e1e00001 	mvn	r0, r1
    13ec:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    13f0:	e080c009 	add	ip, r0, r9
    13f4:	e08e0002 	add	r0, lr, r2
    13f8:	e3510000 	cmp	r1, #0
    13fc:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    1400:	e0200c91 	mla	r0, r1, ip, r0
    1404:	e08060a6 	add	r6, r0, r6, lsr #1
    1408:	0a000016 	beq	1468 <ipu_update_channel_offset+0x7d8>
    140c:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    1410:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    1414:	e0090c91 	mul	r9, r1, ip
    1418:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    141c:	e0811003 	add	r1, r1, r3
    1420:	e0411009 	sub	r1, r1, r9
    1424:	e0811002 	add	r1, r1, r2
    1428:	e1560001 	cmp	r6, r1
    142c:	31a06001 	movcc	r6, r1
    1430:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    1434:	e3510000 	cmp	r1, #0
    1438:	0a00000d 	beq	1474 <ipu_update_channel_offset+0x7e4>
    143c:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    1440:	e0813003 	add	r3, r1, r3
    1444:	e0832002 	add	r2, r3, r2
    1448:	e0422009 	sub	r2, r2, r9
    144c:	e1520000 	cmp	r2, r0
    1450:	21a03002 	movcs	r3, r2
    1454:	31a03000 	movcc	r3, r0
    1458:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    145c:	e203b007 	and	fp, r3, #7
    1460:	e1a091a3 	lsr	r9, r3, #3
    1464:	eafffe8e 	b	ea4 <ipu_update_channel_offset+0x214>
    1468:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    146c:	e3510000 	cmp	r1, #0
    1470:	1a00007e 	bne	1670 <ipu_update_channel_offset+0x9e0>
    1474:	e200b007 	and	fp, r0, #7
    1478:	e1a091a0 	lsr	r9, r0, #3
    147c:	e58d003c 	str	r0, [sp, #60]	; 0x3c
    1480:	eafffe87 	b	ea4 <ipu_update_channel_offset+0x214>
    1484:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    1488:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    148c:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    1490:	e1a060a3 	lsr	r6, r3, #1
    1494:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    1498:	e1e0c001 	mvn	ip, r1
    149c:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    14a0:	e0000296 	mul	r0, r6, r2
    14a4:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    14a8:	e08cc009 	add	ip, ip, r9
    14ac:	e06330a3 	rsb	r3, r3, r3, lsr #1
    14b0:	e3510000 	cmp	r1, #0
    14b4:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    14b8:	e0822003 	add	r2, r2, r3
    14bc:	e0822000 	add	r2, r2, r0
    14c0:	e0222c91 	mla	r2, r1, ip, r2
    14c4:	e0262699 	mla	r6, r9, r6, r2
    14c8:	0a000016 	beq	1528 <ipu_update_channel_offset+0x898>
    14cc:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    14d0:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    14d4:	e0090c91 	mul	r9, r1, ip
    14d8:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    14dc:	e0811003 	add	r1, r1, r3
    14e0:	e0811000 	add	r1, r1, r0
    14e4:	e0411009 	sub	r1, r1, r9
    14e8:	e1560001 	cmp	r6, r1
    14ec:	31a06001 	movcc	r6, r1
    14f0:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    14f4:	e3510000 	cmp	r1, #0
    14f8:	0a00000d 	beq	1534 <ipu_update_channel_offset+0x8a4>
    14fc:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    1500:	e0813003 	add	r3, r1, r3
    1504:	e0830000 	add	r0, r3, r0
    1508:	e0400009 	sub	r0, r0, r9
    150c:	e1500002 	cmp	r0, r2
    1510:	21a03000 	movcs	r3, r0
    1514:	31a03002 	movcc	r3, r2
    1518:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    151c:	e203b007 	and	fp, r3, #7
    1520:	e1a091a3 	lsr	r9, r3, #3
    1524:	eafffe5e 	b	ea4 <ipu_update_channel_offset+0x214>
    1528:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    152c:	e3510000 	cmp	r1, #0
    1530:	1a00004a 	bne	1660 <ipu_update_channel_offset+0x9d0>
    1534:	e202b007 	and	fp, r2, #7
    1538:	e1a091a2 	lsr	r9, r2, #3
    153c:	e58d203c 	str	r2, [sp, #60]	; 0x3c
    1540:	eafffe57 	b	ea4 <ipu_update_channel_offset+0x214>
    1544:	e3033434 	movw	r3, #13364	; 0x3434
    1548:	e3433434 	movt	r3, #13364	; 0x3434
    154c:	e1560003 	cmp	r6, r3
    1550:	0affff95 	beq	13ac <ipu_update_channel_offset+0x71c>
    1554:	e3043752 	movw	r3, #18258	; 0x4752
    1558:	9a000064 	bls	16f0 <ipu_update_channel_offset+0xa60>
    155c:	e3433442 	movt	r3, #13378	; 0x3442
    1560:	e1560003 	cmp	r6, r3
    1564:	0affff90 	beq	13ac <ipu_update_channel_offset+0x71c>
    1568:	9a000051 	bls	16b4 <ipu_update_channel_offset+0xa24>
    156c:	e3043742 	movw	r3, #18242	; 0x4742
    1570:	e3433452 	movt	r3, #13394	; 0x3452
    1574:	e1560003 	cmp	r6, r3
    1578:	0affff8b 	beq	13ac <ipu_update_channel_offset+0x71c>
    157c:	e305364e 	movw	r3, #22094	; 0x564e
    1580:	e3433631 	movt	r3, #13873	; 0x3631
    1584:	e1560003 	cmp	r6, r3
    1588:	1affff25 	bne	1224 <ipu_update_channel_offset+0x594>
    158c:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    1590:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    1594:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    1598:	e59d0038 	ldr	r0, [sp, #56]	; 0x38
    159c:	e0020293 	mul	r2, r3, r2
    15a0:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
    15a4:	e3530000 	cmp	r3, #0
    15a8:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    15ac:	e1e06003 	mvn	r6, r3
    15b0:	e1a030a2 	lsr	r3, r2, #1
    15b4:	e0866009 	add	r6, r6, r9
    15b8:	e0811003 	add	r1, r1, r3
    15bc:	e0261690 	mla	r6, r0, r6, r1
    15c0:	0affff5e 	beq	1340 <ipu_update_channel_offset+0x6b0>
    15c4:	e0433002 	sub	r3, r3, r2
    15c8:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    15cc:	e3a09000 	mov	r9, #0
    15d0:	e1a0b009 	mov	fp, r9
    15d4:	e58d903c 	str	r9, [sp, #60]	; 0x3c
    15d8:	e0833002 	add	r3, r3, r2
    15dc:	e1560003 	cmp	r6, r3
    15e0:	31a06003 	movcc	r6, r3
    15e4:	eafffe2e 	b	ea4 <ipu_update_channel_offset+0x214>
    15e8:	e3043934 	movw	r3, #18740	; 0x4934
    15ec:	e3453338 	movt	r3, #21304	; 0x5338
    15f0:	e1560003 	cmp	r6, r3
    15f4:	0affff6c 	beq	13ac <ipu_update_channel_offset+0x71c>
    15f8:	9a000020 	bls	1680 <ipu_update_channel_offset+0x9f0>
    15fc:	e3053941 	movw	r3, #22849	; 0x5941
    1600:	e3453655 	movt	r3, #22101	; 0x5655
    1604:	e1560003 	cmp	r6, r3
    1608:	0affff67 	beq	13ac <ipu_update_channel_offset+0x71c>
    160c:	9a00004d 	bls	1748 <ipu_update_channel_offset+0xab8>
    1610:	e3053559 	movw	r3, #21849	; 0x5559
    1614:	e3453659 	movt	r3, #22105	; 0x5659
    1618:	e1560003 	cmp	r6, r3
    161c:	0affff62 	beq	13ac <ipu_update_channel_offset+0x71c>
    1620:	e3053955 	movw	r3, #22869	; 0x5955
    1624:	e3453956 	movt	r3, #22870	; 0x5956
    1628:	e1560003 	cmp	r6, r3
    162c:	1afffefc 	bne	1224 <ipu_update_channel_offset+0x594>
    1630:	eaffff5d 	b	13ac <ipu_update_channel_offset+0x71c>
    1634:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    1638:	e3520000 	cmp	r2, #0
    163c:	0afffe15 	beq	e98 <ipu_update_channel_offset+0x208>
    1640:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    1644:	e59d0038 	ldr	r0, [sp, #56]	; 0x38
    1648:	e0090092 	mul	r9, r2, r0
    164c:	eafffec3 	b	1160 <ipu_update_channel_offset+0x4d0>
    1650:	e3530000 	cmp	r3, #0
    1654:	1affff31 	bne	1320 <ipu_update_channel_offset+0x690>
    1658:	e59d903c 	ldr	r9, [sp, #60]	; 0x3c
    165c:	eafffe27 	b	f00 <ipu_update_channel_offset+0x270>
    1660:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    1664:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    1668:	e0090c91 	mul	r9, r1, ip
    166c:	eaffffa2 	b	14fc <ipu_update_channel_offset+0x86c>
    1670:	e59d1044 	ldr	r1, [sp, #68]	; 0x44
    1674:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    1678:	e0090c91 	mul	r9, r1, ip
    167c:	eaffff6e 	b	143c <ipu_update_channel_offset+0x7ac>
    1680:	e3043935 	movw	r3, #18741	; 0x4935
    1684:	e3453334 	movt	r3, #21300	; 0x5334
    1688:	e1560003 	cmp	r6, r3
    168c:	0affff46 	beq	13ac <ipu_update_channel_offset+0x71c>
    1690:	e3053035 	movw	r3, #20533	; 0x5035
    1694:	e3453334 	movt	r3, #21300	; 0x5334
    1698:	e1560003 	cmp	r6, r3
    169c:	0affff42 	beq	13ac <ipu_update_channel_offset+0x71c>
    16a0:	e3043241 	movw	r3, #16961	; 0x4241
    16a4:	e3453247 	movt	r3, #21063	; 0x5247
    16a8:	e1560003 	cmp	r6, r3
    16ac:	1afffedc 	bne	1224 <ipu_update_channel_offset+0x594>
    16b0:	eaffff3d 	b	13ac <ipu_update_channel_offset+0x71c>
    16b4:	e3033459 	movw	r3, #13401	; 0x3459
    16b8:	e3433434 	movt	r3, #13364	; 0x3434
    16bc:	e1560003 	cmp	r6, r3
    16c0:	1afffed7 	bne	1224 <ipu_update_channel_offset+0x594>
    16c4:	eaffff38 	b	13ac <ipu_update_channel_offset+0x71c>
    16c8:	e305364e 	movw	r3, #22094	; 0x564e
    16cc:	e3433231 	movt	r3, #12849	; 0x3231
    16d0:	e1560003 	cmp	r6, r3
    16d4:	0affffac 	beq	158c <ipu_update_channel_offset+0x8fc>
    16d8:	eafffed1 	b	1224 <ipu_update_channel_offset+0x594>
    16dc:	e305364e 	movw	r3, #22094	; 0x564e
    16e0:	e3433136 	movt	r3, #12598	; 0x3136
    16e4:	e1560003 	cmp	r6, r3
    16e8:	0affffa7 	beq	158c <ipu_update_channel_offset+0x8fc>
    16ec:	eafffecc 	b	1224 <ipu_update_channel_offset+0x594>
    16f0:	e3433342 	movt	r3, #13122	; 0x3342
    16f4:	e1560003 	cmp	r6, r3
    16f8:	0affff2b 	beq	13ac <ipu_update_channel_offset+0x71c>
    16fc:	e3043742 	movw	r3, #18242	; 0x4742
    1700:	e3433352 	movt	r3, #13138	; 0x3352
    1704:	e1560003 	cmp	r6, r3
    1708:	0affff27 	beq	13ac <ipu_update_channel_offset+0x71c>
    170c:	e3053049 	movw	r3, #20553	; 0x5049
    1710:	e3433255 	movt	r3, #12885	; 0x3255
    1714:	e1560003 	cmp	r6, r3
    1718:	1afffec1 	bne	1224 <ipu_update_channel_offset+0x594>
    171c:	eaffff22 	b	13ac <ipu_update_channel_offset+0x71c>
    1720:	e3043752 	movw	r3, #18258	; 0x4752
    1724:	e3443142 	movt	r3, #16706	; 0x4142
    1728:	e1560003 	cmp	r6, r3
    172c:	1afffebc 	bne	1224 <ipu_update_channel_offset+0x594>
    1730:	eaffff1d 	b	13ac <ipu_update_channel_offset+0x71c>
    1734:	e3043752 	movw	r3, #18258	; 0x4752
    1738:	e3453042 	movt	r3, #20546	; 0x5042
    173c:	e1560003 	cmp	r6, r3
    1740:	1afffeb7 	bne	1224 <ipu_update_channel_offset+0x594>
    1744:	eaffff18 	b	13ac <ipu_update_channel_offset+0x71c>
    1748:	e3053034 	movw	r3, #20532	; 0x5034
    174c:	e3453338 	movt	r3, #21304	; 0x5338
    1750:	e1560003 	cmp	r6, r3
    1754:	1afffeb2 	bne	1224 <ipu_update_channel_offset+0x594>
    1758:	eaffff13 	b	13ac <ipu_update_channel_offset+0x71c>

0000175c <ipu_select_buffer>:
    175c:	e0822082 	add	r2, r2, r2, lsl #1
    1760:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    1764:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    1768:	e1a04082 	lsl	r4, r2, #1
    176c:	e2866020 	add	r6, r6, #32
    1770:	e1a07003 	mov	r7, r3
    1774:	e1a05000 	mov	r5, r0
    1778:	e1a00006 	mov	r0, r6
    177c:	e1a04431 	lsr	r4, r1, r4
    1780:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    1784:	e3570000 	cmp	r7, #0
    1788:	e1a08000 	mov	r8, r0
    178c:	e204c03f 	and	ip, r4, #63	; 0x3f
    1790:	1a000014 	bne	17e8 <ipu_select_buffer+0x8c>
    1794:	e5953004 	ldr	r3, [r5, #4]
    1798:	e35c003f 	cmp	ip, #63	; 0x3f
    179c:	1204401f 	andne	r4, r4, #31
    17a0:	e1a0c2ac 	lsr	ip, ip, #5
    17a4:	13a07001 	movne	r7, #1
    17a8:	11a07417 	lslne	r7, r7, r4
    17ac:	e3530000 	cmp	r3, #0
    17b0:	128cc09a 	addne	ip, ip, #154	; 0x9a
    17b4:	028cc050 	addeq	ip, ip, #80	; 0x50
    17b8:	e1a0910c 	lsl	r9, ip, #2
    17bc:	f57ff04e 	dsb	st
    17c0:	e2855a01 	add	r5, r5, #4096	; 0x1000
    17c4:	ebfffffe 	bl	0 <arm_heavy_mb>
    17c8:	e595cd48 	ldr	ip, [r5, #3400]	; 0xd48
    17cc:	e08c9009 	add	r9, ip, r9
    17d0:	e5897000 	str	r7, [r9]
    17d4:	e1a00006 	mov	r0, r6
    17d8:	e1a01008 	mov	r1, r8
    17dc:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    17e0:	e3a00000 	mov	r0, #0
    17e4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    17e8:	e3570001 	cmp	r7, #1
    17ec:	0a000011 	beq	1838 <ipu_select_buffer+0xdc>
    17f0:	e5953004 	ldr	r3, [r5, #4]
    17f4:	e35c003f 	cmp	ip, #63	; 0x3f
    17f8:	1204401f 	andne	r4, r4, #31
    17fc:	13a01001 	movne	r1, #1
    1800:	11a04411 	lslne	r4, r1, r4
    1804:	03a04000 	moveq	r4, #0
    1808:	e3530000 	cmp	r3, #0
    180c:	11a072ac 	lsrne	r7, ip, #5
    1810:	03a07f4b 	moveq	r7, #300	; 0x12c
    1814:	128770a2 	addne	r7, r7, #162	; 0xa2
    1818:	11a07107 	lslne	r7, r7, #2
    181c:	f57ff04e 	dsb	st
    1820:	e2855a01 	add	r5, r5, #4096	; 0x1000
    1824:	ebfffffe 	bl	0 <arm_heavy_mb>
    1828:	e595cd48 	ldr	ip, [r5, #3400]	; 0xd48
    182c:	e08c7007 	add	r7, ip, r7
    1830:	e5874000 	str	r4, [r7]
    1834:	eaffffe6 	b	17d4 <ipu_select_buffer+0x78>
    1838:	e5953004 	ldr	r3, [r5, #4]
    183c:	e35c003f 	cmp	ip, #63	; 0x3f
    1840:	1204201f 	andne	r2, r4, #31
    1844:	e1a0c2ac 	lsr	ip, ip, #5
    1848:	11a07217 	lslne	r7, r7, r2
    184c:	03a07000 	moveq	r7, #0
    1850:	e3530000 	cmp	r3, #0
    1854:	128cc09c 	addne	ip, ip, #156	; 0x9c
    1858:	028cc052 	addeq	ip, ip, #82	; 0x52
    185c:	e1a0910c 	lsl	r9, ip, #2
    1860:	f57ff04e 	dsb	st
    1864:	e2855a01 	add	r5, r5, #4096	; 0x1000
    1868:	ebfffffe 	bl	0 <arm_heavy_mb>
    186c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    1870:	e0839009 	add	r9, r3, r9
    1874:	e5897000 	str	r7, [r9]
    1878:	eaffffd5 	b	17d4 <ipu_select_buffer+0x78>

0000187c <ipu_select_multi_vdi_buffer>:
    187c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    1880:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    1884:	e2855020 	add	r5, r5, #32
    1888:	e1a04000 	mov	r4, r0
    188c:	e1a07001 	mov	r7, r1
    1890:	e1a00005 	mov	r0, r5
    1894:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    1898:	e3570000 	cmp	r7, #0
    189c:	e1a06000 	mov	r6, r0
    18a0:	e5943004 	ldr	r3, [r4, #4]
    18a4:	1a00000e 	bne	18e4 <ipu_select_multi_vdi_buffer+0x68>
    18a8:	e3530000 	cmp	r3, #0
    18ac:	13a07f9a 	movne	r7, #616	; 0x268
    18b0:	03a07d05 	moveq	r7, #320	; 0x140
    18b4:	f57ff04e 	dsb	st
    18b8:	e2844a01 	add	r4, r4, #4096	; 0x1000
    18bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    18c0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    18c4:	e3a02c07 	mov	r2, #1792	; 0x700
    18c8:	e0833007 	add	r3, r3, r7
    18cc:	e5832000 	str	r2, [r3]
    18d0:	e1a00005 	mov	r0, r5
    18d4:	e1a01006 	mov	r1, r6
    18d8:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    18dc:	e3a00000 	mov	r0, #0
    18e0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    18e4:	e3530000 	cmp	r3, #0
    18e8:	13a07e27 	movne	r7, #624	; 0x270
    18ec:	03a07f52 	moveq	r7, #328	; 0x148
    18f0:	eaffffef 	b	18b4 <ipu_select_multi_vdi_buffer+0x38>

000018f4 <ipu_err_irq_handler>:
    18f4:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    18f8:	e2816d79 	add	r6, r1, #7744	; 0x1e40
    18fc:	e59fe108 	ldr	lr, [pc, #264]	; 1a0c <ipu_err_irq_handler+0x118>
    1900:	e1a05001 	mov	r5, r1
    1904:	e24dd01c 	sub	sp, sp, #28
    1908:	e286601c 	add	r6, r6, #28
    190c:	e28dc004 	add	ip, sp, #4
    1910:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    1914:	e59ee000 	ldr	lr, [lr]
    1918:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    191c:	e1a00006 	mov	r0, r6
    1920:	e58ce000 	str	lr, [ip]
    1924:	ebfffffe 	bl	0 <_raw_spin_lock>
    1928:	e59d3004 	ldr	r3, [sp, #4]
    192c:	e3530000 	cmp	r3, #0
    1930:	0a000030 	beq	19f8 <ipu_err_irq_handler+0x104>
    1934:	e28d4004 	add	r4, sp, #4
    1938:	e2857a01 	add	r7, r5, #4096	; 0x1000
    193c:	e5951004 	ldr	r1, [r5, #4]
    1940:	e2832039 	add	r2, r3, #57	; 0x39
    1944:	e283307f 	add	r3, r3, #127	; 0x7f
    1948:	e1a02102 	lsl	r2, r2, #2
    194c:	e3510000 	cmp	r1, #0
    1950:	11a02103 	lslne	r2, r3, #2
    1954:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    1958:	e0832002 	add	r2, r3, r2
    195c:	e5921000 	ldr	r1, [r2]
    1960:	f57ff04f 	dsb	sy
    1964:	e4942004 	ldr	r2, [r4], #4
    1968:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    196c:	e282200e 	add	r2, r2, #14
    1970:	e0833102 	add	r3, r3, r2, lsl #2
    1974:	e5933000 	ldr	r3, [r3]
    1978:	f57ff04f 	dsb	sy
    197c:	e0139001 	ands	r9, r3, r1
    1980:	0a000019 	beq	19ec <ipu_err_irq_handler+0xf8>
    1984:	e5143004 	ldr	r3, [r4, #-4]
    1988:	e5952004 	ldr	r2, [r5, #4]
    198c:	e2838039 	add	r8, r3, #57	; 0x39
    1990:	e283307f 	add	r3, r3, #127	; 0x7f
    1994:	e3520000 	cmp	r2, #0
    1998:	e1a08108 	lsl	r8, r8, #2
    199c:	11a08103 	lslne	r8, r3, #2
    19a0:	f57ff04e 	dsb	st
    19a4:	ebfffffe 	bl	0 <arm_heavy_mb>
    19a8:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    19ac:	e0838008 	add	r8, r3, r8
    19b0:	e5889000 	str	r9, [r8]
    19b4:	e5142004 	ldr	r2, [r4, #-4]
    19b8:	e282200e 	add	r2, r2, #14
    19bc:	e0833102 	add	r3, r3, r2, lsl #2
    19c0:	e5933000 	ldr	r3, [r3]
    19c4:	f57ff04f 	dsb	sy
    19c8:	e5148004 	ldr	r8, [r4, #-4]
    19cc:	e1c39009 	bic	r9, r3, r9
    19d0:	e288800e 	add	r8, r8, #14
    19d4:	e1a08108 	lsl	r8, r8, #2
    19d8:	f57ff04e 	dsb	st
    19dc:	ebfffffe 	bl	0 <arm_heavy_mb>
    19e0:	e5972d48 	ldr	r2, [r7, #3400]	; 0xd48
    19e4:	e0828008 	add	r8, r2, r8
    19e8:	e5889000 	str	r9, [r8]
    19ec:	e5943000 	ldr	r3, [r4]
    19f0:	e3530000 	cmp	r3, #0
    19f4:	1affffd0 	bne	193c <ipu_err_irq_handler+0x48>
    19f8:	e1a00006 	mov	r0, r6
    19fc:	ebfffffe 	bl	0 <_raw_spin_unlock>
    1a00:	e3a00001 	mov	r0, #1
    1a04:	e28dd01c 	add	sp, sp, #28
    1a08:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
    1a0c:	00000054 	andeq	r0, r0, r4, asr r0

00001a10 <ipu_update_channel_buffer>:
    1a10:	e300c000 	movw	ip, #0
    1a14:	e0822082 	add	r2, r2, r2, lsl #1
    1a18:	e340c000 	movt	ip, #0
    1a1c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1a20:	e1a05082 	lsl	r5, r2, #1
    1a24:	e1dce1b2 	ldrh	lr, [ip, #18]
    1a28:	e24dd014 	sub	sp, sp, #20
    1a2c:	e1a05531 	lsr	r5, r1, r5
    1a30:	e1a06000 	mov	r6, r0
    1a34:	e1a07003 	mov	r7, r3
    1a38:	e31e0004 	tst	lr, #4
    1a3c:	e2808a01 	add	r8, r0, #4096	; 0x1000
    1a40:	e205403f 	and	r4, r5, #63	; 0x3f
    1a44:	0a000006 	beq	1a64 <ipu_update_channel_buffer+0x54>
    1a48:	e3002000 	movw	r2, #0
    1a4c:	e5981d84 	ldr	r1, [r8, #3460]	; 0xd84
    1a50:	e1a0000c 	mov	r0, ip
    1a54:	e58d4000 	str	r4, [sp]
    1a58:	e3402000 	movt	r2, #0
    1a5c:	e59f323c 	ldr	r3, [pc, #572]	; 1ca0 <ipu_update_channel_buffer+0x290>
    1a60:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1a64:	e3570000 	cmp	r7, #0
    1a68:	e5963004 	ldr	r3, [r6, #4]
    1a6c:	1a00001b 	bne	1ae0 <ipu_update_channel_buffer+0xd0>
    1a70:	e3530000 	cmp	r3, #0
    1a74:	e1a032a4 	lsr	r3, r4, #5
    1a78:	1283309a 	addne	r3, r3, #154	; 0x9a
    1a7c:	02833050 	addeq	r3, r3, #80	; 0x50
    1a80:	e1a03103 	lsl	r3, r3, #2
    1a84:	e5982d48 	ldr	r2, [r8, #3400]	; 0xd48
    1a88:	e0823003 	add	r3, r2, r3
    1a8c:	e5933000 	ldr	r3, [r3]
    1a90:	f57ff04f 	dsb	sy
    1a94:	e354003f 	cmp	r4, #63	; 0x3f
    1a98:	0a000066 	beq	1c38 <ipu_update_channel_buffer+0x228>
    1a9c:	e205501f 	and	r5, r5, #31
    1aa0:	e3a02001 	mov	r2, #1
    1aa4:	e0133512 	ands	r3, r3, r2, lsl r5
    1aa8:	1a00007a 	bne	1c98 <ipu_update_channel_buffer+0x288>
    1aac:	e3570002 	cmp	r7, #2
    1ab0:	1a000023 	bne	1b44 <ipu_update_channel_buffer+0x134>
    1ab4:	e2444008 	sub	r4, r4, #8
    1ab8:	e3540014 	cmp	r4, #20
    1abc:	8a000016 	bhi	1b1c <ipu_update_channel_buffer+0x10c>
    1ac0:	e3002000 	movw	r2, #0
    1ac4:	e3402000 	movt	r2, #0
    1ac8:	e7924104 	ldr	r4, [r2, r4, lsl #2]
    1acc:	e3540000 	cmp	r4, #0
    1ad0:	1a000067 	bne	1c74 <ipu_update_channel_buffer+0x264>
    1ad4:	e3a00000 	mov	r0, #0
    1ad8:	e28dd014 	add	sp, sp, #20
    1adc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1ae0:	e3570001 	cmp	r7, #1
    1ae4:	0a00004d 	beq	1c20 <ipu_update_channel_buffer+0x210>
    1ae8:	e3530000 	cmp	r3, #0
    1aec:	11a032a4 	lsrne	r3, r4, #5
    1af0:	03a02f4b 	moveq	r2, #300	; 0x12c
    1af4:	128330a2 	addne	r3, r3, #162	; 0xa2
    1af8:	11a02103 	lslne	r2, r3, #2
    1afc:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    1b00:	e0833002 	add	r3, r3, r2
    1b04:	e5933000 	ldr	r3, [r3]
    1b08:	f57ff04f 	dsb	sy
    1b0c:	e354003f 	cmp	r4, #63	; 0x3f
    1b10:	1affffe1 	bne	1a9c <ipu_update_channel_buffer+0x8c>
    1b14:	e3570002 	cmp	r7, #2
    1b18:	1a000046 	bne	1c38 <ipu_update_channel_buffer+0x228>
    1b1c:	e3a05000 	mov	r5, #0
    1b20:	e30faaa0 	movw	sl, #64160	; 0xfaa0
    1b24:	e30f4ea0 	movw	r4, #65184	; 0xfea0
    1b28:	e58d500c 	str	r5, [sp, #12]
    1b2c:	e1a0b005 	mov	fp, r5
    1b30:	e1a09005 	mov	r9, r5
    1b34:	e34fafff 	movt	sl, #65535	; 0xffff
    1b38:	e34f4fff 	movt	r4, #65535	; 0xffff
    1b3c:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1b40:	ea000014 	b	1b98 <ipu_update_channel_buffer+0x188>
    1b44:	e0673187 	rsb	r3, r7, r7, lsl #3
    1b48:	e1a04204 	lsl	r4, r4, #4
    1b4c:	e0873103 	add	r3, r7, r3, lsl #2
    1b50:	e3e0620e 	mvn	r6, #-536870912	; 0xe0000000
    1b54:	e3530000 	cmp	r3, #0
    1b58:	e283201f 	add	r2, r3, #31
    1b5c:	a1a02003 	movge	r2, r3
    1b60:	e2731000 	rsbs	r1, r3, #0
    1b64:	e1a092c2 	asr	r9, r2, #5
    1b68:	e201101f 	and	r1, r1, #31
    1b6c:	e203b01f 	and	fp, r3, #31
    1b70:	e289a008 	add	sl, r9, #8
    1b74:	5261b000 	rsbpl	fp, r1, #0
    1b78:	e08aa004 	add	sl, sl, r4
    1b7c:	e293501c 	adds	r5, r3, #28
    1b80:	4283303b 	addmi	r3, r3, #59	; 0x3b
    1b84:	51a03005 	movpl	r3, r5
    1b88:	e1a0a10a 	lsl	sl, sl, #2
    1b8c:	e1e01b16 	mvn	r1, r6, lsl fp
    1b90:	e1a052c3 	asr	r5, r3, #5
    1b94:	e58d900c 	str	r9, [sp, #12]
    1b98:	e5983d78 	ldr	r3, [r8, #3448]	; 0xd78
    1b9c:	e083300a 	add	r3, r3, sl
    1ba0:	e5936000 	ldr	r6, [r3]
    1ba4:	f57ff04f 	dsb	sy
    1ba8:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    1bac:	e0066001 	and	r6, r6, r1
    1bb0:	e1a071a3 	lsr	r7, r3, #3
    1bb4:	e1866b17 	orr	r6, r6, r7, lsl fp
    1bb8:	f57ff04e 	dsb	st
    1bbc:	ebfffffe 	bl	0 <arm_heavy_mb>
    1bc0:	e5983d78 	ldr	r3, [r8, #3448]	; 0xd78
    1bc4:	e083a00a 	add	sl, r3, sl
    1bc8:	e58a6000 	str	r6, [sl]
    1bcc:	e1590005 	cmp	r9, r5
    1bd0:	aaffffbf 	bge	1ad4 <ipu_update_channel_buffer+0xc4>
    1bd4:	e59d200c 	ldr	r2, [sp, #12]
    1bd8:	e0824004 	add	r4, r2, r4
    1bdc:	e2844009 	add	r4, r4, #9
    1be0:	e1a04104 	lsl	r4, r4, #2
    1be4:	e0833004 	add	r3, r3, r4
    1be8:	e5933000 	ldr	r3, [r3]
    1bec:	f57ff04f 	dsb	sy
    1bf0:	e3e0220e 	mvn	r2, #-536870912	; 0xe0000000
    1bf4:	e35b0000 	cmp	fp, #0
    1bf8:	e26bb020 	rsb	fp, fp, #32
    1bfc:	e1c33b32 	bic	r3, r3, r2, lsr fp
    1c00:	11a07b37 	lsrne	r7, r7, fp
    1c04:	e1837007 	orr	r7, r3, r7
    1c08:	f57ff04e 	dsb	st
    1c0c:	ebfffffe 	bl	0 <arm_heavy_mb>
    1c10:	e5989d78 	ldr	r9, [r8, #3448]	; 0xd78
    1c14:	e0894004 	add	r4, r9, r4
    1c18:	e5847000 	str	r7, [r4]
    1c1c:	eaffffac 	b	1ad4 <ipu_update_channel_buffer+0xc4>
    1c20:	e3530000 	cmp	r3, #0
    1c24:	e1a032a4 	lsr	r3, r4, #5
    1c28:	1283309c 	addne	r3, r3, #156	; 0x9c
    1c2c:	02833052 	addeq	r3, r3, #82	; 0x52
    1c30:	e1a03103 	lsl	r3, r3, #2
    1c34:	eaffff92 	b	1a84 <ipu_update_channel_buffer+0x74>
    1c38:	e0673187 	rsb	r3, r7, r7, lsl #3
    1c3c:	e3e0620e 	mvn	r6, #-536870912	; 0xe0000000
    1c40:	e3a04e3f 	mov	r4, #1008	; 0x3f0
    1c44:	e0873103 	add	r3, r7, r3, lsl #2
    1c48:	e3530000 	cmp	r3, #0
    1c4c:	e283201f 	add	r2, r3, #31
    1c50:	a1a02003 	movge	r2, r3
    1c54:	e2731000 	rsbs	r1, r3, #0
    1c58:	e1a092c2 	asr	r9, r2, #5
    1c5c:	e201101f 	and	r1, r1, #31
    1c60:	e203b01f 	and	fp, r3, #31
    1c64:	e289affe 	add	sl, r9, #1016	; 0x3f8
    1c68:	5261b000 	rsbpl	fp, r1, #0
    1c6c:	e293501c 	adds	r5, r3, #28
    1c70:	eaffffc2 	b	1b80 <ipu_update_channel_buffer+0x170>
    1c74:	e1a04204 	lsl	r4, r4, #4
    1c78:	e1a05003 	mov	r5, r3
    1c7c:	e58d300c 	str	r3, [sp, #12]
    1c80:	e1a0b003 	mov	fp, r3
    1c84:	e284a008 	add	sl, r4, #8
    1c88:	e1a09003 	mov	r9, r3
    1c8c:	e1a0a10a 	lsl	sl, sl, #2
    1c90:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1c94:	eaffffbf 	b	1b98 <ipu_update_channel_buffer+0x188>
    1c98:	e3e0000c 	mvn	r0, #12
    1c9c:	eaffff8d 	b	1ad8 <ipu_update_channel_buffer+0xc8>
    1ca0:	00000068 	andeq	r0, r0, r8, rrx

00001ca4 <ipu_set_channel_bandmode>:
    1ca4:	e0822082 	add	r2, r2, r2, lsl #1
    1ca8:	e243c002 	sub	ip, r3, #2
    1cac:	e35c0006 	cmp	ip, #6
    1cb0:	e1a02082 	lsl	r2, r2, #1
    1cb4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    1cb8:	e24dd008 	sub	sp, sp, #8
    1cbc:	e1a04231 	lsr	r4, r1, r2
    1cc0:	8a000061 	bhi	1e4c <ipu_set_channel_bandmode+0x1a8>
    1cc4:	e2808d79 	add	r8, r0, #7744	; 0x1e40
    1cc8:	e2888008 	add	r8, r8, #8
    1ccc:	e1a0a000 	mov	sl, r0
    1cd0:	e1a00008 	mov	r0, r8
    1cd4:	e1a07003 	mov	r7, r3
    1cd8:	ebfffffe 	bl	0 <mutex_lock>
    1cdc:	e59a3004 	ldr	r3, [sl, #4]
    1ce0:	e204903f 	and	r9, r4, #63	; 0x3f
    1ce4:	e1a052a9 	lsr	r5, r9, #5
    1ce8:	e28a6a01 	add	r6, sl, #4096	; 0x1000
    1cec:	e3530000 	cmp	r3, #0
    1cf0:	12853010 	addne	r3, r5, #16
    1cf4:	0285300d 	addeq	r3, r5, #13
    1cf8:	e1a02103 	lsl	r2, r3, #2
    1cfc:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    1d00:	e0833002 	add	r3, r3, r2
    1d04:	e5931000 	ldr	r1, [r3]
    1d08:	f57ff04f 	dsb	sy
    1d0c:	e59a3004 	ldr	r3, [sl, #4]
    1d10:	e3a02001 	mov	r2, #1
    1d14:	e204401f 	and	r4, r4, #31
    1d18:	e1814412 	orr	r4, r1, r2, lsl r4
    1d1c:	e3530000 	cmp	r3, #0
    1d20:	12855010 	addne	r5, r5, #16
    1d24:	0285500d 	addeq	r5, r5, #13
    1d28:	e1a05105 	lsl	r5, r5, #2
    1d2c:	f57ff04e 	dsb	st
    1d30:	ebfffffe 	bl	0 <arm_heavy_mb>
    1d34:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    1d38:	e0835005 	add	r5, r3, r5
    1d3c:	e5854000 	str	r4, [r5]
    1d40:	e1a04309 	lsl	r4, r9, #6
    1d44:	e5963d78 	ldr	r3, [r6, #3448]	; 0xd78
    1d48:	e284400c 	add	r4, r4, #12
    1d4c:	e0833004 	add	r3, r3, r4
    1d50:	e593a000 	ldr	sl, [r3]
    1d54:	f57ff04f 	dsb	sy
    1d58:	e2475001 	sub	r5, r7, #1
    1d5c:	e1a05905 	lsl	r5, r5, #18
    1d60:	e18aa005 	orr	sl, sl, r5
    1d64:	f57ff04e 	dsb	st
    1d68:	ebfffffe 	bl	0 <arm_heavy_mb>
    1d6c:	e5962d78 	ldr	r2, [r6, #3448]	; 0xd78
    1d70:	e0823004 	add	r3, r2, r4
    1d74:	e583a000 	str	sl, [r3]
    1d78:	e2493008 	sub	r3, r9, #8
    1d7c:	e3530014 	cmp	r3, #20
    1d80:	9a000012 	bls	1dd0 <ipu_set_channel_bandmode+0x12c>
    1d84:	e3005000 	movw	r5, #0
    1d88:	e3405000 	movt	r5, #0
    1d8c:	e1d534b2 	ldrh	r3, [r5, #66]	; 0x42
    1d90:	e3130004 	tst	r3, #4
    1d94:	0a000008 	beq	1dbc <ipu_set_channel_bandmode+0x118>
    1d98:	e3a03001 	mov	r3, #1
    1d9c:	e3002000 	movw	r2, #0
    1da0:	e1a07713 	lsl	r7, r3, r7
    1da4:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    1da8:	e1a03009 	mov	r3, r9
    1dac:	e59f00a0 	ldr	r0, [pc, #160]	; 1e54 <ipu_set_channel_bandmode+0x1b0>
    1db0:	e58d7000 	str	r7, [sp]
    1db4:	e3402000 	movt	r2, #0
    1db8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1dbc:	e1a00008 	mov	r0, r8
    1dc0:	ebfffffe 	bl	0 <mutex_unlock>
    1dc4:	e3a00000 	mov	r0, #0
    1dc8:	e28dd008 	add	sp, sp, #8
    1dcc:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    1dd0:	e3001000 	movw	r1, #0
    1dd4:	e3401000 	movt	r1, #0
    1dd8:	e7913103 	ldr	r3, [r1, r3, lsl #2]
    1ddc:	e3530000 	cmp	r3, #0
    1de0:	daffffe7 	ble	1d84 <ipu_set_channel_bandmode+0xe0>
    1de4:	e1a03303 	lsl	r3, r3, #6
    1de8:	e283a00c 	add	sl, r3, #12
    1dec:	e082200a 	add	r2, r2, sl
    1df0:	e5923000 	ldr	r3, [r2]
    1df4:	f57ff04f 	dsb	sy
    1df8:	e1855003 	orr	r5, r5, r3
    1dfc:	f57ff04e 	dsb	st
    1e00:	ebfffffe 	bl	0 <arm_heavy_mb>
    1e04:	e5963d78 	ldr	r3, [r6, #3448]	; 0xd78
    1e08:	e083a00a 	add	sl, r3, sl
    1e0c:	e58a5000 	str	r5, [sl]
    1e10:	e3005000 	movw	r5, #0
    1e14:	e3405000 	movt	r5, #0
    1e18:	e1d522ba 	ldrh	r2, [r5, #42]	; 0x2a
    1e1c:	e3120004 	tst	r2, #4
    1e20:	0affffd9 	beq	1d8c <ipu_set_channel_bandmode+0xe8>
    1e24:	e0834004 	add	r4, r3, r4
    1e28:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    1e2c:	e5943000 	ldr	r3, [r4]
    1e30:	f57ff04f 	dsb	sy
    1e34:	e3002000 	movw	r2, #0
    1e38:	e7e23953 	ubfx	r3, r3, #18, #3
    1e3c:	e2850018 	add	r0, r5, #24
    1e40:	e3402000 	movt	r2, #0
    1e44:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1e48:	eaffffcf 	b	1d8c <ipu_set_channel_bandmode+0xe8>
    1e4c:	e3e00015 	mvn	r0, #21
    1e50:	eaffffdc 	b	1dc8 <ipu_set_channel_bandmode+0x124>
    1e54:	00000030 	andeq	r0, r0, r0, lsr r0

00001e58 <ipu_link_channels>:
    1e58:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1e5c:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    1e60:	e2866008 	add	r6, r6, #8
    1e64:	e2804a01 	add	r4, r0, #4096	; 0x1000
    1e68:	e1a00006 	mov	r0, r6
    1e6c:	e1a05001 	mov	r5, r1
    1e70:	e1a07002 	mov	r7, r2
    1e74:	ebfffffe 	bl	0 <mutex_lock>
    1e78:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e7c:	e59390a8 	ldr	r9, [r3, #168]	; 0xa8
    1e80:	f57ff04f 	dsb	sy
    1e84:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e88:	e59380ac 	ldr	r8, [r3, #172]	; 0xac
    1e8c:	f57ff04f 	dsb	sy
    1e90:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e94:	e593b0b0 	ldr	fp, [r3, #176]	; 0xb0
    1e98:	f57ff04f 	dsb	sy
    1e9c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1ea0:	e593a0b4 	ldr	sl, [r3, #180]	; 0xb4
    1ea4:	f57ff04f 	dsb	sy
    1ea8:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    1eac:	e3403fff 	movt	r3, #4095	; 0xfff
    1eb0:	e1550003 	cmp	r5, r3
    1eb4:	0a0000fe 	beq	22b4 <ipu_link_channels+0x45c>
    1eb8:	da000012 	ble	1f08 <ipu_link_channels+0xb0>
    1ebc:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    1ec0:	e34133ff 	movt	r3, #5119	; 0x13ff
    1ec4:	e1550003 	cmp	r5, r3
    1ec8:	0a00001f 	beq	1f4c <ipu_link_channels+0xf4>
    1ecc:	ca000026 	bgt	1f6c <ipu_link_channels+0x114>
    1ed0:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    1ed4:	e34131ff 	movt	r3, #4607	; 0x11ff
    1ed8:	e1550003 	cmp	r5, r3
    1edc:	0a000088 	beq	2104 <ipu_link_channels+0x2ac>
    1ee0:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    1ee4:	e34132ff 	movt	r3, #4863	; 0x12ff
    1ee8:	e1550003 	cmp	r5, r3
    1eec:	0a0000e8 	beq	2294 <ipu_link_channels+0x43c>
    1ef0:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    1ef4:	e34130ff 	movt	r3, #4351	; 0x10ff
    1ef8:	e1550003 	cmp	r5, r3
    1efc:	0a00008e 	beq	213c <ipu_link_channels+0x2e4>
    1f00:	e3e04015 	mvn	r4, #21
    1f04:	ea00007a 	b	20f4 <ipu_link_channels+0x29c>
    1f08:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    1f0c:	e34033bf 	movt	r3, #959	; 0x3bf
    1f10:	e1550003 	cmp	r5, r3
    1f14:	0a0000b2 	beq	21e4 <ipu_link_channels+0x38c>
    1f18:	da0000a1 	ble	21a4 <ipu_link_channels+0x34c>
    1f1c:	e30e3455 	movw	r3, #58453	; 0xe455
    1f20:	e3403530 	movt	r3, #1328	; 0x530
    1f24:	e1550003 	cmp	r5, r3
    1f28:	0a000019 	beq	1f94 <ipu_link_channels+0x13c>
    1f2c:	e30f3496 	movw	r3, #62614	; 0xf496
    1f30:	e340362c 	movt	r3, #1580	; 0x62c
    1f34:	e1550003 	cmp	r5, r3
    1f38:	0a0000b9 	beq	2224 <ipu_link_channels+0x3cc>
    1f3c:	e30e3454 	movw	r3, #58452	; 0xe454
    1f40:	e3403430 	movt	r3, #1072	; 0x430
    1f44:	e1550003 	cmp	r5, r3
    1f48:	1affffec 	bne	1f00 <ipu_link_channels+0xa8>
    1f4c:	e3003000 	movw	r3, #0
    1f50:	e1a02c47 	asr	r2, r7, #24
    1f54:	e3403000 	movt	r3, #0
    1f58:	e0832102 	add	r2, r3, r2, lsl #2
    1f5c:	e3c8800f 	bic	r8, r8, #15
    1f60:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    1f64:	e1888002 	orr	r8, r8, r2
    1f68:	ea000010 	b	1fb0 <ipu_link_channels+0x158>
    1f6c:	e30e3455 	movw	r3, #58453	; 0xe455
    1f70:	e3413624 	movt	r3, #5668	; 0x1624
    1f74:	e1550003 	cmp	r5, r3
    1f78:	0a000005 	beq	1f94 <ipu_link_channels+0x13c>
    1f7c:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    1f80:	0a0000af 	beq	2244 <ipu_link_channels+0x3ec>
    1f84:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    1f88:	e34134ff 	movt	r3, #5375	; 0x14ff
    1f8c:	e1550003 	cmp	r5, r3
    1f90:	1affffda 	bne	1f00 <ipu_link_channels+0xa8>
    1f94:	e3003000 	movw	r3, #0
    1f98:	e1a02c47 	asr	r2, r7, #24
    1f9c:	e3403000 	movt	r3, #0
    1fa0:	e0832102 	add	r2, r3, r2, lsl #2
    1fa4:	e3c880f0 	bic	r8, r8, #240	; 0xf0
    1fa8:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    1fac:	e1888202 	orr	r8, r8, r2, lsl #4
    1fb0:	e30f2fff 	movw	r2, #65535	; 0xffff
    1fb4:	e3402773 	movt	r2, #1907	; 0x773
    1fb8:	e1570002 	cmp	r7, r2
    1fbc:	0a0000ca 	beq	22ec <ipu_link_channels+0x494>
    1fc0:	da000016 	ble	2020 <ipu_link_channels+0x1c8>
    1fc4:	e30f2d3f 	movw	r2, #64831	; 0xfd3f
    1fc8:	e3402b63 	movt	r2, #2915	; 0xb63
    1fcc:	e1570002 	cmp	r7, r2
    1fd0:	0a0000d1 	beq	231c <ipu_link_channels+0x4c4>
    1fd4:	ca000060 	bgt	215c <ipu_link_channels+0x304>
    1fd8:	e30f2cff 	movw	r2, #64767	; 0xfcff
    1fdc:	e340295f 	movt	r2, #2399	; 0x95f
    1fe0:	e1570002 	cmp	r7, r2
    1fe4:	0a00004e 	beq	2124 <ipu_link_channels+0x2cc>
    1fe8:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    1fec:	e3402a6f 	movt	r2, #2671	; 0xa6f
    1ff0:	e1570002 	cmp	r7, r2
    1ff4:	0a0000ce 	beq	2334 <ipu_link_channels+0x4dc>
    1ff8:	e30f2fff 	movw	r2, #65535	; 0xffff
    1ffc:	e34028a7 	movt	r2, #2215	; 0x8a7
    2000:	e1570002 	cmp	r7, r2
    2004:	1affffbd 	bne	1f00 <ipu_link_channels+0xa8>
    2008:	e1a05c45 	asr	r5, r5, #24
    200c:	e3caa80f 	bic	sl, sl, #983040	; 0xf0000
    2010:	e0833105 	add	r3, r3, r5, lsl #2
    2014:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2018:	e18aa803 	orr	sl, sl, r3, lsl #16
    201c:	ea000023 	b	20b0 <ipu_link_channels+0x258>
    2020:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    2024:	e34023bf 	movt	r2, #959	; 0x3bf
    2028:	e1570002 	cmp	r7, r2
    202c:	0a0000b4 	beq	2304 <ipu_link_channels+0x4ac>
    2030:	da000011 	ble	207c <ipu_link_channels+0x224>
    2034:	e30e2455 	movw	r2, #58453	; 0xe455
    2038:	e3402530 	movt	r2, #1328	; 0x530
    203c:	e1570002 	cmp	r7, r2
    2040:	0a000007 	beq	2064 <ipu_link_channels+0x20c>
    2044:	e30f2496 	movw	r2, #62614	; 0xf496
    2048:	e340262c 	movt	r2, #1580	; 0x62c
    204c:	e1570002 	cmp	r7, r2
    2050:	0a0000bd 	beq	234c <ipu_link_channels+0x4f4>
    2054:	e30e2454 	movw	r2, #58452	; 0xe454
    2058:	e3402430 	movt	r2, #1072	; 0x430
    205c:	e1570002 	cmp	r7, r2
    2060:	1affffa6 	bne	1f00 <ipu_link_channels+0xa8>
    2064:	e1a05c45 	asr	r5, r5, #24
    2068:	e3c9940f 	bic	r9, r9, #251658240	; 0xf000000
    206c:	e0833105 	add	r3, r3, r5, lsl #2
    2070:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    2074:	e1899c03 	orr	r9, r9, r3, lsl #24
    2078:	ea00000c 	b	20b0 <ipu_link_channels+0x258>
    207c:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    2080:	e34021b7 	movt	r2, #439	; 0x1b7
    2084:	e1570002 	cmp	r7, r2
    2088:	0a000091 	beq	22d4 <ipu_link_channels+0x47c>
    208c:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    2090:	e34022bb 	movt	r2, #699	; 0x2bb
    2094:	e1570002 	cmp	r7, r2
    2098:	1affff98 	bne	1f00 <ipu_link_channels+0xa8>
    209c:	e1a05c45 	asr	r5, r5, #24
    20a0:	e3c99c0f 	bic	r9, r9, #3840	; 0xf00
    20a4:	e0833105 	add	r3, r3, r5, lsl #2
    20a8:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    20ac:	e1899403 	orr	r9, r9, r3, lsl #8
    20b0:	f57ff04e 	dsb	st
    20b4:	ebfffffe 	bl	0 <arm_heavy_mb>
    20b8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20bc:	e58390a8 	str	r9, [r3, #168]	; 0xa8
    20c0:	f57ff04e 	dsb	st
    20c4:	ebfffffe 	bl	0 <arm_heavy_mb>
    20c8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20cc:	e58380ac 	str	r8, [r3, #172]	; 0xac
    20d0:	f57ff04e 	dsb	st
    20d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    20d8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20dc:	e583b0b0 	str	fp, [r3, #176]	; 0xb0
    20e0:	f57ff04e 	dsb	st
    20e4:	ebfffffe 	bl	0 <arm_heavy_mb>
    20e8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20ec:	e583a0b4 	str	sl, [r3, #180]	; 0xb4
    20f0:	e3a04000 	mov	r4, #0
    20f4:	e1a00006 	mov	r0, r6
    20f8:	ebfffffe 	bl	0 <mutex_unlock>
    20fc:	e1a00004 	mov	r0, r4
    2100:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2104:	e3003000 	movw	r3, #0
    2108:	e1a02c47 	asr	r2, r7, #24
    210c:	e3403000 	movt	r3, #0
    2110:	e0832102 	add	r2, r3, r2, lsl #2
    2114:	e3cbbd1e 	bic	fp, fp, #1920	; 0x780
    2118:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    211c:	e18bb382 	orr	fp, fp, r2, lsl #7
    2120:	eaffffa2 	b	1fb0 <ipu_link_channels+0x158>
    2124:	e1a05c45 	asr	r5, r5, #24
    2128:	e3caa00f 	bic	sl, sl, #15
    212c:	e0833105 	add	r3, r3, r5, lsl #2
    2130:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2134:	e18aa003 	orr	sl, sl, r3
    2138:	eaffffdc 	b	20b0 <ipu_link_channels+0x258>
    213c:	e3003000 	movw	r3, #0
    2140:	e1a02c47 	asr	r2, r7, #24
    2144:	e3403000 	movt	r3, #0
    2148:	e0832102 	add	r2, r3, r2, lsl #2
    214c:	e3cbb070 	bic	fp, fp, #112	; 0x70
    2150:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    2154:	e18bb202 	orr	fp, fp, r2, lsl #4
    2158:	eaffff94 	b	1fb0 <ipu_link_channels+0x158>
    215c:	e30e2455 	movw	r2, #58453	; 0xe455
    2160:	e3412624 	movt	r2, #5668	; 0x1624
    2164:	e1570002 	cmp	r7, r2
    2168:	0affffbd 	beq	2064 <ipu_link_channels+0x20c>
    216c:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    2170:	e3412927 	movt	r2, #6439	; 0x1927
    2174:	e1570002 	cmp	r7, r2
    2178:	0a000040 	beq	2280 <ipu_link_channels+0x428>
    217c:	e30f287f 	movw	r2, #63615	; 0xf87f
    2180:	e3402c77 	movt	r2, #3191	; 0xc77
    2184:	e1570002 	cmp	r7, r2
    2188:	1affff5c 	bne	1f00 <ipu_link_channels+0xa8>
    218c:	e1a05c45 	asr	r5, r5, #24
    2190:	e3caaa0f 	bic	sl, sl, #61440	; 0xf000
    2194:	e0833105 	add	r3, r3, r5, lsl #2
    2198:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    219c:	e18aa603 	orr	sl, sl, r3, lsl #12
    21a0:	eaffffc2 	b	20b0 <ipu_link_channels+0x258>
    21a4:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    21a8:	e34031b7 	movt	r3, #439	; 0x1b7
    21ac:	e1550003 	cmp	r5, r3
    21b0:	0a000013 	beq	2204 <ipu_link_channels+0x3ac>
    21b4:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    21b8:	e34032bb 	movt	r3, #699	; 0x2bb
    21bc:	e1550003 	cmp	r5, r3
    21c0:	1affff4e 	bne	1f00 <ipu_link_channels+0xa8>
    21c4:	e3003000 	movw	r3, #0
    21c8:	e1a02c47 	asr	r2, r7, #24
    21cc:	e3403000 	movt	r3, #0
    21d0:	e0832102 	add	r2, r3, r2, lsl #2
    21d4:	e3c88c0f 	bic	r8, r8, #3840	; 0xf00
    21d8:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    21dc:	e1888402 	orr	r8, r8, r2, lsl #8
    21e0:	eaffff72 	b	1fb0 <ipu_link_channels+0x158>
    21e4:	e3003000 	movw	r3, #0
    21e8:	e1a02c47 	asr	r2, r7, #24
    21ec:	e3403000 	movt	r3, #0
    21f0:	e0832102 	add	r2, r3, r2, lsl #2
    21f4:	e3c8880f 	bic	r8, r8, #983040	; 0xf0000
    21f8:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    21fc:	e1888802 	orr	r8, r8, r2, lsl #16
    2200:	eaffff6a 	b	1fb0 <ipu_link_channels+0x158>
    2204:	e3003000 	movw	r3, #0
    2208:	e1a02c47 	asr	r2, r7, #24
    220c:	e3403000 	movt	r3, #0
    2210:	e0832102 	add	r2, r3, r2, lsl #2
    2214:	e3c8860f 	bic	r8, r8, #15728640	; 0xf00000
    2218:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    221c:	e1888a02 	orr	r8, r8, r2, lsl #20
    2220:	eaffff62 	b	1fb0 <ipu_link_channels+0x158>
    2224:	e3003000 	movw	r3, #0
    2228:	e1a02c47 	asr	r2, r7, #24
    222c:	e3403000 	movt	r3, #0
    2230:	e0832102 	add	r2, r3, r2, lsl #2
    2234:	e3c88a0f 	bic	r8, r8, #61440	; 0xf000
    2238:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    223c:	e1888602 	orr	r8, r8, r2, lsl #12
    2240:	eaffff5a 	b	1fb0 <ipu_link_channels+0x158>
    2244:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    2248:	e3cbb803 	bic	fp, fp, #196608	; 0x30000
    224c:	e3413927 	movt	r3, #6439	; 0x1927
    2250:	e1570003 	cmp	r7, r3
    2254:	038bb802 	orreq	fp, fp, #131072	; 0x20000
    2258:	03c99203 	biceq	r9, r9, #805306368	; 0x30000000
    225c:	0a00000a 	beq	228c <ipu_link_channels+0x434>
    2260:	e30f3496 	movw	r3, #62614	; 0xf496
    2264:	e340362c 	movt	r3, #1580	; 0x62c
    2268:	e1570003 	cmp	r7, r3
    226c:	1affff23 	bne	1f00 <ipu_link_channels+0xa8>
    2270:	e38bb801 	orr	fp, fp, #65536	; 0x10000
    2274:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    2278:	e3899902 	orr	r9, r9, #32768	; 0x8000
    227c:	eaffff8b 	b	20b0 <ipu_link_channels+0x258>
    2280:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    2284:	e3c99203 	bic	r9, r9, #805306368	; 0x30000000
    2288:	1affff1c 	bne	1f00 <ipu_link_channels+0xa8>
    228c:	e3899202 	orr	r9, r9, #536870912	; 0x20000000
    2290:	eaffff86 	b	20b0 <ipu_link_channels+0x258>
    2294:	e3003000 	movw	r3, #0
    2298:	e1a02c47 	asr	r2, r7, #24
    229c:	e3403000 	movt	r3, #0
    22a0:	e0832102 	add	r2, r3, r2, lsl #2
    22a4:	e3cbbb0e 	bic	fp, fp, #14336	; 0x3800
    22a8:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    22ac:	e18bb582 	orr	fp, fp, r2, lsl #11
    22b0:	eaffff3e 	b	1fb0 <ipu_link_channels+0x158>
    22b4:	e3003000 	movw	r3, #0
    22b8:	e1a02c47 	asr	r2, r7, #24
    22bc:	e3403000 	movt	r3, #0
    22c0:	e0832102 	add	r2, r3, r2, lsl #2
    22c4:	e3cbb00f 	bic	fp, fp, #15
    22c8:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    22cc:	e18bb002 	orr	fp, fp, r2
    22d0:	eaffff36 	b	1fb0 <ipu_link_channels+0x158>
    22d4:	e1a05c45 	asr	r5, r5, #24
    22d8:	e3c9900f 	bic	r9, r9, #15
    22dc:	e0833105 	add	r3, r3, r5, lsl #2
    22e0:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    22e4:	e1899003 	orr	r9, r9, r3
    22e8:	eaffff70 	b	20b0 <ipu_link_channels+0x258>
    22ec:	e1a05c45 	asr	r5, r5, #24
    22f0:	e3caa60f 	bic	sl, sl, #15728640	; 0xf00000
    22f4:	e0833105 	add	r3, r3, r5, lsl #2
    22f8:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    22fc:	e18aaa03 	orr	sl, sl, r3, lsl #20
    2300:	eaffff6a 	b	20b0 <ipu_link_channels+0x258>
    2304:	e1a05c45 	asr	r5, r5, #24
    2308:	e3c9980f 	bic	r9, r9, #983040	; 0xf0000
    230c:	e0833105 	add	r3, r3, r5, lsl #2
    2310:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    2314:	e1899803 	orr	r9, r9, r3, lsl #16
    2318:	eaffff64 	b	20b0 <ipu_link_channels+0x258>
    231c:	e1a05c45 	asr	r5, r5, #24
    2320:	e3caac0f 	bic	sl, sl, #3840	; 0xf00
    2324:	e0833105 	add	r3, r3, r5, lsl #2
    2328:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    232c:	e18aa403 	orr	sl, sl, r3, lsl #8
    2330:	eaffff5e 	b	20b0 <ipu_link_channels+0x258>
    2334:	e1a05c45 	asr	r5, r5, #24
    2338:	e3caa0f0 	bic	sl, sl, #240	; 0xf0
    233c:	e0833105 	add	r3, r3, r5, lsl #2
    2340:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2344:	e18aa203 	orr	sl, sl, r3, lsl #4
    2348:	eaffff58 	b	20b0 <ipu_link_channels+0x258>
    234c:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    2350:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    2354:	0affffc7 	beq	2278 <ipu_link_channels+0x420>
    2358:	e1a05c45 	asr	r5, r5, #24
    235c:	e0833105 	add	r3, r3, r5, lsl #2
    2360:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    2364:	e1899603 	orr	r9, r9, r3, lsl #12
    2368:	eaffff50 	b	20b0 <ipu_link_channels+0x258>

0000236c <ipu_unlink_channels>:
    236c:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2370:	e2807d79 	add	r7, r0, #7744	; 0x1e40
    2374:	e2877008 	add	r7, r7, #8
    2378:	e2804a01 	add	r4, r0, #4096	; 0x1000
    237c:	e1a00007 	mov	r0, r7
    2380:	e1a08001 	mov	r8, r1
    2384:	e1a05002 	mov	r5, r2
    2388:	ebfffffe 	bl	0 <mutex_lock>
    238c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2390:	e59390a8 	ldr	r9, [r3, #168]	; 0xa8
    2394:	f57ff04f 	dsb	sy
    2398:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    239c:	e59360ac 	ldr	r6, [r3, #172]	; 0xac
    23a0:	f57ff04f 	dsb	sy
    23a4:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    23a8:	e593b0b0 	ldr	fp, [r3, #176]	; 0xb0
    23ac:	f57ff04f 	dsb	sy
    23b0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    23b4:	e593a0b4 	ldr	sl, [r3, #180]	; 0xb4
    23b8:	f57ff04f 	dsb	sy
    23bc:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    23c0:	e3403fff 	movt	r3, #4095	; 0xfff
    23c4:	e1580003 	cmp	r8, r3
    23c8:	0a000098 	beq	2630 <ipu_unlink_channels+0x2c4>
    23cc:	da000012 	ble	241c <ipu_unlink_channels+0xb0>
    23d0:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    23d4:	e34133ff 	movt	r3, #5119	; 0x13ff
    23d8:	e1580003 	cmp	r8, r3
    23dc:	0a00001f 	beq	2460 <ipu_unlink_channels+0xf4>
    23e0:	ca000020 	bgt	2468 <ipu_unlink_channels+0xfc>
    23e4:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    23e8:	e34131ff 	movt	r3, #4607	; 0x11ff
    23ec:	e1580003 	cmp	r8, r3
    23f0:	0a000074 	beq	25c8 <ipu_unlink_channels+0x25c>
    23f4:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    23f8:	e34132ff 	movt	r3, #4863	; 0x12ff
    23fc:	e1580003 	cmp	r8, r3
    2400:	0a000092 	beq	2650 <ipu_unlink_channels+0x2e4>
    2404:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    2408:	e34130ff 	movt	r3, #4351	; 0x10ff
    240c:	e1580003 	cmp	r8, r3
    2410:	0a000070 	beq	25d8 <ipu_unlink_channels+0x26c>
    2414:	e3e04015 	mvn	r4, #21
    2418:	ea000058 	b	2580 <ipu_unlink_channels+0x214>
    241c:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    2420:	e34033bf 	movt	r3, #959	; 0x3bf
    2424:	e1580003 	cmp	r8, r3
    2428:	0a00008a 	beq	2658 <ipu_unlink_channels+0x2ec>
    242c:	da00006b 	ble	25e0 <ipu_unlink_channels+0x274>
    2430:	e30e3455 	movw	r3, #58453	; 0xe455
    2434:	e3403530 	movt	r3, #1328	; 0x530
    2438:	e1580003 	cmp	r8, r3
    243c:	0a000013 	beq	2490 <ipu_unlink_channels+0x124>
    2440:	e30f3496 	movw	r3, #62614	; 0xf496
    2444:	e340362c 	movt	r3, #1580	; 0x62c
    2448:	e1580003 	cmp	r8, r3
    244c:	0a00007b 	beq	2640 <ipu_unlink_channels+0x2d4>
    2450:	e30e3454 	movw	r3, #58452	; 0xe454
    2454:	e3403430 	movt	r3, #1072	; 0x430
    2458:	e1580003 	cmp	r8, r3
    245c:	1affffec 	bne	2414 <ipu_unlink_channels+0xa8>
    2460:	e3c6600f 	bic	r6, r6, #15
    2464:	ea00000a 	b	2494 <ipu_unlink_channels+0x128>
    2468:	e30e3455 	movw	r3, #58453	; 0xe455
    246c:	e3413624 	movt	r3, #5668	; 0x1624
    2470:	e1580003 	cmp	r8, r3
    2474:	0a000005 	beq	2490 <ipu_unlink_channels+0x124>
    2478:	e3780379 	cmn	r8, #-469762047	; 0xe4000001
    247c:	0a000071 	beq	2648 <ipu_unlink_channels+0x2dc>
    2480:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    2484:	e34134ff 	movt	r3, #5375	; 0x14ff
    2488:	e1580003 	cmp	r8, r3
    248c:	1affffe0 	bne	2414 <ipu_unlink_channels+0xa8>
    2490:	e3c660f0 	bic	r6, r6, #240	; 0xf0
    2494:	e30f3fff 	movw	r3, #65535	; 0xffff
    2498:	e3403773 	movt	r3, #1907	; 0x773
    249c:	e1550003 	cmp	r5, r3
    24a0:	0a000072 	beq	2670 <ipu_unlink_channels+0x304>
    24a4:	da000012 	ble	24f4 <ipu_unlink_channels+0x188>
    24a8:	e30f3d3f 	movw	r3, #64831	; 0xfd3f
    24ac:	e3403b63 	movt	r3, #2915	; 0xb63
    24b0:	e1550003 	cmp	r5, r3
    24b4:	0a00006b 	beq	2668 <ipu_unlink_channels+0x2fc>
    24b8:	ca000034 	bgt	2590 <ipu_unlink_channels+0x224>
    24bc:	e30f3cff 	movw	r3, #64767	; 0xfcff
    24c0:	e340395f 	movt	r3, #2399	; 0x95f
    24c4:	e1550003 	cmp	r5, r3
    24c8:	0a000040 	beq	25d0 <ipu_unlink_channels+0x264>
    24cc:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    24d0:	e3403a6f 	movt	r3, #2671	; 0xa6f
    24d4:	e1550003 	cmp	r5, r3
    24d8:	0a000068 	beq	2680 <ipu_unlink_channels+0x314>
    24dc:	e30f3fff 	movw	r3, #65535	; 0xffff
    24e0:	e34038a7 	movt	r3, #2215	; 0x8a7
    24e4:	e1550003 	cmp	r5, r3
    24e8:	1affffc9 	bne	2414 <ipu_unlink_channels+0xa8>
    24ec:	e3caa80f 	bic	sl, sl, #983040	; 0xf0000
    24f0:	ea000011 	b	253c <ipu_unlink_channels+0x1d0>
    24f4:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    24f8:	e34033bf 	movt	r3, #959	; 0x3bf
    24fc:	e1550003 	cmp	r5, r3
    2500:	0a000060 	beq	2688 <ipu_unlink_channels+0x31c>
    2504:	da00003f 	ble	2608 <ipu_unlink_channels+0x29c>
    2508:	e30e3455 	movw	r3, #58453	; 0xe455
    250c:	e3403530 	movt	r3, #1328	; 0x530
    2510:	e1550003 	cmp	r5, r3
    2514:	0a000007 	beq	2538 <ipu_unlink_channels+0x1cc>
    2518:	e30f3496 	movw	r3, #62614	; 0xf496
    251c:	e340362c 	movt	r3, #1580	; 0x62c
    2520:	e1550003 	cmp	r5, r3
    2524:	0a00004d 	beq	2660 <ipu_unlink_channels+0x2f4>
    2528:	e30e3454 	movw	r3, #58452	; 0xe454
    252c:	e3403430 	movt	r3, #1072	; 0x430
    2530:	e1550003 	cmp	r5, r3
    2534:	1affffb6 	bne	2414 <ipu_unlink_channels+0xa8>
    2538:	e3c9940f 	bic	r9, r9, #251658240	; 0xf000000
    253c:	f57ff04e 	dsb	st
    2540:	ebfffffe 	bl	0 <arm_heavy_mb>
    2544:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2548:	e58390a8 	str	r9, [r3, #168]	; 0xa8
    254c:	f57ff04e 	dsb	st
    2550:	ebfffffe 	bl	0 <arm_heavy_mb>
    2554:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2558:	e58360ac 	str	r6, [r3, #172]	; 0xac
    255c:	f57ff04e 	dsb	st
    2560:	ebfffffe 	bl	0 <arm_heavy_mb>
    2564:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2568:	e583b0b0 	str	fp, [r3, #176]	; 0xb0
    256c:	f57ff04e 	dsb	st
    2570:	ebfffffe 	bl	0 <arm_heavy_mb>
    2574:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2578:	e583a0b4 	str	sl, [r3, #180]	; 0xb4
    257c:	e3a04000 	mov	r4, #0
    2580:	e1a00007 	mov	r0, r7
    2584:	ebfffffe 	bl	0 <mutex_unlock>
    2588:	e1a00004 	mov	r0, r4
    258c:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2590:	e30e3455 	movw	r3, #58453	; 0xe455
    2594:	e3413624 	movt	r3, #5668	; 0x1624
    2598:	e1550003 	cmp	r5, r3
    259c:	0affffe5 	beq	2538 <ipu_unlink_channels+0x1cc>
    25a0:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    25a4:	e3413927 	movt	r3, #6439	; 0x1927
    25a8:	e1550003 	cmp	r5, r3
    25ac:	0a000031 	beq	2678 <ipu_unlink_channels+0x30c>
    25b0:	e30f387f 	movw	r3, #63615	; 0xf87f
    25b4:	e3403c77 	movt	r3, #3191	; 0xc77
    25b8:	e1550003 	cmp	r5, r3
    25bc:	1affff94 	bne	2414 <ipu_unlink_channels+0xa8>
    25c0:	e3caaa0f 	bic	sl, sl, #61440	; 0xf000
    25c4:	eaffffdc 	b	253c <ipu_unlink_channels+0x1d0>
    25c8:	e3cbbd1e 	bic	fp, fp, #1920	; 0x780
    25cc:	eaffffb0 	b	2494 <ipu_unlink_channels+0x128>
    25d0:	e3caa00f 	bic	sl, sl, #15
    25d4:	eaffffd8 	b	253c <ipu_unlink_channels+0x1d0>
    25d8:	e3cbb070 	bic	fp, fp, #112	; 0x70
    25dc:	eaffffac 	b	2494 <ipu_unlink_channels+0x128>
    25e0:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    25e4:	e34031b7 	movt	r3, #439	; 0x1b7
    25e8:	e1580003 	cmp	r8, r3
    25ec:	0a000011 	beq	2638 <ipu_unlink_channels+0x2cc>
    25f0:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    25f4:	e34032bb 	movt	r3, #699	; 0x2bb
    25f8:	e1580003 	cmp	r8, r3
    25fc:	03c66c0f 	biceq	r6, r6, #3840	; 0xf00
    2600:	0affffa3 	beq	2494 <ipu_unlink_channels+0x128>
    2604:	eaffff82 	b	2414 <ipu_unlink_channels+0xa8>
    2608:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    260c:	e34031b7 	movt	r3, #439	; 0x1b7
    2610:	e1550003 	cmp	r5, r3
    2614:	0a00001d 	beq	2690 <ipu_unlink_channels+0x324>
    2618:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    261c:	e34032bb 	movt	r3, #699	; 0x2bb
    2620:	e1550003 	cmp	r5, r3
    2624:	03c99c0f 	biceq	r9, r9, #3840	; 0xf00
    2628:	0affffc3 	beq	253c <ipu_unlink_channels+0x1d0>
    262c:	eaffff78 	b	2414 <ipu_unlink_channels+0xa8>
    2630:	e3cbb00f 	bic	fp, fp, #15
    2634:	eaffff96 	b	2494 <ipu_unlink_channels+0x128>
    2638:	e3c6660f 	bic	r6, r6, #15728640	; 0xf00000
    263c:	eaffff94 	b	2494 <ipu_unlink_channels+0x128>
    2640:	e3c66a0f 	bic	r6, r6, #61440	; 0xf000
    2644:	eaffff92 	b	2494 <ipu_unlink_channels+0x128>
    2648:	e3cbb803 	bic	fp, fp, #196608	; 0x30000
    264c:	eaffff90 	b	2494 <ipu_unlink_channels+0x128>
    2650:	e3cbbb0e 	bic	fp, fp, #14336	; 0x3800
    2654:	eaffff8e 	b	2494 <ipu_unlink_channels+0x128>
    2658:	e3c6680f 	bic	r6, r6, #983040	; 0xf0000
    265c:	eaffff8c 	b	2494 <ipu_unlink_channels+0x128>
    2660:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    2664:	eaffffb4 	b	253c <ipu_unlink_channels+0x1d0>
    2668:	e3caac0f 	bic	sl, sl, #3840	; 0xf00
    266c:	eaffffb2 	b	253c <ipu_unlink_channels+0x1d0>
    2670:	e3caa60f 	bic	sl, sl, #15728640	; 0xf00000
    2674:	eaffffb0 	b	253c <ipu_unlink_channels+0x1d0>
    2678:	e3c99203 	bic	r9, r9, #805306368	; 0x30000000
    267c:	eaffffae 	b	253c <ipu_unlink_channels+0x1d0>
    2680:	e3caa0f0 	bic	sl, sl, #240	; 0xf0
    2684:	eaffffac 	b	253c <ipu_unlink_channels+0x1d0>
    2688:	e3c9980f 	bic	r9, r9, #983040	; 0xf0000
    268c:	eaffffaa 	b	253c <ipu_unlink_channels+0x1d0>
    2690:	e3c9900f 	bic	r9, r9, #15
    2694:	eaffffa8 	b	253c <ipu_unlink_channels+0x1d0>

00002698 <ipu_uninit_channel>:
    2698:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    269c:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    26a0:	e1a06000 	mov	r6, r0
    26a4:	e2855008 	add	r5, r5, #8
    26a8:	e1a08c41 	asr	r8, r1, #24
    26ac:	e24dd01c 	sub	sp, sp, #28
    26b0:	e1a00005 	mov	r0, r5
    26b4:	e2864a01 	add	r4, r6, #4096	; 0x1000
    26b8:	e1a09001 	mov	r9, r1
    26bc:	ebfffffe 	bl	0 <mutex_lock>
    26c0:	e3a03001 	mov	r3, #1
    26c4:	e5942e14 	ldr	r2, [r4, #3604]	; 0xe14
    26c8:	e1a01813 	lsl	r1, r3, r8
    26cc:	e1110002 	tst	r1, r2
    26d0:	e58d1000 	str	r1, [sp]
    26d4:	1a00000e 	bne	2714 <ipu_uninit_channel+0x7c>
    26d8:	e3000000 	movw	r0, #0
    26dc:	e3400000 	movt	r0, #0
    26e0:	e1d035ba 	ldrh	r3, [r0, #90]	; 0x5a
    26e4:	e3130004 	tst	r3, #4
    26e8:	0a000005 	beq	2704 <ipu_uninit_channel+0x6c>
    26ec:	e3002000 	movw	r2, #0
    26f0:	e1a03008 	mov	r3, r8
    26f4:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    26f8:	e2800048 	add	r0, r0, #72	; 0x48
    26fc:	e3402000 	movt	r2, #0
    2700:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    2704:	e1a00005 	mov	r0, r5
    2708:	e28dd01c 	add	sp, sp, #28
    270c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2710:	eafffffe 	b	0 <mutex_unlock>
    2714:	e1a0c929 	lsr	ip, r9, #18
    2718:	e5942d4c 	ldr	r2, [r4, #3404]	; 0xd4c
    271c:	e20c703f 	and	r7, ip, #63	; 0x3f
    2720:	e1a0b2a7 	lsr	fp, r7, #5
    2724:	e28bb001 	add	fp, fp, #1
    2728:	e1a0b10b 	lsl	fp, fp, #2
    272c:	e082200b 	add	r2, r2, fp
    2730:	e5922000 	ldr	r2, [r2]
    2734:	f57ff04f 	dsb	sy
    2738:	e357003f 	cmp	r7, #63	; 0x3f
    273c:	0a000002 	beq	274c <ipu_uninit_channel+0xb4>
    2740:	e20c001f 	and	r0, ip, #31
    2744:	e0123013 	ands	r3, r2, r3, lsl r0
    2748:	1a00000e 	bne	2788 <ipu_uninit_channel+0xf0>
    274c:	e209a03f 	and	sl, r9, #63	; 0x3f
    2750:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    2754:	e1a022aa 	lsr	r2, sl, #5
    2758:	e2822001 	add	r2, r2, #1
    275c:	e1a02102 	lsl	r2, r2, #2
    2760:	e58d2004 	str	r2, [sp, #4]
    2764:	e0833002 	add	r3, r3, r2
    2768:	e5932000 	ldr	r2, [r3]
    276c:	f57ff04f 	dsb	sy
    2770:	e35a003f 	cmp	sl, #63	; 0x3f
    2774:	0a00000c 	beq	27ac <ipu_uninit_channel+0x114>
    2778:	e209301f 	and	r3, r9, #31
    277c:	e3a00001 	mov	r0, #1
    2780:	e0123310 	ands	r3, r2, r0, lsl r3
    2784:	0a000008 	beq	27ac <ipu_uninit_channel+0x114>
    2788:	e3001000 	movw	r1, #0
    278c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    2790:	e1a02008 	mov	r2, r8
    2794:	e3401000 	movt	r1, #0
    2798:	ebfffffe 	bl	0 <dev_err>
    279c:	e1a00005 	mov	r0, r5
    27a0:	e28dd01c 	add	sp, sp, #28
    27a4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    27a8:	eafffffe 	b	0 <mutex_unlock>
    27ac:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    27b0:	e5933000 	ldr	r3, [r3]
    27b4:	f57ff04f 	dsb	sy
    27b8:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
    27bc:	e28b2f53 	add	r2, fp, #332	; 0x14c
    27c0:	e0800002 	add	r0, r0, r2
    27c4:	e5900000 	ldr	r0, [r0]
    27c8:	f57ff04f 	dsb	sy
    27cc:	e357003f 	cmp	r7, #63	; 0x3f
    27d0:	e1cd20f8 	strd	r2, [sp, #8]
    27d4:	120cc01f 	andne	ip, ip, #31
    27d8:	13a0e001 	movne	lr, #1
    27dc:	11e01c1e 	mvnne	r1, lr, lsl ip
    27e0:	03e01000 	mvneq	r1, #0
    27e4:	058d1014 	streq	r1, [sp, #20]
    27e8:	10000001 	andne	r0, r0, r1
    27ec:	158d1014 	strne	r1, [sp, #20]
    27f0:	e58d0010 	str	r0, [sp, #16]
    27f4:	f57ff04e 	dsb	st
    27f8:	ebfffffe 	bl	0 <arm_heavy_mb>
    27fc:	e594cd48 	ldr	ip, [r4, #3400]	; 0xd48
    2800:	e59d2008 	ldr	r2, [sp, #8]
    2804:	e59d0010 	ldr	r0, [sp, #16]
    2808:	e08c2002 	add	r2, ip, r2
    280c:	e5820000 	str	r0, [r2]
    2810:	e59d3004 	ldr	r3, [sp, #4]
    2814:	e2832f53 	add	r2, r3, #332	; 0x14c
    2818:	e08cc002 	add	ip, ip, r2
    281c:	e59c0000 	ldr	r0, [ip]
    2820:	f57ff04f 	dsb	sy
    2824:	e35a003f 	cmp	sl, #63	; 0x3f
    2828:	e59d300c 	ldr	r3, [sp, #12]
    282c:	1209a01f 	andne	sl, r9, #31
    2830:	13a0c001 	movne	ip, #1
    2834:	11e0aa1c 	mvnne	sl, ip, lsl sl
    2838:	03e0a000 	mvneq	sl, #0
    283c:	e1cd20f8 	strd	r2, [sp, #8]
    2840:	1000000a 	andne	r0, r0, sl
    2844:	e58d0010 	str	r0, [sp, #16]
    2848:	f57ff04e 	dsb	st
    284c:	ebfffffe 	bl	0 <arm_heavy_mb>
    2850:	e594cd48 	ldr	ip, [r4, #3400]	; 0xd48
    2854:	e59d2008 	ldr	r2, [sp, #8]
    2858:	e59d0010 	ldr	r0, [sp, #16]
    285c:	e08c2002 	add	r2, ip, r2
    2860:	e5820000 	str	r0, [r2]
    2864:	e5962004 	ldr	r2, [r6, #4]
    2868:	e59d300c 	ldr	r3, [sp, #12]
    286c:	e3520000 	cmp	r2, #0
    2870:	128b2f5d 	addne	r2, fp, #372	; 0x174
    2874:	03a02f4b 	moveq	r2, #300	; 0x12c
    2878:	e08cc002 	add	ip, ip, r2
    287c:	e59c2000 	ldr	r2, [ip]
    2880:	f57ff04f 	dsb	sy
    2884:	e59d1014 	ldr	r1, [sp, #20]
    2888:	e5960004 	ldr	r0, [r6, #4]
    288c:	e0011002 	and	r1, r1, r2
    2890:	e3500000 	cmp	r0, #0
    2894:	e1a02001 	mov	r2, r1
    2898:	128bbf5d 	addne	fp, fp, #372	; 0x174
    289c:	03a0bf4b 	moveq	fp, #300	; 0x12c
    28a0:	e1cd20f8 	strd	r2, [sp, #8]
    28a4:	f57ff04e 	dsb	st
    28a8:	ebfffffe 	bl	0 <arm_heavy_mb>
    28ac:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
    28b0:	e59d2008 	ldr	r2, [sp, #8]
    28b4:	e080b00b 	add	fp, r0, fp
    28b8:	e58b2000 	str	r2, [fp]
    28bc:	e5962004 	ldr	r2, [r6, #4]
    28c0:	e59d300c 	ldr	r3, [sp, #12]
    28c4:	e3520000 	cmp	r2, #0
    28c8:	159d2004 	ldrne	r2, [sp, #4]
    28cc:	03a02f4b 	moveq	r2, #300	; 0x12c
    28d0:	12822f5d 	addne	r2, r2, #372	; 0x174
    28d4:	e0800002 	add	r0, r0, r2
    28d8:	e5900000 	ldr	r0, [r0]
    28dc:	f57ff04f 	dsb	sy
    28e0:	e5962004 	ldr	r2, [r6, #4]
    28e4:	e00aa000 	and	sl, sl, r0
    28e8:	e3520000 	cmp	r2, #0
    28ec:	159d2004 	ldrne	r2, [sp, #4]
    28f0:	03a0bf4b 	moveq	fp, #300	; 0x12c
    28f4:	e58d3004 	str	r3, [sp, #4]
    28f8:	1282bf5d 	addne	fp, r2, #372	; 0x174
    28fc:	f57ff04e 	dsb	st
    2900:	ebfffffe 	bl	0 <arm_heavy_mb>
    2904:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    2908:	e082b00b 	add	fp, r2, fp
    290c:	e58ba000 	str	sl, [fp]
    2910:	e247200b 	sub	r2, r7, #11
    2914:	e247b017 	sub	fp, r7, #23
    2918:	e352000b 	cmp	r2, #11
    291c:	e59d3004 	ldr	r3, [sp, #4]
    2920:	83a02000 	movhi	r2, #0
    2924:	93a02001 	movls	r2, #1
    2928:	e3570011 	cmp	r7, #17
    292c:	03a02000 	moveq	r2, #0
    2930:	e3520000 	cmp	r2, #0
    2934:	0a000083 	beq	2b48 <ipu_uninit_channel+0x4b0>
    2938:	e3570012 	cmp	r7, #18
    293c:	0a000005 	beq	2958 <ipu_uninit_channel+0x2c0>
    2940:	e0862008 	add	r2, r6, r8
    2944:	e3a00000 	mov	r0, #0
    2948:	e301ed9e 	movw	lr, #7582	; 0x1d9e
    294c:	e301cdbe 	movw	ip, #7614	; 0x1dbe
    2950:	e7c2000e 	strb	r0, [r2, lr]
    2954:	e7c2000c 	strb	r0, [r2, ip]
    2958:	e3e024f2 	mvn	r2, #-234881024	; 0xf2000000
    295c:	e1590002 	cmp	r9, r2
    2960:	0a000154 	beq	2eb8 <ipu_uninit_channel+0x820>
    2964:	e359040e 	cmp	r9, #234881024	; 0xe000000
    2968:	aa000079 	bge	2b54 <ipu_uninit_channel+0x4bc>
    296c:	e30e2455 	movw	r2, #58453	; 0xe455
    2970:	e3402530 	movt	r2, #1328	; 0x530
    2974:	e1590002 	cmp	r9, r2
    2978:	0a000143 	beq	2e8c <ipu_uninit_channel+0x7f4>
    297c:	ca000095 	bgt	2bd8 <ipu_uninit_channel+0x540>
    2980:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    2984:	e34022bb 	movt	r2, #699	; 0x2bb
    2988:	e1590002 	cmp	r9, r2
    298c:	0a0001b8 	beq	3074 <ipu_uninit_channel+0x9dc>
    2990:	da000122 	ble	2e20 <ipu_uninit_channel+0x788>
    2994:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    2998:	e34023bf 	movt	r2, #959	; 0x3bf
    299c:	e1590002 	cmp	r9, r2
    29a0:	0a0001be 	beq	30a0 <ipu_uninit_channel+0xa08>
    29a4:	e30e2454 	movw	r2, #58452	; 0xe454
    29a8:	e3402430 	movt	r2, #1072	; 0x430
    29ac:	e1590002 	cmp	r9, r2
    29b0:	1a0000d3 	bne	2d04 <ipu_uninit_channel+0x66c>
    29b4:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    29b8:	e1a00006 	mov	r0, r6
    29bc:	e58d3004 	str	r3, [sp, #4]
    29c0:	e2422001 	sub	r2, r2, #1
    29c4:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    29c8:	ebfffffe 	bl	0 <_ipu_ic_uninit_prpenc>
    29cc:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    29d0:	e592a0a8 	ldr	sl, [r2, #168]	; 0xa8
    29d4:	f57ff04f 	dsb	sy
    29d8:	e3caa101 	bic	sl, sl, #1073741824	; 0x40000000
    29dc:	f57ff04e 	dsb	st
    29e0:	ebfffffe 	bl	0 <arm_heavy_mb>
    29e4:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    29e8:	e582a0a8 	str	sl, [r2, #168]	; 0xa8
    29ec:	e3a0a000 	mov	sl, #0
    29f0:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    29f4:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    29f8:	e8901003 	ldm	r0, {r0, r1, ip}
    29fc:	e59d3004 	ldr	r3, [sp, #4]
    2a00:	e594ee2c 	ldr	lr, [r4, #3628]	; 0xe2c
    2a04:	e35e0000 	cmp	lr, #0
    2a08:	e594ee34 	ldr	lr, [r4, #3636]	; 0xe34
    2a0c:	03c33004 	biceq	r3, r3, #4
    2a10:	e35e0000 	cmp	lr, #0
    2a14:	e594ee30 	ldr	lr, [r4, #3632]	; 0xe30
    2a18:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
    2a1c:	03c33141 	biceq	r3, r3, #1073741840	; 0x40000010
    2a20:	e35e0000 	cmp	lr, #0
    2a24:	03c33008 	biceq	r3, r3, #8
    2a28:	e3520000 	cmp	r2, #0
    2a2c:	e5942e38 	ldr	r2, [r4, #3640]	; 0xe38
    2a30:	03c33c02 	biceq	r3, r3, #512	; 0x200
    2a34:	e3500000 	cmp	r0, #0
    2a38:	03c33020 	biceq	r3, r3, #32
    2a3c:	e3510000 	cmp	r1, #0
    2a40:	03c33b01 	biceq	r3, r3, #1024	; 0x400
    2a44:	e3520000 	cmp	r2, #0
    2a48:	e5942e3c 	ldr	r2, [r4, #3644]	; 0xe3c
    2a4c:	03c33040 	biceq	r3, r3, #64	; 0x40
    2a50:	e3520000 	cmp	r2, #0
    2a54:	03c33080 	biceq	r3, r3, #128	; 0x80
    2a58:	e35c0000 	cmp	ip, #0
    2a5c:	03c33c01 	biceq	r3, r3, #256	; 0x100
    2a60:	e58d3004 	str	r3, [sp, #4]
    2a64:	f57ff04e 	dsb	st
    2a68:	ebfffffe 	bl	0 <arm_heavy_mb>
    2a6c:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    2a70:	e59d3004 	ldr	r3, [sp, #4]
    2a74:	e5823000 	str	r3, [r2]
    2a78:	e357001c 	cmp	r7, #28
    2a7c:	13570029 	cmpne	r7, #41	; 0x29
    2a80:	e5943e14 	ldr	r3, [r4, #3604]	; 0xe14
    2a84:	03a07001 	moveq	r7, #1
    2a88:	13a07000 	movne	r7, #0
    2a8c:	e59d2000 	ldr	r2, [sp]
    2a90:	e35b0001 	cmp	fp, #1
    2a94:	81a0b007 	movhi	fp, r7
    2a98:	9387b001 	orrls	fp, r7, #1
    2a9c:	e35b0000 	cmp	fp, #0
    2aa0:	e1c39002 	bic	r9, r3, r2
    2aa4:	e5849e14 	str	r9, [r4, #3604]	; 0xe14
    2aa8:	0a000006 	beq	2ac8 <ipu_uninit_channel+0x430>
    2aac:	e086a00a 	add	sl, r6, sl
    2ab0:	e3017d94 	movw	r7, #7572	; 0x1d94
    2ab4:	e7da3007 	ldrb	r3, [sl, r7]
    2ab8:	e0862003 	add	r2, r6, r3
    2abc:	e5d22028 	ldrb	r2, [r2, #40]	; 0x28
    2ac0:	e3520000 	cmp	r2, #0
    2ac4:	1a00007b 	bne	2cb8 <ipu_uninit_channel+0x620>
    2ac8:	e1a00005 	mov	r0, r5
    2acc:	ebfffffe 	bl	0 <mutex_unlock>
    2ad0:	e596000c 	ldr	r0, [r6, #12]
    2ad4:	ebfffffe 	bl	0 <clk_disable>
    2ad8:	e3a01004 	mov	r1, #4
    2adc:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    2ae0:	ebfffffe 	bl	0 <__pm_runtime_suspend>
    2ae4:	e3500000 	cmp	r0, #0
    2ae8:	ba00017e 	blt	30e8 <ipu_uninit_channel+0xa50>
    2aec:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    2af0:	e3530000 	cmp	r3, #0
    2af4:	ba0000a6 	blt	2d94 <ipu_uninit_channel+0x6fc>
    2af8:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    2afc:	e3530000 	cmp	r3, #0
    2b00:	ba00009e 	blt	2d80 <ipu_uninit_channel+0x6e8>
    2b04:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    2b08:	e3530000 	cmp	r3, #0
    2b0c:	ba000096 	blt	2d6c <ipu_uninit_channel+0x6d4>
    2b10:	e5943e1c 	ldr	r3, [r4, #3612]	; 0xe1c
    2b14:	e3530000 	cmp	r3, #0
    2b18:	ba00008e 	blt	2d58 <ipu_uninit_channel+0x6c0>
    2b1c:	e5943e20 	ldr	r3, [r4, #3616]	; 0xe20
    2b20:	e3530000 	cmp	r3, #0
    2b24:	ba000086 	blt	2d44 <ipu_uninit_channel+0x6ac>
    2b28:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    2b2c:	e3530000 	cmp	r3, #0
    2b30:	ba00007e 	blt	2d30 <ipu_uninit_channel+0x698>
    2b34:	e5943e28 	ldr	r3, [r4, #3624]	; 0xe28
    2b38:	e3530000 	cmp	r3, #0
    2b3c:	ba000075 	blt	2d18 <ipu_uninit_channel+0x680>
    2b40:	e28dd01c 	add	sp, sp, #28
    2b44:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2b48:	e3db2004 	bics	r2, fp, #4
    2b4c:	0affff7b 	beq	2940 <ipu_uninit_channel+0x2a8>
    2b50:	eaffff80 	b	2958 <ipu_uninit_channel+0x2c0>
    2b54:	e30f2fc3 	movw	r2, #65475	; 0xffc3
    2b58:	e34122ff 	movt	r2, #4863	; 0x12ff
    2b5c:	e1590002 	cmp	r9, r2
    2b60:	0a000123 	beq	2ff4 <ipu_uninit_channel+0x95c>
    2b64:	da000039 	ble	2c50 <ipu_uninit_channel+0x5b8>
    2b68:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    2b6c:	e34124ff 	movt	r2, #5375	; 0x14ff
    2b70:	e1590002 	cmp	r9, r2
    2b74:	0a0000f2 	beq	2f44 <ipu_uninit_channel+0x8ac>
    2b78:	da00008a 	ble	2da8 <ipu_uninit_channel+0x710>
    2b7c:	e30e2455 	movw	r2, #58453	; 0xe455
    2b80:	e3412624 	movt	r2, #5668	; 0x1624
    2b84:	e1590002 	cmp	r9, r2
    2b88:	0a0000dd 	beq	2f04 <ipu_uninit_channel+0x86c>
    2b8c:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    2b90:	e3412927 	movt	r2, #6439	; 0x1927
    2b94:	e1590002 	cmp	r9, r2
    2b98:	1a000059 	bne	2d04 <ipu_uninit_channel+0x66c>
    2b9c:	e594cd90 	ldr	ip, [r4, #3472]	; 0xd90
    2ba0:	e3a0a000 	mov	sl, #0
    2ba4:	e5942e34 	ldr	r2, [r4, #3636]	; 0xe34
    2ba8:	e5940e2c 	ldr	r0, [r4, #3628]	; 0xe2c
    2bac:	e15c0009 	cmp	ip, r9
    2bb0:	e58d3004 	str	r3, [sp, #4]
    2bb4:	e2422001 	sub	r2, r2, #1
    2bb8:	e2401001 	sub	r1, r0, #1
    2bbc:	e5842e34 	str	r2, [r4, #3636]	; 0xe34
    2bc0:	03a02000 	moveq	r2, #0
    2bc4:	e5841e2c 	str	r1, [r4, #3628]	; 0xe2c
    2bc8:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2bcc:	e1a00006 	mov	r0, r6
    2bd0:	ebfffffe 	bl	0 <_ipu_vdi_uninit>
    2bd4:	eaffff85 	b	29f0 <ipu_uninit_channel+0x358>
    2bd8:	e30f2fff 	movw	r2, #65535	; 0xffff
    2bdc:	e3402773 	movt	r2, #1907	; 0x773
    2be0:	e1590002 	cmp	r9, r2
    2be4:	0a0000ed 	beq	2fa0 <ipu_uninit_channel+0x908>
    2be8:	da00009b 	ble	2e5c <ipu_uninit_channel+0x7c4>
    2bec:	e30f2cff 	movw	r2, #64767	; 0xfcff
    2bf0:	e340295f 	movt	r2, #2399	; 0x95f
    2bf4:	e1590002 	cmp	r9, r2
    2bf8:	0a00010d 	beq	3034 <ipu_uninit_channel+0x99c>
    2bfc:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    2c00:	e3402a6f 	movt	r2, #2671	; 0xa6f
    2c04:	e1590002 	cmp	r9, r2
    2c08:	1a00003d 	bne	2d04 <ipu_uninit_channel+0x66c>
    2c0c:	e1a01009 	mov	r1, r9
    2c10:	e1a00006 	mov	r0, r6
    2c14:	e58d3004 	str	r3, [sp, #4]
    2c18:	e3a0a000 	mov	sl, #0
    2c1c:	ebfffffe 	bl	0 <_ipu_dp_uninit>
    2c20:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2c24:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2c28:	e2422001 	sub	r2, r2, #1
    2c2c:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2c30:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2c34:	e2400001 	sub	r0, r0, #1
    2c38:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2c3c:	e2411001 	sub	r1, r1, #1
    2c40:	e5840e20 	str	r0, [r4, #3616]	; 0xe20
    2c44:	e5841e24 	str	r1, [r4, #3620]	; 0xe24
    2c48:	e59d3004 	ldr	r3, [sp, #4]
    2c4c:	eaffff6b 	b	2a00 <ipu_uninit_channel+0x368>
    2c50:	e30f2fc0 	movw	r2, #65472	; 0xffc0
    2c54:	e3402fff 	movt	r2, #4095	; 0xfff
    2c58:	e1590002 	cmp	r9, r2
    2c5c:	0a0000e4 	beq	2ff4 <ipu_uninit_channel+0x95c>
    2c60:	ca00001f 	bgt	2ce4 <ipu_uninit_channel+0x64c>
    2c64:	e3e024f1 	mvn	r2, #-251658240	; 0xf1000000
    2c68:	e1590002 	cmp	r9, r2
    2c6c:	1a000024 	bne	2d04 <ipu_uninit_channel+0x66c>
    2c70:	e3a01009 	mov	r1, #9
    2c74:	e1a00006 	mov	r0, r6
    2c78:	e58d3004 	str	r3, [sp, #4]
    2c7c:	e3a0a009 	mov	sl, #9
    2c80:	ebfffffe 	bl	0 <_ipu_dc_uninit>
    2c84:	e5d42d9d 	ldrb	r2, [r4, #3485]	; 0xd9d
    2c88:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2c8c:	e59d3004 	ldr	r3, [sp, #4]
    2c90:	e0862102 	add	r2, r6, r2, lsl #2
    2c94:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2c98:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2c9c:	e2411001 	sub	r1, r1, #1
    2ca0:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2ca4:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2ca8:	e8901003 	ldm	r0, {r0, r1, ip}
    2cac:	e2422001 	sub	r2, r2, #1
    2cb0:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2cb4:	eaffff51 	b	2a00 <ipu_uninit_channel+0x368>
    2cb8:	e2833008 	add	r3, r3, #8
    2cbc:	e7969103 	ldr	r9, [r6, r3, lsl #2]
    2cc0:	e1a00009 	mov	r0, r9
    2cc4:	ebfffffe 	bl	0 <clk_disable>
    2cc8:	e1a00009 	mov	r0, r9
    2ccc:	ebfffffe 	bl	0 <clk_unprepare>
    2cd0:	e7da3007 	ldrb	r3, [sl, r7]
    2cd4:	e3a02000 	mov	r2, #0
    2cd8:	e0863003 	add	r3, r6, r3
    2cdc:	e5c32028 	strb	r2, [r3, #40]	; 0x28
    2ce0:	eaffff78 	b	2ac8 <ipu_uninit_channel+0x430>
    2ce4:	e30f2fc1 	movw	r2, #65473	; 0xffc1
    2ce8:	e34120ff 	movt	r2, #4351	; 0x10ff
    2cec:	e1590002 	cmp	r9, r2
    2cf0:	0a0000bf 	beq	2ff4 <ipu_uninit_channel+0x95c>
    2cf4:	e30f2fc2 	movw	r2, #65474	; 0xffc2
    2cf8:	e34121ff 	movt	r2, #4607	; 0x11ff
    2cfc:	e1590002 	cmp	r9, r2
    2d00:	0a0000bb 	beq	2ff4 <ipu_uninit_channel+0x95c>
    2d04:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2d08:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2d0c:	e3a0a000 	mov	sl, #0
    2d10:	e8901003 	ldm	r0, {r0, r1, ip}
    2d14:	eaffff39 	b	2a00 <ipu_uninit_channel+0x368>
    2d18:	e3000000 	movw	r0, #0
    2d1c:	e300154c 	movw	r1, #1356	; 0x54c
    2d20:	e3400000 	movt	r0, #0
    2d24:	e28dd01c 	add	sp, sp, #28
    2d28:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2d2c:	eafffffe 	b	0 <warn_slowpath_null>
    2d30:	e3000000 	movw	r0, #0
    2d34:	e300154b 	movw	r1, #1355	; 0x54b
    2d38:	e3400000 	movt	r0, #0
    2d3c:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d40:	eaffff7b 	b	2b34 <ipu_uninit_channel+0x49c>
    2d44:	e3000000 	movw	r0, #0
    2d48:	e300154a 	movw	r1, #1354	; 0x54a
    2d4c:	e3400000 	movt	r0, #0
    2d50:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d54:	eaffff73 	b	2b28 <ipu_uninit_channel+0x490>
    2d58:	e3000000 	movw	r0, #0
    2d5c:	e3001549 	movw	r1, #1353	; 0x549
    2d60:	e3400000 	movt	r0, #0
    2d64:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d68:	eaffff6b 	b	2b1c <ipu_uninit_channel+0x484>
    2d6c:	e3000000 	movw	r0, #0
    2d70:	e3001548 	movw	r1, #1352	; 0x548
    2d74:	e3400000 	movt	r0, #0
    2d78:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d7c:	eaffff63 	b	2b10 <ipu_uninit_channel+0x478>
    2d80:	e3000000 	movw	r0, #0
    2d84:	e3001547 	movw	r1, #1351	; 0x547
    2d88:	e3400000 	movt	r0, #0
    2d8c:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d90:	eaffff5b 	b	2b04 <ipu_uninit_channel+0x46c>
    2d94:	e3000000 	movw	r0, #0
    2d98:	e3001546 	movw	r1, #1350	; 0x546
    2d9c:	e3400000 	movt	r0, #0
    2da0:	ebfffffe 	bl	0 <warn_slowpath_null>
    2da4:	eaffff53 	b	2af8 <ipu_uninit_channel+0x460>
    2da8:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    2dac:	e34123ff 	movt	r2, #5119	; 0x13ff
    2db0:	e1590002 	cmp	r9, r2
    2db4:	1affffd2 	bne	2d04 <ipu_uninit_channel+0x66c>
    2db8:	e5940d90 	ldr	r0, [r4, #3472]	; 0xd90
    2dbc:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2dc0:	e58d3004 	str	r3, [sp, #4]
    2dc4:	e1500009 	cmp	r0, r9
    2dc8:	e1a00006 	mov	r0, r6
    2dcc:	e2422001 	sub	r2, r2, #1
    2dd0:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2dd4:	03a02000 	moveq	r2, #0
    2dd8:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2ddc:	ebfffffe 	bl	0 <_ipu_ic_uninit_prpenc>
    2de0:	e5941d88 	ldr	r1, [r4, #3464]	; 0xd88
    2de4:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    2de8:	e34123ff 	movt	r2, #5119	; 0x13ff
    2dec:	e59d3004 	ldr	r3, [sp, #4]
    2df0:	e1510002 	cmp	r1, r2
    2df4:	0a000062 	beq	2f84 <ipu_uninit_channel+0x8ec>
    2df8:	e5941d8c 	ldr	r1, [r4, #3468]	; 0xd8c
    2dfc:	e1510002 	cmp	r1, r2
    2e00:	1affffbf 	bne	2d04 <ipu_uninit_channel+0x66c>
    2e04:	e3e01000 	mvn	r1, #0
    2e08:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2e0c:	e5841d8c 	str	r1, [r4, #3468]	; 0xd8c
    2e10:	e3a0a000 	mov	sl, #0
    2e14:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2e18:	e8901003 	ldm	r0, {r0, r1, ip}
    2e1c:	eafffef7 	b	2a00 <ipu_uninit_channel+0x368>
    2e20:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    2e24:	e34021b7 	movt	r2, #439	; 0x1b7
    2e28:	e1590002 	cmp	r9, r2
    2e2c:	1affffb4 	bne	2d04 <ipu_uninit_channel+0x66c>
    2e30:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    2e34:	e1a00006 	mov	r0, r6
    2e38:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e3c:	e3a0a000 	mov	sl, #0
    2e40:	e58d3004 	str	r3, [sp, #4]
    2e44:	e2411001 	sub	r1, r1, #1
    2e48:	e2422001 	sub	r2, r2, #1
    2e4c:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    2e50:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2e54:	ebfffffe 	bl	0 <_ipu_ic_uninit_rotate_enc>
    2e58:	eafffee4 	b	29f0 <ipu_uninit_channel+0x358>
    2e5c:	e30f2496 	movw	r2, #62614	; 0xf496
    2e60:	e340262c 	movt	r2, #1580	; 0x62c
    2e64:	e1590002 	cmp	r9, r2
    2e68:	1affffa5 	bne	2d04 <ipu_uninit_channel+0x66c>
    2e6c:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e70:	e1a00006 	mov	r0, r6
    2e74:	e58d3004 	str	r3, [sp, #4]
    2e78:	e3a0a000 	mov	sl, #0
    2e7c:	e2422001 	sub	r2, r2, #1
    2e80:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2e84:	ebfffffe 	bl	0 <_ipu_ic_uninit_pp>
    2e88:	eafffed8 	b	29f0 <ipu_uninit_channel+0x358>
    2e8c:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e90:	e1a00006 	mov	r0, r6
    2e94:	e58d3004 	str	r3, [sp, #4]
    2e98:	e2422001 	sub	r2, r2, #1
    2e9c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2ea0:	ebfffffe 	bl	0 <_ipu_ic_uninit_prpvf>
    2ea4:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    2ea8:	e592a0a8 	ldr	sl, [r2, #168]	; 0xa8
    2eac:	f57ff04f 	dsb	sy
    2eb0:	e3caa102 	bic	sl, sl, #-2147483648	; 0x80000000
    2eb4:	eafffec8 	b	29dc <ipu_uninit_channel+0x344>
    2eb8:	e3a01008 	mov	r1, #8
    2ebc:	e1a00006 	mov	r0, r6
    2ec0:	e58d3004 	str	r3, [sp, #4]
    2ec4:	e3a0a008 	mov	sl, #8
    2ec8:	ebfffffe 	bl	0 <_ipu_dc_uninit>
    2ecc:	e5d42d9c 	ldrb	r2, [r4, #3484]	; 0xd9c
    2ed0:	e59d3004 	ldr	r3, [sp, #4]
    2ed4:	e0862102 	add	r2, r6, r2, lsl #2
    2ed8:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2edc:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2ee0:	e2411001 	sub	r1, r1, #1
    2ee4:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2ee8:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2eec:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2ef0:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2ef4:	e2422001 	sub	r2, r2, #1
    2ef8:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2efc:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2f00:	eafffebe 	b	2a00 <ipu_uninit_channel+0x368>
    2f04:	e594cd90 	ldr	ip, [r4, #3472]	; 0xd90
    2f08:	e5942e34 	ldr	r2, [r4, #3636]	; 0xe34
    2f0c:	e5940e2c 	ldr	r0, [r4, #3628]	; 0xe2c
    2f10:	e15c0009 	cmp	ip, r9
    2f14:	e58d3004 	str	r3, [sp, #4]
    2f18:	e2422001 	sub	r2, r2, #1
    2f1c:	e2401001 	sub	r1, r0, #1
    2f20:	e5842e34 	str	r2, [r4, #3636]	; 0xe34
    2f24:	03a02000 	moveq	r2, #0
    2f28:	e1a00006 	mov	r0, r6
    2f2c:	e5841e2c 	str	r1, [r4, #3628]	; 0xe2c
    2f30:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2f34:	ebfffffe 	bl	0 <_ipu_ic_uninit_prpvf>
    2f38:	e1a00006 	mov	r0, r6
    2f3c:	ebfffffe 	bl	0 <_ipu_vdi_uninit>
    2f40:	eaffffd7 	b	2ea4 <ipu_uninit_channel+0x80c>
    2f44:	e5940d90 	ldr	r0, [r4, #3472]	; 0xd90
    2f48:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2f4c:	e58d3004 	str	r3, [sp, #4]
    2f50:	e1500009 	cmp	r0, r9
    2f54:	e1a00006 	mov	r0, r6
    2f58:	e2422001 	sub	r2, r2, #1
    2f5c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2f60:	03a02000 	moveq	r2, #0
    2f64:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2f68:	ebfffffe 	bl	0 <_ipu_ic_uninit_prpvf>
    2f6c:	e5941d88 	ldr	r1, [r4, #3464]	; 0xd88
    2f70:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    2f74:	e34124ff 	movt	r2, #5375	; 0x14ff
    2f78:	e59d3004 	ldr	r3, [sp, #4]
    2f7c:	e1510002 	cmp	r1, r2
    2f80:	1affff9c 	bne	2df8 <ipu_uninit_channel+0x760>
    2f84:	e3e01000 	mvn	r1, #0
    2f88:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2f8c:	e5841d88 	str	r1, [r4, #3464]	; 0xd88
    2f90:	e3a0a000 	mov	sl, #0
    2f94:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2f98:	e8901003 	ldm	r0, {r0, r1, ip}
    2f9c:	eafffe97 	b	2a00 <ipu_uninit_channel+0x368>
    2fa0:	e3a01001 	mov	r1, #1
    2fa4:	e1a00006 	mov	r0, r6
    2fa8:	e58d3004 	str	r3, [sp, #4]
    2fac:	e3a0a001 	mov	sl, #1
    2fb0:	ebfffffe 	bl	0 <_ipu_dc_uninit>
    2fb4:	e5d42d95 	ldrb	r2, [r4, #3477]	; 0xd95
    2fb8:	e59d3004 	ldr	r3, [sp, #4]
    2fbc:	e0862102 	add	r2, r6, r2, lsl #2
    2fc0:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2fc4:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2fc8:	e2411001 	sub	r1, r1, #1
    2fcc:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2fd0:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2fd4:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2fd8:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2fdc:	e2422001 	sub	r2, r2, #1
    2fe0:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2fe4:	e2411001 	sub	r1, r1, #1
    2fe8:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2fec:	e5841e24 	str	r1, [r4, #3620]	; 0xe24
    2ff0:	eafffe82 	b	2a00 <ipu_uninit_channel+0x368>
    2ff4:	e5942d88 	ldr	r2, [r4, #3464]	; 0xd88
    2ff8:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2ffc:	e1520009 	cmp	r2, r9
    3000:	e24cc001 	sub	ip, ip, #1
    3004:	e584ce28 	str	ip, [r4, #3624]	; 0xe28
    3008:	0a00002f 	beq	30cc <ipu_uninit_channel+0xa34>
    300c:	e5942d8c 	ldr	r2, [r4, #3468]	; 0xd8c
    3010:	e3a0a000 	mov	sl, #0
    3014:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    3018:	e1520009 	cmp	r2, r9
    301c:	03e01000 	mvneq	r1, #0
    3020:	15942e1c 	ldrne	r2, [r4, #3612]	; 0xe1c
    3024:	05841d8c 	streq	r1, [r4, #3468]	; 0xd8c
    3028:	05942e1c 	ldreq	r2, [r4, #3612]	; 0xe1c
    302c:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    3030:	eafffe72 	b	2a00 <ipu_uninit_channel+0x368>
    3034:	e1a01009 	mov	r1, r9
    3038:	e1a00006 	mov	r0, r6
    303c:	e58d3004 	str	r3, [sp, #4]
    3040:	e3a0a005 	mov	sl, #5
    3044:	ebfffffe 	bl	0 <_ipu_dp_uninit>
    3048:	e3a01005 	mov	r1, #5
    304c:	e1a00006 	mov	r0, r6
    3050:	ebfffffe 	bl	0 <_ipu_dc_uninit>
    3054:	e5d42d99 	ldrb	r2, [r4, #3481]	; 0xd99
    3058:	e0862102 	add	r2, r6, r2, lsl #2
    305c:	e2822a01 	add	r2, r2, #4096	; 0x1000
    3060:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    3064:	e2411001 	sub	r1, r1, #1
    3068:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    306c:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    3070:	eafffeeb 	b	2c24 <ipu_uninit_channel+0x58c>
    3074:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    3078:	e1a00006 	mov	r0, r6
    307c:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    3080:	e3a0a000 	mov	sl, #0
    3084:	e58d3004 	str	r3, [sp, #4]
    3088:	e2411001 	sub	r1, r1, #1
    308c:	e2422001 	sub	r2, r2, #1
    3090:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    3094:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    3098:	ebfffffe 	bl	0 <_ipu_ic_uninit_rotate_vf>
    309c:	eafffe53 	b	29f0 <ipu_uninit_channel+0x358>
    30a0:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    30a4:	e1a00006 	mov	r0, r6
    30a8:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    30ac:	e3a0a000 	mov	sl, #0
    30b0:	e58d3004 	str	r3, [sp, #4]
    30b4:	e2411001 	sub	r1, r1, #1
    30b8:	e2422001 	sub	r2, r2, #1
    30bc:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    30c0:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    30c4:	ebfffffe 	bl	0 <_ipu_ic_uninit_rotate_pp>
    30c8:	eafffe48 	b	29f0 <ipu_uninit_channel+0x358>
    30cc:	e3e01000 	mvn	r1, #0
    30d0:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    30d4:	e5841d88 	str	r1, [r4, #3464]	; 0xd88
    30d8:	e3a0a000 	mov	sl, #0
    30dc:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    30e0:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    30e4:	eafffe45 	b	2a00 <ipu_uninit_channel+0x368>
    30e8:	e3001000 	movw	r1, #0
    30ec:	e1a03000 	mov	r3, r0
    30f0:	e1a02008 	mov	r2, r8
    30f4:	e3401000 	movt	r1, #0
    30f8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    30fc:	ebfffffe 	bl	0 <dev_err>
    3100:	ebfffffe 	bl	0 <dump_stack>
    3104:	eafffe78 	b	2aec <ipu_uninit_channel+0x454>

00003108 <ipu_get_cur_buffer_idx>:
    3108:	e0822082 	add	r2, r2, r2, lsl #1
    310c:	e1a02082 	lsl	r2, r2, #1
    3110:	e1a01231 	lsr	r1, r1, r2
    3114:	e201303f 	and	r3, r1, #63	; 0x3f
    3118:	e353003f 	cmp	r3, #63	; 0x3f
    311c:	0a000040 	beq	3224 <ipu_get_cur_buffer_idx+0x11c>
    3120:	e92d4010 	push	{r4, lr}
    3124:	e280ea01 	add	lr, r0, #4096	; 0x1000
    3128:	e5902004 	ldr	r2, [r0, #4]
    312c:	e3520000 	cmp	r2, #0
    3130:	11a022a3 	lsrne	r2, r3, #5
    3134:	03a0cf4b 	moveq	ip, #300	; 0x12c
    3138:	1282205e 	addne	r2, r2, #94	; 0x5e
    313c:	11a0c102 	lslne	ip, r2, #2
    3140:	e59e2d48 	ldr	r2, [lr, #3400]	; 0xd48
    3144:	e082200c 	add	r2, r2, ip
    3148:	e592c000 	ldr	ip, [r2]
    314c:	f57ff04f 	dsb	sy
    3150:	e3a04001 	mov	r4, #1
    3154:	e201201f 	and	r2, r1, #31
    3158:	e1a02214 	lsl	r2, r4, r2
    315c:	e112000c 	tst	r2, ip
    3160:	1a00000d 	bne	319c <ipu_get_cur_buffer_idx+0x94>
    3164:	e5900004 	ldr	r0, [r0, #4]
    3168:	e1a032a3 	lsr	r3, r3, #5
    316c:	e59e1d48 	ldr	r1, [lr, #3400]	; 0xd48
    3170:	e3500000 	cmp	r0, #0
    3174:	0a000023 	beq	3208 <ipu_get_cur_buffer_idx+0x100>
    3178:	e283308f 	add	r3, r3, #143	; 0x8f
    317c:	e1a03103 	lsl	r3, r3, #2
    3180:	e0813003 	add	r3, r1, r3
    3184:	e5933000 	ldr	r3, [r3]
    3188:	f57ff04f 	dsb	sy
    318c:	e1120003 	tst	r2, r3
    3190:	13a00001 	movne	r0, #1
    3194:	03a00000 	moveq	r0, #0
    3198:	e8bd8010 	pop	{r4, pc}
    319c:	e243c008 	sub	ip, r3, #8
    31a0:	e353000d 	cmp	r3, #13
    31a4:	135c0002 	cmpne	ip, #2
    31a8:	9a000002 	bls	31b8 <ipu_get_cur_buffer_idx+0xb0>
    31ac:	e201103d 	and	r1, r1, #61	; 0x3d
    31b0:	e3510015 	cmp	r1, #21
    31b4:	1a000016 	bne	3214 <ipu_get_cur_buffer_idx+0x10c>
    31b8:	e5900004 	ldr	r0, [r0, #4]
    31bc:	e59e1d48 	ldr	r1, [lr, #3400]	; 0xd48
    31c0:	e3500000 	cmp	r0, #0
    31c4:	0a00000e 	beq	3204 <ipu_get_cur_buffer_idx+0xfc>
    31c8:	e1a03083 	lsl	r3, r3, #1
    31cc:	e1a022a3 	lsr	r2, r3, #5
    31d0:	e2822096 	add	r2, r2, #150	; 0x96
    31d4:	e0811102 	add	r1, r1, r2, lsl #2
    31d8:	e5910000 	ldr	r0, [r1]
    31dc:	f57ff04f 	dsb	sy
    31e0:	e3a01003 	mov	r1, #3
    31e4:	e203201e 	and	r2, r3, #30
    31e8:	e0000211 	and	r0, r0, r1, lsl r2
    31ec:	e3a03001 	mov	r3, #1
    31f0:	e1a03213 	lsl	r3, r3, r2
    31f4:	e16f3f13 	clz	r3, r3
    31f8:	e263301f 	rsb	r3, r3, #31
    31fc:	e1a00330 	lsr	r0, r0, r3
    3200:	e8bd8010 	pop	{r4, pc}
    3204:	e1a032a3 	lsr	r3, r3, #5
    3208:	e2833049 	add	r3, r3, #73	; 0x49
    320c:	e1a03103 	lsl	r3, r3, #2
    3210:	eaffffda 	b	3180 <ipu_get_cur_buffer_idx+0x78>
    3214:	e243101b 	sub	r1, r3, #27
    3218:	e1510004 	cmp	r1, r4
    321c:	8affffd0 	bhi	3164 <ipu_get_cur_buffer_idx+0x5c>
    3220:	eaffffe4 	b	31b8 <ipu_get_cur_buffer_idx+0xb0>
    3224:	e3e00015 	mvn	r0, #21
    3228:	e12fff1e 	bx	lr

0000322c <ipu_init_channel_buffer>:
    322c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    3230:	e24dd094 	sub	sp, sp, #148	; 0x94
    3234:	e58d3024 	str	r3, [sp, #36]	; 0x24
    3238:	e3006000 	movw	r6, #0
    323c:	e1a05002 	mov	r5, r2
    3240:	e3406000 	movt	r6, #0
    3244:	e1dd3bb8 	ldrh	r3, [sp, #184]	; 0xb8
    3248:	e58d0018 	str	r0, [sp, #24]
    324c:	e58d102c 	str	r1, [sp, #44]	; 0x2c
    3250:	e58d301c 	str	r3, [sp, #28]
    3254:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3258:	e59d70c0 	ldr	r7, [sp, #192]	; 0xc0
    325c:	e59da0d4 	ldr	sl, [sp, #212]	; 0xd4
    3260:	e3530000 	cmp	r3, #0
    3264:	e1dd3bbc 	ldrh	r3, [sp, #188]	; 0xbc
    3268:	e59d90d8 	ldr	r9, [sp, #216]	; 0xd8
    326c:	e58d3028 	str	r3, [sp, #40]	; 0x28
    3270:	1a000006 	bne	3290 <ipu_init_channel_buffer+0x64>
    3274:	e1d637b2 	ldrh	r3, [r6, #114]	; 0x72
    3278:	e3130004 	tst	r3, #4
    327c:	0a000003 	beq	3290 <ipu_init_channel_buffer+0x64>
    3280:	e3001000 	movw	r1, #0
    3284:	e2860060 	add	r0, r6, #96	; 0x60
    3288:	e3401000 	movt	r1, #0
    328c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    3290:	e1d638ba 	ldrh	r3, [r6, #138]	; 0x8a
    3294:	e3130004 	tst	r3, #4
    3298:	0a000004 	beq	32b0 <ipu_init_channel_buffer+0x84>
    329c:	e3001000 	movw	r1, #0
    32a0:	e59d201c 	ldr	r2, [sp, #28]
    32a4:	e3401000 	movt	r1, #0
    32a8:	e59f0cf0 	ldr	r0, [pc, #3312]	; 3fa0 <ipu_init_channel_buffer+0xd74>
    32ac:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    32b0:	e1d63ab2 	ldrh	r3, [r6, #162]	; 0xa2
    32b4:	e3130004 	tst	r3, #4
    32b8:	0a000004 	beq	32d0 <ipu_init_channel_buffer+0xa4>
    32bc:	e3001000 	movw	r1, #0
    32c0:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    32c4:	e3401000 	movt	r1, #0
    32c8:	e59f0cd4 	ldr	r0, [pc, #3284]	; 3fa4 <ipu_init_channel_buffer+0xd78>
    32cc:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    32d0:	e1d63bba 	ldrh	r3, [r6, #186]	; 0xba
    32d4:	e3130004 	tst	r3, #4
    32d8:	0a000004 	beq	32f0 <ipu_init_channel_buffer+0xc4>
    32dc:	e3001000 	movw	r1, #0
    32e0:	e1a02007 	mov	r2, r7
    32e4:	e3401000 	movt	r1, #0
    32e8:	e59f0cb8 	ldr	r0, [pc, #3256]	; 3fa8 <ipu_init_channel_buffer+0xd7c>
    32ec:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    32f0:	e1d63db2 	ldrh	r3, [r6, #210]	; 0xd2
    32f4:	e3130004 	tst	r3, #4
    32f8:	0a000004 	beq	3310 <ipu_init_channel_buffer+0xe4>
    32fc:	e3001000 	movw	r1, #0
    3300:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    3304:	e3401000 	movt	r1, #0
    3308:	e59f0c9c 	ldr	r0, [pc, #3228]	; 3fac <ipu_init_channel_buffer+0xd80>
    330c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    3310:	e1d63eba 	ldrh	r3, [r6, #234]	; 0xea
    3314:	e3130004 	tst	r3, #4
    3318:	0a000004 	beq	3330 <ipu_init_channel_buffer+0x104>
    331c:	e3001000 	movw	r1, #0
    3320:	e59d20cc 	ldr	r2, [sp, #204]	; 0xcc
    3324:	e3401000 	movt	r1, #0
    3328:	e59f0c80 	ldr	r0, [pc, #3200]	; 3fb0 <ipu_init_channel_buffer+0xd84>
    332c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    3330:	e3003102 	movw	r3, #258	; 0x102
    3334:	e19630b3 	ldrh	r3, [r6, r3]
    3338:	e3130004 	tst	r3, #4
    333c:	0a000004 	beq	3354 <ipu_init_channel_buffer+0x128>
    3340:	e3001000 	movw	r1, #0
    3344:	e1a0200a 	mov	r2, sl
    3348:	e3401000 	movt	r1, #0
    334c:	e59f0c60 	ldr	r0, [pc, #3168]	; 3fb4 <ipu_init_channel_buffer+0xd88>
    3350:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    3354:	e300311a 	movw	r3, #282	; 0x11a
    3358:	e19630b3 	ldrh	r3, [r6, r3]
    335c:	e3130004 	tst	r3, #4
    3360:	0a000004 	beq	3378 <ipu_init_channel_buffer+0x14c>
    3364:	e3001000 	movw	r1, #0
    3368:	e1a02009 	mov	r2, r9
    336c:	e3401000 	movt	r1, #0
    3370:	e59f0c40 	ldr	r0, [pc, #3136]	; 3fb8 <ipu_init_channel_buffer+0xd8c>
    3374:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    3378:	e0855085 	add	r5, r5, r5, lsl #1
    337c:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    3380:	e1a05085 	lsl	r5, r5, #1
    3384:	e1a03533 	lsr	r3, r3, r5
    3388:	e203503f 	and	r5, r3, #63	; 0x3f
    338c:	e58d3030 	str	r3, [sp, #48]	; 0x30
    3390:	e355003f 	cmp	r5, #63	; 0x3f
    3394:	0a0008fd 	beq	5790 <ipu_init_channel_buffer+0x2564>
    3398:	e3003132 	movw	r3, #306	; 0x132
    339c:	e19630b3 	ldrh	r3, [r6, r3]
    33a0:	e3130004 	tst	r3, #4
    33a4:	0a000004 	beq	33bc <ipu_init_channel_buffer+0x190>
    33a8:	e3001000 	movw	r1, #0
    33ac:	e1a02005 	mov	r2, r5
    33b0:	e3401000 	movt	r1, #0
    33b4:	e59f0c00 	ldr	r0, [pc, #3072]	; 3fbc <ipu_init_channel_buffer+0xd90>
    33b8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    33bc:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    33c0:	ebfffffe 	bl	6d4 <bytes_per_pixel>
    33c4:	e59d301c 	ldr	r3, [sp, #28]
    33c8:	e0000390 	mul	r0, r0, r3
    33cc:	e1500007 	cmp	r0, r7
    33d0:	21a07000 	movcs	r7, r0
    33d4:	e2173003 	ands	r3, r7, #3
    33d8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    33dc:	1a0008ed 	bne	5798 <ipu_init_channel_buffer+0x256c>
    33e0:	e245b00b 	sub	fp, r5, #11
    33e4:	e35b000b 	cmp	fp, #11
    33e8:	83a03000 	movhi	r3, #0
    33ec:	93a03001 	movls	r3, #1
    33f0:	e3550011 	cmp	r5, #17
    33f4:	03a03000 	moveq	r3, #0
    33f8:	e58d3038 	str	r3, [sp, #56]	; 0x38
    33fc:	e3550012 	cmp	r5, #18
    3400:	03a03000 	moveq	r3, #0
    3404:	12033001 	andne	r3, r3, #1
    3408:	e3530000 	cmp	r3, #0
    340c:	e58d3034 	str	r3, [sp, #52]	; 0x34
    3410:	1a00006a 	bne	35c0 <ipu_init_channel_buffer+0x394>
    3414:	e245202d 	sub	r2, r5, #45	; 0x2d
    3418:	e3520005 	cmp	r2, #5
    341c:	9a000067 	bls	35c0 <ipu_init_channel_buffer+0x394>
    3420:	e3550005 	cmp	r5, #5
    3424:	0a0000b2 	beq	36f4 <ipu_init_channel_buffer+0x4c8>
    3428:	e2453008 	sub	r3, r5, #8
    342c:	e3530002 	cmp	r3, #2
    3430:	e58d3020 	str	r3, [sp, #32]
    3434:	83a08000 	movhi	r8, #0
    3438:	93a08001 	movls	r8, #1
    343c:	e355000d 	cmp	r5, #13
    3440:	11a02008 	movne	r2, r8
    3444:	03882001 	orreq	r2, r8, #1
    3448:	e3520000 	cmp	r2, #0
    344c:	0a0000ca 	beq	377c <ipu_init_channel_buffer+0x550>
    3450:	e59d3018 	ldr	r3, [sp, #24]
    3454:	e5932004 	ldr	r2, [r3, #4]
    3458:	e3520000 	cmp	r2, #0
    345c:	1a000071 	bne	3628 <ipu_init_channel_buffer+0x3fc>
    3460:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    3464:	e3530000 	cmp	r3, #0
    3468:	1a0008d3 	bne	57bc <ipu_init_channel_buffer+0x2590>
    346c:	e59d4018 	ldr	r4, [sp, #24]
    3470:	e2843d79 	add	r3, r4, #7744	; 0x1e40
    3474:	e2833008 	add	r3, r3, #8
    3478:	e1a00003 	mov	r0, r3
    347c:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    3480:	ebfffffe 	bl	0 <mutex_lock>
    3484:	e3a01040 	mov	r1, #64	; 0x40
    3488:	e28d0050 	add	r0, sp, #80	; 0x50
    348c:	ebfffffe 	bl	0 <__memzero>
    3490:	e59d105c 	ldr	r1, [sp, #92]	; 0x5c
    3494:	e3580000 	cmp	r8, #0
    3498:	e59d301c 	ldr	r3, [sp, #28]
    349c:	e59d0060 	ldr	r0, [sp, #96]	; 0x60
    34a0:	e2432001 	sub	r2, r3, #1
    34a4:	e1811e82 	orr	r1, r1, r2, lsl #29
    34a8:	e18021a2 	orr	r2, r0, r2, lsr #3
    34ac:	e58d105c 	str	r1, [sp, #92]	; 0x5c
    34b0:	1a00004d 	bne	35ec <ipu_init_channel_buffer+0x3c0>
    34b4:	e59d3018 	ldr	r3, [sp, #24]
    34b8:	e59d007c 	ldr	r0, [sp, #124]	; 0x7c
    34bc:	e2834a01 	add	r4, r3, #4096	; 0x1000
    34c0:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    34c4:	e2471001 	sub	r1, r7, #1
    34c8:	e1801301 	orr	r1, r0, r1, lsl #6
    34cc:	e243c001 	sub	ip, r3, #1
    34d0:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    34d4:	e182250c 	orr	r2, r2, ip, lsl #10
    34d8:	e58d2060 	str	r2, [sp, #96]	; 0x60
    34dc:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    34e0:	e59d2074 	ldr	r2, [sp, #116]	; 0x74
    34e4:	e59d0070 	ldr	r0, [sp, #112]	; 0x70
    34e8:	e1a011a3 	lsr	r1, r3, #3
    34ec:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    34f0:	e1a0c1a3 	lsr	ip, r3, #3
    34f4:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    34f8:	e1811e8c 	orr	r1, r1, ip, lsl #29
    34fc:	e3130007 	tst	r3, #7
    3500:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    3504:	e1801001 	orr	r1, r0, r1
    3508:	e58d1070 	str	r1, [sp, #112]	; 0x70
    350c:	e1822323 	orr	r2, r2, r3, lsr #6
    3510:	e58d2074 	str	r2, [sp, #116]	; 0x74
    3514:	1a000092 	bne	3764 <ipu_init_channel_buffer+0x538>
    3518:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    351c:	e3130007 	tst	r3, #7
    3520:	1a000089 	bne	374c <ipu_init_channel_buffer+0x520>
    3524:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    3528:	e3032459 	movw	r2, #13401	; 0x3459
    352c:	e3432434 	movt	r2, #13364	; 0x3434
    3530:	e1510002 	cmp	r1, r2
    3534:	0a000862 	beq	56c4 <ipu_init_channel_buffer+0x2498>
    3538:	8a00004b 	bhi	366c <ipu_init_channel_buffer+0x440>
    353c:	e305264e 	movw	r2, #22094	; 0x564e
    3540:	e3432231 	movt	r2, #12849	; 0x3231
    3544:	e1510002 	cmp	r1, r2
    3548:	0a000825 	beq	55e4 <ipu_init_channel_buffer+0x23b8>
    354c:	9a0005b9 	bls	4c38 <ipu_init_channel_buffer+0x1a0c>
    3550:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    3554:	e3042752 	movw	r2, #18258	; 0x4752
    3558:	e3432342 	movt	r2, #13122	; 0x3342
    355c:	e1510002 	cmp	r1, r2
    3560:	0a000857 	beq	56c4 <ipu_init_channel_buffer+0x2498>
    3564:	9a0000a7 	bls	3808 <ipu_init_channel_buffer+0x5dc>
    3568:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    356c:	e3033434 	movw	r3, #13364	; 0x3434
    3570:	e3433434 	movt	r3, #13364	; 0x3434
    3574:	e1520003 	cmp	r2, r3
    3578:	0a00085d 	beq	56f4 <ipu_init_channel_buffer+0x24c8>
    357c:	e3033456 	movw	r3, #13398	; 0x3456
    3580:	e3433434 	movt	r3, #13364	; 0x3434
    3584:	e1520003 	cmp	r2, r3
    3588:	0a000749 	beq	52b4 <ipu_init_channel_buffer+0x2088>
    358c:	e3043742 	movw	r3, #18242	; 0x4742
    3590:	e3433352 	movt	r3, #13138	; 0x3352
    3594:	e1520003 	cmp	r2, r3
    3598:	0a000805 	beq	55b4 <ipu_init_channel_buffer+0x2388>
    359c:	e3001000 	movw	r1, #0
    35a0:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    35a4:	e3401000 	movt	r1, #0
    35a8:	ebfffffe 	bl	0 <dev_err>
    35ac:	e19a3009 	orrs	r3, sl, r9
    35b0:	1a0000e6 	bne	3950 <ipu_init_channel_buffer+0x724>
    35b4:	e3a07000 	mov	r7, #0
    35b8:	e1a08007 	mov	r8, r7
    35bc:	ea000106 	b	39dc <ipu_init_channel_buffer+0x7b0>
    35c0:	e59d301c 	ldr	r3, [sp, #28]
    35c4:	e3130007 	tst	r3, #7
    35c8:	0affff94 	beq	3420 <ipu_init_channel_buffer+0x1f4>
    35cc:	e59d3018 	ldr	r3, [sp, #24]
    35d0:	e3001000 	movw	r1, #0
    35d4:	e3401000 	movt	r1, #0
    35d8:	e2833a01 	add	r3, r3, #4096	; 0x1000
    35dc:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    35e0:	ebfffffe 	bl	0 <dev_err>
    35e4:	e3e00015 	mvn	r0, #21
    35e8:	ea000469 	b	4794 <ipu_init_channel_buffer+0x1568>
    35ec:	e2844a01 	add	r4, r4, #4096	; 0x1000
    35f0:	e59d007c 	ldr	r0, [sp, #124]	; 0x7c
    35f4:	e5941ebc 	ldr	r1, [r4, #3772]	; 0xebc
    35f8:	e3510000 	cmp	r1, #0
    35fc:	1affffaf 	bne	34c0 <ipu_init_channel_buffer+0x294>
    3600:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    3604:	e1a01387 	lsl	r1, r7, #7
    3608:	e2411040 	sub	r1, r1, #64	; 0x40
    360c:	e1811000 	orr	r1, r1, r0
    3610:	e1a0c0a3 	lsr	ip, r3, #1
    3614:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    3618:	e24cc001 	sub	ip, ip, #1
    361c:	e182250c 	orr	r2, r2, ip, lsl #10
    3620:	e58d2060 	str	r2, [sp, #96]	; 0x60
    3624:	eaffffac 	b	34dc <ipu_init_channel_buffer+0x2b0>
    3628:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    362c:	e2932000 	adds	r2, r3, #0
    3630:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    3634:	13a02001 	movne	r2, #1
    3638:	e3530000 	cmp	r3, #0
    363c:	13a02000 	movne	r2, #0
    3640:	e3520000 	cmp	r2, #0
    3644:	0affff88 	beq	346c <ipu_init_channel_buffer+0x240>
    3648:	e59d3018 	ldr	r3, [sp, #24]
    364c:	e3001000 	movw	r1, #0
    3650:	e1a02005 	mov	r2, r5
    3654:	e3401000 	movt	r1, #0
    3658:	e2833a01 	add	r3, r3, #4096	; 0x1000
    365c:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    3660:	ebfffffe 	bl	0 <dev_err>
    3664:	e3e00015 	mvn	r0, #21
    3668:	ea000449 	b	4794 <ipu_init_channel_buffer+0x1568>
    366c:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    3670:	e3032234 	movw	r2, #12852	; 0x3234
    3674:	e3452032 	movt	r2, #20530	; 0x5032
    3678:	e1530002 	cmp	r3, r2
    367c:	0a0007af 	beq	5540 <ipu_init_channel_buffer+0x2314>
    3680:	9a000072 	bls	3850 <ipu_init_channel_buffer+0x624>
    3684:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    3688:	e3042241 	movw	r2, #16961	; 0x4241
    368c:	e3452247 	movt	r2, #21063	; 0x5247
    3690:	e1510002 	cmp	r1, r2
    3694:	0a0007e2 	beq	5624 <ipu_init_channel_buffer+0x23f8>
    3698:	9a000040 	bls	37a0 <ipu_init_channel_buffer+0x574>
    369c:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    36a0:	e3053559 	movw	r3, #21849	; 0x5559
    36a4:	e3453659 	movt	r3, #22105	; 0x5659
    36a8:	e1520003 	cmp	r2, r3
    36ac:	0a0007b0 	beq	5574 <ipu_init_channel_buffer+0x2348>
    36b0:	e3053955 	movw	r3, #22869	; 0x5955
    36b4:	e3453956 	movt	r3, #22870	; 0x5956
    36b8:	e1520003 	cmp	r2, r3
    36bc:	1a00072a 	bne	536c <ipu_init_channel_buffer+0x2140>
    36c0:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    36c4:	e3580000 	cmp	r8, #0
    36c8:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    36cc:	e18a1009 	orr	r1, sl, r9
    36d0:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    36d4:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    36d8:	0a00081c 	beq	5750 <ipu_init_channel_buffer+0x2524>
    36dc:	e3833505 	orr	r3, r3, #20971520	; 0x1400000
    36e0:	e3510000 	cmp	r1, #0
    36e4:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    36e8:	e58d3078 	str	r3, [sp, #120]	; 0x78
    36ec:	1a000097 	bne	3950 <ipu_init_channel_buffer+0x724>
    36f0:	eaffffaf 	b	35b4 <ipu_init_channel_buffer+0x388>
    36f4:	e59d301c 	ldr	r3, [sp, #28]
    36f8:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    36fc:	e352000f 	cmp	r2, #15
    3700:	8353000f 	cmphi	r3, #15
    3704:	93a08001 	movls	r8, #1
    3708:	83a08000 	movhi	r8, #0
    370c:	9a000817 	bls	5770 <ipu_init_channel_buffer+0x2544>
    3710:	e3130001 	tst	r3, #1
    3714:	1a000815 	bne	5770 <ipu_init_channel_buffer+0x2544>
    3718:	e3120003 	tst	r2, #3
    371c:	1a000813 	bne	5770 <ipu_init_channel_buffer+0x2544>
    3720:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    3724:	e203203d 	and	r2, r3, #61	; 0x3d
    3728:	e3e03002 	mvn	r3, #2
    372c:	e3520015 	cmp	r2, #21
    3730:	e58d3020 	str	r3, [sp, #32]
    3734:	1affff49 	bne	3460 <ipu_init_channel_buffer+0x234>
    3738:	e59d3018 	ldr	r3, [sp, #24]
    373c:	e5932004 	ldr	r2, [r3, #4]
    3740:	e3520000 	cmp	r2, #0
    3744:	1affffb7 	bne	3628 <ipu_init_channel_buffer+0x3fc>
    3748:	eaffff44 	b	3460 <ipu_init_channel_buffer+0x234>
    374c:	e3001000 	movw	r1, #0
    3750:	e1a02005 	mov	r2, r5
    3754:	e3401000 	movt	r1, #0
    3758:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    375c:	ebfffffe 	bl	0 <dev_warn>
    3760:	eaffff6f 	b	3524 <ipu_init_channel_buffer+0x2f8>
    3764:	e3001000 	movw	r1, #0
    3768:	e1a02005 	mov	r2, r5
    376c:	e3401000 	movt	r1, #0
    3770:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    3774:	ebfffffe 	bl	0 <dev_warn>
    3778:	eaffff66 	b	3518 <ipu_init_channel_buffer+0x2ec>
    377c:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    3780:	e203103d 	and	r1, r3, #61	; 0x3d
    3784:	e3510015 	cmp	r1, #21
    3788:	0a000608 	beq	4fb0 <ipu_init_channel_buffer+0x1d84>
    378c:	e245101b 	sub	r1, r5, #27
    3790:	e1a08002 	mov	r8, r2
    3794:	e3510001 	cmp	r1, #1
    3798:	9affff2c 	bls	3450 <ipu_init_channel_buffer+0x224>
    379c:	eaffff2f 	b	3460 <ipu_init_channel_buffer+0x234>
    37a0:	e3032434 	movw	r2, #13364	; 0x3434
    37a4:	e3452034 	movt	r2, #20532	; 0x5034
    37a8:	e1510002 	cmp	r1, r2
    37ac:	0a0006b4 	beq	5284 <ipu_init_channel_buffer+0x2058>
    37b0:	e3043752 	movw	r3, #18258	; 0x4752
    37b4:	e3453042 	movt	r3, #20546	; 0x5042
    37b8:	e1510003 	cmp	r1, r3
    37bc:	1affff76 	bne	359c <ipu_init_channel_buffer+0x370>
    37c0:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    37c4:	e19a3009 	orrs	r3, sl, r9
    37c8:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    37cc:	e59d307c 	ldr	r3, [sp, #124]	; 0x7c
    37d0:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    37d4:	e38118e7 	orr	r1, r1, #15138816	; 0xe70000
    37d8:	e3822a82 	orr	r2, r2, #532480	; 0x82000
    37dc:	e3811903 	orr	r1, r1, #49152	; 0xc000
    37e0:	e38334f2 	orr	r3, r3, #-234881024	; 0xf2000000
    37e4:	e3822eca 	orr	r2, r2, #3232	; 0xca0
    37e8:	e3833503 	orr	r3, r3, #12582912	; 0xc00000
    37ec:	e3800b06 	orr	r0, r0, #6144	; 0x1800
    37f0:	e58d1078 	str	r1, [sp, #120]	; 0x78
    37f4:	e58d2080 	str	r2, [sp, #128]	; 0x80
    37f8:	e58d307c 	str	r3, [sp, #124]	; 0x7c
    37fc:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    3800:	1a000052 	bne	3950 <ipu_init_channel_buffer+0x724>
    3804:	eaffff6a 	b	35b4 <ipu_init_channel_buffer+0x388>
    3808:	e3052659 	movw	r2, #22105	; 0x5659
    380c:	e3432231 	movt	r2, #12849	; 0x3231
    3810:	e1510002 	cmp	r1, r2
    3814:	0a0006b7 	beq	52f8 <ipu_init_channel_buffer+0x20cc>
    3818:	e3053049 	movw	r3, #20553	; 0x5049
    381c:	e3433255 	movt	r3, #12885	; 0x3255
    3820:	e1510003 	cmp	r1, r3
    3824:	1affff5c 	bne	359c <ipu_init_channel_buffer+0x370>
    3828:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    382c:	e19a2009 	orrs	r2, sl, r9
    3830:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    3834:	e38338c7 	orr	r3, r3, #13041664	; 0xc70000
    3838:	e3833903 	orr	r3, r3, #49152	; 0xc000
    383c:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    3840:	e58d3078 	str	r3, [sp, #120]	; 0x78
    3844:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    3848:	1a000040 	bne	3950 <ipu_init_channel_buffer+0x724>
    384c:	eaffff58 	b	35b4 <ipu_init_channel_buffer+0x388>
    3850:	e305264e 	movw	r2, #22094	; 0x564e
    3854:	e3432631 	movt	r2, #13873	; 0x3631
    3858:	e1530002 	cmp	r3, r2
    385c:	0a00077e 	beq	565c <ipu_init_channel_buffer+0x2430>
    3860:	9a000024 	bls	38f8 <ipu_init_channel_buffer+0x6cc>
    3864:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    3868:	e3042752 	movw	r2, #18258	; 0x4752
    386c:	e3442142 	movt	r2, #16706	; 0x4142
    3870:	e1530002 	cmp	r3, r2
    3874:	0a0006d4 	beq	53cc <ipu_init_channel_buffer+0x21a0>
    3878:	e3042742 	movw	r2, #18242	; 0x4742
    387c:	e3442152 	movt	r2, #16722	; 0x4152
    3880:	e1530002 	cmp	r3, r2
    3884:	0a000024 	beq	391c <ipu_init_channel_buffer+0x6f0>
    3888:	e3052659 	movw	r2, #22105	; 0x5659
    388c:	e3432631 	movt	r2, #13873	; 0x3631
    3890:	e1530002 	cmp	r3, r2
    3894:	1affff40 	bne	359c <ipu_init_channel_buffer+0x370>
    3898:	e3590000 	cmp	r9, #0
    389c:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    38a0:	059d3028 	ldreq	r3, [sp, #40]	; 0x28
    38a4:	e1a000a7 	lsr	r0, r7, #1
    38a8:	11a01009 	movne	r1, r9
    38ac:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    38b0:	e58d2078 	str	r2, [sp, #120]	; 0x78
    38b4:	00010397 	muleq	r1, r7, r3
    38b8:	e35a0000 	cmp	sl, #0
    38bc:	e1a07000 	mov	r7, r0
    38c0:	008100a1 	addeq	r0, r1, r1, lsr #1
    38c4:	0a000698 	beq	532c <ipu_init_channel_buffer+0x2100>
    38c8:	e1a0000a 	mov	r0, sl
    38cc:	e3570000 	cmp	r7, #0
    38d0:	0a00001e 	beq	3950 <ipu_init_channel_buffer+0x724>
    38d4:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    38d8:	e2473001 	sub	r3, r7, #1
    38dc:	e1823003 	orr	r3, r2, r3
    38e0:	e58d3080 	str	r3, [sp, #128]	; 0x80
    38e4:	e18a3009 	orr	r3, sl, r9
    38e8:	e3530000 	cmp	r3, #0
    38ec:	01a09001 	moveq	r9, r1
    38f0:	01a0a000 	moveq	sl, r0
    38f4:	ea000015 	b	3950 <ipu_init_channel_buffer+0x724>
    38f8:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    38fc:	e3043752 	movw	r3, #18258	; 0x4752
    3900:	e3433442 	movt	r3, #13378	; 0x3442
    3904:	e1520003 	cmp	r2, r3
    3908:	0a0006af 	beq	53cc <ipu_init_channel_buffer+0x21a0>
    390c:	e3043742 	movw	r3, #18242	; 0x4742
    3910:	e3433452 	movt	r3, #13394	; 0x3452
    3914:	e1520003 	cmp	r2, r3
    3918:	1affff1f 	bne	359c <ipu_init_channel_buffer+0x370>
    391c:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    3920:	e19a3009 	orrs	r3, sl, r9
    3924:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    3928:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    392c:	e1e02602 	mvn	r2, r2, lsl #12
    3930:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    3934:	e3833c62 	orr	r3, r3, #25088	; 0x6200
    3938:	e1e02622 	mvn	r2, r2, lsr #12
    393c:	e3811903 	orr	r1, r1, #49152	; 0xc000
    3940:	e3833008 	orr	r3, r3, #8
    3944:	e58d1078 	str	r1, [sp, #120]	; 0x78
    3948:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    394c:	0affff18 	beq	35b4 <ipu_init_channel_buffer+0x388>
    3950:	e35a0402 	cmp	sl, #33554432	; 0x2000000
    3954:	3a000004 	bcc	396c <ipu_init_channel_buffer+0x740>
    3958:	e3001000 	movw	r1, #0
    395c:	e1a02005 	mov	r2, r5
    3960:	e3401000 	movt	r1, #0
    3964:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    3968:	ebfffffe 	bl	0 <dev_warn>
    396c:	e1a031a9 	lsr	r3, r9, #3
    3970:	e1a07aaa 	lsr	r7, sl, #21
    3974:	e1a081aa 	lsr	r8, sl, #3
    3978:	e3590402 	cmp	r9, #33554432	; 0x2000000
    397c:	e1877203 	orr	r7, r7, r3, lsl #4
    3980:	e2099007 	and	r9, r9, #7
    3984:	e1a08708 	lsl	r8, r8, #14
    3988:	e20aa007 	and	sl, sl, #7
    398c:	3a000004 	bcc	39a4 <ipu_init_channel_buffer+0x778>
    3990:	e3001000 	movw	r1, #0
    3994:	e1a02005 	mov	r2, r5
    3998:	e3401000 	movt	r1, #0
    399c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    39a0:	ebfffffe 	bl	0 <dev_warn>
    39a4:	e35a0000 	cmp	sl, #0
    39a8:	0a000004 	beq	39c0 <ipu_init_channel_buffer+0x794>
    39ac:	e3001000 	movw	r1, #0
    39b0:	e1a02005 	mov	r2, r5
    39b4:	e3401000 	movt	r1, #0
    39b8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    39bc:	ebfffffe 	bl	0 <dev_warn>
    39c0:	e3590000 	cmp	r9, #0
    39c4:	0a000004 	beq	39dc <ipu_init_channel_buffer+0x7b0>
    39c8:	e3001000 	movw	r1, #0
    39cc:	e1a02005 	mov	r2, r5
    39d0:	e3401000 	movt	r1, #0
    39d4:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    39d8:	ebfffffe 	bl	0 <dev_warn>
    39dc:	e300214a 	movw	r2, #330	; 0x14a
    39e0:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
    39e4:	e19610b2 	ldrh	r1, [r6, r2]
    39e8:	e1a00305 	lsl	r0, r5, #6
    39ec:	e59d2058 	ldr	r2, [sp, #88]	; 0x58
    39f0:	e5949d78 	ldr	r9, [r4, #3448]	; 0xd78
    39f4:	e1838008 	orr	r8, r3, r8
    39f8:	e3110004 	tst	r1, #4
    39fc:	e58d0040 	str	r0, [sp, #64]	; 0x40
    3a00:	e1827007 	orr	r7, r2, r7
    3a04:	e58d8054 	str	r8, [sp, #84]	; 0x54
    3a08:	e58d7058 	str	r7, [sp, #88]	; 0x58
    3a0c:	e0899000 	add	r9, r9, r0
    3a10:	e1a07000 	mov	r7, r0
    3a14:	0a000008 	beq	3a3c <ipu_init_channel_buffer+0x810>
    3a18:	e3002000 	movw	r2, #0
    3a1c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    3a20:	e3402000 	movt	r2, #0
    3a24:	e58d9000 	str	r9, [sp]
    3a28:	e1a03005 	mov	r3, r5
    3a2c:	e59f058c 	ldr	r0, [pc, #1420]	; 3fc0 <ipu_init_channel_buffer+0xd94>
    3a30:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    3a34:	e5949d78 	ldr	r9, [r4, #3448]	; 0xd78
    3a38:	e0899007 	add	r9, r9, r7
    3a3c:	e28d7050 	add	r7, sp, #80	; 0x50
    3a40:	e2898014 	add	r8, r9, #20
    3a44:	e1a0b007 	mov	fp, r7
    3a48:	e1a0a009 	mov	sl, r9
    3a4c:	f57ff04e 	dsb	st
    3a50:	ebfffffe 	bl	0 <arm_heavy_mb>
    3a54:	e49b3004 	ldr	r3, [fp], #4
    3a58:	e58a3000 	str	r3, [sl]
    3a5c:	e28aa004 	add	sl, sl, #4
    3a60:	e15a0008 	cmp	sl, r8
    3a64:	1afffff8 	bne	3a4c <ipu_init_channel_buffer+0x820>
    3a68:	e28d8070 	add	r8, sp, #112	; 0x70
    3a6c:	e289a020 	add	sl, r9, #32
    3a70:	e1a0b008 	mov	fp, r8
    3a74:	e2899034 	add	r9, r9, #52	; 0x34
    3a78:	f57ff04e 	dsb	st
    3a7c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3a80:	e49b3004 	ldr	r3, [fp], #4
    3a84:	e58a3000 	str	r3, [sl]
    3a88:	e28aa004 	add	sl, sl, #4
    3a8c:	e15a0009 	cmp	sl, r9
    3a90:	1afffff8 	bne	3a78 <ipu_init_channel_buffer+0x84c>
    3a94:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    3a98:	e3530000 	cmp	r3, #0
    3a9c:	0a00002f 	beq	3b60 <ipu_init_channel_buffer+0x934>
    3aa0:	e59d3020 	ldr	r3, [sp, #32]
    3aa4:	e3530014 	cmp	r3, #20
    3aa8:	8a00002c 	bhi	3b60 <ipu_init_channel_buffer+0x934>
    3aac:	e300a000 	movw	sl, #0
    3ab0:	e340a000 	movt	sl, #0
    3ab4:	e79aa103 	ldr	sl, [sl, r3, lsl #2]
    3ab8:	e35a0000 	cmp	sl, #0
    3abc:	da000027 	ble	3b60 <ipu_init_channel_buffer+0x934>
    3ac0:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
    3ac4:	e59d20d0 	ldr	r2, [sp, #208]	; 0xd0
    3ac8:	e3120007 	tst	r2, #7
    3acc:	e18331a2 	orr	r3, r3, r2, lsr #3
    3ad0:	e58d3070 	str	r3, [sp, #112]	; 0x70
    3ad4:	1a000564 	bne	506c <ipu_init_channel_buffer+0x1e40>
    3ad8:	e3003162 	movw	r3, #354	; 0x162
    3adc:	e5949d78 	ldr	r9, [r4, #3448]	; 0xd78
    3ae0:	e19630b3 	ldrh	r3, [r6, r3]
    3ae4:	e1a0a30a 	lsl	sl, sl, #6
    3ae8:	e089900a 	add	r9, r9, sl
    3aec:	e3130004 	tst	r3, #4
    3af0:	0a000008 	beq	3b18 <ipu_init_channel_buffer+0x8ec>
    3af4:	e3002000 	movw	r2, #0
    3af8:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    3afc:	e3402000 	movt	r2, #0
    3b00:	e58d9000 	str	r9, [sp]
    3b04:	e1a03005 	mov	r3, r5
    3b08:	e59f04b4 	ldr	r0, [pc, #1204]	; 3fc4 <ipu_init_channel_buffer+0xd98>
    3b0c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    3b10:	e5949d78 	ldr	r9, [r4, #3448]	; 0xd78
    3b14:	e089900a 	add	r9, r9, sl
    3b18:	e289b014 	add	fp, r9, #20
    3b1c:	e1a0a009 	mov	sl, r9
    3b20:	f57ff04e 	dsb	st
    3b24:	ebfffffe 	bl	0 <arm_heavy_mb>
    3b28:	e4973004 	ldr	r3, [r7], #4
    3b2c:	e58a3000 	str	r3, [sl]
    3b30:	e28aa004 	add	sl, sl, #4
    3b34:	e15a000b 	cmp	sl, fp
    3b38:	1afffff8 	bne	3b20 <ipu_init_channel_buffer+0x8f4>
    3b3c:	e2897020 	add	r7, r9, #32
    3b40:	e2899034 	add	r9, r9, #52	; 0x34
    3b44:	f57ff04e 	dsb	st
    3b48:	ebfffffe 	bl	0 <arm_heavy_mb>
    3b4c:	e4983004 	ldr	r3, [r8], #4
    3b50:	e5873000 	str	r3, [r7]
    3b54:	e2877004 	add	r7, r7, #4
    3b58:	e1570009 	cmp	r7, r9
    3b5c:	1afffff8 	bne	3b44 <ipu_init_channel_buffer+0x918>
    3b60:	e245800e 	sub	r8, r5, #14
    3b64:	e3580001 	cmp	r8, #1
    3b68:	9a000388 	bls	4990 <ipu_init_channel_buffer+0x1764>
    3b6c:	e2453017 	sub	r3, r5, #23
    3b70:	e3d33004 	bics	r3, r3, #4
    3b74:	1a000006 	bne	3b94 <ipu_init_channel_buffer+0x968>
    3b78:	e59d3018 	ldr	r3, [sp, #24]
    3b7c:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    3b80:	e0832c42 	add	r2, r3, r2, asr #24
    3b84:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    3b88:	e7d23003 	ldrb	r3, [r2, r3]
    3b8c:	e3530000 	cmp	r3, #0
    3b90:	1a0003df 	bne	4b14 <ipu_init_channel_buffer+0x18e8>
    3b94:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3b98:	e3530000 	cmp	r3, #0
    3b9c:	0a000025 	beq	3c38 <ipu_init_channel_buffer+0xa0c>
    3ba0:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    3ba4:	e1a07305 	lsl	r7, r5, #6
    3ba8:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3bac:	e287700c 	add	r7, r7, #12
    3bb0:	e6ef8072 	uxtb	r8, r2
    3bb4:	e0833007 	add	r3, r3, r7
    3bb8:	e6ff8f38 	rbit	r8, r8
    3bbc:	e5939000 	ldr	r9, [r3]
    3bc0:	f57ff04f 	dsb	sy
    3bc4:	e1a08ea8 	lsr	r8, r8, #29
    3bc8:	e3c9950e 	bic	r9, r9, #58720256	; 0x3800000
    3bcc:	e1a08b88 	lsl	r8, r8, #23
    3bd0:	e1899008 	orr	r9, r9, r8
    3bd4:	f57ff04e 	dsb	st
    3bd8:	ebfffffe 	bl	0 <arm_heavy_mb>
    3bdc:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3be0:	e0837007 	add	r7, r3, r7
    3be4:	e5879000 	str	r9, [r7]
    3be8:	e59d2020 	ldr	r2, [sp, #32]
    3bec:	e3520014 	cmp	r2, #20
    3bf0:	8a000010 	bhi	3c38 <ipu_init_channel_buffer+0xa0c>
    3bf4:	e300a000 	movw	sl, #0
    3bf8:	e340a000 	movt	sl, #0
    3bfc:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    3c00:	e3520000 	cmp	r2, #0
    3c04:	da00000b 	ble	3c38 <ipu_init_channel_buffer+0xa0c>
    3c08:	e1a02302 	lsl	r2, r2, #6
    3c0c:	e282700c 	add	r7, r2, #12
    3c10:	e0833007 	add	r3, r3, r7
    3c14:	e5933000 	ldr	r3, [r3]
    3c18:	f57ff04f 	dsb	sy
    3c1c:	e3c3350e 	bic	r3, r3, #58720256	; 0x3800000
    3c20:	e1888003 	orr	r8, r8, r3
    3c24:	f57ff04e 	dsb	st
    3c28:	ebfffffe 	bl	0 <arm_heavy_mb>
    3c2c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3c30:	e0837007 	add	r7, r3, r7
    3c34:	e5878000 	str	r8, [r7]
    3c38:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    3c3c:	e3530000 	cmp	r3, #0
    3c40:	0a000331 	beq	490c <ipu_init_channel_buffer+0x16e0>
    3c44:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    3c48:	e3530000 	cmp	r3, #0
    3c4c:	0a000330 	beq	4914 <ipu_init_channel_buffer+0x16e8>
    3c50:	e1a07205 	lsl	r7, r5, #4
    3c54:	e59d201c 	ldr	r2, [sp, #28]
    3c58:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3c5c:	e287900a 	add	r9, r7, #10
    3c60:	e1a08007 	mov	r8, r7
    3c64:	e1a09109 	lsl	r9, r9, #2
    3c68:	e312000f 	tst	r2, #15
    3c6c:	e0833009 	add	r3, r3, r9
    3c70:	1a000383 	bne	4a84 <ipu_init_channel_buffer+0x1858>
    3c74:	e593a000 	ldr	sl, [r3]
    3c78:	f57ff04f 	dsb	sy
    3c7c:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    3c80:	e38aa90f 	orr	sl, sl, #245760	; 0x3c000
    3c84:	f57ff04e 	dsb	st
    3c88:	ebfffffe 	bl	0 <arm_heavy_mb>
    3c8c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3c90:	e0832009 	add	r2, r3, r9
    3c94:	e582a000 	str	sl, [r2]
    3c98:	e59d2020 	ldr	r2, [sp, #32]
    3c9c:	e3520014 	cmp	r2, #20
    3ca0:	8a00036e 	bhi	4a60 <ipu_init_channel_buffer+0x1834>
    3ca4:	e300a000 	movw	sl, #0
    3ca8:	e340a000 	movt	sl, #0
    3cac:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    3cb0:	e3520000 	cmp	r2, #0
    3cb4:	ca0004e4 	bgt	504c <ipu_init_channel_buffer+0x1e20>
    3cb8:	e59d102c 	ldr	r1, [sp, #44]	; 0x2c
    3cbc:	e59d0018 	ldr	r0, [sp, #24]
    3cc0:	ebfffffe 	bl	0 <_ipu_disp_chan_is_interlaced>
    3cc4:	e3500000 	cmp	r0, #0
    3cc8:	0a000328 	beq	4970 <ipu_init_channel_buffer+0x1744>
    3ccc:	e287900a 	add	r9, r7, #10
    3cd0:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3cd4:	e1a09109 	lsl	r9, r9, #2
    3cd8:	e1a08007 	mov	r8, r7
    3cdc:	e249b01c 	sub	fp, r9, #28
    3ce0:	e59d2020 	ldr	r2, [sp, #32]
    3ce4:	e79aa102 	ldr	sl, [sl, r2, lsl #2]
    3ce8:	e083300b 	add	r3, r3, fp
    3cec:	e5937000 	ldr	r7, [r3]
    3cf0:	f57ff04f 	dsb	sy
    3cf4:	e3877802 	orr	r7, r7, #131072	; 0x20000
    3cf8:	f57ff04e 	dsb	st
    3cfc:	ebfffffe 	bl	0 <arm_heavy_mb>
    3d00:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3d04:	e083b00b 	add	fp, r3, fp
    3d08:	e58b7000 	str	r7, [fp]
    3d0c:	e35a0000 	cmp	sl, #0
    3d10:	da00000a 	ble	3d40 <ipu_init_channel_buffer+0xb14>
    3d14:	e1a0730a 	lsl	r7, sl, #6
    3d18:	e287700c 	add	r7, r7, #12
    3d1c:	e0833007 	add	r3, r3, r7
    3d20:	e593b000 	ldr	fp, [r3]
    3d24:	f57ff04f 	dsb	sy
    3d28:	e38bb802 	orr	fp, fp, #131072	; 0x20000
    3d2c:	f57ff04e 	dsb	st
    3d30:	ebfffffe 	bl	0 <arm_heavy_mb>
    3d34:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3d38:	e0837007 	add	r7, r3, r7
    3d3c:	e587b000 	str	fp, [r7]
    3d40:	e288800b 	add	r8, r8, #11
    3d44:	e1a08108 	lsl	r8, r8, #2
    3d48:	e0833008 	add	r3, r3, r8
    3d4c:	e5937000 	ldr	r7, [r3]
    3d50:	f57ff04f 	dsb	sy
    3d54:	e7ed7357 	ubfx	r7, r7, #6, #14
    3d58:	e2877001 	add	r7, r7, #1
    3d5c:	e3170007 	tst	r7, #7
    3d60:	1a000365 	bne	4afc <ipu_init_channel_buffer+0x18d0>
    3d64:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3d68:	e2481008 	sub	r1, r8, #8
    3d6c:	e58d1038 	str	r1, [sp, #56]	; 0x38
    3d70:	e0833001 	add	r3, r3, r1
    3d74:	e593b000 	ldr	fp, [r3]
    3d78:	f57ff04f 	dsb	sy
    3d7c:	e1a021a7 	lsr	r2, r7, #3
    3d80:	e3cbb33f 	bic	fp, fp, #-67108864	; 0xfc000000
    3d84:	e1a02d02 	lsl	r2, r2, #26
    3d88:	e18bb002 	orr	fp, fp, r2
    3d8c:	e58d204c 	str	r2, [sp, #76]	; 0x4c
    3d90:	f57ff04e 	dsb	st
    3d94:	ebfffffe 	bl	0 <arm_heavy_mb>
    3d98:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3d9c:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    3da0:	e0831001 	add	r1, r3, r1
    3da4:	e581b000 	str	fp, [r1]
    3da8:	e0833009 	add	r3, r3, r9
    3dac:	e5931000 	ldr	r1, [r3]
    3db0:	f57ff04f 	dsb	sy
    3db4:	e3a0b903 	mov	fp, #49152	; 0xc000
    3db8:	e1a034a7 	lsr	r3, r7, #9
    3dbc:	e34fbfff 	movt	fp, #65535	; 0xffff
    3dc0:	e001100b 	and	r1, r1, fp
    3dc4:	e58d3048 	str	r3, [sp, #72]	; 0x48
    3dc8:	e1811003 	orr	r1, r1, r3
    3dcc:	e58d1038 	str	r1, [sp, #56]	; 0x38
    3dd0:	f57ff04e 	dsb	st
    3dd4:	ebfffffe 	bl	0 <arm_heavy_mb>
    3dd8:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3ddc:	e59d1038 	ldr	r1, [sp, #56]	; 0x38
    3de0:	e0839009 	add	r9, r3, r9
    3de4:	e5891000 	str	r1, [r9]
    3de8:	e35a0000 	cmp	sl, #0
    3dec:	da00001a 	ble	3e5c <ipu_init_channel_buffer+0xc30>
    3df0:	e1a0930a 	lsl	r9, sl, #6
    3df4:	e2899024 	add	r9, r9, #36	; 0x24
    3df8:	e0833009 	add	r3, r3, r9
    3dfc:	e5933000 	ldr	r3, [r3]
    3e00:	f57ff04f 	dsb	sy
    3e04:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
    3e08:	e3c3333f 	bic	r3, r3, #-67108864	; 0xfc000000
    3e0c:	e1822003 	orr	r2, r2, r3
    3e10:	e58d2038 	str	r2, [sp, #56]	; 0x38
    3e14:	f57ff04e 	dsb	st
    3e18:	ebfffffe 	bl	0 <arm_heavy_mb>
    3e1c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3e20:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    3e24:	e0831009 	add	r1, r3, r9
    3e28:	e5812000 	str	r2, [r1]
    3e2c:	e2899004 	add	r9, r9, #4
    3e30:	e0833009 	add	r3, r3, r9
    3e34:	e5933000 	ldr	r3, [r3]
    3e38:	f57ff04f 	dsb	sy
    3e3c:	e003000b 	and	r0, r3, fp
    3e40:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    3e44:	e183b000 	orr	fp, r3, r0
    3e48:	f57ff04e 	dsb	st
    3e4c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3e50:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3e54:	e0839009 	add	r9, r3, r9
    3e58:	e589b000 	str	fp, [r9]
    3e5c:	e0833008 	add	r3, r3, r8
    3e60:	e5939000 	ldr	r9, [r3]
    3e64:	f57ff04f 	dsb	sy
    3e68:	e3a0b03f 	mov	fp, #63	; 0x3f
    3e6c:	e1a07387 	lsl	r7, r7, #7
    3e70:	e34fbff0 	movt	fp, #65520	; 0xfff0
    3e74:	e2477040 	sub	r7, r7, #64	; 0x40
    3e78:	e009900b 	and	r9, r9, fp
    3e7c:	e1899007 	orr	r9, r9, r7
    3e80:	f57ff04e 	dsb	st
    3e84:	ebfffffe 	bl	0 <arm_heavy_mb>
    3e88:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3e8c:	e0838008 	add	r8, r3, r8
    3e90:	e5889000 	str	r9, [r8]
    3e94:	e35a0000 	cmp	sl, #0
    3e98:	da00000b 	ble	3ecc <ipu_init_channel_buffer+0xca0>
    3e9c:	e1a0a30a 	lsl	sl, sl, #6
    3ea0:	e28aa02c 	add	sl, sl, #44	; 0x2c
    3ea4:	e083300a 	add	r3, r3, sl
    3ea8:	e5933000 	ldr	r3, [r3]
    3eac:	f57ff04f 	dsb	sy
    3eb0:	e00bb003 	and	fp, fp, r3
    3eb4:	e187700b 	orr	r7, r7, fp
    3eb8:	f57ff04e 	dsb	st
    3ebc:	ebfffffe 	bl	0 <arm_heavy_mb>
    3ec0:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3ec4:	e083a00a 	add	sl, r3, sl
    3ec8:	e58a7000 	str	r7, [sl]
    3ecc:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
    3ed0:	e3520000 	cmp	r2, #0
    3ed4:	1a000003 	bne	3ee8 <ipu_init_channel_buffer+0xcbc>
    3ed8:	e245202d 	sub	r2, r5, #45	; 0x2d
    3edc:	e3550005 	cmp	r5, #5
    3ee0:	13520005 	cmpne	r2, #5
    3ee4:	8a00033a 	bhi	4bd4 <ipu_init_channel_buffer+0x19a8>
    3ee8:	e0833305 	add	r3, r3, r5, lsl #6
    3eec:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    3ef0:	f57ff04f 	dsb	sy
    3ef4:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3ef8:	e7e62752 	ubfx	r2, r2, #14, #7
    3efc:	e2822001 	add	r2, r2, #1
    3f00:	e1a01005 	mov	r1, r5
    3f04:	e58d2000 	str	r2, [sp]
    3f08:	e58d3004 	str	r3, [sp, #4]
    3f0c:	e59d201c 	ldr	r2, [sp, #28]
    3f10:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    3f14:	e59d0018 	ldr	r0, [sp, #24]
    3f18:	ebfffffe 	bl	0 <_ipu_ic_idma_init>
    3f1c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    3f20:	e355001c 	cmp	r5, #28
    3f24:	979ff105 	ldrls	pc, [pc, r5, lsl #2]
    3f28:	ea00024f 	b	486c <ipu_init_channel_buffer+0x1640>
    3f2c:	000047d0 	ldrdeq	r4, [r0], -r0
    3f30:	000047d0 	ldrdeq	r4, [r0], -r0
    3f34:	000047d0 	ldrdeq	r4, [r0], -r0
    3f38:	000047d0 	ldrdeq	r4, [r0], -r0
    3f3c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f40:	0000486c 	andeq	r4, r0, ip, ror #16
    3f44:	0000486c 	andeq	r4, r0, ip, ror #16
    3f48:	0000486c 	andeq	r4, r0, ip, ror #16
    3f4c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f50:	0000486c 	andeq	r4, r0, ip, ror #16
    3f54:	0000486c 	andeq	r4, r0, ip, ror #16
    3f58:	0000486c 	andeq	r4, r0, ip, ror #16
    3f5c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f60:	0000486c 	andeq	r4, r0, ip, ror #16
    3f64:	0000486c 	andeq	r4, r0, ip, ror #16
    3f68:	0000486c 	andeq	r4, r0, ip, ror #16
    3f6c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f70:	0000486c 	andeq	r4, r0, ip, ror #16
    3f74:	0000486c 	andeq	r4, r0, ip, ror #16
    3f78:	0000486c 	andeq	r4, r0, ip, ror #16
    3f7c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f80:	0000486c 	andeq	r4, r0, ip, ror #16
    3f84:	0000486c 	andeq	r4, r0, ip, ror #16
    3f88:	0000479c 	muleq	r0, ip, r7
    3f8c:	0000486c 	andeq	r4, r0, ip, ror #16
    3f90:	0000486c 	andeq	r4, r0, ip, ror #16
    3f94:	0000486c 	andeq	r4, r0, ip, ror #16
    3f98:	00004838 	andeq	r4, r0, r8, lsr r8
    3f9c:	00004020 	andeq	r4, r0, r0, lsr #32
    3fa0:	00000078 	andeq	r0, r0, r8, ror r0
    3fa4:	00000090 	muleq	r0, r0, r0
    3fa8:	000000a8 	andeq	r0, r0, r8, lsr #1
    3fac:	000000c0 	andeq	r0, r0, r0, asr #1
    3fb0:	000000d8 	ldrdeq	r0, [r0], -r8
    3fb4:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    3fb8:	00000108 	andeq	r0, r0, r8, lsl #2
    3fbc:	00000120 	andeq	r0, r0, r0, lsr #2
    3fc0:	00000138 	andeq	r0, r0, r8, lsr r1
    3fc4:	00000150 	andeq	r0, r0, r0, asr r1
    3fc8:	00000168 	andeq	r0, r0, r8, ror #2
    3fcc:	00000180 	andeq	r0, r0, r0, lsl #3
    3fd0:	00000198 	muleq	r0, r8, r1
    3fd4:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
    3fd8:	000001c8 	andeq	r0, r0, r8, asr #3
    3fdc:	000001e0 	andeq	r0, r0, r0, ror #3
    3fe0:	000001f8 	strdeq	r0, [r0], -r8
    3fe4:	00000210 	andeq	r0, r0, r0, lsl r2
    3fe8:	00000228 	andeq	r0, r0, r8, lsr #4
    3fec:	00000240 	andeq	r0, r0, r0, asr #4
    3ff0:	00000258 	andeq	r0, r0, r8, asr r2
    3ff4:	00000270 	andeq	r0, r0, r0, ror r2
    3ff8:	00000288 	andeq	r0, r0, r8, lsl #5
    3ffc:	000002a0 	andeq	r0, r0, r0, lsr #5
    4000:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
    4004:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    4008:	000002e8 	andeq	r0, r0, r8, ror #5
    400c:	00000300 	andeq	r0, r0, r0, lsl #6
    4010:	00000318 	andeq	r0, r0, r8, lsl r3
    4014:	00000330 	andeq	r0, r0, r0, lsr r3
    4018:	00000348 	andeq	r0, r0, r8, asr #6
    401c:	00000360 	andeq	r0, r0, r0, ror #6
    4020:	e5948ed8 	ldr	r8, [r4, #3800]	; 0xed8
    4024:	e5937728 	ldr	r7, [r3, #1832]	; 0x728
    4028:	f57ff04f 	dsb	sy
    402c:	e1a08e88 	lsl	r8, r8, #29
    4030:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    4034:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    4038:	e1877008 	orr	r7, r7, r8
    403c:	f57ff04e 	dsb	st
    4040:	ebfffffe 	bl	0 <arm_heavy_mb>
    4044:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4048:	e5837728 	str	r7, [r3, #1832]	; 0x728
    404c:	e30171e8 	movw	r7, #4584	; 0x11e8
    4050:	e0833007 	add	r3, r3, r7
    4054:	e5933000 	ldr	r3, [r3]
    4058:	f57ff04f 	dsb	sy
    405c:	e3c33206 	bic	r3, r3, #1610612736	; 0x60000000
    4060:	e1888003 	orr	r8, r8, r3
    4064:	f57ff04e 	dsb	st
    4068:	ebfffffe 	bl	0 <arm_heavy_mb>
    406c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4070:	e0837007 	add	r7, r3, r7
    4074:	e5878000 	str	r8, [r7]
    4078:	e1a072a5 	lsr	r7, r5, #5
    407c:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    4080:	e2877005 	add	r7, r7, #5
    4084:	e1a07107 	lsl	r7, r7, #2
    4088:	e0833007 	add	r3, r3, r7
    408c:	e5933000 	ldr	r3, [r3]
    4090:	f57ff04f 	dsb	sy
    4094:	e59d1030 	ldr	r1, [sp, #48]	; 0x30
    4098:	e3a02001 	mov	r2, #1
    409c:	e201801f 	and	r8, r1, #31
    40a0:	e1a08812 	lsl	r8, r2, r8
    40a4:	e1130008 	tst	r3, r8
    40a8:	0a000003 	beq	40bc <ipu_init_channel_buffer+0xe90>
    40ac:	e59d3018 	ldr	r3, [sp, #24]
    40b0:	e5933004 	ldr	r3, [r3, #4]
    40b4:	e3530003 	cmp	r3, #3
    40b8:	0a0002f5 	beq	4c94 <ipu_init_channel_buffer+0x1a68>
    40bc:	e300317a 	movw	r3, #378	; 0x17a
    40c0:	e594cd78 	ldr	ip, [r4, #3448]	; 0xd78
    40c4:	e19630b3 	ldrh	r3, [r6, r3]
    40c8:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    40cc:	e3130004 	tst	r3, #4
    40d0:	e08c9002 	add	r9, ip, r2
    40d4:	0a00000f 	beq	4118 <ipu_init_channel_buffer+0xeec>
    40d8:	e5990010 	ldr	r0, [r9, #16]
    40dc:	e3002000 	movw	r2, #0
    40e0:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    40e4:	e3402000 	movt	r2, #0
    40e8:	e1a03005 	mov	r3, r5
    40ec:	e58d0010 	str	r0, [sp, #16]
    40f0:	e599e00c 	ldr	lr, [r9, #12]
    40f4:	e51f0134 	ldr	r0, [pc, #-308]	; 3fc8 <ipu_init_channel_buffer+0xd9c>
    40f8:	e58de00c 	str	lr, [sp, #12]
    40fc:	e599e008 	ldr	lr, [r9, #8]
    4100:	e58de008 	str	lr, [sp, #8]
    4104:	e599e004 	ldr	lr, [r9, #4]
    4108:	e58de004 	str	lr, [sp, #4]
    410c:	e79cc305 	ldr	ip, [ip, r5, lsl #6]
    4110:	e58dc000 	str	ip, [sp]
    4114:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4118:	e3003192 	movw	r3, #402	; 0x192
    411c:	e19630b3 	ldrh	r3, [r6, r3]
    4120:	e3130004 	tst	r3, #4
    4124:	0a00000f 	beq	4168 <ipu_init_channel_buffer+0xf3c>
    4128:	e5990030 	ldr	r0, [r9, #48]	; 0x30
    412c:	e3002000 	movw	r2, #0
    4130:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4134:	e3402000 	movt	r2, #0
    4138:	e1a03005 	mov	r3, r5
    413c:	e58d0010 	str	r0, [sp, #16]
    4140:	e599c02c 	ldr	ip, [r9, #44]	; 0x2c
    4144:	e51f0180 	ldr	r0, [pc, #-384]	; 3fcc <ipu_init_channel_buffer+0xda0>
    4148:	e58dc00c 	str	ip, [sp, #12]
    414c:	e599c028 	ldr	ip, [r9, #40]	; 0x28
    4150:	e58dc008 	str	ip, [sp, #8]
    4154:	e599c024 	ldr	ip, [r9, #36]	; 0x24
    4158:	e58dc004 	str	ip, [sp, #4]
    415c:	e599c020 	ldr	ip, [r9, #32]
    4160:	e58dc000 	str	ip, [sp]
    4164:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4168:	e30031aa 	movw	r3, #426	; 0x1aa
    416c:	e19630b3 	ldrh	r3, [r6, r3]
    4170:	e3130004 	tst	r3, #4
    4174:	0a00000b 	beq	41a8 <ipu_init_channel_buffer+0xf7c>
    4178:	e1a03305 	lsl	r3, r5, #6
    417c:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4180:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4184:	e2833028 	add	r3, r3, #40	; 0x28
    4188:	e0823003 	add	r3, r2, r3
    418c:	e5933000 	ldr	r3, [r3]
    4190:	f57ff04f 	dsb	sy
    4194:	e3002000 	movw	r2, #0
    4198:	e7e33ad3 	ubfx	r3, r3, #21, #4
    419c:	e3402000 	movt	r2, #0
    41a0:	e51f01d8 	ldr	r0, [pc, #-472]	; 3fd0 <ipu_init_channel_buffer+0xda4>
    41a4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    41a8:	e30031c2 	movw	r3, #450	; 0x1c2
    41ac:	e19630b3 	ldrh	r3, [r6, r3]
    41b0:	e3130004 	tst	r3, #4
    41b4:	0a00000b 	beq	41e8 <ipu_init_channel_buffer+0xfbc>
    41b8:	e1a03305 	lsl	r3, r5, #6
    41bc:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    41c0:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    41c4:	e283300c 	add	r3, r3, #12
    41c8:	e0823003 	add	r3, r2, r3
    41cc:	e5933000 	ldr	r3, [r3]
    41d0:	f57ff04f 	dsb	sy
    41d4:	e3002000 	movw	r2, #0
    41d8:	e7e235d3 	ubfx	r3, r3, #11, #3
    41dc:	e3402000 	movt	r2, #0
    41e0:	e51f0214 	ldr	r0, [pc, #-532]	; 3fd4 <ipu_init_channel_buffer+0xda8>
    41e4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    41e8:	e30031da 	movw	r3, #474	; 0x1da
    41ec:	e19630b3 	ldrh	r3, [r6, r3]
    41f0:	e3130004 	tst	r3, #4
    41f4:	0a00000b 	beq	4228 <ipu_init_channel_buffer+0xffc>
    41f8:	e1a03305 	lsl	r3, r5, #6
    41fc:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4200:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4204:	e2833028 	add	r3, r3, #40	; 0x28
    4208:	e0823003 	add	r3, r2, r3
    420c:	e5933000 	ldr	r3, [r3]
    4210:	f57ff04f 	dsb	sy
    4214:	e3002000 	movw	r2, #0
    4218:	e7e63753 	ubfx	r3, r3, #14, #7
    421c:	e3402000 	movt	r2, #0
    4220:	e51f0250 	ldr	r0, [pc, #-592]	; 3fd8 <ipu_init_channel_buffer+0xdac>
    4224:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4228:	e30031f2 	movw	r3, #498	; 0x1f2
    422c:	e19630b3 	ldrh	r3, [r6, r3]
    4230:	e3130004 	tst	r3, #4
    4234:	0a000012 	beq	4284 <ipu_init_channel_buffer+0x1058>
    4238:	e1a02305 	lsl	r2, r5, #6
    423c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4240:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4244:	e282200c 	add	r2, r2, #12
    4248:	e0833002 	add	r3, r3, r2
    424c:	e593c000 	ldr	ip, [r3]
    4250:	f57ff04f 	dsb	sy
    4254:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4258:	e2822004 	add	r2, r2, #4
    425c:	e0832002 	add	r2, r3, r2
    4260:	e5922000 	ldr	r2, [r2]
    4264:	f57ff04f 	dsb	sy
    4268:	e3013ff8 	movw	r3, #8184	; 0x1ff8
    426c:	e51f0298 	ldr	r0, [pc, #-664]	; 3fdc <ipu_init_channel_buffer+0xdb0>
    4270:	e0033182 	and	r3, r3, r2, lsl #3
    4274:	e3002000 	movw	r2, #0
    4278:	e3402000 	movt	r2, #0
    427c:	e1833eac 	orr	r3, r3, ip, lsr #29
    4280:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4284:	e300320a 	movw	r3, #522	; 0x20a
    4288:	e19630b3 	ldrh	r3, [r6, r3]
    428c:	e3130004 	tst	r3, #4
    4290:	0a00000b 	beq	42c4 <ipu_init_channel_buffer+0x1098>
    4294:	e1a03305 	lsl	r3, r5, #6
    4298:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    429c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    42a0:	e2833010 	add	r3, r3, #16
    42a4:	e0823003 	add	r3, r2, r3
    42a8:	e5933000 	ldr	r3, [r3]
    42ac:	f57ff04f 	dsb	sy
    42b0:	e3002000 	movw	r2, #0
    42b4:	e7eb3553 	ubfx	r3, r3, #10, #12
    42b8:	e3402000 	movt	r2, #0
    42bc:	e51f02e4 	ldr	r0, [pc, #-740]	; 3fe0 <ipu_init_channel_buffer+0xdb4>
    42c0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    42c4:	e3003222 	movw	r3, #546	; 0x222
    42c8:	e19630b3 	ldrh	r3, [r6, r3]
    42cc:	e3130004 	tst	r3, #4
    42d0:	0a00000b 	beq	4304 <ipu_init_channel_buffer+0x10d8>
    42d4:	e1a03305 	lsl	r3, r5, #6
    42d8:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    42dc:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    42e0:	e2833020 	add	r3, r3, #32
    42e4:	e0823003 	add	r3, r2, r3
    42e8:	e5933000 	ldr	r3, [r3]
    42ec:	f57ff04f 	dsb	sy
    42f0:	e3002000 	movw	r2, #0
    42f4:	e1a03183 	lsl	r3, r3, #3
    42f8:	e51f031c 	ldr	r0, [pc, #-796]	; 3fe4 <ipu_init_channel_buffer+0xdb8>
    42fc:	e3402000 	movt	r2, #0
    4300:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4304:	e300323a 	movw	r3, #570	; 0x23a
    4308:	e19630b3 	ldrh	r3, [r6, r3]
    430c:	e3130004 	tst	r3, #4
    4310:	0a000013 	beq	4364 <ipu_init_channel_buffer+0x1138>
    4314:	e1a02305 	lsl	r2, r5, #6
    4318:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    431c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4320:	e2822020 	add	r2, r2, #32
    4324:	e0833002 	add	r3, r3, r2
    4328:	e5933000 	ldr	r3, [r3]
    432c:	f57ff04f 	dsb	sy
    4330:	e5940d78 	ldr	r0, [r4, #3448]	; 0xd78
    4334:	e2822004 	add	r2, r2, #4
    4338:	e0802002 	add	r2, r0, r2
    433c:	e592c000 	ldr	ip, [r2]
    4340:	f57ff04f 	dsb	sy
    4344:	e1a0c18c 	lsl	ip, ip, #3
    4348:	e3002000 	movw	r2, #0
    434c:	e51f036c 	ldr	r0, [pc, #-876]	; 3fe8 <ipu_init_channel_buffer+0xdbc>
    4350:	e3402000 	movt	r2, #0
    4354:	e3ccc27e 	bic	ip, ip, #-536870905	; 0xe0000007
    4358:	e18c3ea3 	orr	r3, ip, r3, lsr #29
    435c:	e1a03183 	lsl	r3, r3, #3
    4360:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4364:	e3003252 	movw	r3, #594	; 0x252
    4368:	e19630b3 	ldrh	r3, [r6, r3]
    436c:	e3130004 	tst	r3, #4
    4370:	0a00000b 	beq	43a4 <ipu_init_channel_buffer+0x1178>
    4374:	e1a03305 	lsl	r3, r5, #6
    4378:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    437c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4380:	e283302c 	add	r3, r3, #44	; 0x2c
    4384:	e0823003 	add	r3, r2, r3
    4388:	e5933000 	ldr	r3, [r3]
    438c:	f57ff04f 	dsb	sy
    4390:	e3002000 	movw	r2, #0
    4394:	e7ed3353 	ubfx	r3, r3, #6, #14
    4398:	e3402000 	movt	r2, #0
    439c:	e51f03b8 	ldr	r0, [pc, #-952]	; 3fec <ipu_init_channel_buffer+0xdc0>
    43a0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    43a4:	e300326a 	movw	r3, #618	; 0x26a
    43a8:	e19630b3 	ldrh	r3, [r6, r3]
    43ac:	e3130004 	tst	r3, #4
    43b0:	0a00000b 	beq	43e4 <ipu_init_channel_buffer+0x11b8>
    43b4:	e1a03305 	lsl	r3, r5, #6
    43b8:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    43bc:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    43c0:	e283300c 	add	r3, r3, #12
    43c4:	e0823003 	add	r3, r2, r3
    43c8:	e5933000 	ldr	r3, [r3]
    43cc:	f57ff04f 	dsb	sy
    43d0:	e3002000 	movw	r2, #0
    43d4:	e7e038d3 	ubfx	r3, r3, #17, #1
    43d8:	e3402000 	movt	r2, #0
    43dc:	e51f03f4 	ldr	r0, [pc, #-1012]	; 3ff0 <ipu_init_channel_buffer+0xdc4>
    43e0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    43e4:	e3003282 	movw	r3, #642	; 0x282
    43e8:	e19630b3 	ldrh	r3, [r6, r3]
    43ec:	e3130004 	tst	r3, #4
    43f0:	0a00000b 	beq	4424 <ipu_init_channel_buffer+0x11f8>
    43f4:	e1a03305 	lsl	r3, r5, #6
    43f8:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    43fc:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4400:	e2833030 	add	r3, r3, #48	; 0x30
    4404:	e0823003 	add	r3, r2, r3
    4408:	e5933000 	ldr	r3, [r3]
    440c:	f57ff04f 	dsb	sy
    4410:	e3002000 	movw	r2, #0
    4414:	e7ed3053 	ubfx	r3, r3, #0, #14
    4418:	e3402000 	movt	r2, #0
    441c:	e51f0430 	ldr	r0, [pc, #-1072]	; 3ff4 <ipu_init_channel_buffer+0xdc8>
    4420:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4424:	e300329a 	movw	r3, #666	; 0x29a
    4428:	e19630b3 	ldrh	r3, [r6, r3]
    442c:	e3130004 	tst	r3, #4
    4430:	0a000013 	beq	4484 <ipu_init_channel_buffer+0x1258>
    4434:	e1a02305 	lsl	r2, r5, #6
    4438:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    443c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4440:	e2822004 	add	r2, r2, #4
    4444:	e0833002 	add	r3, r3, r2
    4448:	e5933000 	ldr	r3, [r3]
    444c:	f57ff04f 	dsb	sy
    4450:	e5940d78 	ldr	r0, [r4, #3448]	; 0xd78
    4454:	e2822004 	add	r2, r2, #4
    4458:	e0802002 	add	r2, r0, r2
    445c:	e592c000 	ldr	ip, [r2]
    4460:	f57ff04f 	dsb	sy
    4464:	e1a0c90c 	lsl	ip, ip, #18
    4468:	e3002000 	movw	r2, #0
    446c:	e51f047c 	ldr	r0, [pc, #-1148]	; 3ff8 <ipu_init_channel_buffer+0xdcc>
    4470:	e3402000 	movt	r2, #0
    4474:	e20cc70f 	and	ip, ip, #3932160	; 0x3c0000
    4478:	e18c3723 	orr	r3, ip, r3, lsr #14
    447c:	e1a03183 	lsl	r3, r3, #3
    4480:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4484:	e30032b2 	movw	r3, #690	; 0x2b2
    4488:	e19630b3 	ldrh	r3, [r6, r3]
    448c:	e3130004 	tst	r3, #4
    4490:	0a00000d 	beq	44cc <ipu_init_channel_buffer+0x12a0>
    4494:	e1a03305 	lsl	r3, r5, #6
    4498:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    449c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    44a0:	e2833008 	add	r3, r3, #8
    44a4:	e0823003 	add	r3, r2, r3
    44a8:	e5930000 	ldr	r0, [r3]
    44ac:	f57ff04f 	dsb	sy
    44b0:	e30f3ff8 	movw	r3, #65528	; 0xfff8
    44b4:	e3002000 	movw	r2, #0
    44b8:	e34031ff 	movt	r3, #511	; 0x1ff
    44bc:	e3402000 	movt	r2, #0
    44c0:	e00330a0 	and	r3, r3, r0, lsr #1
    44c4:	e51f04d0 	ldr	r0, [pc, #-1232]	; 3ffc <ipu_init_channel_buffer+0xdd0>
    44c8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    44cc:	e30032ca 	movw	r3, #714	; 0x2ca
    44d0:	e19630b3 	ldrh	r3, [r6, r3]
    44d4:	e3130004 	tst	r3, #4
    44d8:	0a00000b 	beq	450c <ipu_init_channel_buffer+0x12e0>
    44dc:	e1a03305 	lsl	r3, r5, #6
    44e0:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    44e4:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    44e8:	e283302c 	add	r3, r3, #44	; 0x2c
    44ec:	e0823003 	add	r3, r2, r3
    44f0:	e5933000 	ldr	r3, [r3]
    44f4:	f57ff04f 	dsb	sy
    44f8:	e3002000 	movw	r2, #0
    44fc:	e7e23a53 	ubfx	r3, r3, #20, #3
    4500:	e3402000 	movt	r2, #0
    4504:	e51f050c 	ldr	r0, [pc, #-1292]	; 4000 <ipu_init_channel_buffer+0xdd4>
    4508:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    450c:	e30032e2 	movw	r3, #738	; 0x2e2
    4510:	e19630b3 	ldrh	r3, [r6, r3]
    4514:	e3130004 	tst	r3, #4
    4518:	0a00000b 	beq	454c <ipu_init_channel_buffer+0x1320>
    451c:	e1a03305 	lsl	r3, r5, #6
    4520:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4524:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4528:	e283302c 	add	r3, r3, #44	; 0x2c
    452c:	e0823003 	add	r3, r2, r3
    4530:	e5933000 	ldr	r3, [r3]
    4534:	f57ff04f 	dsb	sy
    4538:	e3002000 	movw	r2, #0
    453c:	e7e23bd3 	ubfx	r3, r3, #23, #3
    4540:	e3402000 	movt	r2, #0
    4544:	e51f0548 	ldr	r0, [pc, #-1352]	; 4004 <ipu_init_channel_buffer+0xdd8>
    4548:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    454c:	e30032fa 	movw	r3, #762	; 0x2fa
    4550:	e19630b3 	ldrh	r3, [r6, r3]
    4554:	e3130004 	tst	r3, #4
    4558:	0a00000b 	beq	458c <ipu_init_channel_buffer+0x1360>
    455c:	e1a03305 	lsl	r3, r5, #6
    4560:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4564:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4568:	e283302c 	add	r3, r3, #44	; 0x2c
    456c:	e0823003 	add	r3, r2, r3
    4570:	e5933000 	ldr	r3, [r3]
    4574:	f57ff04f 	dsb	sy
    4578:	e3002000 	movw	r2, #0
    457c:	e7e23d53 	ubfx	r3, r3, #26, #3
    4580:	e3402000 	movt	r2, #0
    4584:	e51f0584 	ldr	r0, [pc, #-1412]	; 4008 <ipu_init_channel_buffer+0xddc>
    4588:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    458c:	e3003312 	movw	r3, #786	; 0x312
    4590:	e19630b3 	ldrh	r3, [r6, r3]
    4594:	e3130004 	tst	r3, #4
    4598:	0a00000b 	beq	45cc <ipu_init_channel_buffer+0x13a0>
    459c:	e1a03305 	lsl	r3, r5, #6
    45a0:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    45a4:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    45a8:	e283302c 	add	r3, r3, #44	; 0x2c
    45ac:	e0823003 	add	r3, r2, r3
    45b0:	e5933000 	ldr	r3, [r3]
    45b4:	f57ff04f 	dsb	sy
    45b8:	e3002000 	movw	r2, #0
    45bc:	e1a03ea3 	lsr	r3, r3, #29
    45c0:	e51f05bc 	ldr	r0, [pc, #-1468]	; 400c <ipu_init_channel_buffer+0xde0>
    45c4:	e3402000 	movt	r2, #0
    45c8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    45cc:	e300332a 	movw	r3, #810	; 0x32a
    45d0:	e19630b3 	ldrh	r3, [r6, r3]
    45d4:	e3130004 	tst	r3, #4
    45d8:	0a00000b 	beq	460c <ipu_init_channel_buffer+0x13e0>
    45dc:	e1a03305 	lsl	r3, r5, #6
    45e0:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    45e4:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    45e8:	e2833030 	add	r3, r3, #48	; 0x30
    45ec:	e0823003 	add	r3, r2, r3
    45f0:	e5933000 	ldr	r3, [r3]
    45f4:	f57ff04f 	dsb	sy
    45f8:	e3002000 	movw	r2, #0
    45fc:	e203301f 	and	r3, r3, #31
    4600:	e3402000 	movt	r2, #0
    4604:	e51f05fc 	ldr	r0, [pc, #-1532]	; 4010 <ipu_init_channel_buffer+0xde4>
    4608:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    460c:	e3003342 	movw	r3, #834	; 0x342
    4610:	e19630b3 	ldrh	r3, [r6, r3]
    4614:	e3130004 	tst	r3, #4
    4618:	0a00000b 	beq	464c <ipu_init_channel_buffer+0x1420>
    461c:	e1a03305 	lsl	r3, r5, #6
    4620:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4624:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4628:	e2833030 	add	r3, r3, #48	; 0x30
    462c:	e0823003 	add	r3, r2, r3
    4630:	e5933000 	ldr	r3, [r3]
    4634:	f57ff04f 	dsb	sy
    4638:	e3002000 	movw	r2, #0
    463c:	e7e432d3 	ubfx	r3, r3, #5, #5
    4640:	e3402000 	movt	r2, #0
    4644:	e51f0638 	ldr	r0, [pc, #-1592]	; 4014 <ipu_init_channel_buffer+0xde8>
    4648:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    464c:	e300335a 	movw	r3, #858	; 0x35a
    4650:	e19630b3 	ldrh	r3, [r6, r3]
    4654:	e3130004 	tst	r3, #4
    4658:	0a00000b 	beq	468c <ipu_init_channel_buffer+0x1460>
    465c:	e1a03305 	lsl	r3, r5, #6
    4660:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4664:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    4668:	e2833030 	add	r3, r3, #48	; 0x30
    466c:	e0823003 	add	r3, r2, r3
    4670:	e5933000 	ldr	r3, [r3]
    4674:	f57ff04f 	dsb	sy
    4678:	e3002000 	movw	r2, #0
    467c:	e7e43553 	ubfx	r3, r3, #10, #5
    4680:	e3402000 	movt	r2, #0
    4684:	e51f0674 	ldr	r0, [pc, #-1652]	; 4018 <ipu_init_channel_buffer+0xdec>
    4688:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    468c:	e3003372 	movw	r3, #882	; 0x372
    4690:	e19630b3 	ldrh	r3, [r6, r3]
    4694:	e3130004 	tst	r3, #4
    4698:	0a00000b 	beq	46cc <ipu_init_channel_buffer+0x14a0>
    469c:	e1a03305 	lsl	r3, r5, #6
    46a0:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    46a4:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    46a8:	e2833030 	add	r3, r3, #48	; 0x30
    46ac:	e0823003 	add	r3, r2, r3
    46b0:	e5933000 	ldr	r3, [r3]
    46b4:	f57ff04f 	dsb	sy
    46b8:	e3002000 	movw	r2, #0
    46bc:	e7e437d3 	ubfx	r3, r3, #15, #5
    46c0:	e3402000 	movt	r2, #0
    46c4:	e51f06b0 	ldr	r0, [pc, #-1712]	; 401c <ipu_init_channel_buffer+0xdf0>
    46c8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    46cc:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    46d0:	e2876f4f 	add	r6, r7, #316	; 0x13c
    46d4:	e1e09008 	mvn	r9, r8
    46d8:	e3530000 	cmp	r3, #0
    46dc:	e59d3018 	ldr	r3, [sp, #24]
    46e0:	e5932004 	ldr	r2, [r3, #4]
    46e4:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    46e8:	0a000083 	beq	48fc <ipu_init_channel_buffer+0x16d0>
    46ec:	e3520000 	cmp	r2, #0
    46f0:	1a000199 	bne	4d5c <ipu_init_channel_buffer+0x1b30>
    46f4:	e3a02f4b 	mov	r2, #300	; 0x12c
    46f8:	e0833002 	add	r3, r3, r2
    46fc:	e593a000 	ldr	sl, [r3]
    4700:	f57ff04f 	dsb	sy
    4704:	e59d3018 	ldr	r3, [sp, #24]
    4708:	e00aa009 	and	sl, sl, r9
    470c:	e5933004 	ldr	r3, [r3, #4]
    4710:	e3530000 	cmp	r3, #0
    4714:	12875f59 	addne	r5, r7, #356	; 0x164
    4718:	03a05f4b 	moveq	r5, #300	; 0x12c
    471c:	f57ff04e 	dsb	st
    4720:	ebfffffe 	bl	0 <arm_heavy_mb>
    4724:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4728:	e0835005 	add	r5, r3, r5
    472c:	e585a000 	str	sl, [r5]
    4730:	e0833006 	add	r3, r3, r6
    4734:	e5933000 	ldr	r3, [r3]
    4738:	f57ff04f 	dsb	sy
    473c:	e59d20cc 	ldr	r2, [sp, #204]	; 0xcc
    4740:	e3520000 	cmp	r2, #0
    4744:	11889003 	orrne	r9, r8, r3
    4748:	00099003 	andeq	r9, r9, r3
    474c:	f57ff04e 	dsb	st
    4750:	ebfffffe 	bl	0 <arm_heavy_mb>
    4754:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4758:	e0836006 	add	r6, r3, r6
    475c:	e5869000 	str	r9, [r6]
    4760:	e59d3018 	ldr	r3, [sp, #24]
    4764:	e5933004 	ldr	r3, [r3, #4]
    4768:	e3530000 	cmp	r3, #0
    476c:	12877f8a 	addne	r7, r7, #552	; 0x228
    4770:	02877e11 	addeq	r7, r7, #272	; 0x110
    4774:	f57ff04e 	dsb	st
    4778:	ebfffffe 	bl	0 <arm_heavy_mb>
    477c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4780:	e0837007 	add	r7, r3, r7
    4784:	e5878000 	str	r8, [r7]
    4788:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
    478c:	ebfffffe 	bl	0 <mutex_unlock>
    4790:	e3a00000 	mov	r0, #0
    4794:	e28dd094 	add	sp, sp, #148	; 0x94
    4798:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    479c:	e5948ed0 	ldr	r8, [r4, #3792]	; 0xed0
    47a0:	e59375e8 	ldr	r7, [r3, #1512]	; 0x5e8
    47a4:	f57ff04f 	dsb	sy
    47a8:	e1a08e88 	lsl	r8, r8, #29
    47ac:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    47b0:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    47b4:	e1877008 	orr	r7, r7, r8
    47b8:	f57ff04e 	dsb	st
    47bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    47c0:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    47c4:	e58375e8 	str	r7, [r3, #1512]	; 0x5e8
    47c8:	e3017168 	movw	r7, #4456	; 0x1168
    47cc:	eafffe1f 	b	4050 <ipu_init_channel_buffer+0xe24>
    47d0:	e1a07305 	lsl	r7, r5, #6
    47d4:	e5948ecc 	ldr	r8, [r4, #3788]	; 0xecc
    47d8:	e2877028 	add	r7, r7, #40	; 0x28
    47dc:	e0833007 	add	r3, r3, r7
    47e0:	e5939000 	ldr	r9, [r3]
    47e4:	f57ff04f 	dsb	sy
    47e8:	e1a08e88 	lsl	r8, r8, #29
    47ec:	e3c99206 	bic	r9, r9, #1610612736	; 0x60000000
    47f0:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    47f4:	e1899008 	orr	r9, r9, r8
    47f8:	f57ff04e 	dsb	st
    47fc:	ebfffffe 	bl	0 <arm_heavy_mb>
    4800:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4804:	e0837007 	add	r7, r3, r7
    4808:	e5879000 	str	r9, [r7]
    480c:	e59d1020 	ldr	r1, [sp, #32]
    4810:	e3510014 	cmp	r1, #20
    4814:	8afffe17 	bhi	4078 <ipu_init_channel_buffer+0xe4c>
    4818:	e3002000 	movw	r2, #0
    481c:	e3402000 	movt	r2, #0
    4820:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    4824:	e3520000 	cmp	r2, #0
    4828:	c1a02302 	lslgt	r2, r2, #6
    482c:	c2827028 	addgt	r7, r2, #40	; 0x28
    4830:	dafffe10 	ble	4078 <ipu_init_channel_buffer+0xe4c>
    4834:	eafffe05 	b	4050 <ipu_init_channel_buffer+0xe24>
    4838:	e5948ed4 	ldr	r8, [r4, #3796]	; 0xed4
    483c:	e59376e8 	ldr	r7, [r3, #1768]	; 0x6e8
    4840:	f57ff04f 	dsb	sy
    4844:	e1a08e88 	lsl	r8, r8, #29
    4848:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    484c:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    4850:	e1877008 	orr	r7, r7, r8
    4854:	f57ff04e 	dsb	st
    4858:	ebfffffe 	bl	0 <arm_heavy_mb>
    485c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4860:	e58376e8 	str	r7, [r3, #1768]	; 0x6e8
    4864:	e30171a8 	movw	r7, #4520	; 0x11a8
    4868:	eafffdf8 	b	4050 <ipu_init_channel_buffer+0xe24>
    486c:	e1a07305 	lsl	r7, r5, #6
    4870:	e5949edc 	ldr	r9, [r4, #3804]	; 0xedc
    4874:	e2877028 	add	r7, r7, #40	; 0x28
    4878:	e0833007 	add	r3, r3, r7
    487c:	e5938000 	ldr	r8, [r3]
    4880:	f57ff04f 	dsb	sy
    4884:	e1a09e89 	lsl	r9, r9, #29
    4888:	e3c88206 	bic	r8, r8, #1610612736	; 0x60000000
    488c:	e2099206 	and	r9, r9, #1610612736	; 0x60000000
    4890:	e1888009 	orr	r8, r8, r9
    4894:	f57ff04e 	dsb	st
    4898:	ebfffffe 	bl	0 <arm_heavy_mb>
    489c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    48a0:	e0837007 	add	r7, r3, r7
    48a4:	e5878000 	str	r8, [r7]
    48a8:	e59d1020 	ldr	r1, [sp, #32]
    48ac:	e3510014 	cmp	r1, #20
    48b0:	8afffdf0 	bhi	4078 <ipu_init_channel_buffer+0xe4c>
    48b4:	e3002000 	movw	r2, #0
    48b8:	e3402000 	movt	r2, #0
    48bc:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    48c0:	e3520000 	cmp	r2, #0
    48c4:	dafffdeb 	ble	4078 <ipu_init_channel_buffer+0xe4c>
    48c8:	e1a02302 	lsl	r2, r2, #6
    48cc:	e2827028 	add	r7, r2, #40	; 0x28
    48d0:	e0833007 	add	r3, r3, r7
    48d4:	e5933000 	ldr	r3, [r3]
    48d8:	f57ff04f 	dsb	sy
    48dc:	e3c33206 	bic	r3, r3, #1610612736	; 0x60000000
    48e0:	e1899003 	orr	r9, r9, r3
    48e4:	f57ff04e 	dsb	st
    48e8:	ebfffffe 	bl	0 <arm_heavy_mb>
    48ec:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    48f0:	e0837007 	add	r7, r3, r7
    48f4:	e5879000 	str	r9, [r7]
    48f8:	eafffdde 	b	4078 <ipu_init_channel_buffer+0xe4c>
    48fc:	e3520000 	cmp	r2, #0
    4900:	12872f59 	addne	r2, r7, #356	; 0x164
    4904:	1affff7b 	bne	46f8 <ipu_init_channel_buffer+0x14cc>
    4908:	eaffff79 	b	46f4 <ipu_init_channel_buffer+0x14c8>
    490c:	e3550005 	cmp	r5, #5
    4910:	0afffcce 	beq	3c50 <ipu_init_channel_buffer+0xa24>
    4914:	e245302d 	sub	r3, r5, #45	; 0x2d
    4918:	e3530005 	cmp	r3, #5
    491c:	9a00015b 	bls	4e90 <ipu_init_channel_buffer+0x1c64>
    4920:	e2453017 	sub	r3, r5, #23
    4924:	e3530006 	cmp	r3, #6
    4928:	9a00018f 	bls	4f6c <ipu_init_channel_buffer+0x1d40>
    492c:	e59d102c 	ldr	r1, [sp, #44]	; 0x2c
    4930:	e59d0018 	ldr	r0, [sp, #24]
    4934:	ebfffffe 	bl	0 <_ipu_disp_chan_is_interlaced>
    4938:	e3500000 	cmp	r0, #0
    493c:	0a00000b 	beq	4970 <ipu_init_channel_buffer+0x1744>
    4940:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4944:	e1a08205 	lsl	r8, r5, #4
    4948:	e59d2020 	ldr	r2, [sp, #32]
    494c:	e288900a 	add	r9, r8, #10
    4950:	e3520014 	cmp	r2, #20
    4954:	e1a09109 	lsl	r9, r9, #2
    4958:	83e0a015 	mvnhi	sl, #21
    495c:	e249b01c 	sub	fp, r9, #28
    4960:	8afffce0 	bhi	3ce8 <ipu_init_channel_buffer+0xabc>
    4964:	e300a000 	movw	sl, #0
    4968:	e340a000 	movt	sl, #0
    496c:	eafffcdb 	b	3ce0 <ipu_init_channel_buffer+0xab4>
    4970:	e59d3018 	ldr	r3, [sp, #24]
    4974:	e0832005 	add	r2, r3, r5
    4978:	e3013dde 	movw	r3, #7646	; 0x1dde
    497c:	e7d22003 	ldrb	r2, [r2, r3]
    4980:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4984:	e3520000 	cmp	r2, #0
    4988:	0afffd4f 	beq	3ecc <ipu_init_channel_buffer+0xca0>
    498c:	eaffffec 	b	4944 <ipu_init_channel_buffer+0x1718>
    4990:	e59d3018 	ldr	r3, [sp, #24]
    4994:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    4998:	e0832c42 	add	r2, r3, r2, asr #24
    499c:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    49a0:	e7d23003 	ldrb	r3, [r2, r3]
    49a4:	e3530000 	cmp	r3, #0
    49a8:	1a000059 	bne	4b14 <ipu_init_channel_buffer+0x18e8>
    49ac:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    49b0:	e3043742 	movw	r3, #18242	; 0x4742
    49b4:	e3443152 	movt	r3, #16722	; 0x4152
    49b8:	e1520003 	cmp	r2, r3
    49bc:	0a000007 	beq	49e0 <ipu_init_channel_buffer+0x17b4>
    49c0:	e3043241 	movw	r3, #16961	; 0x4241
    49c4:	e3453247 	movt	r3, #21063	; 0x5247
    49c8:	e1520003 	cmp	r2, r3
    49cc:	0a000003 	beq	49e0 <ipu_init_channel_buffer+0x17b4>
    49d0:	e3043752 	movw	r3, #18258	; 0x4752
    49d4:	e3443142 	movt	r3, #16706	; 0x4142
    49d8:	e1520003 	cmp	r2, r3
    49dc:	1afffc6c 	bne	3b94 <ipu_init_channel_buffer+0x968>
    49e0:	e1a07305 	lsl	r7, r5, #6
    49e4:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    49e8:	e2877028 	add	r7, r7, #40	; 0x28
    49ec:	e0833007 	add	r3, r3, r7
    49f0:	e5938000 	ldr	r8, [r3]
    49f4:	f57ff04f 	dsb	sy
    49f8:	e3c88402 	bic	r8, r8, #33554432	; 0x2000000
    49fc:	f57ff04e 	dsb	st
    4a00:	ebfffffe 	bl	0 <arm_heavy_mb>
    4a04:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4a08:	e0837007 	add	r7, r3, r7
    4a0c:	e5878000 	str	r8, [r7]
    4a10:	e59d2020 	ldr	r2, [sp, #32]
    4a14:	e3520014 	cmp	r2, #20
    4a18:	8afffc5d 	bhi	3b94 <ipu_init_channel_buffer+0x968>
    4a1c:	e300a000 	movw	sl, #0
    4a20:	e340a000 	movt	sl, #0
    4a24:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4a28:	e3520000 	cmp	r2, #0
    4a2c:	dafffc58 	ble	3b94 <ipu_init_channel_buffer+0x968>
    4a30:	e1a02302 	lsl	r2, r2, #6
    4a34:	e2827028 	add	r7, r2, #40	; 0x28
    4a38:	e0833007 	add	r3, r3, r7
    4a3c:	e5938000 	ldr	r8, [r3]
    4a40:	f57ff04f 	dsb	sy
    4a44:	e3c88402 	bic	r8, r8, #33554432	; 0x2000000
    4a48:	f57ff04e 	dsb	st
    4a4c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4a50:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4a54:	e0837007 	add	r7, r3, r7
    4a58:	e5878000 	str	r8, [r7]
    4a5c:	eafffc4c 	b	3b94 <ipu_init_channel_buffer+0x968>
    4a60:	e59d102c 	ldr	r1, [sp, #44]	; 0x2c
    4a64:	e59d0018 	ldr	r0, [sp, #24]
    4a68:	ebfffffe 	bl	0 <_ipu_disp_chan_is_interlaced>
    4a6c:	e3500000 	cmp	r0, #0
    4a70:	0affffbe 	beq	4970 <ipu_init_channel_buffer+0x1744>
    4a74:	e249b01c 	sub	fp, r9, #28
    4a78:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4a7c:	e3e0a015 	mvn	sl, #21
    4a80:	eafffc98 	b	3ce8 <ipu_init_channel_buffer+0xabc>
    4a84:	e593a000 	ldr	sl, [r3]
    4a88:	f57ff04f 	dsb	sy
    4a8c:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    4a90:	e38aa907 	orr	sl, sl, #114688	; 0x1c000
    4a94:	f57ff04e 	dsb	st
    4a98:	ebfffffe 	bl	0 <arm_heavy_mb>
    4a9c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4aa0:	e0832009 	add	r2, r3, r9
    4aa4:	e582a000 	str	sl, [r2]
    4aa8:	e59d2020 	ldr	r2, [sp, #32]
    4aac:	e3520014 	cmp	r2, #20
    4ab0:	8affffea 	bhi	4a60 <ipu_init_channel_buffer+0x1834>
    4ab4:	e300a000 	movw	sl, #0
    4ab8:	e340a000 	movt	sl, #0
    4abc:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4ac0:	e3520000 	cmp	r2, #0
    4ac4:	dafffc7b 	ble	3cb8 <ipu_init_channel_buffer+0xa8c>
    4ac8:	e1a02302 	lsl	r2, r2, #6
    4acc:	e2828028 	add	r8, r2, #40	; 0x28
    4ad0:	e0833008 	add	r3, r3, r8
    4ad4:	e5939000 	ldr	r9, [r3]
    4ad8:	f57ff04f 	dsb	sy
    4adc:	e3c9997f 	bic	r9, r9, #2080768	; 0x1fc000
    4ae0:	e3899907 	orr	r9, r9, #114688	; 0x1c000
    4ae4:	f57ff04e 	dsb	st
    4ae8:	ebfffffe 	bl	0 <arm_heavy_mb>
    4aec:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4af0:	e0838008 	add	r8, r3, r8
    4af4:	e5889000 	str	r9, [r8]
    4af8:	eafffc6e 	b	3cb8 <ipu_init_channel_buffer+0xa8c>
    4afc:	e3001000 	movw	r1, #0
    4b00:	e1a02005 	mov	r2, r5
    4b04:	e3401000 	movt	r1, #0
    4b08:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    4b0c:	ebfffffe 	bl	0 <dev_warn>
    4b10:	eafffc93 	b	3d64 <ipu_init_channel_buffer+0xb38>
    4b14:	e1a07305 	lsl	r7, r5, #6
    4b18:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4b1c:	e2877028 	add	r7, r7, #40	; 0x28
    4b20:	e0833007 	add	r3, r3, r7
    4b24:	e5939000 	ldr	r9, [r3]
    4b28:	f57ff04f 	dsb	sy
    4b2c:	e3899402 	orr	r9, r9, #33554432	; 0x2000000
    4b30:	f57ff04e 	dsb	st
    4b34:	ebfffffe 	bl	0 <arm_heavy_mb>
    4b38:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4b3c:	e0832007 	add	r2, r3, r7
    4b40:	e5829000 	str	r9, [r2]
    4b44:	e59d2020 	ldr	r2, [sp, #32]
    4b48:	e3520014 	cmp	r2, #20
    4b4c:	8a00000f 	bhi	4b90 <ipu_init_channel_buffer+0x1964>
    4b50:	e300a000 	movw	sl, #0
    4b54:	e340a000 	movt	sl, #0
    4b58:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4b5c:	e3520000 	cmp	r2, #0
    4b60:	da00000a 	ble	4b90 <ipu_init_channel_buffer+0x1964>
    4b64:	e1a02302 	lsl	r2, r2, #6
    4b68:	e2829028 	add	r9, r2, #40	; 0x28
    4b6c:	e0833009 	add	r3, r3, r9
    4b70:	e593a000 	ldr	sl, [r3]
    4b74:	f57ff04f 	dsb	sy
    4b78:	e38aa402 	orr	sl, sl, #33554432	; 0x2000000
    4b7c:	f57ff04e 	dsb	st
    4b80:	ebfffffe 	bl	0 <arm_heavy_mb>
    4b84:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4b88:	e0822009 	add	r2, r2, r9
    4b8c:	e582a000 	str	sl, [r2]
    4b90:	e358000d 	cmp	r8, #13
    4b94:	979ff108 	ldrls	pc, [pc, r8, lsl #2]
    4b98:	ea000205 	b	53b4 <ipu_init_channel_buffer+0x2188>
    4b9c:	0000526c 	andeq	r5, r0, ip, ror #4
    4ba0:	00005088 	andeq	r5, r0, r8, lsl #1
    4ba4:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4ba8:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bac:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bb0:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bb4:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bb8:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bbc:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bc0:	0000527c 	andeq	r5, r0, ip, ror r2
    4bc4:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bc8:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bcc:	000053b4 			; <UNDEFINED> instruction: 0x000053b4
    4bd0:	00005274 	andeq	r5, r0, r4, ror r2
    4bd4:	e3550003 	cmp	r5, #3
    4bd8:	8afffcd0 	bhi	3f20 <ipu_init_channel_buffer+0xcf4>
    4bdc:	e0833305 	add	r3, r3, r5, lsl #6
    4be0:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    4be4:	f57ff04f 	dsb	sy
    4be8:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    4bec:	e3053049 	movw	r3, #20553	; 0x5049
    4bf0:	e3433055 	movt	r3, #12373	; 0x3055
    4bf4:	e7e62752 	ubfx	r2, r2, #14, #7
    4bf8:	e2822001 	add	r2, r2, #1
    4bfc:	e1510003 	cmp	r1, r3
    4c00:	01a02222 	lsreq	r2, r2, #4
    4c04:	0a000005 	beq	4c20 <ipu_init_channel_buffer+0x19f4>
    4c08:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    4c0c:	e3053049 	movw	r3, #20553	; 0x5049
    4c10:	e3433255 	movt	r3, #12885	; 0x3255
    4c14:	e1510003 	cmp	r1, r3
    4c18:	01a021a2 	lsreq	r2, r2, #3
    4c1c:	11a02122 	lsrne	r2, r2, #2
    4c20:	e59d102c 	ldr	r1, [sp, #44]	; 0x2c
    4c24:	e2422001 	sub	r2, r2, #1
    4c28:	e59d0018 	ldr	r0, [sp, #24]
    4c2c:	ebfffffe 	bl	0 <_ipu_smfc_set_burst_size>
    4c30:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4c34:	eafffcb9 	b	3f20 <ipu_init_channel_buffer+0xcf4>
    4c38:	e3032535 	movw	r2, #13621	; 0x3535
    4c3c:	e3432135 	movt	r2, #12597	; 0x3135
    4c40:	e1510002 	cmp	r1, r2
    4c44:	0a00028d 	beq	5680 <ipu_init_channel_buffer+0x2454>
    4c48:	8a0000e2 	bhi	4fd8 <ipu_init_channel_buffer+0x1dac>
    4c4c:	e3032449 	movw	r2, #13385	; 0x3449
    4c50:	e3432032 	movt	r2, #12338	; 0x3032
    4c54:	e1510002 	cmp	r1, r2
    4c58:	0a0000e7 	beq	4ffc <ipu_init_channel_buffer+0x1dd0>
    4c5c:	e3053049 	movw	r3, #20553	; 0x5049
    4c60:	e3433055 	movt	r3, #12373	; 0x3055
    4c64:	e1510003 	cmp	r1, r3
    4c68:	1afffa4b 	bne	359c <ipu_init_channel_buffer+0x370>
    4c6c:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    4c70:	e19a2009 	orrs	r2, sl, r9
    4c74:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    4c78:	e38338cf 	orr	r3, r3, #13565952	; 0xcf0000
    4c7c:	e3833903 	orr	r3, r3, #49152	; 0xc000
    4c80:	e3822b0a 	orr	r2, r2, #10240	; 0x2800
    4c84:	e58d3078 	str	r3, [sp, #120]	; 0x78
    4c88:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    4c8c:	1afffb2f 	bne	3950 <ipu_init_channel_buffer+0x724>
    4c90:	eafffa47 	b	35b4 <ipu_init_channel_buffer+0x388>
    4c94:	e2453005 	sub	r3, r5, #5
    4c98:	e353002d 	cmp	r3, #45	; 0x2d
    4c9c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    4ca0:	ea000204 	b	54b8 <ipu_init_channel_buffer+0x228c>
    4ca4:	000054b0 			; <UNDEFINED> instruction: 0x000054b0
    4ca8:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cac:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cb0:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cb4:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cb8:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cbc:	000054a0 	andeq	r5, r0, r0, lsr #9
    4cc0:	00005530 	andeq	r5, r0, r0, lsr r5
    4cc4:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cc8:	00005520 	andeq	r5, r0, r0, lsr #10
    4ccc:	00005510 	andeq	r5, r0, r0, lsl r5
    4cd0:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cd4:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cd8:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cdc:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4ce0:	00005500 	andeq	r5, r0, r0, lsl #10
    4ce4:	000054f0 	strdeq	r5, [r0], -r0
    4ce8:	000054e0 	andeq	r5, r0, r0, ror #9
    4cec:	000054d0 	ldrdeq	r5, [r0], -r0
    4cf0:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cf4:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cf8:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4cfc:	000054c0 	andeq	r5, r0, r0, asr #9
    4d00:	00005460 	andeq	r5, r0, r0, ror #8
    4d04:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d08:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d0c:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d10:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d14:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d18:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d1c:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d20:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d24:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d28:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d2c:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d30:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d34:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d38:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d3c:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d40:	000054b8 			; <UNDEFINED> instruction: 0x000054b8
    4d44:	00005450 	andeq	r5, r0, r0, asr r4
    4d48:	00005440 	andeq	r5, r0, r0, asr #8
    4d4c:	00005404 	andeq	r5, r0, r4, lsl #8
    4d50:	00005490 	muleq	r0, r0, r4
    4d54:	00005480 	andeq	r5, r0, r0, lsl #9
    4d58:	00005470 	andeq	r5, r0, r0, ror r4
    4d5c:	e0833006 	add	r3, r3, r6
    4d60:	e5933000 	ldr	r3, [r3]
    4d64:	f57ff04f 	dsb	sy
    4d68:	e0099003 	and	r9, r9, r3
    4d6c:	f57ff04e 	dsb	st
    4d70:	ebfffffe 	bl	0 <arm_heavy_mb>
    4d74:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4d78:	e0836006 	add	r6, r3, r6
    4d7c:	e5869000 	str	r9, [r6]
    4d80:	e59d2018 	ldr	r2, [sp, #24]
    4d84:	e5922004 	ldr	r2, [r2, #4]
    4d88:	e3520000 	cmp	r2, #0
    4d8c:	12872f59 	addne	r2, r7, #356	; 0x164
    4d90:	03a02f4b 	moveq	r2, #300	; 0x12c
    4d94:	e0833002 	add	r3, r3, r2
    4d98:	e5933000 	ldr	r3, [r3]
    4d9c:	f57ff04f 	dsb	sy
    4da0:	e59d2018 	ldr	r2, [sp, #24]
    4da4:	e1888003 	orr	r8, r8, r3
    4da8:	e5922004 	ldr	r2, [r2, #4]
    4dac:	e3520000 	cmp	r2, #0
    4db0:	12877f59 	addne	r7, r7, #356	; 0x164
    4db4:	03a07f4b 	moveq	r7, #300	; 0x12c
    4db8:	f57ff04e 	dsb	st
    4dbc:	ebfffffe 	bl	0 <arm_heavy_mb>
    4dc0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4dc4:	e0833007 	add	r3, r3, r7
    4dc8:	e5838000 	str	r8, [r3]
    4dcc:	e59d7018 	ldr	r7, [sp, #24]
    4dd0:	e5973004 	ldr	r3, [r7, #4]
    4dd4:	e3530000 	cmp	r3, #0
    4dd8:	03a06040 	moveq	r6, #64	; 0x40
    4ddc:	13a0603c 	movne	r6, #60	; 0x3c
    4de0:	f57ff04e 	dsb	st
    4de4:	ebfffffe 	bl	0 <arm_heavy_mb>
    4de8:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    4dec:	e3042047 	movw	r2, #16455	; 0x4047
    4df0:	e3402044 	movt	r2, #68	; 0x44
    4df4:	e0833006 	add	r3, r3, r6
    4df8:	e5832000 	str	r2, [r3]
    4dfc:	e5973004 	ldr	r3, [r7, #4]
    4e00:	e3530000 	cmp	r3, #0
    4e04:	03a06040 	moveq	r6, #64	; 0x40
    4e08:	13a06038 	movne	r6, #56	; 0x38
    4e0c:	f57ff04e 	dsb	st
    4e10:	ebfffffe 	bl	0 <arm_heavy_mb>
    4e14:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    4e18:	e3042241 	movw	r2, #16961	; 0x4241
    4e1c:	e3442600 	movt	r2, #17920	; 0x4600
    4e20:	e0833006 	add	r3, r3, r6
    4e24:	e5832000 	str	r2, [r3]
    4e28:	e5973004 	ldr	r3, [r7, #4]
    4e2c:	e3530000 	cmp	r3, #0
    4e30:	03a0602c 	moveq	r6, #44	; 0x2c
    4e34:	13a06030 	movne	r6, #48	; 0x30
    4e38:	f57ff04e 	dsb	st
    4e3c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4e40:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    4e44:	e3a02045 	mov	r2, #69	; 0x45
    4e48:	e0833006 	add	r3, r3, r6
    4e4c:	e5832000 	str	r2, [r3]
    4e50:	e5972004 	ldr	r2, [r7, #4]
    4e54:	e1a05085 	lsl	r5, r5, #1
    4e58:	e3a06003 	mov	r6, #3
    4e5c:	e205301e 	and	r3, r5, #30
    4e60:	e3520000 	cmp	r2, #0
    4e64:	e1a06316 	lsl	r6, r6, r3
    4e68:	11a052a5 	lsrne	r5, r5, #5
    4e6c:	03a05f4b 	moveq	r5, #300	; 0x12c
    4e70:	12855096 	addne	r5, r5, #150	; 0x96
    4e74:	11a05105 	lslne	r5, r5, #2
    4e78:	f57ff04e 	dsb	st
    4e7c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4e80:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    4e84:	e0835005 	add	r5, r3, r5
    4e88:	e5856000 	str	r6, [r5]
    4e8c:	eafffe3d 	b	4788 <ipu_init_channel_buffer+0x155c>
    4e90:	e1a07205 	lsl	r7, r5, #4
    4e94:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4e98:	e287900a 	add	r9, r7, #10
    4e9c:	e1a08007 	mov	r8, r7
    4ea0:	e1a09109 	lsl	r9, r9, #2
    4ea4:	e0833009 	add	r3, r3, r9
    4ea8:	e593a000 	ldr	sl, [r3]
    4eac:	f57ff04f 	dsb	sy
    4eb0:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    4eb4:	e38aa907 	orr	sl, sl, #114688	; 0x1c000
    4eb8:	f57ff04e 	dsb	st
    4ebc:	ebfffffe 	bl	0 <arm_heavy_mb>
    4ec0:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4ec4:	e0832009 	add	r2, r3, r9
    4ec8:	e582a000 	str	sl, [r2]
    4ecc:	e59d1020 	ldr	r1, [sp, #32]
    4ed0:	e3510014 	cmp	r1, #20
    4ed4:	8a000004 	bhi	4eec <ipu_init_channel_buffer+0x1cc0>
    4ed8:	e3002000 	movw	r2, #0
    4edc:	e3402000 	movt	r2, #0
    4ee0:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    4ee4:	e3520000 	cmp	r2, #0
    4ee8:	ca000124 	bgt	5380 <ipu_init_channel_buffer+0x2154>
    4eec:	e249b01c 	sub	fp, r9, #28
    4ef0:	e083300b 	add	r3, r3, fp
    4ef4:	e593a000 	ldr	sl, [r3]
    4ef8:	f57ff04f 	dsb	sy
    4efc:	e3caa606 	bic	sl, sl, #6291456	; 0x600000
    4f00:	e38aa602 	orr	sl, sl, #2097152	; 0x200000
    4f04:	f57ff04e 	dsb	st
    4f08:	ebfffffe 	bl	0 <arm_heavy_mb>
    4f0c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4f10:	e083200b 	add	r2, r3, fp
    4f14:	e582a000 	str	sl, [r2]
    4f18:	e59d2020 	ldr	r2, [sp, #32]
    4f1c:	e3520014 	cmp	r2, #20
    4f20:	8a000024 	bhi	4fb8 <ipu_init_channel_buffer+0x1d8c>
    4f24:	e300a000 	movw	sl, #0
    4f28:	e340a000 	movt	sl, #0
    4f2c:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4f30:	e3520000 	cmp	r2, #0
    4f34:	dafffb5f 	ble	3cb8 <ipu_init_channel_buffer+0xa8c>
    4f38:	e1a02302 	lsl	r2, r2, #6
    4f3c:	e282800c 	add	r8, r2, #12
    4f40:	e0833008 	add	r3, r3, r8
    4f44:	e5939000 	ldr	r9, [r3]
    4f48:	f57ff04f 	dsb	sy
    4f4c:	e3c99606 	bic	r9, r9, #6291456	; 0x600000
    4f50:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    4f54:	f57ff04e 	dsb	st
    4f58:	ebfffffe 	bl	0 <arm_heavy_mb>
    4f5c:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4f60:	e0822008 	add	r2, r2, r8
    4f64:	e5829000 	str	r9, [r2]
    4f68:	eafffb52 	b	3cb8 <ipu_init_channel_buffer+0xa8c>
    4f6c:	e1a03305 	lsl	r3, r5, #6
    4f70:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    4f74:	e2833028 	add	r3, r3, #40	; 0x28
    4f78:	e0823003 	add	r3, r2, r3
    4f7c:	e5937000 	ldr	r7, [r3]
    4f80:	f57ff04f 	dsb	sy
    4f84:	e59d8018 	ldr	r8, [sp, #24]
    4f88:	e1a01005 	mov	r1, r5
    4f8c:	e59d201c 	ldr	r2, [sp, #28]
    4f90:	e1a00008 	mov	r0, r8
    4f94:	ebfffffe 	bl	0 <_ipu_dmfc_set_wait4eot>
    4f98:	e7e62757 	ubfx	r2, r7, #14, #7
    4f9c:	e1a01005 	mov	r1, r5
    4fa0:	e2822001 	add	r2, r2, #1
    4fa4:	e1a00008 	mov	r0, r8
    4fa8:	ebfffffe 	bl	0 <_ipu_dmfc_set_burst_size>
    4fac:	eafffe5e 	b	492c <ipu_init_channel_buffer+0x1700>
    4fb0:	e1a08002 	mov	r8, r2
    4fb4:	eafff925 	b	3450 <ipu_init_channel_buffer+0x224>
    4fb8:	e59d102c 	ldr	r1, [sp, #44]	; 0x2c
    4fbc:	e59d0018 	ldr	r0, [sp, #24]
    4fc0:	ebfffffe 	bl	0 <_ipu_disp_chan_is_interlaced>
    4fc4:	e3500000 	cmp	r0, #0
    4fc8:	0a0000da 	beq	5338 <ipu_init_channel_buffer+0x210c>
    4fcc:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    4fd0:	e3e0a015 	mvn	sl, #21
    4fd4:	eafffb43 	b	3ce8 <ipu_init_channel_buffer+0xabc>
    4fd8:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    4fdc:	e3052049 	movw	r2, #20553	; 0x5049
    4fe0:	e3432155 	movt	r2, #12629	; 0x3155
    4fe4:	e1530002 	cmp	r3, r2
    4fe8:	0afff96f 	beq	35ac <ipu_init_channel_buffer+0x380>
    4fec:	e3052559 	movw	r2, #21849	; 0x5559
    4ff0:	e3432231 	movt	r2, #12849	; 0x3231
    4ff4:	e1530002 	cmp	r3, r2
    4ff8:	1afff967 	bne	359c <ipu_init_channel_buffer+0x370>
    4ffc:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    5000:	e1a0c0a7 	lsr	ip, r7, #1
    5004:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    5008:	e3580000 	cmp	r8, #0
    500c:	e0000297 	mul	r0, r7, r2
    5010:	e001029c 	mul	r1, ip, r2
    5014:	e3832501 	orr	r2, r3, #4194304	; 0x400000
    5018:	e08010a1 	add	r1, r0, r1, lsr #1
    501c:	1a0000be 	bne	531c <ipu_init_channel_buffer+0x20f0>
    5020:	e3550003 	cmp	r5, #3
    5024:	83a0391f 	movhi	r3, #507904	; 0x7c000
    5028:	8a000003 	bhi	503c <ipu_init_channel_buffer+0x1e10>
    502c:	e5d43ee0 	ldrb	r3, [r4, #3808]	; 0xee0
    5030:	e3530000 	cmp	r3, #0
    5034:	03a0391f 	moveq	r3, #507904	; 0x7c000
    5038:	13a0390f 	movne	r3, #245760	; 0x3c000
    503c:	e1822003 	orr	r2, r2, r3
    5040:	e1a0700c 	mov	r7, ip
    5044:	e58d2078 	str	r2, [sp, #120]	; 0x78
    5048:	ea0000b7 	b	532c <ipu_init_channel_buffer+0x2100>
    504c:	e1a02302 	lsl	r2, r2, #6
    5050:	e2828028 	add	r8, r2, #40	; 0x28
    5054:	e0833008 	add	r3, r3, r8
    5058:	e5939000 	ldr	r9, [r3]
    505c:	f57ff04f 	dsb	sy
    5060:	e3c9997f 	bic	r9, r9, #2080768	; 0x1fc000
    5064:	e389990f 	orr	r9, r9, #245760	; 0x3c000
    5068:	eafffe9d 	b	4ae4 <ipu_init_channel_buffer+0x18b8>
    506c:	e3001000 	movw	r1, #0
    5070:	e1a0300a 	mov	r3, sl
    5074:	e3401000 	movt	r1, #0
    5078:	e1a02005 	mov	r2, r5
    507c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    5080:	ebfffffe 	bl	0 <dev_warn>
    5084:	eafffa93 	b	3ad8 <ipu_init_channel_buffer+0x8ac>
    5088:	e3a09301 	mov	r9, #67108864	; 0x4000000
    508c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    5090:	e0833007 	add	r3, r3, r7
    5094:	e5938000 	ldr	r8, [r3]
    5098:	f57ff04f 	dsb	sy
    509c:	e3c88307 	bic	r8, r8, #469762048	; 0x1c000000
    50a0:	e1888009 	orr	r8, r8, r9
    50a4:	f57ff04e 	dsb	st
    50a8:	ebfffffe 	bl	0 <arm_heavy_mb>
    50ac:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    50b0:	e0832007 	add	r2, r3, r7
    50b4:	e5828000 	str	r8, [r2]
    50b8:	e59d2020 	ldr	r2, [sp, #32]
    50bc:	e3520014 	cmp	r2, #20
    50c0:	8a000010 	bhi	5108 <ipu_init_channel_buffer+0x1edc>
    50c4:	e300a000 	movw	sl, #0
    50c8:	e340a000 	movt	sl, #0
    50cc:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    50d0:	e3520000 	cmp	r2, #0
    50d4:	da00000b 	ble	5108 <ipu_init_channel_buffer+0x1edc>
    50d8:	e1a02302 	lsl	r2, r2, #6
    50dc:	e2828028 	add	r8, r2, #40	; 0x28
    50e0:	e0833008 	add	r3, r3, r8
    50e4:	e5933000 	ldr	r3, [r3]
    50e8:	f57ff04f 	dsb	sy
    50ec:	e3c33307 	bic	r3, r3, #469762048	; 0x1c000000
    50f0:	e1839009 	orr	r9, r3, r9
    50f4:	f57ff04e 	dsb	st
    50f8:	ebfffffe 	bl	0 <arm_heavy_mb>
    50fc:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    5100:	e0832008 	add	r2, r3, r8
    5104:	e5829000 	str	r9, [r2]
    5108:	e2878008 	add	r8, r7, #8
    510c:	e0833008 	add	r3, r3, r8
    5110:	e5939000 	ldr	r9, [r3]
    5114:	f57ff04f 	dsb	sy
    5118:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    511c:	f57ff04e 	dsb	st
    5120:	ebfffffe 	bl	0 <arm_heavy_mb>
    5124:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    5128:	e0832008 	add	r2, r3, r8
    512c:	e5829000 	str	r9, [r2]
    5130:	e59d2020 	ldr	r2, [sp, #32]
    5134:	e3520014 	cmp	r2, #20
    5138:	8a00000f 	bhi	517c <ipu_init_channel_buffer+0x1f50>
    513c:	e300a000 	movw	sl, #0
    5140:	e340a000 	movt	sl, #0
    5144:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    5148:	e3520000 	cmp	r2, #0
    514c:	da00000a 	ble	517c <ipu_init_channel_buffer+0x1f50>
    5150:	e1a02302 	lsl	r2, r2, #6
    5154:	e2828030 	add	r8, r2, #48	; 0x30
    5158:	e0833008 	add	r3, r3, r8
    515c:	e5939000 	ldr	r9, [r3]
    5160:	f57ff04f 	dsb	sy
    5164:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    5168:	f57ff04e 	dsb	st
    516c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5170:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    5174:	e0838008 	add	r8, r3, r8
    5178:	e5889000 	str	r9, [r8]
    517c:	e2878004 	add	r8, r7, #4
    5180:	e0833008 	add	r3, r3, r8
    5184:	e5939000 	ldr	r9, [r3]
    5188:	f57ff04f 	dsb	sy
    518c:	e389920e 	orr	r9, r9, #-536870912	; 0xe0000000
    5190:	f57ff04e 	dsb	st
    5194:	ebfffffe 	bl	0 <arm_heavy_mb>
    5198:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    519c:	e0832008 	add	r2, r3, r8
    51a0:	e5829000 	str	r9, [r2]
    51a4:	e59d2020 	ldr	r2, [sp, #32]
    51a8:	e3520014 	cmp	r2, #20
    51ac:	8a00000f 	bhi	51f0 <ipu_init_channel_buffer+0x1fc4>
    51b0:	e300a000 	movw	sl, #0
    51b4:	e340a000 	movt	sl, #0
    51b8:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    51bc:	e3520000 	cmp	r2, #0
    51c0:	da00000a 	ble	51f0 <ipu_init_channel_buffer+0x1fc4>
    51c4:	e1a02302 	lsl	r2, r2, #6
    51c8:	e282802c 	add	r8, r2, #44	; 0x2c
    51cc:	e0833008 	add	r3, r3, r8
    51d0:	e5939000 	ldr	r9, [r3]
    51d4:	f57ff04f 	dsb	sy
    51d8:	e389920e 	orr	r9, r9, #-536870912	; 0xe0000000
    51dc:	f57ff04e 	dsb	st
    51e0:	ebfffffe 	bl	0 <arm_heavy_mb>
    51e4:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    51e8:	e0838008 	add	r8, r3, r8
    51ec:	e5889000 	str	r9, [r8]
    51f0:	e0833007 	add	r3, r3, r7
    51f4:	e5938000 	ldr	r8, [r3]
    51f8:	f57ff04f 	dsb	sy
    51fc:	e3c8897f 	bic	r8, r8, #2080768	; 0x1fc000
    5200:	e388890f 	orr	r8, r8, #245760	; 0x3c000
    5204:	f57ff04e 	dsb	st
    5208:	ebfffffe 	bl	0 <arm_heavy_mb>
    520c:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    5210:	e0837007 	add	r7, r3, r7
    5214:	e5878000 	str	r8, [r7]
    5218:	e59d2020 	ldr	r2, [sp, #32]
    521c:	e3520014 	cmp	r2, #20
    5220:	8afffa5b 	bhi	3b94 <ipu_init_channel_buffer+0x968>
    5224:	e300a000 	movw	sl, #0
    5228:	e340a000 	movt	sl, #0
    522c:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    5230:	e3520000 	cmp	r2, #0
    5234:	dafffa56 	ble	3b94 <ipu_init_channel_buffer+0x968>
    5238:	e1a02302 	lsl	r2, r2, #6
    523c:	e2827028 	add	r7, r2, #40	; 0x28
    5240:	e0833007 	add	r3, r3, r7
    5244:	e5938000 	ldr	r8, [r3]
    5248:	f57ff04f 	dsb	sy
    524c:	e3c8897f 	bic	r8, r8, #2080768	; 0x1fc000
    5250:	e388890f 	orr	r8, r8, #245760	; 0x3c000
    5254:	f57ff04e 	dsb	st
    5258:	ebfffffe 	bl	0 <arm_heavy_mb>
    525c:	e5942d78 	ldr	r2, [r4, #3448]	; 0xd78
    5260:	e0822007 	add	r2, r2, r7
    5264:	e5828000 	str	r8, [r2]
    5268:	eafffa49 	b	3b94 <ipu_init_channel_buffer+0x968>
    526c:	e3a09000 	mov	r9, #0
    5270:	eaffff85 	b	508c <ipu_init_channel_buffer+0x1e60>
    5274:	e3a09302 	mov	r9, #134217728	; 0x8000000
    5278:	eaffff83 	b	508c <ipu_init_channel_buffer+0x1e60>
    527c:	e3a09201 	mov	r9, #268435456	; 0x10000000
    5280:	eaffff81 	b	508c <ipu_init_channel_buffer+0x1e60>
    5284:	e35a0000 	cmp	sl, #0
    5288:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    528c:	059d3028 	ldreq	r3, [sp, #40]	; 0x28
    5290:	11a0000a 	movne	r0, sl
    5294:	e382291f 	orr	r2, r2, #507904	; 0x7c000
    5298:	e58d2078 	str	r2, [sp, #120]	; 0x78
    529c:	00000397 	muleq	r0, r7, r3
    52a0:	e3590000 	cmp	r9, #0
    52a4:	01a01080 	lsleq	r1, r0, #1
    52a8:	0a00001f 	beq	532c <ipu_init_channel_buffer+0x2100>
    52ac:	e1a01009 	mov	r1, r9
    52b0:	eafff985 	b	38cc <ipu_init_channel_buffer+0x6a0>
    52b4:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    52b8:	e19a3009 	orrs	r3, sl, r9
    52bc:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    52c0:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    52c4:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    52c8:	e1e02602 	mvn	r2, r2, lsl #12
    52cc:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    52d0:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    52d4:	e1e02622 	mvn	r2, r2, lsr #12
    52d8:	e3811903 	orr	r1, r1, #49152	; 0xc000
    52dc:	e3833008 	orr	r3, r3, #8
    52e0:	e58d1078 	str	r1, [sp, #120]	; 0x78
    52e4:	e3801b02 	orr	r1, r0, #2048	; 0x800
    52e8:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    52ec:	e58d105c 	str	r1, [sp, #92]	; 0x5c
    52f0:	1afff996 	bne	3950 <ipu_init_channel_buffer+0x724>
    52f4:	eafff8ae 	b	35b4 <ipu_init_channel_buffer+0x388>
    52f8:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    52fc:	e1a0c0a7 	lsr	ip, r7, #1
    5300:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    5304:	e3580000 	cmp	r8, #0
    5308:	e0010297 	mul	r1, r7, r2
    530c:	e000029c 	mul	r0, ip, r2
    5310:	e3832501 	orr	r2, r3, #4194304	; 0x400000
    5314:	e08100a0 	add	r0, r1, r0, lsr #1
    5318:	0affff40 	beq	5020 <ipu_init_channel_buffer+0x1df4>
    531c:	e1a0708c 	lsl	r7, ip, #1
    5320:	e3832843 	orr	r2, r3, #4390912	; 0x430000
    5324:	e3822903 	orr	r2, r2, #49152	; 0xc000
    5328:	e58d2078 	str	r2, [sp, #120]	; 0x78
    532c:	e3570000 	cmp	r7, #0
    5330:	1afff967 	bne	38d4 <ipu_init_channel_buffer+0x6a8>
    5334:	eafff96a 	b	38e4 <ipu_init_channel_buffer+0x6b8>
    5338:	e59d3018 	ldr	r3, [sp, #24]
    533c:	e0832005 	add	r2, r3, r5
    5340:	e3013dde 	movw	r3, #7646	; 0x1dde
    5344:	e7d22003 	ldrb	r2, [r2, r3]
    5348:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    534c:	e3520000 	cmp	r2, #0
    5350:	0afffadd 	beq	3ecc <ipu_init_channel_buffer+0xca0>
    5354:	e287900a 	add	r9, r7, #10
    5358:	e1a08007 	mov	r8, r7
    535c:	e1a09109 	lsl	r9, r9, #2
    5360:	e3e0a015 	mvn	sl, #21
    5364:	e249b01c 	sub	fp, r9, #28
    5368:	eafffa5e 	b	3ce8 <ipu_init_channel_buffer+0xabc>
    536c:	e3053941 	movw	r3, #22849	; 0x5941
    5370:	e3453655 	movt	r3, #22101	; 0x5655
    5374:	e1520003 	cmp	r2, r3
    5378:	1afff887 	bne	359c <ipu_init_channel_buffer+0x370>
    537c:	eafff966 	b	391c <ipu_init_channel_buffer+0x6f0>
    5380:	e1a02302 	lsl	r2, r2, #6
    5384:	e282a028 	add	sl, r2, #40	; 0x28
    5388:	e083300a 	add	r3, r3, sl
    538c:	e593b000 	ldr	fp, [r3]
    5390:	f57ff04f 	dsb	sy
    5394:	e3cbb97f 	bic	fp, fp, #2080768	; 0x1fc000
    5398:	e38bb907 	orr	fp, fp, #114688	; 0x1c000
    539c:	f57ff04e 	dsb	st
    53a0:	ebfffffe 	bl	0 <arm_heavy_mb>
    53a4:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    53a8:	e083a00a 	add	sl, r3, sl
    53ac:	e58ab000 	str	fp, [sl]
    53b0:	eafffecd 	b	4eec <ipu_init_channel_buffer+0x1cc0>
    53b4:	e3001000 	movw	r1, #0
    53b8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    53bc:	e3401000 	movt	r1, #0
    53c0:	ebfffffe 	bl	0 <dev_err>
    53c4:	e5943d78 	ldr	r3, [r4, #3448]	; 0xd78
    53c8:	eaffff4e 	b	5108 <ipu_init_channel_buffer+0x1edc>
    53cc:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    53d0:	e19a3009 	orrs	r3, sl, r9
    53d4:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    53d8:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    53dc:	e1e02602 	mvn	r2, r2, lsl #12
    53e0:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    53e4:	e3833c22 	orr	r3, r3, #8704	; 0x2200
    53e8:	e1e02622 	mvn	r2, r2, lsr #12
    53ec:	e3811903 	orr	r1, r1, #49152	; 0xc000
    53f0:	e3833018 	orr	r3, r3, #24
    53f4:	e58d1078 	str	r1, [sp, #120]	; 0x78
    53f8:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    53fc:	1afff953 	bne	3950 <ipu_init_channel_buffer+0x724>
    5400:	eafff86b 	b	35b4 <ipu_init_channel_buffer+0x388>
    5404:	e3a0a028 	mov	sl, #40	; 0x28
    5408:	e3a03030 	mov	r3, #48	; 0x30
    540c:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5410:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    5414:	e083300a 	add	r3, r3, sl
    5418:	e5939000 	ldr	r9, [r3]
    541c:	f57ff04f 	dsb	sy
    5420:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    5424:	e1839009 	orr	r9, r3, r9
    5428:	f57ff04e 	dsb	st
    542c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5430:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    5434:	e083300a 	add	r3, r3, sl
    5438:	e5839000 	str	r9, [r3]
    543c:	eafffb1e 	b	40bc <ipu_init_channel_buffer+0xe90>
    5440:	e3a0300c 	mov	r3, #12
    5444:	e3a0a028 	mov	sl, #40	; 0x28
    5448:	e58d3044 	str	r3, [sp, #68]	; 0x44
    544c:	eaffffef 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5450:	e3a03003 	mov	r3, #3
    5454:	e3a0a028 	mov	sl, #40	; 0x28
    5458:	e58d3044 	str	r3, [sp, #68]	; 0x44
    545c:	eaffffeb 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5460:	e3a03603 	mov	r3, #3145728	; 0x300000
    5464:	e3a0a024 	mov	sl, #36	; 0x24
    5468:	e58d3044 	str	r3, [sp, #68]	; 0x44
    546c:	eaffffe7 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5470:	e3a03b03 	mov	r3, #3072	; 0xc00
    5474:	e3a0a028 	mov	sl, #40	; 0x28
    5478:	e58d3044 	str	r3, [sp, #68]	; 0x44
    547c:	eaffffe3 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5480:	e3a03c03 	mov	r3, #768	; 0x300
    5484:	e3a0a028 	mov	sl, #40	; 0x28
    5488:	e58d3044 	str	r3, [sp, #68]	; 0x44
    548c:	eaffffdf 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5490:	e3a030c0 	mov	r3, #192	; 0xc0
    5494:	e3a0a028 	mov	sl, #40	; 0x28
    5498:	e58d3044 	str	r3, [sp, #68]	; 0x44
    549c:	eaffffdb 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54a0:	e3a0300c 	mov	r3, #12
    54a4:	e3a0a024 	mov	sl, #36	; 0x24
    54a8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54ac:	eaffffd7 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54b0:	e3a03003 	mov	r3, #3
    54b4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54b8:	e3a0a024 	mov	sl, #36	; 0x24
    54bc:	eaffffd3 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54c0:	e3a03703 	mov	r3, #786432	; 0xc0000
    54c4:	e3a0a024 	mov	sl, #36	; 0x24
    54c8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54cc:	eaffffcf 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54d0:	e3a03803 	mov	r3, #196608	; 0x30000
    54d4:	e3a0a024 	mov	sl, #36	; 0x24
    54d8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54dc:	eaffffcb 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54e0:	e3a03903 	mov	r3, #49152	; 0xc000
    54e4:	e3a0a024 	mov	sl, #36	; 0x24
    54e8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54ec:	eaffffc7 	b	5410 <ipu_init_channel_buffer+0x21e4>
    54f0:	e3a03a03 	mov	r3, #12288	; 0x3000
    54f4:	e3a0a024 	mov	sl, #36	; 0x24
    54f8:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54fc:	eaffffc3 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5500:	e3a03b03 	mov	r3, #3072	; 0xc00
    5504:	e3a0a024 	mov	sl, #36	; 0x24
    5508:	e58d3044 	str	r3, [sp, #68]	; 0x44
    550c:	eaffffbf 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5510:	e3a03c03 	mov	r3, #768	; 0x300
    5514:	e3a0a024 	mov	sl, #36	; 0x24
    5518:	e58d3044 	str	r3, [sp, #68]	; 0x44
    551c:	eaffffbb 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5520:	e3a030c0 	mov	r3, #192	; 0xc0
    5524:	e3a0a024 	mov	sl, #36	; 0x24
    5528:	e58d3044 	str	r3, [sp, #68]	; 0x44
    552c:	eaffffb7 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5530:	e3a03030 	mov	r3, #48	; 0x30
    5534:	e3a0a024 	mov	sl, #36	; 0x24
    5538:	e58d3044 	str	r3, [sp, #68]	; 0x44
    553c:	eaffffb3 	b	5410 <ipu_init_channel_buffer+0x21e4>
    5540:	e35a0000 	cmp	sl, #0
    5544:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5548:	059d3028 	ldreq	r3, [sp, #40]	; 0x28
    554c:	e1a010a7 	lsr	r1, r7, #1
    5550:	11a0000a 	movne	r0, sl
    5554:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    5558:	e58d2078 	str	r2, [sp, #120]	; 0x78
    555c:	00000397 	muleq	r0, r7, r3
    5560:	e3590000 	cmp	r9, #0
    5564:	e1a07001 	mov	r7, r1
    5568:	008010a0 	addeq	r1, r0, r0, lsr #1
    556c:	0affff6e 	beq	532c <ipu_init_channel_buffer+0x2100>
    5570:	eaffff4d 	b	52ac <ipu_init_channel_buffer+0x2080>
    5574:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    5578:	e3580000 	cmp	r8, #0
    557c:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    5580:	e18a1009 	orr	r1, sl, r9
    5584:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    5588:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    558c:	0a000064 	beq	5724 <ipu_init_channel_buffer+0x24f8>
    5590:	e5942ebc 	ldr	r2, [r4, #3772]	; 0xebc
    5594:	e3520000 	cmp	r2, #0
    5598:	1a000061 	bne	5724 <ipu_init_channel_buffer+0x24f8>
    559c:	e3833401 	orr	r3, r3, #16777216	; 0x1000000
    55a0:	e3510000 	cmp	r1, #0
    55a4:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    55a8:	e58d3078 	str	r3, [sp, #120]	; 0x78
    55ac:	1afff8e7 	bne	3950 <ipu_init_channel_buffer+0x724>
    55b0:	eafff7ff 	b	35b4 <ipu_init_channel_buffer+0x388>
    55b4:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    55b8:	e19a3009 	orrs	r3, sl, r9
    55bc:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    55c0:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    55c4:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    55c8:	e1e02602 	mvn	r2, r2, lsl #12
    55cc:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    55d0:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    55d4:	e1e02622 	mvn	r2, r2, lsr #12
    55d8:	e3811903 	orr	r1, r1, #49152	; 0xc000
    55dc:	e3833c01 	orr	r3, r3, #256	; 0x100
    55e0:	eaffff3e 	b	52e0 <ipu_init_channel_buffer+0x20b4>
    55e4:	e35a0000 	cmp	sl, #0
    55e8:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    55ec:	059d3028 	ldreq	r3, [sp, #40]	; 0x28
    55f0:	11a0000a 	movne	r0, sl
    55f4:	00000397 	muleq	r0, r7, r3
    55f8:	e3580000 	cmp	r8, #0
    55fc:	0a00004e 	beq	573c <ipu_init_channel_buffer+0x2510>
    5600:	e5941ebc 	ldr	r1, [r4, #3772]	; 0xebc
    5604:	e3510000 	cmp	r1, #0
    5608:	1382288f 	orrne	r2, r2, #9371648	; 0x8f0000
    560c:	03822883 	orreq	r2, r2, #8585216	; 0x830000
    5610:	e3822903 	orr	r2, r2, #49152	; 0xc000
    5614:	13a01000 	movne	r1, #0
    5618:	01a07087 	lsleq	r7, r7, #1
    561c:	e58d2078 	str	r2, [sp, #120]	; 0x78
    5620:	eaffff41 	b	532c <ipu_init_channel_buffer+0x2100>
    5624:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    5628:	e19a3009 	orrs	r3, sl, r9
    562c:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    5630:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    5634:	e1e02602 	mvn	r2, r2, lsl #12
    5638:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    563c:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    5640:	e1e02622 	mvn	r2, r2, lsr #12
    5644:	e3811903 	orr	r1, r1, #49152	; 0xc000
    5648:	e3833c01 	orr	r3, r3, #256	; 0x100
    564c:	e58d1078 	str	r1, [sp, #120]	; 0x78
    5650:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    5654:	1afff8bd 	bne	3950 <ipu_init_channel_buffer+0x724>
    5658:	eafff7d5 	b	35b4 <ipu_init_channel_buffer+0x388>
    565c:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5660:	e35a0000 	cmp	sl, #0
    5664:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    5668:	e58d2078 	str	r2, [sp, #120]	; 0x78
    566c:	1a00003d 	bne	5768 <ipu_init_channel_buffer+0x253c>
    5670:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    5674:	e1a0100a 	mov	r1, sl
    5678:	e0000397 	mul	r0, r7, r3
    567c:	eaffff2a 	b	532c <ipu_init_channel_buffer+0x2100>
    5680:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5684:	e19a3009 	orrs	r3, sl, r9
    5688:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    568c:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    5690:	e59d107c 	ldr	r1, [sp, #124]	; 0x7c
    5694:	e38228e7 	orr	r2, r2, #15138816	; 0xe70000
    5698:	e3833db3 	orr	r3, r3, #11456	; 0x2cc0
    569c:	e3822903 	orr	r2, r2, #49152	; 0xc000
    56a0:	e3833001 	orr	r3, r3, #1
    56a4:	e3800b06 	orr	r0, r0, #6144	; 0x1800
    56a8:	e3811549 	orr	r1, r1, #306184192	; 0x12400000
    56ac:	e58d2078 	str	r2, [sp, #120]	; 0x78
    56b0:	e58d3080 	str	r3, [sp, #128]	; 0x80
    56b4:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    56b8:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    56bc:	1afff8a3 	bne	3950 <ipu_init_channel_buffer+0x724>
    56c0:	eafff7bb 	b	35b4 <ipu_init_channel_buffer+0x388>
    56c4:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    56c8:	e19a3009 	orrs	r3, sl, r9
    56cc:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    56d0:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    56d4:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    56d8:	e1e02602 	mvn	r2, r2, lsl #12
    56dc:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    56e0:	e3833703 	orr	r3, r3, #786432	; 0xc0000
    56e4:	e1e02622 	mvn	r2, r2, lsr #12
    56e8:	e3811903 	orr	r1, r1, #49152	; 0xc000
    56ec:	e3833e11 	orr	r3, r3, #272	; 0x110
    56f0:	eafffefa 	b	52e0 <ipu_init_channel_buffer+0x20b4>
    56f4:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    56f8:	e19a3009 	orrs	r3, sl, r9
    56fc:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    5700:	e59d307c 	ldr	r3, [sp, #124]	; 0x7c
    5704:	e38118e7 	orr	r1, r1, #15138816	; 0xe70000
    5708:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    570c:	e3822c31 	orr	r2, r2, #12544	; 0x3100
    5710:	e3811903 	orr	r1, r1, #49152	; 0xc000
    5714:	e383346d 	orr	r3, r3, #1828716544	; 0x6d000000
    5718:	e3822004 	orr	r2, r2, #4
    571c:	e383360b 	orr	r3, r3, #11534336	; 0xb00000
    5720:	eafff831 	b	37ec <ipu_init_channel_buffer+0x5c0>
    5724:	e3833741 	orr	r3, r3, #17039360	; 0x1040000
    5728:	e3510000 	cmp	r1, #0
    572c:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    5730:	e58d3078 	str	r3, [sp, #120]	; 0x78
    5734:	1afff885 	bne	3950 <ipu_init_channel_buffer+0x724>
    5738:	eafff79d 	b	35b4 <ipu_init_channel_buffer+0x388>
    573c:	e3822887 	orr	r2, r2, #8847360	; 0x870000
    5740:	e1a01008 	mov	r1, r8
    5744:	e3822903 	orr	r2, r2, #49152	; 0xc000
    5748:	e58d2078 	str	r2, [sp, #120]	; 0x78
    574c:	eafffef6 	b	532c <ipu_init_channel_buffer+0x2100>
    5750:	e3833751 	orr	r3, r3, #21233664	; 0x1440000
    5754:	e3510000 	cmp	r1, #0
    5758:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    575c:	e58d3078 	str	r3, [sp, #120]	; 0x78
    5760:	1afff87a 	bne	3950 <ipu_init_channel_buffer+0x724>
    5764:	eafff792 	b	35b4 <ipu_init_channel_buffer+0x388>
    5768:	e3a01000 	mov	r1, #0
    576c:	eafff855 	b	38c8 <ipu_init_channel_buffer+0x69c>
    5770:	e59d3018 	ldr	r3, [sp, #24]
    5774:	e3001000 	movw	r1, #0
    5778:	e3401000 	movt	r1, #0
    577c:	e2833a01 	add	r3, r3, #4096	; 0x1000
    5780:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    5784:	ebfffffe 	bl	0 <dev_err>
    5788:	e3e00015 	mvn	r0, #21
    578c:	eafffc00 	b	4794 <ipu_init_channel_buffer+0x1568>
    5790:	e3e00015 	mvn	r0, #21
    5794:	eafffbfe 	b	4794 <ipu_init_channel_buffer+0x1568>
    5798:	e59d3018 	ldr	r3, [sp, #24]
    579c:	e3001000 	movw	r1, #0
    57a0:	e3401000 	movt	r1, #0
    57a4:	e2832a01 	add	r2, r3, #4096	; 0x1000
    57a8:	e5920d84 	ldr	r0, [r2, #3460]	; 0xd84
    57ac:	e1a02007 	mov	r2, r7
    57b0:	ebfffffe 	bl	0 <dev_err>
    57b4:	e3e00015 	mvn	r0, #21
    57b8:	eafffbf5 	b	4794 <ipu_init_channel_buffer+0x1568>
    57bc:	e59d3018 	ldr	r3, [sp, #24]
    57c0:	e3001000 	movw	r1, #0
    57c4:	e1a02005 	mov	r2, r5
    57c8:	e3401000 	movt	r1, #0
    57cc:	e2833a01 	add	r3, r3, #4096	; 0x1000
    57d0:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    57d4:	ebfffffe 	bl	0 <dev_err>
    57d8:	e3e00015 	mvn	r0, #21
    57dc:	eafffbec 	b	4794 <ipu_init_channel_buffer+0x1568>

000057e0 <ipu_enable_channel>:
    57e0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    57e4:	e280ad79 	add	sl, r0, #7744	; 0x1e40
    57e8:	e1a07000 	mov	r7, r0
    57ec:	e28aa008 	add	sl, sl, #8
    57f0:	e1a08c41 	asr	r8, r1, #24
    57f4:	e24dd014 	sub	sp, sp, #20
    57f8:	e1a0000a 	mov	r0, sl
    57fc:	e2875a01 	add	r5, r7, #4096	; 0x1000
    5800:	e1a04001 	mov	r4, r1
    5804:	ebfffffe 	bl	0 <mutex_lock>
    5808:	e3a02001 	mov	r2, #1
    580c:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    5810:	e1a02812 	lsl	r2, r2, r8
    5814:	e1120003 	tst	r2, r3
    5818:	e58d2000 	str	r2, [sp]
    581c:	1a0001b2 	bne	5eec <ipu_enable_channel+0x70c>
    5820:	e3003000 	movw	r3, #0
    5824:	e300238a 	movw	r2, #906	; 0x38a
    5828:	e3403000 	movt	r3, #0
    582c:	e1a0b924 	lsr	fp, r4, #18
    5830:	e19320b2 	ldrh	r2, [r3, r2]
    5834:	e204903f 	and	r9, r4, #63	; 0x3f
    5838:	e20b603f 	and	r6, fp, #63	; 0x3f
    583c:	e3120004 	tst	r2, #4
    5840:	0a000006 	beq	5860 <ipu_enable_channel+0x80>
    5844:	e3001000 	movw	r1, #0
    5848:	e2830fde 	add	r0, r3, #888	; 0x378
    584c:	e1a02009 	mov	r2, r9
    5850:	e3401000 	movt	r1, #0
    5854:	e58d3004 	str	r3, [sp, #4]
    5858:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    585c:	e59d3004 	ldr	r3, [sp, #4]
    5860:	e30023a2 	movw	r2, #930	; 0x3a2
    5864:	e19330b2 	ldrh	r3, [r3, r2]
    5868:	e3130004 	tst	r3, #4
    586c:	0a000004 	beq	5884 <ipu_enable_channel+0xa4>
    5870:	e3001000 	movw	r1, #0
    5874:	e1a02006 	mov	r2, r6
    5878:	e3401000 	movt	r1, #0
    587c:	e59f068c 	ldr	r0, [pc, #1676]	; 5f10 <ipu_enable_channel+0x730>
    5880:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    5884:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    5888:	e5933000 	ldr	r3, [r3]
    588c:	f57ff04f 	dsb	sy
    5890:	e3e024f2 	mvn	r2, #-234881024	; 0xf2000000
    5894:	e1540002 	cmp	r4, r2
    5898:	0a00013b 	beq	5d8c <ipu_enable_channel+0x5ac>
    589c:	e354040e 	cmp	r4, #234881024	; 0xe000000
    58a0:	aa00001b 	bge	5914 <ipu_enable_channel+0x134>
    58a4:	e30e2455 	movw	r2, #58453	; 0xe455
    58a8:	e3402530 	movt	r2, #1328	; 0x530
    58ac:	e1540002 	cmp	r4, r2
    58b0:	0a00002d 	beq	596c <ipu_enable_channel+0x18c>
    58b4:	da000142 	ble	5dc4 <ipu_enable_channel+0x5e4>
    58b8:	e30f2fff 	movw	r2, #65535	; 0xffff
    58bc:	e3402773 	movt	r2, #1907	; 0x773
    58c0:	e1540002 	cmp	r4, r2
    58c4:	0a00015d 	beq	5e40 <ipu_enable_channel+0x660>
    58c8:	da000182 	ble	5ed8 <ipu_enable_channel+0x6f8>
    58cc:	e30f2cff 	movw	r2, #64767	; 0xfcff
    58d0:	e340295f 	movt	r2, #2399	; 0x95f
    58d4:	e1540002 	cmp	r4, r2
    58d8:	0a000146 	beq	5df8 <ipu_enable_channel+0x618>
    58dc:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    58e0:	e3402a6f 	movt	r2, #2671	; 0xa6f
    58e4:	e1540002 	cmp	r4, r2
    58e8:	1a000022 	bne	5978 <ipu_enable_channel+0x198>
    58ec:	e5952e20 	ldr	r2, [r5, #3616]	; 0xe20
    58f0:	e3520000 	cmp	r2, #0
    58f4:	c3833020 	orrgt	r3, r3, #32
    58f8:	e5952e1c 	ldr	r2, [r5, #3612]	; 0xe1c
    58fc:	e3520000 	cmp	r2, #0
    5900:	e5952e24 	ldr	r2, [r5, #3620]	; 0xe24
    5904:	c3833c02 	orrgt	r3, r3, #512	; 0x200
    5908:	e3520000 	cmp	r2, #0
    590c:	c3833b01 	orrgt	r3, r3, #1024	; 0x400
    5910:	ea000018 	b	5978 <ipu_enable_channel+0x198>
    5914:	e30f2fc3 	movw	r2, #65475	; 0xffc3
    5918:	e34122ff 	movt	r2, #4863	; 0x12ff
    591c:	e1540002 	cmp	r4, r2
    5920:	0a000159 	beq	5e8c <ipu_enable_channel+0x6ac>
    5924:	da000110 	ble	5d6c <ipu_enable_channel+0x58c>
    5928:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    592c:	e34124ff 	movt	r2, #5375	; 0x14ff
    5930:	e1540002 	cmp	r4, r2
    5934:	0a00000c 	beq	596c <ipu_enable_channel+0x18c>
    5938:	da000161 	ble	5ec4 <ipu_enable_channel+0x6e4>
    593c:	e30e2455 	movw	r2, #58453	; 0xe455
    5940:	e3412624 	movt	r2, #5668	; 0x1624
    5944:	e1540002 	cmp	r4, r2
    5948:	0a000003 	beq	595c <ipu_enable_channel+0x17c>
    594c:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    5950:	e3412927 	movt	r2, #6439	; 0x1927
    5954:	e1540002 	cmp	r4, r2
    5958:	1a000006 	bne	5978 <ipu_enable_channel+0x198>
    595c:	e5952e34 	ldr	r2, [r5, #3636]	; 0xe34
    5960:	e3520000 	cmp	r2, #0
    5964:	c3833a01 	orrgt	r3, r3, #4096	; 0x1000
    5968:	c3833141 	orrgt	r3, r3, #1073741840	; 0x40000010
    596c:	e5952e2c 	ldr	r2, [r5, #3628]	; 0xe2c
    5970:	e3520000 	cmp	r2, #0
    5974:	c3833004 	orrgt	r3, r3, #4
    5978:	e58d3004 	str	r3, [sp, #4]
    597c:	f57ff04e 	dsb	st
    5980:	ebfffffe 	bl	0 <arm_heavy_mb>
    5984:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    5988:	e59d3004 	ldr	r3, [sp, #4]
    598c:	e5823000 	str	r3, [r2]
    5990:	e356003f 	cmp	r6, #63	; 0x3f
    5994:	0a000012 	beq	59e4 <ipu_enable_channel+0x204>
    5998:	e1a032a6 	lsr	r3, r6, #5
    599c:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    59a0:	e2833001 	add	r3, r3, #1
    59a4:	e1a03103 	lsl	r3, r3, #2
    59a8:	e0822003 	add	r2, r2, r3
    59ac:	e58d3008 	str	r3, [sp, #8]
    59b0:	e5922000 	ldr	r2, [r2]
    59b4:	f57ff04f 	dsb	sy
    59b8:	e3a00001 	mov	r0, #1
    59bc:	e20b101f 	and	r1, fp, #31
    59c0:	e1822110 	orr	r2, r2, r0, lsl r1
    59c4:	e58d2004 	str	r2, [sp, #4]
    59c8:	f57ff04e 	dsb	st
    59cc:	ebfffffe 	bl	0 <arm_heavy_mb>
    59d0:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    59d4:	e59d3008 	ldr	r3, [sp, #8]
    59d8:	e59d2004 	ldr	r2, [sp, #4]
    59dc:	e0813003 	add	r3, r1, r3
    59e0:	e5832000 	str	r2, [r3]
    59e4:	e359003f 	cmp	r9, #63	; 0x3f
    59e8:	0a000012 	beq	5a38 <ipu_enable_channel+0x258>
    59ec:	e1a032a9 	lsr	r3, r9, #5
    59f0:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    59f4:	e2833001 	add	r3, r3, #1
    59f8:	e1a03103 	lsl	r3, r3, #2
    59fc:	e0822003 	add	r2, r2, r3
    5a00:	e58d3008 	str	r3, [sp, #8]
    5a04:	e5922000 	ldr	r2, [r2]
    5a08:	f57ff04f 	dsb	sy
    5a0c:	e3a00001 	mov	r0, #1
    5a10:	e204101f 	and	r1, r4, #31
    5a14:	e1822110 	orr	r2, r2, r0, lsl r1
    5a18:	e58d2004 	str	r2, [sp, #4]
    5a1c:	f57ff04e 	dsb	st
    5a20:	ebfffffe 	bl	0 <arm_heavy_mb>
    5a24:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5a28:	e59d3008 	ldr	r3, [sp, #8]
    5a2c:	e59d2004 	ldr	r2, [sp, #4]
    5a30:	e0813003 	add	r3, r1, r3
    5a34:	e5832000 	str	r2, [r3]
    5a38:	e0878008 	add	r8, r7, r8
    5a3c:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    5a40:	e7d83003 	ldrb	r3, [r8, r3]
    5a44:	e3530000 	cmp	r3, #0
    5a48:	0a000023 	beq	5adc <ipu_enable_channel+0x2fc>
    5a4c:	e30f3496 	movw	r3, #62614	; 0xf496
    5a50:	e30e1455 	movw	r1, #58453	; 0xe455
    5a54:	e340362c 	movt	r3, #1580	; 0x62c
    5a58:	e3401530 	movt	r1, #1328	; 0x530
    5a5c:	e1540001 	cmp	r4, r1
    5a60:	11540003 	cmpne	r4, r3
    5a64:	e30e2455 	movw	r2, #58453	; 0xe455
    5a68:	03a03001 	moveq	r3, #1
    5a6c:	13a03000 	movne	r3, #0
    5a70:	e3412624 	movt	r2, #5668	; 0x1624
    5a74:	e1540002 	cmp	r4, r2
    5a78:	03833001 	orreq	r3, r3, #1
    5a7c:	e3530000 	cmp	r3, #0
    5a80:	0a000015 	beq	5adc <ipu_enable_channel+0x2fc>
    5a84:	e1a01624 	lsr	r1, r4, #12
    5a88:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5a8c:	e201003f 	and	r0, r1, #63	; 0x3f
    5a90:	e1a032a0 	lsr	r3, r0, #5
    5a94:	e2833001 	add	r3, r3, #1
    5a98:	e1a03103 	lsl	r3, r3, #2
    5a9c:	e0822003 	add	r2, r2, r3
    5aa0:	e5922000 	ldr	r2, [r2]
    5aa4:	f57ff04f 	dsb	sy
    5aa8:	e350003f 	cmp	r0, #63	; 0x3f
    5aac:	e58d3004 	str	r3, [sp, #4]
    5ab0:	1201101f 	andne	r1, r1, #31
    5ab4:	13a00001 	movne	r0, #1
    5ab8:	11822110 	orrne	r2, r2, r0, lsl r1
    5abc:	e58d2008 	str	r2, [sp, #8]
    5ac0:	f57ff04e 	dsb	st
    5ac4:	ebfffffe 	bl	0 <arm_heavy_mb>
    5ac8:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5acc:	e59d3004 	ldr	r3, [sp, #4]
    5ad0:	e59d2008 	ldr	r2, [sp, #8]
    5ad4:	e0813003 	add	r3, r1, r3
    5ad8:	e5832000 	str	r2, [r3]
    5adc:	e3012dbe 	movw	r2, #7614	; 0x1dbe
    5ae0:	e30f3cff 	movw	r3, #64767	; 0xfcff
    5ae4:	e7d81002 	ldrb	r1, [r8, r2]
    5ae8:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    5aec:	e340395f 	movt	r3, #2399	; 0x95f
    5af0:	e3402a6f 	movt	r2, #2671	; 0xa6f
    5af4:	e0443003 	sub	r3, r4, r3
    5af8:	e0448002 	sub	r8, r4, r2
    5afc:	e3510000 	cmp	r1, #0
    5b00:	e16f3f13 	clz	r3, r3
    5b04:	e16f8f18 	clz	r8, r8
    5b08:	e1a032a3 	lsr	r3, r3, #5
    5b0c:	e1a082a8 	lsr	r8, r8, #5
    5b10:	0a00002c 	beq	5bc8 <ipu_enable_channel+0x3e8>
    5b14:	e30f1496 	movw	r1, #62614	; 0xf496
    5b18:	e30e2455 	movw	r2, #58453	; 0xe455
    5b1c:	e340162c 	movt	r1, #1580	; 0x62c
    5b20:	e3402530 	movt	r2, #1328	; 0x530
    5b24:	e1540002 	cmp	r4, r2
    5b28:	11540001 	cmpne	r4, r1
    5b2c:	1a00006d 	bne	5ce8 <ipu_enable_channel+0x508>
    5b30:	e1a00324 	lsr	r0, r4, #6
    5b34:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5b38:	e200c03f 	and	ip, r0, #63	; 0x3f
    5b3c:	e1a022ac 	lsr	r2, ip, #5
    5b40:	e2822001 	add	r2, r2, #1
    5b44:	e1a02102 	lsl	r2, r2, #2
    5b48:	e0811002 	add	r1, r1, r2
    5b4c:	e5911000 	ldr	r1, [r1]
    5b50:	f57ff04f 	dsb	sy
    5b54:	e35c003f 	cmp	ip, #63	; 0x3f
    5b58:	e1cd20f8 	strd	r2, [sp, #8]
    5b5c:	1200001f 	andne	r0, r0, #31
    5b60:	13a0c001 	movne	ip, #1
    5b64:	1181101c 	orrne	r1, r1, ip, lsl r0
    5b68:	e58d1004 	str	r1, [sp, #4]
    5b6c:	f57ff04e 	dsb	st
    5b70:	ebfffffe 	bl	0 <arm_heavy_mb>
    5b74:	e5950d4c 	ldr	r0, [r5, #3404]	; 0xd4c
    5b78:	e59d2008 	ldr	r2, [sp, #8]
    5b7c:	e59d1004 	ldr	r1, [sp, #4]
    5b80:	e0802002 	add	r2, r0, r2
    5b84:	e5821000 	str	r1, [r2]
    5b88:	e1a02624 	lsr	r2, r4, #12
    5b8c:	e590100c 	ldr	r1, [r0, #12]
    5b90:	f57ff04f 	dsb	sy
    5b94:	e202003f 	and	r0, r2, #63	; 0x3f
    5b98:	e59d300c 	ldr	r3, [sp, #12]
    5b9c:	e350003f 	cmp	r0, #63	; 0x3f
    5ba0:	1202201f 	andne	r2, r2, #31
    5ba4:	13a00001 	movne	r0, #1
    5ba8:	11811210 	orrne	r1, r1, r0, lsl r2
    5bac:	e98d000a 	stmib	sp, {r1, r3}
    5bb0:	f57ff04e 	dsb	st
    5bb4:	ebfffffe 	bl	0 <arm_heavy_mb>
    5bb8:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5bbc:	e59d1004 	ldr	r1, [sp, #4]
    5bc0:	e582100c 	str	r1, [r2, #12]
    5bc4:	e59d3008 	ldr	r3, [sp, #8]
    5bc8:	e1883003 	orr	r3, r8, r3
    5bcc:	e30f2fff 	movw	r2, #65535	; 0xffff
    5bd0:	e3402773 	movt	r2, #1907	; 0x773
    5bd4:	e1540002 	cmp	r4, r2
    5bd8:	03833001 	orreq	r3, r3, #1
    5bdc:	e3530000 	cmp	r3, #0
    5be0:	0a000014 	beq	5c38 <ipu_enable_channel+0x458>
    5be4:	e1a032a6 	lsr	r3, r6, #5
    5be8:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5bec:	e2833007 	add	r3, r3, #7
    5bf0:	e1a08103 	lsl	r8, r3, #2
    5bf4:	e0823008 	add	r3, r2, r8
    5bf8:	e5932000 	ldr	r2, [r3]
    5bfc:	f57ff04f 	dsb	sy
    5c00:	e356003f 	cmp	r6, #63	; 0x3f
    5c04:	120bb01f 	andne	fp, fp, #31
    5c08:	13a03001 	movne	r3, #1
    5c0c:	11822b13 	orrne	r2, r2, r3, lsl fp
    5c10:	e58d2004 	str	r2, [sp, #4]
    5c14:	f57ff04e 	dsb	st
    5c18:	ebfffffe 	bl	0 <arm_heavy_mb>
    5c1c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5c20:	e59d2004 	ldr	r2, [sp, #4]
    5c24:	e0833008 	add	r3, r3, r8
    5c28:	e5832000 	str	r2, [r3]
    5c2c:	e1a01004 	mov	r1, r4
    5c30:	e1a00007 	mov	r0, r7
    5c34:	ebfffffe 	bl	0 <_ipu_dp_dc_enable>
    5c38:	e246300b 	sub	r3, r6, #11
    5c3c:	e2462011 	sub	r2, r6, #17
    5c40:	e353000b 	cmp	r3, #11
    5c44:	93a03001 	movls	r3, #1
    5c48:	83a03000 	movhi	r3, #0
    5c4c:	e3520001 	cmp	r2, #1
    5c50:	93a03000 	movls	r3, #0
    5c54:	e3530000 	cmp	r3, #0
    5c58:	1a00000f 	bne	5c9c <ipu_enable_channel+0x4bc>
    5c5c:	e249300b 	sub	r3, r9, #11
    5c60:	e2492011 	sub	r2, r9, #17
    5c64:	e353000b 	cmp	r3, #11
    5c68:	93a03001 	movls	r3, #1
    5c6c:	83a03000 	movhi	r3, #0
    5c70:	e3520001 	cmp	r2, #1
    5c74:	93a03000 	movls	r3, #0
    5c78:	e3530000 	cmp	r3, #0
    5c7c:	1a000006 	bne	5c9c <ipu_enable_channel+0x4bc>
    5c80:	e246602d 	sub	r6, r6, #45	; 0x2d
    5c84:	e3560005 	cmp	r6, #5
    5c88:	9a000003 	bls	5c9c <ipu_enable_channel+0x4bc>
    5c8c:	e249302d 	sub	r3, r9, #45	; 0x2d
    5c90:	e3590005 	cmp	r9, #5
    5c94:	13530005 	cmpne	r3, #5
    5c98:	8a000002 	bhi	5ca8 <ipu_enable_channel+0x4c8>
    5c9c:	e1a01004 	mov	r1, r4
    5ca0:	e1a00007 	mov	r0, r7
    5ca4:	ebfffffe 	bl	0 <_ipu_ic_enable_task>
    5ca8:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    5cac:	e59d2000 	ldr	r2, [sp]
    5cb0:	e1833002 	orr	r3, r3, r2
    5cb4:	e5853e18 	str	r3, [r5, #3608]	; 0xe18
    5cb8:	e597403c 	ldr	r4, [r7, #60]	; 0x3c
    5cbc:	e3540000 	cmp	r4, #0
    5cc0:	0a000003 	beq	5cd4 <ipu_enable_channel+0x4f4>
    5cc4:	e1a00004 	mov	r0, r4
    5cc8:	ebfffffe 	bl	0 <clk_prepare>
    5ccc:	e3500000 	cmp	r0, #0
    5cd0:	0a000053 	beq	5e24 <ipu_enable_channel+0x644>
    5cd4:	e1a0000a 	mov	r0, sl
    5cd8:	ebfffffe 	bl	0 <mutex_unlock>
    5cdc:	e3a00000 	mov	r0, #0
    5ce0:	e28dd014 	add	sp, sp, #20
    5ce4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5ce8:	e1983003 	orrs	r3, r8, r3
    5cec:	0affffb6 	beq	5bcc <ipu_enable_channel+0x3ec>
    5cf0:	e1a02324 	lsr	r2, r4, #6
    5cf4:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5cf8:	e202103f 	and	r1, r2, #63	; 0x3f
    5cfc:	e1a082a1 	lsr	r8, r1, #5
    5d00:	e2888001 	add	r8, r8, #1
    5d04:	e1a08108 	lsl	r8, r8, #2
    5d08:	e0833008 	add	r3, r3, r8
    5d0c:	e5933000 	ldr	r3, [r3]
    5d10:	f57ff04f 	dsb	sy
    5d14:	e351003f 	cmp	r1, #63	; 0x3f
    5d18:	1202201f 	andne	r2, r2, #31
    5d1c:	13a01001 	movne	r1, #1
    5d20:	11833211 	orrne	r3, r3, r1, lsl r2
    5d24:	e58d3004 	str	r3, [sp, #4]
    5d28:	f57ff04e 	dsb	st
    5d2c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5d30:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5d34:	e59d3004 	ldr	r3, [sp, #4]
    5d38:	e0828008 	add	r8, r2, r8
    5d3c:	e5883000 	str	r3, [r8]
    5d40:	e592800c 	ldr	r8, [r2, #12]
    5d44:	f57ff04f 	dsb	sy
    5d48:	e356003f 	cmp	r6, #63	; 0x3f
    5d4c:	120b301f 	andne	r3, fp, #31
    5d50:	13a02001 	movne	r2, #1
    5d54:	11888312 	orrne	r8, r8, r2, lsl r3
    5d58:	f57ff04e 	dsb	st
    5d5c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5d60:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5d64:	e583800c 	str	r8, [r3, #12]
    5d68:	eaffff9d 	b	5be4 <ipu_enable_channel+0x404>
    5d6c:	e30f2fc0 	movw	r2, #65472	; 0xffc0
    5d70:	e3402fff 	movt	r2, #4095	; 0xfff
    5d74:	e1540002 	cmp	r4, r2
    5d78:	0a000043 	beq	5e8c <ipu_enable_channel+0x6ac>
    5d7c:	ca00003a 	bgt	5e6c <ipu_enable_channel+0x68c>
    5d80:	e3e024f1 	mvn	r2, #-251658240	; 0xf1000000
    5d84:	e1540002 	cmp	r4, r2
    5d88:	1afffefa 	bne	5978 <ipu_enable_channel+0x198>
    5d8c:	e5d51d9d 	ldrb	r1, [r5, #3485]	; 0xd9d
    5d90:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5d94:	e282200e 	add	r2, r2, #14
    5d98:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5d9c:	e3520000 	cmp	r2, #0
    5da0:	da000003 	ble	5db4 <ipu_enable_channel+0x5d4>
    5da4:	e3510000 	cmp	r1, #0
    5da8:	03a02040 	moveq	r2, #64	; 0x40
    5dac:	13a02080 	movne	r2, #128	; 0x80
    5db0:	e1833002 	orr	r3, r3, r2
    5db4:	e5952e1c 	ldr	r2, [r5, #3612]	; 0xe1c
    5db8:	e3520000 	cmp	r2, #0
    5dbc:	c3833c02 	orrgt	r3, r3, #512	; 0x200
    5dc0:	eafffeec 	b	5978 <ipu_enable_channel+0x198>
    5dc4:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    5dc8:	e34022bb 	movt	r2, #699	; 0x2bb
    5dcc:	e1540002 	cmp	r4, r2
    5dd0:	0a000004 	beq	5de8 <ipu_enable_channel+0x608>
    5dd4:	da000030 	ble	5e9c <ipu_enable_channel+0x6bc>
    5dd8:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    5ddc:	e34023bf 	movt	r2, #959	; 0x3bf
    5de0:	e1540002 	cmp	r4, r2
    5de4:	1a000031 	bne	5eb0 <ipu_enable_channel+0x6d0>
    5de8:	e5952e30 	ldr	r2, [r5, #3632]	; 0xe30
    5dec:	e3520000 	cmp	r2, #0
    5df0:	c3833008 	orrgt	r3, r3, #8
    5df4:	eafffedc 	b	596c <ipu_enable_channel+0x18c>
    5df8:	e5d51d99 	ldrb	r1, [r5, #3481]	; 0xd99
    5dfc:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5e00:	e282200e 	add	r2, r2, #14
    5e04:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5e08:	e3520000 	cmp	r2, #0
    5e0c:	dafffeb6 	ble	58ec <ipu_enable_channel+0x10c>
    5e10:	e3510000 	cmp	r1, #0
    5e14:	03a02040 	moveq	r2, #64	; 0x40
    5e18:	13a02080 	movne	r2, #128	; 0x80
    5e1c:	e1833002 	orr	r3, r3, r2
    5e20:	eafffeb1 	b	58ec <ipu_enable_channel+0x10c>
    5e24:	e1a00004 	mov	r0, r4
    5e28:	ebfffffe 	bl	0 <clk_enable>
    5e2c:	e3500000 	cmp	r0, #0
    5e30:	0affffa7 	beq	5cd4 <ipu_enable_channel+0x4f4>
    5e34:	e1a00004 	mov	r0, r4
    5e38:	ebfffffe 	bl	0 <clk_unprepare>
    5e3c:	eaffffa4 	b	5cd4 <ipu_enable_channel+0x4f4>
    5e40:	e5d51d95 	ldrb	r1, [r5, #3477]	; 0xd95
    5e44:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5e48:	e282200e 	add	r2, r2, #14
    5e4c:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5e50:	e3520000 	cmp	r2, #0
    5e54:	dafffea7 	ble	58f8 <ipu_enable_channel+0x118>
    5e58:	e3510000 	cmp	r1, #0
    5e5c:	03a02040 	moveq	r2, #64	; 0x40
    5e60:	13a02080 	movne	r2, #128	; 0x80
    5e64:	e1833002 	orr	r3, r3, r2
    5e68:	eafffea2 	b	58f8 <ipu_enable_channel+0x118>
    5e6c:	e30f2fc1 	movw	r2, #65473	; 0xffc1
    5e70:	e34120ff 	movt	r2, #4351	; 0x10ff
    5e74:	e1540002 	cmp	r4, r2
    5e78:	0a000003 	beq	5e8c <ipu_enable_channel+0x6ac>
    5e7c:	e30f2fc2 	movw	r2, #65474	; 0xffc2
    5e80:	e34121ff 	movt	r2, #4607	; 0x11ff
    5e84:	e1540002 	cmp	r4, r2
    5e88:	1afffeba 	bne	5978 <ipu_enable_channel+0x198>
    5e8c:	e5952e28 	ldr	r2, [r5, #3624]	; 0xe28
    5e90:	e3520000 	cmp	r2, #0
    5e94:	c3833c01 	orrgt	r3, r3, #256	; 0x100
    5e98:	eafffeb6 	b	5978 <ipu_enable_channel+0x198>
    5e9c:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    5ea0:	e34021b7 	movt	r2, #439	; 0x1b7
    5ea4:	e1540002 	cmp	r4, r2
    5ea8:	0affffce 	beq	5de8 <ipu_enable_channel+0x608>
    5eac:	eafffeb1 	b	5978 <ipu_enable_channel+0x198>
    5eb0:	e30e2454 	movw	r2, #58452	; 0xe454
    5eb4:	e3402430 	movt	r2, #1072	; 0x430
    5eb8:	e1540002 	cmp	r4, r2
    5ebc:	0afffeaa 	beq	596c <ipu_enable_channel+0x18c>
    5ec0:	eafffeac 	b	5978 <ipu_enable_channel+0x198>
    5ec4:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    5ec8:	e34123ff 	movt	r2, #5119	; 0x13ff
    5ecc:	e1540002 	cmp	r4, r2
    5ed0:	0afffea5 	beq	596c <ipu_enable_channel+0x18c>
    5ed4:	eafffea7 	b	5978 <ipu_enable_channel+0x198>
    5ed8:	e30f2496 	movw	r2, #62614	; 0xf496
    5edc:	e340262c 	movt	r2, #1580	; 0x62c
    5ee0:	e1540002 	cmp	r4, r2
    5ee4:	0afffea0 	beq	596c <ipu_enable_channel+0x18c>
    5ee8:	eafffea2 	b	5978 <ipu_enable_channel+0x198>
    5eec:	e3001000 	movw	r1, #0
    5ef0:	e1a02008 	mov	r2, r8
    5ef4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    5ef8:	e3401000 	movt	r1, #0
    5efc:	ebfffffe 	bl	0 <dev_err>
    5f00:	e1a0000a 	mov	r0, sl
    5f04:	ebfffffe 	bl	0 <mutex_unlock>
    5f08:	e3e0000c 	mvn	r0, #12
    5f0c:	eaffff73 	b	5ce0 <ipu_enable_channel+0x500>
    5f10:	00000390 	muleq	r0, r0, r3

00005f14 <ipu_sync_irq_handler>:
    5f14:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5f18:	e2813d79 	add	r3, r1, #7744	; 0x1e40
    5f1c:	e59fe29c 	ldr	lr, [pc, #668]	; 61c0 <ipu_sync_irq_handler+0x2ac>
    5f20:	e24dd044 	sub	sp, sp, #68	; 0x44
    5f24:	e283301c 	add	r3, r3, #28
    5f28:	e1a0a001 	mov	sl, r1
    5f2c:	e1a04003 	mov	r4, r3
    5f30:	e58d3014 	str	r3, [sp, #20]
    5f34:	e28dc018 	add	ip, sp, #24
    5f38:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    5f3c:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    5f40:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    5f44:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    5f48:	e89e0003 	ldm	lr, {r0, r1}
    5f4c:	e88c0003 	stm	ip, {r0, r1}
    5f50:	e1a00004 	mov	r0, r4
    5f54:	ebfffffe 	bl	0 <_raw_spin_lock>
    5f58:	e59d3018 	ldr	r3, [sp, #24]
    5f5c:	e3530000 	cmp	r3, #0
    5f60:	0a000073 	beq	6134 <ipu_sync_irq_handler+0x220>
    5f64:	e300b000 	movw	fp, #0
    5f68:	e28d2018 	add	r2, sp, #24
    5f6c:	e340b000 	movt	fp, #0
    5f70:	e3a09000 	mov	r9, #0
    5f74:	e58d2008 	str	r2, [sp, #8]
    5f78:	e28a2a01 	add	r2, sl, #4096	; 0x1000
    5f7c:	e58d9000 	str	r9, [sp]
    5f80:	e58d2010 	str	r2, [sp, #16]
    5f84:	e59a2004 	ldr	r2, [sl, #4]
    5f88:	e59d1010 	ldr	r1, [sp, #16]
    5f8c:	e3520000 	cmp	r2, #0
    5f90:	1283307f 	addne	r3, r3, #127	; 0x7f
    5f94:	02833039 	addeq	r3, r3, #57	; 0x39
    5f98:	e5912d48 	ldr	r2, [r1, #3400]	; 0xd48
    5f9c:	e1a03103 	lsl	r3, r3, #2
    5fa0:	e0823003 	add	r3, r2, r3
    5fa4:	e5936000 	ldr	r6, [r3]
    5fa8:	f57ff04f 	dsb	sy
    5fac:	e59d0008 	ldr	r0, [sp, #8]
    5fb0:	e5913d48 	ldr	r3, [r1, #3400]	; 0xd48
    5fb4:	e5902000 	ldr	r2, [r0]
    5fb8:	e282200e 	add	r2, r2, #14
    5fbc:	e0833102 	add	r3, r3, r2, lsl #2
    5fc0:	e5933000 	ldr	r3, [r3]
    5fc4:	e1a02003 	mov	r2, r3
    5fc8:	e58d300c 	str	r3, [sp, #12]
    5fcc:	f57ff04f 	dsb	sy
    5fd0:	e59a3004 	ldr	r3, [sl, #4]
    5fd4:	e0066002 	and	r6, r6, r2
    5fd8:	e3530000 	cmp	r3, #0
    5fdc:	059d3008 	ldreq	r3, [sp, #8]
    5fe0:	15904000 	ldrne	r4, [r0]
    5fe4:	05934000 	ldreq	r4, [r3]
    5fe8:	1284407f 	addne	r4, r4, #127	; 0x7f
    5fec:	02844039 	addeq	r4, r4, #57	; 0x39
    5ff0:	e1a04104 	lsl	r4, r4, #2
    5ff4:	f57ff04e 	dsb	st
    5ff8:	ebfffffe 	bl	0 <arm_heavy_mb>
    5ffc:	e59d3010 	ldr	r3, [sp, #16]
    6000:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    6004:	e0834004 	add	r4, r3, r4
    6008:	e5846000 	str	r6, [r4]
    600c:	e2664000 	rsb	r4, r6, #0
    6010:	e0044006 	and	r4, r4, r6
    6014:	e16f4f14 	clz	r4, r4
    6018:	e3540020 	cmp	r4, #32
    601c:	0a000054 	beq	6174 <ipu_sync_irq_handler+0x260>
    6020:	e59d3008 	ldr	r3, [sp, #8]
    6024:	e264401f 	rsb	r4, r4, #31
    6028:	e3a07001 	mov	r7, #1
    602c:	e1e07417 	mvn	r7, r7, lsl r4
    6030:	e5938000 	ldr	r8, [r3]
    6034:	e0066007 	and	r6, r6, r7
    6038:	e2483001 	sub	r3, r8, #1
    603c:	e0844283 	add	r4, r4, r3, lsl #5
    6040:	e1a05204 	lsl	r5, r4, #4
    6044:	e08a3005 	add	r3, sl, r5
    6048:	e5930048 	ldr	r0, [r3, #72]	; 0x48
    604c:	e58d3004 	str	r3, [sp, #4]
    6050:	e3500000 	cmp	r0, #0
    6054:	0a000041 	beq	6160 <ipu_sync_irq_handler+0x24c>
    6058:	e59f3164 	ldr	r3, [pc, #356]	; 61c4 <ipu_sync_irq_handler+0x2b0>
    605c:	e1d320b0 	ldrh	r2, [r3]
    6060:	e3120004 	tst	r2, #4
    6064:	0a000005 	beq	6080 <ipu_sync_irq_handler+0x16c>
    6068:	e2430012 	sub	r0, r3, #18
    606c:	e59d2000 	ldr	r2, [sp]
    6070:	e1a0100b 	mov	r1, fp
    6074:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    6078:	e59d3004 	ldr	r3, [sp, #4]
    607c:	e5930048 	ldr	r0, [r3, #72]	; 0x48
    6080:	ebfffffe 	bl	0 <temp_ldr_set_callback_addr>
    6084:	e59f013c 	ldr	r0, [pc, #316]	; 61c8 <ipu_sync_irq_handler+0x2b4>
    6088:	e1d030b0 	ldrh	r3, [r0]
    608c:	e3130004 	tst	r3, #4
    6090:	0a000003 	beq	60a4 <ipu_sync_irq_handler+0x190>
    6094:	e3001000 	movw	r1, #0
    6098:	e2400012 	sub	r0, r0, #18
    609c:	e3401000 	movt	r1, #0
    60a0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    60a4:	e08a5005 	add	r5, sl, r5
    60a8:	e1a00004 	mov	r0, r4
    60ac:	e5951050 	ldr	r1, [r5, #80]	; 0x50
    60b0:	ebfffffe 	bl	0 <ldr_fiq_callback>
    60b4:	e59f3110 	ldr	r3, [pc, #272]	; 61cc <ipu_sync_irq_handler+0x2b8>
    60b8:	e1899000 	orr	r9, r9, r0
    60bc:	e1d320b0 	ldrh	r2, [r3]
    60c0:	e3120004 	tst	r2, #4
    60c4:	0a000004 	beq	60dc <ipu_sync_irq_handler+0x1c8>
    60c8:	e3001000 	movw	r1, #0
    60cc:	e2430012 	sub	r0, r3, #18
    60d0:	e3401000 	movt	r1, #0
    60d4:	e1a02009 	mov	r2, r9
    60d8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    60dc:	e59f00ec 	ldr	r0, [pc, #236]	; 61d0 <ipu_sync_irq_handler+0x2bc>
    60e0:	e1d030b0 	ldrh	r3, [r0]
    60e4:	e3130004 	tst	r3, #4
    60e8:	0a000003 	beq	60fc <ipu_sync_irq_handler+0x1e8>
    60ec:	e2400012 	sub	r0, r0, #18
    60f0:	e59d2000 	ldr	r2, [sp]
    60f4:	e1a0100b 	mov	r1, fp
    60f8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    60fc:	e5953054 	ldr	r3, [r5, #84]	; 0x54
    6100:	e3130001 	tst	r3, #1
    6104:	0affffc0 	beq	600c <ipu_sync_irq_handler+0xf8>
    6108:	e59d400c 	ldr	r4, [sp, #12]
    610c:	e0044007 	and	r4, r4, r7
    6110:	e58d400c 	str	r4, [sp, #12]
    6114:	f57ff04e 	dsb	st
    6118:	ebfffffe 	bl	0 <arm_heavy_mb>
    611c:	e59d3010 	ldr	r3, [sp, #16]
    6120:	e288800e 	add	r8, r8, #14
    6124:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    6128:	e0838108 	add	r8, r3, r8, lsl #2
    612c:	e5884000 	str	r4, [r8]
    6130:	eaffffb5 	b	600c <ipu_sync_irq_handler+0xf8>
    6134:	e3004000 	movw	r4, #0
    6138:	e1a09003 	mov	r9, r3
    613c:	e3404000 	movt	r4, #0
    6140:	e3003432 	movw	r3, #1074	; 0x432
    6144:	e19430b3 	ldrh	r3, [r4, r3]
    6148:	e3130004 	tst	r3, #4
    614c:	0a000003 	beq	6160 <ipu_sync_irq_handler+0x24c>
    6150:	e3001000 	movw	r1, #0
    6154:	e59f0078 	ldr	r0, [pc, #120]	; 61d4 <ipu_sync_irq_handler+0x2c0>
    6158:	e3401000 	movt	r1, #0
    615c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    6160:	e59d0014 	ldr	r0, [sp, #20]
    6164:	ebfffffe 	bl	0 <_raw_spin_unlock>
    6168:	e1a00009 	mov	r0, r9
    616c:	e28dd044 	add	sp, sp, #68	; 0x44
    6170:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    6174:	e59f305c 	ldr	r3, [pc, #92]	; 61d8 <ipu_sync_irq_handler+0x2c4>
    6178:	e3004000 	movw	r4, #0
    617c:	e3404000 	movt	r4, #0
    6180:	e1d330b0 	ldrh	r3, [r3]
    6184:	e3130004 	tst	r3, #4
    6188:	0a000003 	beq	619c <ipu_sync_irq_handler+0x288>
    618c:	e59d2000 	ldr	r2, [sp]
    6190:	e1a0100b 	mov	r1, fp
    6194:	e59f0040 	ldr	r0, [pc, #64]	; 61dc <ipu_sync_irq_handler+0x2c8>
    6198:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    619c:	e59d2008 	ldr	r2, [sp, #8]
    61a0:	e5b23004 	ldr	r3, [r2, #4]!
    61a4:	e58d2008 	str	r2, [sp, #8]
    61a8:	e3530000 	cmp	r3, #0
    61ac:	e59d2000 	ldr	r2, [sp]
    61b0:	e2822001 	add	r2, r2, #1
    61b4:	e58d2000 	str	r2, [sp]
    61b8:	1affff71 	bne	5f84 <ipu_sync_irq_handler+0x70>
    61bc:	eaffffdf 	b	6140 <ipu_sync_irq_handler+0x22c>
    61c0:	000001c4 	andeq	r0, r0, r4, asr #3
    61c4:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
    61c8:	000003d2 	ldrdeq	r0, [r0], -r2
    61cc:	000003ea 	andeq	r0, r0, sl, ror #7
    61d0:	00000402 	andeq	r0, r0, r2, lsl #8
    61d4:	00000420 	andeq	r0, r0, r0, lsr #8
    61d8:	0000041a 	andeq	r0, r0, sl, lsl r4
    61dc:	00000408 	andeq	r0, r0, r8, lsl #8

000061e0 <_ipu_get>:
    61e0:	e92d4010 	push	{r4, lr}
    61e4:	e590000c 	ldr	r0, [r0, #12]
    61e8:	ebfffffe 	bl	0 <clk_enable>
    61ec:	e3500000 	cmp	r0, #0
    61f0:	a8bd8010 	popge	{r4, pc}
    61f4:	e7f001f2 	udf	#18

000061f8 <ipu_init_channel>:
    61f8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    61fc:	e3009000 	movw	r9, #0
    6200:	e300344a 	movw	r3, #1098	; 0x44a
    6204:	e3409000 	movt	r9, #0
    6208:	e2804a01 	add	r4, r0, #4096	; 0x1000
    620c:	e1a08000 	mov	r8, r0
    6210:	e19930b3 	ldrh	r3, [r9, r3]
    6214:	e24dd00c 	sub	sp, sp, #12
    6218:	e1a05001 	mov	r5, r1
    621c:	e1a0b002 	mov	fp, r2
    6220:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6224:	e1a0ac41 	asr	sl, r1, #24
    6228:	e3130004 	tst	r3, #4
    622c:	0a000006 	beq	624c <ipu_init_channel+0x54>
    6230:	e3002000 	movw	r2, #0
    6234:	e1a01000 	mov	r1, r0
    6238:	e3402000 	movt	r2, #0
    623c:	e59f0a5c 	ldr	r0, [pc, #2652]	; 6ca0 <ipu_init_channel+0xaa8>
    6240:	e1a0300a 	mov	r3, sl
    6244:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    6248:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    624c:	e3a01004 	mov	r1, #4
    6250:	ebfffffe 	bl	0 <__pm_runtime_resume>
    6254:	e2507000 	subs	r7, r0, #0
    6258:	ba000288 	blt	6c80 <ipu_init_channel+0xa88>
    625c:	e2886d79 	add	r6, r8, #7744	; 0x1e40
    6260:	e1a00008 	mov	r0, r8
    6264:	e2866008 	add	r6, r6, #8
    6268:	ebfffffe 	bl	61e0 <_ipu_get>
    626c:	e1a00006 	mov	r0, r6
    6270:	ebfffffe 	bl	0 <mutex_lock>
    6274:	f57ff04e 	dsb	st
    6278:	ebfffffe 	bl	0 <arm_heavy_mb>
    627c:	e3e07000 	mvn	r7, #0
    6280:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6284:	e583704c 	str	r7, [r3, #76]	; 0x4c
    6288:	f57ff04e 	dsb	st
    628c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6290:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6294:	e5837050 	str	r7, [r3, #80]	; 0x50
    6298:	f57ff04e 	dsb	st
    629c:	ebfffffe 	bl	0 <arm_heavy_mb>
    62a0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    62a4:	e583705c 	str	r7, [r3, #92]	; 0x5c
    62a8:	f57ff04e 	dsb	st
    62ac:	ebfffffe 	bl	0 <arm_heavy_mb>
    62b0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    62b4:	e5837060 	str	r7, [r3, #96]	; 0x60
    62b8:	e3a07001 	mov	r7, #1
    62bc:	e5942e14 	ldr	r2, [r4, #3604]	; 0xe14
    62c0:	e1a07a17 	lsl	r7, r7, sl
    62c4:	e1170002 	tst	r7, r2
    62c8:	1a000084 	bne	64e0 <ipu_init_channel+0x2e8>
    62cc:	e593a000 	ldr	sl, [r3]
    62d0:	f57ff04f 	dsb	sy
    62d4:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    62d8:	e3403fff 	movt	r3, #4095	; 0xfff
    62dc:	e1550003 	cmp	r5, r3
    62e0:	0a000194 	beq	6938 <ipu_init_channel+0x740>
    62e4:	ca000039 	bgt	63d0 <ipu_init_channel+0x1d8>
    62e8:	e30f3496 	movw	r3, #62614	; 0xf496
    62ec:	e340362c 	movt	r3, #1580	; 0x62c
    62f0:	e1550003 	cmp	r5, r3
    62f4:	0a0001b7 	beq	69d8 <ipu_init_channel+0x7e0>
    62f8:	da000011 	ble	6344 <ipu_init_channel+0x14c>
    62fc:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    6300:	e3403a6f 	movt	r3, #2671	; 0xa6f
    6304:	e1550003 	cmp	r5, r3
    6308:	0a0001d0 	beq	6a50 <ipu_init_channel+0x858>
    630c:	ca0000af 	bgt	65d0 <ipu_init_channel+0x3d8>
    6310:	e30f3fff 	movw	r3, #65535	; 0xffff
    6314:	e3403773 	movt	r3, #1907	; 0x773
    6318:	e1550003 	cmp	r5, r3
    631c:	0a0001dd 	beq	6a98 <ipu_init_channel+0x8a0>
    6320:	e30f3cff 	movw	r3, #64767	; 0xfcff
    6324:	e340395f 	movt	r3, #2399	; 0x95f
    6328:	e1550003 	cmp	r5, r3
    632c:	1a000135 	bne	6808 <ipu_init_channel+0x610>
    6330:	e59b3000 	ldr	r3, [fp]
    6334:	e3530001 	cmp	r3, #1
    6338:	9a000203 	bls	6b4c <ipu_init_channel+0x954>
    633c:	e3e07015 	mvn	r7, #21
    6340:	ea00001d 	b	63bc <ipu_init_channel+0x1c4>
    6344:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    6348:	e34033bf 	movt	r3, #959	; 0x3bf
    634c:	e1550003 	cmp	r5, r3
    6350:	0a00016e 	beq	6910 <ipu_init_channel+0x718>
    6354:	ca0000b9 	bgt	6640 <ipu_init_channel+0x448>
    6358:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    635c:	e34031b7 	movt	r3, #439	; 0x1b7
    6360:	e1550003 	cmp	r5, r3
    6364:	0a0001ee 	beq	6b24 <ipu_init_channel+0x92c>
    6368:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    636c:	e34032bb 	movt	r3, #699	; 0x2bb
    6370:	e1550003 	cmp	r5, r3
    6374:	1a000123 	bne	6808 <ipu_init_channel+0x610>
    6378:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    637c:	e1a0100b 	mov	r1, fp
    6380:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6384:	e1a00008 	mov	r0, r8
    6388:	e2822001 	add	r2, r2, #1
    638c:	e2833001 	add	r3, r3, #1
    6390:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6394:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6398:	ebfffffe 	bl	0 <_ipu_ic_init_rotate_vf>
    639c:	e5943e14 	ldr	r3, [r4, #3604]	; 0xe14
    63a0:	e1837007 	orr	r7, r3, r7
    63a4:	e5847e14 	str	r7, [r4, #3604]	; 0xe14
    63a8:	f57ff04e 	dsb	st
    63ac:	ebfffffe 	bl	0 <arm_heavy_mb>
    63b0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    63b4:	e583a000 	str	sl, [r3]
    63b8:	e3a07000 	mov	r7, #0
    63bc:	e1a00006 	mov	r0, r6
    63c0:	ebfffffe 	bl	0 <mutex_unlock>
    63c4:	e1a00007 	mov	r0, r7
    63c8:	e28dd00c 	add	sp, sp, #12
    63cc:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    63d0:	e30e3455 	movw	r3, #58453	; 0xe455
    63d4:	e3413520 	movt	r3, #5408	; 0x1520
    63d8:	e1550003 	cmp	r5, r3
    63dc:	0a0000fc 	beq	67d4 <ipu_init_channel+0x5dc>
    63e0:	ca000045 	bgt	64fc <ipu_init_channel+0x304>
    63e4:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    63e8:	e34132ff 	movt	r3, #4863	; 0x12ff
    63ec:	e1550003 	cmp	r5, r3
    63f0:	0a000150 	beq	6938 <ipu_init_channel+0x740>
    63f4:	da0000fb 	ble	67e8 <ipu_init_channel+0x5f0>
    63f8:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    63fc:	e34133ff 	movt	r3, #5119	; 0x13ff
    6400:	e1550003 	cmp	r5, r3
    6404:	0a000104 	beq	681c <ipu_init_channel+0x624>
    6408:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    640c:	e34134ff 	movt	r3, #5375	; 0x14ff
    6410:	e1550003 	cmp	r5, r3
    6414:	1a0000fb 	bne	6808 <ipu_init_channel+0x610>
    6418:	e59b303c 	ldr	r3, [fp, #60]	; 0x3c
    641c:	e3530001 	cmp	r3, #1
    6420:	8affffc5 	bhi	633c <ipu_init_channel+0x144>
    6424:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    6428:	e30e1455 	movw	r1, #58453	; 0xe455
    642c:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6430:	e3411624 	movt	r1, #5668	; 0x1624
    6434:	e3413927 	movt	r3, #6439	; 0x1927
    6438:	e1520003 	cmp	r2, r3
    643c:	11520001 	cmpne	r2, r1
    6440:	0affffbd 	beq	633c <ipu_init_channel+0x144>
    6444:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    6448:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    644c:	e34124ff 	movt	r2, #5375	; 0x14ff
    6450:	e5842d90 	str	r2, [r4, #3472]	; 0xd90
    6454:	e2833001 	add	r3, r3, #1
    6458:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    645c:	e59b303c 	ldr	r3, [fp, #60]	; 0x3c
    6460:	e2833e76 	add	r3, r3, #1888	; 0x760
    6464:	e2833002 	add	r3, r3, #2
    6468:	e7882103 	str	r2, [r8, r3, lsl #2]
    646c:	e5db3048 	ldrb	r3, [fp, #72]	; 0x48
    6470:	e3530000 	cmp	r3, #0
    6474:	1a0001f0 	bne	6c3c <ipu_init_channel+0xa44>
    6478:	e59b203c 	ldr	r2, [fp, #60]	; 0x3c
    647c:	e3a03001 	mov	r3, #1
    6480:	e282101c 	add	r1, r2, #28
    6484:	e1caa113 	bic	sl, sl, r3, lsl r1
    6488:	e3520000 	cmp	r2, #0
    648c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6490:	13caa101 	bicne	sl, sl, #1073741824	; 0x40000000
    6494:	03caa103 	biceq	sl, sl, #-1073741824	; 0xc0000000
    6498:	138aa102 	orrne	sl, sl, #-2147483648	; 0x80000000
    649c:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    64a0:	f57ff04f 	dsb	sy
    64a4:	e3c55102 	bic	r5, r5, #-2147483648	; 0x80000000
    64a8:	f57ff04e 	dsb	st
    64ac:	ebfffffe 	bl	0 <arm_heavy_mb>
    64b0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    64b4:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    64b8:	e30f1fd5 	movw	r1, #65493	; 0xffd5
    64bc:	e59b203c 	ldr	r2, [fp, #60]	; 0x3c
    64c0:	e1a00008 	mov	r0, r8
    64c4:	e34114ff 	movt	r1, #5375	; 0x14ff
    64c8:	ebfffffe 	bl	0 <_ipu_csi_init>
    64cc:	e1a0100b 	mov	r1, fp
    64d0:	e1a00008 	mov	r0, r8
    64d4:	e3a02001 	mov	r2, #1
    64d8:	ebfffffe 	bl	0 <_ipu_ic_init_prpvf>
    64dc:	eaffffae 	b	639c <ipu_init_channel+0x1a4>
    64e0:	e3001000 	movw	r1, #0
    64e4:	e1a0200a 	mov	r2, sl
    64e8:	e3401000 	movt	r1, #0
    64ec:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    64f0:	ebfffffe 	bl	0 <dev_warn>
    64f4:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    64f8:	eaffff73 	b	62cc <ipu_init_channel+0xd4>
    64fc:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6500:	e3413823 	movt	r3, #6179	; 0x1823
    6504:	e1550003 	cmp	r5, r3
    6508:	0a0000b1 	beq	67d4 <ipu_init_channel+0x5dc>
    650c:	ca00007d 	bgt	6708 <ipu_init_channel+0x510>
    6510:	e30e3455 	movw	r3, #58453	; 0xe455
    6514:	e3413624 	movt	r3, #5668	; 0x1624
    6518:	e1550003 	cmp	r5, r3
    651c:	1a0000a8 	bne	67c4 <ipu_init_channel+0x5cc>
    6520:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    6524:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    6528:	e30f0fc5 	movw	r0, #65477	; 0xffc5
    652c:	e34134ff 	movt	r3, #5375	; 0x14ff
    6530:	e3410927 	movt	r0, #6439	; 0x1927
    6534:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    6538:	e1520000 	cmp	r2, r0
    653c:	11520003 	cmpne	r2, r3
    6540:	e34113ff 	movt	r1, #5119	; 0x13ff
    6544:	03a03001 	moveq	r3, #1
    6548:	13a03000 	movne	r3, #0
    654c:	e1520001 	cmp	r2, r1
    6550:	03833001 	orreq	r3, r3, #1
    6554:	e3530000 	cmp	r3, #0
    6558:	1affff77 	bne	633c <ipu_init_channel+0x144>
    655c:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6560:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    6564:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    6568:	e2822001 	add	r2, r2, #1
    656c:	e5941d48 	ldr	r1, [r4, #3400]	; 0xd48
    6570:	e2833001 	add	r3, r3, #1
    6574:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6578:	e5843e34 	str	r3, [r4, #3636]	; 0xe34
    657c:	e59150a8 	ldr	r5, [r1, #168]	; 0xa8
    6580:	f57ff04f 	dsb	sy
    6584:	e3c55203 	bic	r5, r5, #805306368	; 0x30000000
    6588:	f57ff04e 	dsb	st
    658c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6590:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6594:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    6598:	e5db3020 	ldrb	r3, [fp, #32]
    659c:	e1a0100b 	mov	r1, fp
    65a0:	e3a02000 	mov	r2, #0
    65a4:	e1a00008 	mov	r0, r8
    65a8:	e3530000 	cmp	r3, #0
    65ac:	13a03001 	movne	r3, #1
    65b0:	15c43db4 	strbne	r3, [r4, #3508]	; 0xdb4
    65b4:	ebfffffe 	bl	0 <_ipu_ic_init_prpvf>
    65b8:	e30e1455 	movw	r1, #58453	; 0xe455
    65bc:	e1a0200b 	mov	r2, fp
    65c0:	e1a00008 	mov	r0, r8
    65c4:	e3411624 	movt	r1, #5668	; 0x1624
    65c8:	ebfffffe 	bl	0 <_ipu_vdi_init>
    65cc:	eaffff72 	b	639c <ipu_init_channel+0x1a4>
    65d0:	e3e034f2 	mvn	r3, #-234881024	; 0xf2000000
    65d4:	e1550003 	cmp	r5, r3
    65d8:	0a000146 	beq	6af8 <ipu_init_channel+0x900>
    65dc:	e3e034f1 	mvn	r3, #-251658240	; 0xf1000000
    65e0:	e1550003 	cmp	r5, r3
    65e4:	1a000087 	bne	6808 <ipu_init_channel+0x610>
    65e8:	e59b3000 	ldr	r3, [fp]
    65ec:	e3530001 	cmp	r3, #1
    65f0:	8affff51 	bhi	633c <ipu_init_channel+0x144>
    65f4:	e5c43d9d 	strb	r3, [r4, #3485]	; 0xd9d
    65f8:	e3053049 	movw	r3, #20553	; 0x5049
    65fc:	e3433055 	movt	r3, #12373	; 0x3055
    6600:	e59b2000 	ldr	r2, [fp]
    6604:	e3a01009 	mov	r1, #9
    6608:	e58d3000 	str	r3, [sp]
    660c:	e3a03000 	mov	r3, #0
    6610:	e1a00008 	mov	r0, r8
    6614:	ebfffffe 	bl	0 <_ipu_dc_init>
    6618:	e59b3000 	ldr	r3, [fp]
    661c:	e0883103 	add	r3, r8, r3, lsl #2
    6620:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6624:	e5932e38 	ldr	r2, [r3, #3640]	; 0xe38
    6628:	e2822001 	add	r2, r2, #1
    662c:	e5832e38 	str	r2, [r3, #3640]	; 0xe38
    6630:	e5943e1c 	ldr	r3, [r4, #3612]	; 0xe1c
    6634:	e2833001 	add	r3, r3, #1
    6638:	e5843e1c 	str	r3, [r4, #3612]	; 0xe1c
    663c:	eaffff56 	b	639c <ipu_init_channel+0x1a4>
    6640:	e30e3454 	movw	r3, #58452	; 0xe454
    6644:	e3403430 	movt	r3, #1072	; 0x430
    6648:	e1550003 	cmp	r5, r3
    664c:	0a00004c 	beq	6784 <ipu_init_channel+0x58c>
    6650:	e30e3455 	movw	r3, #58453	; 0xe455
    6654:	e3403530 	movt	r3, #1328	; 0x530
    6658:	e1550003 	cmp	r5, r3
    665c:	1a000069 	bne	6808 <ipu_init_channel+0x610>
    6660:	e5db3020 	ldrb	r3, [fp, #32]
    6664:	e3530000 	cmp	r3, #0
    6668:	0a000016 	beq	66c8 <ipu_init_channel+0x4d0>
    666c:	e59b3024 	ldr	r3, [fp, #36]	; 0x24
    6670:	e3042742 	movw	r2, #18242	; 0x4742
    6674:	e3432452 	movt	r2, #13394	; 0x3452
    6678:	e5db1030 	ldrb	r1, [fp, #48]	; 0x30
    667c:	e1530002 	cmp	r3, r2
    6680:	0a000152 	beq	6bd0 <ipu_init_channel+0x9d8>
    6684:	e3042742 	movw	r2, #18242	; 0x4742
    6688:	e3432452 	movt	r2, #13394	; 0x3452
    668c:	e1530002 	cmp	r3, r2
    6690:	e3042752 	movw	r2, #18258	; 0x4752
    6694:	9a00014a 	bls	6bc4 <ipu_init_channel+0x9cc>
    6698:	e3442142 	movt	r2, #16706	; 0x4142
    669c:	e1530002 	cmp	r3, r2
    66a0:	0a00014a 	beq	6bd0 <ipu_init_channel+0x9d8>
    66a4:	e3042742 	movw	r2, #18242	; 0x4742
    66a8:	e3442152 	movt	r2, #16722	; 0x4152
    66ac:	e1530002 	cmp	r3, r2
    66b0:	0a000146 	beq	6bd0 <ipu_init_channel+0x9d8>
    66b4:	e3510000 	cmp	r1, #0
    66b8:	13a03001 	movne	r3, #1
    66bc:	15c43dc3 	strbne	r3, [r4, #3523]	; 0xdc3
    66c0:	e3a03001 	mov	r3, #1
    66c4:	e5c43da3 	strb	r3, [r4, #3491]	; 0xda3
    66c8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    66cc:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    66d0:	f57ff04f 	dsb	sy
    66d4:	e3855102 	orr	r5, r5, #-2147483648	; 0x80000000
    66d8:	f57ff04e 	dsb	st
    66dc:	ebfffffe 	bl	0 <arm_heavy_mb>
    66e0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    66e4:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    66e8:	e3a02000 	mov	r2, #0
    66ec:	e1a0100b 	mov	r1, fp
    66f0:	e1a00008 	mov	r0, r8
    66f4:	ebfffffe 	bl	0 <_ipu_ic_init_prpvf>
    66f8:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    66fc:	e2833001 	add	r3, r3, #1
    6700:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6704:	eaffff24 	b	639c <ipu_init_channel+0x1a4>
    6708:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    670c:	e3413927 	movt	r3, #6439	; 0x1927
    6710:	e1550003 	cmp	r5, r3
    6714:	1a000125 	bne	6bb0 <ipu_init_channel+0x9b8>
    6718:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    671c:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    6720:	e30e0455 	movw	r0, #58453	; 0xe455
    6724:	e34134ff 	movt	r3, #5375	; 0x14ff
    6728:	e3410624 	movt	r0, #5668	; 0x1624
    672c:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    6730:	e1520000 	cmp	r2, r0
    6734:	11520003 	cmpne	r2, r3
    6738:	e34113ff 	movt	r1, #5119	; 0x13ff
    673c:	03a03001 	moveq	r3, #1
    6740:	13a03000 	movne	r3, #0
    6744:	e1520001 	cmp	r2, r1
    6748:	03833001 	orreq	r3, r3, #1
    674c:	e3530000 	cmp	r3, #0
    6750:	1afffef9 	bne	633c <ipu_init_channel+0x144>
    6754:	e594ce2c 	ldr	ip, [r4, #3628]	; 0xe2c
    6758:	e1a0200b 	mov	r2, fp
    675c:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    6760:	e1a00008 	mov	r0, r8
    6764:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    6768:	e1a01005 	mov	r1, r5
    676c:	e28cc001 	add	ip, ip, #1
    6770:	e2833001 	add	r3, r3, #1
    6774:	e584ce2c 	str	ip, [r4, #3628]	; 0xe2c
    6778:	e5843e34 	str	r3, [r4, #3636]	; 0xe34
    677c:	ebfffffe 	bl	0 <_ipu_vdi_init>
    6780:	eaffff05 	b	639c <ipu_init_channel+0x1a4>
    6784:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    6788:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    678c:	e2833001 	add	r3, r3, #1
    6790:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6794:	e59250a8 	ldr	r5, [r2, #168]	; 0xa8
    6798:	f57ff04f 	dsb	sy
    679c:	e3855101 	orr	r5, r5, #1073741824	; 0x40000000
    67a0:	f57ff04e 	dsb	st
    67a4:	ebfffffe 	bl	0 <arm_heavy_mb>
    67a8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    67ac:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    67b0:	e3a02000 	mov	r2, #0
    67b4:	e1a0100b 	mov	r1, fp
    67b8:	e1a00008 	mov	r0, r8
    67bc:	ebfffffe 	bl	0 <_ipu_ic_init_prpenc>
    67c0:	eafffef5 	b	639c <ipu_init_channel+0x1a4>
    67c4:	e30e3455 	movw	r3, #58453	; 0xe455
    67c8:	e3413728 	movt	r3, #5928	; 0x1728
    67cc:	e1550003 	cmp	r5, r3
    67d0:	1a00000c 	bne	6808 <ipu_init_channel+0x610>
    67d4:	e1a0200b 	mov	r2, fp
    67d8:	e1a01005 	mov	r1, r5
    67dc:	e1a00008 	mov	r0, r8
    67e0:	ebfffffe 	bl	0 <_ipu_vdi_init>
    67e4:	eafffeec 	b	639c <ipu_init_channel+0x1a4>
    67e8:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    67ec:	e34130ff 	movt	r3, #4351	; 0x10ff
    67f0:	e1550003 	cmp	r5, r3
    67f4:	0a00004f 	beq	6938 <ipu_init_channel+0x740>
    67f8:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    67fc:	e34131ff 	movt	r3, #4607	; 0x11ff
    6800:	e1550003 	cmp	r5, r3
    6804:	0a00004b 	beq	6938 <ipu_init_channel+0x740>
    6808:	e3001000 	movw	r1, #0
    680c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6810:	e3401000 	movt	r1, #0
    6814:	ebfffffe 	bl	0 <dev_err>
    6818:	eafffedf 	b	639c <ipu_init_channel+0x1a4>
    681c:	e59b3020 	ldr	r3, [fp, #32]
    6820:	e3530001 	cmp	r3, #1
    6824:	8afffec4 	bhi	633c <ipu_init_channel+0x144>
    6828:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    682c:	e30e1455 	movw	r1, #58453	; 0xe455
    6830:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6834:	e3411624 	movt	r1, #5668	; 0x1624
    6838:	e3413927 	movt	r3, #6439	; 0x1927
    683c:	e1520003 	cmp	r2, r3
    6840:	11520001 	cmpne	r2, r1
    6844:	0afffebc 	beq	633c <ipu_init_channel+0x144>
    6848:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    684c:	e3002462 	movw	r2, #1122	; 0x462
    6850:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    6854:	e19920b2 	ldrh	r2, [r9, r2]
    6858:	e2833001 	add	r3, r3, #1
    685c:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6860:	e59b3020 	ldr	r3, [fp, #32]
    6864:	e3120004 	tst	r2, #4
    6868:	e2833e76 	add	r3, r3, #1888	; 0x760
    686c:	e2833002 	add	r3, r3, #2
    6870:	e7885103 	str	r5, [r8, r3, lsl #2]
    6874:	0a000007 	beq	6898 <ipu_init_channel+0x6a0>
    6878:	e59bc020 	ldr	ip, [fp, #32]
    687c:	e3002000 	movw	r2, #0
    6880:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    6884:	e3402000 	movt	r2, #0
    6888:	e59f3414 	ldr	r3, [pc, #1044]	; 6ca4 <ipu_init_channel+0xaac>
    688c:	e59f0414 	ldr	r0, [pc, #1044]	; 6ca8 <ipu_init_channel+0xab0>
    6890:	e58dc000 	str	ip, [sp]
    6894:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    6898:	e59b3020 	ldr	r3, [fp, #32]
    689c:	e3a02001 	mov	r2, #1
    68a0:	e5db102c 	ldrb	r1, [fp, #44]	; 0x2c
    68a4:	e283c01c 	add	ip, r3, #28
    68a8:	e3510000 	cmp	r1, #0
    68ac:	e1a0cc12 	lsl	ip, r2, ip
    68b0:	01caa00c 	biceq	sl, sl, ip
    68b4:	1a0000ea 	bne	6c64 <ipu_init_channel+0xa6c>
    68b8:	e3530000 	cmp	r3, #0
    68bc:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    68c0:	13caa101 	bicne	sl, sl, #1073741824	; 0x40000000
    68c4:	03caa103 	biceq	sl, sl, #-1073741824	; 0xc0000000
    68c8:	138aa102 	orrne	sl, sl, #-2147483648	; 0x80000000
    68cc:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    68d0:	f57ff04f 	dsb	sy
    68d4:	e3c55101 	bic	r5, r5, #1073741824	; 0x40000000
    68d8:	f57ff04e 	dsb	st
    68dc:	ebfffffe 	bl	0 <arm_heavy_mb>
    68e0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    68e4:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    68e8:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    68ec:	e59b2020 	ldr	r2, [fp, #32]
    68f0:	e1a00008 	mov	r0, r8
    68f4:	e34113ff 	movt	r1, #5119	; 0x13ff
    68f8:	ebfffffe 	bl	0 <_ipu_csi_init>
    68fc:	e1a0100b 	mov	r1, fp
    6900:	e1a00008 	mov	r0, r8
    6904:	e3a02001 	mov	r2, #1
    6908:	ebfffffe 	bl	0 <_ipu_ic_init_prpenc>
    690c:	eafffea2 	b	639c <ipu_init_channel+0x1a4>
    6910:	e1a0100b 	mov	r1, fp
    6914:	e1a00008 	mov	r0, r8
    6918:	ebfffffe 	bl	0 <_ipu_ic_init_rotate_pp>
    691c:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6920:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6924:	e2822001 	add	r2, r2, #1
    6928:	e2833001 	add	r3, r3, #1
    692c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6930:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6934:	eafffe98 	b	639c <ipu_init_channel+0x1a4>
    6938:	e59b3000 	ldr	r3, [fp]
    693c:	e3530001 	cmp	r3, #1
    6940:	8afffe7d 	bhi	633c <ipu_init_channel+0x144>
    6944:	e5db200d 	ldrb	r2, [fp, #13]
    6948:	e205303f 	and	r3, r5, #63	; 0x3f
    694c:	e0883003 	add	r3, r8, r3
    6950:	e3a0e001 	mov	lr, #1
    6954:	e3520000 	cmp	r2, #0
    6958:	13012dde 	movwne	r2, #7646	; 0x1dde
    695c:	13a01001 	movne	r1, #1
    6960:	03011dde 	movweq	r1, #7646	; 0x1dde
    6964:	17c31002 	strbne	r1, [r3, r2]
    6968:	07c32001 	strbeq	r2, [r3, r1]
    696c:	e5943e28 	ldr	r3, [r4, #3624]	; 0xe28
    6970:	e2833001 	add	r3, r3, #1
    6974:	e5843e28 	str	r3, [r4, #3624]	; 0xe28
    6978:	e59b3000 	ldr	r3, [fp]
    697c:	e2833e76 	add	r3, r3, #1888	; 0x760
    6980:	e2833002 	add	r3, r3, #2
    6984:	e7885103 	str	r5, [r8, r3, lsl #2]
    6988:	e5db200c 	ldrb	r2, [fp, #12]
    698c:	e59b3000 	ldr	r3, [fp]
    6990:	e3520000 	cmp	r2, #0
    6994:	0a0000a2 	beq	6c24 <ipu_init_channel+0xa2c>
    6998:	e283c01c 	add	ip, r3, #28
    699c:	e59b2008 	ldr	r2, [fp, #8]
    69a0:	e1a01005 	mov	r1, r5
    69a4:	e1a00008 	mov	r0, r8
    69a8:	e18aac1e 	orr	sl, sl, lr, lsl ip
    69ac:	ebfffffe 	bl	0 <_ipu_smfc_init>
    69b0:	e59b3000 	ldr	r3, [fp]
    69b4:	e1a00008 	mov	r0, r8
    69b8:	e59b2004 	ldr	r2, [fp, #4]
    69bc:	e59b1008 	ldr	r1, [fp, #8]
    69c0:	ebfffffe 	bl	0 <_ipu_csi_set_mipi_di>
    69c4:	e59b2000 	ldr	r2, [fp]
    69c8:	e1a01005 	mov	r1, r5
    69cc:	e1a00008 	mov	r0, r8
    69d0:	ebfffffe 	bl	0 <_ipu_csi_init>
    69d4:	eafffe70 	b	639c <ipu_init_channel+0x1a4>
    69d8:	e5db3020 	ldrb	r3, [fp, #32]
    69dc:	e3530000 	cmp	r3, #0
    69e0:	0a000013 	beq	6a34 <ipu_init_channel+0x83c>
    69e4:	e59b3024 	ldr	r3, [fp, #36]	; 0x24
    69e8:	e3042742 	movw	r2, #18242	; 0x4742
    69ec:	e3432452 	movt	r2, #13394	; 0x3452
    69f0:	e5db1030 	ldrb	r1, [fp, #48]	; 0x30
    69f4:	e1530002 	cmp	r3, r2
    69f8:	0a000080 	beq	6c00 <ipu_init_channel+0xa08>
    69fc:	e3042752 	movw	r2, #18258	; 0x4752
    6a00:	9a00007b 	bls	6bf4 <ipu_init_channel+0x9fc>
    6a04:	e3442142 	movt	r2, #16706	; 0x4142
    6a08:	e1530002 	cmp	r3, r2
    6a0c:	0a00007b 	beq	6c00 <ipu_init_channel+0xa08>
    6a10:	e3042742 	movw	r2, #18242	; 0x4742
    6a14:	e3442152 	movt	r2, #16722	; 0x4152
    6a18:	e1530002 	cmp	r3, r2
    6a1c:	0a000077 	beq	6c00 <ipu_init_channel+0xa08>
    6a20:	e3510000 	cmp	r1, #0
    6a24:	13a03001 	movne	r3, #1
    6a28:	15c43dc4 	strbne	r3, [r4, #3524]	; 0xdc4
    6a2c:	e3a03001 	mov	r3, #1
    6a30:	e5c43da4 	strb	r3, [r4, #3492]	; 0xda4
    6a34:	e1a0100b 	mov	r1, fp
    6a38:	e1a00008 	mov	r0, r8
    6a3c:	ebfffffe 	bl	0 <_ipu_ic_init_pp>
    6a40:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    6a44:	e2833001 	add	r3, r3, #1
    6a48:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6a4c:	eafffe52 	b	639c <ipu_init_channel+0x1a4>
    6a50:	e1cb20d8 	ldrd	r2, [fp, #8]
    6a54:	e1a01005 	mov	r1, r5
    6a58:	e1a00008 	mov	r0, r8
    6a5c:	ebfffffe 	bl	0 <_ipu_dp_init>
    6a60:	e5db3010 	ldrb	r3, [fp, #16]
    6a64:	e3530000 	cmp	r3, #0
    6a68:	13a03001 	movne	r3, #1
    6a6c:	15c43dc8 	strbne	r3, [r4, #3528]	; 0xdc8
    6a70:	e5941e1c 	ldr	r1, [r4, #3612]	; 0xe1c
    6a74:	e5942e20 	ldr	r2, [r4, #3616]	; 0xe20
    6a78:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    6a7c:	e2811001 	add	r1, r1, #1
    6a80:	e2822001 	add	r2, r2, #1
    6a84:	e5841e1c 	str	r1, [r4, #3612]	; 0xe1c
    6a88:	e2833001 	add	r3, r3, #1
    6a8c:	e5842e20 	str	r2, [r4, #3616]	; 0xe20
    6a90:	e5843e24 	str	r3, [r4, #3620]	; 0xe24
    6a94:	eafffe40 	b	639c <ipu_init_channel+0x1a4>
    6a98:	e59b3000 	ldr	r3, [fp]
    6a9c:	e3530001 	cmp	r3, #1
    6aa0:	8afffe25 	bhi	633c <ipu_init_channel+0x144>
    6aa4:	e5c43d95 	strb	r3, [r4, #3477]	; 0xd95
    6aa8:	e3a01001 	mov	r1, #1
    6aac:	e59bc00c 	ldr	ip, [fp, #12]
    6ab0:	e1a00008 	mov	r0, r8
    6ab4:	e5db3004 	ldrb	r3, [fp, #4]
    6ab8:	e59b2000 	ldr	r2, [fp]
    6abc:	e58dc000 	str	ip, [sp]
    6ac0:	ebfffffe 	bl	0 <_ipu_dc_init>
    6ac4:	e59b3000 	ldr	r3, [fp]
    6ac8:	e0883103 	add	r3, r8, r3, lsl #2
    6acc:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6ad0:	e5932e38 	ldr	r2, [r3, #3640]	; 0xe38
    6ad4:	e2822001 	add	r2, r2, #1
    6ad8:	e5832e38 	str	r2, [r3, #3640]	; 0xe38
    6adc:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    6ae0:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    6ae4:	e2822001 	add	r2, r2, #1
    6ae8:	e2833001 	add	r3, r3, #1
    6aec:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    6af0:	e5843e24 	str	r3, [r4, #3620]	; 0xe24
    6af4:	eafffe28 	b	639c <ipu_init_channel+0x1a4>
    6af8:	e59b3000 	ldr	r3, [fp]
    6afc:	e3530001 	cmp	r3, #1
    6b00:	8afffe0d 	bhi	633c <ipu_init_channel+0x144>
    6b04:	e5c43d9c 	strb	r3, [r4, #3484]	; 0xd9c
    6b08:	e3053049 	movw	r3, #20553	; 0x5049
    6b0c:	e3433055 	movt	r3, #12373	; 0x3055
    6b10:	e59b2000 	ldr	r2, [fp]
    6b14:	e3a01008 	mov	r1, #8
    6b18:	e58d3000 	str	r3, [sp]
    6b1c:	e3a03000 	mov	r3, #0
    6b20:	eafffeba 	b	6610 <ipu_init_channel+0x418>
    6b24:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6b28:	e1a0100b 	mov	r1, fp
    6b2c:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6b30:	e1a00008 	mov	r0, r8
    6b34:	e2822001 	add	r2, r2, #1
    6b38:	e2833001 	add	r3, r3, #1
    6b3c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6b40:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6b44:	ebfffffe 	bl	0 <_ipu_ic_init_rotate_enc>
    6b48:	eafffe13 	b	639c <ipu_init_channel+0x1a4>
    6b4c:	e5db2010 	ldrb	r2, [fp, #16]
    6b50:	e30f1cff 	movw	r1, #64767	; 0xfcff
    6b54:	e340195f 	movt	r1, #2399	; 0x95f
    6b58:	e1a00008 	mov	r0, r8
    6b5c:	e3520000 	cmp	r2, #0
    6b60:	13a03001 	movne	r3, #1
    6b64:	15c43dc7 	strbne	r3, [r4, #3527]	; 0xdc7
    6b68:	159b3000 	ldrne	r3, [fp]
    6b6c:	e5c43d99 	strb	r3, [r4, #3481]	; 0xd99
    6b70:	e1cb20d8 	ldrd	r2, [fp, #8]
    6b74:	ebfffffe 	bl	0 <_ipu_dp_init>
    6b78:	e59bc00c 	ldr	ip, [fp, #12]
    6b7c:	e1a00008 	mov	r0, r8
    6b80:	e5db3004 	ldrb	r3, [fp, #4]
    6b84:	e3a01005 	mov	r1, #5
    6b88:	e59b2000 	ldr	r2, [fp]
    6b8c:	e58dc000 	str	ip, [sp]
    6b90:	ebfffffe 	bl	0 <_ipu_dc_init>
    6b94:	e59b3000 	ldr	r3, [fp]
    6b98:	e0888103 	add	r8, r8, r3, lsl #2
    6b9c:	e2888a01 	add	r8, r8, #4096	; 0x1000
    6ba0:	e5983e38 	ldr	r3, [r8, #3640]	; 0xe38
    6ba4:	e2833001 	add	r3, r3, #1
    6ba8:	e5883e38 	str	r3, [r8, #3640]	; 0xe38
    6bac:	eaffffaf 	b	6a70 <ipu_init_channel+0x878>
    6bb0:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6bb4:	e3413a2b 	movt	r3, #6699	; 0x1a2b
    6bb8:	e1550003 	cmp	r5, r3
    6bbc:	0affff04 	beq	67d4 <ipu_init_channel+0x5dc>
    6bc0:	eaffff10 	b	6808 <ipu_init_channel+0x610>
    6bc4:	e3432442 	movt	r2, #13378	; 0x3442
    6bc8:	e1530002 	cmp	r3, r2
    6bcc:	1afffeb8 	bne	66b4 <ipu_init_channel+0x4bc>
    6bd0:	e3510000 	cmp	r1, #0
    6bd4:	0afffeb9 	beq	66c0 <ipu_init_channel+0x4c8>
    6bd8:	e3001000 	movw	r1, #0
    6bdc:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6be0:	e3401000 	movt	r1, #0
    6be4:	e3a0200e 	mov	r2, #14
    6be8:	ebfffffe 	bl	0 <dev_err>
    6bec:	e3e07015 	mvn	r7, #21
    6bf0:	eafffdf1 	b	63bc <ipu_init_channel+0x1c4>
    6bf4:	e3432442 	movt	r2, #13378	; 0x3442
    6bf8:	e1530002 	cmp	r3, r2
    6bfc:	1affff87 	bne	6a20 <ipu_init_channel+0x828>
    6c00:	e3510000 	cmp	r1, #0
    6c04:	0affff88 	beq	6a2c <ipu_init_channel+0x834>
    6c08:	e3001000 	movw	r1, #0
    6c0c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6c10:	e3401000 	movt	r1, #0
    6c14:	e3a0200f 	mov	r2, #15
    6c18:	ebfffffe 	bl	0 <dev_err>
    6c1c:	e3e07015 	mvn	r7, #21
    6c20:	eafffde5 	b	63bc <ipu_init_channel+0x1c4>
    6c24:	e283c01c 	add	ip, r3, #28
    6c28:	e1a01005 	mov	r1, r5
    6c2c:	e1a00008 	mov	r0, r8
    6c30:	e1caac1e 	bic	sl, sl, lr, lsl ip
    6c34:	ebfffffe 	bl	0 <_ipu_smfc_init>
    6c38:	eaffff61 	b	69c4 <ipu_init_channel+0x7cc>
    6c3c:	e59b303c 	ldr	r3, [fp, #60]	; 0x3c
    6c40:	e3a0c001 	mov	ip, #1
    6c44:	e59b2040 	ldr	r2, [fp, #64]	; 0x40
    6c48:	e1a00008 	mov	r0, r8
    6c4c:	e59b1044 	ldr	r1, [fp, #68]	; 0x44
    6c50:	e283e01c 	add	lr, r3, #28
    6c54:	e18aae1c 	orr	sl, sl, ip, lsl lr
    6c58:	ebfffffe 	bl	0 <_ipu_csi_set_mipi_di>
    6c5c:	e59b203c 	ldr	r2, [fp, #60]	; 0x3c
    6c60:	eafffe08 	b	6488 <ipu_init_channel+0x290>
    6c64:	e59b2024 	ldr	r2, [fp, #36]	; 0x24
    6c68:	e1a00008 	mov	r0, r8
    6c6c:	e59b1028 	ldr	r1, [fp, #40]	; 0x28
    6c70:	e18ca00a 	orr	sl, ip, sl
    6c74:	ebfffffe 	bl	0 <_ipu_csi_set_mipi_di>
    6c78:	e59b3020 	ldr	r3, [fp, #32]
    6c7c:	eaffff0d 	b	68b8 <ipu_init_channel+0x6c0>
    6c80:	e3001000 	movw	r1, #0
    6c84:	e1a0200a 	mov	r2, sl
    6c88:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6c8c:	e3401000 	movt	r1, #0
    6c90:	e1a03007 	mov	r3, r7
    6c94:	ebfffffe 	bl	0 <dev_err>
    6c98:	ebfffffe 	bl	0 <dump_stack>
    6c9c:	eafffdc8 	b	63c4 <ipu_init_channel+0x1cc>
    6ca0:	00000438 	andeq	r0, r0, r8, lsr r4
    6ca4:	000001ec 	andeq	r0, r0, ip, ror #3
    6ca8:	00000450 	andeq	r0, r0, r0, asr r4

00006cac <ipu_enable_csi>:
    6cac:	e3510001 	cmp	r1, #1
    6cb0:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    6cb4:	e1a06001 	mov	r6, r1
    6cb8:	e24dd00c 	sub	sp, sp, #12
    6cbc:	e1a04000 	mov	r4, r0
    6cc0:	8a00002c 	bhi	6d78 <ipu_enable_csi+0xcc>
    6cc4:	e3003000 	movw	r3, #0
    6cc8:	e300247a 	movw	r2, #1146	; 0x47a
    6ccc:	e3403000 	movt	r3, #0
    6cd0:	e19330b2 	ldrh	r3, [r3, r2]
    6cd4:	e3130004 	tst	r3, #4
    6cd8:	0a000007 	beq	6cfc <ipu_enable_csi+0x50>
    6cdc:	e2803a01 	add	r3, r0, #4096	; 0x1000
    6ce0:	e3002000 	movw	r2, #0
    6ce4:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    6ce8:	e3402000 	movt	r2, #0
    6cec:	e58d6000 	str	r6, [sp]
    6cf0:	e59f30a0 	ldr	r3, [pc, #160]	; 6d98 <ipu_enable_csi+0xec>
    6cf4:	e59f00a0 	ldr	r0, [pc, #160]	; 6d9c <ipu_enable_csi+0xf0>
    6cf8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    6cfc:	e2845d79 	add	r5, r4, #7744	; 0x1e40
    6d00:	e1a00004 	mov	r0, r4
    6d04:	e2855008 	add	r5, r5, #8
    6d08:	ebfffffe 	bl	61e0 <_ipu_get>
    6d0c:	e1a00005 	mov	r0, r5
    6d10:	ebfffffe 	bl	0 <mutex_lock>
    6d14:	e0843106 	add	r3, r4, r6, lsl #2
    6d18:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6d1c:	e5932e40 	ldr	r2, [r3, #3648]	; 0xe40
    6d20:	e2822001 	add	r2, r2, #1
    6d24:	e3520001 	cmp	r2, #1
    6d28:	e5832e40 	str	r2, [r3, #3648]	; 0xe40
    6d2c:	1a00000a 	bne	6d5c <ipu_enable_csi+0xb0>
    6d30:	e2847a01 	add	r7, r4, #4096	; 0x1000
    6d34:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6d38:	e5933000 	ldr	r3, [r3]
    6d3c:	f57ff04f 	dsb	sy
    6d40:	e3560000 	cmp	r6, #0
    6d44:	03836001 	orreq	r6, r3, #1
    6d48:	13836002 	orrne	r6, r3, #2
    6d4c:	f57ff04e 	dsb	st
    6d50:	ebfffffe 	bl	0 <arm_heavy_mb>
    6d54:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6d58:	e5836000 	str	r6, [r3]
    6d5c:	e1a00005 	mov	r0, r5
    6d60:	ebfffffe 	bl	0 <mutex_unlock>
    6d64:	e594000c 	ldr	r0, [r4, #12]
    6d68:	ebfffffe 	bl	0 <clk_disable>
    6d6c:	e3a00000 	mov	r0, #0
    6d70:	e28dd00c 	add	sp, sp, #12
    6d74:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    6d78:	e2804a01 	add	r4, r0, #4096	; 0x1000
    6d7c:	e3001000 	movw	r1, #0
    6d80:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6d84:	e1a02006 	mov	r2, r6
    6d88:	e3401000 	movt	r1, #0
    6d8c:	ebfffffe 	bl	0 <dev_err>
    6d90:	e3e00015 	mvn	r0, #21
    6d94:	eafffff5 	b	6d70 <ipu_enable_csi+0xc4>
    6d98:	00000200 	andeq	r0, r0, r0, lsl #4
    6d9c:	00000468 	andeq	r0, r0, r8, ror #8

00006da0 <ipu_disable_csi>:
    6da0:	e3510001 	cmp	r1, #1
    6da4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    6da8:	e1a06001 	mov	r6, r1
    6dac:	e1a05000 	mov	r5, r0
    6db0:	8a000020 	bhi	6e38 <ipu_disable_csi+0x98>
    6db4:	e2804d79 	add	r4, r0, #7744	; 0x1e40
    6db8:	e2844008 	add	r4, r4, #8
    6dbc:	ebfffffe 	bl	61e0 <_ipu_get>
    6dc0:	e1a00004 	mov	r0, r4
    6dc4:	ebfffffe 	bl	0 <mutex_lock>
    6dc8:	e0853106 	add	r3, r5, r6, lsl #2
    6dcc:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6dd0:	e5931e40 	ldr	r1, [r3, #3648]	; 0xe40
    6dd4:	e2411001 	sub	r1, r1, #1
    6dd8:	e3510000 	cmp	r1, #0
    6ddc:	e5831e40 	str	r1, [r3, #3648]	; 0xe40
    6de0:	0a000005 	beq	6dfc <ipu_disable_csi+0x5c>
    6de4:	e1a00004 	mov	r0, r4
    6de8:	ebfffffe 	bl	0 <mutex_unlock>
    6dec:	e595000c 	ldr	r0, [r5, #12]
    6df0:	ebfffffe 	bl	0 <clk_disable>
    6df4:	e3a00000 	mov	r0, #0
    6df8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    6dfc:	e5931d88 	ldr	r1, [r3, #3464]	; 0xd88
    6e00:	e1a00005 	mov	r0, r5
    6e04:	e2857a01 	add	r7, r5, #4096	; 0x1000
    6e08:	ebfffffe 	bl	0 <_ipu_csi_wait4eof>
    6e0c:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6e10:	e5933000 	ldr	r3, [r3]
    6e14:	f57ff04f 	dsb	sy
    6e18:	e3560000 	cmp	r6, #0
    6e1c:	03c36001 	biceq	r6, r3, #1
    6e20:	13c36002 	bicne	r6, r3, #2
    6e24:	f57ff04e 	dsb	st
    6e28:	ebfffffe 	bl	0 <arm_heavy_mb>
    6e2c:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6e30:	e5836000 	str	r6, [r3]
    6e34:	eaffffea 	b	6de4 <ipu_disable_csi+0x44>
    6e38:	e2805a01 	add	r5, r0, #4096	; 0x1000
    6e3c:	e3001000 	movw	r1, #0
    6e40:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    6e44:	e1a02006 	mov	r2, r6
    6e48:	e3401000 	movt	r1, #0
    6e4c:	ebfffffe 	bl	0 <dev_err>
    6e50:	e3e00015 	mvn	r0, #21
    6e54:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00006e58 <ipu_enable_irq>:
    6e58:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    6e5c:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    6e60:	e286601c 	add	r6, r6, #28
    6e64:	e1a05001 	mov	r5, r1
    6e68:	e1a07000 	mov	r7, r0
    6e6c:	ebfffffe 	bl	61e0 <_ipu_get>
    6e70:	e1a00006 	mov	r0, r6
    6e74:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6e78:	e1a032a5 	lsr	r3, r5, #5
    6e7c:	e1a08000 	mov	r8, r0
    6e80:	e2432006 	sub	r2, r3, #6
    6e84:	e3530003 	cmp	r3, #3
    6e88:	83520001 	cmphi	r2, #1
    6e8c:	9a000019 	bls	6ef8 <ipu_enable_irq+0xa0>
    6e90:	e243200a 	sub	r2, r3, #10
    6e94:	e3520004 	cmp	r2, #4
    6e98:	9a000016 	bls	6ef8 <ipu_enable_irq+0xa0>
    6e9c:	e2879a01 	add	r9, r7, #4096	; 0x1000
    6ea0:	e283300f 	add	r3, r3, #15
    6ea4:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6ea8:	e1a04103 	lsl	r4, r3, #2
    6eac:	e0823004 	add	r3, r2, r4
    6eb0:	e5932000 	ldr	r2, [r3]
    6eb4:	f57ff04f 	dsb	sy
    6eb8:	e3a03001 	mov	r3, #1
    6ebc:	e205501f 	and	r5, r5, #31
    6ec0:	e1825513 	orr	r5, r2, r3, lsl r5
    6ec4:	f57ff04e 	dsb	st
    6ec8:	ebfffffe 	bl	0 <arm_heavy_mb>
    6ecc:	e5993d48 	ldr	r3, [r9, #3400]	; 0xd48
    6ed0:	e0834004 	add	r4, r3, r4
    6ed4:	e5845000 	str	r5, [r4]
    6ed8:	e3a04000 	mov	r4, #0
    6edc:	e1a01008 	mov	r1, r8
    6ee0:	e1a00006 	mov	r0, r6
    6ee4:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    6ee8:	e597000c 	ldr	r0, [r7, #12]
    6eec:	ebfffffe 	bl	0 <clk_disable>
    6ef0:	e1a00004 	mov	r0, r4
    6ef4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6ef8:	e0872205 	add	r2, r7, r5, lsl #4
    6efc:	e5922048 	ldr	r2, [r2, #72]	; 0x48
    6f00:	e3520000 	cmp	r2, #0
    6f04:	1affffe4 	bne	6e9c <ipu_enable_irq+0x44>
    6f08:	e2873a01 	add	r3, r7, #4096	; 0x1000
    6f0c:	e3001000 	movw	r1, #0
    6f10:	e1a02005 	mov	r2, r5
    6f14:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    6f18:	e3401000 	movt	r1, #0
    6f1c:	e3e0400c 	mvn	r4, #12
    6f20:	ebfffffe 	bl	0 <dev_err>
    6f24:	eaffffec 	b	6edc <ipu_enable_irq+0x84>

00006f28 <ipu_disable_irq>:
    6f28:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    6f2c:	e1a0a001 	mov	sl, r1
    6f30:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    6f34:	e1a042aa 	lsr	r4, sl, #5
    6f38:	e285501c 	add	r5, r5, #28
    6f3c:	e2809a01 	add	r9, r0, #4096	; 0x1000
    6f40:	e1a06000 	mov	r6, r0
    6f44:	ebfffffe 	bl	61e0 <_ipu_get>
    6f48:	e1a00005 	mov	r0, r5
    6f4c:	e284400f 	add	r4, r4, #15
    6f50:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6f54:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6f58:	e1a04104 	lsl	r4, r4, #2
    6f5c:	e1a08000 	mov	r8, r0
    6f60:	e0822004 	add	r2, r2, r4
    6f64:	e5927000 	ldr	r7, [r2]
    6f68:	f57ff04f 	dsb	sy
    6f6c:	e3a01001 	mov	r1, #1
    6f70:	e20a301f 	and	r3, sl, #31
    6f74:	e1c77311 	bic	r7, r7, r1, lsl r3
    6f78:	f57ff04e 	dsb	st
    6f7c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6f80:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6f84:	e0824004 	add	r4, r2, r4
    6f88:	e5847000 	str	r7, [r4]
    6f8c:	e1a00005 	mov	r0, r5
    6f90:	e1a01008 	mov	r1, r8
    6f94:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    6f98:	e596000c 	ldr	r0, [r6, #12]
    6f9c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    6fa0:	eafffffe 	b	0 <clk_disable>

00006fa4 <ipu_clear_irq>:
    6fa4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    6fa8:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    6fac:	e285501c 	add	r5, r5, #28
    6fb0:	e1a06001 	mov	r6, r1
    6fb4:	e1a04000 	mov	r4, r0
    6fb8:	e1a072a6 	lsr	r7, r6, #5
    6fbc:	e206601f 	and	r6, r6, #31
    6fc0:	ebfffffe 	bl	61e0 <_ipu_get>
    6fc4:	e1a00005 	mov	r0, r5
    6fc8:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6fcc:	e5943004 	ldr	r3, [r4, #4]
    6fd0:	e3a02001 	mov	r2, #1
    6fd4:	e1a08000 	mov	r8, r0
    6fd8:	e1a06612 	lsl	r6, r2, r6
    6fdc:	e3530000 	cmp	r3, #0
    6fe0:	13a03c02 	movne	r3, #512	; 0x200
    6fe4:	03a030e8 	moveq	r3, #232	; 0xe8
    6fe8:	e0837107 	add	r7, r3, r7, lsl #2
    6fec:	f57ff04e 	dsb	st
    6ff0:	ebfffffe 	bl	0 <arm_heavy_mb>
    6ff4:	e2843a01 	add	r3, r4, #4096	; 0x1000
    6ff8:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    6ffc:	e0833007 	add	r3, r3, r7
    7000:	e5836000 	str	r6, [r3]
    7004:	e1a00005 	mov	r0, r5
    7008:	e1a01008 	mov	r1, r8
    700c:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    7010:	e594000c 	ldr	r0, [r4, #12]
    7014:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    7018:	eafffffe 	b	0 <clk_disable>

0000701c <ipu_get_irq_status>:
    701c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    7020:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    7024:	e286601c 	add	r6, r6, #28
    7028:	e1a05000 	mov	r5, r0
    702c:	e1a04001 	mov	r4, r1
    7030:	ebfffffe 	bl	61e0 <_ipu_get>
    7034:	e1a00006 	mov	r0, r6
    7038:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    703c:	e5952004 	ldr	r2, [r5, #4]
    7040:	e1a01000 	mov	r1, r0
    7044:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7048:	e1a002a4 	lsr	r0, r4, #5
    704c:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7050:	e3520000 	cmp	r2, #0
    7054:	13a02c02 	movne	r2, #512	; 0x200
    7058:	03a020e8 	moveq	r2, #232	; 0xe8
    705c:	e0822100 	add	r2, r2, r0, lsl #2
    7060:	e0833002 	add	r3, r3, r2
    7064:	e5937000 	ldr	r7, [r3]
    7068:	f57ff04f 	dsb	sy
    706c:	e204401f 	and	r4, r4, #31
    7070:	e1a00006 	mov	r0, r6
    7074:	e1a04437 	lsr	r4, r7, r4
    7078:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    707c:	e595000c 	ldr	r0, [r5, #12]
    7080:	ebfffffe 	bl	0 <clk_disable>
    7084:	e2040001 	and	r0, r4, #1
    7088:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000708c <ipu_request_irq>:
    708c:	e300c000 	movw	ip, #0
    7090:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7094:	e340c000 	movt	ip, #0
    7098:	e300e492 	movw	lr, #1170	; 0x492
    709c:	e1a06000 	mov	r6, r0
    70a0:	e1a04001 	mov	r4, r1
    70a4:	e19c00be 	ldrh	r0, [ip, lr]
    70a8:	e1a0a002 	mov	sl, r2
    70ac:	e1a09003 	mov	r9, r3
    70b0:	e3100004 	tst	r0, #4
    70b4:	0a000006 	beq	70d4 <ipu_request_irq+0x48>
    70b8:	e2863a01 	add	r3, r6, #4096	; 0x1000
    70bc:	e3002000 	movw	r2, #0
    70c0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    70c4:	e28c0d12 	add	r0, ip, #1152	; 0x480
    70c8:	e3402000 	movt	r2, #0
    70cc:	e59f3148 	ldr	r3, [pc, #328]	; 721c <ipu_request_irq+0x190>
    70d0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    70d4:	e3540e1d 	cmp	r4, #464	; 0x1d0
    70d8:	2a00003e 	bcs	71d8 <ipu_request_irq+0x14c>
    70dc:	e2867d79 	add	r7, r6, #7744	; 0x1e40
    70e0:	e1a00006 	mov	r0, r6
    70e4:	e287701c 	add	r7, r7, #28
    70e8:	ebfffffe 	bl	61e0 <_ipu_get>
    70ec:	e1a00007 	mov	r0, r7
    70f0:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    70f4:	e1a03204 	lsl	r3, r4, #4
    70f8:	e1a08000 	mov	r8, r0
    70fc:	e0862003 	add	r2, r6, r3
    7100:	e5922048 	ldr	r2, [r2, #72]	; 0x48
    7104:	e3520000 	cmp	r2, #0
    7108:	1a000033 	bne	71dc <ipu_request_irq+0x150>
    710c:	e1a052a4 	lsr	r5, r4, #5
    7110:	e2452006 	sub	r2, r5, #6
    7114:	e3550003 	cmp	r5, #3
    7118:	83520001 	cmphi	r2, #1
    711c:	8a000029 	bhi	71c8 <ipu_request_irq+0x13c>
    7120:	e35a0000 	cmp	sl, #0
    7124:	0a000034 	beq	71fc <ipu_request_irq+0x170>
    7128:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    712c:	e0863003 	add	r3, r6, r3
    7130:	e5839054 	str	r9, [r3, #84]	; 0x54
    7134:	e1a05105 	lsl	r5, r5, #2
    7138:	e583a048 	str	sl, [r3, #72]	; 0x48
    713c:	e204101f 	and	r1, r4, #31
    7140:	e5832050 	str	r2, [r3, #80]	; 0x50
    7144:	e3a04001 	mov	r4, #1
    7148:	e59d2020 	ldr	r2, [sp, #32]
    714c:	e1a04114 	lsl	r4, r4, r1
    7150:	e583204c 	str	r2, [r3, #76]	; 0x4c
    7154:	e5963004 	ldr	r3, [r6, #4]
    7158:	e3530000 	cmp	r3, #0
    715c:	13a09c02 	movne	r9, #512	; 0x200
    7160:	03a090e8 	moveq	r9, #232	; 0xe8
    7164:	e0859009 	add	r9, r5, r9
    7168:	f57ff04e 	dsb	st
    716c:	e286aa01 	add	sl, r6, #4096	; 0x1000
    7170:	ebfffffe 	bl	0 <arm_heavy_mb>
    7174:	e59a3d48 	ldr	r3, [sl, #3400]	; 0xd48
    7178:	e0839009 	add	r9, r3, r9
    717c:	e5894000 	str	r4, [r9]
    7180:	e285503c 	add	r5, r5, #60	; 0x3c
    7184:	e0833005 	add	r3, r3, r5
    7188:	e5931000 	ldr	r1, [r3]
    718c:	f57ff04f 	dsb	sy
    7190:	e1844001 	orr	r4, r4, r1
    7194:	f57ff04e 	dsb	st
    7198:	ebfffffe 	bl	0 <arm_heavy_mb>
    719c:	e59a3d48 	ldr	r3, [sl, #3400]	; 0xd48
    71a0:	e0835005 	add	r5, r3, r5
    71a4:	e5854000 	str	r4, [r5]
    71a8:	e3a04000 	mov	r4, #0
    71ac:	e1a01008 	mov	r1, r8
    71b0:	e1a00007 	mov	r0, r7
    71b4:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    71b8:	e596000c 	ldr	r0, [r6, #12]
    71bc:	ebfffffe 	bl	0 <clk_disable>
    71c0:	e1a00004 	mov	r0, r4
    71c4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    71c8:	e245200a 	sub	r2, r5, #10
    71cc:	e3520004 	cmp	r2, #4
    71d0:	8affffd4 	bhi	7128 <ipu_request_irq+0x9c>
    71d4:	eaffffd1 	b	7120 <ipu_request_irq+0x94>
    71d8:	e7f001f2 	udf	#18
    71dc:	e2863a01 	add	r3, r6, #4096	; 0x1000
    71e0:	e3001000 	movw	r1, #0
    71e4:	e1a02004 	mov	r2, r4
    71e8:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    71ec:	e3401000 	movt	r1, #0
    71f0:	e3e04015 	mvn	r4, #21
    71f4:	ebfffffe 	bl	0 <dev_err>
    71f8:	eaffffeb 	b	71ac <ipu_request_irq+0x120>
    71fc:	e2863a01 	add	r3, r6, #4096	; 0x1000
    7200:	e3001000 	movw	r1, #0
    7204:	e1a02004 	mov	r2, r4
    7208:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    720c:	e3401000 	movt	r1, #0
    7210:	e3e04015 	mvn	r4, #21
    7214:	ebfffffe 	bl	0 <dev_err>
    7218:	eaffffe3 	b	71ac <ipu_request_irq+0x120>
    721c:	00000210 	andeq	r0, r0, r0, lsl r2

00007220 <ipu_free_irq>:
    7220:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7224:	e3006000 	movw	r6, #0
    7228:	e30034aa 	movw	r3, #1194	; 0x4aa
    722c:	e3406000 	movt	r6, #0
    7230:	e24dd00c 	sub	sp, sp, #12
    7234:	e1a05000 	mov	r5, r0
    7238:	e19630b3 	ldrh	r3, [r6, r3]
    723c:	e1a07001 	mov	r7, r1
    7240:	e1a09002 	mov	r9, r2
    7244:	e3130004 	tst	r3, #4
    7248:	0a000004 	beq	7260 <ipu_free_irq+0x40>
    724c:	e3001000 	movw	r1, #0
    7250:	e59f20f4 	ldr	r2, [pc, #244]	; 734c <ipu_free_irq+0x12c>
    7254:	e3401000 	movt	r1, #0
    7258:	e59f00f0 	ldr	r0, [pc, #240]	; 7350 <ipu_free_irq+0x130>
    725c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7260:	e1a00005 	mov	r0, r5
    7264:	ebfffffe 	bl	61e0 <_ipu_get>
    7268:	e30034c2 	movw	r3, #1218	; 0x4c2
    726c:	e19630b3 	ldrh	r3, [r6, r3]
    7270:	e3130004 	tst	r3, #4
    7274:	0a000003 	beq	7288 <ipu_free_irq+0x68>
    7278:	e3001000 	movw	r1, #0
    727c:	e59f00d0 	ldr	r0, [pc, #208]	; 7354 <ipu_free_irq+0x134>
    7280:	e3401000 	movt	r1, #0
    7284:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7288:	e285ad79 	add	sl, r5, #7744	; 0x1e40
    728c:	e1a042a7 	lsr	r4, r7, #5
    7290:	e28aa01c 	add	sl, sl, #28
    7294:	e285ba01 	add	fp, r5, #4096	; 0x1000
    7298:	e1a0000a 	mov	r0, sl
    729c:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    72a0:	e284400f 	add	r4, r4, #15
    72a4:	e59b3d48 	ldr	r3, [fp, #3400]	; 0xd48
    72a8:	e1a04104 	lsl	r4, r4, #2
    72ac:	e1a08000 	mov	r8, r0
    72b0:	e0833004 	add	r3, r3, r4
    72b4:	e5932000 	ldr	r2, [r3]
    72b8:	f57ff04f 	dsb	sy
    72bc:	e3a01001 	mov	r1, #1
    72c0:	e207301f 	and	r3, r7, #31
    72c4:	e1c22311 	bic	r2, r2, r1, lsl r3
    72c8:	e58d2004 	str	r2, [sp, #4]
    72cc:	f57ff04e 	dsb	st
    72d0:	ebfffffe 	bl	0 <arm_heavy_mb>
    72d4:	e59b3d48 	ldr	r3, [fp, #3400]	; 0xd48
    72d8:	e59d2004 	ldr	r2, [sp, #4]
    72dc:	e0834004 	add	r4, r3, r4
    72e0:	e5842000 	str	r2, [r4]
    72e4:	e2873005 	add	r3, r7, #5
    72e8:	e7953203 	ldr	r3, [r5, r3, lsl #4]
    72ec:	e1530009 	cmp	r3, r9
    72f0:	0a00000e 	beq	7330 <ipu_free_irq+0x110>
    72f4:	e1a01008 	mov	r1, r8
    72f8:	e1a0000a 	mov	r0, sl
    72fc:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    7300:	e595000c 	ldr	r0, [r5, #12]
    7304:	ebfffffe 	bl	0 <clk_disable>
    7308:	e30034da 	movw	r3, #1242	; 0x4da
    730c:	e19630b3 	ldrh	r3, [r6, r3]
    7310:	e3130004 	tst	r3, #4
    7314:	0a00000a 	beq	7344 <ipu_free_irq+0x124>
    7318:	e3001000 	movw	r1, #0
    731c:	e59f0034 	ldr	r0, [pc, #52]	; 7358 <ipu_free_irq+0x138>
    7320:	e3401000 	movt	r1, #0
    7324:	e28dd00c 	add	sp, sp, #12
    7328:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    732c:	eafffffe 	b	0 <__dynamic_pr_debug>
    7330:	e0850207 	add	r0, r5, r7, lsl #4
    7334:	e3a01010 	mov	r1, #16
    7338:	e2800048 	add	r0, r0, #72	; 0x48
    733c:	ebfffffe 	bl	0 <__memzero>
    7340:	eaffffeb 	b	72f4 <ipu_free_irq+0xd4>
    7344:	e28dd00c 	add	sp, sp, #12
    7348:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    734c:	00000220 	andeq	r0, r0, r0, lsr #4
    7350:	00000498 	muleq	r0, r8, r4
    7354:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
    7358:	000004c8 	andeq	r0, r0, r8, asr #9

0000735c <ipu_channel_status>:
    735c:	e92d4070 	push	{r4, r5, r6, lr}
    7360:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    7364:	e2855008 	add	r5, r5, #8
    7368:	e24dd008 	sub	sp, sp, #8
    736c:	e1a04000 	mov	r4, r0
    7370:	e1a06001 	mov	r6, r1
    7374:	ebfffffe 	bl	61e0 <_ipu_get>
    7378:	e1a00005 	mov	r0, r5
    737c:	ebfffffe 	bl	0 <mutex_lock>
    7380:	e1a01006 	mov	r1, r6
    7384:	e1a00004 	mov	r0, r4
    7388:	ebfffffe 	bl	560 <ipu_is_channel_busy>
    738c:	e1a06000 	mov	r6, r0
    7390:	e1a00005 	mov	r0, r5
    7394:	ebfffffe 	bl	0 <mutex_unlock>
    7398:	e594000c 	ldr	r0, [r4, #12]
    739c:	ebfffffe 	bl	0 <clk_disable>
    73a0:	e3000000 	movw	r0, #0
    73a4:	e30034f2 	movw	r3, #1266	; 0x4f2
    73a8:	e3400000 	movt	r0, #0
    73ac:	e19030b3 	ldrh	r3, [r0, r3]
    73b0:	e3130004 	tst	r3, #4
    73b4:	0a000007 	beq	73d8 <ipu_channel_status+0x7c>
    73b8:	e2844a01 	add	r4, r4, #4096	; 0x1000
    73bc:	e3002000 	movw	r2, #0
    73c0:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    73c4:	e2800e4e 	add	r0, r0, #1248	; 0x4e0
    73c8:	e58d6000 	str	r6, [sp]
    73cc:	e3402000 	movt	r2, #0
    73d0:	e59f300c 	ldr	r3, [pc, #12]	; 73e4 <ipu_channel_status+0x88>
    73d4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    73d8:	e1a00006 	mov	r0, r6
    73dc:	e28dd008 	add	sp, sp, #8
    73e0:	e8bd8070 	pop	{r4, r5, r6, pc}
    73e4:	00000230 	andeq	r0, r0, r0, lsr r2

000073e8 <ipu_ch_param_get_axi_id>:
    73e8:	e0822082 	add	r2, r2, r2, lsl #1
    73ec:	e92d4070 	push	{r4, r5, r6, lr}
    73f0:	e1a02082 	lsl	r2, r2, #1
    73f4:	e1a01231 	lsr	r1, r1, r2
    73f8:	e201403f 	and	r4, r1, #63	; 0x3f
    73fc:	e354003f 	cmp	r4, #63	; 0x3f
    7400:	0a000013 	beq	7454 <ipu_ch_param_get_axi_id+0x6c>
    7404:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    7408:	e1a05000 	mov	r5, r0
    740c:	e2866008 	add	r6, r6, #8
    7410:	e1a04304 	lsl	r4, r4, #6
    7414:	ebfffffe 	bl	61e0 <_ipu_get>
    7418:	e1a00006 	mov	r0, r6
    741c:	e2844028 	add	r4, r4, #40	; 0x28
    7420:	ebfffffe 	bl	0 <mutex_lock>
    7424:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7428:	e5933d78 	ldr	r3, [r3, #3448]	; 0xd78
    742c:	e0834004 	add	r4, r3, r4
    7430:	e5944000 	ldr	r4, [r4]
    7434:	f57ff04f 	dsb	sy
    7438:	e1a00006 	mov	r0, r6
    743c:	e7e14ed4 	ubfx	r4, r4, #29, #2
    7440:	ebfffffe 	bl	0 <mutex_unlock>
    7444:	e595000c 	ldr	r0, [r5, #12]
    7448:	ebfffffe 	bl	0 <clk_disable>
    744c:	e1a00004 	mov	r0, r4
    7450:	e8bd8070 	pop	{r4, r5, r6, pc}
    7454:	e3e04015 	mvn	r4, #21
    7458:	eafffffb 	b	744c <ipu_ch_param_get_axi_id+0x64>

0000745c <_ipu_put>:
    745c:	eafffffe 	b	c88 <ipu_disable_hsp_clk>

00007460 <ipu_dump_registers>:
    7460:	e92d4070 	push	{r4, r5, r6, lr}
    7464:	e3006000 	movw	r6, #0
    7468:	e300350a 	movw	r3, #1290	; 0x50a
    746c:	e3406000 	movt	r6, #0
    7470:	e1a04000 	mov	r4, r0
    7474:	e19630b3 	ldrh	r3, [r6, r3]
    7478:	e3130004 	tst	r3, #4
    747c:	0a000003 	beq	7490 <ipu_dump_registers+0x30>
    7480:	e3001000 	movw	r1, #0
    7484:	e59f054c 	ldr	r0, [pc, #1356]	; 79d8 <ipu_dump_registers+0x578>
    7488:	e3401000 	movt	r1, #0
    748c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7490:	e3003522 	movw	r3, #1314	; 0x522
    7494:	e19630b3 	ldrh	r3, [r6, r3]
    7498:	e3130004 	tst	r3, #4
    749c:	0a000008 	beq	74c4 <ipu_dump_registers+0x64>
    74a0:	e2843a01 	add	r3, r4, #4096	; 0x1000
    74a4:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    74a8:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    74ac:	e5933000 	ldr	r3, [r3]
    74b0:	f57ff04f 	dsb	sy
    74b4:	e3002000 	movw	r2, #0
    74b8:	e59f051c 	ldr	r0, [pc, #1308]	; 79dc <ipu_dump_registers+0x57c>
    74bc:	e3402000 	movt	r2, #0
    74c0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    74c4:	e300353a 	movw	r3, #1338	; 0x53a
    74c8:	e19630b3 	ldrh	r3, [r6, r3]
    74cc:	e3130004 	tst	r3, #4
    74d0:	0a000008 	beq	74f8 <ipu_dump_registers+0x98>
    74d4:	e2843a01 	add	r3, r4, #4096	; 0x1000
    74d8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    74dc:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    74e0:	e5933000 	ldr	r3, [r3]
    74e4:	f57ff04f 	dsb	sy
    74e8:	e3002000 	movw	r2, #0
    74ec:	e59f04ec 	ldr	r0, [pc, #1260]	; 79e0 <ipu_dump_registers+0x580>
    74f0:	e3402000 	movt	r2, #0
    74f4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    74f8:	e3003552 	movw	r3, #1362	; 0x552
    74fc:	e19630b3 	ldrh	r3, [r6, r3]
    7500:	e3130004 	tst	r3, #4
    7504:	0a000008 	beq	752c <ipu_dump_registers+0xcc>
    7508:	e2843a01 	add	r3, r4, #4096	; 0x1000
    750c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7510:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    7514:	e5933004 	ldr	r3, [r3, #4]
    7518:	f57ff04f 	dsb	sy
    751c:	e3002000 	movw	r2, #0
    7520:	e59f04bc 	ldr	r0, [pc, #1212]	; 79e4 <ipu_dump_registers+0x584>
    7524:	e3402000 	movt	r2, #0
    7528:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    752c:	e300356a 	movw	r3, #1386	; 0x56a
    7530:	e19630b3 	ldrh	r3, [r6, r3]
    7534:	e3130004 	tst	r3, #4
    7538:	0a000008 	beq	7560 <ipu_dump_registers+0x100>
    753c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7540:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7544:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    7548:	e5933008 	ldr	r3, [r3, #8]
    754c:	f57ff04f 	dsb	sy
    7550:	e3002000 	movw	r2, #0
    7554:	e59f048c 	ldr	r0, [pc, #1164]	; 79e8 <ipu_dump_registers+0x588>
    7558:	e3402000 	movt	r2, #0
    755c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7560:	e3003582 	movw	r3, #1410	; 0x582
    7564:	e19630b3 	ldrh	r3, [r6, r3]
    7568:	e3130004 	tst	r3, #4
    756c:	0a000008 	beq	7594 <ipu_dump_registers+0x134>
    7570:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7574:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7578:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    757c:	e5933014 	ldr	r3, [r3, #20]
    7580:	f57ff04f 	dsb	sy
    7584:	e3002000 	movw	r2, #0
    7588:	e59f045c 	ldr	r0, [pc, #1116]	; 79ec <ipu_dump_registers+0x58c>
    758c:	e3402000 	movt	r2, #0
    7590:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7594:	e300359a 	movw	r3, #1434	; 0x59a
    7598:	e19630b3 	ldrh	r3, [r6, r3]
    759c:	e3130004 	tst	r3, #4
    75a0:	0a000008 	beq	75c8 <ipu_dump_registers+0x168>
    75a4:	e2843a01 	add	r3, r4, #4096	; 0x1000
    75a8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    75ac:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    75b0:	e5933018 	ldr	r3, [r3, #24]
    75b4:	f57ff04f 	dsb	sy
    75b8:	e3002000 	movw	r2, #0
    75bc:	e59f042c 	ldr	r0, [pc, #1068]	; 79f0 <ipu_dump_registers+0x590>
    75c0:	e3402000 	movt	r2, #0
    75c4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    75c8:	e30035b2 	movw	r3, #1458	; 0x5b2
    75cc:	e19630b3 	ldrh	r3, [r6, r3]
    75d0:	e3130004 	tst	r3, #4
    75d4:	0a00000d 	beq	7610 <ipu_dump_registers+0x1b0>
    75d8:	e5942004 	ldr	r2, [r4, #4]
    75dc:	e2845a01 	add	r5, r4, #4096	; 0x1000
    75e0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    75e4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    75e8:	e3520000 	cmp	r2, #0
    75ec:	13a02040 	movne	r2, #64	; 0x40
    75f0:	03a02034 	moveq	r2, #52	; 0x34
    75f4:	e0833002 	add	r3, r3, r2
    75f8:	e5933000 	ldr	r3, [r3]
    75fc:	f57ff04f 	dsb	sy
    7600:	e3002000 	movw	r2, #0
    7604:	e59f03e8 	ldr	r0, [pc, #1000]	; 79f4 <ipu_dump_registers+0x594>
    7608:	e3402000 	movt	r2, #0
    760c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7610:	e30035ca 	movw	r3, #1482	; 0x5ca
    7614:	e19630b3 	ldrh	r3, [r6, r3]
    7618:	e3130004 	tst	r3, #4
    761c:	0a00000d 	beq	7658 <ipu_dump_registers+0x1f8>
    7620:	e5942004 	ldr	r2, [r4, #4]
    7624:	e2845a01 	add	r5, r4, #4096	; 0x1000
    7628:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    762c:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    7630:	e3520000 	cmp	r2, #0
    7634:	13a02044 	movne	r2, #68	; 0x44
    7638:	03a02038 	moveq	r2, #56	; 0x38
    763c:	e0833002 	add	r3, r3, r2
    7640:	e5933000 	ldr	r3, [r3]
    7644:	f57ff04f 	dsb	sy
    7648:	e3002000 	movw	r2, #0
    764c:	e59f03a4 	ldr	r0, [pc, #932]	; 79f8 <ipu_dump_registers+0x598>
    7650:	e3402000 	movt	r2, #0
    7654:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7658:	e30035e2 	movw	r3, #1506	; 0x5e2
    765c:	e19630b3 	ldrh	r3, [r6, r3]
    7660:	e3130004 	tst	r3, #4
    7664:	0a000008 	beq	768c <ipu_dump_registers+0x22c>
    7668:	e2843a01 	add	r3, r4, #4096	; 0x1000
    766c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7670:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7674:	e5933150 	ldr	r3, [r3, #336]	; 0x150
    7678:	f57ff04f 	dsb	sy
    767c:	e3002000 	movw	r2, #0
    7680:	e59f0374 	ldr	r0, [pc, #884]	; 79fc <ipu_dump_registers+0x59c>
    7684:	e3402000 	movt	r2, #0
    7688:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    768c:	e30035fa 	movw	r3, #1530	; 0x5fa
    7690:	e19630b3 	ldrh	r3, [r6, r3]
    7694:	e3130004 	tst	r3, #4
    7698:	0a000008 	beq	76c0 <ipu_dump_registers+0x260>
    769c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    76a0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    76a4:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    76a8:	e5933154 	ldr	r3, [r3, #340]	; 0x154
    76ac:	f57ff04f 	dsb	sy
    76b0:	e3002000 	movw	r2, #0
    76b4:	e59f0344 	ldr	r0, [pc, #836]	; 7a00 <ipu_dump_registers+0x5a0>
    76b8:	e3402000 	movt	r2, #0
    76bc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    76c0:	e5943004 	ldr	r3, [r4, #4]
    76c4:	e3530000 	cmp	r3, #0
    76c8:	0a00001d 	beq	7744 <ipu_dump_registers+0x2e4>
    76cc:	e3003612 	movw	r3, #1554	; 0x612
    76d0:	e19630b3 	ldrh	r3, [r6, r3]
    76d4:	e3130004 	tst	r3, #4
    76d8:	0a0000b6 	beq	79b8 <ipu_dump_registers+0x558>
    76dc:	e2845a01 	add	r5, r4, #4096	; 0x1000
    76e0:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    76e4:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    76e8:	e5933178 	ldr	r3, [r3, #376]	; 0x178
    76ec:	f57ff04f 	dsb	sy
    76f0:	e3002000 	movw	r2, #0
    76f4:	e59f0308 	ldr	r0, [pc, #776]	; 7a04 <ipu_dump_registers+0x5a4>
    76f8:	e3402000 	movt	r2, #0
    76fc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7700:	e300362a 	movw	r3, #1578	; 0x62a
    7704:	e19630b3 	ldrh	r3, [r6, r3]
    7708:	e3130004 	tst	r3, #4
    770c:	0a00000c 	beq	7744 <ipu_dump_registers+0x2e4>
    7710:	e5943004 	ldr	r3, [r4, #4]
    7714:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    7718:	e3530000 	cmp	r3, #0
    771c:	13a02f5f 	movne	r2, #380	; 0x17c
    7720:	03a02f4b 	moveq	r2, #300	; 0x12c
    7724:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7728:	e0833002 	add	r3, r3, r2
    772c:	e5933000 	ldr	r3, [r3]
    7730:	f57ff04f 	dsb	sy
    7734:	e3002000 	movw	r2, #0
    7738:	e59f02c8 	ldr	r0, [pc, #712]	; 7a08 <ipu_dump_registers+0x5a8>
    773c:	e3402000 	movt	r2, #0
    7740:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7744:	e3003642 	movw	r3, #1602	; 0x642
    7748:	e19630b3 	ldrh	r3, [r6, r3]
    774c:	e3130004 	tst	r3, #4
    7750:	0a000008 	beq	7778 <ipu_dump_registers+0x318>
    7754:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7758:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    775c:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    7760:	e5933004 	ldr	r3, [r3, #4]
    7764:	f57ff04f 	dsb	sy
    7768:	e3002000 	movw	r2, #0
    776c:	e59f0298 	ldr	r0, [pc, #664]	; 7a0c <ipu_dump_registers+0x5ac>
    7770:	e3402000 	movt	r2, #0
    7774:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7778:	e300365a 	movw	r3, #1626	; 0x65a
    777c:	e19630b3 	ldrh	r3, [r6, r3]
    7780:	e3130004 	tst	r3, #4
    7784:	0a000008 	beq	77ac <ipu_dump_registers+0x34c>
    7788:	e2843a01 	add	r3, r4, #4096	; 0x1000
    778c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7790:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    7794:	e5933008 	ldr	r3, [r3, #8]
    7798:	f57ff04f 	dsb	sy
    779c:	e3002000 	movw	r2, #0
    77a0:	e59f0268 	ldr	r0, [pc, #616]	; 7a10 <ipu_dump_registers+0x5b0>
    77a4:	e3402000 	movt	r2, #0
    77a8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    77ac:	e3003672 	movw	r3, #1650	; 0x672
    77b0:	e19630b3 	ldrh	r3, [r6, r3]
    77b4:	e3130004 	tst	r3, #4
    77b8:	0a000008 	beq	77e0 <ipu_dump_registers+0x380>
    77bc:	e2843a01 	add	r3, r4, #4096	; 0x1000
    77c0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    77c4:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    77c8:	e593300c 	ldr	r3, [r3, #12]
    77cc:	f57ff04f 	dsb	sy
    77d0:	e3002000 	movw	r2, #0
    77d4:	e59f0238 	ldr	r0, [pc, #568]	; 7a14 <ipu_dump_registers+0x5b4>
    77d8:	e3402000 	movt	r2, #0
    77dc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    77e0:	e300368a 	movw	r3, #1674	; 0x68a
    77e4:	e19630b3 	ldrh	r3, [r6, r3]
    77e8:	e3130004 	tst	r3, #4
    77ec:	0a000008 	beq	7814 <ipu_dump_registers+0x3b4>
    77f0:	e2843a01 	add	r3, r4, #4096	; 0x1000
    77f4:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    77f8:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    77fc:	e5933010 	ldr	r3, [r3, #16]
    7800:	f57ff04f 	dsb	sy
    7804:	e3002000 	movw	r2, #0
    7808:	e59f0208 	ldr	r0, [pc, #520]	; 7a18 <ipu_dump_registers+0x5b8>
    780c:	e3402000 	movt	r2, #0
    7810:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7814:	e30036a2 	movw	r3, #1698	; 0x6a2
    7818:	e19630b3 	ldrh	r3, [r6, r3]
    781c:	e3130004 	tst	r3, #4
    7820:	0a000008 	beq	7848 <ipu_dump_registers+0x3e8>
    7824:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7828:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    782c:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    7830:	e593301c 	ldr	r3, [r3, #28]
    7834:	f57ff04f 	dsb	sy
    7838:	e3002000 	movw	r2, #0
    783c:	e59f01d8 	ldr	r0, [pc, #472]	; 7a1c <ipu_dump_registers+0x5bc>
    7840:	e3402000 	movt	r2, #0
    7844:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7848:	e30036ba 	movw	r3, #1722	; 0x6ba
    784c:	e19630b3 	ldrh	r3, [r6, r3]
    7850:	e3130004 	tst	r3, #4
    7854:	0a000008 	beq	787c <ipu_dump_registers+0x41c>
    7858:	e2843a01 	add	r3, r4, #4096	; 0x1000
    785c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7860:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7864:	e59330a8 	ldr	r3, [r3, #168]	; 0xa8
    7868:	f57ff04f 	dsb	sy
    786c:	e3002000 	movw	r2, #0
    7870:	e59f01a8 	ldr	r0, [pc, #424]	; 7a20 <ipu_dump_registers+0x5c0>
    7874:	e3402000 	movt	r2, #0
    7878:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    787c:	e30036d2 	movw	r3, #1746	; 0x6d2
    7880:	e19630b3 	ldrh	r3, [r6, r3]
    7884:	e3130004 	tst	r3, #4
    7888:	0a000008 	beq	78b0 <ipu_dump_registers+0x450>
    788c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7890:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7894:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7898:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
    789c:	f57ff04f 	dsb	sy
    78a0:	e3002000 	movw	r2, #0
    78a4:	e59f0178 	ldr	r0, [pc, #376]	; 7a24 <ipu_dump_registers+0x5c4>
    78a8:	e3402000 	movt	r2, #0
    78ac:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    78b0:	e30036ea 	movw	r3, #1770	; 0x6ea
    78b4:	e19630b3 	ldrh	r3, [r6, r3]
    78b8:	e3130004 	tst	r3, #4
    78bc:	0a000008 	beq	78e4 <ipu_dump_registers+0x484>
    78c0:	e2843a01 	add	r3, r4, #4096	; 0x1000
    78c4:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    78c8:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    78cc:	e59330b0 	ldr	r3, [r3, #176]	; 0xb0
    78d0:	f57ff04f 	dsb	sy
    78d4:	e3002000 	movw	r2, #0
    78d8:	e59f0148 	ldr	r0, [pc, #328]	; 7a28 <ipu_dump_registers+0x5c8>
    78dc:	e3402000 	movt	r2, #0
    78e0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    78e4:	e3003702 	movw	r3, #1794	; 0x702
    78e8:	e19630b3 	ldrh	r3, [r6, r3]
    78ec:	e3130004 	tst	r3, #4
    78f0:	0a000008 	beq	7918 <ipu_dump_registers+0x4b8>
    78f4:	e2843a01 	add	r3, r4, #4096	; 0x1000
    78f8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    78fc:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7900:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
    7904:	f57ff04f 	dsb	sy
    7908:	e3002000 	movw	r2, #0
    790c:	e59f0118 	ldr	r0, [pc, #280]	; 7a2c <ipu_dump_registers+0x5cc>
    7910:	e3402000 	movt	r2, #0
    7914:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7918:	e300371a 	movw	r3, #1818	; 0x71a
    791c:	e19630b3 	ldrh	r3, [r6, r3]
    7920:	e3130004 	tst	r3, #4
    7924:	0a000008 	beq	794c <ipu_dump_registers+0x4ec>
    7928:	e2843a01 	add	r3, r4, #4096	; 0x1000
    792c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7930:	e5933d80 	ldr	r3, [r3, #3456]	; 0xd80
    7934:	e5933000 	ldr	r3, [r3]
    7938:	f57ff04f 	dsb	sy
    793c:	e3002000 	movw	r2, #0
    7940:	e59f00e8 	ldr	r0, [pc, #232]	; 7a30 <ipu_dump_registers+0x5d0>
    7944:	e3402000 	movt	r2, #0
    7948:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    794c:	e3003732 	movw	r3, #1842	; 0x732
    7950:	e19630b3 	ldrh	r3, [r6, r3]
    7954:	e3130004 	tst	r3, #4
    7958:	0a000008 	beq	7980 <ipu_dump_registers+0x520>
    795c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    7960:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7964:	e5933d80 	ldr	r3, [r3, #3456]	; 0xd80
    7968:	e5933004 	ldr	r3, [r3, #4]
    796c:	f57ff04f 	dsb	sy
    7970:	e3002000 	movw	r2, #0
    7974:	e59f00b8 	ldr	r0, [pc, #184]	; 7a34 <ipu_dump_registers+0x5d4>
    7978:	e3402000 	movt	r2, #0
    797c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7980:	e300374a 	movw	r3, #1866	; 0x74a
    7984:	e19630b3 	ldrh	r3, [r6, r3]
    7988:	e3130004 	tst	r3, #4
    798c:	08bd8070 	popeq	{r4, r5, r6, pc}
    7990:	e2844a01 	add	r4, r4, #4096	; 0x1000
    7994:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    7998:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    799c:	e5933000 	ldr	r3, [r3]
    79a0:	f57ff04f 	dsb	sy
    79a4:	e3002000 	movw	r2, #0
    79a8:	e59f0088 	ldr	r0, [pc, #136]	; 7a38 <ipu_dump_registers+0x5d8>
    79ac:	e3402000 	movt	r2, #0
    79b0:	e8bd4070 	pop	{r4, r5, r6, lr}
    79b4:	eafffffe 	b	0 <__dynamic_dev_dbg>
    79b8:	e300362a 	movw	r3, #1578	; 0x62a
    79bc:	e19630b3 	ldrh	r3, [r6, r3]
    79c0:	e3130004 	tst	r3, #4
    79c4:	0affff5e 	beq	7744 <ipu_dump_registers+0x2e4>
    79c8:	e2845a01 	add	r5, r4, #4096	; 0x1000
    79cc:	e3a02f5f 	mov	r2, #380	; 0x17c
    79d0:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    79d4:	eaffff52 	b	7724 <ipu_dump_registers+0x2c4>
    79d8:	000004f8 	strdeq	r0, [r0], -r8
    79dc:	00000510 	andeq	r0, r0, r0, lsl r5
    79e0:	00000528 	andeq	r0, r0, r8, lsr #10
    79e4:	00000540 	andeq	r0, r0, r0, asr #10
    79e8:	00000558 	andeq	r0, r0, r8, asr r5
    79ec:	00000570 	andeq	r0, r0, r0, ror r5
    79f0:	00000588 	andeq	r0, r0, r8, lsl #11
    79f4:	000005a0 	andeq	r0, r0, r0, lsr #11
    79f8:	000005b8 			; <UNDEFINED> instruction: 0x000005b8
    79fc:	000005d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    7a00:	000005e8 	andeq	r0, r0, r8, ror #11
    7a04:	00000600 	andeq	r0, r0, r0, lsl #12
    7a08:	00000618 	andeq	r0, r0, r8, lsl r6
    7a0c:	00000630 	andeq	r0, r0, r0, lsr r6
    7a10:	00000648 	andeq	r0, r0, r8, asr #12
    7a14:	00000660 	andeq	r0, r0, r0, ror #12
    7a18:	00000678 	andeq	r0, r0, r8, ror r6
    7a1c:	00000690 	muleq	r0, r0, r6
    7a20:	000006a8 	andeq	r0, r0, r8, lsr #13
    7a24:	000006c0 	andeq	r0, r0, r0, asr #13
    7a28:	000006d8 	ldrdeq	r0, [r0], -r8
    7a2c:	000006f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    7a30:	00000708 	andeq	r0, r0, r8, lsl #14
    7a34:	00000720 	andeq	r0, r0, r0, lsr #14
    7a38:	00000738 	andeq	r0, r0, r8, lsr r7

00007a3c <_ipu_clear_buffer_ready>:
    7a3c:	e0822082 	add	r2, r2, r2, lsl #1
    7a40:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    7a44:	e1a02082 	lsl	r2, r2, #1
    7a48:	e1a04231 	lsr	r4, r1, r2
    7a4c:	e204503f 	and	r5, r4, #63	; 0x3f
    7a50:	e355003f 	cmp	r5, #63	; 0x3f
    7a54:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    7a58:	e1a07003 	mov	r7, r3
    7a5c:	e1a06000 	mov	r6, r0
    7a60:	f57ff04e 	dsb	st
    7a64:	ebfffffe 	bl	0 <arm_heavy_mb>
    7a68:	e2868a01 	add	r8, r6, #4096	; 0x1000
    7a6c:	e3a03000 	mov	r3, #0
    7a70:	e5982d48 	ldr	r2, [r8, #3400]	; 0xd48
    7a74:	e34f3030 	movt	r3, #61488	; 0xf030
    7a78:	e58230e4 	str	r3, [r2, #228]	; 0xe4
    7a7c:	e3570000 	cmp	r7, #0
    7a80:	e204401f 	and	r4, r4, #31
    7a84:	e3a01001 	mov	r1, #1
    7a88:	e1a04411 	lsl	r4, r1, r4
    7a8c:	1a000010 	bne	7ad4 <_ipu_clear_buffer_ready+0x98>
    7a90:	e5963004 	ldr	r3, [r6, #4]
    7a94:	e1a052a5 	lsr	r5, r5, #5
    7a98:	e3530000 	cmp	r3, #0
    7a9c:	1285509a 	addne	r5, r5, #154	; 0x9a
    7aa0:	02855050 	addeq	r5, r5, #80	; 0x50
    7aa4:	e1a05105 	lsl	r5, r5, #2
    7aa8:	f57ff04e 	dsb	st
    7aac:	ebfffffe 	bl	0 <arm_heavy_mb>
    7ab0:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    7ab4:	e0835005 	add	r5, r3, r5
    7ab8:	e5854000 	str	r4, [r5]
    7abc:	f57ff04e 	dsb	st
    7ac0:	ebfffffe 	bl	0 <arm_heavy_mb>
    7ac4:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    7ac8:	e3a02000 	mov	r2, #0
    7acc:	e58320e4 	str	r2, [r3, #228]	; 0xe4
    7ad0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    7ad4:	e3570001 	cmp	r7, #1
    7ad8:	e5963004 	ldr	r3, [r6, #4]
    7adc:	0a000005 	beq	7af8 <_ipu_clear_buffer_ready+0xbc>
    7ae0:	e3530000 	cmp	r3, #0
    7ae4:	11a052a5 	lsrne	r5, r5, #5
    7ae8:	03a05f4b 	moveq	r5, #300	; 0x12c
    7aec:	128550a2 	addne	r5, r5, #162	; 0xa2
    7af0:	11a05105 	lslne	r5, r5, #2
    7af4:	eaffffeb 	b	7aa8 <_ipu_clear_buffer_ready+0x6c>
    7af8:	e1a052a5 	lsr	r5, r5, #5
    7afc:	e3530000 	cmp	r3, #0
    7b00:	1285509c 	addne	r5, r5, #156	; 0x9c
    7b04:	02855052 	addeq	r5, r5, #82	; 0x52
    7b08:	e1a05105 	lsl	r5, r5, #2
    7b0c:	eaffffe5 	b	7aa8 <_ipu_clear_buffer_ready+0x6c>

00007b10 <ipu_clear_buffer_ready>:
    7b10:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7b14:	e2804d79 	add	r4, r0, #7744	; 0x1e40
    7b18:	e2844020 	add	r4, r4, #32
    7b1c:	e1a05000 	mov	r5, r0
    7b20:	e1a07001 	mov	r7, r1
    7b24:	e1a08002 	mov	r8, r2
    7b28:	e1a09003 	mov	r9, r3
    7b2c:	e1a00004 	mov	r0, r4
    7b30:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    7b34:	e1a01007 	mov	r1, r7
    7b38:	e1a06000 	mov	r6, r0
    7b3c:	e1a03009 	mov	r3, r9
    7b40:	e1a00005 	mov	r0, r5
    7b44:	e1a02008 	mov	r2, r8
    7b48:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7b4c:	e1a01006 	mov	r1, r6
    7b50:	e1a00004 	mov	r0, r4
    7b54:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    7b58:	eafffffe 	b	0 <_raw_spin_unlock_irqrestore>

00007b5c <ipu_disable_channel>:
    7b5c:	e2803d79 	add	r3, r0, #7744	; 0x1e40
    7b60:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7b64:	e2833008 	add	r3, r3, #8
    7b68:	e1a0a001 	mov	sl, r1
    7b6c:	e24dd07c 	sub	sp, sp, #124	; 0x7c
    7b70:	e2805a01 	add	r5, r0, #4096	; 0x1000
    7b74:	e1a04000 	mov	r4, r0
    7b78:	e1a00003 	mov	r0, r3
    7b7c:	e1a06002 	mov	r6, r2
    7b80:	e58d3024 	str	r3, [sp, #36]	; 0x24
    7b84:	ebfffffe 	bl	0 <mutex_lock>
    7b88:	e1a03c4a 	asr	r3, sl, #24
    7b8c:	e3a02001 	mov	r2, #1
    7b90:	e5951e18 	ldr	r1, [r5, #3608]	; 0xe18
    7b94:	e1a00312 	lsl	r0, r2, r3
    7b98:	e1100001 	tst	r0, r1
    7b9c:	e58d0034 	str	r0, [sp, #52]	; 0x34
    7ba0:	0a000310 	beq	87e8 <ipu_disable_channel+0xc8c>
    7ba4:	e1a0c92a 	lsr	ip, sl, #18
    7ba8:	e20ae03f 	and	lr, sl, #63	; 0x3f
    7bac:	e58de014 	str	lr, [sp, #20]
    7bb0:	e20c003f 	and	r0, ip, #63	; 0x3f
    7bb4:	e58dc030 	str	ip, [sp, #48]	; 0x30
    7bb8:	e350003f 	cmp	r0, #63	; 0x3f
    7bbc:	e58d0010 	str	r0, [sp, #16]
    7bc0:	0a00000d 	beq	7bfc <ipu_disable_channel+0xa0>
    7bc4:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    7bc8:	e1a002a0 	lsr	r0, r0, #5
    7bcc:	e2800001 	add	r0, r0, #1
    7bd0:	e0811100 	add	r1, r1, r0, lsl #2
    7bd4:	e5911000 	ldr	r1, [r1]
    7bd8:	f57ff04f 	dsb	sy
    7bdc:	e20c001f 	and	r0, ip, #31
    7be0:	e0011012 	and	r1, r1, r2, lsl r0
    7be4:	e25e003f 	subs	r0, lr, #63	; 0x3f
    7be8:	13a00001 	movne	r0, #1
    7bec:	e3510000 	cmp	r1, #0
    7bf0:	13a00000 	movne	r0, #0
    7bf4:	e3500000 	cmp	r0, #0
    7bf8:	1a00010f 	bne	803c <ipu_disable_channel+0x4e0>
    7bfc:	e0843003 	add	r3, r4, r3
    7c00:	e1a02003 	mov	r2, r3
    7c04:	e58d3004 	str	r3, [sp, #4]
    7c08:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    7c0c:	e7d23003 	ldrb	r3, [r2, r3]
    7c10:	e59d2004 	ldr	r2, [sp, #4]
    7c14:	e3530000 	cmp	r3, #0
    7c18:	17e5365a 	ubfxne	r3, sl, #12, #6
    7c1c:	03a0303f 	moveq	r3, #63	; 0x3f
    7c20:	e58d3018 	str	r3, [sp, #24]
    7c24:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    7c28:	e7d23003 	ldrb	r3, [r2, r3]
    7c2c:	e3530000 	cmp	r3, #0
    7c30:	e58d301c 	str	r3, [sp, #28]
    7c34:	03a0303f 	moveq	r3, #63	; 0x3f
    7c38:	058d3020 	streq	r3, [sp, #32]
    7c3c:	0a000006 	beq	7c5c <ipu_disable_channel+0x100>
    7c40:	e7e5335a 	ubfx	r3, sl, #6, #6
    7c44:	e7e5265a 	ubfx	r2, sl, #12, #6
    7c48:	e58d3020 	str	r3, [sp, #32]
    7c4c:	e253303f 	subs	r3, r3, #63	; 0x3f
    7c50:	13a03001 	movne	r3, #1
    7c54:	e58d2018 	str	r2, [sp, #24]
    7c58:	e58d301c 	str	r3, [sp, #28]
    7c5c:	e30f2cff 	movw	r2, #64767	; 0xfcff
    7c60:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    7c64:	e340295f 	movt	r2, #2399	; 0x95f
    7c68:	e3403a6f 	movt	r3, #2671	; 0xa6f
    7c6c:	e15a0003 	cmp	sl, r3
    7c70:	115a0002 	cmpne	sl, r2
    7c74:	03a02001 	moveq	r2, #1
    7c78:	13a02000 	movne	r2, #0
    7c7c:	e58d2038 	str	r2, [sp, #56]	; 0x38
    7c80:	0a0000d4 	beq	7fd8 <ipu_disable_channel+0x47c>
    7c84:	e30f3fff 	movw	r3, #65535	; 0xffff
    7c88:	e3403773 	movt	r3, #1907	; 0x773
    7c8c:	e15a0003 	cmp	sl, r3
    7c90:	0a0000d2 	beq	7fe0 <ipu_disable_channel+0x484>
    7c94:	e59d3014 	ldr	r3, [sp, #20]
    7c98:	e3530003 	cmp	r3, #3
    7c9c:	93a06000 	movls	r6, #0
    7ca0:	82066001 	andhi	r6, r6, #1
    7ca4:	e3560000 	cmp	r6, #0
    7ca8:	1a00018c 	bne	82e0 <ipu_disable_channel+0x784>
    7cac:	e59d1010 	ldr	r1, [sp, #16]
    7cb0:	e2413011 	sub	r3, r1, #17
    7cb4:	e241200b 	sub	r2, r1, #11
    7cb8:	e3530001 	cmp	r3, #1
    7cbc:	83a03001 	movhi	r3, #1
    7cc0:	93a03000 	movls	r3, #0
    7cc4:	e352000b 	cmp	r2, #11
    7cc8:	83a03000 	movhi	r3, #0
    7ccc:	e3530000 	cmp	r3, #0
    7cd0:	1a000010 	bne	7d18 <ipu_disable_channel+0x1bc>
    7cd4:	e59d0014 	ldr	r0, [sp, #20]
    7cd8:	e240300b 	sub	r3, r0, #11
    7cdc:	e2402011 	sub	r2, r0, #17
    7ce0:	e353000b 	cmp	r3, #11
    7ce4:	93a03001 	movls	r3, #1
    7ce8:	83a03000 	movhi	r3, #0
    7cec:	e3520001 	cmp	r2, #1
    7cf0:	93a03000 	movls	r3, #0
    7cf4:	e3530000 	cmp	r3, #0
    7cf8:	1a000006 	bne	7d18 <ipu_disable_channel+0x1bc>
    7cfc:	e241302d 	sub	r3, r1, #45	; 0x2d
    7d00:	e3530005 	cmp	r3, #5
    7d04:	9a000003 	bls	7d18 <ipu_disable_channel+0x1bc>
    7d08:	e240302d 	sub	r3, r0, #45	; 0x2d
    7d0c:	e3500005 	cmp	r0, #5
    7d10:	13530005 	cmpne	r3, #5
    7d14:	8a000002 	bhi	7d24 <ipu_disable_channel+0x1c8>
    7d18:	e1a0100a 	mov	r1, sl
    7d1c:	e1a00004 	mov	r0, r4
    7d20:	ebfffffe 	bl	0 <_ipu_ic_disable_task>
    7d24:	e59d3010 	ldr	r3, [sp, #16]
    7d28:	e353003f 	cmp	r3, #63	; 0x3f
    7d2c:	0a000029 	beq	7dd8 <ipu_disable_channel+0x27c>
    7d30:	e1a062a3 	lsr	r6, r3, #5
    7d34:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7d38:	e2866001 	add	r6, r6, #1
    7d3c:	e1a06106 	lsl	r6, r6, #2
    7d40:	e0833006 	add	r3, r3, r6
    7d44:	e5938000 	ldr	r8, [r3]
    7d48:	f57ff04f 	dsb	sy
    7d4c:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    7d50:	e3a07001 	mov	r7, #1
    7d54:	e203301f 	and	r3, r3, #31
    7d58:	e1a07317 	lsl	r7, r7, r3
    7d5c:	e1c88007 	bic	r8, r8, r7
    7d60:	f57ff04e 	dsb	st
    7d64:	ebfffffe 	bl	0 <arm_heavy_mb>
    7d68:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7d6c:	e0833006 	add	r3, r3, r6
    7d70:	e5838000 	str	r8, [r3]
    7d74:	e5943004 	ldr	r3, [r4, #4]
    7d78:	e3530000 	cmp	r3, #0
    7d7c:	12866f8e 	addne	r6, r6, #568	; 0x238
    7d80:	02866e12 	addeq	r6, r6, #288	; 0x120
    7d84:	f57ff04e 	dsb	st
    7d88:	ebfffffe 	bl	0 <arm_heavy_mb>
    7d8c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7d90:	e0836006 	add	r6, r3, r6
    7d94:	e5867000 	str	r7, [r6]
    7d98:	e59d3010 	ldr	r3, [sp, #16]
    7d9c:	e3a07003 	mov	r7, #3
    7da0:	e5941004 	ldr	r1, [r4, #4]
    7da4:	e1a03083 	lsl	r3, r3, #1
    7da8:	e3510000 	cmp	r1, #0
    7dac:	03a06f4b 	moveq	r6, #300	; 0x12c
    7db0:	11a062a3 	lsrne	r6, r3, #5
    7db4:	e203201e 	and	r2, r3, #30
    7db8:	e1a07217 	lsl	r7, r7, r2
    7dbc:	12866096 	addne	r6, r6, #150	; 0x96
    7dc0:	11a06106 	lslne	r6, r6, #2
    7dc4:	f57ff04e 	dsb	st
    7dc8:	ebfffffe 	bl	0 <arm_heavy_mb>
    7dcc:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7dd0:	e0836006 	add	r6, r3, r6
    7dd4:	e5867000 	str	r7, [r6]
    7dd8:	e59d3014 	ldr	r3, [sp, #20]
    7ddc:	e353003f 	cmp	r3, #63	; 0x3f
    7de0:	0a000028 	beq	7e88 <ipu_disable_channel+0x32c>
    7de4:	e1a062a3 	lsr	r6, r3, #5
    7de8:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7dec:	e2866001 	add	r6, r6, #1
    7df0:	e1a06106 	lsl	r6, r6, #2
    7df4:	e0833006 	add	r3, r3, r6
    7df8:	e5938000 	ldr	r8, [r3]
    7dfc:	f57ff04f 	dsb	sy
    7e00:	e3a07001 	mov	r7, #1
    7e04:	e20a301f 	and	r3, sl, #31
    7e08:	e1a07317 	lsl	r7, r7, r3
    7e0c:	e1c88007 	bic	r8, r8, r7
    7e10:	f57ff04e 	dsb	st
    7e14:	ebfffffe 	bl	0 <arm_heavy_mb>
    7e18:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7e1c:	e0833006 	add	r3, r3, r6
    7e20:	e5838000 	str	r8, [r3]
    7e24:	e5943004 	ldr	r3, [r4, #4]
    7e28:	e3530000 	cmp	r3, #0
    7e2c:	12866f8e 	addne	r6, r6, #568	; 0x238
    7e30:	02866e12 	addeq	r6, r6, #288	; 0x120
    7e34:	f57ff04e 	dsb	st
    7e38:	ebfffffe 	bl	0 <arm_heavy_mb>
    7e3c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7e40:	e0836006 	add	r6, r3, r6
    7e44:	e5867000 	str	r7, [r6]
    7e48:	e59d3014 	ldr	r3, [sp, #20]
    7e4c:	e3a07003 	mov	r7, #3
    7e50:	e5941004 	ldr	r1, [r4, #4]
    7e54:	e1a03083 	lsl	r3, r3, #1
    7e58:	e3510000 	cmp	r1, #0
    7e5c:	03a06f4b 	moveq	r6, #300	; 0x12c
    7e60:	11a062a3 	lsrne	r6, r3, #5
    7e64:	e203201e 	and	r2, r3, #30
    7e68:	e1a07217 	lsl	r7, r7, r2
    7e6c:	12866096 	addne	r6, r6, #150	; 0x96
    7e70:	11a06106 	lslne	r6, r6, #2
    7e74:	f57ff04e 	dsb	st
    7e78:	ebfffffe 	bl	0 <arm_heavy_mb>
    7e7c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7e80:	e0836006 	add	r6, r3, r6
    7e84:	e5867000 	str	r7, [r6]
    7e88:	e59d2018 	ldr	r2, [sp, #24]
    7e8c:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    7e90:	e252703f 	subs	r7, r2, #63	; 0x3f
    7e94:	e59d2004 	ldr	r2, [sp, #4]
    7e98:	13a07001 	movne	r7, #1
    7e9c:	e7d23003 	ldrb	r3, [r2, r3]
    7ea0:	e1170003 	tst	r7, r3
    7ea4:	1a0000a4 	bne	813c <ipu_disable_channel+0x5e0>
    7ea8:	e59d2004 	ldr	r2, [sp, #4]
    7eac:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    7eb0:	e7d23003 	ldrb	r3, [r2, r3]
    7eb4:	e59d201c 	ldr	r2, [sp, #28]
    7eb8:	e1120003 	tst	r2, r3
    7ebc:	1a000082 	bne	80cc <ipu_disable_channel+0x570>
    7ec0:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    7ec4:	e3403a6f 	movt	r3, #2671	; 0xa6f
    7ec8:	e15a0003 	cmp	sl, r3
    7ecc:	0a0000f9 	beq	82b8 <ipu_disable_channel+0x75c>
    7ed0:	e2846d79 	add	r6, r4, #7744	; 0x1e40
    7ed4:	e2866020 	add	r6, r6, #32
    7ed8:	e1a00006 	mov	r0, r6
    7edc:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    7ee0:	e59d3010 	ldr	r3, [sp, #16]
    7ee4:	e1a08000 	mov	r8, r0
    7ee8:	e353003f 	cmp	r3, #63	; 0x3f
    7eec:	0a00000e 	beq	7f2c <ipu_disable_channel+0x3d0>
    7ef0:	e3a03000 	mov	r3, #0
    7ef4:	e3a02003 	mov	r2, #3
    7ef8:	e1a0100a 	mov	r1, sl
    7efc:	e1a00004 	mov	r0, r4
    7f00:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7f04:	e3a03001 	mov	r3, #1
    7f08:	e3a02003 	mov	r2, #3
    7f0c:	e1a0100a 	mov	r1, sl
    7f10:	e1a00004 	mov	r0, r4
    7f14:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7f18:	e3a03002 	mov	r3, #2
    7f1c:	e3a02003 	mov	r2, #3
    7f20:	e1a0100a 	mov	r1, sl
    7f24:	e1a00004 	mov	r0, r4
    7f28:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7f2c:	e59d3014 	ldr	r3, [sp, #20]
    7f30:	e353003f 	cmp	r3, #63	; 0x3f
    7f34:	0a000009 	beq	7f60 <ipu_disable_channel+0x404>
    7f38:	e3a03000 	mov	r3, #0
    7f3c:	e1a0100a 	mov	r1, sl
    7f40:	e1a02003 	mov	r2, r3
    7f44:	e1a00004 	mov	r0, r4
    7f48:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7f4c:	e3a03001 	mov	r3, #1
    7f50:	e3a02000 	mov	r2, #0
    7f54:	e1a0100a 	mov	r1, sl
    7f58:	e1a00004 	mov	r0, r4
    7f5c:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    7f60:	e59d2004 	ldr	r2, [sp, #4]
    7f64:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    7f68:	e7d23003 	ldrb	r3, [r2, r3]
    7f6c:	e1170003 	tst	r7, r3
    7f70:	1a00004a 	bne	80a0 <ipu_disable_channel+0x544>
    7f74:	e59d2004 	ldr	r2, [sp, #4]
    7f78:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    7f7c:	e7d23003 	ldrb	r3, [r2, r3]
    7f80:	e59d201c 	ldr	r2, [sp, #28]
    7f84:	e1120003 	tst	r2, r3
    7f88:	1a000039 	bne	8074 <ipu_disable_channel+0x518>
    7f8c:	e1a01008 	mov	r1, r8
    7f90:	e1a00006 	mov	r0, r6
    7f94:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    7f98:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    7f9c:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
    7fa0:	e1c33002 	bic	r3, r3, r2
    7fa4:	e5853e18 	str	r3, [r5, #3608]	; 0xe18
    7fa8:	e594403c 	ldr	r4, [r4, #60]	; 0x3c
    7fac:	e3540000 	cmp	r4, #0
    7fb0:	0a000003 	beq	7fc4 <ipu_disable_channel+0x468>
    7fb4:	e1a00004 	mov	r0, r4
    7fb8:	ebfffffe 	bl	0 <clk_disable>
    7fbc:	e1a00004 	mov	r0, r4
    7fc0:	ebfffffe 	bl	0 <clk_unprepare>
    7fc4:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    7fc8:	ebfffffe 	bl	0 <mutex_unlock>
    7fcc:	e3a00000 	mov	r0, #0
    7fd0:	e28dd07c 	add	sp, sp, #124	; 0x7c
    7fd4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    7fd8:	e15a0003 	cmp	sl, r3
    7fdc:	0a000071 	beq	81a8 <ipu_disable_channel+0x64c>
    7fe0:	e3a02000 	mov	r2, #0
    7fe4:	e1a0100a 	mov	r1, sl
    7fe8:	e1a00004 	mov	r0, r4
    7fec:	ebfffffe 	bl	0 <_ipu_dp_dc_disable>
    7ff0:	e59d1010 	ldr	r1, [sp, #16]
    7ff4:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    7ff8:	e1a032a1 	lsr	r3, r1, #5
    7ffc:	e2833007 	add	r3, r3, #7
    8000:	e1a06103 	lsl	r6, r3, #2
    8004:	e0822006 	add	r2, r2, r6
    8008:	e5927000 	ldr	r7, [r2]
    800c:	f57ff04f 	dsb	sy
    8010:	e351003f 	cmp	r1, #63	; 0x3f
    8014:	159d3030 	ldrne	r3, [sp, #48]	; 0x30
    8018:	13a02001 	movne	r2, #1
    801c:	1203301f 	andne	r3, r3, #31
    8020:	11c77312 	bicne	r7, r7, r2, lsl r3
    8024:	f57ff04e 	dsb	st
    8028:	ebfffffe 	bl	0 <arm_heavy_mb>
    802c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8030:	e0833006 	add	r3, r3, r6
    8034:	e5837000 	str	r7, [r3]
    8038:	eaffff1b 	b	7cac <ipu_disable_channel+0x150>
    803c:	e59d0014 	ldr	r0, [sp, #20]
    8040:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    8044:	e1a002a0 	lsr	r0, r0, #5
    8048:	e2800001 	add	r0, r0, #1
    804c:	e0811100 	add	r1, r1, r0, lsl #2
    8050:	e5911000 	ldr	r1, [r1]
    8054:	f57ff04f 	dsb	sy
    8058:	e20a001f 	and	r0, sl, #31
    805c:	e0112012 	ands	r2, r1, r2, lsl r0
    8060:	1afffee5 	bne	7bfc <ipu_disable_channel+0xa0>
    8064:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    8068:	ebfffffe 	bl	0 <mutex_unlock>
    806c:	e3e00015 	mvn	r0, #21
    8070:	eaffffd6 	b	7fd0 <ipu_disable_channel+0x474>
    8074:	e1a0100a 	mov	r1, sl
    8078:	e1a00004 	mov	r0, r4
    807c:	e3a03000 	mov	r3, #0
    8080:	e3a02001 	mov	r2, #1
    8084:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    8088:	e3a03001 	mov	r3, #1
    808c:	e1a0100a 	mov	r1, sl
    8090:	e1a02003 	mov	r2, r3
    8094:	e1a00004 	mov	r0, r4
    8098:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    809c:	eaffffba 	b	7f8c <ipu_disable_channel+0x430>
    80a0:	e1a0100a 	mov	r1, sl
    80a4:	e1a00004 	mov	r0, r4
    80a8:	e3a03000 	mov	r3, #0
    80ac:	e3a02002 	mov	r2, #2
    80b0:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    80b4:	e3a03001 	mov	r3, #1
    80b8:	e3a02002 	mov	r2, #2
    80bc:	e1a0100a 	mov	r1, sl
    80c0:	e1a00004 	mov	r0, r4
    80c4:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    80c8:	eaffffa9 	b	7f74 <ipu_disable_channel+0x418>
    80cc:	e59d2020 	ldr	r2, [sp, #32]
    80d0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    80d4:	e1a062a2 	lsr	r6, r2, #5
    80d8:	e2866001 	add	r6, r6, #1
    80dc:	e1a06106 	lsl	r6, r6, #2
    80e0:	e0833006 	add	r3, r3, r6
    80e4:	e5939000 	ldr	r9, [r3]
    80e8:	f57ff04f 	dsb	sy
    80ec:	e3a0b001 	mov	fp, #1
    80f0:	e202801f 	and	r8, r2, #31
    80f4:	e1a0881b 	lsl	r8, fp, r8
    80f8:	e1c99008 	bic	r9, r9, r8
    80fc:	f57ff04e 	dsb	st
    8100:	ebfffffe 	bl	0 <arm_heavy_mb>
    8104:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8108:	e0832006 	add	r2, r3, r6
    810c:	e5829000 	str	r9, [r2]
    8110:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8114:	e3520000 	cmp	r2, #0
    8118:	0a00004f 	beq	825c <ipu_disable_channel+0x700>
    811c:	e593900c 	ldr	r9, [r3, #12]
    8120:	f57ff04f 	dsb	sy
    8124:	e59d3010 	ldr	r3, [sp, #16]
    8128:	e353003f 	cmp	r3, #63	; 0x3f
    812c:	159d3030 	ldrne	r3, [sp, #48]	; 0x30
    8130:	1203301f 	andne	r3, r3, #31
    8134:	11c9931b 	bicne	r9, r9, fp, lsl r3
    8138:	ea00004d 	b	8274 <ipu_disable_channel+0x718>
    813c:	e59d2018 	ldr	r2, [sp, #24]
    8140:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8144:	e1a062a2 	lsr	r6, r2, #5
    8148:	e2866001 	add	r6, r6, #1
    814c:	e1a06106 	lsl	r6, r6, #2
    8150:	e0833006 	add	r3, r3, r6
    8154:	e5939000 	ldr	r9, [r3]
    8158:	f57ff04f 	dsb	sy
    815c:	e3a08001 	mov	r8, #1
    8160:	e202301f 	and	r3, r2, #31
    8164:	e1a08318 	lsl	r8, r8, r3
    8168:	e1c99008 	bic	r9, r9, r8
    816c:	f57ff04e 	dsb	st
    8170:	ebfffffe 	bl	0 <arm_heavy_mb>
    8174:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8178:	e0833006 	add	r3, r3, r6
    817c:	e5839000 	str	r9, [r3]
    8180:	e5943004 	ldr	r3, [r4, #4]
    8184:	e3530000 	cmp	r3, #0
    8188:	12866f8e 	addne	r6, r6, #568	; 0x238
    818c:	02866e12 	addeq	r6, r6, #288	; 0x120
    8190:	f57ff04e 	dsb	st
    8194:	ebfffffe 	bl	0 <arm_heavy_mb>
    8198:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    819c:	e0836006 	add	r6, r3, r6
    81a0:	e5868000 	str	r8, [r6]
    81a4:	eaffff3f 	b	7ea8 <ipu_disable_channel+0x34c>
    81a8:	e1a0100a 	mov	r1, sl
    81ac:	e28d3076 	add	r3, sp, #118	; 0x76
    81b0:	e28d2074 	add	r2, sp, #116	; 0x74
    81b4:	e1a00004 	mov	r0, r4
    81b8:	ebfffffe 	bl	0 <_ipu_disp_get_window_pos>
    81bc:	e3a03000 	mov	r3, #0
    81c0:	e1a0100a 	mov	r1, sl
    81c4:	e1a02003 	mov	r2, r3
    81c8:	e1a00004 	mov	r0, r4
    81cc:	ebfffffe 	bl	0 <_ipu_disp_set_window_pos>
    81d0:	e3a02000 	mov	r2, #0
    81d4:	e1a0100a 	mov	r1, sl
    81d8:	e1a00004 	mov	r0, r4
    81dc:	ebfffffe 	bl	0 <_ipu_dp_dc_disable>
    81e0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    81e4:	e5933004 	ldr	r3, [r3, #4]
    81e8:	f57ff04f 	dsb	sy
    81ec:	e3130502 	tst	r3, #8388608	; 0x800000
    81f0:	0a000036 	beq	82d0 <ipu_disable_channel+0x774>
    81f4:	e5943004 	ldr	r3, [r4, #4]
    81f8:	e3530000 	cmp	r3, #0
    81fc:	03a060e8 	moveq	r6, #232	; 0xe8
    8200:	13a06c02 	movne	r6, #512	; 0x200
    8204:	f57ff04e 	dsb	st
    8208:	ebfffffe 	bl	0 <arm_heavy_mb>
    820c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    8210:	e3a02502 	mov	r2, #8388608	; 0x800000
    8214:	e0836006 	add	r6, r3, r6
    8218:	e5862000 	str	r2, [r6]
    821c:	e3a06005 	mov	r6, #5
    8220:	e5942004 	ldr	r2, [r4, #4]
    8224:	e3520000 	cmp	r2, #0
    8228:	03a020e8 	moveq	r2, #232	; 0xe8
    822c:	13a02c02 	movne	r2, #512	; 0x200
    8230:	e0833002 	add	r3, r3, r2
    8234:	e5933000 	ldr	r3, [r3]
    8238:	f57ff04f 	dsb	sy
    823c:	e3130502 	tst	r3, #8388608	; 0x800000
    8240:	e3a0000a 	mov	r0, #10
    8244:	1affff69 	bne	7ff0 <ipu_disable_channel+0x494>
    8248:	ebfffffe 	bl	0 <msleep>
    824c:	e2566001 	subs	r6, r6, #1
    8250:	0a000107 	beq	8674 <ipu_disable_channel+0xb18>
    8254:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    8258:	eafffff0 	b	8220 <ipu_disable_channel+0x6c4>
    825c:	e593900c 	ldr	r9, [r3, #12]
    8260:	f57ff04f 	dsb	sy
    8264:	e59d3018 	ldr	r3, [sp, #24]
    8268:	e353003f 	cmp	r3, #63	; 0x3f
    826c:	1203301f 	andne	r3, r3, #31
    8270:	11c9931b 	bicne	r9, r9, fp, lsl r3
    8274:	f57ff04e 	dsb	st
    8278:	ebfffffe 	bl	0 <arm_heavy_mb>
    827c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8280:	e583900c 	str	r9, [r3, #12]
    8284:	e5943004 	ldr	r3, [r4, #4]
    8288:	e3530000 	cmp	r3, #0
    828c:	12866f8e 	addne	r6, r6, #568	; 0x238
    8290:	02866e12 	addeq	r6, r6, #288	; 0x120
    8294:	f57ff04e 	dsb	st
    8298:	ebfffffe 	bl	0 <arm_heavy_mb>
    829c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    82a0:	e0836006 	add	r6, r3, r6
    82a4:	e5868000 	str	r8, [r6]
    82a8:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    82ac:	e3403a6f 	movt	r3, #2671	; 0xa6f
    82b0:	e15a0003 	cmp	sl, r3
    82b4:	1affff05 	bne	7ed0 <ipu_disable_channel+0x374>
    82b8:	e1dd37f6 	ldrsh	r3, [sp, #118]	; 0x76
    82bc:	e1a0100a 	mov	r1, sl
    82c0:	e1dd27f4 	ldrsh	r2, [sp, #116]	; 0x74
    82c4:	e1a00004 	mov	r0, r4
    82c8:	ebfffffe 	bl	0 <_ipu_disp_set_window_pos>
    82cc:	eafffeff 	b	7ed0 <ipu_disable_channel+0x374>
    82d0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    82d4:	e5933008 	ldr	r3, [r3, #8]
    82d8:	f57ff04f 	dsb	sy
    82dc:	eaffff43 	b	7ff0 <ipu_disable_channel+0x494>
    82e0:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    82e4:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    82e8:	e34124ff 	movt	r2, #5375	; 0x14ff
    82ec:	e34133ff 	movt	r3, #5119	; 0x13ff
    82f0:	e15a0002 	cmp	sl, r2
    82f4:	115a0003 	cmpne	sl, r3
    82f8:	0afffe6b 	beq	7cac <ipu_disable_channel+0x150>
    82fc:	e59d7018 	ldr	r7, [sp, #24]
    8300:	e300b000 	movw	fp, #0
    8304:	e59d6010 	ldr	r6, [sp, #16]
    8308:	e340b000 	movt	fp, #0
    830c:	e59d3014 	ldr	r3, [sp, #20]
    8310:	e59d8020 	ldr	r8, [sp, #32]
    8314:	e1a022a7 	lsr	r2, r7, #5
    8318:	e59dc030 	ldr	ip, [sp, #48]	; 0x30
    831c:	e1a002a6 	lsr	r0, r6, #5
    8320:	e356003f 	cmp	r6, #63	; 0x3f
    8324:	e2822010 	add	r2, r2, #16
    8328:	e1a012a3 	lsr	r1, r3, #5
    832c:	e1a02102 	lsl	r2, r2, #2
    8330:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    8334:	e1a032a8 	lsr	r3, r8, #5
    8338:	e2800010 	add	r0, r0, #16
    833c:	e1a00100 	lsl	r0, r0, #2
    8340:	e2811010 	add	r1, r1, #16
    8344:	e58d2054 	str	r2, [sp, #84]	; 0x54
    8348:	e2833010 	add	r3, r3, #16
    834c:	e1a09101 	lsl	r9, r1, #2
    8350:	e1a03103 	lsl	r3, r3, #2
    8354:	e58d0028 	str	r0, [sp, #40]	; 0x28
    8358:	e207201f 	and	r2, r7, #31
    835c:	e28070c0 	add	r7, r0, #192	; 0xc0
    8360:	e59d0054 	ldr	r0, [sp, #84]	; 0x54
    8364:	e20ce01f 	and	lr, ip, #31
    8368:	e58d304c 	str	r3, [sp, #76]	; 0x4c
    836c:	e3a0c001 	mov	ip, #1
    8370:	e58d702c 	str	r7, [sp, #44]	; 0x2c
    8374:	e28970c0 	add	r7, r9, #192	; 0xc0
    8378:	e58d7040 	str	r7, [sp, #64]	; 0x40
    837c:	e28070c0 	add	r7, r0, #192	; 0xc0
    8380:	e59d004c 	ldr	r0, [sp, #76]	; 0x4c
    8384:	e1a0ee1c 	lsl	lr, ip, lr
    8388:	e20a101f 	and	r1, sl, #31
    838c:	e1a0221c 	lsl	r2, ip, r2
    8390:	e208301f 	and	r3, r8, #31
    8394:	e1a0111c 	lsl	r1, ip, r1
    8398:	e28000c0 	add	r0, r0, #192	; 0xc0
    839c:	e1a0331c 	lsl	r3, ip, r3
    83a0:	e30c6498 	movw	r6, #50328	; 0xc498
    83a4:	e58d0050 	str	r0, [sp, #80]	; 0x50
    83a8:	e3406020 	movt	r6, #32
    83ac:	11a0000e 	movne	r0, lr
    83b0:	03a00000 	moveq	r0, #0
    83b4:	e58d903c 	str	r9, [sp, #60]	; 0x3c
    83b8:	e58de044 	str	lr, [sp, #68]	; 0x44
    83bc:	e58d7058 	str	r7, [sp, #88]	; 0x58
    83c0:	e58d0064 	str	r0, [sp, #100]	; 0x64
    83c4:	e58d1048 	str	r1, [sp, #72]	; 0x48
    83c8:	e58d2068 	str	r2, [sp, #104]	; 0x68
    83cc:	e58d3060 	str	r3, [sp, #96]	; 0x60
    83d0:	e58d600c 	str	r6, [sp, #12]
    83d4:	e58da06c 	str	sl, [sp, #108]	; 0x6c
    83d8:	e5942004 	ldr	r2, [r4, #4]
    83dc:	e59d002c 	ldr	r0, [sp, #44]	; 0x2c
    83e0:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    83e4:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    83e8:	e3520000 	cmp	r2, #0
    83ec:	11a01000 	movne	r1, r0
    83f0:	e0833001 	add	r3, r3, r1
    83f4:	e5933000 	ldr	r3, [r3]
    83f8:	f57ff04f 	dsb	sy
    83fc:	e59d2010 	ldr	r2, [sp, #16]
    8400:	e352003f 	cmp	r2, #63	; 0x3f
    8404:	0a00009f 	beq	8688 <ipu_disable_channel+0xb2c>
    8408:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    840c:	e1130002 	tst	r3, r2
    8410:	159d1044 	ldrne	r1, [sp, #68]	; 0x44
    8414:	0a00009b 	beq	8688 <ipu_disable_channel+0xb2c>
    8418:	e5942004 	ldr	r2, [r4, #4]
    841c:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    8420:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
    8424:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8428:	e3520000 	cmp	r2, #0
    842c:	11a0000c 	movne	r0, ip
    8430:	e0833000 	add	r3, r3, r0
    8434:	e5933000 	ldr	r3, [r3]
    8438:	f57ff04f 	dsb	sy
    843c:	e59d2014 	ldr	r2, [sp, #20]
    8440:	e352003f 	cmp	r2, #63	; 0x3f
    8444:	03e07000 	mvneq	r7, #0
    8448:	0a000003 	beq	845c <ipu_disable_channel+0x900>
    844c:	e59d0048 	ldr	r0, [sp, #72]	; 0x48
    8450:	e1130000 	tst	r3, r0
    8454:	11a07002 	movne	r7, r2
    8458:	03e07000 	mvneq	r7, #0
    845c:	e59d0004 	ldr	r0, [sp, #4]
    8460:	e3012d9e 	movw	r2, #7582	; 0x1d9e
    8464:	e5943004 	ldr	r3, [r4, #4]
    8468:	e7d02002 	ldrb	r2, [r0, r2]
    846c:	e3520000 	cmp	r2, #0
    8470:	0a00000f 	beq	84b4 <ipu_disable_channel+0x958>
    8474:	e59dc054 	ldr	ip, [sp, #84]	; 0x54
    8478:	e3530000 	cmp	r3, #0
    847c:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    8480:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    8484:	01a0000c 	moveq	r0, ip
    8488:	e0823000 	add	r3, r2, r0
    848c:	e5932000 	ldr	r2, [r3]
    8490:	f57ff04f 	dsb	sy
    8494:	e59d3018 	ldr	r3, [sp, #24]
    8498:	e353003f 	cmp	r3, #63	; 0x3f
    849c:	e5943004 	ldr	r3, [r4, #4]
    84a0:	0a000003 	beq	84b4 <ipu_disable_channel+0x958>
    84a4:	e59d0068 	ldr	r0, [sp, #104]	; 0x68
    84a8:	e1120000 	tst	r2, r0
    84ac:	e59d2018 	ldr	r2, [sp, #24]
    84b0:	11a07002 	movne	r7, r2
    84b4:	e59d0004 	ldr	r0, [sp, #4]
    84b8:	e3012dbe 	movw	r2, #7614	; 0x1dbe
    84bc:	e7d02002 	ldrb	r2, [r0, r2]
    84c0:	e3520000 	cmp	r2, #0
    84c4:	0a00000f 	beq	8508 <ipu_disable_channel+0x9ac>
    84c8:	e59dc04c 	ldr	ip, [sp, #76]	; 0x4c
    84cc:	e3530000 	cmp	r3, #0
    84d0:	e59d0050 	ldr	r0, [sp, #80]	; 0x50
    84d4:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    84d8:	01a0000c 	moveq	r0, ip
    84dc:	e0823000 	add	r3, r2, r0
    84e0:	e5932000 	ldr	r2, [r3]
    84e4:	f57ff04f 	dsb	sy
    84e8:	e59d3020 	ldr	r3, [sp, #32]
    84ec:	e353003f 	cmp	r3, #63	; 0x3f
    84f0:	e5943004 	ldr	r3, [r4, #4]
    84f4:	0a000003 	beq	8508 <ipu_disable_channel+0x9ac>
    84f8:	e59d0060 	ldr	r0, [sp, #96]	; 0x60
    84fc:	e1120000 	tst	r2, r0
    8500:	e59d2020 	ldr	r2, [sp, #32]
    8504:	11a07002 	movne	r7, r2
    8508:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    850c:	e3530000 	cmp	r3, #0
    8510:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    8514:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    8518:	11a0000c 	movne	r0, ip
    851c:	e0823000 	add	r3, r2, r0
    8520:	e5933000 	ldr	r3, [r3]
    8524:	f57ff04f 	dsb	sy
    8528:	e1130001 	tst	r3, r1
    852c:	1a000066 	bne	86cc <ipu_disable_channel+0xb70>
    8530:	e3770001 	cmn	r7, #1
    8534:	0a00009e 	beq	87b4 <ipu_disable_channel+0xc58>
    8538:	e1a082a7 	lsr	r8, r7, #5
    853c:	e2889010 	add	r9, r8, #16
    8540:	e1a09109 	lsl	r9, r9, #2
    8544:	e28930c0 	add	r3, r9, #192	; 0xc0
    8548:	e58d3008 	str	r3, [sp, #8]
    854c:	e5942004 	ldr	r2, [r4, #4]
    8550:	e207301f 	and	r3, r7, #31
    8554:	e1a08108 	lsl	r8, r8, #2
    8558:	e3a06001 	mov	r6, #1
    855c:	e1a06316 	lsl	r6, r6, r3
    8560:	e3520000 	cmp	r2, #0
    8564:	03a030e8 	moveq	r3, #232	; 0xe8
    8568:	13a03c02 	movne	r3, #512	; 0x200
    856c:	e088a003 	add	sl, r8, r3
    8570:	f57ff04e 	dsb	st
    8574:	ebfffffe 	bl	0 <arm_heavy_mb>
    8578:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    857c:	e082300a 	add	r3, r2, sl
    8580:	e5836000 	str	r6, [r3]
    8584:	e59f0298 	ldr	r0, [pc, #664]	; 8824 <ipu_disable_channel+0xcc8>
    8588:	e1d030b0 	ldrh	r3, [r0]
    858c:	e3130004 	tst	r3, #4
    8590:	0a000006 	beq	85b0 <ipu_disable_channel+0xa54>
    8594:	e3002000 	movw	r2, #0
    8598:	e2400012 	sub	r0, r0, #18
    859c:	e3402000 	movt	r2, #0
    85a0:	e1a03007 	mov	r3, r7
    85a4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    85a8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    85ac:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    85b0:	e1a0300b 	mov	r3, fp
    85b4:	e30ca350 	movw	sl, #50000	; 0xc350
    85b8:	e1a0b004 	mov	fp, r4
    85bc:	e1a00002 	mov	r0, r2
    85c0:	e1a04009 	mov	r4, r9
    85c4:	e1a09003 	mov	r9, r3
    85c8:	ea000006 	b	85e8 <ipu_disable_channel+0xa8c>
    85cc:	e1160003 	tst	r6, r3
    85d0:	0a000019 	beq	863c <ipu_disable_channel+0xae0>
    85d4:	e5993004 	ldr	r3, [r9, #4]
    85d8:	e12fff33 	blx	r3
    85dc:	e25aa00a 	subs	sl, sl, #10
    85e0:	0a000069 	beq	878c <ipu_disable_channel+0xc30>
    85e4:	e5950d48 	ldr	r0, [r5, #3400]	; 0xd48
    85e8:	e59b3004 	ldr	r3, [fp, #4]
    85ec:	e3530000 	cmp	r3, #0
    85f0:	03a030e8 	moveq	r3, #232	; 0xe8
    85f4:	13a03c02 	movne	r3, #512	; 0x200
    85f8:	e0883003 	add	r3, r8, r3
    85fc:	e0803003 	add	r3, r0, r3
    8600:	e5933000 	ldr	r3, [r3]
    8604:	f57ff04f 	dsb	sy
    8608:	e1160003 	tst	r6, r3
    860c:	1a00000a 	bne	863c <ipu_disable_channel+0xae0>
    8610:	e59b0004 	ldr	r0, [fp, #4]
    8614:	e59d2008 	ldr	r2, [sp, #8]
    8618:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    861c:	e3500000 	cmp	r0, #0
    8620:	01a02004 	moveq	r2, r4
    8624:	e0833002 	add	r3, r3, r2
    8628:	e5933000 	ldr	r3, [r3]
    862c:	f57ff04f 	dsb	sy
    8630:	e357003f 	cmp	r7, #63	; 0x3f
    8634:	e59d000c 	ldr	r0, [sp, #12]
    8638:	1affffe3 	bne	85cc <ipu_disable_channel+0xa70>
    863c:	e1a0400b 	mov	r4, fp
    8640:	e1a0b009 	mov	fp, r9
    8644:	e59f01dc 	ldr	r0, [pc, #476]	; 8828 <ipu_disable_channel+0xccc>
    8648:	e1d020b0 	ldrh	r2, [r0]
    864c:	e3120004 	tst	r2, #4
    8650:	0affff60 	beq	83d8 <ipu_disable_channel+0x87c>
    8654:	e26a3cc3 	rsb	r3, sl, #49920	; 0xc300
    8658:	e3002000 	movw	r2, #0
    865c:	e2833050 	add	r3, r3, #80	; 0x50
    8660:	e2400012 	sub	r0, r0, #18
    8664:	e3402000 	movt	r2, #0
    8668:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    866c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8670:	eaffff58 	b	83d8 <ipu_disable_channel+0x87c>
    8674:	e3001000 	movw	r1, #0
    8678:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    867c:	e3401000 	movt	r1, #0
    8680:	ebfffffe 	bl	0 <dev_err>
    8684:	eafffe59 	b	7ff0 <ipu_disable_channel+0x494>
    8688:	e5942004 	ldr	r2, [r4, #4]
    868c:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    8690:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    8694:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8698:	e3520000 	cmp	r2, #0
    869c:	11a01000 	movne	r1, r0
    86a0:	e0833001 	add	r3, r3, r1
    86a4:	e5933000 	ldr	r3, [r3]
    86a8:	f57ff04f 	dsb	sy
    86ac:	e59d2014 	ldr	r2, [sp, #20]
    86b0:	e352003f 	cmp	r2, #63	; 0x3f
    86b4:	0a00000a 	beq	86e4 <ipu_disable_channel+0xb88>
    86b8:	e59d2048 	ldr	r2, [sp, #72]	; 0x48
    86bc:	e1130002 	tst	r3, r2
    86c0:	0a000007 	beq	86e4 <ipu_disable_channel+0xb88>
    86c4:	e59d1064 	ldr	r1, [sp, #100]	; 0x64
    86c8:	eaffff52 	b	8418 <ipu_disable_channel+0x8bc>
    86cc:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    86d0:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
    86d4:	e59d805c 	ldr	r8, [sp, #92]	; 0x5c
    86d8:	e58d3008 	str	r3, [sp, #8]
    86dc:	e59d7010 	ldr	r7, [sp, #16]
    86e0:	eaffff99 	b	854c <ipu_disable_channel+0x9f0>
    86e4:	e59d2004 	ldr	r2, [sp, #4]
    86e8:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    86ec:	e7d23003 	ldrb	r3, [r2, r3]
    86f0:	e3530000 	cmp	r3, #0
    86f4:	0a00000e 	beq	8734 <ipu_disable_channel+0xbd8>
    86f8:	e5942004 	ldr	r2, [r4, #4]
    86fc:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    8700:	e59d1054 	ldr	r1, [sp, #84]	; 0x54
    8704:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8708:	e3520000 	cmp	r2, #0
    870c:	11a01000 	movne	r1, r0
    8710:	e0833001 	add	r3, r3, r1
    8714:	e5933000 	ldr	r3, [r3]
    8718:	f57ff04f 	dsb	sy
    871c:	e59d2018 	ldr	r2, [sp, #24]
    8720:	e352003f 	cmp	r2, #63	; 0x3f
    8724:	0a000002 	beq	8734 <ipu_disable_channel+0xbd8>
    8728:	e59d2068 	ldr	r2, [sp, #104]	; 0x68
    872c:	e1130002 	tst	r3, r2
    8730:	1affffe3 	bne	86c4 <ipu_disable_channel+0xb68>
    8734:	e59d2004 	ldr	r2, [sp, #4]
    8738:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    873c:	e7d23003 	ldrb	r3, [r2, r3]
    8740:	e3530000 	cmp	r3, #0
    8744:	0a00000e 	beq	8784 <ipu_disable_channel+0xc28>
    8748:	e5942004 	ldr	r2, [r4, #4]
    874c:	e59d0050 	ldr	r0, [sp, #80]	; 0x50
    8750:	e59d104c 	ldr	r1, [sp, #76]	; 0x4c
    8754:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8758:	e3520000 	cmp	r2, #0
    875c:	11a01000 	movne	r1, r0
    8760:	e0833001 	add	r3, r3, r1
    8764:	e5933000 	ldr	r3, [r3]
    8768:	f57ff04f 	dsb	sy
    876c:	e59d2020 	ldr	r2, [sp, #32]
    8770:	e352003f 	cmp	r2, #63	; 0x3f
    8774:	0a000002 	beq	8784 <ipu_disable_channel+0xc28>
    8778:	e59d2060 	ldr	r2, [sp, #96]	; 0x60
    877c:	e1130002 	tst	r3, r2
    8780:	1affffcf 	bne	86c4 <ipu_disable_channel+0xb68>
    8784:	e59da06c 	ldr	sl, [sp, #108]	; 0x6c
    8788:	eafffd47 	b	7cac <ipu_disable_channel+0x150>
    878c:	e1a0400b 	mov	r4, fp
    8790:	e1a0b009 	mov	fp, r9
    8794:	e1a00004 	mov	r0, r4
    8798:	ebfffffe 	bl	7460 <ipu_dump_registers>
    879c:	e3001000 	movw	r1, #0
    87a0:	e1a02007 	mov	r2, r7
    87a4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    87a8:	e3401000 	movt	r1, #0
    87ac:	ebfffffe 	bl	0 <dev_err>
    87b0:	eaffffa3 	b	8644 <ipu_disable_channel+0xae8>
    87b4:	e3003000 	movw	r3, #0
    87b8:	e300277a 	movw	r2, #1914	; 0x77a
    87bc:	e3403000 	movt	r3, #0
    87c0:	e59da06c 	ldr	sl, [sp, #108]	; 0x6c
    87c4:	e19330b2 	ldrh	r3, [r3, r2]
    87c8:	e3130004 	tst	r3, #4
    87cc:	0afffd36 	beq	7cac <ipu_disable_channel+0x150>
    87d0:	e3002000 	movw	r2, #0
    87d4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    87d8:	e3402000 	movt	r2, #0
    87dc:	e59f0048 	ldr	r0, [pc, #72]	; 882c <ipu_disable_channel+0xcd0>
    87e0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    87e4:	eafffd30 	b	7cac <ipu_disable_channel+0x150>
    87e8:	e3000000 	movw	r0, #0
    87ec:	e3002762 	movw	r2, #1890	; 0x762
    87f0:	e3400000 	movt	r0, #0
    87f4:	e19020b2 	ldrh	r2, [r0, r2]
    87f8:	e3120004 	tst	r2, #4
    87fc:	0a000004 	beq	8814 <ipu_disable_channel+0xcb8>
    8800:	e3002000 	movw	r2, #0
    8804:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    8808:	e2800e75 	add	r0, r0, #1872	; 0x750
    880c:	e3402000 	movt	r2, #0
    8810:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8814:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    8818:	ebfffffe 	bl	0 <mutex_unlock>
    881c:	e3e0000c 	mvn	r0, #12
    8820:	eafffdea 	b	7fd0 <ipu_disable_channel+0x474>
    8824:	00000792 	muleq	r0, r2, r7
    8828:	000007aa 	andeq	r0, r0, sl, lsr #15
    882c:	00000768 	andeq	r0, r0, r8, ror #14

00008830 <ipu_swap_channel>:
    8830:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8834:	e2807d79 	add	r7, r0, #7744	; 0x1e40
    8838:	e1a0b922 	lsr	fp, r2, #18
    883c:	e2877008 	add	r7, r7, #8
    8840:	e24dd00c 	sub	sp, sp, #12
    8844:	e1a05000 	mov	r5, r0
    8848:	e1a0a002 	mov	sl, r2
    884c:	e1a00007 	mov	r0, r7
    8850:	e20b203f 	and	r2, fp, #63	; 0x3f
    8854:	e1a06001 	mov	r6, r1
    8858:	e58d2004 	str	r2, [sp, #4]
    885c:	ebfffffe 	bl	0 <mutex_lock>
    8860:	e59d2004 	ldr	r2, [sp, #4]
    8864:	e2858a01 	add	r8, r5, #4096	; 0x1000
    8868:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    886c:	e7e54956 	ubfx	r4, r6, #18, #6
    8870:	e1a092c2 	asr	r9, r2, #5
    8874:	e2899001 	add	r9, r9, #1
    8878:	e1a09109 	lsl	r9, r9, #2
    887c:	e0833009 	add	r3, r3, r9
    8880:	e5931000 	ldr	r1, [r3]
    8884:	f57ff04f 	dsb	sy
    8888:	e352003f 	cmp	r2, #63	; 0x3f
    888c:	120bb01f 	andne	fp, fp, #31
    8890:	13a03001 	movne	r3, #1
    8894:	11811b13 	orrne	r1, r1, r3, lsl fp
    8898:	e58d1004 	str	r1, [sp, #4]
    889c:	f57ff04e 	dsb	st
    88a0:	ebfffffe 	bl	0 <arm_heavy_mb>
    88a4:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    88a8:	e59d1004 	ldr	r1, [sp, #4]
    88ac:	e0839009 	add	r9, r3, r9
    88b0:	e5891000 	str	r1, [r9]
    88b4:	e5982e18 	ldr	r2, [r8, #3608]	; 0xe18
    88b8:	e1a03c4a 	asr	r3, sl, #24
    88bc:	e3a0a001 	mov	sl, #1
    88c0:	e1a092c4 	asr	r9, r4, #5
    88c4:	e1a01006 	mov	r1, r6
    88c8:	e1a00005 	mov	r0, r5
    88cc:	e089900a 	add	r9, r9, sl
    88d0:	e182331a 	orr	r3, r2, sl, lsl r3
    88d4:	e1a0200a 	mov	r2, sl
    88d8:	e1a09109 	lsl	r9, r9, #2
    88dc:	e5883e18 	str	r3, [r8, #3608]	; 0xe18
    88e0:	ebfffffe 	bl	0 <_ipu_dp_dc_disable>
    88e4:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    88e8:	e0833009 	add	r3, r3, r9
    88ec:	e593b000 	ldr	fp, [r3]
    88f0:	f57ff04f 	dsb	sy
    88f4:	e354003f 	cmp	r4, #63	; 0x3f
    88f8:	1204301f 	andne	r3, r4, #31
    88fc:	11cbb31a 	bicne	fp, fp, sl, lsl r3
    8900:	f57ff04e 	dsb	st
    8904:	ebfffffe 	bl	0 <arm_heavy_mb>
    8908:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    890c:	e0833009 	add	r3, r3, r9
    8910:	e583b000 	str	fp, [r3]
    8914:	e354003f 	cmp	r4, #63	; 0x3f
    8918:	1204301f 	andne	r3, r4, #31
    891c:	13a0a001 	movne	sl, #1
    8920:	11a0a31a 	lslne	sl, sl, r3
    8924:	e5953004 	ldr	r3, [r5, #4]
    8928:	03a0a000 	moveq	sl, #0
    892c:	e3530000 	cmp	r3, #0
    8930:	12899f8e 	addne	r9, r9, #568	; 0x238
    8934:	02899e12 	addeq	r9, r9, #288	; 0x120
    8938:	f57ff04e 	dsb	st
    893c:	ebfffffe 	bl	0 <arm_heavy_mb>
    8940:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    8944:	e0839009 	add	r9, r3, r9
    8948:	e589a000 	str	sl, [r9]
    894c:	e5952004 	ldr	r2, [r5, #4]
    8950:	e1a04084 	lsl	r4, r4, #1
    8954:	e3a09003 	mov	r9, #3
    8958:	e204301e 	and	r3, r4, #30
    895c:	e3520000 	cmp	r2, #0
    8960:	e1a09319 	lsl	r9, r9, r3
    8964:	11a042c4 	asrne	r4, r4, #5
    8968:	03a04f4b 	moveq	r4, #300	; 0x12c
    896c:	12844096 	addne	r4, r4, #150	; 0x96
    8970:	11a04104 	lslne	r4, r4, #2
    8974:	f57ff04e 	dsb	st
    8978:	ebfffffe 	bl	0 <arm_heavy_mb>
    897c:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    8980:	e0834004 	add	r4, r3, r4
    8984:	e5849000 	str	r9, [r4]
    8988:	e5983e18 	ldr	r3, [r8, #3608]	; 0xe18
    898c:	e1a02c46 	asr	r2, r6, #24
    8990:	e3a09001 	mov	r9, #1
    8994:	e2854d79 	add	r4, r5, #7744	; 0x1e40
    8998:	e2844020 	add	r4, r4, #32
    899c:	e1c33219 	bic	r3, r3, r9, lsl r2
    89a0:	e1a00004 	mov	r0, r4
    89a4:	e5883e18 	str	r3, [r8, #3608]	; 0xe18
    89a8:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    89ac:	e1a01006 	mov	r1, r6
    89b0:	e1a08000 	mov	r8, r0
    89b4:	e3a03000 	mov	r3, #0
    89b8:	e1a00005 	mov	r0, r5
    89bc:	e3a02003 	mov	r2, #3
    89c0:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    89c4:	e1a03009 	mov	r3, r9
    89c8:	e1a01006 	mov	r1, r6
    89cc:	e1a00005 	mov	r0, r5
    89d0:	e3a02003 	mov	r2, #3
    89d4:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    89d8:	e3a03002 	mov	r3, #2
    89dc:	e3a02003 	mov	r2, #3
    89e0:	e1a01006 	mov	r1, r6
    89e4:	e1a00005 	mov	r0, r5
    89e8:	ebfffffe 	bl	7a3c <_ipu_clear_buffer_ready>
    89ec:	e1a01008 	mov	r1, r8
    89f0:	e1a00004 	mov	r0, r4
    89f4:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    89f8:	e1a00007 	mov	r0, r7
    89fc:	ebfffffe 	bl	0 <mutex_unlock>
    8a00:	e3a00000 	mov	r0, #0
    8a04:	e28dd00c 	add	sp, sp, #12
    8a08:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00008a0c <_ipu_channel_status>:
    8a0c:	e5902004 	ldr	r2, [r0, #4]
    8a10:	e2800a01 	add	r0, r0, #4096	; 0x1000
    8a14:	e5903d48 	ldr	r3, [r0, #3400]	; 0xd48
    8a18:	e3520000 	cmp	r2, #0
    8a1c:	13a02e25 	movne	r2, #592	; 0x250
    8a20:	03a02f4e 	moveq	r2, #312	; 0x138
    8a24:	e0833002 	add	r3, r3, r2
    8a28:	e5930000 	ldr	r0, [r3]
    8a2c:	f57ff04f 	dsb	sy
    8a30:	e30e3454 	movw	r3, #58452	; 0xe454
    8a34:	e3403430 	movt	r3, #1072	; 0x430
    8a38:	e1510003 	cmp	r1, r3
    8a3c:	0a000024 	beq	8ad4 <_ipu_channel_status+0xc8>
    8a40:	da00000d 	ble	8a7c <_ipu_channel_status+0x70>
    8a44:	e30f3496 	movw	r3, #62614	; 0xf496
    8a48:	e340362c 	movt	r3, #1580	; 0x62c
    8a4c:	e1510003 	cmp	r1, r3
    8a50:	0a00001b 	beq	8ac4 <_ipu_channel_status+0xb8>
    8a54:	e30e3455 	movw	r3, #58453	; 0xe455
    8a58:	e3413624 	movt	r3, #5668	; 0x1624
    8a5c:	e1510003 	cmp	r1, r3
    8a60:	0a000013 	beq	8ab4 <_ipu_channel_status+0xa8>
    8a64:	e30e3455 	movw	r3, #58453	; 0xe455
    8a68:	e3403530 	movt	r3, #1328	; 0x530
    8a6c:	e1510003 	cmp	r1, r3
    8a70:	0a00000f 	beq	8ab4 <_ipu_channel_status+0xa8>
    8a74:	e3a00000 	mov	r0, #0
    8a78:	e12fff1e 	bx	lr
    8a7c:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    8a80:	e34032bb 	movt	r3, #699	; 0x2bb
    8a84:	e1510003 	cmp	r1, r3
    8a88:	0a00000f 	beq	8acc <_ipu_channel_status+0xc0>
    8a8c:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    8a90:	e34033bf 	movt	r3, #959	; 0x3bf
    8a94:	e1510003 	cmp	r1, r3
    8a98:	0a000007 	beq	8abc <_ipu_channel_status+0xb0>
    8a9c:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    8aa0:	e34031b7 	movt	r3, #439	; 0x1b7
    8aa4:	e1510003 	cmp	r1, r3
    8aa8:	1afffff1 	bne	8a74 <_ipu_channel_status+0x68>
    8aac:	e7e10350 	ubfx	r0, r0, #6, #2
    8ab0:	e12fff1e 	bx	lr
    8ab4:	e7e10150 	ubfx	r0, r0, #2, #2
    8ab8:	e12fff1e 	bx	lr
    8abc:	e7e10550 	ubfx	r0, r0, #10, #2
    8ac0:	e12fff1e 	bx	lr
    8ac4:	e7e10250 	ubfx	r0, r0, #4, #2
    8ac8:	e12fff1e 	bx	lr
    8acc:	e7e10450 	ubfx	r0, r0, #8, #2
    8ad0:	e12fff1e 	bx	lr
    8ad4:	e2000003 	and	r0, r0, #3
    8ad8:	e12fff1e 	bx	lr

00008adc <ipu_pixel_format_has_alpha>:
    8adc:	e3043742 	movw	r3, #18242	; 0x4742
    8ae0:	e3443152 	movt	r3, #16722	; 0x4152
    8ae4:	e1500003 	cmp	r0, r3
    8ae8:	0a000009 	beq	8b14 <ipu_pixel_format_has_alpha+0x38>
    8aec:	e3043241 	movw	r3, #16961	; 0x4241
    8af0:	e3453247 	movt	r3, #21063	; 0x5247
    8af4:	e1500003 	cmp	r0, r3
    8af8:	0a000005 	beq	8b14 <ipu_pixel_format_has_alpha+0x38>
    8afc:	e3043752 	movw	r3, #18258	; 0x4752
    8b00:	e3443142 	movt	r3, #16706	; 0x4142
    8b04:	e1500003 	cmp	r0, r3
    8b08:	0a000001 	beq	8b14 <ipu_pixel_format_has_alpha+0x38>
    8b0c:	e3a00000 	mov	r0, #0
    8b10:	e12fff1e 	bx	lr
    8b14:	e3a00001 	mov	r0, #1
    8b18:	e12fff1e 	bx	lr

00008b1c <ipu_runtime_suspend>:
    8b1c:	e92d4010 	push	{r4, lr}
    8b20:	e1a04000 	mov	r4, r0
    8b24:	e3a00000 	mov	r0, #0
    8b28:	ebfffffe 	bl	0 <release_bus_freq>
    8b2c:	e3000000 	movw	r0, #0
    8b30:	e30037c2 	movw	r3, #1986	; 0x7c2
    8b34:	e3400000 	movt	r0, #0
    8b38:	e19030b3 	ldrh	r3, [r0, r3]
    8b3c:	e3130004 	tst	r3, #4
    8b40:	0a000004 	beq	8b58 <ipu_runtime_suspend+0x3c>
    8b44:	e3002000 	movw	r2, #0
    8b48:	e1a01004 	mov	r1, r4
    8b4c:	e2800e7b 	add	r0, r0, #1968	; 0x7b0
    8b50:	e3402000 	movt	r2, #0
    8b54:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8b58:	e3a00000 	mov	r0, #0
    8b5c:	e8bd8010 	pop	{r4, pc}

00008b60 <ipu_runtime_resume>:
    8b60:	e92d4010 	push	{r4, lr}
    8b64:	e1a04000 	mov	r4, r0
    8b68:	e3a00000 	mov	r0, #0
    8b6c:	ebfffffe 	bl	0 <request_bus_freq>
    8b70:	e3003000 	movw	r3, #0
    8b74:	e30027da 	movw	r2, #2010	; 0x7da
    8b78:	e3403000 	movt	r3, #0
    8b7c:	e19330b2 	ldrh	r3, [r3, r2]
    8b80:	e3130004 	tst	r3, #4
    8b84:	0a000004 	beq	8b9c <ipu_runtime_resume+0x3c>
    8b88:	e3002000 	movw	r2, #0
    8b8c:	e1a01004 	mov	r1, r4
    8b90:	e3402000 	movt	r2, #0
    8b94:	e59f0008 	ldr	r0, [pc, #8]	; 8ba4 <ipu_runtime_resume+0x44>
    8b98:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8b9c:	e3a00000 	mov	r0, #0
    8ba0:	e8bd8010 	pop	{r4, pc}
    8ba4:	000007c8 	andeq	r0, r0, r8, asr #15

00008ba8 <sw_probe>:
    8ba8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8bac:	e3004000 	movw	r4, #0
    8bb0:	e3404000 	movt	r4, #0
    8bb4:	e1a01000 	mov	r1, r0
    8bb8:	e3012ee4 	movw	r2, #7908	; 0x1ee4
    8bbc:	e1a00004 	mov	r0, r4
    8bc0:	ebfffffe 	bl	0 <memcpy>
    8bc4:	e3a00509 	mov	r0, #37748736	; 0x2400000
    8bc8:	e59f5130 	ldr	r5, [pc, #304]	; 8d00 <sw_probe+0x158>
    8bcc:	ebfffffe 	bl	0 <get_device_base>
    8bd0:	e3003000 	movw	r3, #0
    8bd4:	e1a0c000 	mov	ip, r0
    8bd8:	e3403000 	movt	r3, #0
    8bdc:	e2842a01 	add	r2, r4, #4096	; 0x1000
    8be0:	e593600c 	ldr	r6, [r3, #12]
    8be4:	e2850014 	add	r0, r5, #20
    8be8:	e593e008 	ldr	lr, [r3, #8]
    8bec:	e3a01004 	mov	r1, #4
    8bf0:	e5937004 	ldr	r7, [r3, #4]
    8bf4:	e086600c 	add	r6, r6, ip
    8bf8:	e08ee00c 	add	lr, lr, ip
    8bfc:	e5826d54 	str	r6, [r2, #3412]	; 0xd54
    8c00:	e582ed4c 	str	lr, [r2, #3404]	; 0xd4c
    8c04:	e087700c 	add	r7, r7, ip
    8c08:	e5936024 	ldr	r6, [r3, #36]	; 0x24
    8c0c:	e593e028 	ldr	lr, [r3, #40]	; 0x28
    8c10:	e5827d48 	str	r7, [r2, #3400]	; 0xd48
    8c14:	e086600c 	add	r6, r6, ip
    8c18:	e5937034 	ldr	r7, [r3, #52]	; 0x34
    8c1c:	e08ee00c 	add	lr, lr, ip
    8c20:	e5826d58 	str	r6, [r2, #3416]	; 0xd58
    8c24:	e582ed60 	str	lr, [r2, #3424]	; 0xd60
    8c28:	e593601c 	ldr	r6, [r3, #28]
    8c2c:	e087700c 	add	r7, r7, ip
    8c30:	e593e020 	ldr	lr, [r3, #32]
    8c34:	e5827d50 	str	r7, [r2, #3408]	; 0xd50
    8c38:	e086600c 	add	r6, r6, ip
    8c3c:	e5937018 	ldr	r7, [r3, #24]
    8c40:	e08ee00c 	add	lr, lr, ip
    8c44:	e5826d68 	str	r6, [r2, #3432]	; 0xd68
    8c48:	e582ed6c 	str	lr, [r2, #3436]	; 0xd6c
    8c4c:	e5936014 	ldr	r6, [r3, #20]
    8c50:	e087700c 	add	r7, r7, ip
    8c54:	e593e030 	ldr	lr, [r3, #48]	; 0x30
    8c58:	e5827d64 	str	r7, [r2, #3428]	; 0xd64
    8c5c:	e086600c 	add	r6, r6, ip
    8c60:	e5937010 	ldr	r7, [r3, #16]
    8c64:	e08ee00c 	add	lr, lr, ip
    8c68:	e5826d74 	str	r6, [r2, #3444]	; 0xd74
    8c6c:	e582ed78 	str	lr, [r2, #3448]	; 0xd78
    8c70:	e5936038 	ldr	r6, [r3, #56]	; 0x38
    8c74:	e087700c 	add	r7, r7, ip
    8c78:	e593e03c 	ldr	lr, [r3, #60]	; 0x3c
    8c7c:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
    8c80:	e086600c 	add	r6, r6, ip
    8c84:	e5827d70 	str	r7, [r2, #3440]	; 0xd70
    8c88:	e08ee00c 	add	lr, lr, ip
    8c8c:	e5826d7c 	str	r6, [r2, #3452]	; 0xd7c
    8c90:	e083c00c 	add	ip, r3, ip
    8c94:	e582ed5c 	str	lr, [r2, #3420]	; 0xd5c
    8c98:	e582cd80 	str	ip, [r2, #3456]	; 0xd80
    8c9c:	ebfffffe 	bl	0 <__memzero>
    8ca0:	e2850018 	add	r0, r5, #24
    8ca4:	e3a01004 	mov	r1, #4
    8ca8:	ebfffffe 	bl	0 <__memzero>
    8cac:	e1a00005 	mov	r0, r5
    8cb0:	e3a01014 	mov	r1, #20
    8cb4:	ebfffffe 	bl	0 <__memzero>
    8cb8:	e3002000 	movw	r2, #0
    8cbc:	e3001000 	movw	r1, #0
    8cc0:	e1a00005 	mov	r0, r5
    8cc4:	e3402000 	movt	r2, #0
    8cc8:	e3401000 	movt	r1, #0
    8ccc:	ebfffffe 	bl	0 <__mutex_init>
    8cd0:	e3001000 	movw	r1, #0
    8cd4:	e1a02004 	mov	r2, r4
    8cd8:	e3401000 	movt	r1, #0
    8cdc:	e3a00025 	mov	r0, #37	; 0x25
    8ce0:	ebfffffe 	bl	0 <ldr_sw_irq_register>
    8ce4:	e3001000 	movw	r1, #0
    8ce8:	e1a02004 	mov	r2, r4
    8cec:	e3401000 	movt	r1, #0
    8cf0:	e3a00026 	mov	r0, #38	; 0x26
    8cf4:	ebfffffe 	bl	0 <ldr_sw_irq_register>
    8cf8:	e3a00000 	mov	r0, #0
    8cfc:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    8d00:	00003d30 	andeq	r3, r0, r0, lsr sp

00008d04 <sw_ipu_init_channel>:
    8d04:	e1a03000 	mov	r3, r0
    8d08:	e3000000 	movw	r0, #0
    8d0c:	e2832004 	add	r2, r3, #4
    8d10:	e5931000 	ldr	r1, [r3]
    8d14:	e3400000 	movt	r0, #0
    8d18:	eafffffe 	b	61f8 <ipu_init_channel>

00008d1c <sw_ipu_uninit_channel>:
    8d1c:	e92d4010 	push	{r4, lr}
    8d20:	e5901000 	ldr	r1, [r0]
    8d24:	e3000000 	movw	r0, #0
    8d28:	e3400000 	movt	r0, #0
    8d2c:	ebfffffe 	bl	2698 <ipu_uninit_channel>
    8d30:	e3a00000 	mov	r0, #0
    8d34:	e8bd8010 	pop	{r4, pc}

00008d38 <sw_ipu_init_channel_buffer>:
    8d38:	e1a0c000 	mov	ip, r0
    8d3c:	e92d4030 	push	{r4, r5, lr}
    8d40:	e59c502c 	ldr	r5, [ip, #44]	; 0x2c
    8d44:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    8d48:	e3000000 	movw	r0, #0
    8d4c:	e59ce028 	ldr	lr, [ip, #40]	; 0x28
    8d50:	e3400000 	movt	r0, #0
    8d54:	e59c3008 	ldr	r3, [ip, #8]
    8d58:	e89c0006 	ldm	ip, {r1, r2}
    8d5c:	e59c4024 	ldr	r4, [ip, #36]	; 0x24
    8d60:	e58d5020 	str	r5, [sp, #32]
    8d64:	e58de01c 	str	lr, [sp, #28]
    8d68:	e59ce020 	ldr	lr, [ip, #32]
    8d6c:	e58d4018 	str	r4, [sp, #24]
    8d70:	e59c401c 	ldr	r4, [ip, #28]
    8d74:	e58de014 	str	lr, [sp, #20]
    8d78:	e59ce018 	ldr	lr, [ip, #24]
    8d7c:	e58d4010 	str	r4, [sp, #16]
    8d80:	e59c4014 	ldr	r4, [ip, #20]
    8d84:	e58de00c 	str	lr, [sp, #12]
    8d88:	e1dce1b0 	ldrh	lr, [ip, #16]
    8d8c:	e1dcc0bc 	ldrh	ip, [ip, #12]
    8d90:	e58d4008 	str	r4, [sp, #8]
    8d94:	e88d5000 	stm	sp, {ip, lr}
    8d98:	ebfffffe 	bl	322c <ipu_init_channel_buffer>
    8d9c:	e28dd02c 	add	sp, sp, #44	; 0x2c
    8da0:	e8bd8030 	pop	{r4, r5, pc}

00008da4 <sw_ipu_update_channel_buffer>:
    8da4:	e1a0c000 	mov	ip, r0
    8da8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8dac:	e59c3008 	ldr	r3, [ip, #8]
    8db0:	e24dd00c 	sub	sp, sp, #12
    8db4:	e3000000 	movw	r0, #0
    8db8:	e89c0006 	ldm	ip, {r1, r2}
    8dbc:	e3400000 	movt	r0, #0
    8dc0:	e59cc00c 	ldr	ip, [ip, #12]
    8dc4:	e58dc000 	str	ip, [sp]
    8dc8:	ebfffffe 	bl	1a10 <ipu_update_channel_buffer>
    8dcc:	e28dd00c 	add	sp, sp, #12
    8dd0:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00008dd4 <sw_ipu_select_buffer>:
    8dd4:	e1a01000 	mov	r1, r0
    8dd8:	e3000000 	movw	r0, #0
    8ddc:	e5913008 	ldr	r3, [r1, #8]
    8de0:	e3400000 	movt	r0, #0
    8de4:	e8910006 	ldm	r1, {r1, r2}
    8de8:	eafffffe 	b	175c <ipu_select_buffer>

00008dec <sw_ipu_enable_channel>:
    8dec:	e5901000 	ldr	r1, [r0]
    8df0:	e3000000 	movw	r0, #0
    8df4:	e3400000 	movt	r0, #0
    8df8:	eafffffe 	b	57e0 <ipu_enable_channel>

00008dfc <sw_ipu_disable_channel>:
    8dfc:	e1a03000 	mov	r3, r0
    8e00:	e3000000 	movw	r0, #0
    8e04:	e5d32004 	ldrb	r2, [r3, #4]
    8e08:	e3400000 	movt	r0, #0
    8e0c:	e5931000 	ldr	r1, [r3]
    8e10:	eafffffe 	b	7b5c <ipu_disable_channel>

00008e14 <sw_ipu_enable_csi>:
    8e14:	e5901000 	ldr	r1, [r0]
    8e18:	e3000000 	movw	r0, #0
    8e1c:	e3400000 	movt	r0, #0
    8e20:	eafffffe 	b	6cac <ipu_enable_csi>

00008e24 <sw_ipu_disable_csi>:
    8e24:	e5901000 	ldr	r1, [r0]
    8e28:	e3000000 	movw	r0, #0
    8e2c:	e3400000 	movt	r0, #0
    8e30:	eafffffe 	b	6da0 <ipu_disable_csi>

00008e34 <sw_ipu_request_irq>:
    8e34:	e92d4030 	push	{r4, r5, lr}
    8e38:	e280500c 	add	r5, r0, #12
    8e3c:	e1a04000 	mov	r4, r0
    8e40:	e24dd00c 	sub	sp, sp, #12
    8e44:	e1a00005 	mov	r0, r5
    8e48:	ebfffffe 	bl	0 <strlen>
    8e4c:	e2800004 	add	r0, r0, #4
    8e50:	e5943008 	ldr	r3, [r4, #8]
    8e54:	e3c00003 	bic	r0, r0, #3
    8e58:	e5942004 	ldr	r2, [r4, #4]
    8e5c:	e0840000 	add	r0, r4, r0
    8e60:	e5941000 	ldr	r1, [r4]
    8e64:	e590c00c 	ldr	ip, [r0, #12]
    8e68:	e3000000 	movw	r0, #0
    8e6c:	e3400000 	movt	r0, #0
    8e70:	e88d1020 	stm	sp, {r5, ip}
    8e74:	ebfffffe 	bl	708c <ipu_request_irq>
    8e78:	e28dd00c 	add	sp, sp, #12
    8e7c:	e8bd8030 	pop	{r4, r5, pc}

00008e80 <sw_ipu_free_irq>:
    8e80:	e1a03000 	mov	r3, r0
    8e84:	e3000000 	movw	r0, #0
    8e88:	e92d4010 	push	{r4, lr}
    8e8c:	e3400000 	movt	r0, #0
    8e90:	e5932004 	ldr	r2, [r3, #4]
    8e94:	e5931000 	ldr	r1, [r3]
    8e98:	ebfffffe 	bl	7220 <ipu_free_irq>
    8e9c:	e3a00000 	mov	r0, #0
    8ea0:	e8bd8010 	pop	{r4, pc}

00008ea4 <sw_ipu_sync_irq_handler>:
    8ea4:	e92d4010 	push	{r4, lr}
    8ea8:	e1a04000 	mov	r4, r0
    8eac:	e3a00001 	mov	r0, #1
    8eb0:	ebfffffe 	bl	0 <ldr_sw_set_cur_driver_id>
    8eb4:	e594100c 	ldr	r1, [r4, #12]
    8eb8:	e5940000 	ldr	r0, [r4]
    8ebc:	e8bd4010 	pop	{r4, lr}
    8ec0:	eafff413 	b	5f14 <ipu_sync_irq_handler>

00008ec4 <sw_ipu_err_irq_handler>:
    8ec4:	e92d4010 	push	{r4, lr}
    8ec8:	e1a04000 	mov	r4, r0
    8ecc:	e3a00001 	mov	r0, #1
    8ed0:	ebfffffe 	bl	0 <ldr_sw_set_cur_driver_id>
    8ed4:	e594100c 	ldr	r1, [r4, #12]
    8ed8:	e5940000 	ldr	r0, [r4]
    8edc:	e8bd4010 	pop	{r4, lr}
    8ee0:	eaffe283 	b	18f4 <ipu_err_irq_handler>

Disassembly of section .init.text:

00000000 <init_module>:
   0:	e3002000 	movw	r2, #0
   4:	e3001000 	movw	r1, #0
   8:	e92d4010 	push	{r4, lr}
   c:	e3402000 	movt	r2, #0
  10:	e3401000 	movt	r1, #0
  14:	e3a00001 	mov	r0, #1
  18:	ebfffffe 	bl	0 <ldr_sw_driver_register>
  1c:	e3003000 	movw	r3, #0
  20:	e3a02000 	mov	r2, #0
  24:	e3403000 	movt	r3, #0
  28:	e1a00002 	mov	r0, r2
  2c:	e5832000 	str	r2, [r3]
  30:	e8bd8010 	pop	{r4, pc}

Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	e12fff1e 	bx	lr

Disassembly of section ___kcrctab_gpl+ipu_get_soc:

00000000 <___kcrctab_gpl+ipu_get_soc>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_disable_hsp_clk:

00000000 <___kcrctab+ipu_disable_hsp_clk>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_init_channel:

00000000 <___kcrctab+ipu_init_channel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_uninit_channel:

00000000 <___kcrctab+ipu_uninit_channel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_init_channel_buffer:

00000000 <___kcrctab+ipu_init_channel_buffer>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_update_channel_buffer:

00000000 <___kcrctab+ipu_update_channel_buffer>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_set_channel_bandmode:

00000000 <___kcrctab+ipu_set_channel_bandmode>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_update_channel_offset:

00000000 <___kcrctab+ipu_update_channel_offset>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_get_channel_offset:

00000000 <___kcrctab+ipu_get_channel_offset>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_select_buffer:

00000000 <___kcrctab+ipu_select_buffer>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_select_multi_vdi_buffer:

00000000 <___kcrctab+ipu_select_multi_vdi_buffer>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_link_channels:

00000000 <___kcrctab+ipu_link_channels>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_unlink_channels:

00000000 <___kcrctab+ipu_unlink_channels>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_is_channel_busy:

00000000 <___kcrctab+ipu_is_channel_busy>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_enable_channel:

00000000 <___kcrctab+ipu_enable_channel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_check_buffer_ready:

00000000 <___kcrctab+ipu_check_buffer_ready>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_clear_buffer_ready:

00000000 <___kcrctab+ipu_clear_buffer_ready>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_disable_channel:

00000000 <___kcrctab+ipu_disable_channel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_enable_csi:

00000000 <___kcrctab+ipu_enable_csi>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_disable_csi:

00000000 <___kcrctab+ipu_disable_csi>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_enable_irq:

00000000 <___kcrctab+ipu_enable_irq>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_disable_irq:

00000000 <___kcrctab+ipu_disable_irq>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_clear_irq:

00000000 <___kcrctab+ipu_clear_irq>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_get_irq_status:

00000000 <___kcrctab+ipu_get_irq_status>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_request_irq:

00000000 <___kcrctab+ipu_request_irq>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_free_irq:

00000000 <___kcrctab+ipu_free_irq>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_get_cur_buffer_idx:

00000000 <___kcrctab+ipu_get_cur_buffer_idx>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_channel_status:

00000000 <___kcrctab+ipu_channel_status>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_swap_channel:

00000000 <___kcrctab+ipu_swap_channel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+bytes_per_pixel:

00000000 <___kcrctab+bytes_per_pixel>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+format_to_colorspace:

00000000 <___kcrctab+format_to_colorspace>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_ch_param_bad_alpha_pos:

00000000 <___kcrctab+ipu_ch_param_bad_alpha_pos>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_pixel_format_is_gpu_tile:

00000000 <___kcrctab+ipu_pixel_format_is_gpu_tile>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_pixel_format_is_split_gpu_tile:

00000000 <___kcrctab+ipu_pixel_format_is_split_gpu_tile>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_pixel_format_is_pre_yuv:

00000000 <___kcrctab+ipu_pixel_format_is_pre_yuv>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_pixel_format_is_multiplanar_yuv:

00000000 <___kcrctab+ipu_pixel_format_is_multiplanar_yuv>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section ___kcrctab+ipu_ch_param_get_axi_id:

00000000 <___kcrctab+ipu_ch_param_get_axi_id>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section .ARM.exidx:

00000000 <.ARM.exidx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80b0b0b0 	ldrhthi	fp, [r0], r0
   8:	00000030 	andeq	r0, r0, r0, lsr r0
   c:	80acb0b0 	strhthi	fp, [ip], r0
  10:	00000560 	andeq	r0, r0, r0, ror #10
  14:	80a8b0b0 	strhthi	fp, [r8], r0
  18:	000005e4 	andeq	r0, r0, r4, ror #11
  1c:	80acb0b0 	strhthi	fp, [ip], r0
  20:	000006d4 	ldrdeq	r0, [r0], -r4
  24:	80b0b0b0 	ldrhthi	fp, [r0], r0
  28:	000008a0 	andeq	r0, r0, r0, lsr #17
  2c:	80b0b0b0 	ldrhthi	fp, [r0], r0
  30:	00000a40 	andeq	r0, r0, r0, asr #20
  34:	80b0b0b0 	ldrhthi	fp, [r0], r0
  38:	00000a90 	muleq	r0, r0, sl
  3c:	80b0b0b0 	ldrhthi	fp, [r0], r0
  40:	00000b2c 	andeq	r0, r0, ip, lsr #22
  44:	80b0b0b0 	ldrhthi	fp, [r0], r0
  48:	00000b7c 	andeq	r0, r0, ip, ror fp
  4c:	80b0b0b0 	ldrhthi	fp, [r0], r0
  50:	00000bac 	andeq	r0, r0, ip, lsr #23
  54:	80b0b0b0 	ldrhthi	fp, [r0], r0
  58:	00000c88 	andeq	r0, r0, r8, lsl #25
  5c:	80b0b0b0 	ldrhthi	fp, [r0], r0
  60:	00000c90 	muleq	r0, r0, ip
  64:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
  68:	0000175c 	andeq	r1, r0, ip, asr r7
  6c:	80aeb0b0 	strhthi	fp, [lr], r0
  70:	0000187c 	andeq	r1, r0, ip, ror r8
  74:	80acb0b0 	strhthi	fp, [ip], r0
  78:	000018f4 	strdeq	r1, [r0], -r4
  7c:	8006adb0 			; <UNDEFINED> instruction: 0x8006adb0
  80:	00001a10 	andeq	r1, r0, r0, lsl sl
  84:	8004afb0 			; <UNDEFINED> instruction: 0x8004afb0
  88:	00001ca4 	andeq	r1, r0, r4, lsr #25
  8c:	8001aeb0 			; <UNDEFINED> instruction: 0x8001aeb0
  90:	00001e58 	andeq	r1, r0, r8, asr lr
  94:	80b108af 	adcshi	r0, r1, pc, lsr #17
  98:	0000236c 	andeq	r2, r0, ip, ror #6
  9c:	80b108af 	adcshi	r0, r1, pc, lsr #17
  a0:	00002698 	muleq	r0, r8, r6
  a4:	8006afb0 			; <UNDEFINED> instruction: 0x8006afb0
  a8:	00003108 	andeq	r3, r0, r8, lsl #2
  ac:	80a8b0b0 	strhthi	fp, [r8], r0
  b0:	0000322c 	andeq	r3, r0, ip, lsr #4
  b4:	8024afb0 	strhthi	sl, [r4], -r0
  b8:	000057e0 	andeq	r5, r0, r0, ror #15
  bc:	8004afb0 			; <UNDEFINED> instruction: 0x8004afb0
  c0:	00005f14 	andeq	r5, r0, r4, lsl pc
  c4:	8010afb0 			; <UNDEFINED> instruction: 0x8010afb0
  c8:	000061e0 	andeq	r6, r0, r0, ror #3
  cc:	80a8b0b0 	strhthi	fp, [r8], r0
  d0:	000061f8 	strdeq	r6, [r0], -r8
  d4:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
  d8:	00006cac 	andeq	r6, r0, ip, lsr #25
  dc:	8002abb0 			; <UNDEFINED> instruction: 0x8002abb0
  e0:	00006da0 	andeq	r6, r0, r0, lsr #27
  e4:	80acb0b0 	strhthi	fp, [ip], r0
  e8:	00006e58 	andeq	r6, r0, r8, asr lr
  ec:	80aeb0b0 	strhthi	fp, [lr], r0
  f0:	00006f28 	andeq	r6, r0, r8, lsr #30
  f4:	80aeb0b0 	strhthi	fp, [lr], r0
  f8:	00006fa4 	andeq	r6, r0, r4, lsr #31
  fc:	80acb0b0 	strhthi	fp, [ip], r0
 100:	0000701c 	andeq	r7, r0, ip, lsl r0
 104:	80acb0b0 	strhthi	fp, [ip], r0
 108:	0000708c 	andeq	r7, r0, ip, lsl #1
 10c:	80aeb0b0 	strhthi	fp, [lr], r0
 110:	00007220 	andeq	r7, r0, r0, lsr #4
 114:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
 118:	0000735c 	andeq	r7, r0, ip, asr r3
 11c:	8001aab0 			; <UNDEFINED> instruction: 0x8001aab0
 120:	000073e8 	andeq	r7, r0, r8, ror #7
 124:	80aab0b0 	strhthi	fp, [sl], r0
 128:	0000745c 	andeq	r7, r0, ip, asr r4
 12c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 130:	00007460 	andeq	r7, r0, r0, ror #8
 134:	80aab0b0 	strhthi	fp, [sl], r0
 138:	00007a3c 	andeq	r7, r0, ip, lsr sl
 13c:	80acb0b0 	strhthi	fp, [ip], r0
 140:	00007b10 	andeq	r7, r0, r0, lsl fp
 144:	80aeb0b0 	strhthi	fp, [lr], r0
 148:	00007b5c 	andeq	r7, r0, ip, asr fp
 14c:	801eafb0 			; <UNDEFINED> instruction: 0x801eafb0
 150:	00008830 	andeq	r8, r0, r0, lsr r8
 154:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
 158:	00008a0c 	andeq	r8, r0, ip, lsl #20
 15c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 160:	00008adc 	ldrdeq	r8, [r0], -ip
 164:	80b0b0b0 	ldrhthi	fp, [r0], r0
 168:	00008b1c 	andeq	r8, r0, ip, lsl fp
 16c:	80a8b0b0 	strhthi	fp, [r8], r0
 170:	00008b60 	andeq	r8, r0, r0, ror #22
 174:	80a8b0b0 	strhthi	fp, [r8], r0
 178:	00008ba8 	andeq	r8, r0, r8, lsr #23
 17c:	80acb0b0 	strhthi	fp, [ip], r0
 180:	00008d04 	andeq	r8, r0, r4, lsl #26
 184:	80b0b0b0 	ldrhthi	fp, [r0], r0
 188:	00008d1c 	andeq	r8, r0, ip, lsl sp
 18c:	80a8b0b0 	strhthi	fp, [r8], r0
 190:	00008d38 	andeq	r8, r0, r8, lsr sp
 194:	800aa9b0 			; <UNDEFINED> instruction: 0x800aa9b0
 198:	00008da4 	andeq	r8, r0, r4, lsr #27
 19c:	80028400 	andhi	r8, r2, r0, lsl #8
 1a0:	00008dd4 	ldrdeq	r8, [r0], -r4
 1a4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1a8:	00008dec 	andeq	r8, r0, ip, ror #27
 1ac:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1b0:	00008dfc 	strdeq	r8, [r0], -ip
 1b4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1b8:	00008e14 	andeq	r8, r0, r4, lsl lr
 1bc:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1c0:	00008e24 	andeq	r8, r0, r4, lsr #28
 1c4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1c8:	00008e34 	andeq	r8, r0, r4, lsr lr
 1cc:	8002a9b0 			; <UNDEFINED> instruction: 0x8002a9b0
 1d0:	00008e80 	andeq	r8, r0, r0, lsl #29
 1d4:	80a8b0b0 	strhthi	fp, [r8], r0
 1d8:	00008ea4 	andeq	r8, r0, r4, lsr #29
 1dc:	80a8b0b0 	strhthi	fp, [r8], r0
 1e0:	00008ec4 	andeq	r8, r0, r4, asr #29
 1e4:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section .ARM.exidx.init.text:

00000000 <.ARM.exidx.init.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section .ARM.exidx.exit.text:

00000000 <.ARM.exidx.exit.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80b0b0b0 	ldrhthi	fp, [r0], r0

Disassembly of section .rodata:

00000000 <CSWTCH.586>:
   0:	00000040 	andeq	r0, r0, r0, asr #32
   4:	00000041 	andeq	r0, r0, r1, asr #32
   8:	00000042 	andeq	r0, r0, r2, asr #32
   c:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  10:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  14:	00000043 	andeq	r0, r0, r3, asr #32
  18:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  1c:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  20:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  24:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  28:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  2c:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  30:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  34:	00000044 	andeq	r0, r0, r4, asr #32
  38:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  3c:	00000045 	andeq	r0, r0, r5, asr #32
  40:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  44:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  48:	ffffffea 			; <UNDEFINED> instruction: 0xffffffea
  4c:	00000046 	andeq	r0, r0, r6, asr #32
  50:	00000047 	andeq	r0, r0, r7, asr #32
  54:	00000005 	andeq	r0, r0, r5
  58:	00000006 	andeq	r0, r0, r6
  5c:	00000009 	andeq	r0, r0, r9
  60:	0000000a 	andeq	r0, r0, sl
  64:	00000000 	andeq	r0, r0, r0

00000068 <__func__.37960>:
  68:	5f757069 	svcpl	0x00757069
  6c:	61647075 	smcvs	18181	; 0x4705
  70:	635f6574 	cmpvs	pc, #116, 10	; 0x1d000000
  74:	6e6e6168 	powvsez	f6, f6, #0.0
  78:	625f6c65 	subsvs	r6, pc, #25856	; 0x6500
  7c:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
  80:	00000072 	andeq	r0, r0, r2, ror r0

00000084 <proc_dest_sel>:
  84:	00000000 	andeq	r0, r0, r0
  88:	00000001 	andeq	r0, r0, r1
  8c:	00000001 	andeq	r0, r0, r1
  90:	00000003 	andeq	r0, r0, r3
  94:	00000005 	andeq	r0, r0, r5
  98:	00000005 	andeq	r0, r0, r5
  9c:	00000004 	andeq	r0, r0, r4
  a0:	00000007 	andeq	r0, r0, r7
  a4:	00000008 	andeq	r0, r0, r8
  a8:	00000009 	andeq	r0, r0, r9
  ac:	0000000a 	andeq	r0, r0, sl
  b0:	0000000b 	andeq	r0, r0, fp
  b4:	0000000c 	andeq	r0, r0, ip
  b8:	0000000e 	andeq	r0, r0, lr
  bc:	0000000f 	andeq	r0, r0, pc
  c0:	00000010 	andeq	r0, r0, r0, lsl r0
  c4:	00000000 	andeq	r0, r0, r0
  c8:	00000001 	andeq	r0, r0, r1
  cc:	00000001 	andeq	r0, r0, r1
  d0:	00000005 	andeq	r0, r0, r5
  d4:	00000005 	andeq	r0, r0, r5
  d8:	00000005 	andeq	r0, r0, r5
  dc:	00000005 	andeq	r0, r0, r5
  e0:	00000005 	andeq	r0, r0, r5
  e4:	00000007 	andeq	r0, r0, r7
  e8:	00000008 	andeq	r0, r0, r8
  ec:	00000009 	andeq	r0, r0, r9
  f0:	0000000a 	andeq	r0, r0, sl
  f4:	0000000b 	andeq	r0, r0, fp
  f8:	0000000c 	andeq	r0, r0, ip
  fc:	0000000e 	andeq	r0, r0, lr
 100:	0000001f 	andeq	r0, r0, pc, lsl r0

00000104 <proc_src_sel>:
 104:	00000000 	andeq	r0, r0, r0
 108:	00000006 	andeq	r0, r0, r6
 10c:	00000007 	andeq	r0, r0, r7
 110:	00000006 	andeq	r0, r0, r6
 114:	00000007 	andeq	r0, r0, r7
 118:	00000008 	andeq	r0, r0, r8
 11c:	00000005 	andeq	r0, r0, r5
 120:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 124:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 128:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 12c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 130:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 134:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 138:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 13c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 140:	00000001 	andeq	r0, r0, r1
 144:	00000002 	andeq	r0, r0, r2
 148:	00000003 	andeq	r0, r0, r3
 14c:	00000004 	andeq	r0, r0, r4
 150:	00000007 	andeq	r0, r0, r7
 154:	00000008 	andeq	r0, r0, r8
 158:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 15c:	00000008 	andeq	r0, r0, r8
 160:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff

00000164 <disp_src_sel>:
 164:	00000000 	andeq	r0, r0, r0
 168:	00000006 	andeq	r0, r0, r6
 16c:	00000007 	andeq	r0, r0, r7
 170:	00000008 	andeq	r0, r0, r8
 174:	00000003 	andeq	r0, r0, r3
 178:	00000004 	andeq	r0, r0, r4
 17c:	00000005 	andeq	r0, r0, r5
 180:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 184:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 188:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 18c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 190:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 194:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 198:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 19c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1a0:	00000001 	andeq	r0, r0, r1
 1a4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1a8:	00000002 	andeq	r0, r0, r2
 1ac:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1b0:	00000003 	andeq	r0, r0, r3
 1b4:	00000004 	andeq	r0, r0, r4
 1b8:	00000004 	andeq	r0, r0, r4
 1bc:	00000004 	andeq	r0, r0, r4
 1c0:	00000004 	andeq	r0, r0, r4
 1c4:	00000001 	andeq	r0, r0, r1
 1c8:	00000002 	andeq	r0, r0, r2
 1cc:	00000003 	andeq	r0, r0, r3
 1d0:	00000004 	andeq	r0, r0, r4
 1d4:	0000000b 	andeq	r0, r0, fp
 1d8:	0000000c 	andeq	r0, r0, ip
 1dc:	0000000d 	andeq	r0, r0, sp
 1e0:	0000000e 	andeq	r0, r0, lr
 1e4:	0000000f 	andeq	r0, r0, pc
 1e8:	00000000 	andeq	r0, r0, r0

000001ec <__func__.37784>:
 1ec:	5f757069 	svcpl	0x00757069
 1f0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 1f4:	6168635f 	cmnvs	r8, pc, asr r3
 1f8:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 1fc:	00000000 	andeq	r0, r0, r0

00000200 <__func__.38322>:
 200:	5f757069 	svcpl	0x00757069
 204:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 208:	635f656c 	cmpvs	pc, #108, 10	; 0x1b000000
 20c:	00006973 	andeq	r6, r0, r3, ror r9

00000210 <__func__.38451>:
 210:	5f757069 	svcpl	0x00757069
 214:	75716572 	ldrbvc	r6, [r1, #-1394]!	; 0xfffffa8e
 218:	5f747365 	svcpl	0x00747365
 21c:	00717269 	rsbseq	r7, r1, r9, ror #4

00000220 <__func__.38473>:
 220:	5f757069 	svcpl	0x00757069
 224:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
 228:	7172695f 	cmnvc	r2, pc, asr r9
 22c:	00000000 	andeq	r0, r0, r0

00000230 <__func__.38522>:
 230:	5f757069 	svcpl	0x00757069
 234:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 238:	5f6c656e 	svcpl	0x006c656e
 23c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 240:	00007375 	andeq	r7, r0, r5, ror r3

00000244 <__func__.38357>:
 244:	5f757069 	svcpl	0x00757069
 248:	636e7973 	cmnvs	lr, #1884160	; 0x1cc000
 24c:	7172695f 	cmnvc	r2, pc, asr r9
 250:	6e61685f 	mcrvs	8, 3, r6, cr1, cr15, {2}
 254:	72656c64 	rsbvc	r6, r5, #100, 24	; 0x6400
 258:	00000000 	andeq	r0, r0, r0

0000025c <__func__.38711>:
 25c:	5f757069 	svcpl	0x00757069
 260:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
 264:	5f656d69 	svcpl	0x00656d69
 268:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
 26c:	0000656d 	andeq	r6, r0, sp, ror #10

00000270 <__func__.38706>:
 270:	5f757069 	svcpl	0x00757069
 274:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
 278:	5f656d69 	svcpl	0x00656d69
 27c:	70737573 	rsbsvc	r7, r3, r3, ror r5
 280:	00646e65 	rsbeq	r6, r4, r5, ror #28

00000284 <__func__.38291>:
 284:	5f757069 	svcpl	0x00757069
 288:	61736964 	cmnvs	r3, r4, ror #18
 28c:	5f656c62 	svcpl	0x00656c62
 290:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 294:	006c656e 	rsbeq	r6, ip, lr, ror #10

00000298 <__func__.38206>:
 298:	5f757069 	svcpl	0x00757069
 29c:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 2a0:	635f656c 	cmpvs	pc, #108, 10	; 0x1b000000
 2a4:	6e6e6168 	powvsez	f6, f6, #0.0
 2a8:	00006c65 	andeq	r6, r0, r5, ror #24

000002ac <__func__.37144>:
 2ac:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 2b0:	5f68635f 	svcpl	0x0068635f
 2b4:	61726170 	cmnvs	r2, r0, ror r1
 2b8:	65735f6d 	ldrbvs	r5, [r3, #-3949]!	; 0xfffff093
 2bc:	61625f74 	smcvs	9716	; 0x25f4
 2c0:	6f6d646e 	svcvs	0x006d646e
 2c4:	00006564 	andeq	r6, r0, r4, ror #10

000002c8 <__func__.37979>:
 2c8:	5f757069 	svcpl	0x00757069
 2cc:	5f746573 	svcpl	0x00746573
 2d0:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 2d4:	5f6c656e 	svcpl	0x006c656e
 2d8:	646e6162 	strbtvs	r6, [lr], #-354	; 0xfffffe9e
 2dc:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
 2e0:	00000000 	andeq	r0, r0, r0

000002e4 <__func__.35930>:
 2e4:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 2e8:	5f68635f 	svcpl	0x0068635f
 2ec:	61726170 	cmnvs	r2, r0, ror r1
 2f0:	75645f6d 	strbvc	r5, [r4, #-3949]!	; 0xfffff093
 2f4:	0000706d 	andeq	r7, r0, sp, rrx

000002f8 <__func__.36463>:
 2f8:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 2fc:	5f68635f 	svcpl	0x0068635f
 300:	61726170 	cmnvs	r2, r0, ror r1
 304:	6e695f6d 	cdpvs	15, 6, cr5, cr9, cr13, {3}
 308:	00007469 	andeq	r7, r0, r9, ror #8

0000030c <__func__.37893>:
 30c:	5f757069 	svcpl	0x00757069
 310:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 314:	6168635f 	cmnvs	r8, pc, asr r3
 318:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 31c:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 320:	00726566 	rsbseq	r6, r2, r6, ror #10

00000324 <__func__.37829>:
 324:	5f757069 	svcpl	0x00757069
 328:	6e696e75 	mcrvs	14, 3, r6, cr9, cr5, {3}
 32c:	635f7469 	cmpvs	pc, #1761607680	; 0x69000000
 330:	6e6e6168 	powvsez	f6, f6, #0.0
 334:	00006c65 	andeq	r6, r0, r5, ror #24

00000338 <__func__.37747>:
 338:	5f757069 	svcpl	0x00757069
 33c:	706d7564 	rsbvc	r7, sp, r4, ror #10
 340:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 344:	65747369 	ldrbvs	r7, [r4, #-873]!	; 0xfffffc97
 348:	00007372 	andeq	r7, r0, r2, ror r3

0000034c <__mod_of__imx_ipuv3_dt_ids_device_table>:
	...
 38c:	2c6c7366 	stclcs	3, cr7, [ip], #-408	; 0xfffffe68
 390:	35786d69 	ldrbcc	r6, [r8, #-3433]!	; 0xfffff297
 394:	70692d31 	rsbvc	r2, r9, r1, lsr sp
 398:	00000075 	andeq	r0, r0, r5, ror r0
	...
 40c:	00000138 	andeq	r0, r0, r8, lsr r1
	...
 450:	2c6c7366 	stclcs	3, cr7, [ip], #-408	; 0xfffffe68
 454:	35786d69 	ldrbcc	r6, [r8, #-3433]!	; 0xfffff297
 458:	70692d33 	rsbvc	r2, r9, r3, lsr sp
 45c:	00000075 	andeq	r0, r0, r5, ror r0
	...
 4d0:	000000d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
	...
 514:	2c6c7366 	stclcs	3, cr7, [ip], #-408	; 0xfffffe68
 518:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 51c:	70692d71 	rsbvc	r2, r9, r1, ror sp
 520:	00000075 	andeq	r0, r0, r5, ror r0
	...
 5d8:	2c6c7366 	stclcs	3, cr7, [ip], #-408	; 0xfffffe68
 5dc:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 5e0:	692d7071 	pushvs	{r0, r4, r5, r6, ip, sp, lr}
 5e4:	00007570 	andeq	r7, r0, r0, ror r5
	...
 658:	00000068 	andeq	r0, r0, r8, rrx
	...

00000720 <IPU_DRIVER_ID>:
 720:	00000001 	andeq	r0, r0, r1

Disassembly of section .rodata.str1.4:

00000000 <.LC2>:
   0:	2063786d 	rsbcs	r7, r3, sp, ror #16
   4:	3a757069 	bcc	1d5c1b0 <__crc_ipu_ch_param_bad_alpha_pos+0x156ee31>
   8:	696e7520 	stmdbvs	lr!, {r5, r8, sl, ip, sp, lr}^
   c:	656c706d 	strbvs	r7, [ip, #-109]!	; 0xffffff93
  10:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
  14:	70206465 	eorvc	r6, r0, r5, ror #8
  18:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
  1c:	726f6620 	rsbvc	r6, pc, #32, 12	; 0x2000000
  20:	0a74616d 	beq	1d185dc <__crc_ipu_ch_param_bad_alpha_pos+0x152b25d>
  24:	00000000 	andeq	r0, r0, r0

00000028 <.LC3>:
  28:	414d4449 	cmpmi	sp, r9, asr #8
  2c:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
  30:	20552073 	subscs	r2, r5, r3, ror r0
  34:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
  38:	65207465 	strvs	r7, [r0, #-1125]!	; 0xfffffb9b
  3c:	65656378 	strbvs	r6, [r5, #-888]!	; 0xfffffc88
  40:	49207364 	stmdbmi	r0!, {r2, r5, r6, r8, r9, ip, sp, lr}
  44:	6c205550 	cfstr32vs	mvfx5, [r0], #-320	; 0xfffffec0
  48:	74696d69 	strbtvc	r6, [r9], #-3433	; 0xfffff297
  4c:	6f697461 	svcvs	0x00697461
  50:	00000a6e 	andeq	r0, r0, lr, ror #20

00000054 <.LC4>:
  54:	414d4449 	cmpmi	sp, r9, asr #8
  58:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
  5c:	20562073 	subscs	r2, r6, r3, ror r0
  60:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
  64:	65207465 	strvs	r7, [r0, #-1125]!	; 0xfffffb9b
  68:	65656378 	strbvs	r6, [r5, #-888]!	; 0xfffffc88
  6c:	49207364 	stmdbmi	r0!, {r2, r5, r6, r8, r9, ip, sp, lr}
  70:	6c205550 	cfstr32vs	mvfx5, [r0], #-320	; 0xfffffec0
  74:	74696d69 	strbtvc	r6, [r9], #-3433	; 0xfffff297
  78:	6f697461 	svcvs	0x00697461
  7c:	00000a6e 	andeq	r0, r0, lr, ror #20

00000080 <.LC5>:
  80:	414d4449 	cmpmi	sp, r9, asr #8
  84:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
  88:	20552073 	subscs	r2, r5, r3, ror r0
  8c:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
  90:	69207465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, ip, sp, lr}
  94:	6f6e2073 	svcvs	0x006e2073
  98:	2d382074 	ldccs	0, cr2, [r8, #-464]!	; 0xfffffe30
  9c:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
  a0:	696c6120 	stmdbvs	ip!, {r5, r8, sp, lr}^
  a4:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
  a8:	0000000a 	andeq	r0, r0, sl

000000ac <.LC6>:
  ac:	414d4449 	cmpmi	sp, r9, asr #8
  b0:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
  b4:	20562073 	subscs	r2, r6, r3, ror r0
  b8:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
  bc:	69207465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, ip, sp, lr}
  c0:	6f6e2073 	svcvs	0x006e2073
  c4:	2d382074 	ldccs	0, cr2, [r8, #-464]!	; 0xfffffe30
  c8:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
  cc:	696c6120 	stmdbvs	ip!, {r5, r8, sp, lr}^
  d0:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
  d4:	0000000a 	andeq	r0, r0, sl

000000d8 <.LC7>:
  d8:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
  dc:	2c292873 	stccs	8, cr2, [r9], #-460	; 0xfffffe34
  e0:	616d6420 	cmnvs	sp, r0, lsr #8
  e4:	6168635f 	cmnvs	r8, pc, asr r3
  e8:	25203a6e 	strcs	r3, [r0, #-2670]!	; 0xfffff592
  ec:	00000a64 	andeq	r0, r0, r4, ror #20

000000f0 <.LC8>:
  f0:	4d444e42 	stclmi	14, cr4, [r4, #-264]	; 0xfffffef8
  f4:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
  f8:	00202c78 	eoreq	r2, r0, r8, ror ip

000000fc <.LC9>:
  fc:	5f616d64 	svcpl	0x00616d64
 100:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 104:	2c64253a 	cfstr64cs	mvdx2, [r4], #-232	; 0xffffff18
 108:	6e616220 	cdpvs	2, 6, cr6, cr1, cr0, {1}
 10c:	65685f64 	strbvs	r5, [r8, #-3940]!	; 0xfffff09c
 110:	74686769 	strbtvc	r6, [r8], #-1897	; 0xfffff897
 114:	2e64253a 	mcrcs	5, 3, r2, cr4, cr10, {1}
 118:	00000a0a 	andeq	r0, r0, sl, lsl #20

0000011c <.LC10>:
 11c:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
 120:	206c656e 	rsbcs	r6, ip, lr, ror #10
 124:	65726c61 	ldrbvs	r6, [r2, #-3169]!	; 0xfffff39f
 128:	20796461 	rsbscs	r6, r9, r1, ror #8
 12c:	6e696e75 	mcrvs	14, 3, r6, cr9, cr5, {3}
 130:	61697469 	cmnvs	r9, r9, ror #8
 134:	657a696c 	ldrbvs	r6, [sl, #-2412]!	; 0xfffff694
 138:	64252064 	strtvs	r2, [r5], #-100	; 0xffffff9c
 13c:	0000000a 	andeq	r0, r0, sl

00000140 <.LC11>:
 140:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
 144:	206c656e 	rsbcs	r6, ip, lr, ror #10
 148:	69206425 	stmdbvs	r0!, {r0, r2, r5, sl, sp, lr}
 14c:	6f6e2073 	svcvs	0x006e2073
 150:	69642074 	stmdbvs	r4!, {r2, r4, r5, r6, sp}^
 154:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
 158:	202c6465 	eorcs	r6, ip, r5, ror #8
 15c:	61736964 	cmnvs	r3, r4, ror #18
 160:	20656c62 	rsbcs	r6, r5, r2, ror #24
 164:	73726966 	cmnvc	r2, #1671168	; 0x198000
 168:	00000a74 	andeq	r0, r0, r4, ror sl

0000016c <.LC12>:
 16c:	3d206863 	stccc	8, cr6, [r0, #-396]!	; 0xfffffe74
 170:	2c642520 	cfstr64cs	mvdx2, [r4], #-128	; 0xffffff80
 174:	5f6d7020 	svcpl	0x006d7020
 178:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
 17c:	5f656d69 	svcpl	0x00656d69
 180:	20747570 	rsbscs	r7, r4, r0, ror r5
 184:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
 188:	253a6465 	ldrcs	r6, [sl, #-1125]!	; 0xfffffb9b
 18c:	000a2164 	andeq	r2, sl, r4, ror #2

00000190 <.LC13>:
 190:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; dc <.LC7+0x4>
 194:	6f6e2f65 	svcvs	0x006e2f65
 198:	5f6e616c 	svcpl	0x006e616c
 19c:	2f6e6179 	svccs	0x006e6179
 1a0:	6b736544 	blvs	1cd96b8 <__crc_ipu_ch_param_bad_alpha_pos+0x14ec339>
 1a4:	2f706f74 	svccs	0x00706f74
 1a8:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 1ac:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 1b0:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 1b4:	70692f73 	rsbvc	r2, r9, r3, ror pc
 1b8:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
 1bc:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
 1c0:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
 1c4:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 1c8:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 1cc:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
 1d0:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
 1d4:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
 1d8:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; 64 <.LC4+0x10>
 1dc:	2e6e6f6d 	cdpcs	15, 6, cr6, cr14, cr13, {3}
 1e0:	00000063 	andeq	r0, r0, r3, rrx

000001e4 <.LC14>:
 1e4:	5f746f72 	svcpl	0x00746f72
 1e8:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
 1ec:	20736920 	rsbscs	r6, r3, r0, lsr #18
 1f0:	4c4c554e 	cfstr64mi	mvdx5, [ip], {78}	; 0x4e
 1f4:	0000000a 	andeq	r0, r0, sl

000001f8 <.LC15>:
 1f8:	74646977 	strbtvc	r6, [r4], #-2423	; 0xfffff689
 1fc:	25203a68 	strcs	r3, [r0, #-2664]!	; 0xfffff598
 200:	00000a64 	andeq	r0, r0, r4, ror #20

00000204 <.LC16>:
 204:	67696568 	strbvs	r6, [r9, -r8, ror #10]!
 208:	203a7468 	eorscs	r7, sl, r8, ror #8
 20c:	000a6425 	andeq	r6, sl, r5, lsr #8

00000210 <.LC17>:
 210:	69727473 	ldmdbvs	r2!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 214:	203a6564 	eorscs	r6, sl, r4, ror #10
 218:	000a6425 	andeq	r6, sl, r5, lsr #8

0000021c <.LC18>:
 21c:	3a306170 	bcc	c187e4 <__crc_ipu_ch_param_bad_alpha_pos+0x42b465>
 220:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 224:	00000a78 	andeq	r0, r0, r8, ror sl

00000228 <.LC19>:
 228:	3a316170 	bcc	c587f0 <__crc_ipu_ch_param_bad_alpha_pos+0x46b471>
 22c:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 230:	00000a78 	andeq	r0, r0, r8, ror sl

00000234 <.LC20>:
 234:	25203a75 	strcs	r3, [r0, #-2677]!	; 0xfffff58b
 238:	00000a64 	andeq	r0, r0, r4, ror #20

0000023c <.LC21>:
 23c:	25203a76 	strcs	r3, [r0, #-2678]!	; 0xfffff58a
 240:	00000a64 	andeq	r0, r0, r4, ror #20

00000244 <.LC22>:
 244:	20616d64 	rsbcs	r6, r1, r4, ror #26
 248:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 24c:	3a6c656e 	bcc	1b1980c <__crc_ipu_ch_param_bad_alpha_pos+0x132c48d>
 250:	0a642520 	beq	19096d8 <__crc_ipu_ch_param_bad_alpha_pos+0x111c359>
 254:	00000000 	andeq	r0, r0, r0

00000258 <.LC23>:
 258:	69727453 	ldmdbvs	r2!, {r0, r1, r4, r6, sl, ip, sp, lr}^
 25c:	6e206564 	cfsh64vs	mvdx6, mvdx0, #52
 260:	3320746f 			; <UNDEFINED> instruction: 0x3320746f
 264:	69622d32 	stmdbvs	r2!, {r1, r4, r5, r8, sl, fp, sp}^
 268:	6c612074 	stclvs	0, cr2, [r1], #-464	; 0xfffffe30
 26c:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0xfffff897
 270:	73202c64 			; <UNDEFINED> instruction: 0x73202c64
 274:	64697274 	strbtvs	r7, [r9], #-628	; 0xfffffd8c
 278:	203d2065 	eorscs	r2, sp, r5, rrx
 27c:	000a6425 	andeq	r6, sl, r5, lsr #8

00000280 <.LC24>:
 280:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
 284:	756d2068 	strbvc	r2, [sp, #-104]!	; 0xffffff98
 288:	62207473 	eorvs	r7, r0, #1929379840	; 0x73000000
 28c:	20382065 	eorscs	r2, r8, r5, rrx
 290:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
 294:	756d206c 	strbvc	r2, [sp, #-108]!	; 0xffffff94
 298:	7069746c 	rsbvc	r7, r9, ip, ror #8
 29c:	000a656c 	andeq	r6, sl, ip, ror #10

000002a0 <.LC25>:
 2a0:	20696476 	rsbcs	r6, r9, r6, ror r4
 2a4:	74646977 	strbtvc	r6, [r4], #-2423	; 0xfffff689
 2a8:	65682f68 	strbvs	r2, [r8, #-3944]!	; 0xfffff098
 2ac:	74686769 	strbtvc	r6, [r8], #-1897	; 0xfffff897
 2b0:	6d696c20 	stclvs	12, cr6, [r9, #-128]!	; 0xffffff80
 2b4:	64657469 	strbtvs	r7, [r5], #-1129	; 0xfffffb97
 2b8:	72726520 	rsbsvc	r6, r2, #32, 10	; 0x8000000
 2bc:	0000000a 	andeq	r0, r0, sl

000002c0 <.LC26>:
 2c0:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
 2c4:	64206425 	strtvs	r6, [r0], #-1061	; 0xfffffbdb
 2c8:	6e73656f 	cdpvs	5, 7, cr6, cr3, cr15, {3}
 2cc:	73207427 			; <UNDEFINED> instruction: 0x73207427
 2d0:	6f707075 	svcvs	0x00707075
 2d4:	74207472 	strtvc	r7, [r0], #-1138	; 0xfffffb8e
 2d8:	6c706972 	ldclvs	9, cr6, [r0], #-456	; 0xfffffe38
 2dc:	75622065 	strbvc	r2, [r2, #-101]!	; 0xffffff9b
 2e0:	72656666 	rsbvc	r6, r5, #106954752	; 0x6600000
 2e4:	646f6d20 	strbtvs	r6, [pc], #-3360	; 2ec <.LC27>
 2e8:	00000a65 	andeq	r0, r0, r5, ror #20

000002ec <.LC27>:
 2ec:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
 2f0:	73276425 			; <UNDEFINED> instruction: 0x73276425
 2f4:	66756220 	ldrbtvs	r6, [r5], -r0, lsr #4
 2f8:	68702031 	ldmdavs	r0!, {r0, r4, r5, sp}^
 2fc:	63697379 	cmnvs	r9, #-469762047	; 0xe4000001
 300:	61206c61 			; <UNDEFINED> instruction: 0x61206c61
 304:	20726464 	rsbscs	r6, r2, r4, ror #8
 308:	4e207369 	cdpmi	3, 2, cr7, cr0, cr9, {3}
 30c:	204c4c55 	subcs	r4, ip, r5, asr ip
 310:	20726f66 	rsbscs	r6, r2, r6, ror #30
 314:	70697274 	rsbvc	r7, r9, r4, ror r2
 318:	6220656c 	eorvs	r6, r0, #108, 10	; 0x1b000000
 31c:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
 320:	6f6d2072 	svcvs	0x006d2072
 324:	000a6564 	andeq	r6, sl, r4, ror #10

00000328 <.LC28>:
 328:	414d4449 	cmpmi	sp, r9, asr #8
 32c:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
 330:	42452073 	submi	r2, r5, #115	; 0x73
 334:	69203041 	stmdbvs	r0!, {r0, r6, ip, sp}
 338:	6f6e2073 	svcvs	0x006e2073
 33c:	2d382074 	ldccs	0, cr2, [r8, #-464]!	; 0xfffffe30
 340:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
 344:	696c6120 	stmdbvs	ip!, {r5, r8, sp, lr}^
 348:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
 34c:	0000000a 	andeq	r0, r0, sl

00000350 <.LC29>:
 350:	414d4449 	cmpmi	sp, r9, asr #8
 354:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
 358:	42452073 	submi	r2, r5, #115	; 0x73
 35c:	69203141 	stmdbvs	r0!, {r0, r6, r8, ip, sp}
 360:	6f6e2073 	svcvs	0x006e2073
 364:	2d382074 	ldccs	0, cr2, [r8, #-464]!	; 0xfffffe30
 368:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
 36c:	696c6120 	stmdbvs	ip!, {r5, r8, sp, lr}^
 370:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
 374:	0000000a 	andeq	r0, r0, sl

00000378 <.LC30>:
 378:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 37c:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
 380:	676e697a 			; <UNDEFINED> instruction: 0x676e697a
 384:	6d646920 	stclvs	9, cr6, [r4, #-128]!	; 0xffffff80
 388:	68632061 	stmdavs	r3!, {r0, r5, r6, sp}^
 38c:	20642520 	rsbcs	r2, r4, r0, lsr #10
 390:	70252040 	eorvc	r2, r5, r0, asr #32
 394:	0000000a 	andeq	r0, r0, sl

00000398 <.LC31>:
 398:	414d4449 	cmpmi	sp, r9, asr #8
 39c:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
 3a0:	75732073 	ldrbvc	r2, [r3, #-115]!	; 0xffffff8d
 3a4:	50432d62 	subpl	r2, r3, r2, ror #26
 3a8:	204d454d 	subcs	r4, sp, sp, asr #10
 3ac:	72746e65 	rsbsvc	r6, r4, #1616	; 0x650
 3b0:	20642579 	rsbcs	r2, r4, r9, ror r5
 3b4:	30414245 	subcc	r4, r1, r5, asr #4
 3b8:	20736920 	rsbscs	r6, r3, r0, lsr #18
 3bc:	20746f6e 	rsbscs	r6, r4, lr, ror #30
 3c0:	79622d38 	stmdbvc	r2!, {r3, r4, r5, r8, sl, fp, sp}^
 3c4:	61206574 			; <UNDEFINED> instruction: 0x61206574
 3c8:	6e67696c 	cdpvs	9, 6, cr6, cr7, cr12, {3}
 3cc:	000a6465 	andeq	r6, sl, r5, ror #8

000003d0 <.LC32>:
 3d0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 3d4:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
 3d8:	676e697a 			; <UNDEFINED> instruction: 0x676e697a
 3dc:	6d646920 	stclvs	9, cr6, [r4, #-128]!	; 0xffffff80
 3e0:	68632061 	stmdavs	r3!, {r0, r5, r6, sp}^
 3e4:	20642520 	rsbcs	r2, r4, r0, lsr #10
 3e8:	70252040 	eorvc	r2, r5, r0, asr #32
 3ec:	62757320 	rsbsvs	r7, r5, #32, 6	; 0x80000000
 3f0:	6d706320 	ldclvs	3, cr6, [r0, #-128]!	; 0xffffff80
 3f4:	000a6d65 	andeq	r6, sl, r5, ror #26

000003f8 <.LC33>:
 3f8:	75736e75 	ldrbvc	r6, [r3, #-3701]!	; 0xfffff18b
 3fc:	726f7070 	rsbvc	r7, pc, #112	; 0x70
 400:	20646574 	rsbcs	r6, r4, r4, ror r5
 404:	72726f63 	rsbsvc	r6, r2, #396	; 0x18c
 408:	74616c65 	strbtvc	r6, [r1], #-3173	; 0xfffff39b
 40c:	20657669 	rsbcs	r7, r5, r9, ror #12
 410:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 414:	206c656e 	rsbcs	r6, ip, lr, ror #10
 418:	6c20666f 	stcvs	6, cr6, [r0], #-444	; 0xfffffe44
 41c:	6c61636f 	stclvs	3, cr6, [r1], #-444	; 0xfffffe44
 420:	706c6120 	rsbvc	r6, ip, r0, lsr #2
 424:	63206168 			; <UNDEFINED> instruction: 0x63206168
 428:	6e6e6168 	powvsez	f6, f6, #0.0
 42c:	000a6c65 	andeq	r6, sl, r5, ror #24

00000430 <.LC34>:
 430:	414d4449 	cmpmi	sp, r9, asr #8
 434:	27642543 	strbcs	r2, [r4, -r3, asr #10]!
 438:	4c492073 	mcrrmi	0, 7, r2, r9, cr3
 43c:	7369204f 	cmnvc	r9, #79	; 0x4f
 440:	746f6e20 	strbtvc	r6, [pc], #-3616	; 448 <.LC34+0x18>
 444:	622d3820 	eorvs	r3, sp, #32, 16	; 0x200000
 448:	20657479 	rsbcs	r7, r5, r9, ror r4
 44c:	67696c61 	strbvs	r6, [r9, -r1, ror #24]!
 450:	0a64656e 	beq	1919a10 <__crc_ipu_ch_param_bad_alpha_pos+0x112c691>
 454:	00000000 	andeq	r0, r0, r0

00000458 <.LC35>:
 458:	25206863 	strcs	r6, [r0, #-2147]!	; 0xfffff79d
 45c:	6f772064 	svcvs	0x00772064
 460:	30206472 	eorcc	r6, r0, r2, ror r4
 464:	25202d20 	strcs	r2, [r0, #-3360]!	; 0xfffff2e0
 468:	20583830 	subscs	r3, r8, r0, lsr r8
 46c:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 470:	38302520 	ldmdacc	r0!, {r5, r8, sl, sp}
 474:	30252058 	eorcc	r2, r5, r8, asr r0
 478:	25205838 	strcs	r5, [r0, #-2104]!	; 0xfffff7c8
 47c:	0a583830 	beq	160e544 <__crc_ipu_ch_param_bad_alpha_pos+0xe211c5>
 480:	00000000 	andeq	r0, r0, r0

00000484 <.LC36>:
 484:	25206863 	strcs	r6, [r0, #-2147]!	; 0xfffff79d
 488:	6f772064 	svcvs	0x00772064
 48c:	31206472 			; <UNDEFINED> instruction: 0x31206472
 490:	25202d20 	strcs	r2, [r0, #-3360]!	; 0xfffff2e0
 494:	20583830 	subscs	r3, r8, r0, lsr r8
 498:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 49c:	38302520 	ldmdacc	r0!, {r5, r8, sl, sp}
 4a0:	30252058 	eorcc	r2, r5, r8, asr r0
 4a4:	25205838 	strcs	r5, [r0, #-2104]!	; 0xfffff7c8
 4a8:	0a583830 	beq	160e570 <__crc_ipu_ch_param_bad_alpha_pos+0xe211f1>
 4ac:	00000000 	andeq	r0, r0, r0

000004b0 <.LC37>:
 4b0:	20534650 	subscs	r4, r3, r0, asr r6
 4b4:	78257830 	stmdavc	r5!, {r4, r5, fp, ip, sp, lr}
 4b8:	0000202c 	andeq	r2, r0, ip, lsr #32

000004bc <.LC38>:
 4bc:	20505042 	subscs	r5, r0, r2, asr #32
 4c0:	78257830 	stmdavc	r5!, {r4, r5, fp, ip, sp, lr}
 4c4:	0000202c 	andeq	r2, r0, ip, lsr #32

000004c8 <.LC39>:
 4c8:	2042504e 	subcs	r5, r2, lr, asr #32
 4cc:	78257830 	stmdavc	r5!, {r4, r5, fp, ip, sp, lr}
 4d0:	0000000a 	andeq	r0, r0, sl

000004d4 <.LC40>:
 4d4:	25205746 	strcs	r5, [r0, #-1862]!	; 0xfffff8ba
 4d8:	00202c64 	eoreq	r2, r0, r4, ror #24

000004dc <.LC41>:
 4dc:	25204846 	strcs	r4, [r0, #-2118]!	; 0xfffff7ba
 4e0:	00202c64 	eoreq	r2, r0, r4, ror #24

000004e4 <.LC42>:
 4e4:	30414245 	subcc	r4, r1, r5, asr #4
 4e8:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 4ec:	00000a78 	andeq	r0, r0, r8, ror sl

000004f0 <.LC43>:
 4f0:	31414245 	cmpcc	r1, r5, asr #4
 4f4:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 4f8:	00000a78 	andeq	r0, r0, r8, ror sl

000004fc <.LC44>:
 4fc:	69727453 	ldmdbvs	r2!, {r0, r1, r4, r6, sl, ip, sp, lr}^
 500:	25206564 	strcs	r6, [r0, #-1380]!	; 0xfffffa9c
 504:	00000a64 	andeq	r0, r0, r4, ror #20

00000508 <.LC45>:
 508:	6e616373 	mcrvs	3, 3, r6, cr1, cr3, {3}
 50c:	64726f5f 	ldrbtvs	r6, [r2], #-3935	; 0xfffff0a1
 510:	25207265 	strcs	r7, [r0, #-613]!	; 0xfffffd9b
 514:	00000a64 	andeq	r0, r0, r4, ror #20

00000518 <.LC46>:
 518:	735f7675 	cmpvc	pc, #122683392	; 0x7500000
 51c:	64697274 	strbtvs	r7, [r9], #-628	; 0xfffffd8c
 520:	64252065 	strtvs	r2, [r5], #-101	; 0xffffff9b
 524:	0000000a 	andeq	r0, r0, sl

00000528 <.LC47>:
 528:	666f5f75 	uqsub16vs	r5, pc, r5	; <UNPREDICTABLE>
 52c:	74657366 	strbtvc	r7, [r5], #-870	; 0xfffffc9a
 530:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 534:	00000a78 	andeq	r0, r0, r8, ror sl

00000538 <.LC48>:
 538:	666f5f76 	uqsub16vs	r5, pc, r6	; <UNPREDICTABLE>
 53c:	74657366 	strbtvc	r7, [r5], #-870	; 0xfffffc9a
 540:	25783020 	ldrbcs	r3, [r8, #-32]!	; 0xffffffe0
 544:	00000a78 	andeq	r0, r0, r8, ror sl

00000548 <.LC49>:
 548:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
 54c:	25203068 	strcs	r3, [r0, #-104]!	; 0xffffff98
 550:	2c312b64 	ldccs	11, cr2, [r1], #-400	; 0xfffffe70
 554:	00000020 	andeq	r0, r0, r0, lsr #32

00000558 <.LC50>:
 558:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
 55c:	25203168 	strcs	r3, [r0, #-360]!	; 0xfffffe98
 560:	2c312b64 	ldccs	11, cr2, [r1], #-400	; 0xfffffe70
 564:	00000020 	andeq	r0, r0, r0, lsr #32

00000568 <.LC51>:
 568:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
 56c:	25203268 	strcs	r3, [r0, #-616]!	; 0xfffffd98
 570:	2c312b64 	ldccs	11, cr2, [r1], #-400	; 0xfffffe70
 574:	00000020 	andeq	r0, r0, r0, lsr #32

00000578 <.LC52>:
 578:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
 57c:	25203368 	strcs	r3, [r0, #-872]!	; 0xfffffc98
 580:	2c312b64 	ldccs	11, cr2, [r1], #-400	; 0xfffffe70
 584:	00000020 	andeq	r0, r0, r0, lsr #32

00000588 <.LC53>:
 588:	7366664f 	cmnvc	r6, #82837504	; 0x4f00000
 58c:	20307465 	eorscs	r7, r0, r5, ror #8
 590:	202c6425 	eorcs	r6, ip, r5, lsr #8
 594:	00000000 	andeq	r0, r0, r0

00000598 <.LC54>:
 598:	7366664f 	cmnvc	r6, #82837504	; 0x4f00000
 59c:	20317465 	eorscs	r7, r1, r5, ror #8
 5a0:	202c6425 	eorcs	r6, ip, r5, lsr #8
 5a4:	00000000 	andeq	r0, r0, r0

000005a8 <.LC55>:
 5a8:	7366664f 	cmnvc	r6, #82837504	; 0x4f00000
 5ac:	20327465 	eorscs	r7, r2, r5, ror #8
 5b0:	202c6425 	eorcs	r6, ip, r5, lsr #8
 5b4:	00000000 	andeq	r0, r0, r0

000005b8 <.LC56>:
 5b8:	7366664f 	cmnvc	r6, #82837504	; 0x4f00000
 5bc:	20337465 	eorscs	r7, r3, r5, ror #8
 5c0:	000a6425 	andeq	r6, sl, r5, lsr #8

000005c4 <.LC57>:
 5c4:	6e726157 	mrcvs	1, 3, r6, cr2, cr7, {2}
 5c8:	3a676e69 	bcc	19dbf74 <__crc_ipu_ch_param_bad_alpha_pos+0x11eebf5>
 5cc:	61686320 	cmnvs	r8, r0, lsr #6
 5d0:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 5d4:	726c6120 	rsbvc	r6, ip, #32, 2
 5d8:	79646165 	stmdbvc	r4!, {r0, r2, r5, r6, r8, sp, lr}^
 5dc:	616e6520 	cmnvs	lr, r0, lsr #10
 5e0:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
 5e4:	0a642520 	beq	1909a6c <__crc_ipu_ch_param_bad_alpha_pos+0x111c6ed>
 5e8:	00000000 	andeq	r0, r0, r0

000005ec <.LC58>:
 5ec:	5f74756f 	svcpl	0x0074756f
 5f0:	20616d64 	rsbcs	r6, r1, r4, ror #26
 5f4:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 5f8:	3a6c656e 	bcc	1b19bb8 <__crc_ipu_ch_param_bad_alpha_pos+0x132c839>
 5fc:	0a642520 	beq	1909a84 <__crc_ipu_ch_param_bad_alpha_pos+0x111c705>
 600:	00000000 	andeq	r0, r0, r0

00000604 <.LC59>:
 604:	645f6e69 	ldrbvs	r6, [pc], #-3689	; 60c <.LC59+0x8>
 608:	6320616d 			; <UNDEFINED> instruction: 0x6320616d
 60c:	6e6e6168 	powvsez	f6, f6, #0.0
 610:	203a6c65 	eorscs	r6, sl, r5, ror #24
 614:	000a6425 	andeq	r6, sl, r5, lsr #8

00000618 <.LC60>:
 618:	6e756f72 	mrcvs	15, 3, r6, cr5, cr2, {3}
 61c:	253a2064 	ldrcs	r2, [sl, #-100]!	; 0xffffff9c
 620:	000a2e64 	andeq	r2, sl, r4, ror #28

00000624 <.LC61>:
 624:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 628:	69746169 	ldmdbvs	r4!, {r0, r3, r5, r6, r8, sp, lr}^
 62c:	4c20676e 	stcmi	7, cr6, [r0], #-440	; 0xfffffe48
 630:	2e204346 	cdpcs	3, 2, cr4, cr0, cr6, {2}
 634:	0a2e2e2e 	beq	b8bef4 <__crc_ipu_ch_param_bad_alpha_pos+0x39eb75>
 638:	00000000 	andeq	r0, r0, r0

0000063c <.LC62>:
 63c:	2043464c 	subcs	r4, r3, ip, asr #12
 640:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
 644:	203a746c 	eorscs	r7, sl, ip, ror #8
 648:	0a2e6425 	beq	b996e4 <__crc_ipu_ch_param_bad_alpha_pos+0x3ac365>
 64c:	00000000 	andeq	r0, r0, r0

00000650 <.LC63>:
 650:	656e6f64 	strbvs	r6, [lr, #-3940]!	; 0xfffff09c
 654:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000658 <.LC64>:
 658:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 65c:	61686320 	cmnvs	r8, r0, lsr #6
 660:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 664:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xfffff2e0
 668:	00000a64 	andeq	r0, r0, r4, ror #20

0000066c <.LC65>:
 66c:	3d206863 	stccc	8, cr6, [r0, #-396]!	; 0xfffffe74
 670:	2c642520 	cfstr64cs	mvdx2, [r4], #-128	; 0xffffff80
 674:	5f6d7020 	svcpl	0x006d7020
 678:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
 67c:	5f656d69 	svcpl	0x00656d69
 680:	20746567 	rsbscs	r6, r4, r7, ror #10
 684:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
 688:	253a6465 	ldrcs	r6, [sl, #-1125]!	; 0xfffffb9b
 68c:	000a2164 	andeq	r2, sl, r4, ror #2

00000690 <.LC66>:
 690:	6e726157 	mrcvs	1, 3, r6, cr2, cr7, {2}
 694:	3a676e69 	bcc	19dc040 <__crc_ipu_ch_param_bad_alpha_pos+0x11eecc1>
 698:	61686320 	cmnvs	r8, r0, lsr #6
 69c:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 6a0:	726c6120 	rsbvc	r6, ip, #32, 2
 6a4:	79646165 	stmdbvc	r4!, {r0, r2, r5, r6, r8, sp, lr}^
 6a8:	696e6920 	stmdbvs	lr!, {r5, r8, fp, sp, lr}^
 6ac:	6c616974 	stclvs	9, cr6, [r1], #-464	; 0xfffffe30
 6b0:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xfffff597
 6b4:	0a642520 	beq	1909b3c <__crc_ipu_ch_param_bad_alpha_pos+0x111c7bd>
 6b8:	00000000 	andeq	r0, r0, r0

000006bc <.LC67>:
 6bc:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
 6c0:	2c292873 	stccs	8, cr2, [r9], #-460	; 0xfffffe34
 6c4:	69736320 	ldmdbvs	r3!, {r5, r8, r9, sp, lr}^
 6c8:	6425203a 	strtvs	r2, [r5], #-58	; 0xffffffc6
 6cc:	0000000a 	andeq	r0, r0, sl

000006d0 <.LC68>:
 6d0:	20646162 	rsbcs	r6, r4, r2, ror #2
 6d4:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
 6d8:	6f66206c 	svcvs	0x0066206c
 6dc:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
 6e0:	726f6620 	rsbvc	r6, pc, #32, 12	; 0x2000000
 6e4:	61726720 	cmnvs	r2, r0, lsr #14
 6e8:	63696870 	cmnvs	r9, #112, 16	; 0x700000
 6ec:	6c702073 	ldclvs	0, cr2, [r0], #-460	; 0xfffffe34
 6f0:	20656e61 	rsbcs	r6, r5, r1, ror #28
 6f4:	6d6f7266 	sfmvs	f7, 2, [pc, #-408]!	; 564 <.LC50+0xc>
 6f8:	25686320 	strbcs	r6, [r8, #-800]!	; 0xfffffce0
 6fc:	00000a64 	andeq	r0, r0, r4, ror #20

00000700 <.LC69>:
 700:	7373694d 	cmnvc	r3, #1261568	; 0x134000
 704:	20676e69 	rsbcs	r6, r7, r9, ror #28
 708:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 70c:	206c656e 	rsbcs	r6, ip, lr, ror #10
 710:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 714:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
 718:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 71c:	000a6e6f 	andeq	r6, sl, pc, ror #28

00000720 <.LC70>:
 720:	6e6f7257 	mcrvs	2, 3, r7, cr15, cr7, {2}
 724:	73632067 	cmnvc	r3, #103	; 0x67
 728:	756e2069 	strbvc	r2, [lr, #-105]!	; 0xffffff97
 72c:	64255f6d 	strtvs	r5, [r5], #-3949	; 0xfffff093
 730:	0000000a 	andeq	r0, r0, sl

00000734 <.LC71>:
 734:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
 738:	3a292873 	bcc	a4a90c <__crc_ipu_ch_param_bad_alpha_pos+0x25d58d>
 73c:	616e6520 	cmnvs	lr, r0, lsr #10
 740:	20656c62 	rsbcs	r6, r5, r2, ror #24
 744:	20697363 	rsbcs	r7, r9, r3, ror #6
 748:	000a6425 	andeq	r6, sl, r5, lsr #8

0000074c <.LC72>:
 74c:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
 750:	2072656c 	rsbscs	r6, r2, ip, ror #10
 754:	6e736168 	rpwvssz	f6, f3, #0.0
 758:	62207427 	eorvs	r7, r0, #654311424	; 0x27000000
 75c:	206e6565 	rsbcs	r6, lr, r5, ror #10
 760:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 764:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 768:	6f206465 	svcvs	0x00206465
 76c:	7973206e 	ldmdbvc	r3!, {r1, r2, r3, r5, r6, sp}^
 770:	6920636e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sp, lr}
 774:	25207172 	strcs	r7, [r0, #-370]!	; 0xfffffe8e
 778:	00000a64 	andeq	r0, r0, r4, ror #20

0000077c <.LC73>:
 77c:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
 780:	0a292873 	beq	a4a954 <__crc_ipu_ch_param_bad_alpha_pos+0x25d5d5>
 784:	00000000 	andeq	r0, r0, r0

00000788 <.LC74>:
 788:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
 78c:	2072656c 	rsbscs	r6, r2, ip, ror #10
 790:	65726c61 	ldrbvs	r6, [r2, #-3169]!	; 0xfffff39f
 794:	20796461 	rsbscs	r6, r9, r1, ror #8
 798:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xfffff197
 79c:	656c6c61 	strbvs	r6, [ip, #-3169]!	; 0xfffff39f
 7a0:	6e6f2064 	cdpvs	0, 6, cr2, cr15, cr4, {3}
 7a4:	71726920 	cmnvc	r2, r0, lsr #18
 7a8:	0a642520 	beq	1909c30 <__crc_ipu_ch_param_bad_alpha_pos+0x111c8b1>
 7ac:	00000000 	andeq	r0, r0, r0

000007b0 <.LC75>:
 7b0:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
 7b4:	2072656c 	rsbscs	r6, r2, ip, ror #10
 7b8:	4e207369 	cdpmi	3, 2, cr7, cr0, cr9, {3}
 7bc:	204c4c55 	subcs	r4, ip, r5, asr ip
 7c0:	20726f66 	rsbscs	r6, r2, r6, ror #30
 7c4:	636e7973 	cmnvs	lr, #1884160	; 0x1cc000
 7c8:	71726920 	cmnvc	r2, r0, lsr #18
 7cc:	0a642520 	beq	1909c54 <__crc_ipu_ch_param_bad_alpha_pos+0x111c8d5>
 7d0:	00000000 	andeq	r0, r0, r0

000007d4 <.LC76>:
 7d4:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 7d8:	25206564 	strcs	r6, [r0, #-1380]!	; 0xfffffa9c
 7dc:	2e292873 	mcrcs	8, 1, r2, cr9, cr3, {3}
 7e0:	0000000a 	andeq	r0, r0, sl

000007e4 <.LC77>:
 7e4:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 7e8:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
 7ec:	73202928 			; <UNDEFINED> instruction: 0x73202928
 7f0:	65636375 	strbvs	r6, [r3, #-885]!	; 0xfffffc8b
 7f4:	0a2e7373 	beq	b9d5c8 <__crc_ipu_ch_param_bad_alpha_pos+0x3b0249>
 7f8:	00000000 	andeq	r0, r0, r0

000007fc <.LC78>:
 7fc:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 800:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0xffffffa1
 804:	73202928 			; <UNDEFINED> instruction: 0x73202928
 808:	65636375 	strbvs	r6, [r3, #-885]!	; 0xfffffc8b
 80c:	0a2e7373 	beq	b9d5e0 <__crc_ipu_ch_param_bad_alpha_pos+0x3b0261>
 810:	00000000 	andeq	r0, r0, r0

00000814 <.LC79>:
 814:	202c7325 	eorcs	r7, ip, r5, lsr #6
 818:	5f616d64 	svcpl	0x00616d64
 81c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 820:	253a7375 	ldrcs	r7, [sl, #-885]!	; 0xfffffc8b
 824:	000a2e64 	andeq	r2, sl, r4, ror #28

00000828 <.LC80>:
 828:	706d7564 	rsbvc	r7, sp, r4, ror #10
 82c:	20676e69 	rsbcs	r6, r7, r9, ror #28
 830:	20757069 	rsbscs	r7, r5, r9, rrx
 834:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 838:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
 83c:	2e2e2073 	mcrcs	0, 1, r2, cr14, cr3, {3}
 840:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000844 <.LC81>:
 844:	5f555049 	svcpl	0x00555049
 848:	464e4f43 	strbmi	r4, [lr], -r3, asr #30
 84c:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 850:	30257830 	eorcc	r7, r5, r0, lsr r8
 854:	000a5838 	andeq	r5, sl, r8, lsr r8

00000858 <.LC82>:
 858:	414d4449 	cmpmi	sp, r9, asr #8
 85c:	4f435f43 	svcmi	0x00435f43
 860:	3d20464e 	stccc	6, cr4, [r0, #-312]!	; 0xfffffec8
 864:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 868:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 86c:	0000000a 	andeq	r0, r0, sl

00000870 <.LC83>:
 870:	414d4449 	cmpmi	sp, r9, asr #8
 874:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
 878:	4e455f41 	cdpmi	15, 4, cr5, cr5, cr1, {2}
 87c:	203d2031 	eorscs	r2, sp, r1, lsr r0
 880:	25783009 	ldrbcs	r3, [r8, #-9]!
 884:	0a583830 	beq	160e94c <__crc_ipu_ch_param_bad_alpha_pos+0xe215cd>
 888:	00000000 	andeq	r0, r0, r0

0000088c <.LC84>:
 88c:	414d4449 	cmpmi	sp, r9, asr #8
 890:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
 894:	4e455f41 	cdpmi	15, 4, cr5, cr5, cr1, {2}
 898:	203d2032 	eorscs	r2, sp, r2, lsr r0
 89c:	25783009 	ldrbcs	r3, [r8, #-9]!
 8a0:	0a583830 	beq	160e968 <__crc_ipu_ch_param_bad_alpha_pos+0xe215e9>
 8a4:	00000000 	andeq	r0, r0, r0

000008a8 <.LC85>:
 8a8:	414d4449 	cmpmi	sp, r9, asr #8
 8ac:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
 8b0:	52505f41 	subspl	r5, r0, #260	; 0x104
 8b4:	3d203149 	stfccs	f3, [r0, #-292]!	; 0xfffffedc
 8b8:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 8bc:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 8c0:	0000000a 	andeq	r0, r0, sl

000008c4 <.LC86>:
 8c4:	414d4449 	cmpmi	sp, r9, asr #8
 8c8:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
 8cc:	52505f41 	subspl	r5, r0, #260	; 0x104
 8d0:	3d203249 	sfmcc	f3, 4, [r0, #-292]!	; 0xfffffedc
 8d4:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 8d8:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 8dc:	0000000a 	andeq	r0, r0, sl

000008e0 <.LC87>:
 8e0:	414d4449 	cmpmi	sp, r9, asr #8
 8e4:	41425f43 	cmpmi	r2, r3, asr #30
 8e8:	455f444e 	ldrbmi	r4, [pc, #-1102]	; 4a2 <.LC36+0x1e>
 8ec:	3d20314e 	stfccs	f3, [r0, #-312]!	; 0xfffffec8
 8f0:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 8f4:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 8f8:	0000000a 	andeq	r0, r0, sl

000008fc <.LC88>:
 8fc:	414d4449 	cmpmi	sp, r9, asr #8
 900:	41425f43 	cmpmi	r2, r3, asr #30
 904:	455f444e 	ldrbmi	r4, [pc, #-1102]	; 4be <.LC38+0x2>
 908:	3d20324e 	sfmcc	f3, 4, [r0, #-312]!	; 0xfffffec8
 90c:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 910:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 914:	0000000a 	andeq	r0, r0, sl

00000918 <.LC89>:
 918:	5f555049 	svcpl	0x00555049
 91c:	5f414843 	svcpl	0x00414843
 920:	4d5f4244 	lfmmi	f4, 2, [pc, #-272]	; 818 <.LC79+0x4>
 924:	5f45444f 	svcpl	0x0045444f
 928:	304c4553 	subcc	r4, ip, r3, asr r5
 92c:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 930:	30257830 	eorcc	r7, r5, r0, lsr r8
 934:	000a5838 	andeq	r5, sl, r8, lsr r8

00000938 <.LC90>:
 938:	5f555049 	svcpl	0x00555049
 93c:	5f414843 	svcpl	0x00414843
 940:	4d5f4244 	lfmmi	f4, 2, [pc, #-272]	; 838 <.LC80+0x10>
 944:	5f45444f 	svcpl	0x0045444f
 948:	314c4553 	cmpcc	ip, r3, asr r5
 94c:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 950:	30257830 	eorcc	r7, r5, r0, lsr r8
 954:	000a5838 	andeq	r5, sl, r8, lsr r8

00000958 <.LC91>:
 958:	5f555049 	svcpl	0x00555049
 95c:	5f414843 	svcpl	0x00414843
 960:	5f425254 	svcpl	0x00425254
 964:	45444f4d 	strbmi	r4, [r4, #-3917]	; 0xfffff0b3
 968:	4c45535f 	mcrrmi	3, 5, r5, r5, cr15
 96c:	203d2030 	eorscs	r2, sp, r0, lsr r0
 970:	25783009 	ldrbcs	r3, [r8, #-9]!
 974:	0a583830 	beq	160ea3c <__crc_ipu_ch_param_bad_alpha_pos+0xe216bd>
 978:	00000000 	andeq	r0, r0, r0

0000097c <.LC92>:
 97c:	5f555049 	svcpl	0x00555049
 980:	5f414843 	svcpl	0x00414843
 984:	5f425254 	svcpl	0x00425254
 988:	45444f4d 	strbmi	r4, [r4, #-3917]	; 0xfffff0b3
 98c:	4c45535f 	mcrrmi	3, 5, r5, r5, cr15
 990:	203d2031 	eorscs	r2, sp, r1, lsr r0
 994:	25783009 	ldrbcs	r3, [r8, #-9]!
 998:	0a583830 	beq	160ea60 <__crc_ipu_ch_param_bad_alpha_pos+0xe216e1>
 99c:	00000000 	andeq	r0, r0, r0

000009a0 <.LC93>:
 9a0:	43464d44 	movtmi	r4, #27972	; 0x6d44
 9a4:	5f52575f 	svcpl	0x0052575f
 9a8:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
 9ac:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 9b0:	30257830 	eorcc	r7, r5, r0, lsr r8
 9b4:	000a5838 	andeq	r5, sl, r8, lsr r8

000009b8 <.LC94>:
 9b8:	43464d44 	movtmi	r4, #27972	; 0x6d44
 9bc:	5f52575f 	svcpl	0x0052575f
 9c0:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
 9c4:	4645445f 			; <UNDEFINED> instruction: 0x4645445f
 9c8:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 9cc:	30257830 	eorcc	r7, r5, r0, lsr r8
 9d0:	000a5838 	andeq	r5, sl, r8, lsr r8

000009d4 <.LC95>:
 9d4:	43464d44 	movtmi	r4, #27972	; 0x6d44
 9d8:	5f50445f 	svcpl	0x0050445f
 9dc:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
 9e0:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 9e4:	30257830 	eorcc	r7, r5, r0, lsr r8
 9e8:	000a5838 	andeq	r5, sl, r8, lsr r8

000009ec <.LC96>:
 9ec:	43464d44 	movtmi	r4, #27972	; 0x6d44
 9f0:	5f50445f 	svcpl	0x0050445f
 9f4:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
 9f8:	4645445f 			; <UNDEFINED> instruction: 0x4645445f
 9fc:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 a00:	30257830 	eorcc	r7, r5, r0, lsr r8
 a04:	000a5838 	andeq	r5, sl, r8, lsr r8

00000a08 <.LC97>:
 a08:	43464d44 	movtmi	r4, #27972	; 0x6d44
 a0c:	5f43495f 	svcpl	0x0043495f
 a10:	4c525443 	cfldrdmi	mvd5, [r2], {67}	; 0x43
 a14:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
 a18:	30257830 	eorcc	r7, r5, r0, lsr r8
 a1c:	000a5838 	andeq	r5, sl, r8, lsr r8

00000a20 <.LC98>:
 a20:	5f555049 	svcpl	0x00555049
 a24:	505f5346 	subspl	r5, pc, r6, asr #6
 a28:	5f434f52 	svcpl	0x00434f52
 a2c:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
 a30:	203d2031 	eorscs	r2, sp, r1, lsr r0
 a34:	25783009 	ldrbcs	r3, [r8, #-9]!
 a38:	0a583830 	beq	160eb00 <__crc_ipu_ch_param_bad_alpha_pos+0xe21781>
 a3c:	00000000 	andeq	r0, r0, r0

00000a40 <.LC99>:
 a40:	5f555049 	svcpl	0x00555049
 a44:	505f5346 	subspl	r5, pc, r6, asr #6
 a48:	5f434f52 	svcpl	0x00434f52
 a4c:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
 a50:	203d2032 	eorscs	r2, sp, r2, lsr r0
 a54:	25783009 	ldrbcs	r3, [r8, #-9]!
 a58:	0a583830 	beq	160eb20 <__crc_ipu_ch_param_bad_alpha_pos+0xe217a1>
 a5c:	00000000 	andeq	r0, r0, r0

00000a60 <.LC100>:
 a60:	5f555049 	svcpl	0x00555049
 a64:	505f5346 	subspl	r5, pc, r6, asr #6
 a68:	5f434f52 	svcpl	0x00434f52
 a6c:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
 a70:	203d2033 	eorscs	r2, sp, r3, lsr r0
 a74:	25783009 	ldrbcs	r3, [r8, #-9]!
 a78:	0a583830 	beq	160eb40 <__crc_ipu_ch_param_bad_alpha_pos+0xe217c1>
 a7c:	00000000 	andeq	r0, r0, r0

00000a80 <.LC101>:
 a80:	5f555049 	svcpl	0x00555049
 a84:	445f5346 	ldrbmi	r5, [pc], #-838	; a8c <.LC101+0xc>
 a88:	5f505349 	svcpl	0x00505349
 a8c:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
 a90:	203d2031 	eorscs	r2, sp, r1, lsr r0
 a94:	25783009 	ldrbcs	r3, [r8, #-9]!
 a98:	0a583830 	beq	160eb60 <__crc_ipu_ch_param_bad_alpha_pos+0xe217e1>
 a9c:	00000000 	andeq	r0, r0, r0

00000aa0 <.LC102>:
 aa0:	5f555049 	svcpl	0x00555049
 aa4:	43494456 	movtmi	r4, #37974	; 0x9456
 aa8:	4944565f 	stmdbmi	r4, {r0, r1, r2, r3, r4, r6, r9, sl, ip, lr}^
 aac:	4953465f 	ldmdbmi	r3, {r0, r1, r2, r3, r4, r6, r9, sl, lr}^
 ab0:	3d20455a 	cfstr32cc	mvfx4, [r0, #-360]!	; 0xfffffe98
 ab4:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 ab8:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 abc:	0000000a 	andeq	r0, r0, sl

00000ac0 <.LC103>:
 ac0:	5f555049 	svcpl	0x00555049
 ac4:	43494456 	movtmi	r4, #37974	; 0x9456
 ac8:	4944565f 	stmdbmi	r4, {r0, r1, r2, r3, r4, r6, r9, sl, ip, lr}^
 acc:	3d20435f 	stccc	3, cr4, [r0, #-380]!	; 0xfffffe84
 ad0:	78300920 	ldmdavc	r0!, {r5, r8, fp}
 ad4:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
 ad8:	0000000a 	andeq	r0, r0, sl

00000adc <.LC104>:
 adc:	5f555049 	svcpl	0x00555049
 ae0:	435f4349 	cmpmi	pc, #603979777	; 0x24000001
 ae4:	20464e4f 	subcs	r4, r6, pc, asr #28
 ae8:	3009203d 	andcc	r2, r9, sp, lsr r0
 aec:	38302578 	ldmdacc	r0!, {r3, r4, r5, r6, r8, sl, sp}
 af0:	00000a58 	andeq	r0, r0, r8, asr sl

00000af4 <.LC105>:
 af4:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
 af8:	206c656e 	rsbcs	r6, ip, lr, ror #10
 afc:	65726c61 	ldrbvs	r6, [r2, #-3169]!	; 0xfffff39f
 b00:	20796461 	rsbscs	r6, r9, r1, ror #8
 b04:	61736964 	cmnvs	r3, r4, ror #18
 b08:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
 b0c:	0a642520 	beq	1909f94 <__crc_ipu_ch_param_bad_alpha_pos+0x111cc15>
 b10:	00000000 	andeq	r0, r0, r0

00000b14 <.LC106>:
 b14:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
 b18:	3a676e69 	bcc	19dc4c4 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef145>
 b1c:	69617720 	stmdbvs	r1!, {r5, r8, r9, sl, ip, sp, lr}^
 b20:	6f662074 	svcvs	0x00662074
 b24:	67622072 			; <UNDEFINED> instruction: 0x67622072
 b28:	6e797320 	cdpvs	3, 7, cr7, cr9, cr0, {1}
 b2c:	6f652063 	svcvs	0x00652063
 b30:	69742066 	ldmdbvs	r4!, {r1, r2, r5, r6, sp}^
 b34:	756f656d 	strbvc	r6, [pc, #-1389]!	; 5cf <.LC57+0xb>
 b38:	00000a74 	andeq	r0, r0, r4, ror sl

00000b3c <.LC107>:
 b3c:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
 b40:	3a676e69 	bcc	19dc4ec <__crc_ipu_ch_param_bad_alpha_pos+0x11ef16d>
 b44:	206f6e20 	rsbcs	r6, pc, r0, lsr #28
 b48:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 b4c:	206c656e 	rsbcs	r6, ip, lr, ror #10
 b50:	79737562 	ldmdbvc	r3!, {r1, r5, r6, r8, sl, ip, sp, lr}^
 b54:	7262202c 	rsbvc	r2, r2, #44	; 0x2c
 b58:	0a6b6165 	beq	1ad90f4 <__crc_ipu_ch_param_bad_alpha_pos+0x12ebd75>
 b5c:	00000000 	andeq	r0, r0, r0

00000b60 <.LC108>:
 b60:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
 b64:	3a676e69 	bcc	19dc510 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef191>
 b68:	61686320 	cmnvs	r8, r0, lsr #6
 b6c:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 b70:	20642520 	rsbcs	r2, r4, r0, lsr #10
 b74:	79737562 	ldmdbvc	r3!, {r1, r5, r6, r8, sl, ip, sp, lr}^
 b78:	656e202c 	strbvs	r2, [lr, #-44]!	; 0xffffffd4
 b7c:	77206465 	strvc	r6, [r0, -r5, ror #8]!
 b80:	0a746961 	beq	1d1b10c <__crc_ipu_ch_param_bad_alpha_pos+0x152dd8d>
 b84:	00000000 	andeq	r0, r0, r0

00000b88 <.LC109>:
 b88:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
 b8c:	3a676e69 	bcc	19dc538 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef1b9>
 b90:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
 b94:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
 b98:	75706920 	ldrbvc	r6, [r0, #-2336]!	; 0xfffff6e0
 b9c:	616d6420 	cmnvs	sp, r0, lsr #8
 ba0:	61686320 	cmnvs	r8, r0, lsr #6
 ba4:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 ba8:	20642520 	rsbcs	r2, r4, r0, lsr #10
 bac:	69727564 	ldmdbvs	r2!, {r2, r5, r6, r8, sl, ip, sp, lr}^
 bb0:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
 bb4:	62207374 	eorvs	r7, r0, #116, 6	; 0xd0000001
 bb8:	20797375 	rsbscs	r7, r9, r5, ror r3
 bbc:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 bc0:	00000a65 	andeq	r0, r0, r5, ror #20

00000bc4 <.LC110>:
 bc4:	74696177 	strbtvc	r6, [r9], #-375	; 0xfffffe89
 bc8:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
 bcc:	64253a65 	strtvs	r3, [r5], #-2661	; 0xfffff59b
 bd0:	0000000a 	andeq	r0, r0, sl

00000bd4 <.LC111>:
 bd4:	20757069 	rsbscs	r7, r5, r9, rrx
 bd8:	66737562 	ldrbtvs	r7, [r3], -r2, ror #10
 bdc:	20716572 	rsbscs	r6, r1, r2, ror r5
 be0:	68676968 	stmdavs	r7!, {r3, r5, r6, r8, fp, sp, lr}^
 be4:	6c657220 	sfmvs	f7, 2, [r5], #-128	; 0xffffff80
 be8:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
 bec:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000bf0 <.LC112>:
 bf0:	20757069 	rsbscs	r7, r5, r9, rrx
 bf4:	66737562 	ldrbtvs	r7, [r3], -r2, ror #10
 bf8:	20716572 	rsbscs	r6, r1, r2, ror r5
 bfc:	68676968 	stmdavs	r7!, {r3, r5, r6, r8, fp, sp, lr}^
 c00:	71657220 	cmnvc	r5, r0, lsr #4
 c04:	2e747375 	mrccs	3, 3, r7, cr4, cr5, {3}
 c08:	0000000a 	andeq	r0, r0, sl

00000c0c <.LC113>:
 c0c:	75706926 	ldrbvc	r6, [r0, #-2342]!	; 0xfffff6da
 c10:	756d3e2d 	strbvc	r3, [sp, #-3629]!	; 0xfffff1d3
 c14:	5f786574 	svcpl	0x00786574
 c18:	6b636f6c 	blvs	18dc9d0 <__crc_ipu_ch_param_bad_alpha_pos+0x10ef651>
 c1c:	00000000 	andeq	r0, r0, r0
 c20:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
 c24:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
 c28:	00000000 	andeq	r0, r0, r0
 c2c:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
 c30:	00004833 	andeq	r4, r0, r3, lsr r8
 c34:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
 c38:	00004d33 	andeq	r4, r0, r3, lsr sp
 c3c:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
 c40:	00584533 	subseq	r4, r8, r3, lsr r5
 c44:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b90 <.LC109+0x8>
 c48:	6f6e2f65 	svcvs	0x006e2f65
 c4c:	5f6e616c 	svcpl	0x006e616c
 c50:	2f6e6179 	svccs	0x006e6179
 c54:	6b736544 	blvs	1cda16c <__crc_ipu_ch_param_bad_alpha_pos+0x14ecded>
 c58:	2f706f74 	svccs	0x00706f74
 c5c:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
 c60:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
 c64:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
 c68:	70692f73 	rsbvc	r2, r9, r3, ror pc
 c6c:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
 c70:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
 c74:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
 c78:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
 c7c:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
 c80:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
 c84:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
 c88:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
 c8c:	7261705f 	rsbvc	r7, r1, #95	; 0x5f
 c90:	6d5f6d61 	ldclvs	13, cr6, [pc, #-388]	; b14 <.LC106>
 c94:	682e6d65 	stmdavs	lr!, {r0, r2, r5, r6, r8, sl, fp, sp, lr}
	...

Disassembly of section .sec_ele:

00000000 <_sec_ele14>:
   0:	00001e48 	andeq	r1, r0, r8, asr #28
   4:	00000014 	andeq	r0, r0, r4, lsl r0

00000008 <_sec_ele13>:
   8:	00001e60 	andeq	r1, r0, r0, ror #28
   c:	00000004 	andeq	r0, r0, r4

00000010 <_sec_ele12>:
  10:	00001e5c 	andeq	r1, r0, ip, asr lr
  14:	00000004 	andeq	r0, r0, r4

Disassembly of section ___ksymtab+bytes_per_pixel:

00000000 <__ksymtab_bytes_per_pixel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000c8 	andeq	r0, r0, r8, asr #1

Disassembly of section ___ksymtab+format_to_colorspace:

00000000 <__ksymtab_format_to_colorspace>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000b3 	strheq	r0, [r0], -r3

Disassembly of section ___ksymtab+ipu_ch_param_bad_alpha_pos:

00000000 <__ksymtab_ipu_ch_param_bad_alpha_pos>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000098 	muleq	r0, r8, r0

Disassembly of section ___ksymtab+ipu_ch_param_get_axi_id:

00000000 <__ksymtab_ipu_ch_param_get_axi_id>:
	...

Disassembly of section ___ksymtab+ipu_channel_status:

00000000 <__ksymtab_ipu_channel_status>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000e9 	andeq	r0, r0, r9, ror #1

Disassembly of section ___ksymtab+ipu_check_buffer_ready:

00000000 <__ksymtab_ipu_check_buffer_ready>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000001ba 			; <UNDEFINED> instruction: 0x000001ba

Disassembly of section ___ksymtab+ipu_clear_buffer_ready:

00000000 <__ksymtab_ipu_clear_buffer_ready>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000001a3 	andeq	r0, r0, r3, lsr #3

Disassembly of section ___ksymtab+ipu_clear_irq:

00000000 <__ksymtab_ipu_clear_irq>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000143 	andeq	r0, r0, r3, asr #2

Disassembly of section ___ksymtab+ipu_disable_channel:

00000000 <__ksymtab_ipu_disable_channel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000018f 	andeq	r0, r0, pc, lsl #3

Disassembly of section ___ksymtab+ipu_disable_csi:

00000000 <__ksymtab_ipu_disable_csi>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000170 	andeq	r0, r0, r0, ror r1

Disassembly of section ___ksymtab+ipu_disable_hsp_clk:

00000000 <__ksymtab_ipu_disable_hsp_clk>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000002ec 	andeq	r0, r0, ip, ror #5

Disassembly of section ___ksymtab+ipu_disable_irq:

00000000 <__ksymtab_ipu_disable_irq>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000151 	andeq	r0, r0, r1, asr r1

Disassembly of section ___ksymtab+ipu_enable_channel:

00000000 <__ksymtab_ipu_enable_channel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000001d1 	ldrdeq	r0, [r0], -r1

Disassembly of section ___ksymtab+ipu_enable_csi:

00000000 <__ksymtab_ipu_enable_csi>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000180 	andeq	r0, r0, r0, lsl #3

Disassembly of section ___ksymtab+ipu_enable_irq:

00000000 <__ksymtab_ipu_enable_irq>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000161 	andeq	r0, r0, r1, ror #2

Disassembly of section ___ksymtab+ipu_free_irq:

00000000 <__ksymtab_ipu_free_irq>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000113 	andeq	r0, r0, r3, lsl r1

Disassembly of section ___ksymtab+ipu_get_channel_offset:

00000000 <__ksymtab_ipu_get_channel_offset>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000024c 	andeq	r0, r0, ip, asr #4

Disassembly of section ___ksymtab+ipu_get_cur_buffer_idx:

00000000 <__ksymtab_ipu_get_cur_buffer_idx>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000fc 	strdeq	r0, [r0], -ip

Disassembly of section ___ksymtab+ipu_get_irq_status:

00000000 <__ksymtab_ipu_get_irq_status>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000130 	andeq	r0, r0, r0, lsr r1

Disassembly of section ___ksymtab+ipu_init_channel:

00000000 <__ksymtab_ipu_init_channel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000002db 	ldrdeq	r0, [r0], -fp

Disassembly of section ___ksymtab+ipu_init_channel_buffer:

00000000 <__ksymtab_ipu_init_channel_buffer>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000002b0 			; <UNDEFINED> instruction: 0x000002b0

Disassembly of section ___ksymtab+ipu_is_channel_busy:

00000000 <__ksymtab_ipu_is_channel_busy>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000001e4 	andeq	r0, r0, r4, ror #3

Disassembly of section ___ksymtab+ipu_link_channels:

00000000 <__ksymtab_ipu_link_channels>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000020c 	andeq	r0, r0, ip, lsl #4

Disassembly of section ___ksymtab+ipu_pixel_format_is_gpu_tile:

00000000 <__ksymtab_ipu_pixel_format_is_gpu_tile>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000007b 	andeq	r0, r0, fp, ror r0

Disassembly of section ___ksymtab+ipu_pixel_format_is_multiplanar_yuv:

00000000 <__ksymtab_ipu_pixel_format_is_multiplanar_yuv>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000018 	andeq	r0, r0, r8, lsl r0

Disassembly of section ___ksymtab+ipu_pixel_format_is_pre_yuv:

00000000 <__ksymtab_ipu_pixel_format_is_pre_yuv>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000003c 	andeq	r0, r0, ip, lsr r0

Disassembly of section ___ksymtab+ipu_pixel_format_is_split_gpu_tile:

00000000 <__ksymtab_ipu_pixel_format_is_split_gpu_tile>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000058 	andeq	r0, r0, r8, asr r0

Disassembly of section ___ksymtab+ipu_request_irq:

00000000 <__ksymtab_ipu_request_irq>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000120 	andeq	r0, r0, r0, lsr #2

Disassembly of section ___ksymtab+ipu_select_buffer:

00000000 <__ksymtab_ipu_select_buffer>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000023a 	andeq	r0, r0, sl, lsr r2

Disassembly of section ___ksymtab+ipu_select_multi_vdi_buffer:

00000000 <__ksymtab_ipu_select_multi_vdi_buffer>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000021e 	andeq	r0, r0, lr, lsl r2

Disassembly of section ___ksymtab+ipu_set_channel_bandmode:

00000000 <__ksymtab_ipu_set_channel_bandmode>:
   0:	00000000 	andeq	r0, r0, r0
   4:	0000027d 	andeq	r0, r0, sp, ror r2

Disassembly of section ___ksymtab+ipu_swap_channel:

00000000 <__ksymtab_ipu_swap_channel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000d8 	ldrdeq	r0, [r0], -r8

Disassembly of section ___ksymtab+ipu_uninit_channel:

00000000 <__ksymtab_ipu_uninit_channel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000002c8 	andeq	r0, r0, r8, asr #5

Disassembly of section ___ksymtab+ipu_unlink_channels:

00000000 <__ksymtab_ipu_unlink_channels>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000001f8 	strdeq	r0, [r0], -r8

Disassembly of section ___ksymtab+ipu_update_channel_buffer:

00000000 <__ksymtab_ipu_update_channel_buffer>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000296 	muleq	r0, r6, r2

Disassembly of section ___ksymtab+ipu_update_channel_offset:

00000000 <__ksymtab_ipu_update_channel_offset>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000263 	andeq	r0, r0, r3, ror #4

Disassembly of section ___ksymtab_gpl+ipu_get_soc:

00000000 <__ksymtab_ipu_get_soc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000300 	andeq	r0, r0, r0, lsl #6

Disassembly of section __ksymtab_strings:

00000000 <__kstrtab_ipu_ch_param_get_axi_id>:
   0:	5f757069 	svcpl	0x00757069
   4:	705f6863 	subsvc	r6, pc, r3, ror #16
   8:	6d617261 	sfmvs	f7, 2, [r1, #-388]!	; 0xfffffe7c
   c:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
  10:	6978615f 	ldmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, sp, lr}^
  14:	0064695f 	rsbeq	r6, r4, pc, asr r9

00000018 <__kstrtab_ipu_pixel_format_is_multiplanar_yuv>:
  18:	5f757069 	svcpl	0x00757069
  1c:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
  20:	6f665f6c 	svcvs	0x00665f6c
  24:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
  28:	5f73695f 	svcpl	0x0073695f
  2c:	746c756d 	strbtvc	r7, [ip], #-1389	; 0xfffffa93
  30:	616c7069 	cmnvs	ip, r9, rrx
  34:	5f72616e 	svcpl	0x0072616e
  38:	00767579 	rsbseq	r7, r6, r9, ror r5

0000003c <__kstrtab_ipu_pixel_format_is_pre_yuv>:
  3c:	5f757069 	svcpl	0x00757069
  40:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
  44:	6f665f6c 	svcvs	0x00665f6c
  48:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
  4c:	5f73695f 	svcpl	0x0073695f
  50:	5f657270 	svcpl	0x00657270
  54:	00767579 	rsbseq	r7, r6, r9, ror r5

00000058 <__kstrtab_ipu_pixel_format_is_split_gpu_tile>:
  58:	5f757069 	svcpl	0x00757069
  5c:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
  60:	6f665f6c 	svcvs	0x00665f6c
  64:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
  68:	5f73695f 	svcpl	0x0073695f
  6c:	696c7073 	stmdbvs	ip!, {r0, r1, r4, r5, r6, ip, sp, lr}^
  70:	70675f74 	rsbvc	r5, r7, r4, ror pc
  74:	69745f75 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  78:	6900656c 	stmdbvs	r0, {r2, r3, r5, r6, r8, sl, sp, lr}

0000007b <__kstrtab_ipu_pixel_format_is_gpu_tile>:
  7b:	5f757069 	svcpl	0x00757069
  7f:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
  83:	6f665f6c 	svcvs	0x00665f6c
  87:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
  8b:	5f73695f 	svcpl	0x0073695f
  8f:	5f757067 	svcpl	0x00757067
  93:	656c6974 	strbvs	r6, [ip, #-2420]!	; 0xfffff68c
	...

00000098 <__kstrtab_ipu_ch_param_bad_alpha_pos>:
  98:	5f757069 	svcpl	0x00757069
  9c:	705f6863 	subsvc	r6, pc, r3, ror #16
  a0:	6d617261 	sfmvs	f7, 2, [r1, #-388]!	; 0xfffffe7c
  a4:	6461625f 	strbtvs	r6, [r1], #-607	; 0xfffffda1
  a8:	706c615f 	rsbvc	r6, ip, pc, asr r1
  ac:	705f6168 	subsvc	r6, pc, r8, ror #2
  b0:	6600736f 	strvs	r7, [r0], -pc, ror #6

000000b3 <__kstrtab_format_to_colorspace>:
  b3:	6d726f66 	ldclvs	15, cr6, [r2, #-408]!	; 0xfffffe68
  b7:	745f7461 	ldrbvc	r7, [pc], #-1121	; bf <__kstrtab_format_to_colorspace+0xc>
  bb:	6f635f6f 	svcvs	0x00635f6f
  bf:	73726f6c 	cmnvc	r2, #108, 30	; 0x1b0
  c3:	65636170 	strbvs	r6, [r3, #-368]!	; 0xfffffe90
	...

000000c8 <__kstrtab_bytes_per_pixel>:
  c8:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0xfffff69e
  cc:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xfffff08d
  d0:	69705f72 	ldmdbvs	r0!, {r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  d4:	006c6578 	rsbeq	r6, ip, r8, ror r5

000000d8 <__kstrtab_ipu_swap_channel>:
  d8:	5f757069 	svcpl	0x00757069
  dc:	70617773 	rsbvc	r7, r1, r3, ror r7
  e0:	6168635f 	cmnvs	r8, pc, asr r3
  e4:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
	...

000000e9 <__kstrtab_ipu_channel_status>:
  e9:	5f757069 	svcpl	0x00757069
  ed:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
  f1:	5f6c656e 	svcpl	0x006c656e
  f5:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
  f9:	69007375 	stmdbvs	r0, {r0, r2, r4, r5, r6, r8, r9, ip, sp, lr}

000000fc <__kstrtab_ipu_get_cur_buffer_idx>:
  fc:	5f757069 	svcpl	0x00757069
 100:	5f746567 	svcpl	0x00746567
 104:	5f727563 	svcpl	0x00727563
 108:	66667562 	strbtvs	r7, [r6], -r2, ror #10
 10c:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 110:	69007864 	stmdbvs	r0, {r2, r5, r6, fp, ip, sp, lr}

00000113 <__kstrtab_ipu_free_irq>:
 113:	5f757069 	svcpl	0x00757069
 117:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
 11b:	7172695f 	cmnvc	r2, pc, asr r9
	...

00000120 <__kstrtab_ipu_request_irq>:
 120:	5f757069 	svcpl	0x00757069
 124:	75716572 	ldrbvc	r6, [r1, #-1394]!	; 0xfffffa8e
 128:	5f747365 	svcpl	0x00747365
 12c:	00717269 	rsbseq	r7, r1, r9, ror #4

00000130 <__kstrtab_ipu_get_irq_status>:
 130:	5f757069 	svcpl	0x00757069
 134:	5f746567 	svcpl	0x00746567
 138:	5f717269 	svcpl	0x00717269
 13c:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
 140:	69007375 	stmdbvs	r0, {r0, r2, r4, r5, r6, r8, r9, ip, sp, lr}

00000143 <__kstrtab_ipu_clear_irq>:
 143:	5f757069 	svcpl	0x00757069
 147:	61656c63 	cmnvs	r5, r3, ror #24
 14b:	72695f72 	rsbvc	r5, r9, #456	; 0x1c8
 14f:	70690071 	rsbvc	r0, r9, r1, ror r0

00000151 <__kstrtab_ipu_disable_irq>:
 151:	5f757069 	svcpl	0x00757069
 155:	61736964 	cmnvs	r3, r4, ror #18
 159:	5f656c62 	svcpl	0x00656c62
 15d:	00717269 	rsbseq	r7, r1, r9, ror #4

00000161 <__kstrtab_ipu_enable_irq>:
 161:	5f757069 	svcpl	0x00757069
 165:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 169:	695f656c 	ldmdbvs	pc, {r2, r3, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
 16d:	69007172 	stmdbvs	r0, {r1, r4, r5, r6, r8, ip, sp, lr}

00000170 <__kstrtab_ipu_disable_csi>:
 170:	5f757069 	svcpl	0x00757069
 174:	61736964 	cmnvs	r3, r4, ror #18
 178:	5f656c62 	svcpl	0x00656c62
 17c:	00697363 	rsbeq	r7, r9, r3, ror #6

00000180 <__kstrtab_ipu_enable_csi>:
 180:	5f757069 	svcpl	0x00757069
 184:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 188:	635f656c 	cmpvs	pc, #108, 10	; 0x1b000000
 18c:	69006973 	stmdbvs	r0, {r0, r1, r4, r5, r6, r8, fp, sp, lr}

0000018f <__kstrtab_ipu_disable_channel>:
 18f:	5f757069 	svcpl	0x00757069
 193:	61736964 	cmnvs	r3, r4, ror #18
 197:	5f656c62 	svcpl	0x00656c62
 19b:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 19f:	006c656e 	rsbeq	r6, ip, lr, ror #10

000001a3 <__kstrtab_ipu_clear_buffer_ready>:
 1a3:	5f757069 	svcpl	0x00757069
 1a7:	61656c63 	cmnvs	r5, r3, ror #24
 1ab:	75625f72 	strbvc	r5, [r2, #-3954]!	; 0xfffff08e
 1af:	72656666 	rsbvc	r6, r5, #106954752	; 0x6600000
 1b3:	6165725f 	cmnvs	r5, pc, asr r2
 1b7:	69007964 	stmdbvs	r0, {r2, r5, r6, r8, fp, ip, sp, lr}

000001ba <__kstrtab_ipu_check_buffer_ready>:
 1ba:	5f757069 	svcpl	0x00757069
 1be:	63656863 	cmnvs	r5, #6488064	; 0x630000
 1c2:	75625f6b 	strbvc	r5, [r2, #-3947]!	; 0xfffff095
 1c6:	72656666 	rsbvc	r6, r5, #106954752	; 0x6600000
 1ca:	6165725f 	cmnvs	r5, pc, asr r2
 1ce:	69007964 	stmdbvs	r0, {r2, r5, r6, r8, fp, ip, sp, lr}

000001d1 <__kstrtab_ipu_enable_channel>:
 1d1:	5f757069 	svcpl	0x00757069
 1d5:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 1d9:	635f656c 	cmpvs	pc, #108, 10	; 0x1b000000
 1dd:	6e6e6168 	powvsez	f6, f6, #0.0
 1e1:	69006c65 	stmdbvs	r0, {r0, r2, r5, r6, sl, fp, sp, lr}

000001e4 <__kstrtab_ipu_is_channel_busy>:
 1e4:	5f757069 	svcpl	0x00757069
 1e8:	635f7369 	cmpvs	pc, #-1543503871	; 0xa4000001
 1ec:	6e6e6168 	powvsez	f6, f6, #0.0
 1f0:	625f6c65 	subsvs	r6, pc, #25856	; 0x6500
 1f4:	00797375 	rsbseq	r7, r9, r5, ror r3

000001f8 <__kstrtab_ipu_unlink_channels>:
 1f8:	5f757069 	svcpl	0x00757069
 1fc:	696c6e75 	stmdbvs	ip!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 200:	635f6b6e 	cmpvs	pc, #112640	; 0x1b800
 204:	6e6e6168 	powvsez	f6, f6, #0.0
 208:	00736c65 	rsbseq	r6, r3, r5, ror #24

0000020c <__kstrtab_ipu_link_channels>:
 20c:	5f757069 	svcpl	0x00757069
 210:	6b6e696c 	blvs	1b9a7c8 <__crc_ipu_ch_param_bad_alpha_pos+0x13ad449>
 214:	6168635f 	cmnvs	r8, pc, asr r3
 218:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 21c:	70690073 	rsbvc	r0, r9, r3, ror r0

0000021e <__kstrtab_ipu_select_multi_vdi_buffer>:
 21e:	5f757069 	svcpl	0x00757069
 222:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0xfffffa8d
 226:	6d5f7463 	cfldrdvs	mvd7, [pc, #-396]	; a0 <__kstrtab_ipu_ch_param_bad_alpha_pos+0x8>
 22a:	69746c75 	ldmdbvs	r4!, {r0, r2, r4, r5, r6, sl, fp, sp, lr}^
 22e:	6964765f 	stmdbvs	r4!, {r0, r1, r2, r3, r4, r6, r9, sl, ip, sp, lr}^
 232:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 236:	00726566 	rsbseq	r6, r2, r6, ror #10

0000023a <__kstrtab_ipu_select_buffer>:
 23a:	5f757069 	svcpl	0x00757069
 23e:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0xfffffa8d
 242:	625f7463 	subsvs	r7, pc, #1660944384	; 0x63000000
 246:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
 24a:	70690072 	rsbvc	r0, r9, r2, ror r0

0000024c <__kstrtab_ipu_get_channel_offset>:
 24c:	5f757069 	svcpl	0x00757069
 250:	5f746567 	svcpl	0x00746567
 254:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 258:	5f6c656e 	svcpl	0x006c656e
 25c:	7366666f 	cmnvc	r6, #116391936	; 0x6f00000
 260:	69007465 	stmdbvs	r0, {r0, r2, r5, r6, sl, ip, sp, lr}

00000263 <__kstrtab_ipu_update_channel_offset>:
 263:	5f757069 	svcpl	0x00757069
 267:	61647075 	smcvs	18181	; 0x4705
 26b:	635f6574 	cmpvs	pc, #116, 10	; 0x1d000000
 26f:	6e6e6168 	powvsez	f6, f6, #0.0
 273:	6f5f6c65 	svcvs	0x005f6c65
 277:	65736666 	ldrbvs	r6, [r3, #-1638]!	; 0xfffff99a
 27b:	70690074 	rsbvc	r0, r9, r4, ror r0

0000027d <__kstrtab_ipu_set_channel_bandmode>:
 27d:	5f757069 	svcpl	0x00757069
 281:	5f746573 	svcpl	0x00746573
 285:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
 289:	5f6c656e 	svcpl	0x006c656e
 28d:	646e6162 	strbtvs	r6, [lr], #-354	; 0xfffffe9e
 291:	65646f6d 	strbvs	r6, [r4, #-3949]!	; 0xfffff093
	...

00000296 <__kstrtab_ipu_update_channel_buffer>:
 296:	5f757069 	svcpl	0x00757069
 29a:	61647075 	smcvs	18181	; 0x4705
 29e:	635f6574 	cmpvs	pc, #116, 10	; 0x1d000000
 2a2:	6e6e6168 	powvsez	f6, f6, #0.0
 2a6:	625f6c65 	subsvs	r6, pc, #25856	; 0x6500
 2aa:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
 2ae:	70690072 	rsbvc	r0, r9, r2, ror r0

000002b0 <__kstrtab_ipu_init_channel_buffer>:
 2b0:	5f757069 	svcpl	0x00757069
 2b4:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 2b8:	6168635f 	cmnvs	r8, pc, asr r3
 2bc:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
 2c0:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
 2c4:	00726566 	rsbseq	r6, r2, r6, ror #10

000002c8 <__kstrtab_ipu_uninit_channel>:
 2c8:	5f757069 	svcpl	0x00757069
 2cc:	6e696e75 	mcrvs	14, 3, r6, cr9, cr5, {3}
 2d0:	635f7469 	cmpvs	pc, #1761607680	; 0x69000000
 2d4:	6e6e6168 	powvsez	f6, f6, #0.0
 2d8:	69006c65 	stmdbvs	r0, {r0, r2, r5, r6, sl, fp, sp, lr}

000002db <__kstrtab_ipu_init_channel>:
 2db:	5f757069 	svcpl	0x00757069
 2df:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 2e3:	6168635f 	cmnvs	r8, pc, asr r3
 2e7:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
	...

000002ec <__kstrtab_ipu_disable_hsp_clk>:
 2ec:	5f757069 	svcpl	0x00757069
 2f0:	61736964 	cmnvs	r3, r4, ror #18
 2f4:	5f656c62 	svcpl	0x00656c62
 2f8:	5f707368 	svcpl	0x00707368
 2fc:	006b6c63 	rsbeq	r6, fp, r3, ror #24

00000300 <__kstrtab_ipu_get_soc>:
 300:	5f757069 	svcpl	0x00757069
 304:	5f746567 	svcpl	0x00746567
 308:	00636f73 	rsbeq	r6, r3, r3, ror pc

Disassembly of section .data:

00000000 <ipu_type_imx6q>:
   0:	00000c2c 	andeq	r0, r0, ip, lsr #24
   4:	00200000 	eoreq	r0, r0, r0
   8:	00208000 	eoreq	r8, r0, r0
   c:	00220000 	eoreq	r0, r2, r0
  10:	00230000 	eoreq	r0, r3, r0
  14:	00238000 	eoreq	r8, r3, r0
  18:	00240000 	eoreq	r0, r4, r0
  1c:	00248000 	eoreq	r8, r4, r0
  20:	00250000 	eoreq	r0, r5, r0
  24:	00258000 	eoreq	r8, r5, r0
  28:	00260000 	eoreq	r0, r6, r0
  2c:	00268000 	eoreq	r8, r6, r0
  30:	00300000 	eorseq	r0, r0, r0
  34:	00340000 	eorseq	r0, r4, r0
  38:	00360000 	eorseq	r0, r6, r0
  3c:	00380000 	eorseq	r0, r8, r0
  40:	00000003 	andeq	r0, r0, r3
  44:	00000001 	andeq	r0, r0, r1
	...
  58:	00000001 	andeq	r0, r0, r1
	...

00000068 <ipu_type_imx6qp>:
  68:	00000c2c 	andeq	r0, r0, ip, lsr #24
  6c:	00200000 	eoreq	r0, r0, r0
  70:	00208000 	eoreq	r8, r0, r0
  74:	00220000 	eoreq	r0, r2, r0
  78:	00230000 	eoreq	r0, r3, r0
  7c:	00238000 	eoreq	r8, r3, r0
  80:	00240000 	eoreq	r0, r4, r0
  84:	00248000 	eoreq	r8, r4, r0
  88:	00250000 	eoreq	r0, r5, r0
  8c:	00258000 	eoreq	r8, r5, r0
  90:	00260000 	eoreq	r0, r6, r0
  94:	00268000 	eoreq	r8, r6, r0
  98:	00300000 	eorseq	r0, r0, r0
  9c:	00340000 	eorseq	r0, r4, r0
  a0:	00360000 	eorseq	r0, r6, r0
  a4:	00380000 	eorseq	r0, r8, r0
  a8:	00000003 	andeq	r0, r0, r3
  ac:	00000001 	andeq	r0, r0, r1
	...
  b8:	00000002 	andeq	r0, r0, r2
  bc:	00000003 	andeq	r0, r0, r3
  c0:	00000001 	andeq	r0, r0, r1
  c4:	00010101 	andeq	r0, r1, r1, lsl #2
  c8:	00000003 	andeq	r0, r0, r3
  cc:	00000003 	andeq	r0, r0, r3

000000d0 <ipu_type_imx53>:
  d0:	00000c34 	andeq	r0, r0, r4, lsr ip
  d4:	06000000 	streq	r0, [r0], -r0
  d8:	06008000 	streq	r8, [r0], -r0
  dc:	06020000 	streq	r0, [r2], -r0
  e0:	06030000 	streq	r0, [r3], -r0
  e4:	06038000 	streq	r8, [r3], -r0
  e8:	06040000 	streq	r0, [r4], -r0
  ec:	06048000 	streq	r8, [r4], -r0
  f0:	06050000 	streq	r0, [r5], -r0
  f4:	06058000 	streq	r8, [r5], -r0
  f8:	06060000 	streq	r0, [r6], -r0
  fc:	06068000 	streq	r8, [r6], -r0
 100:	07000000 	streq	r0, [r0, -r0]
 104:	07040000 	streq	r0, [r4, -r0]
 108:	07060000 	streq	r0, [r6, -r0]
 10c:	07080000 	streq	r0, [r8, -r0]
 110:	00000002 	andeq	r0, r0, r2
 114:	00000001 	andeq	r0, r0, r1
 118:	00000001 	andeq	r0, r0, r1
 11c:	00000001 	andeq	r0, r0, r1
 120:	00000001 	andeq	r0, r0, r1
 124:	00000001 	andeq	r0, r0, r1
	...

00000138 <ipu_type_imx51>:
 138:	00000c3c 	andeq	r0, r0, ip, lsr ip
 13c:	1e000000 	cdpne	0, 0, cr0, cr0, cr0, {0}
 140:	1e008000 	cdpne	0, 0, cr8, cr0, cr0, {0}
 144:	1e020000 	cdpne	0, 0, cr0, cr2, cr0, {0}
 148:	1e030000 	cdpne	0, 0, cr0, cr3, cr0, {0}
 14c:	1e038000 	cdpne	0, 0, cr8, cr3, cr0, {0}
 150:	1e040000 	cdpne	0, 0, cr0, cr4, cr0, {0}
 154:	1e048000 	cdpne	0, 0, cr8, cr4, cr0, {0}
 158:	1e050000 	cdpne	0, 0, cr0, cr5, cr0, {0}
 15c:	1e058000 	cdpne	0, 0, cr8, cr5, cr0, {0}
 160:	1e060000 	cdpne	0, 0, cr0, cr6, cr0, {0}
 164:	1e068000 	cdpne	0, 0, cr8, cr6, cr0, {0}
 168:	1f000000 	svcne	0x00000000
 16c:	1f040000 	svcne	0x00040000
 170:	1f060000 	svcne	0x00060000
 174:	1f080000 	svcne	0x00080000
 178:	00000001 	andeq	r0, r0, r1
 17c:	00000000 	andeq	r0, r0, r0
 180:	00000001 	andeq	r0, r0, r1
 184:	00000001 	andeq	r0, r0, r1
 188:	00000001 	andeq	r0, r0, r1
 18c:	00000001 	andeq	r0, r0, r1
	...

Disassembly of section __verbose:

00000000 <descriptor.37959>:
   0:	00000c20 	andeq	r0, r0, r0, lsr #24
   4:	00000068 	andeq	r0, r0, r8, rrx
   8:	00000190 	muleq	r0, r0, r1
   c:	000000d8 	ldrdeq	r0, [r0], -r8
  10:	000406a7 	andeq	r0, r4, r7, lsr #13
  14:	00000000 	andeq	r0, r0, r0

00000018 <descriptor.37143>:
  18:	00000c20 	andeq	r0, r0, r0, lsr #24
  1c:	000002ac 	andeq	r0, r0, ip, lsr #5
  20:	00000c44 	andeq	r0, r0, r4, asr #24
  24:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  28:	000403dc 	ldrdeq	r0, [r4], -ip
  2c:	00000000 	andeq	r0, r0, r0

00000030 <descriptor.37978>:
  30:	00000c20 	andeq	r0, r0, r0, lsr #24
  34:	000002c8 	andeq	r0, r0, r8, asr #5
  38:	00000190 	muleq	r0, r0, r1
  3c:	000000fc 	strdeq	r0, [r0], -ip
  40:	000406e4 	andeq	r0, r4, r4, ror #13
  44:	00000000 	andeq	r0, r0, r0

00000048 <descriptor.37828>:
  48:	00000c20 	andeq	r0, r0, r0, lsr #24
  4c:	00000324 	andeq	r0, r0, r4, lsr #6
  50:	00000190 	muleq	r0, r0, r1
  54:	0000011c 	andeq	r0, r0, ip, lsl r1
  58:	0004046f 	andeq	r0, r4, pc, ror #8
  5c:	00000000 	andeq	r0, r0, r0

00000060 <descriptor.37892>:
  60:	00000c20 	andeq	r0, r0, r0, lsr #24
  64:	0000030c 	andeq	r0, r0, ip, lsl #6
  68:	00000190 	muleq	r0, r0, r1
  6c:	000001e4 	andeq	r0, r0, r4, ror #3
  70:	0004058c 	andeq	r0, r4, ip, lsl #11
  74:	00000000 	andeq	r0, r0, r0

00000078 <descriptor.37894>:
  78:	00000c20 	andeq	r0, r0, r0, lsr #24
  7c:	0000030c 	andeq	r0, r0, ip, lsl #6
  80:	00000190 	muleq	r0, r0, r1
  84:	000001f8 	strdeq	r0, [r0], -r8
  88:	0004058e 	andeq	r0, r4, lr, lsl #11
  8c:	00000000 	andeq	r0, r0, r0

00000090 <descriptor.37895>:
  90:	00000c20 	andeq	r0, r0, r0, lsr #24
  94:	0000030c 	andeq	r0, r0, ip, lsl #6
  98:	00000190 	muleq	r0, r0, r1
  9c:	00000204 	andeq	r0, r0, r4, lsl #4
  a0:	0004058f 	andeq	r0, r4, pc, lsl #11
  a4:	00000000 	andeq	r0, r0, r0

000000a8 <descriptor.37896>:
  a8:	00000c20 	andeq	r0, r0, r0, lsr #24
  ac:	0000030c 	andeq	r0, r0, ip, lsl #6
  b0:	00000190 	muleq	r0, r0, r1
  b4:	00000210 	andeq	r0, r0, r0, lsl r2
  b8:	00040590 	muleq	r4, r0, r5
  bc:	00000000 	andeq	r0, r0, r0

000000c0 <descriptor.37897>:
  c0:	00000c20 	andeq	r0, r0, r0, lsr #24
  c4:	0000030c 	andeq	r0, r0, ip, lsl #6
  c8:	00000190 	muleq	r0, r0, r1
  cc:	0000021c 	andeq	r0, r0, ip, lsl r2
  d0:	00040591 	muleq	r4, r1, r5
  d4:	00000000 	andeq	r0, r0, r0

000000d8 <descriptor.37898>:
  d8:	00000c20 	andeq	r0, r0, r0, lsr #24
  dc:	0000030c 	andeq	r0, r0, ip, lsl #6
  e0:	00000190 	muleq	r0, r0, r1
  e4:	00000228 	andeq	r0, r0, r8, lsr #4
  e8:	00040592 	muleq	r4, r2, r5
  ec:	00000000 	andeq	r0, r0, r0

000000f0 <descriptor.37899>:
  f0:	00000c20 	andeq	r0, r0, r0, lsr #24
  f4:	0000030c 	andeq	r0, r0, ip, lsl #6
  f8:	00000190 	muleq	r0, r0, r1
  fc:	00000234 	andeq	r0, r0, r4, lsr r2
 100:	00040593 	muleq	r4, r3, r5
 104:	00000000 	andeq	r0, r0, r0

00000108 <descriptor.37900>:
 108:	00000c20 	andeq	r0, r0, r0, lsr #24
 10c:	0000030c 	andeq	r0, r0, ip, lsl #6
 110:	00000190 	muleq	r0, r0, r1
 114:	0000023c 	andeq	r0, r0, ip, lsr r2
 118:	00040594 	muleq	r4, r4, r5
 11c:	00000000 	andeq	r0, r0, r0

00000120 <descriptor.37901>:
 120:	00000c20 	andeq	r0, r0, r0, lsr #24
 124:	0000030c 	andeq	r0, r0, ip, lsl #6
 128:	00000190 	muleq	r0, r0, r1
 12c:	00000244 	andeq	r0, r0, r4, asr #4
 130:	00040599 	muleq	r4, r9, r5
 134:	00000000 	andeq	r0, r0, r0

00000138 <descriptor.36462>:
 138:	00000c20 	andeq	r0, r0, r0, lsr #24
 13c:	000002f8 	strdeq	r0, [r0], -r8
 140:	00000c44 	andeq	r0, r0, r4, asr #24
 144:	00000378 	andeq	r0, r0, r8, ror r3
 148:	00040217 	andeq	r0, r4, r7, lsl r2
 14c:	00000000 	andeq	r0, r0, r0

00000150 <descriptor.36468>:
 150:	00000c20 	andeq	r0, r0, r0, lsr #24
 154:	000002f8 	strdeq	r0, [r0], -r8
 158:	00000c44 	andeq	r0, r0, r4, asr #24
 15c:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 160:	00040226 	andeq	r0, r4, r6, lsr #4
 164:	00000000 	andeq	r0, r0, r0

00000168 <descriptor.35929>:
 168:	00000c20 	andeq	r0, r0, r0, lsr #24
 16c:	000002e4 	andeq	r0, r0, r4, ror #5
 170:	00000c44 	andeq	r0, r0, r4, asr #24
 174:	00000458 	andeq	r0, r0, r8, asr r4
 178:	000400c3 	andeq	r0, r4, r3, asr #1
 17c:	00000000 	andeq	r0, r0, r0

00000180 <descriptor.35931>:
 180:	00000c20 	andeq	r0, r0, r0, lsr #24
 184:	000002e4 	andeq	r0, r0, r4, ror #5
 188:	00000c44 	andeq	r0, r0, r4, asr #24
 18c:	00000484 	andeq	r0, r0, r4, lsl #9
 190:	000400c6 	andeq	r0, r4, r6, asr #1
 194:	00000000 	andeq	r0, r0, r0

00000198 <descriptor.35932>:
 198:	00000c20 	andeq	r0, r0, r0, lsr #24
 19c:	000002e4 	andeq	r0, r0, r4, ror #5
 1a0:	00000c44 	andeq	r0, r0, r4, asr #24
 1a4:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
 1a8:	000400c8 	andeq	r0, r4, r8, asr #1
 1ac:	00000000 	andeq	r0, r0, r0

000001b0 <descriptor.35948>:
 1b0:	00000c20 	andeq	r0, r0, r0, lsr #24
 1b4:	000002e4 	andeq	r0, r0, r4, ror #5
 1b8:	00000c44 	andeq	r0, r0, r4, asr #24
 1bc:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
 1c0:	000400ca 	andeq	r0, r4, sl, asr #1
 1c4:	00000000 	andeq	r0, r0, r0

000001c8 <descriptor.35964>:
 1c8:	00000c20 	andeq	r0, r0, r0, lsr #24
 1cc:	000002e4 	andeq	r0, r0, r4, ror #5
 1d0:	00000c44 	andeq	r0, r0, r4, asr #24
 1d4:	000004c8 	andeq	r0, r0, r8, asr #9
 1d8:	000400cc 	andeq	r0, r4, ip, asr #1
 1dc:	00000000 	andeq	r0, r0, r0

000001e0 <descriptor.35980>:
 1e0:	00000c20 	andeq	r0, r0, r0, lsr #24
 1e4:	000002e4 	andeq	r0, r0, r4, ror #5
 1e8:	00000c44 	andeq	r0, r0, r4, asr #24
 1ec:	000004d4 	ldrdeq	r0, [r0], -r4
 1f0:	000400cf 	andeq	r0, r4, pc, asr #1
 1f4:	00000000 	andeq	r0, r0, r0

000001f8 <descriptor.35996>:
 1f8:	00000c20 	andeq	r0, r0, r0, lsr #24
 1fc:	000002e4 	andeq	r0, r0, r4, ror #5
 200:	00000c44 	andeq	r0, r0, r4, asr #24
 204:	000004dc 	ldrdeq	r0, [r0], -ip
 208:	000400d1 	ldrdeq	r0, [r4], -r1
 20c:	00000000 	andeq	r0, r0, r0

00000210 <descriptor.36012>:
 210:	00000c20 	andeq	r0, r0, r0, lsr #24
 214:	000002e4 	andeq	r0, r0, r4, ror #5
 218:	00000c44 	andeq	r0, r0, r4, asr #24
 21c:	000004e4 	andeq	r0, r0, r4, ror #9
 220:	000400d3 	ldrdeq	r0, [r4], -r3
 224:	00000000 	andeq	r0, r0, r0

00000228 <descriptor.36028>:
 228:	00000c20 	andeq	r0, r0, r0, lsr #24
 22c:	000002e4 	andeq	r0, r0, r4, ror #5
 230:	00000c44 	andeq	r0, r0, r4, asr #24
 234:	000004f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 238:	000400d5 	ldrdeq	r0, [r4], -r5
 23c:	00000000 	andeq	r0, r0, r0

00000240 <descriptor.36044>:
 240:	00000c20 	andeq	r0, r0, r0, lsr #24
 244:	000002e4 	andeq	r0, r0, r4, ror #5
 248:	00000c44 	andeq	r0, r0, r4, asr #24
 24c:	000004fc 	strdeq	r0, [r0], -ip
 250:	000400d7 	ldrdeq	r0, [r4], -r7
 254:	00000000 	andeq	r0, r0, r0

00000258 <descriptor.36060>:
 258:	00000c20 	andeq	r0, r0, r0, lsr #24
 25c:	000002e4 	andeq	r0, r0, r4, ror #5
 260:	00000c44 	andeq	r0, r0, r4, asr #24
 264:	00000508 	andeq	r0, r0, r8, lsl #10
 268:	000400d9 	ldrdeq	r0, [r4], -r9
 26c:	00000000 	andeq	r0, r0, r0

00000270 <descriptor.36076>:
 270:	00000c20 	andeq	r0, r0, r0, lsr #24
 274:	000002e4 	andeq	r0, r0, r4, ror #5
 278:	00000c44 	andeq	r0, r0, r4, asr #24
 27c:	00000518 	andeq	r0, r0, r8, lsl r5
 280:	000400db 	ldrdeq	r0, [r4], -fp
 284:	00000000 	andeq	r0, r0, r0

00000288 <descriptor.36092>:
 288:	00000c20 	andeq	r0, r0, r0, lsr #24
 28c:	000002e4 	andeq	r0, r0, r4, ror #5
 290:	00000c44 	andeq	r0, r0, r4, asr #24
 294:	00000528 	andeq	r0, r0, r8, lsr #10
 298:	000400dd 	ldrdeq	r0, [r4], -sp
 29c:	00000000 	andeq	r0, r0, r0

000002a0 <descriptor.36108>:
 2a0:	00000c20 	andeq	r0, r0, r0, lsr #24
 2a4:	000002e4 	andeq	r0, r0, r4, ror #5
 2a8:	00000c44 	andeq	r0, r0, r4, asr #24
 2ac:	00000538 	andeq	r0, r0, r8, lsr r5
 2b0:	000400df 	ldrdeq	r0, [r4], -pc	; <UNPREDICTABLE>
 2b4:	00000000 	andeq	r0, r0, r0

000002b8 <descriptor.36124>:
 2b8:	00000c20 	andeq	r0, r0, r0, lsr #24
 2bc:	000002e4 	andeq	r0, r0, r4, ror #5
 2c0:	00000c44 	andeq	r0, r0, r4, asr #24
 2c4:	00000548 	andeq	r0, r0, r8, asr #10
 2c8:	000400e2 	andeq	r0, r4, r2, ror #1
 2cc:	00000000 	andeq	r0, r0, r0

000002d0 <descriptor.36140>:
 2d0:	00000c20 	andeq	r0, r0, r0, lsr #24
 2d4:	000002e4 	andeq	r0, r0, r4, ror #5
 2d8:	00000c44 	andeq	r0, r0, r4, asr #24
 2dc:	00000558 	andeq	r0, r0, r8, asr r5
 2e0:	000400e4 	andeq	r0, r4, r4, ror #1
 2e4:	00000000 	andeq	r0, r0, r0

000002e8 <descriptor.36156>:
 2e8:	00000c20 	andeq	r0, r0, r0, lsr #24
 2ec:	000002e4 	andeq	r0, r0, r4, ror #5
 2f0:	00000c44 	andeq	r0, r0, r4, asr #24
 2f4:	00000568 	andeq	r0, r0, r8, ror #10
 2f8:	000400e6 	andeq	r0, r4, r6, ror #1
 2fc:	00000000 	andeq	r0, r0, r0

00000300 <descriptor.36172>:
 300:	00000c20 	andeq	r0, r0, r0, lsr #24
 304:	000002e4 	andeq	r0, r0, r4, ror #5
 308:	00000c44 	andeq	r0, r0, r4, asr #24
 30c:	00000578 	andeq	r0, r0, r8, ror r5
 310:	000400e8 	andeq	r0, r4, r8, ror #1
 314:	00000000 	andeq	r0, r0, r0

00000318 <descriptor.36188>:
 318:	00000c20 	andeq	r0, r0, r0, lsr #24
 31c:	000002e4 	andeq	r0, r0, r4, ror #5
 320:	00000c44 	andeq	r0, r0, r4, asr #24
 324:	00000588 	andeq	r0, r0, r8, lsl #11
 328:	000400ea 	andeq	r0, r4, sl, ror #1
 32c:	00000000 	andeq	r0, r0, r0

00000330 <descriptor.36204>:
 330:	00000c20 	andeq	r0, r0, r0, lsr #24
 334:	000002e4 	andeq	r0, r0, r4, ror #5
 338:	00000c44 	andeq	r0, r0, r4, asr #24
 33c:	00000598 	muleq	r0, r8, r5
 340:	000400ec 	andeq	r0, r4, ip, ror #1
 344:	00000000 	andeq	r0, r0, r0

00000348 <descriptor.36220>:
 348:	00000c20 	andeq	r0, r0, r0, lsr #24
 34c:	000002e4 	andeq	r0, r0, r4, ror #5
 350:	00000c44 	andeq	r0, r0, r4, asr #24
 354:	000005a8 	andeq	r0, r0, r8, lsr #11
 358:	000400ee 	andeq	r0, r4, lr, ror #1
 35c:	00000000 	andeq	r0, r0, r0

00000360 <descriptor.36236>:
 360:	00000c20 	andeq	r0, r0, r0, lsr #24
 364:	000002e4 	andeq	r0, r0, r4, ror #5
 368:	00000c44 	andeq	r0, r0, r4, asr #24
 36c:	000005b8 			; <UNDEFINED> instruction: 0x000005b8
 370:	000400f0 	strdeq	r0, [r4], -r0	; <UNPREDICTABLE>
 374:	00000000 	andeq	r0, r0, r0

00000378 <descriptor.38205>:
 378:	00000c20 	andeq	r0, r0, r0, lsr #24
 37c:	00000298 	muleq	r0, r8, r2
 380:	00000190 	muleq	r0, r0, r1
 384:	000005ec 	andeq	r0, r0, ip, ror #11
 388:	00040950 	andeq	r0, r4, r0, asr r9
 38c:	00000000 	andeq	r0, r0, r0

00000390 <descriptor.38207>:
 390:	00000c20 	andeq	r0, r0, r0, lsr #24
 394:	00000298 	muleq	r0, r8, r2
 398:	00000190 	muleq	r0, r0, r1
 39c:	00000604 	andeq	r0, r0, r4, lsl #12
 3a0:	00040951 	andeq	r0, r4, r1, asr r9
 3a4:	00000000 	andeq	r0, r0, r0

000003a8 <descriptor.38356>:
 3a8:	00000c20 	andeq	r0, r0, r0, lsr #24
 3ac:	00000244 	andeq	r0, r0, r4, asr #4
 3b0:	00000190 	muleq	r0, r0, r1
 3b4:	00000618 	andeq	r0, r0, r8, lsl r6
 3b8:	00040b81 	andeq	r0, r4, r1, lsl #23
 3bc:	00000000 	andeq	r0, r0, r0

000003c0 <descriptor.38358>:
 3c0:	00000c20 	andeq	r0, r0, r0, lsr #24
 3c4:	00000244 	andeq	r0, r0, r4, asr #4
 3c8:	00000190 	muleq	r0, r0, r1
 3cc:	00000624 	andeq	r0, r0, r4, lsr #12
 3d0:	00040b83 	andeq	r0, r4, r3, lsl #23
 3d4:	00000000 	andeq	r0, r0, r0

000003d8 <descriptor.38359>:
 3d8:	00000c20 	andeq	r0, r0, r0, lsr #24
 3dc:	00000244 	andeq	r0, r0, r4, asr #4
 3e0:	00000190 	muleq	r0, r0, r1
 3e4:	0000063c 	andeq	r0, r0, ip, lsr r6
 3e8:	00040b85 	andeq	r0, r4, r5, lsl #23
 3ec:	00000000 	andeq	r0, r0, r0

000003f0 <descriptor.38360>:
 3f0:	00000c20 	andeq	r0, r0, r0, lsr #24
 3f4:	00000244 	andeq	r0, r0, r4, asr #4
 3f8:	00000190 	muleq	r0, r0, r1
 3fc:	00000618 	andeq	r0, r0, r8, lsl r6
 400:	00040b86 	andeq	r0, r4, r6, lsl #23
 404:	00000000 	andeq	r0, r0, r0

00000408 <descriptor.38364>:
 408:	00000c20 	andeq	r0, r0, r0, lsr #24
 40c:	00000244 	andeq	r0, r0, r4, asr #4
 410:	00000190 	muleq	r0, r0, r1
 414:	00000618 	andeq	r0, r0, r8, lsl r6
 418:	00040b8f 	andeq	r0, r4, pc, lsl #23
 41c:	00000000 	andeq	r0, r0, r0

00000420 <descriptor.38368>:
 420:	00000c20 	andeq	r0, r0, r0, lsr #24
 424:	00000244 	andeq	r0, r0, r4, asr #4
 428:	00000190 	muleq	r0, r0, r1
 42c:	00000650 	andeq	r0, r0, r0, asr r6
 430:	00040b92 	muleq	r4, r2, fp
 434:	00000000 	andeq	r0, r0, r0

00000438 <descriptor.37783>:
 438:	00000c20 	andeq	r0, r0, r0, lsr #24
 43c:	000001ec 	andeq	r0, r0, ip, ror #3
 440:	00000190 	muleq	r0, r0, r1
 444:	00000658 	andeq	r0, r0, r8, asr r6
 448:	00040301 	andeq	r0, r4, r1, lsl #6
 44c:	00000000 	andeq	r0, r0, r0

00000450 <descriptor.37792>:
 450:	00000c20 	andeq	r0, r0, r0, lsr #24
 454:	000001ec 	andeq	r0, r0, ip, ror #3
 458:	00000190 	muleq	r0, r0, r1
 45c:	000006bc 			; <UNDEFINED> instruction: 0x000006bc
 460:	0004035a 	andeq	r0, r4, sl, asr r3
 464:	00000000 	andeq	r0, r0, r0

00000468 <descriptor.38321>:
 468:	00000c20 	andeq	r0, r0, r0, lsr #24
 46c:	00000200 	andeq	r0, r0, r0, lsl #4
 470:	00000190 	muleq	r0, r0, r1
 474:	00000734 	andeq	r0, r0, r4, lsr r7
 478:	00040b21 	andeq	r0, r4, r1, lsr #22
 47c:	00000000 	andeq	r0, r0, r0

00000480 <descriptor.38450>:
 480:	00000c20 	andeq	r0, r0, r0, lsr #24
 484:	00000210 	andeq	r0, r0, r0, lsl r2
 488:	00000190 	muleq	r0, r0, r1
 48c:	0000077c 	andeq	r0, r0, ip, ror r7
 490:	00040c53 	andeq	r0, r4, r3, asr ip
 494:	00000000 	andeq	r0, r0, r0

00000498 <descriptor.38472>:
 498:	00000c20 	andeq	r0, r0, r0, lsr #24
 49c:	00000220 	andeq	r0, r0, r0, lsr #4
 4a0:	00000190 	muleq	r0, r0, r1
 4a4:	000007d4 	ldrdeq	r0, [r0], -r4
 4a8:	00040c94 	muleq	r4, r4, ip
 4ac:	00000000 	andeq	r0, r0, r0

000004b0 <descriptor.38474>:
 4b0:	00000c20 	andeq	r0, r0, r0, lsr #24
 4b4:	00000220 	andeq	r0, r0, r0, lsr #4
 4b8:	00000190 	muleq	r0, r0, r1
 4bc:	000007e4 	andeq	r0, r0, r4, ror #15
 4c0:	00040c98 	muleq	r4, r8, ip
 4c4:	00000000 	andeq	r0, r0, r0

000004c8 <descriptor.38481>:
 4c8:	00000c20 	andeq	r0, r0, r0, lsr #24
 4cc:	00000220 	andeq	r0, r0, r0, lsr #4
 4d0:	00000190 	muleq	r0, r0, r1
 4d4:	000007fc 	strdeq	r0, [r0], -ip
 4d8:	00040ca7 	andeq	r0, r4, r7, lsr #25
 4dc:	00000000 	andeq	r0, r0, r0

000004e0 <descriptor.38521>:
 4e0:	00000c20 	andeq	r0, r0, r0, lsr #24
 4e4:	00000230 	andeq	r0, r0, r0, lsr r2
 4e8:	00000190 	muleq	r0, r0, r1
 4ec:	00000814 	andeq	r0, r0, r4, lsl r8
 4f0:	00040cfe 	strdeq	r0, [r4], -lr
 4f4:	00000000 	andeq	r0, r0, r0

000004f8 <descriptor.37746>:
 4f8:	00000c20 	andeq	r0, r0, r0, lsr #24
 4fc:	00000338 	andeq	r0, r0, r8, lsr r3
 500:	00000190 	muleq	r0, r0, r1
 504:	00000828 	andeq	r0, r0, r8, lsr #16
 508:	000402bc 			; <UNDEFINED> instruction: 0x000402bc
 50c:	00000000 	andeq	r0, r0, r0

00000510 <descriptor.37748>:
 510:	00000c20 	andeq	r0, r0, r0, lsr #24
 514:	00000338 	andeq	r0, r0, r8, lsr r3
 518:	00000190 	muleq	r0, r0, r1
 51c:	00000844 	andeq	r0, r0, r4, asr #16
 520:	000402bd 			; <UNDEFINED> instruction: 0x000402bd
 524:	00000000 	andeq	r0, r0, r0

00000528 <descriptor.37749>:
 528:	00000c20 	andeq	r0, r0, r0, lsr #24
 52c:	00000338 	andeq	r0, r0, r8, lsr r3
 530:	00000190 	muleq	r0, r0, r1
 534:	00000858 	andeq	r0, r0, r8, asr r8
 538:	000402be 			; <UNDEFINED> instruction: 0x000402be
 53c:	00000000 	andeq	r0, r0, r0

00000540 <descriptor.37750>:
 540:	00000c20 	andeq	r0, r0, r0, lsr #24
 544:	00000338 	andeq	r0, r0, r8, lsr r3
 548:	00000190 	muleq	r0, r0, r1
 54c:	00000870 	andeq	r0, r0, r0, ror r8
 550:	000402c0 	andeq	r0, r4, r0, asr #5
 554:	00000000 	andeq	r0, r0, r0

00000558 <descriptor.37751>:
 558:	00000c20 	andeq	r0, r0, r0, lsr #24
 55c:	00000338 	andeq	r0, r0, r8, lsr r3
 560:	00000190 	muleq	r0, r0, r1
 564:	0000088c 	andeq	r0, r0, ip, lsl #17
 568:	000402c2 	andeq	r0, r4, r2, asr #5
 56c:	00000000 	andeq	r0, r0, r0

00000570 <descriptor.37752>:
 570:	00000c20 	andeq	r0, r0, r0, lsr #24
 574:	00000338 	andeq	r0, r0, r8, lsr r3
 578:	00000190 	muleq	r0, r0, r1
 57c:	000008a8 	andeq	r0, r0, r8, lsr #17
 580:	000402c4 	andeq	r0, r4, r4, asr #5
 584:	00000000 	andeq	r0, r0, r0

00000588 <descriptor.37753>:
 588:	00000c20 	andeq	r0, r0, r0, lsr #24
 58c:	00000338 	andeq	r0, r0, r8, lsr r3
 590:	00000190 	muleq	r0, r0, r1
 594:	000008c4 	andeq	r0, r0, r4, asr #17
 598:	000402c6 	andeq	r0, r4, r6, asr #5
 59c:	00000000 	andeq	r0, r0, r0

000005a0 <descriptor.37754>:
 5a0:	00000c20 	andeq	r0, r0, r0, lsr #24
 5a4:	00000338 	andeq	r0, r0, r8, lsr r3
 5a8:	00000190 	muleq	r0, r0, r1
 5ac:	000008e0 	andeq	r0, r0, r0, ror #17
 5b0:	000402c8 	andeq	r0, r4, r8, asr #5
 5b4:	00000000 	andeq	r0, r0, r0

000005b8 <descriptor.37755>:
 5b8:	00000c20 	andeq	r0, r0, r0, lsr #24
 5bc:	00000338 	andeq	r0, r0, r8, lsr r3
 5c0:	00000190 	muleq	r0, r0, r1
 5c4:	000008fc 	strdeq	r0, [r0], -ip
 5c8:	000402ca 	andeq	r0, r4, sl, asr #5
 5cc:	00000000 	andeq	r0, r0, r0

000005d0 <descriptor.37756>:
 5d0:	00000c20 	andeq	r0, r0, r0, lsr #24
 5d4:	00000338 	andeq	r0, r0, r8, lsr r3
 5d8:	00000190 	muleq	r0, r0, r1
 5dc:	00000918 	andeq	r0, r0, r8, lsl r9
 5e0:	000402cc 	andeq	r0, r4, ip, asr #5
 5e4:	00000000 	andeq	r0, r0, r0

000005e8 <descriptor.37757>:
 5e8:	00000c20 	andeq	r0, r0, r0, lsr #24
 5ec:	00000338 	andeq	r0, r0, r8, lsr r3
 5f0:	00000190 	muleq	r0, r0, r1
 5f4:	00000938 	andeq	r0, r0, r8, lsr r9
 5f8:	000402ce 	andeq	r0, r4, lr, asr #5
 5fc:	00000000 	andeq	r0, r0, r0

00000600 <descriptor.37758>:
 600:	00000c20 	andeq	r0, r0, r0, lsr #24
 604:	00000338 	andeq	r0, r0, r8, lsr r3
 608:	00000190 	muleq	r0, r0, r1
 60c:	00000958 	andeq	r0, r0, r8, asr r9
 610:	000402d1 	ldrdeq	r0, [r4], -r1
 614:	00000000 	andeq	r0, r0, r0

00000618 <descriptor.37759>:
 618:	00000c20 	andeq	r0, r0, r0, lsr #24
 61c:	00000338 	andeq	r0, r0, r8, lsr r3
 620:	00000190 	muleq	r0, r0, r1
 624:	0000097c 	andeq	r0, r0, ip, ror r9
 628:	000402d4 	ldrdeq	r0, [r4], -r4
 62c:	00000000 	andeq	r0, r0, r0

00000630 <descriptor.37760>:
 630:	00000c20 	andeq	r0, r0, r0, lsr #24
 634:	00000338 	andeq	r0, r0, r8, lsr r3
 638:	00000190 	muleq	r0, r0, r1
 63c:	000009a0 	andeq	r0, r0, r0, lsr #19
 640:	000402d7 	ldrdeq	r0, [r4], -r7
 644:	00000000 	andeq	r0, r0, r0

00000648 <descriptor.37761>:
 648:	00000c20 	andeq	r0, r0, r0, lsr #24
 64c:	00000338 	andeq	r0, r0, r8, lsr r3
 650:	00000190 	muleq	r0, r0, r1
 654:	000009b8 			; <UNDEFINED> instruction: 0x000009b8
 658:	000402d9 	ldrdeq	r0, [r4], -r9
 65c:	00000000 	andeq	r0, r0, r0

00000660 <descriptor.37762>:
 660:	00000c20 	andeq	r0, r0, r0, lsr #24
 664:	00000338 	andeq	r0, r0, r8, lsr r3
 668:	00000190 	muleq	r0, r0, r1
 66c:	000009d4 	ldrdeq	r0, [r0], -r4
 670:	000402db 	ldrdeq	r0, [r4], -fp
 674:	00000000 	andeq	r0, r0, r0

00000678 <descriptor.37763>:
 678:	00000c20 	andeq	r0, r0, r0, lsr #24
 67c:	00000338 	andeq	r0, r0, r8, lsr r3
 680:	00000190 	muleq	r0, r0, r1
 684:	000009ec 	andeq	r0, r0, ip, ror #19
 688:	000402dd 	ldrdeq	r0, [r4], -sp
 68c:	00000000 	andeq	r0, r0, r0

00000690 <descriptor.37764>:
 690:	00000c20 	andeq	r0, r0, r0, lsr #24
 694:	00000338 	andeq	r0, r0, r8, lsr r3
 698:	00000190 	muleq	r0, r0, r1
 69c:	00000a08 	andeq	r0, r0, r8, lsl #20
 6a0:	000402df 	ldrdeq	r0, [r4], -pc	; <UNPREDICTABLE>
 6a4:	00000000 	andeq	r0, r0, r0

000006a8 <descriptor.37765>:
 6a8:	00000c20 	andeq	r0, r0, r0, lsr #24
 6ac:	00000338 	andeq	r0, r0, r8, lsr r3
 6b0:	00000190 	muleq	r0, r0, r1
 6b4:	00000a20 	andeq	r0, r0, r0, lsr #20
 6b8:	000402e1 	andeq	r0, r4, r1, ror #5
 6bc:	00000000 	andeq	r0, r0, r0

000006c0 <descriptor.37766>:
 6c0:	00000c20 	andeq	r0, r0, r0, lsr #24
 6c4:	00000338 	andeq	r0, r0, r8, lsr r3
 6c8:	00000190 	muleq	r0, r0, r1
 6cc:	00000a40 	andeq	r0, r0, r0, asr #20
 6d0:	000402e3 	andeq	r0, r4, r3, ror #5
 6d4:	00000000 	andeq	r0, r0, r0

000006d8 <descriptor.37767>:
 6d8:	00000c20 	andeq	r0, r0, r0, lsr #24
 6dc:	00000338 	andeq	r0, r0, r8, lsr r3
 6e0:	00000190 	muleq	r0, r0, r1
 6e4:	00000a60 	andeq	r0, r0, r0, ror #20
 6e8:	000402e5 	andeq	r0, r4, r5, ror #5
 6ec:	00000000 	andeq	r0, r0, r0

000006f0 <descriptor.37768>:
 6f0:	00000c20 	andeq	r0, r0, r0, lsr #24
 6f4:	00000338 	andeq	r0, r0, r8, lsr r3
 6f8:	00000190 	muleq	r0, r0, r1
 6fc:	00000a80 	andeq	r0, r0, r0, lsl #21
 700:	000402e7 	andeq	r0, r4, r7, ror #5
 704:	00000000 	andeq	r0, r0, r0

00000708 <descriptor.37769>:
 708:	00000c20 	andeq	r0, r0, r0, lsr #24
 70c:	00000338 	andeq	r0, r0, r8, lsr r3
 710:	00000190 	muleq	r0, r0, r1
 714:	00000aa0 	andeq	r0, r0, r0, lsr #21
 718:	000402e9 	andeq	r0, r4, r9, ror #5
 71c:	00000000 	andeq	r0, r0, r0

00000720 <descriptor.37770>:
 720:	00000c20 	andeq	r0, r0, r0, lsr #24
 724:	00000338 	andeq	r0, r0, r8, lsr r3
 728:	00000190 	muleq	r0, r0, r1
 72c:	00000ac0 	andeq	r0, r0, r0, asr #21
 730:	000402eb 	andeq	r0, r4, fp, ror #5
 734:	00000000 	andeq	r0, r0, r0

00000738 <descriptor.37771>:
 738:	00000c20 	andeq	r0, r0, r0, lsr #24
 73c:	00000338 	andeq	r0, r0, r8, lsr r3
 740:	00000190 	muleq	r0, r0, r1
 744:	00000adc 	ldrdeq	r0, [r0], -ip
 748:	000402ed 	andeq	r0, r4, sp, ror #5
 74c:	00000000 	andeq	r0, r0, r0

00000750 <descriptor.38290>:
 750:	00000c20 	andeq	r0, r0, r0, lsr #24
 754:	00000284 	andeq	r0, r0, r4, lsl #5
 758:	00000190 	muleq	r0, r0, r1
 75c:	00000af4 	strdeq	r0, [r0], -r4
 760:	00040a49 	andeq	r0, r4, r9, asr #20
 764:	00000000 	andeq	r0, r0, r0

00000768 <descriptor.38298>:
 768:	00000c20 	andeq	r0, r0, r0, lsr #24
 76c:	00000284 	andeq	r0, r0, r4, lsl #5
 770:	00000190 	muleq	r0, r0, r1
 774:	00000b3c 	andeq	r0, r0, ip, lsr fp
 778:	00040a9f 	muleq	r4, pc, sl	; <UNPREDICTABLE>
 77c:	00000000 	andeq	r0, r0, r0

00000780 <descriptor.38300>:
 780:	00000c20 	andeq	r0, r0, r0, lsr #24
 784:	00000284 	andeq	r0, r0, r4, lsl #5
 788:	00000190 	muleq	r0, r0, r1
 78c:	00000b60 	andeq	r0, r0, r0, ror #22
 790:	00040aa6 	andeq	r0, r4, r6, lsr #21
 794:	00000000 	andeq	r0, r0, r0

00000798 <descriptor.38304>:
 798:	00000c20 	andeq	r0, r0, r0, lsr #24
 79c:	00000284 	andeq	r0, r0, r4, lsl #5
 7a0:	00000190 	muleq	r0, r0, r1
 7a4:	00000bc4 	andeq	r0, r0, r4, asr #23
 7a8:	00040ab5 			; <UNDEFINED> instruction: 0x00040ab5
 7ac:	00000000 	andeq	r0, r0, r0

000007b0 <descriptor.38705>:
 7b0:	00000c20 	andeq	r0, r0, r0, lsr #24
 7b4:	00000270 	andeq	r0, r0, r0, ror r2
 7b8:	00000190 	muleq	r0, r0, r1
 7bc:	00000bd4 	ldrdeq	r0, [r0], -r4
 7c0:	00040df1 	strdeq	r0, [r4], -r1
 7c4:	00000000 	andeq	r0, r0, r0

000007c8 <descriptor.38710>:
 7c8:	00000c20 	andeq	r0, r0, r0, lsr #24
 7cc:	0000025c 	andeq	r0, r0, ip, asr r2
 7d0:	00000190 	muleq	r0, r0, r1
 7d4:	00000bf0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 7d8:	00040df9 	strdeq	r0, [r4], -r9
 7dc:	00000000 	andeq	r0, r0, r0

Disassembly of section .bss:

00000000 <dum>:
       0:	00000000 	andeq	r0, r0, r0

00000004 <ipu_dum>:
	...

00001ee8 <ipu_array>:
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
	...

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002e41 	andeq	r2, r0, r1, asr #28
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000024 	andeq	r0, r0, r4, lsr #32
  10:	412d3705 			; <UNDEFINED> instruction: 0x412d3705
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14021202 	strne	r1, [r2], #-514	; 0xfffffdfe
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	19011803 	stmdbne	r1, {r0, r1, fp, ip}
  28:	1e021a01 	vmlane.f32	s2, s4, s2
  2c:	Address 0x000000000000002c is out of bounds.


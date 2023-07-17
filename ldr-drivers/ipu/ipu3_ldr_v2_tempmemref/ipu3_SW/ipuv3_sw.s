
ipuv3_sw.ko:     file format elf32-littlearm


Disassembly of section .note.gnu.build-id:

00000000 <.note.gnu.build-id>:
   0:	00000004 	andeq	r0, r0, r4
   4:	00000014 	andeq	r0, r0, r4, lsl r0
   8:	00000003 	andeq	r0, r0, r3
   c:	00554e47 	subseq	r4, r5, r7, asr #28
  10:	a0bbb5eb 	adcsge	fp, fp, fp, ror #11
  14:	069b45e6 	ldreq	r4, [fp], r6, ror #11
  18:	3edb9935 			; <UNDEFINED> instruction: 0x3edb9935
  1c:	1172546f 	cmnne	r2, pc, ror #8
  20:	c2bdd511 	adcsgt	sp, sp, #71303168	; 0x4400000

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
    1a44:	1a000083 	bne	1c58 <ipu_update_channel_buffer+0x248>
    1a48:	e3570000 	cmp	r7, #0
    1a4c:	e5963004 	ldr	r3, [r6, #4]
    1a50:	1a00001b 	bne	1ac4 <ipu_update_channel_buffer+0xb4>
    1a54:	e3530000 	cmp	r3, #0
    1a58:	e1a032a4 	lsr	r3, r4, #5
    1a5c:	1283309a 	addne	r3, r3, #154	; 0x9a
    1a60:	02833050 	addeq	r3, r3, #80	; 0x50
    1a64:	e1a03103 	lsl	r3, r3, #2
    1a68:	e5982d48 	ldr	r2, [r8, #3400]	; 0xd48
    1a6c:	e0823003 	add	r3, r2, r3
    1a70:	e5933000 	ldr	r3, [r3]
    1a74:	f57ff04f 	dsb	sy
    1a78:	e354003f 	cmp	r4, #63	; 0x3f
    1a7c:	0a000066 	beq	1c1c <ipu_update_channel_buffer+0x20c>
    1a80:	e205501f 	and	r5, r5, #31
    1a84:	e3a02001 	mov	r2, #1
    1a88:	e0133512 	ands	r3, r3, r2, lsl r5
    1a8c:	1a000079 	bne	1c78 <ipu_update_channel_buffer+0x268>
    1a90:	e3570002 	cmp	r7, #2
    1a94:	1a000023 	bne	1b28 <ipu_update_channel_buffer+0x118>
    1a98:	e2444008 	sub	r4, r4, #8
    1a9c:	e3540014 	cmp	r4, #20
    1aa0:	8a000016 	bhi	1b00 <ipu_update_channel_buffer+0xf0>
    1aa4:	e3002000 	movw	r2, #0
    1aa8:	e3402000 	movt	r2, #0
    1aac:	e7924104 	ldr	r4, [r2, r4, lsl #2]
    1ab0:	e3540000 	cmp	r4, #0
    1ab4:	1a000071 	bne	1c80 <ipu_update_channel_buffer+0x270>
    1ab8:	e3a00000 	mov	r0, #0
    1abc:	e28dd014 	add	sp, sp, #20
    1ac0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    1ac4:	e3570001 	cmp	r7, #1
    1ac8:	0a00004d 	beq	1c04 <ipu_update_channel_buffer+0x1f4>
    1acc:	e3530000 	cmp	r3, #0
    1ad0:	11a032a4 	lsrne	r3, r4, #5
    1ad4:	03a02f4b 	moveq	r2, #300	; 0x12c
    1ad8:	128330a2 	addne	r3, r3, #162	; 0xa2
    1adc:	11a02103 	lslne	r2, r3, #2
    1ae0:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    1ae4:	e0833002 	add	r3, r3, r2
    1ae8:	e5933000 	ldr	r3, [r3]
    1aec:	f57ff04f 	dsb	sy
    1af0:	e354003f 	cmp	r4, #63	; 0x3f
    1af4:	1affffe1 	bne	1a80 <ipu_update_channel_buffer+0x70>
    1af8:	e3570002 	cmp	r7, #2
    1afc:	1a000046 	bne	1c1c <ipu_update_channel_buffer+0x20c>
    1b00:	e3a05000 	mov	r5, #0
    1b04:	e30faaa0 	movw	sl, #64160	; 0xfaa0
    1b08:	e30f4ea0 	movw	r4, #65184	; 0xfea0
    1b0c:	e58d500c 	str	r5, [sp, #12]
    1b10:	e1a0b005 	mov	fp, r5
    1b14:	e1a09005 	mov	r9, r5
    1b18:	e34fafff 	movt	sl, #65535	; 0xffff
    1b1c:	e34f4fff 	movt	r4, #65535	; 0xffff
    1b20:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1b24:	ea000014 	b	1b7c <ipu_update_channel_buffer+0x16c>
    1b28:	e0673187 	rsb	r3, r7, r7, lsl #3
    1b2c:	e1a04204 	lsl	r4, r4, #4
    1b30:	e0873103 	add	r3, r7, r3, lsl #2
    1b34:	e3e0620e 	mvn	r6, #-536870912	; 0xe0000000
    1b38:	e3530000 	cmp	r3, #0
    1b3c:	e283201f 	add	r2, r3, #31
    1b40:	a1a02003 	movge	r2, r3
    1b44:	e2731000 	rsbs	r1, r3, #0
    1b48:	e1a092c2 	asr	r9, r2, #5
    1b4c:	e201101f 	and	r1, r1, #31
    1b50:	e203b01f 	and	fp, r3, #31
    1b54:	e289a008 	add	sl, r9, #8
    1b58:	5261b000 	rsbpl	fp, r1, #0
    1b5c:	e08aa004 	add	sl, sl, r4
    1b60:	e293501c 	adds	r5, r3, #28
    1b64:	4283303b 	addmi	r3, r3, #59	; 0x3b
    1b68:	51a03005 	movpl	r3, r5
    1b6c:	e1a0a10a 	lsl	sl, sl, #2
    1b70:	e1e01b16 	mvn	r1, r6, lsl fp
    1b74:	e1a052c3 	asr	r5, r3, #5
    1b78:	e58d900c 	str	r9, [sp, #12]
    1b7c:	e5983d78 	ldr	r3, [r8, #3448]	; 0xd78
    1b80:	e083300a 	add	r3, r3, sl
    1b84:	e5936000 	ldr	r6, [r3]
    1b88:	f57ff04f 	dsb	sy
    1b8c:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    1b90:	e0066001 	and	r6, r6, r1
    1b94:	e1a071a3 	lsr	r7, r3, #3
    1b98:	e1866b17 	orr	r6, r6, r7, lsl fp
    1b9c:	f57ff04e 	dsb	st
    1ba0:	ebfffffe 	bl	0 <arm_heavy_mb>
    1ba4:	e5983d78 	ldr	r3, [r8, #3448]	; 0xd78
    1ba8:	e083a00a 	add	sl, r3, sl
    1bac:	e58a6000 	str	r6, [sl]
    1bb0:	e1590005 	cmp	r9, r5
    1bb4:	aaffffbf 	bge	1ab8 <ipu_update_channel_buffer+0xa8>
    1bb8:	e59d200c 	ldr	r2, [sp, #12]
    1bbc:	e0824004 	add	r4, r2, r4
    1bc0:	e2844009 	add	r4, r4, #9
    1bc4:	e1a04104 	lsl	r4, r4, #2
    1bc8:	e0833004 	add	r3, r3, r4
    1bcc:	e5933000 	ldr	r3, [r3]
    1bd0:	f57ff04f 	dsb	sy
    1bd4:	e3e0220e 	mvn	r2, #-536870912	; 0xe0000000
    1bd8:	e35b0000 	cmp	fp, #0
    1bdc:	e26bb020 	rsb	fp, fp, #32
    1be0:	e1c33b32 	bic	r3, r3, r2, lsr fp
    1be4:	11a07b37 	lsrne	r7, r7, fp
    1be8:	e1837007 	orr	r7, r3, r7
    1bec:	f57ff04e 	dsb	st
    1bf0:	ebfffffe 	bl	0 <arm_heavy_mb>
    1bf4:	e5989d78 	ldr	r9, [r8, #3448]	; 0xd78
    1bf8:	e0894004 	add	r4, r9, r4
    1bfc:	e5847000 	str	r7, [r4]
    1c00:	eaffffac 	b	1ab8 <ipu_update_channel_buffer+0xa8>
    1c04:	e3530000 	cmp	r3, #0
    1c08:	e1a032a4 	lsr	r3, r4, #5
    1c0c:	1283309c 	addne	r3, r3, #156	; 0x9c
    1c10:	02833052 	addeq	r3, r3, #82	; 0x52
    1c14:	e1a03103 	lsl	r3, r3, #2
    1c18:	eaffff92 	b	1a68 <ipu_update_channel_buffer+0x58>
    1c1c:	e0673187 	rsb	r3, r7, r7, lsl #3
    1c20:	e3e0620e 	mvn	r6, #-536870912	; 0xe0000000
    1c24:	e3a04e3f 	mov	r4, #1008	; 0x3f0
    1c28:	e0873103 	add	r3, r7, r3, lsl #2
    1c2c:	e3530000 	cmp	r3, #0
    1c30:	e283201f 	add	r2, r3, #31
    1c34:	a1a02003 	movge	r2, r3
    1c38:	e2731000 	rsbs	r1, r3, #0
    1c3c:	e1a092c2 	asr	r9, r2, #5
    1c40:	e201101f 	and	r1, r1, #31
    1c44:	e203b01f 	and	fp, r3, #31
    1c48:	e289affe 	add	sl, r9, #1016	; 0x3f8
    1c4c:	5261b000 	rsbpl	fp, r1, #0
    1c50:	e293501c 	adds	r5, r3, #28
    1c54:	eaffffc2 	b	1b64 <ipu_update_channel_buffer+0x154>
    1c58:	e3002000 	movw	r2, #0
    1c5c:	e5981d84 	ldr	r1, [r8, #3460]	; 0xd84
    1c60:	e1a0000c 	mov	r0, ip
    1c64:	e58d4000 	str	r4, [sp]
    1c68:	e3402000 	movt	r2, #0
    1c6c:	e59f3030 	ldr	r3, [pc, #48]	; 1ca4 <ipu_update_channel_buffer+0x294>
    1c70:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1c74:	eaffff73 	b	1a48 <ipu_update_channel_buffer+0x38>
    1c78:	e3e0000c 	mvn	r0, #12
    1c7c:	eaffff8e 	b	1abc <ipu_update_channel_buffer+0xac>
    1c80:	e1a04204 	lsl	r4, r4, #4
    1c84:	e1a05003 	mov	r5, r3
    1c88:	e58d300c 	str	r3, [sp, #12]
    1c8c:	e1a0b003 	mov	fp, r3
    1c90:	e284a008 	add	sl, r4, #8
    1c94:	e1a09003 	mov	r9, r3
    1c98:	e1a0a10a 	lsl	sl, sl, #2
    1c9c:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1ca0:	eaffffb5 	b	1b7c <ipu_update_channel_buffer+0x16c>
    1ca4:	00000068 	andeq	r0, r0, r8, rrx

00001ca8 <ipu_set_channel_bandmode>:
    1ca8:	e0822082 	add	r2, r2, r2, lsl #1
    1cac:	e243c002 	sub	ip, r3, #2
    1cb0:	e35c0006 	cmp	ip, #6
    1cb4:	e1a02082 	lsl	r2, r2, #1
    1cb8:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    1cbc:	e24dd008 	sub	sp, sp, #8
    1cc0:	e1a04231 	lsr	r4, r1, r2
    1cc4:	8a000062 	bhi	1e54 <ipu_set_channel_bandmode+0x1ac>
    1cc8:	e2808d79 	add	r8, r0, #7744	; 0x1e40
    1ccc:	e2888008 	add	r8, r8, #8
    1cd0:	e1a0a000 	mov	sl, r0
    1cd4:	e1a00008 	mov	r0, r8
    1cd8:	e1a07003 	mov	r7, r3
    1cdc:	ebfffffe 	bl	0 <mutex_lock>
    1ce0:	e59a3004 	ldr	r3, [sl, #4]
    1ce4:	e204903f 	and	r9, r4, #63	; 0x3f
    1ce8:	e1a052a9 	lsr	r5, r9, #5
    1cec:	e28a6a01 	add	r6, sl, #4096	; 0x1000
    1cf0:	e3530000 	cmp	r3, #0
    1cf4:	12853010 	addne	r3, r5, #16
    1cf8:	0285300d 	addeq	r3, r5, #13
    1cfc:	e1a02103 	lsl	r2, r3, #2
    1d00:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    1d04:	e0833002 	add	r3, r3, r2
    1d08:	e5931000 	ldr	r1, [r3]
    1d0c:	f57ff04f 	dsb	sy
    1d10:	e59a3004 	ldr	r3, [sl, #4]
    1d14:	e3a02001 	mov	r2, #1
    1d18:	e204401f 	and	r4, r4, #31
    1d1c:	e1814412 	orr	r4, r1, r2, lsl r4
    1d20:	e3530000 	cmp	r3, #0
    1d24:	12855010 	addne	r5, r5, #16
    1d28:	0285500d 	addeq	r5, r5, #13
    1d2c:	e1a05105 	lsl	r5, r5, #2
    1d30:	f57ff04e 	dsb	st
    1d34:	ebfffffe 	bl	0 <arm_heavy_mb>
    1d38:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    1d3c:	e0835005 	add	r5, r3, r5
    1d40:	e5854000 	str	r4, [r5]
    1d44:	e1a04309 	lsl	r4, r9, #6
    1d48:	e5963d78 	ldr	r3, [r6, #3448]	; 0xd78
    1d4c:	e284400c 	add	r4, r4, #12
    1d50:	e0833004 	add	r3, r3, r4
    1d54:	e593a000 	ldr	sl, [r3]
    1d58:	f57ff04f 	dsb	sy
    1d5c:	e2475001 	sub	r5, r7, #1
    1d60:	e1a05905 	lsl	r5, r5, #18
    1d64:	e18aa005 	orr	sl, sl, r5
    1d68:	f57ff04e 	dsb	st
    1d6c:	ebfffffe 	bl	0 <arm_heavy_mb>
    1d70:	e5962d78 	ldr	r2, [r6, #3448]	; 0xd78
    1d74:	e0823004 	add	r3, r2, r4
    1d78:	e583a000 	str	sl, [r3]
    1d7c:	e2493008 	sub	r3, r9, #8
    1d80:	e3530014 	cmp	r3, #20
    1d84:	9a000009 	bls	1db0 <ipu_set_channel_bandmode+0x108>
    1d88:	e3005000 	movw	r5, #0
    1d8c:	e3405000 	movt	r5, #0
    1d90:	e1d534b2 	ldrh	r3, [r5, #66]	; 0x42
    1d94:	e3130004 	tst	r3, #4
    1d98:	1a000023 	bne	1e2c <ipu_set_channel_bandmode+0x184>
    1d9c:	e1a00008 	mov	r0, r8
    1da0:	ebfffffe 	bl	0 <mutex_unlock>
    1da4:	e3a00000 	mov	r0, #0
    1da8:	e28dd008 	add	sp, sp, #8
    1dac:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    1db0:	e3001000 	movw	r1, #0
    1db4:	e3401000 	movt	r1, #0
    1db8:	e7913103 	ldr	r3, [r1, r3, lsl #2]
    1dbc:	e3530000 	cmp	r3, #0
    1dc0:	dafffff0 	ble	1d88 <ipu_set_channel_bandmode+0xe0>
    1dc4:	e1a03303 	lsl	r3, r3, #6
    1dc8:	e283a00c 	add	sl, r3, #12
    1dcc:	e082200a 	add	r2, r2, sl
    1dd0:	e5923000 	ldr	r3, [r2]
    1dd4:	f57ff04f 	dsb	sy
    1dd8:	e1855003 	orr	r5, r5, r3
    1ddc:	f57ff04e 	dsb	st
    1de0:	ebfffffe 	bl	0 <arm_heavy_mb>
    1de4:	e5963d78 	ldr	r3, [r6, #3448]	; 0xd78
    1de8:	e083a00a 	add	sl, r3, sl
    1dec:	e58a5000 	str	r5, [sl]
    1df0:	e3005000 	movw	r5, #0
    1df4:	e3405000 	movt	r5, #0
    1df8:	e1d522ba 	ldrh	r2, [r5, #42]	; 0x2a
    1dfc:	e3120004 	tst	r2, #4
    1e00:	0affffe2 	beq	1d90 <ipu_set_channel_bandmode+0xe8>
    1e04:	e0834004 	add	r4, r3, r4
    1e08:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    1e0c:	e5943000 	ldr	r3, [r4]
    1e10:	f57ff04f 	dsb	sy
    1e14:	e3002000 	movw	r2, #0
    1e18:	e7e23953 	ubfx	r3, r3, #18, #3
    1e1c:	e2850018 	add	r0, r5, #24
    1e20:	e3402000 	movt	r2, #0
    1e24:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1e28:	eaffffd8 	b	1d90 <ipu_set_channel_bandmode+0xe8>
    1e2c:	e3a03001 	mov	r3, #1
    1e30:	e3002000 	movw	r2, #0
    1e34:	e1a07713 	lsl	r7, r3, r7
    1e38:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    1e3c:	e1a03009 	mov	r3, r9
    1e40:	e59f0014 	ldr	r0, [pc, #20]	; 1e5c <ipu_set_channel_bandmode+0x1b4>
    1e44:	e58d7000 	str	r7, [sp]
    1e48:	e3402000 	movt	r2, #0
    1e4c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    1e50:	eaffffd1 	b	1d9c <ipu_set_channel_bandmode+0xf4>
    1e54:	e3e00015 	mvn	r0, #21
    1e58:	eaffffd2 	b	1da8 <ipu_set_channel_bandmode+0x100>
    1e5c:	00000030 	andeq	r0, r0, r0, lsr r0

00001e60 <ipu_link_channels>:
    1e60:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    1e64:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    1e68:	e2866008 	add	r6, r6, #8
    1e6c:	e2804a01 	add	r4, r0, #4096	; 0x1000
    1e70:	e1a00006 	mov	r0, r6
    1e74:	e1a05001 	mov	r5, r1
    1e78:	e1a07002 	mov	r7, r2
    1e7c:	ebfffffe 	bl	0 <mutex_lock>
    1e80:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e84:	e59390a8 	ldr	r9, [r3, #168]	; 0xa8
    1e88:	f57ff04f 	dsb	sy
    1e8c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e90:	e59380ac 	ldr	r8, [r3, #172]	; 0xac
    1e94:	f57ff04f 	dsb	sy
    1e98:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1e9c:	e593b0b0 	ldr	fp, [r3, #176]	; 0xb0
    1ea0:	f57ff04f 	dsb	sy
    1ea4:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    1ea8:	e593a0b4 	ldr	sl, [r3, #180]	; 0xb4
    1eac:	f57ff04f 	dsb	sy
    1eb0:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    1eb4:	e3403fff 	movt	r3, #4095	; 0xfff
    1eb8:	e1550003 	cmp	r5, r3
    1ebc:	0a0000fe 	beq	22bc <ipu_link_channels+0x45c>
    1ec0:	da000012 	ble	1f10 <ipu_link_channels+0xb0>
    1ec4:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    1ec8:	e34133ff 	movt	r3, #5119	; 0x13ff
    1ecc:	e1550003 	cmp	r5, r3
    1ed0:	0a00001f 	beq	1f54 <ipu_link_channels+0xf4>
    1ed4:	ca000026 	bgt	1f74 <ipu_link_channels+0x114>
    1ed8:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    1edc:	e34131ff 	movt	r3, #4607	; 0x11ff
    1ee0:	e1550003 	cmp	r5, r3
    1ee4:	0a000088 	beq	210c <ipu_link_channels+0x2ac>
    1ee8:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    1eec:	e34132ff 	movt	r3, #4863	; 0x12ff
    1ef0:	e1550003 	cmp	r5, r3
    1ef4:	0a0000e8 	beq	229c <ipu_link_channels+0x43c>
    1ef8:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    1efc:	e34130ff 	movt	r3, #4351	; 0x10ff
    1f00:	e1550003 	cmp	r5, r3
    1f04:	0a00008e 	beq	2144 <ipu_link_channels+0x2e4>
    1f08:	e3e04015 	mvn	r4, #21
    1f0c:	ea00007a 	b	20fc <ipu_link_channels+0x29c>
    1f10:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    1f14:	e34033bf 	movt	r3, #959	; 0x3bf
    1f18:	e1550003 	cmp	r5, r3
    1f1c:	0a0000b2 	beq	21ec <ipu_link_channels+0x38c>
    1f20:	da0000a1 	ble	21ac <ipu_link_channels+0x34c>
    1f24:	e30e3455 	movw	r3, #58453	; 0xe455
    1f28:	e3403530 	movt	r3, #1328	; 0x530
    1f2c:	e1550003 	cmp	r5, r3
    1f30:	0a000019 	beq	1f9c <ipu_link_channels+0x13c>
    1f34:	e30f3496 	movw	r3, #62614	; 0xf496
    1f38:	e340362c 	movt	r3, #1580	; 0x62c
    1f3c:	e1550003 	cmp	r5, r3
    1f40:	0a0000b9 	beq	222c <ipu_link_channels+0x3cc>
    1f44:	e30e3454 	movw	r3, #58452	; 0xe454
    1f48:	e3403430 	movt	r3, #1072	; 0x430
    1f4c:	e1550003 	cmp	r5, r3
    1f50:	1affffec 	bne	1f08 <ipu_link_channels+0xa8>
    1f54:	e3003000 	movw	r3, #0
    1f58:	e1a02c47 	asr	r2, r7, #24
    1f5c:	e3403000 	movt	r3, #0
    1f60:	e0832102 	add	r2, r3, r2, lsl #2
    1f64:	e3c8800f 	bic	r8, r8, #15
    1f68:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    1f6c:	e1888002 	orr	r8, r8, r2
    1f70:	ea000010 	b	1fb8 <ipu_link_channels+0x158>
    1f74:	e30e3455 	movw	r3, #58453	; 0xe455
    1f78:	e3413624 	movt	r3, #5668	; 0x1624
    1f7c:	e1550003 	cmp	r5, r3
    1f80:	0a000005 	beq	1f9c <ipu_link_channels+0x13c>
    1f84:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    1f88:	0a0000af 	beq	224c <ipu_link_channels+0x3ec>
    1f8c:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    1f90:	e34134ff 	movt	r3, #5375	; 0x14ff
    1f94:	e1550003 	cmp	r5, r3
    1f98:	1affffda 	bne	1f08 <ipu_link_channels+0xa8>
    1f9c:	e3003000 	movw	r3, #0
    1fa0:	e1a02c47 	asr	r2, r7, #24
    1fa4:	e3403000 	movt	r3, #0
    1fa8:	e0832102 	add	r2, r3, r2, lsl #2
    1fac:	e3c880f0 	bic	r8, r8, #240	; 0xf0
    1fb0:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    1fb4:	e1888202 	orr	r8, r8, r2, lsl #4
    1fb8:	e30f2fff 	movw	r2, #65535	; 0xffff
    1fbc:	e3402773 	movt	r2, #1907	; 0x773
    1fc0:	e1570002 	cmp	r7, r2
    1fc4:	0a0000ca 	beq	22f4 <ipu_link_channels+0x494>
    1fc8:	da000016 	ble	2028 <ipu_link_channels+0x1c8>
    1fcc:	e30f2d3f 	movw	r2, #64831	; 0xfd3f
    1fd0:	e3402b63 	movt	r2, #2915	; 0xb63
    1fd4:	e1570002 	cmp	r7, r2
    1fd8:	0a0000d1 	beq	2324 <ipu_link_channels+0x4c4>
    1fdc:	ca000060 	bgt	2164 <ipu_link_channels+0x304>
    1fe0:	e30f2cff 	movw	r2, #64767	; 0xfcff
    1fe4:	e340295f 	movt	r2, #2399	; 0x95f
    1fe8:	e1570002 	cmp	r7, r2
    1fec:	0a00004e 	beq	212c <ipu_link_channels+0x2cc>
    1ff0:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    1ff4:	e3402a6f 	movt	r2, #2671	; 0xa6f
    1ff8:	e1570002 	cmp	r7, r2
    1ffc:	0a0000ce 	beq	233c <ipu_link_channels+0x4dc>
    2000:	e30f2fff 	movw	r2, #65535	; 0xffff
    2004:	e34028a7 	movt	r2, #2215	; 0x8a7
    2008:	e1570002 	cmp	r7, r2
    200c:	1affffbd 	bne	1f08 <ipu_link_channels+0xa8>
    2010:	e1a05c45 	asr	r5, r5, #24
    2014:	e3caa80f 	bic	sl, sl, #983040	; 0xf0000
    2018:	e0833105 	add	r3, r3, r5, lsl #2
    201c:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2020:	e18aa803 	orr	sl, sl, r3, lsl #16
    2024:	ea000023 	b	20b8 <ipu_link_channels+0x258>
    2028:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    202c:	e34023bf 	movt	r2, #959	; 0x3bf
    2030:	e1570002 	cmp	r7, r2
    2034:	0a0000b4 	beq	230c <ipu_link_channels+0x4ac>
    2038:	da000011 	ble	2084 <ipu_link_channels+0x224>
    203c:	e30e2455 	movw	r2, #58453	; 0xe455
    2040:	e3402530 	movt	r2, #1328	; 0x530
    2044:	e1570002 	cmp	r7, r2
    2048:	0a000007 	beq	206c <ipu_link_channels+0x20c>
    204c:	e30f2496 	movw	r2, #62614	; 0xf496
    2050:	e340262c 	movt	r2, #1580	; 0x62c
    2054:	e1570002 	cmp	r7, r2
    2058:	0a0000bd 	beq	2354 <ipu_link_channels+0x4f4>
    205c:	e30e2454 	movw	r2, #58452	; 0xe454
    2060:	e3402430 	movt	r2, #1072	; 0x430
    2064:	e1570002 	cmp	r7, r2
    2068:	1affffa6 	bne	1f08 <ipu_link_channels+0xa8>
    206c:	e1a05c45 	asr	r5, r5, #24
    2070:	e3c9940f 	bic	r9, r9, #251658240	; 0xf000000
    2074:	e0833105 	add	r3, r3, r5, lsl #2
    2078:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    207c:	e1899c03 	orr	r9, r9, r3, lsl #24
    2080:	ea00000c 	b	20b8 <ipu_link_channels+0x258>
    2084:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    2088:	e34021b7 	movt	r2, #439	; 0x1b7
    208c:	e1570002 	cmp	r7, r2
    2090:	0a000091 	beq	22dc <ipu_link_channels+0x47c>
    2094:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    2098:	e34022bb 	movt	r2, #699	; 0x2bb
    209c:	e1570002 	cmp	r7, r2
    20a0:	1affff98 	bne	1f08 <ipu_link_channels+0xa8>
    20a4:	e1a05c45 	asr	r5, r5, #24
    20a8:	e3c99c0f 	bic	r9, r9, #3840	; 0xf00
    20ac:	e0833105 	add	r3, r3, r5, lsl #2
    20b0:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    20b4:	e1899403 	orr	r9, r9, r3, lsl #8
    20b8:	f57ff04e 	dsb	st
    20bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    20c0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20c4:	e58390a8 	str	r9, [r3, #168]	; 0xa8
    20c8:	f57ff04e 	dsb	st
    20cc:	ebfffffe 	bl	0 <arm_heavy_mb>
    20d0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20d4:	e58380ac 	str	r8, [r3, #172]	; 0xac
    20d8:	f57ff04e 	dsb	st
    20dc:	ebfffffe 	bl	0 <arm_heavy_mb>
    20e0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20e4:	e583b0b0 	str	fp, [r3, #176]	; 0xb0
    20e8:	f57ff04e 	dsb	st
    20ec:	ebfffffe 	bl	0 <arm_heavy_mb>
    20f0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    20f4:	e583a0b4 	str	sl, [r3, #180]	; 0xb4
    20f8:	e3a04000 	mov	r4, #0
    20fc:	e1a00006 	mov	r0, r6
    2100:	ebfffffe 	bl	0 <mutex_unlock>
    2104:	e1a00004 	mov	r0, r4
    2108:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    210c:	e3003000 	movw	r3, #0
    2110:	e1a02c47 	asr	r2, r7, #24
    2114:	e3403000 	movt	r3, #0
    2118:	e0832102 	add	r2, r3, r2, lsl #2
    211c:	e3cbbd1e 	bic	fp, fp, #1920	; 0x780
    2120:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    2124:	e18bb382 	orr	fp, fp, r2, lsl #7
    2128:	eaffffa2 	b	1fb8 <ipu_link_channels+0x158>
    212c:	e1a05c45 	asr	r5, r5, #24
    2130:	e3caa00f 	bic	sl, sl, #15
    2134:	e0833105 	add	r3, r3, r5, lsl #2
    2138:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    213c:	e18aa003 	orr	sl, sl, r3
    2140:	eaffffdc 	b	20b8 <ipu_link_channels+0x258>
    2144:	e3003000 	movw	r3, #0
    2148:	e1a02c47 	asr	r2, r7, #24
    214c:	e3403000 	movt	r3, #0
    2150:	e0832102 	add	r2, r3, r2, lsl #2
    2154:	e3cbb070 	bic	fp, fp, #112	; 0x70
    2158:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    215c:	e18bb202 	orr	fp, fp, r2, lsl #4
    2160:	eaffff94 	b	1fb8 <ipu_link_channels+0x158>
    2164:	e30e2455 	movw	r2, #58453	; 0xe455
    2168:	e3412624 	movt	r2, #5668	; 0x1624
    216c:	e1570002 	cmp	r7, r2
    2170:	0affffbd 	beq	206c <ipu_link_channels+0x20c>
    2174:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    2178:	e3412927 	movt	r2, #6439	; 0x1927
    217c:	e1570002 	cmp	r7, r2
    2180:	0a000040 	beq	2288 <ipu_link_channels+0x428>
    2184:	e30f287f 	movw	r2, #63615	; 0xf87f
    2188:	e3402c77 	movt	r2, #3191	; 0xc77
    218c:	e1570002 	cmp	r7, r2
    2190:	1affff5c 	bne	1f08 <ipu_link_channels+0xa8>
    2194:	e1a05c45 	asr	r5, r5, #24
    2198:	e3caaa0f 	bic	sl, sl, #61440	; 0xf000
    219c:	e0833105 	add	r3, r3, r5, lsl #2
    21a0:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    21a4:	e18aa603 	orr	sl, sl, r3, lsl #12
    21a8:	eaffffc2 	b	20b8 <ipu_link_channels+0x258>
    21ac:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    21b0:	e34031b7 	movt	r3, #439	; 0x1b7
    21b4:	e1550003 	cmp	r5, r3
    21b8:	0a000013 	beq	220c <ipu_link_channels+0x3ac>
    21bc:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    21c0:	e34032bb 	movt	r3, #699	; 0x2bb
    21c4:	e1550003 	cmp	r5, r3
    21c8:	1affff4e 	bne	1f08 <ipu_link_channels+0xa8>
    21cc:	e3003000 	movw	r3, #0
    21d0:	e1a02c47 	asr	r2, r7, #24
    21d4:	e3403000 	movt	r3, #0
    21d8:	e0832102 	add	r2, r3, r2, lsl #2
    21dc:	e3c88c0f 	bic	r8, r8, #3840	; 0xf00
    21e0:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    21e4:	e1888402 	orr	r8, r8, r2, lsl #8
    21e8:	eaffff72 	b	1fb8 <ipu_link_channels+0x158>
    21ec:	e3003000 	movw	r3, #0
    21f0:	e1a02c47 	asr	r2, r7, #24
    21f4:	e3403000 	movt	r3, #0
    21f8:	e0832102 	add	r2, r3, r2, lsl #2
    21fc:	e3c8880f 	bic	r8, r8, #983040	; 0xf0000
    2200:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    2204:	e1888802 	orr	r8, r8, r2, lsl #16
    2208:	eaffff6a 	b	1fb8 <ipu_link_channels+0x158>
    220c:	e3003000 	movw	r3, #0
    2210:	e1a02c47 	asr	r2, r7, #24
    2214:	e3403000 	movt	r3, #0
    2218:	e0832102 	add	r2, r3, r2, lsl #2
    221c:	e3c8860f 	bic	r8, r8, #15728640	; 0xf00000
    2220:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    2224:	e1888a02 	orr	r8, r8, r2, lsl #20
    2228:	eaffff62 	b	1fb8 <ipu_link_channels+0x158>
    222c:	e3003000 	movw	r3, #0
    2230:	e1a02c47 	asr	r2, r7, #24
    2234:	e3403000 	movt	r3, #0
    2238:	e0832102 	add	r2, r3, r2, lsl #2
    223c:	e3c88a0f 	bic	r8, r8, #61440	; 0xf000
    2240:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    2244:	e1888602 	orr	r8, r8, r2, lsl #12
    2248:	eaffff5a 	b	1fb8 <ipu_link_channels+0x158>
    224c:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    2250:	e3cbb803 	bic	fp, fp, #196608	; 0x30000
    2254:	e3413927 	movt	r3, #6439	; 0x1927
    2258:	e1570003 	cmp	r7, r3
    225c:	038bb802 	orreq	fp, fp, #131072	; 0x20000
    2260:	03c99203 	biceq	r9, r9, #805306368	; 0x30000000
    2264:	0a00000a 	beq	2294 <ipu_link_channels+0x434>
    2268:	e30f3496 	movw	r3, #62614	; 0xf496
    226c:	e340362c 	movt	r3, #1580	; 0x62c
    2270:	e1570003 	cmp	r7, r3
    2274:	1affff23 	bne	1f08 <ipu_link_channels+0xa8>
    2278:	e38bb801 	orr	fp, fp, #65536	; 0x10000
    227c:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    2280:	e3899902 	orr	r9, r9, #32768	; 0x8000
    2284:	eaffff8b 	b	20b8 <ipu_link_channels+0x258>
    2288:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    228c:	e3c99203 	bic	r9, r9, #805306368	; 0x30000000
    2290:	1affff1c 	bne	1f08 <ipu_link_channels+0xa8>
    2294:	e3899202 	orr	r9, r9, #536870912	; 0x20000000
    2298:	eaffff86 	b	20b8 <ipu_link_channels+0x258>
    229c:	e3003000 	movw	r3, #0
    22a0:	e1a02c47 	asr	r2, r7, #24
    22a4:	e3403000 	movt	r3, #0
    22a8:	e0832102 	add	r2, r3, r2, lsl #2
    22ac:	e3cbbb0e 	bic	fp, fp, #14336	; 0x3800
    22b0:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    22b4:	e18bb582 	orr	fp, fp, r2, lsl #11
    22b8:	eaffff3e 	b	1fb8 <ipu_link_channels+0x158>
    22bc:	e3003000 	movw	r3, #0
    22c0:	e1a02c47 	asr	r2, r7, #24
    22c4:	e3403000 	movt	r3, #0
    22c8:	e0832102 	add	r2, r3, r2, lsl #2
    22cc:	e3cbb00f 	bic	fp, fp, #15
    22d0:	e5922084 	ldr	r2, [r2, #132]	; 0x84
    22d4:	e18bb002 	orr	fp, fp, r2
    22d8:	eaffff36 	b	1fb8 <ipu_link_channels+0x158>
    22dc:	e1a05c45 	asr	r5, r5, #24
    22e0:	e3c9900f 	bic	r9, r9, #15
    22e4:	e0833105 	add	r3, r3, r5, lsl #2
    22e8:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    22ec:	e1899003 	orr	r9, r9, r3
    22f0:	eaffff70 	b	20b8 <ipu_link_channels+0x258>
    22f4:	e1a05c45 	asr	r5, r5, #24
    22f8:	e3caa60f 	bic	sl, sl, #15728640	; 0xf00000
    22fc:	e0833105 	add	r3, r3, r5, lsl #2
    2300:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2304:	e18aaa03 	orr	sl, sl, r3, lsl #20
    2308:	eaffff6a 	b	20b8 <ipu_link_channels+0x258>
    230c:	e1a05c45 	asr	r5, r5, #24
    2310:	e3c9980f 	bic	r9, r9, #983040	; 0xf0000
    2314:	e0833105 	add	r3, r3, r5, lsl #2
    2318:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    231c:	e1899803 	orr	r9, r9, r3, lsl #16
    2320:	eaffff64 	b	20b8 <ipu_link_channels+0x258>
    2324:	e1a05c45 	asr	r5, r5, #24
    2328:	e3caac0f 	bic	sl, sl, #3840	; 0xf00
    232c:	e0833105 	add	r3, r3, r5, lsl #2
    2330:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    2334:	e18aa403 	orr	sl, sl, r3, lsl #8
    2338:	eaffff5e 	b	20b8 <ipu_link_channels+0x258>
    233c:	e1a05c45 	asr	r5, r5, #24
    2340:	e3caa0f0 	bic	sl, sl, #240	; 0xf0
    2344:	e0833105 	add	r3, r3, r5, lsl #2
    2348:	e5933164 	ldr	r3, [r3, #356]	; 0x164
    234c:	e18aa203 	orr	sl, sl, r3, lsl #4
    2350:	eaffff58 	b	20b8 <ipu_link_channels+0x258>
    2354:	e3750379 	cmn	r5, #-469762047	; 0xe4000001
    2358:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    235c:	0affffc7 	beq	2280 <ipu_link_channels+0x420>
    2360:	e1a05c45 	asr	r5, r5, #24
    2364:	e0833105 	add	r3, r3, r5, lsl #2
    2368:	e5933104 	ldr	r3, [r3, #260]	; 0x104
    236c:	e1899603 	orr	r9, r9, r3, lsl #12
    2370:	eaffff50 	b	20b8 <ipu_link_channels+0x258>

00002374 <ipu_unlink_channels>:
    2374:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2378:	e2807d79 	add	r7, r0, #7744	; 0x1e40
    237c:	e2877008 	add	r7, r7, #8
    2380:	e2804a01 	add	r4, r0, #4096	; 0x1000
    2384:	e1a00007 	mov	r0, r7
    2388:	e1a08001 	mov	r8, r1
    238c:	e1a05002 	mov	r5, r2
    2390:	ebfffffe 	bl	0 <mutex_lock>
    2394:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2398:	e59390a8 	ldr	r9, [r3, #168]	; 0xa8
    239c:	f57ff04f 	dsb	sy
    23a0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    23a4:	e59360ac 	ldr	r6, [r3, #172]	; 0xac
    23a8:	f57ff04f 	dsb	sy
    23ac:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    23b0:	e593b0b0 	ldr	fp, [r3, #176]	; 0xb0
    23b4:	f57ff04f 	dsb	sy
    23b8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    23bc:	e593a0b4 	ldr	sl, [r3, #180]	; 0xb4
    23c0:	f57ff04f 	dsb	sy
    23c4:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    23c8:	e3403fff 	movt	r3, #4095	; 0xfff
    23cc:	e1580003 	cmp	r8, r3
    23d0:	0a000098 	beq	2638 <ipu_unlink_channels+0x2c4>
    23d4:	da000012 	ble	2424 <ipu_unlink_channels+0xb0>
    23d8:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    23dc:	e34133ff 	movt	r3, #5119	; 0x13ff
    23e0:	e1580003 	cmp	r8, r3
    23e4:	0a00001f 	beq	2468 <ipu_unlink_channels+0xf4>
    23e8:	ca000020 	bgt	2470 <ipu_unlink_channels+0xfc>
    23ec:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    23f0:	e34131ff 	movt	r3, #4607	; 0x11ff
    23f4:	e1580003 	cmp	r8, r3
    23f8:	0a000074 	beq	25d0 <ipu_unlink_channels+0x25c>
    23fc:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    2400:	e34132ff 	movt	r3, #4863	; 0x12ff
    2404:	e1580003 	cmp	r8, r3
    2408:	0a000092 	beq	2658 <ipu_unlink_channels+0x2e4>
    240c:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    2410:	e34130ff 	movt	r3, #4351	; 0x10ff
    2414:	e1580003 	cmp	r8, r3
    2418:	0a000070 	beq	25e0 <ipu_unlink_channels+0x26c>
    241c:	e3e04015 	mvn	r4, #21
    2420:	ea000058 	b	2588 <ipu_unlink_channels+0x214>
    2424:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    2428:	e34033bf 	movt	r3, #959	; 0x3bf
    242c:	e1580003 	cmp	r8, r3
    2430:	0a00008a 	beq	2660 <ipu_unlink_channels+0x2ec>
    2434:	da00006b 	ble	25e8 <ipu_unlink_channels+0x274>
    2438:	e30e3455 	movw	r3, #58453	; 0xe455
    243c:	e3403530 	movt	r3, #1328	; 0x530
    2440:	e1580003 	cmp	r8, r3
    2444:	0a000013 	beq	2498 <ipu_unlink_channels+0x124>
    2448:	e30f3496 	movw	r3, #62614	; 0xf496
    244c:	e340362c 	movt	r3, #1580	; 0x62c
    2450:	e1580003 	cmp	r8, r3
    2454:	0a00007b 	beq	2648 <ipu_unlink_channels+0x2d4>
    2458:	e30e3454 	movw	r3, #58452	; 0xe454
    245c:	e3403430 	movt	r3, #1072	; 0x430
    2460:	e1580003 	cmp	r8, r3
    2464:	1affffec 	bne	241c <ipu_unlink_channels+0xa8>
    2468:	e3c6600f 	bic	r6, r6, #15
    246c:	ea00000a 	b	249c <ipu_unlink_channels+0x128>
    2470:	e30e3455 	movw	r3, #58453	; 0xe455
    2474:	e3413624 	movt	r3, #5668	; 0x1624
    2478:	e1580003 	cmp	r8, r3
    247c:	0a000005 	beq	2498 <ipu_unlink_channels+0x124>
    2480:	e3780379 	cmn	r8, #-469762047	; 0xe4000001
    2484:	0a000071 	beq	2650 <ipu_unlink_channels+0x2dc>
    2488:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    248c:	e34134ff 	movt	r3, #5375	; 0x14ff
    2490:	e1580003 	cmp	r8, r3
    2494:	1affffe0 	bne	241c <ipu_unlink_channels+0xa8>
    2498:	e3c660f0 	bic	r6, r6, #240	; 0xf0
    249c:	e30f3fff 	movw	r3, #65535	; 0xffff
    24a0:	e3403773 	movt	r3, #1907	; 0x773
    24a4:	e1550003 	cmp	r5, r3
    24a8:	0a000072 	beq	2678 <ipu_unlink_channels+0x304>
    24ac:	da000012 	ble	24fc <ipu_unlink_channels+0x188>
    24b0:	e30f3d3f 	movw	r3, #64831	; 0xfd3f
    24b4:	e3403b63 	movt	r3, #2915	; 0xb63
    24b8:	e1550003 	cmp	r5, r3
    24bc:	0a00006b 	beq	2670 <ipu_unlink_channels+0x2fc>
    24c0:	ca000034 	bgt	2598 <ipu_unlink_channels+0x224>
    24c4:	e30f3cff 	movw	r3, #64767	; 0xfcff
    24c8:	e340395f 	movt	r3, #2399	; 0x95f
    24cc:	e1550003 	cmp	r5, r3
    24d0:	0a000040 	beq	25d8 <ipu_unlink_channels+0x264>
    24d4:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    24d8:	e3403a6f 	movt	r3, #2671	; 0xa6f
    24dc:	e1550003 	cmp	r5, r3
    24e0:	0a000068 	beq	2688 <ipu_unlink_channels+0x314>
    24e4:	e30f3fff 	movw	r3, #65535	; 0xffff
    24e8:	e34038a7 	movt	r3, #2215	; 0x8a7
    24ec:	e1550003 	cmp	r5, r3
    24f0:	1affffc9 	bne	241c <ipu_unlink_channels+0xa8>
    24f4:	e3caa80f 	bic	sl, sl, #983040	; 0xf0000
    24f8:	ea000011 	b	2544 <ipu_unlink_channels+0x1d0>
    24fc:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    2500:	e34033bf 	movt	r3, #959	; 0x3bf
    2504:	e1550003 	cmp	r5, r3
    2508:	0a000060 	beq	2690 <ipu_unlink_channels+0x31c>
    250c:	da00003f 	ble	2610 <ipu_unlink_channels+0x29c>
    2510:	e30e3455 	movw	r3, #58453	; 0xe455
    2514:	e3403530 	movt	r3, #1328	; 0x530
    2518:	e1550003 	cmp	r5, r3
    251c:	0a000007 	beq	2540 <ipu_unlink_channels+0x1cc>
    2520:	e30f3496 	movw	r3, #62614	; 0xf496
    2524:	e340362c 	movt	r3, #1580	; 0x62c
    2528:	e1550003 	cmp	r5, r3
    252c:	0a00004d 	beq	2668 <ipu_unlink_channels+0x2f4>
    2530:	e30e3454 	movw	r3, #58452	; 0xe454
    2534:	e3403430 	movt	r3, #1072	; 0x430
    2538:	e1550003 	cmp	r5, r3
    253c:	1affffb6 	bne	241c <ipu_unlink_channels+0xa8>
    2540:	e3c9940f 	bic	r9, r9, #251658240	; 0xf000000
    2544:	f57ff04e 	dsb	st
    2548:	ebfffffe 	bl	0 <arm_heavy_mb>
    254c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2550:	e58390a8 	str	r9, [r3, #168]	; 0xa8
    2554:	f57ff04e 	dsb	st
    2558:	ebfffffe 	bl	0 <arm_heavy_mb>
    255c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2560:	e58360ac 	str	r6, [r3, #172]	; 0xac
    2564:	f57ff04e 	dsb	st
    2568:	ebfffffe 	bl	0 <arm_heavy_mb>
    256c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2570:	e583b0b0 	str	fp, [r3, #176]	; 0xb0
    2574:	f57ff04e 	dsb	st
    2578:	ebfffffe 	bl	0 <arm_heavy_mb>
    257c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    2580:	e583a0b4 	str	sl, [r3, #180]	; 0xb4
    2584:	e3a04000 	mov	r4, #0
    2588:	e1a00007 	mov	r0, r7
    258c:	ebfffffe 	bl	0 <mutex_unlock>
    2590:	e1a00004 	mov	r0, r4
    2594:	e8bd8ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2598:	e30e3455 	movw	r3, #58453	; 0xe455
    259c:	e3413624 	movt	r3, #5668	; 0x1624
    25a0:	e1550003 	cmp	r5, r3
    25a4:	0affffe5 	beq	2540 <ipu_unlink_channels+0x1cc>
    25a8:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    25ac:	e3413927 	movt	r3, #6439	; 0x1927
    25b0:	e1550003 	cmp	r5, r3
    25b4:	0a000031 	beq	2680 <ipu_unlink_channels+0x30c>
    25b8:	e30f387f 	movw	r3, #63615	; 0xf87f
    25bc:	e3403c77 	movt	r3, #3191	; 0xc77
    25c0:	e1550003 	cmp	r5, r3
    25c4:	1affff94 	bne	241c <ipu_unlink_channels+0xa8>
    25c8:	e3caaa0f 	bic	sl, sl, #61440	; 0xf000
    25cc:	eaffffdc 	b	2544 <ipu_unlink_channels+0x1d0>
    25d0:	e3cbbd1e 	bic	fp, fp, #1920	; 0x780
    25d4:	eaffffb0 	b	249c <ipu_unlink_channels+0x128>
    25d8:	e3caa00f 	bic	sl, sl, #15
    25dc:	eaffffd8 	b	2544 <ipu_unlink_channels+0x1d0>
    25e0:	e3cbb070 	bic	fp, fp, #112	; 0x70
    25e4:	eaffffac 	b	249c <ipu_unlink_channels+0x128>
    25e8:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    25ec:	e34031b7 	movt	r3, #439	; 0x1b7
    25f0:	e1580003 	cmp	r8, r3
    25f4:	0a000011 	beq	2640 <ipu_unlink_channels+0x2cc>
    25f8:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    25fc:	e34032bb 	movt	r3, #699	; 0x2bb
    2600:	e1580003 	cmp	r8, r3
    2604:	03c66c0f 	biceq	r6, r6, #3840	; 0xf00
    2608:	0affffa3 	beq	249c <ipu_unlink_channels+0x128>
    260c:	eaffff82 	b	241c <ipu_unlink_channels+0xa8>
    2610:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    2614:	e34031b7 	movt	r3, #439	; 0x1b7
    2618:	e1550003 	cmp	r5, r3
    261c:	0a00001d 	beq	2698 <ipu_unlink_channels+0x324>
    2620:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    2624:	e34032bb 	movt	r3, #699	; 0x2bb
    2628:	e1550003 	cmp	r5, r3
    262c:	03c99c0f 	biceq	r9, r9, #3840	; 0xf00
    2630:	0affffc3 	beq	2544 <ipu_unlink_channels+0x1d0>
    2634:	eaffff78 	b	241c <ipu_unlink_channels+0xa8>
    2638:	e3cbb00f 	bic	fp, fp, #15
    263c:	eaffff96 	b	249c <ipu_unlink_channels+0x128>
    2640:	e3c6660f 	bic	r6, r6, #15728640	; 0xf00000
    2644:	eaffff94 	b	249c <ipu_unlink_channels+0x128>
    2648:	e3c66a0f 	bic	r6, r6, #61440	; 0xf000
    264c:	eaffff92 	b	249c <ipu_unlink_channels+0x128>
    2650:	e3cbb803 	bic	fp, fp, #196608	; 0x30000
    2654:	eaffff90 	b	249c <ipu_unlink_channels+0x128>
    2658:	e3cbbb0e 	bic	fp, fp, #14336	; 0x3800
    265c:	eaffff8e 	b	249c <ipu_unlink_channels+0x128>
    2660:	e3c6680f 	bic	r6, r6, #983040	; 0xf0000
    2664:	eaffff8c 	b	249c <ipu_unlink_channels+0x128>
    2668:	e3c99a0f 	bic	r9, r9, #61440	; 0xf000
    266c:	eaffffb4 	b	2544 <ipu_unlink_channels+0x1d0>
    2670:	e3caac0f 	bic	sl, sl, #3840	; 0xf00
    2674:	eaffffb2 	b	2544 <ipu_unlink_channels+0x1d0>
    2678:	e3caa60f 	bic	sl, sl, #15728640	; 0xf00000
    267c:	eaffffb0 	b	2544 <ipu_unlink_channels+0x1d0>
    2680:	e3c99203 	bic	r9, r9, #805306368	; 0x30000000
    2684:	eaffffae 	b	2544 <ipu_unlink_channels+0x1d0>
    2688:	e3caa0f0 	bic	sl, sl, #240	; 0xf0
    268c:	eaffffac 	b	2544 <ipu_unlink_channels+0x1d0>
    2690:	e3c9980f 	bic	r9, r9, #983040	; 0xf0000
    2694:	eaffffaa 	b	2544 <ipu_unlink_channels+0x1d0>
    2698:	e3c9900f 	bic	r9, r9, #15
    269c:	eaffffa8 	b	2544 <ipu_unlink_channels+0x1d0>

000026a0 <ipu_uninit_channel>:
    26a0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    26a4:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    26a8:	e1a06000 	mov	r6, r0
    26ac:	e2855008 	add	r5, r5, #8
    26b0:	e1a08c41 	asr	r8, r1, #24
    26b4:	e24dd01c 	sub	sp, sp, #28
    26b8:	e1a00005 	mov	r0, r5
    26bc:	e2864a01 	add	r4, r6, #4096	; 0x1000
    26c0:	e1a09001 	mov	r9, r1
    26c4:	ebfffffe 	bl	0 <mutex_lock>
    26c8:	e3a03001 	mov	r3, #1
    26cc:	e5942e14 	ldr	r2, [r4, #3604]	; 0xe14
    26d0:	e1a01813 	lsl	r1, r3, r8
    26d4:	e1110002 	tst	r1, r2
    26d8:	e58d1000 	str	r1, [sp]
    26dc:	1a000008 	bne	2704 <ipu_uninit_channel+0x64>
    26e0:	e3000000 	movw	r0, #0
    26e4:	e3400000 	movt	r0, #0
    26e8:	e1d035ba 	ldrh	r3, [r0, #90]	; 0x5a
    26ec:	e3130004 	tst	r3, #4
    26f0:	1a000110 	bne	2b38 <ipu_uninit_channel+0x498>
    26f4:	e1a00005 	mov	r0, r5
    26f8:	e28dd01c 	add	sp, sp, #28
    26fc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2700:	eafffffe 	b	0 <mutex_unlock>
    2704:	e1a0c929 	lsr	ip, r9, #18
    2708:	e5942d4c 	ldr	r2, [r4, #3404]	; 0xd4c
    270c:	e20c703f 	and	r7, ip, #63	; 0x3f
    2710:	e1a0b2a7 	lsr	fp, r7, #5
    2714:	e28bb001 	add	fp, fp, #1
    2718:	e1a0b10b 	lsl	fp, fp, #2
    271c:	e082200b 	add	r2, r2, fp
    2720:	e5922000 	ldr	r2, [r2]
    2724:	f57ff04f 	dsb	sy
    2728:	e357003f 	cmp	r7, #63	; 0x3f
    272c:	0a000002 	beq	273c <ipu_uninit_channel+0x9c>
    2730:	e20c001f 	and	r0, ip, #31
    2734:	e0123013 	ands	r3, r2, r3, lsl r0
    2738:	1a00000e 	bne	2778 <ipu_uninit_channel+0xd8>
    273c:	e209a03f 	and	sl, r9, #63	; 0x3f
    2740:	e5943d4c 	ldr	r3, [r4, #3404]	; 0xd4c
    2744:	e1a022aa 	lsr	r2, sl, #5
    2748:	e2822001 	add	r2, r2, #1
    274c:	e1a02102 	lsl	r2, r2, #2
    2750:	e58d2004 	str	r2, [sp, #4]
    2754:	e0833002 	add	r3, r3, r2
    2758:	e5932000 	ldr	r2, [r3]
    275c:	f57ff04f 	dsb	sy
    2760:	e35a003f 	cmp	sl, #63	; 0x3f
    2764:	0a00000c 	beq	279c <ipu_uninit_channel+0xfc>
    2768:	e209301f 	and	r3, r9, #31
    276c:	e3a00001 	mov	r0, #1
    2770:	e0123310 	ands	r3, r2, r0, lsl r3
    2774:	0a000008 	beq	279c <ipu_uninit_channel+0xfc>
    2778:	e3001000 	movw	r1, #0
    277c:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    2780:	e1a02008 	mov	r2, r8
    2784:	e3401000 	movt	r1, #0
    2788:	ebfffffe 	bl	0 <dev_err>
    278c:	e1a00005 	mov	r0, r5
    2790:	e28dd01c 	add	sp, sp, #28
    2794:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2798:	eafffffe 	b	0 <mutex_unlock>
    279c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    27a0:	e5933000 	ldr	r3, [r3]
    27a4:	f57ff04f 	dsb	sy
    27a8:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
    27ac:	e28b2f53 	add	r2, fp, #332	; 0x14c
    27b0:	e0800002 	add	r0, r0, r2
    27b4:	e5900000 	ldr	r0, [r0]
    27b8:	f57ff04f 	dsb	sy
    27bc:	e357003f 	cmp	r7, #63	; 0x3f
    27c0:	e1cd20f8 	strd	r2, [sp, #8]
    27c4:	120cc01f 	andne	ip, ip, #31
    27c8:	13a0e001 	movne	lr, #1
    27cc:	11e01c1e 	mvnne	r1, lr, lsl ip
    27d0:	03e01000 	mvneq	r1, #0
    27d4:	058d1014 	streq	r1, [sp, #20]
    27d8:	10000001 	andne	r0, r0, r1
    27dc:	158d1014 	strne	r1, [sp, #20]
    27e0:	e58d0010 	str	r0, [sp, #16]
    27e4:	f57ff04e 	dsb	st
    27e8:	ebfffffe 	bl	0 <arm_heavy_mb>
    27ec:	e594cd48 	ldr	ip, [r4, #3400]	; 0xd48
    27f0:	e59d2008 	ldr	r2, [sp, #8]
    27f4:	e59d0010 	ldr	r0, [sp, #16]
    27f8:	e08c2002 	add	r2, ip, r2
    27fc:	e5820000 	str	r0, [r2]
    2800:	e59d3004 	ldr	r3, [sp, #4]
    2804:	e2832f53 	add	r2, r3, #332	; 0x14c
    2808:	e08cc002 	add	ip, ip, r2
    280c:	e59c0000 	ldr	r0, [ip]
    2810:	f57ff04f 	dsb	sy
    2814:	e35a003f 	cmp	sl, #63	; 0x3f
    2818:	e59d300c 	ldr	r3, [sp, #12]
    281c:	1209a01f 	andne	sl, r9, #31
    2820:	13a0c001 	movne	ip, #1
    2824:	11e0aa1c 	mvnne	sl, ip, lsl sl
    2828:	03e0a000 	mvneq	sl, #0
    282c:	e1cd20f8 	strd	r2, [sp, #8]
    2830:	1000000a 	andne	r0, r0, sl
    2834:	e58d0010 	str	r0, [sp, #16]
    2838:	f57ff04e 	dsb	st
    283c:	ebfffffe 	bl	0 <arm_heavy_mb>
    2840:	e594cd48 	ldr	ip, [r4, #3400]	; 0xd48
    2844:	e59d2008 	ldr	r2, [sp, #8]
    2848:	e59d0010 	ldr	r0, [sp, #16]
    284c:	e08c2002 	add	r2, ip, r2
    2850:	e5820000 	str	r0, [r2]
    2854:	e5962004 	ldr	r2, [r6, #4]
    2858:	e59d300c 	ldr	r3, [sp, #12]
    285c:	e3520000 	cmp	r2, #0
    2860:	128b2f5d 	addne	r2, fp, #372	; 0x174
    2864:	03a02f4b 	moveq	r2, #300	; 0x12c
    2868:	e08cc002 	add	ip, ip, r2
    286c:	e59c2000 	ldr	r2, [ip]
    2870:	f57ff04f 	dsb	sy
    2874:	e59d1014 	ldr	r1, [sp, #20]
    2878:	e5960004 	ldr	r0, [r6, #4]
    287c:	e0011002 	and	r1, r1, r2
    2880:	e3500000 	cmp	r0, #0
    2884:	e1a02001 	mov	r2, r1
    2888:	128bbf5d 	addne	fp, fp, #372	; 0x174
    288c:	03a0bf4b 	moveq	fp, #300	; 0x12c
    2890:	e1cd20f8 	strd	r2, [sp, #8]
    2894:	f57ff04e 	dsb	st
    2898:	ebfffffe 	bl	0 <arm_heavy_mb>
    289c:	e5940d48 	ldr	r0, [r4, #3400]	; 0xd48
    28a0:	e59d2008 	ldr	r2, [sp, #8]
    28a4:	e080b00b 	add	fp, r0, fp
    28a8:	e58b2000 	str	r2, [fp]
    28ac:	e5962004 	ldr	r2, [r6, #4]
    28b0:	e59d300c 	ldr	r3, [sp, #12]
    28b4:	e3520000 	cmp	r2, #0
    28b8:	159d2004 	ldrne	r2, [sp, #4]
    28bc:	03a02f4b 	moveq	r2, #300	; 0x12c
    28c0:	12822f5d 	addne	r2, r2, #372	; 0x174
    28c4:	e0800002 	add	r0, r0, r2
    28c8:	e5900000 	ldr	r0, [r0]
    28cc:	f57ff04f 	dsb	sy
    28d0:	e5962004 	ldr	r2, [r6, #4]
    28d4:	e00aa000 	and	sl, sl, r0
    28d8:	e3520000 	cmp	r2, #0
    28dc:	159d2004 	ldrne	r2, [sp, #4]
    28e0:	03a0bf4b 	moveq	fp, #300	; 0x12c
    28e4:	e58d3004 	str	r3, [sp, #4]
    28e8:	1282bf5d 	addne	fp, r2, #372	; 0x174
    28ec:	f57ff04e 	dsb	st
    28f0:	ebfffffe 	bl	0 <arm_heavy_mb>
    28f4:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    28f8:	e082b00b 	add	fp, r2, fp
    28fc:	e58ba000 	str	sl, [fp]
    2900:	e247200b 	sub	r2, r7, #11
    2904:	e247b017 	sub	fp, r7, #23
    2908:	e352000b 	cmp	r2, #11
    290c:	e59d3004 	ldr	r3, [sp, #4]
    2910:	83a02000 	movhi	r2, #0
    2914:	93a02001 	movls	r2, #1
    2918:	e3570011 	cmp	r7, #17
    291c:	03a02000 	moveq	r2, #0
    2920:	e3520000 	cmp	r2, #0
    2924:	0a00008a 	beq	2b54 <ipu_uninit_channel+0x4b4>
    2928:	e3570012 	cmp	r7, #18
    292c:	0a000005 	beq	2948 <ipu_uninit_channel+0x2a8>
    2930:	e0862008 	add	r2, r6, r8
    2934:	e3a00000 	mov	r0, #0
    2938:	e301ed9e 	movw	lr, #7582	; 0x1d9e
    293c:	e301cdbe 	movw	ip, #7614	; 0x1dbe
    2940:	e7c2000e 	strb	r0, [r2, lr]
    2944:	e7c2000c 	strb	r0, [r2, ip]
    2948:	e3e024f2 	mvn	r2, #-234881024	; 0xf2000000
    294c:	e1590002 	cmp	r9, r2
    2950:	0a00015b 	beq	2ec4 <ipu_uninit_channel+0x824>
    2954:	e359040e 	cmp	r9, #234881024	; 0xe000000
    2958:	aa000080 	bge	2b60 <ipu_uninit_channel+0x4c0>
    295c:	e30e2455 	movw	r2, #58453	; 0xe455
    2960:	e3402530 	movt	r2, #1328	; 0x530
    2964:	e1590002 	cmp	r9, r2
    2968:	0a00014a 	beq	2e98 <ipu_uninit_channel+0x7f8>
    296c:	ca00009c 	bgt	2be4 <ipu_uninit_channel+0x544>
    2970:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    2974:	e34022bb 	movt	r2, #699	; 0x2bb
    2978:	e1590002 	cmp	r9, r2
    297c:	0a0001bf 	beq	3080 <ipu_uninit_channel+0x9e0>
    2980:	da000129 	ble	2e2c <ipu_uninit_channel+0x78c>
    2984:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    2988:	e34023bf 	movt	r2, #959	; 0x3bf
    298c:	e1590002 	cmp	r9, r2
    2990:	0a0001c5 	beq	30ac <ipu_uninit_channel+0xa0c>
    2994:	e30e2454 	movw	r2, #58452	; 0xe454
    2998:	e3402430 	movt	r2, #1072	; 0x430
    299c:	e1590002 	cmp	r9, r2
    29a0:	1a0000da 	bne	2d10 <ipu_uninit_channel+0x670>
    29a4:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    29a8:	e1a00006 	mov	r0, r6
    29ac:	e58d3004 	str	r3, [sp, #4]
    29b0:	e2422001 	sub	r2, r2, #1
    29b4:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    29b8:	ebfffffe 	bl	9d9c <_ipu_ic_uninit_prpenc>
    29bc:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    29c0:	e592a0a8 	ldr	sl, [r2, #168]	; 0xa8
    29c4:	f57ff04f 	dsb	sy
    29c8:	e3caa101 	bic	sl, sl, #1073741824	; 0x40000000
    29cc:	f57ff04e 	dsb	st
    29d0:	ebfffffe 	bl	0 <arm_heavy_mb>
    29d4:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    29d8:	e582a0a8 	str	sl, [r2, #168]	; 0xa8
    29dc:	e3a0a000 	mov	sl, #0
    29e0:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    29e4:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    29e8:	e8901003 	ldm	r0, {r0, r1, ip}
    29ec:	e59d3004 	ldr	r3, [sp, #4]
    29f0:	e594ee2c 	ldr	lr, [r4, #3628]	; 0xe2c
    29f4:	e35e0000 	cmp	lr, #0
    29f8:	e594ee34 	ldr	lr, [r4, #3636]	; 0xe34
    29fc:	03c33004 	biceq	r3, r3, #4
    2a00:	e35e0000 	cmp	lr, #0
    2a04:	e594ee30 	ldr	lr, [r4, #3632]	; 0xe30
    2a08:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
    2a0c:	03c33141 	biceq	r3, r3, #1073741840	; 0x40000010
    2a10:	e35e0000 	cmp	lr, #0
    2a14:	03c33008 	biceq	r3, r3, #8
    2a18:	e3520000 	cmp	r2, #0
    2a1c:	e5942e38 	ldr	r2, [r4, #3640]	; 0xe38
    2a20:	03c33c02 	biceq	r3, r3, #512	; 0x200
    2a24:	e3500000 	cmp	r0, #0
    2a28:	03c33020 	biceq	r3, r3, #32
    2a2c:	e3510000 	cmp	r1, #0
    2a30:	03c33b01 	biceq	r3, r3, #1024	; 0x400
    2a34:	e3520000 	cmp	r2, #0
    2a38:	e5942e3c 	ldr	r2, [r4, #3644]	; 0xe3c
    2a3c:	03c33040 	biceq	r3, r3, #64	; 0x40
    2a40:	e3520000 	cmp	r2, #0
    2a44:	03c33080 	biceq	r3, r3, #128	; 0x80
    2a48:	e35c0000 	cmp	ip, #0
    2a4c:	03c33c01 	biceq	r3, r3, #256	; 0x100
    2a50:	e58d3004 	str	r3, [sp, #4]
    2a54:	f57ff04e 	dsb	st
    2a58:	ebfffffe 	bl	0 <arm_heavy_mb>
    2a5c:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    2a60:	e59d3004 	ldr	r3, [sp, #4]
    2a64:	e5823000 	str	r3, [r2]
    2a68:	e357001c 	cmp	r7, #28
    2a6c:	13570029 	cmpne	r7, #41	; 0x29
    2a70:	e5943e14 	ldr	r3, [r4, #3604]	; 0xe14
    2a74:	03a07001 	moveq	r7, #1
    2a78:	13a07000 	movne	r7, #0
    2a7c:	e59d2000 	ldr	r2, [sp]
    2a80:	e35b0001 	cmp	fp, #1
    2a84:	81a0b007 	movhi	fp, r7
    2a88:	9387b001 	orrls	fp, r7, #1
    2a8c:	e35b0000 	cmp	fp, #0
    2a90:	e1c39002 	bic	r9, r3, r2
    2a94:	e5849e14 	str	r9, [r4, #3604]	; 0xe14
    2a98:	0a000006 	beq	2ab8 <ipu_uninit_channel+0x418>
    2a9c:	e086a00a 	add	sl, r6, sl
    2aa0:	e3017d94 	movw	r7, #7572	; 0x1d94
    2aa4:	e7da3007 	ldrb	r3, [sl, r7]
    2aa8:	e0862003 	add	r2, r6, r3
    2aac:	e5d22028 	ldrb	r2, [r2, #40]	; 0x28
    2ab0:	e3520000 	cmp	r2, #0
    2ab4:	1a000082 	bne	2cc4 <ipu_uninit_channel+0x624>
    2ab8:	e1a00005 	mov	r0, r5
    2abc:	ebfffffe 	bl	0 <mutex_unlock>
    2ac0:	e596000c 	ldr	r0, [r6, #12]
    2ac4:	ebfffffe 	bl	0 <clk_disable>
    2ac8:	e3a01004 	mov	r1, #4
    2acc:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    2ad0:	ebfffffe 	bl	0 <__pm_runtime_suspend>
    2ad4:	e3500000 	cmp	r0, #0
    2ad8:	ba000185 	blt	30f4 <ipu_uninit_channel+0xa54>
    2adc:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    2ae0:	e3530000 	cmp	r3, #0
    2ae4:	ba0000ad 	blt	2da0 <ipu_uninit_channel+0x700>
    2ae8:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    2aec:	e3530000 	cmp	r3, #0
    2af0:	ba0000a5 	blt	2d8c <ipu_uninit_channel+0x6ec>
    2af4:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    2af8:	e3530000 	cmp	r3, #0
    2afc:	ba00009d 	blt	2d78 <ipu_uninit_channel+0x6d8>
    2b00:	e5943e1c 	ldr	r3, [r4, #3612]	; 0xe1c
    2b04:	e3530000 	cmp	r3, #0
    2b08:	ba000095 	blt	2d64 <ipu_uninit_channel+0x6c4>
    2b0c:	e5943e20 	ldr	r3, [r4, #3616]	; 0xe20
    2b10:	e3530000 	cmp	r3, #0
    2b14:	ba00008d 	blt	2d50 <ipu_uninit_channel+0x6b0>
    2b18:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    2b1c:	e3530000 	cmp	r3, #0
    2b20:	ba000085 	blt	2d3c <ipu_uninit_channel+0x69c>
    2b24:	e5943e28 	ldr	r3, [r4, #3624]	; 0xe28
    2b28:	e3530000 	cmp	r3, #0
    2b2c:	ba00007c 	blt	2d24 <ipu_uninit_channel+0x684>
    2b30:	e28dd01c 	add	sp, sp, #28
    2b34:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    2b38:	e3002000 	movw	r2, #0
    2b3c:	e1a03008 	mov	r3, r8
    2b40:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    2b44:	e2800048 	add	r0, r0, #72	; 0x48
    2b48:	e3402000 	movt	r2, #0
    2b4c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    2b50:	eafffee7 	b	26f4 <ipu_uninit_channel+0x54>
    2b54:	e3db2004 	bics	r2, fp, #4
    2b58:	0affff74 	beq	2930 <ipu_uninit_channel+0x290>
    2b5c:	eaffff79 	b	2948 <ipu_uninit_channel+0x2a8>
    2b60:	e30f2fc3 	movw	r2, #65475	; 0xffc3
    2b64:	e34122ff 	movt	r2, #4863	; 0x12ff
    2b68:	e1590002 	cmp	r9, r2
    2b6c:	0a000123 	beq	3000 <ipu_uninit_channel+0x960>
    2b70:	da000039 	ble	2c5c <ipu_uninit_channel+0x5bc>
    2b74:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    2b78:	e34124ff 	movt	r2, #5375	; 0x14ff
    2b7c:	e1590002 	cmp	r9, r2
    2b80:	0a0000f2 	beq	2f50 <ipu_uninit_channel+0x8b0>
    2b84:	da00008a 	ble	2db4 <ipu_uninit_channel+0x714>
    2b88:	e30e2455 	movw	r2, #58453	; 0xe455
    2b8c:	e3412624 	movt	r2, #5668	; 0x1624
    2b90:	e1590002 	cmp	r9, r2
    2b94:	0a0000dd 	beq	2f10 <ipu_uninit_channel+0x870>
    2b98:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    2b9c:	e3412927 	movt	r2, #6439	; 0x1927
    2ba0:	e1590002 	cmp	r9, r2
    2ba4:	1a000059 	bne	2d10 <ipu_uninit_channel+0x670>
    2ba8:	e594cd90 	ldr	ip, [r4, #3472]	; 0xd90
    2bac:	e3a0a000 	mov	sl, #0
    2bb0:	e5942e34 	ldr	r2, [r4, #3636]	; 0xe34
    2bb4:	e5940e2c 	ldr	r0, [r4, #3628]	; 0xe2c
    2bb8:	e15c0009 	cmp	ip, r9
    2bbc:	e58d3004 	str	r3, [sp, #4]
    2bc0:	e2422001 	sub	r2, r2, #1
    2bc4:	e2401001 	sub	r1, r0, #1
    2bc8:	e5842e34 	str	r2, [r4, #3636]	; 0xe34
    2bcc:	03a02000 	moveq	r2, #0
    2bd0:	e5841e2c 	str	r1, [r4, #3628]	; 0xe2c
    2bd4:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2bd8:	e1a00006 	mov	r0, r6
    2bdc:	ebfffffe 	bl	98b4 <_ipu_vdi_uninit>
    2be0:	eaffff7e 	b	29e0 <ipu_uninit_channel+0x340>
    2be4:	e30f2fff 	movw	r2, #65535	; 0xffff
    2be8:	e3402773 	movt	r2, #1907	; 0x773
    2bec:	e1590002 	cmp	r9, r2
    2bf0:	0a0000ed 	beq	2fac <ipu_uninit_channel+0x90c>
    2bf4:	da00009b 	ble	2e68 <ipu_uninit_channel+0x7c8>
    2bf8:	e30f2cff 	movw	r2, #64767	; 0xfcff
    2bfc:	e340295f 	movt	r2, #2399	; 0x95f
    2c00:	e1590002 	cmp	r9, r2
    2c04:	0a00010d 	beq	3040 <ipu_uninit_channel+0x9a0>
    2c08:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    2c0c:	e3402a6f 	movt	r2, #2671	; 0xa6f
    2c10:	e1590002 	cmp	r9, r2
    2c14:	1a00003d 	bne	2d10 <ipu_uninit_channel+0x670>
    2c18:	e1a01009 	mov	r1, r9
    2c1c:	e1a00006 	mov	r0, r6
    2c20:	e58d3004 	str	r3, [sp, #4]
    2c24:	e3a0a000 	mov	sl, #0
    2c28:	ebfffffe 	bl	bdcc <_ipu_dp_uninit>
    2c2c:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2c30:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2c34:	e2422001 	sub	r2, r2, #1
    2c38:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2c3c:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2c40:	e2400001 	sub	r0, r0, #1
    2c44:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2c48:	e2411001 	sub	r1, r1, #1
    2c4c:	e5840e20 	str	r0, [r4, #3616]	; 0xe20
    2c50:	e5841e24 	str	r1, [r4, #3620]	; 0xe24
    2c54:	e59d3004 	ldr	r3, [sp, #4]
    2c58:	eaffff64 	b	29f0 <ipu_uninit_channel+0x350>
    2c5c:	e30f2fc0 	movw	r2, #65472	; 0xffc0
    2c60:	e3402fff 	movt	r2, #4095	; 0xfff
    2c64:	e1590002 	cmp	r9, r2
    2c68:	0a0000e4 	beq	3000 <ipu_uninit_channel+0x960>
    2c6c:	ca00001f 	bgt	2cf0 <ipu_uninit_channel+0x650>
    2c70:	e3e024f1 	mvn	r2, #-251658240	; 0xf1000000
    2c74:	e1590002 	cmp	r9, r2
    2c78:	1a000024 	bne	2d10 <ipu_uninit_channel+0x670>
    2c7c:	e3a01009 	mov	r1, #9
    2c80:	e1a00006 	mov	r0, r6
    2c84:	e58d3004 	str	r3, [sp, #4]
    2c88:	e3a0a009 	mov	sl, #9
    2c8c:	ebfffffe 	bl	bdd4 <_ipu_dc_uninit>
    2c90:	e5d42d9d 	ldrb	r2, [r4, #3485]	; 0xd9d
    2c94:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2c98:	e59d3004 	ldr	r3, [sp, #4]
    2c9c:	e0862102 	add	r2, r6, r2, lsl #2
    2ca0:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2ca4:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2ca8:	e2411001 	sub	r1, r1, #1
    2cac:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2cb0:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2cb4:	e8901003 	ldm	r0, {r0, r1, ip}
    2cb8:	e2422001 	sub	r2, r2, #1
    2cbc:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2cc0:	eaffff4a 	b	29f0 <ipu_uninit_channel+0x350>
    2cc4:	e2833008 	add	r3, r3, #8
    2cc8:	e7969103 	ldr	r9, [r6, r3, lsl #2]
    2ccc:	e1a00009 	mov	r0, r9
    2cd0:	ebfffffe 	bl	0 <clk_disable>
    2cd4:	e1a00009 	mov	r0, r9
    2cd8:	ebfffffe 	bl	0 <clk_unprepare>
    2cdc:	e7da3007 	ldrb	r3, [sl, r7]
    2ce0:	e3a02000 	mov	r2, #0
    2ce4:	e0863003 	add	r3, r6, r3
    2ce8:	e5c32028 	strb	r2, [r3, #40]	; 0x28
    2cec:	eaffff71 	b	2ab8 <ipu_uninit_channel+0x418>
    2cf0:	e30f2fc1 	movw	r2, #65473	; 0xffc1
    2cf4:	e34120ff 	movt	r2, #4351	; 0x10ff
    2cf8:	e1590002 	cmp	r9, r2
    2cfc:	0a0000bf 	beq	3000 <ipu_uninit_channel+0x960>
    2d00:	e30f2fc2 	movw	r2, #65474	; 0xffc2
    2d04:	e34121ff 	movt	r2, #4607	; 0x11ff
    2d08:	e1590002 	cmp	r9, r2
    2d0c:	0a0000bb 	beq	3000 <ipu_uninit_channel+0x960>
    2d10:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2d14:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2d18:	e3a0a000 	mov	sl, #0
    2d1c:	e8901003 	ldm	r0, {r0, r1, ip}
    2d20:	eaffff32 	b	29f0 <ipu_uninit_channel+0x350>
    2d24:	e3000000 	movw	r0, #0
    2d28:	e300154c 	movw	r1, #1356	; 0x54c
    2d2c:	e3400000 	movt	r0, #0
    2d30:	e28dd01c 	add	sp, sp, #28
    2d34:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    2d38:	eafffffe 	b	0 <warn_slowpath_null>
    2d3c:	e3000000 	movw	r0, #0
    2d40:	e300154b 	movw	r1, #1355	; 0x54b
    2d44:	e3400000 	movt	r0, #0
    2d48:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d4c:	eaffff74 	b	2b24 <ipu_uninit_channel+0x484>
    2d50:	e3000000 	movw	r0, #0
    2d54:	e300154a 	movw	r1, #1354	; 0x54a
    2d58:	e3400000 	movt	r0, #0
    2d5c:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d60:	eaffff6c 	b	2b18 <ipu_uninit_channel+0x478>
    2d64:	e3000000 	movw	r0, #0
    2d68:	e3001549 	movw	r1, #1353	; 0x549
    2d6c:	e3400000 	movt	r0, #0
    2d70:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d74:	eaffff64 	b	2b0c <ipu_uninit_channel+0x46c>
    2d78:	e3000000 	movw	r0, #0
    2d7c:	e3001548 	movw	r1, #1352	; 0x548
    2d80:	e3400000 	movt	r0, #0
    2d84:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d88:	eaffff5c 	b	2b00 <ipu_uninit_channel+0x460>
    2d8c:	e3000000 	movw	r0, #0
    2d90:	e3001547 	movw	r1, #1351	; 0x547
    2d94:	e3400000 	movt	r0, #0
    2d98:	ebfffffe 	bl	0 <warn_slowpath_null>
    2d9c:	eaffff54 	b	2af4 <ipu_uninit_channel+0x454>
    2da0:	e3000000 	movw	r0, #0
    2da4:	e3001546 	movw	r1, #1350	; 0x546
    2da8:	e3400000 	movt	r0, #0
    2dac:	ebfffffe 	bl	0 <warn_slowpath_null>
    2db0:	eaffff4c 	b	2ae8 <ipu_uninit_channel+0x448>
    2db4:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    2db8:	e34123ff 	movt	r2, #5119	; 0x13ff
    2dbc:	e1590002 	cmp	r9, r2
    2dc0:	1affffd2 	bne	2d10 <ipu_uninit_channel+0x670>
    2dc4:	e5940d90 	ldr	r0, [r4, #3472]	; 0xd90
    2dc8:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2dcc:	e58d3004 	str	r3, [sp, #4]
    2dd0:	e1500009 	cmp	r0, r9
    2dd4:	e1a00006 	mov	r0, r6
    2dd8:	e2422001 	sub	r2, r2, #1
    2ddc:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2de0:	03a02000 	moveq	r2, #0
    2de4:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2de8:	ebfffffe 	bl	9d9c <_ipu_ic_uninit_prpenc>
    2dec:	e5941d88 	ldr	r1, [r4, #3464]	; 0xd88
    2df0:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    2df4:	e34123ff 	movt	r2, #5119	; 0x13ff
    2df8:	e59d3004 	ldr	r3, [sp, #4]
    2dfc:	e1510002 	cmp	r1, r2
    2e00:	0a000062 	beq	2f90 <ipu_uninit_channel+0x8f0>
    2e04:	e5941d8c 	ldr	r1, [r4, #3468]	; 0xd8c
    2e08:	e1510002 	cmp	r1, r2
    2e0c:	1affffbf 	bne	2d10 <ipu_uninit_channel+0x670>
    2e10:	e3e01000 	mvn	r1, #0
    2e14:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2e18:	e5841d8c 	str	r1, [r4, #3468]	; 0xd8c
    2e1c:	e3a0a000 	mov	sl, #0
    2e20:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2e24:	e8901003 	ldm	r0, {r0, r1, ip}
    2e28:	eafffef0 	b	29f0 <ipu_uninit_channel+0x350>
    2e2c:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    2e30:	e34021b7 	movt	r2, #439	; 0x1b7
    2e34:	e1590002 	cmp	r9, r2
    2e38:	1affffb4 	bne	2d10 <ipu_uninit_channel+0x670>
    2e3c:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    2e40:	e1a00006 	mov	r0, r6
    2e44:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e48:	e3a0a000 	mov	sl, #0
    2e4c:	e58d3004 	str	r3, [sp, #4]
    2e50:	e2411001 	sub	r1, r1, #1
    2e54:	e2422001 	sub	r2, r2, #1
    2e58:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    2e5c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2e60:	ebfffffe 	bl	9dcc <_ipu_ic_uninit_rotate_enc>
    2e64:	eafffedd 	b	29e0 <ipu_uninit_channel+0x340>
    2e68:	e30f2496 	movw	r2, #62614	; 0xf496
    2e6c:	e340262c 	movt	r2, #1580	; 0x62c
    2e70:	e1590002 	cmp	r9, r2
    2e74:	1affffa5 	bne	2d10 <ipu_uninit_channel+0x670>
    2e78:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e7c:	e1a00006 	mov	r0, r6
    2e80:	e58d3004 	str	r3, [sp, #4]
    2e84:	e3a0a000 	mov	sl, #0
    2e88:	e2422001 	sub	r2, r2, #1
    2e8c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2e90:	ebfffffe 	bl	a0a4 <_ipu_ic_uninit_pp>
    2e94:	eafffed1 	b	29e0 <ipu_uninit_channel+0x340>
    2e98:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2e9c:	e1a00006 	mov	r0, r6
    2ea0:	e58d3004 	str	r3, [sp, #4]
    2ea4:	e2422001 	sub	r2, r2, #1
    2ea8:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2eac:	ebfffffe 	bl	9ba8 <_ipu_ic_uninit_prpvf>
    2eb0:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    2eb4:	e592a0a8 	ldr	sl, [r2, #168]	; 0xa8
    2eb8:	f57ff04f 	dsb	sy
    2ebc:	e3caa102 	bic	sl, sl, #-2147483648	; 0x80000000
    2ec0:	eafffec1 	b	29cc <ipu_uninit_channel+0x32c>
    2ec4:	e3a01008 	mov	r1, #8
    2ec8:	e1a00006 	mov	r0, r6
    2ecc:	e58d3004 	str	r3, [sp, #4]
    2ed0:	e3a0a008 	mov	sl, #8
    2ed4:	ebfffffe 	bl	bdd4 <_ipu_dc_uninit>
    2ed8:	e5d42d9c 	ldrb	r2, [r4, #3484]	; 0xd9c
    2edc:	e59d3004 	ldr	r3, [sp, #4]
    2ee0:	e0862102 	add	r2, r6, r2, lsl #2
    2ee4:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2ee8:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2eec:	e2411001 	sub	r1, r1, #1
    2ef0:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2ef4:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2ef8:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2efc:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2f00:	e2422001 	sub	r2, r2, #1
    2f04:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2f08:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2f0c:	eafffeb7 	b	29f0 <ipu_uninit_channel+0x350>
    2f10:	e594cd90 	ldr	ip, [r4, #3472]	; 0xd90
    2f14:	e5942e34 	ldr	r2, [r4, #3636]	; 0xe34
    2f18:	e5940e2c 	ldr	r0, [r4, #3628]	; 0xe2c
    2f1c:	e15c0009 	cmp	ip, r9
    2f20:	e58d3004 	str	r3, [sp, #4]
    2f24:	e2422001 	sub	r2, r2, #1
    2f28:	e2401001 	sub	r1, r0, #1
    2f2c:	e5842e34 	str	r2, [r4, #3636]	; 0xe34
    2f30:	03a02000 	moveq	r2, #0
    2f34:	e1a00006 	mov	r0, r6
    2f38:	e5841e2c 	str	r1, [r4, #3628]	; 0xe2c
    2f3c:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2f40:	ebfffffe 	bl	9ba8 <_ipu_ic_uninit_prpvf>
    2f44:	e1a00006 	mov	r0, r6
    2f48:	ebfffffe 	bl	98b4 <_ipu_vdi_uninit>
    2f4c:	eaffffd7 	b	2eb0 <ipu_uninit_channel+0x810>
    2f50:	e5940d90 	ldr	r0, [r4, #3472]	; 0xd90
    2f54:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    2f58:	e58d3004 	str	r3, [sp, #4]
    2f5c:	e1500009 	cmp	r0, r9
    2f60:	e1a00006 	mov	r0, r6
    2f64:	e2422001 	sub	r2, r2, #1
    2f68:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    2f6c:	03a02000 	moveq	r2, #0
    2f70:	05842d90 	streq	r2, [r4, #3472]	; 0xd90
    2f74:	ebfffffe 	bl	9ba8 <_ipu_ic_uninit_prpvf>
    2f78:	e5941d88 	ldr	r1, [r4, #3464]	; 0xd88
    2f7c:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    2f80:	e34124ff 	movt	r2, #5375	; 0x14ff
    2f84:	e59d3004 	ldr	r3, [sp, #4]
    2f88:	e1510002 	cmp	r1, r2
    2f8c:	1affff9c 	bne	2e04 <ipu_uninit_channel+0x764>
    2f90:	e3e01000 	mvn	r1, #0
    2f94:	e2840ee2 	add	r0, r4, #3616	; 0xe20
    2f98:	e5841d88 	str	r1, [r4, #3464]	; 0xd88
    2f9c:	e3a0a000 	mov	sl, #0
    2fa0:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2fa4:	e8901003 	ldm	r0, {r0, r1, ip}
    2fa8:	eafffe90 	b	29f0 <ipu_uninit_channel+0x350>
    2fac:	e3a01001 	mov	r1, #1
    2fb0:	e1a00006 	mov	r0, r6
    2fb4:	e58d3004 	str	r3, [sp, #4]
    2fb8:	e3a0a001 	mov	sl, #1
    2fbc:	ebfffffe 	bl	bdd4 <_ipu_dc_uninit>
    2fc0:	e5d42d95 	ldrb	r2, [r4, #3477]	; 0xd95
    2fc4:	e59d3004 	ldr	r3, [sp, #4]
    2fc8:	e0862102 	add	r2, r6, r2, lsl #2
    2fcc:	e2822a01 	add	r2, r2, #4096	; 0x1000
    2fd0:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    2fd4:	e2411001 	sub	r1, r1, #1
    2fd8:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    2fdc:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    2fe0:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    2fe4:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    2fe8:	e2422001 	sub	r2, r2, #1
    2fec:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    2ff0:	e2411001 	sub	r1, r1, #1
    2ff4:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    2ff8:	e5841e24 	str	r1, [r4, #3620]	; 0xe24
    2ffc:	eafffe7b 	b	29f0 <ipu_uninit_channel+0x350>
    3000:	e5942d88 	ldr	r2, [r4, #3464]	; 0xd88
    3004:	e594ce28 	ldr	ip, [r4, #3624]	; 0xe28
    3008:	e1520009 	cmp	r2, r9
    300c:	e24cc001 	sub	ip, ip, #1
    3010:	e584ce28 	str	ip, [r4, #3624]	; 0xe28
    3014:	0a00002f 	beq	30d8 <ipu_uninit_channel+0xa38>
    3018:	e5942d8c 	ldr	r2, [r4, #3468]	; 0xd8c
    301c:	e3a0a000 	mov	sl, #0
    3020:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    3024:	e1520009 	cmp	r2, r9
    3028:	03e01000 	mvneq	r1, #0
    302c:	15942e1c 	ldrne	r2, [r4, #3612]	; 0xe1c
    3030:	05841d8c 	streq	r1, [r4, #3468]	; 0xd8c
    3034:	05942e1c 	ldreq	r2, [r4, #3612]	; 0xe1c
    3038:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    303c:	eafffe6b 	b	29f0 <ipu_uninit_channel+0x350>
    3040:	e1a01009 	mov	r1, r9
    3044:	e1a00006 	mov	r0, r6
    3048:	e58d3004 	str	r3, [sp, #4]
    304c:	e3a0a005 	mov	sl, #5
    3050:	ebfffffe 	bl	bdcc <_ipu_dp_uninit>
    3054:	e3a01005 	mov	r1, #5
    3058:	e1a00006 	mov	r0, r6
    305c:	ebfffffe 	bl	bdd4 <_ipu_dc_uninit>
    3060:	e5d42d99 	ldrb	r2, [r4, #3481]	; 0xd99
    3064:	e0862102 	add	r2, r6, r2, lsl #2
    3068:	e2822a01 	add	r2, r2, #4096	; 0x1000
    306c:	e5921e38 	ldr	r1, [r2, #3640]	; 0xe38
    3070:	e2411001 	sub	r1, r1, #1
    3074:	e5821e38 	str	r1, [r2, #3640]	; 0xe38
    3078:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    307c:	eafffeeb 	b	2c30 <ipu_uninit_channel+0x590>
    3080:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    3084:	e1a00006 	mov	r0, r6
    3088:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    308c:	e3a0a000 	mov	sl, #0
    3090:	e58d3004 	str	r3, [sp, #4]
    3094:	e2411001 	sub	r1, r1, #1
    3098:	e2422001 	sub	r2, r2, #1
    309c:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    30a0:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    30a4:	ebfffffe 	bl	9bd8 <_ipu_ic_uninit_rotate_vf>
    30a8:	eafffe4c 	b	29e0 <ipu_uninit_channel+0x340>
    30ac:	e5941e30 	ldr	r1, [r4, #3632]	; 0xe30
    30b0:	e1a00006 	mov	r0, r6
    30b4:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    30b8:	e3a0a000 	mov	sl, #0
    30bc:	e58d3004 	str	r3, [sp, #4]
    30c0:	e2411001 	sub	r1, r1, #1
    30c4:	e2422001 	sub	r2, r2, #1
    30c8:	e5841e30 	str	r1, [r4, #3632]	; 0xe30
    30cc:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    30d0:	ebfffffe 	bl	a0d4 <_ipu_ic_uninit_rotate_pp>
    30d4:	eafffe41 	b	29e0 <ipu_uninit_channel+0x340>
    30d8:	e3e01000 	mvn	r1, #0
    30dc:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    30e0:	e5841d88 	str	r1, [r4, #3464]	; 0xd88
    30e4:	e3a0a000 	mov	sl, #0
    30e8:	e5940e20 	ldr	r0, [r4, #3616]	; 0xe20
    30ec:	e5941e24 	ldr	r1, [r4, #3620]	; 0xe24
    30f0:	eafffe3e 	b	29f0 <ipu_uninit_channel+0x350>
    30f4:	e3001000 	movw	r1, #0
    30f8:	e1a03000 	mov	r3, r0
    30fc:	e1a02008 	mov	r2, r8
    3100:	e3401000 	movt	r1, #0
    3104:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    3108:	ebfffffe 	bl	0 <dev_err>
    310c:	ebfffffe 	bl	0 <dump_stack>
    3110:	eafffe71 	b	2adc <ipu_uninit_channel+0x43c>

00003114 <ipu_get_cur_buffer_idx>:
    3114:	e0822082 	add	r2, r2, r2, lsl #1
    3118:	e1a02082 	lsl	r2, r2, #1
    311c:	e1a01231 	lsr	r1, r1, r2
    3120:	e201303f 	and	r3, r1, #63	; 0x3f
    3124:	e353003f 	cmp	r3, #63	; 0x3f
    3128:	0a000040 	beq	3230 <ipu_get_cur_buffer_idx+0x11c>
    312c:	e92d4010 	push	{r4, lr}
    3130:	e280ea01 	add	lr, r0, #4096	; 0x1000
    3134:	e5902004 	ldr	r2, [r0, #4]
    3138:	e3520000 	cmp	r2, #0
    313c:	11a022a3 	lsrne	r2, r3, #5
    3140:	03a0cf4b 	moveq	ip, #300	; 0x12c
    3144:	1282205e 	addne	r2, r2, #94	; 0x5e
    3148:	11a0c102 	lslne	ip, r2, #2
    314c:	e59e2d48 	ldr	r2, [lr, #3400]	; 0xd48
    3150:	e082200c 	add	r2, r2, ip
    3154:	e592c000 	ldr	ip, [r2]
    3158:	f57ff04f 	dsb	sy
    315c:	e3a04001 	mov	r4, #1
    3160:	e201201f 	and	r2, r1, #31
    3164:	e1a02214 	lsl	r2, r4, r2
    3168:	e112000c 	tst	r2, ip
    316c:	1a00000d 	bne	31a8 <ipu_get_cur_buffer_idx+0x94>
    3170:	e5900004 	ldr	r0, [r0, #4]
    3174:	e1a032a3 	lsr	r3, r3, #5
    3178:	e59e1d48 	ldr	r1, [lr, #3400]	; 0xd48
    317c:	e3500000 	cmp	r0, #0
    3180:	0a000023 	beq	3214 <ipu_get_cur_buffer_idx+0x100>
    3184:	e283308f 	add	r3, r3, #143	; 0x8f
    3188:	e1a03103 	lsl	r3, r3, #2
    318c:	e0813003 	add	r3, r1, r3
    3190:	e5933000 	ldr	r3, [r3]
    3194:	f57ff04f 	dsb	sy
    3198:	e1120003 	tst	r2, r3
    319c:	13a00001 	movne	r0, #1
    31a0:	03a00000 	moveq	r0, #0
    31a4:	e8bd8010 	pop	{r4, pc}
    31a8:	e243c008 	sub	ip, r3, #8
    31ac:	e353000d 	cmp	r3, #13
    31b0:	135c0002 	cmpne	ip, #2
    31b4:	9a000002 	bls	31c4 <ipu_get_cur_buffer_idx+0xb0>
    31b8:	e201103d 	and	r1, r1, #61	; 0x3d
    31bc:	e3510015 	cmp	r1, #21
    31c0:	1a000016 	bne	3220 <ipu_get_cur_buffer_idx+0x10c>
    31c4:	e5900004 	ldr	r0, [r0, #4]
    31c8:	e59e1d48 	ldr	r1, [lr, #3400]	; 0xd48
    31cc:	e3500000 	cmp	r0, #0
    31d0:	0a00000e 	beq	3210 <ipu_get_cur_buffer_idx+0xfc>
    31d4:	e1a03083 	lsl	r3, r3, #1
    31d8:	e1a022a3 	lsr	r2, r3, #5
    31dc:	e2822096 	add	r2, r2, #150	; 0x96
    31e0:	e0811102 	add	r1, r1, r2, lsl #2
    31e4:	e5910000 	ldr	r0, [r1]
    31e8:	f57ff04f 	dsb	sy
    31ec:	e3a01003 	mov	r1, #3
    31f0:	e203201e 	and	r2, r3, #30
    31f4:	e0000211 	and	r0, r0, r1, lsl r2
    31f8:	e3a03001 	mov	r3, #1
    31fc:	e1a03213 	lsl	r3, r3, r2
    3200:	e16f3f13 	clz	r3, r3
    3204:	e263301f 	rsb	r3, r3, #31
    3208:	e1a00330 	lsr	r0, r0, r3
    320c:	e8bd8010 	pop	{r4, pc}
    3210:	e1a032a3 	lsr	r3, r3, #5
    3214:	e2833049 	add	r3, r3, #73	; 0x49
    3218:	e1a03103 	lsl	r3, r3, #2
    321c:	eaffffda 	b	318c <ipu_get_cur_buffer_idx+0x78>
    3220:	e243101b 	sub	r1, r3, #27
    3224:	e1510004 	cmp	r1, r4
    3228:	8affffd0 	bhi	3170 <ipu_get_cur_buffer_idx+0x5c>
    322c:	eaffffe4 	b	31c4 <ipu_get_cur_buffer_idx+0xb0>
    3230:	e3e00015 	mvn	r0, #21
    3234:	e12fff1e 	bx	lr

00003238 <ipu_init_channel_buffer>:
    3238:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    323c:	e24dd094 	sub	sp, sp, #148	; 0x94
    3240:	e58d3024 	str	r3, [sp, #36]	; 0x24
    3244:	e3004000 	movw	r4, #0
    3248:	e1a06002 	mov	r6, r2
    324c:	e3404000 	movt	r4, #0
    3250:	e1dd3bb8 	ldrh	r3, [sp, #184]	; 0xb8
    3254:	e58d0018 	str	r0, [sp, #24]
    3258:	e58d1028 	str	r1, [sp, #40]	; 0x28
    325c:	e58d301c 	str	r3, [sp, #28]
    3260:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3264:	e59d70c0 	ldr	r7, [sp, #192]	; 0xc0
    3268:	e59da0d4 	ldr	sl, [sp, #212]	; 0xd4
    326c:	e3530000 	cmp	r3, #0
    3270:	e1dd3bbc 	ldrh	r3, [sp, #188]	; 0xbc
    3274:	e59d90d8 	ldr	r9, [sp, #216]	; 0xd8
    3278:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    327c:	1a000002 	bne	328c <ipu_init_channel_buffer+0x54>
    3280:	e1d437b2 	ldrh	r3, [r4, #114]	; 0x72
    3284:	e3130004 	tst	r3, #4
    3288:	1a000147 	bne	37ac <ipu_init_channel_buffer+0x574>
    328c:	e1d438ba 	ldrh	r3, [r4, #138]	; 0x8a
    3290:	e3130004 	tst	r3, #4
    3294:	1a0005c9 	bne	49c0 <ipu_init_channel_buffer+0x1788>
    3298:	e1d43ab2 	ldrh	r3, [r4, #162]	; 0xa2
    329c:	e3130004 	tst	r3, #4
    32a0:	1a0005ce 	bne	49e0 <ipu_init_channel_buffer+0x17a8>
    32a4:	e1d43bba 	ldrh	r3, [r4, #186]	; 0xba
    32a8:	e3130004 	tst	r3, #4
    32ac:	1a0005d3 	bne	4a00 <ipu_init_channel_buffer+0x17c8>
    32b0:	e1d43db2 	ldrh	r3, [r4, #210]	; 0xd2
    32b4:	e3130004 	tst	r3, #4
    32b8:	1a0005d8 	bne	4a20 <ipu_init_channel_buffer+0x17e8>
    32bc:	e1d43eba 	ldrh	r3, [r4, #234]	; 0xea
    32c0:	e3130004 	tst	r3, #4
    32c4:	1a0005ae 	bne	4984 <ipu_init_channel_buffer+0x174c>
    32c8:	e3003102 	movw	r3, #258	; 0x102
    32cc:	e19430b3 	ldrh	r3, [r4, r3]
    32d0:	e3130004 	tst	r3, #4
    32d4:	1a0005b3 	bne	49a8 <ipu_init_channel_buffer+0x1770>
    32d8:	e300311a 	movw	r3, #282	; 0x11a
    32dc:	e19430b3 	ldrh	r3, [r4, r3]
    32e0:	e3130004 	tst	r3, #4
    32e4:	1a0005a0 	bne	496c <ipu_init_channel_buffer+0x1734>
    32e8:	e0866086 	add	r6, r6, r6, lsl #1
    32ec:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    32f0:	e1a06086 	lsl	r6, r6, #1
    32f4:	e1a03633 	lsr	r3, r3, r6
    32f8:	e203603f 	and	r6, r3, #63	; 0x3f
    32fc:	e58d3030 	str	r3, [sp, #48]	; 0x30
    3300:	e356003f 	cmp	r6, #63	; 0x3f
    3304:	0a000937 	beq	57e8 <ipu_init_channel_buffer+0x25b0>
    3308:	e3003132 	movw	r3, #306	; 0x132
    330c:	e19430b3 	ldrh	r3, [r4, r3]
    3310:	e3130004 	tst	r3, #4
    3314:	1a0005c7 	bne	4a38 <ipu_init_channel_buffer+0x1800>
    3318:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    331c:	ebfffffe 	bl	6d4 <bytes_per_pixel>
    3320:	e59d301c 	ldr	r3, [sp, #28]
    3324:	e0000390 	mul	r0, r0, r3
    3328:	e1500007 	cmp	r0, r7
    332c:	21a07000 	movcs	r7, r0
    3330:	e2173003 	ands	r3, r7, #3
    3334:	e58d3044 	str	r3, [sp, #68]	; 0x44
    3338:	1a000921 	bne	57c4 <ipu_init_channel_buffer+0x258c>
    333c:	e246b00b 	sub	fp, r6, #11
    3340:	e35b000b 	cmp	fp, #11
    3344:	83a03000 	movhi	r3, #0
    3348:	93a03001 	movls	r3, #1
    334c:	e3560011 	cmp	r6, #17
    3350:	03a03000 	moveq	r3, #0
    3354:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    3358:	e3560012 	cmp	r6, #18
    335c:	03a03000 	moveq	r3, #0
    3360:	12033001 	andne	r3, r3, #1
    3364:	e3530000 	cmp	r3, #0
    3368:	e58d3034 	str	r3, [sp, #52]	; 0x34
    336c:	1a00006a 	bne	351c <ipu_init_channel_buffer+0x2e4>
    3370:	e246202d 	sub	r2, r6, #45	; 0x2d
    3374:	e3520005 	cmp	r2, #5
    3378:	9a000067 	bls	351c <ipu_init_channel_buffer+0x2e4>
    337c:	e3560005 	cmp	r6, #5
    3380:	0a0000b2 	beq	3650 <ipu_init_channel_buffer+0x418>
    3384:	e2463008 	sub	r3, r6, #8
    3388:	e3530002 	cmp	r3, #2
    338c:	e58d3020 	str	r3, [sp, #32]
    3390:	83a08000 	movhi	r8, #0
    3394:	93a08001 	movls	r8, #1
    3398:	e356000d 	cmp	r6, #13
    339c:	11a02008 	movne	r2, r8
    33a0:	03882001 	orreq	r2, r8, #1
    33a4:	e3520000 	cmp	r2, #0
    33a8:	0a0000ca 	beq	36d8 <ipu_init_channel_buffer+0x4a0>
    33ac:	e59d3018 	ldr	r3, [sp, #24]
    33b0:	e5932004 	ldr	r2, [r3, #4]
    33b4:	e3520000 	cmp	r2, #0
    33b8:	1a000071 	bne	3584 <ipu_init_channel_buffer+0x34c>
    33bc:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    33c0:	e3530000 	cmp	r3, #0
    33c4:	1a000909 	bne	57f0 <ipu_init_channel_buffer+0x25b8>
    33c8:	e59d5018 	ldr	r5, [sp, #24]
    33cc:	e2853d79 	add	r3, r5, #7744	; 0x1e40
    33d0:	e2833008 	add	r3, r3, #8
    33d4:	e1a00003 	mov	r0, r3
    33d8:	e58d3040 	str	r3, [sp, #64]	; 0x40
    33dc:	ebfffffe 	bl	0 <mutex_lock>
    33e0:	e3a01040 	mov	r1, #64	; 0x40
    33e4:	e28d0050 	add	r0, sp, #80	; 0x50
    33e8:	ebfffffe 	bl	0 <__memzero>
    33ec:	e59d105c 	ldr	r1, [sp, #92]	; 0x5c
    33f0:	e3580000 	cmp	r8, #0
    33f4:	e59d301c 	ldr	r3, [sp, #28]
    33f8:	e59d0060 	ldr	r0, [sp, #96]	; 0x60
    33fc:	e2432001 	sub	r2, r3, #1
    3400:	e1811e82 	orr	r1, r1, r2, lsl #29
    3404:	e18021a2 	orr	r2, r0, r2, lsr #3
    3408:	e58d105c 	str	r1, [sp, #92]	; 0x5c
    340c:	1a00004d 	bne	3548 <ipu_init_channel_buffer+0x310>
    3410:	e59d3018 	ldr	r3, [sp, #24]
    3414:	e59d007c 	ldr	r0, [sp, #124]	; 0x7c
    3418:	e2835a01 	add	r5, r3, #4096	; 0x1000
    341c:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    3420:	e2471001 	sub	r1, r7, #1
    3424:	e1801301 	orr	r1, r0, r1, lsl #6
    3428:	e243c001 	sub	ip, r3, #1
    342c:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    3430:	e182250c 	orr	r2, r2, ip, lsl #10
    3434:	e58d2060 	str	r2, [sp, #96]	; 0x60
    3438:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    343c:	e59d2074 	ldr	r2, [sp, #116]	; 0x74
    3440:	e59d0070 	ldr	r0, [sp, #112]	; 0x70
    3444:	e1a011a3 	lsr	r1, r3, #3
    3448:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    344c:	e1a0c1a3 	lsr	ip, r3, #3
    3450:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    3454:	e1811e8c 	orr	r1, r1, ip, lsl #29
    3458:	e3130007 	tst	r3, #7
    345c:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    3460:	e1801001 	orr	r1, r0, r1
    3464:	e58d1070 	str	r1, [sp, #112]	; 0x70
    3468:	e1822323 	orr	r2, r2, r3, lsr #6
    346c:	e58d2074 	str	r2, [sp, #116]	; 0x74
    3470:	1a000092 	bne	36c0 <ipu_init_channel_buffer+0x488>
    3474:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    3478:	e3130007 	tst	r3, #7
    347c:	1a000089 	bne	36a8 <ipu_init_channel_buffer+0x470>
    3480:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    3484:	e3032459 	movw	r2, #13401	; 0x3459
    3488:	e3432434 	movt	r2, #13364	; 0x3434
    348c:	e1510002 	cmp	r1, r2
    3490:	0a00088e 	beq	56d0 <ipu_init_channel_buffer+0x2498>
    3494:	8a00004b 	bhi	35c8 <ipu_init_channel_buffer+0x390>
    3498:	e305264e 	movw	r2, #22094	; 0x564e
    349c:	e3432231 	movt	r2, #12849	; 0x3231
    34a0:	e1510002 	cmp	r1, r2
    34a4:	0a000868 	beq	564c <ipu_init_channel_buffer+0x2414>
    34a8:	9a000462 	bls	4638 <ipu_init_channel_buffer+0x1400>
    34ac:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    34b0:	e3042752 	movw	r2, #18258	; 0x4752
    34b4:	e3432342 	movt	r2, #13122	; 0x3342
    34b8:	e1510002 	cmp	r1, r2
    34bc:	0a000883 	beq	56d0 <ipu_init_channel_buffer+0x2498>
    34c0:	9a00008d 	bls	36fc <ipu_init_channel_buffer+0x4c4>
    34c4:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    34c8:	e3033434 	movw	r3, #13364	; 0x3434
    34cc:	e3433434 	movt	r3, #13364	; 0x3434
    34d0:	e1520003 	cmp	r2, r3
    34d4:	0a000889 	beq	5700 <ipu_init_channel_buffer+0x24c8>
    34d8:	e3033456 	movw	r3, #13398	; 0x3456
    34dc:	e3433434 	movt	r3, #13364	; 0x3434
    34e0:	e1520003 	cmp	r2, r3
    34e4:	0a000785 	beq	5300 <ipu_init_channel_buffer+0x20c8>
    34e8:	e3043742 	movw	r3, #18242	; 0x4742
    34ec:	e3433352 	movt	r3, #13138	; 0x3352
    34f0:	e1520003 	cmp	r2, r3
    34f4:	0a000838 	beq	55dc <ipu_init_channel_buffer+0x23a4>
    34f8:	e3001000 	movw	r1, #0
    34fc:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    3500:	e3401000 	movt	r1, #0
    3504:	ebfffffe 	bl	0 <dev_err>
    3508:	e19a3009 	orrs	r3, sl, r9
    350c:	1a0000eb 	bne	38c0 <ipu_init_channel_buffer+0x688>
    3510:	e3a07000 	mov	r7, #0
    3514:	e1a08007 	mov	r8, r7
    3518:	ea00010b 	b	394c <ipu_init_channel_buffer+0x714>
    351c:	e59d301c 	ldr	r3, [sp, #28]
    3520:	e3130007 	tst	r3, #7
    3524:	0affff94 	beq	337c <ipu_init_channel_buffer+0x144>
    3528:	e59d3018 	ldr	r3, [sp, #24]
    352c:	e3001000 	movw	r1, #0
    3530:	e3401000 	movt	r1, #0
    3534:	e2833a01 	add	r3, r3, #4096	; 0x1000
    3538:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    353c:	ebfffffe 	bl	0 <dev_err>
    3540:	e3e00015 	mvn	r0, #21
    3544:	ea000312 	b	4194 <ipu_init_channel_buffer+0xf5c>
    3548:	e2855a01 	add	r5, r5, #4096	; 0x1000
    354c:	e59d007c 	ldr	r0, [sp, #124]	; 0x7c
    3550:	e5951ebc 	ldr	r1, [r5, #3772]	; 0xebc
    3554:	e3510000 	cmp	r1, #0
    3558:	1affffaf 	bne	341c <ipu_init_channel_buffer+0x1e4>
    355c:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    3560:	e1a01387 	lsl	r1, r7, #7
    3564:	e2411040 	sub	r1, r1, #64	; 0x40
    3568:	e1811000 	orr	r1, r1, r0
    356c:	e1a0c0a3 	lsr	ip, r3, #1
    3570:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    3574:	e24cc001 	sub	ip, ip, #1
    3578:	e182250c 	orr	r2, r2, ip, lsl #10
    357c:	e58d2060 	str	r2, [sp, #96]	; 0x60
    3580:	eaffffac 	b	3438 <ipu_init_channel_buffer+0x200>
    3584:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    3588:	e2932000 	adds	r2, r3, #0
    358c:	e59d30cc 	ldr	r3, [sp, #204]	; 0xcc
    3590:	13a02001 	movne	r2, #1
    3594:	e3530000 	cmp	r3, #0
    3598:	13a02000 	movne	r2, #0
    359c:	e3520000 	cmp	r2, #0
    35a0:	0affff88 	beq	33c8 <ipu_init_channel_buffer+0x190>
    35a4:	e59d3018 	ldr	r3, [sp, #24]
    35a8:	e3001000 	movw	r1, #0
    35ac:	e1a02006 	mov	r2, r6
    35b0:	e3401000 	movt	r1, #0
    35b4:	e2833a01 	add	r3, r3, #4096	; 0x1000
    35b8:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    35bc:	ebfffffe 	bl	0 <dev_err>
    35c0:	e3e00015 	mvn	r0, #21
    35c4:	ea0002f2 	b	4194 <ipu_init_channel_buffer+0xf5c>
    35c8:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    35cc:	e3032234 	movw	r2, #12852	; 0x3234
    35d0:	e3452032 	movt	r2, #20530	; 0x5032
    35d4:	e1530002 	cmp	r3, r2
    35d8:	0a0007e4 	beq	5570 <ipu_init_channel_buffer+0x2338>
    35dc:	9a000077 	bls	37c0 <ipu_init_channel_buffer+0x588>
    35e0:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    35e4:	e3042241 	movw	r2, #16961	; 0x4241
    35e8:	e3452247 	movt	r2, #21063	; 0x5247
    35ec:	e1510002 	cmp	r1, r2
    35f0:	0a0007eb 	beq	55a4 <ipu_init_channel_buffer+0x236c>
    35f4:	9a000052 	bls	3744 <ipu_init_channel_buffer+0x50c>
    35f8:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    35fc:	e3053559 	movw	r3, #21849	; 0x5559
    3600:	e3453659 	movt	r3, #22105	; 0x5659
    3604:	e1520003 	cmp	r2, r3
    3608:	0a0007ff 	beq	560c <ipu_init_channel_buffer+0x23d4>
    360c:	e3053955 	movw	r3, #22869	; 0x5955
    3610:	e3453956 	movt	r3, #22870	; 0x5956
    3614:	e1520003 	cmp	r2, r3
    3618:	1a000756 	bne	5378 <ipu_init_channel_buffer+0x2140>
    361c:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    3620:	e3580000 	cmp	r8, #0
    3624:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    3628:	e18a1009 	orr	r1, sl, r9
    362c:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    3630:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    3634:	0a000843 	beq	5748 <ipu_init_channel_buffer+0x2510>
    3638:	e3833505 	orr	r3, r3, #20971520	; 0x1400000
    363c:	e3510000 	cmp	r1, #0
    3640:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    3644:	e58d3078 	str	r3, [sp, #120]	; 0x78
    3648:	1a00009c 	bne	38c0 <ipu_init_channel_buffer+0x688>
    364c:	eaffffaf 	b	3510 <ipu_init_channel_buffer+0x2d8>
    3650:	e59d301c 	ldr	r3, [sp, #28]
    3654:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    3658:	e352000f 	cmp	r2, #15
    365c:	8353000f 	cmphi	r3, #15
    3660:	93a08001 	movls	r8, #1
    3664:	83a08000 	movhi	r8, #0
    3668:	9a000843 	bls	577c <ipu_init_channel_buffer+0x2544>
    366c:	e3130001 	tst	r3, #1
    3670:	1a000841 	bne	577c <ipu_init_channel_buffer+0x2544>
    3674:	e3120003 	tst	r2, #3
    3678:	1a00083f 	bne	577c <ipu_init_channel_buffer+0x2544>
    367c:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    3680:	e203203d 	and	r2, r3, #61	; 0x3d
    3684:	e3e03002 	mvn	r3, #2
    3688:	e3520015 	cmp	r2, #21
    368c:	e58d3020 	str	r3, [sp, #32]
    3690:	1affff49 	bne	33bc <ipu_init_channel_buffer+0x184>
    3694:	e59d3018 	ldr	r3, [sp, #24]
    3698:	e5932004 	ldr	r2, [r3, #4]
    369c:	e3520000 	cmp	r2, #0
    36a0:	1affffb7 	bne	3584 <ipu_init_channel_buffer+0x34c>
    36a4:	eaffff44 	b	33bc <ipu_init_channel_buffer+0x184>
    36a8:	e3001000 	movw	r1, #0
    36ac:	e1a02006 	mov	r2, r6
    36b0:	e3401000 	movt	r1, #0
    36b4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    36b8:	ebfffffe 	bl	0 <dev_warn>
    36bc:	eaffff6f 	b	3480 <ipu_init_channel_buffer+0x248>
    36c0:	e3001000 	movw	r1, #0
    36c4:	e1a02006 	mov	r2, r6
    36c8:	e3401000 	movt	r1, #0
    36cc:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    36d0:	ebfffffe 	bl	0 <dev_warn>
    36d4:	eaffff66 	b	3474 <ipu_init_channel_buffer+0x23c>
    36d8:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    36dc:	e203103d 	and	r1, r3, #61	; 0x3d
    36e0:	e3510015 	cmp	r1, #21
    36e4:	0a000634 	beq	4fbc <ipu_init_channel_buffer+0x1d84>
    36e8:	e246101b 	sub	r1, r6, #27
    36ec:	e1a08002 	mov	r8, r2
    36f0:	e3510001 	cmp	r1, #1
    36f4:	9affff2c 	bls	33ac <ipu_init_channel_buffer+0x174>
    36f8:	eaffff2f 	b	33bc <ipu_init_channel_buffer+0x184>
    36fc:	e3052659 	movw	r2, #22105	; 0x5659
    3700:	e3432231 	movt	r2, #12849	; 0x3231
    3704:	e1510002 	cmp	r1, r2
    3708:	0a0006e0 	beq	5290 <ipu_init_channel_buffer+0x2058>
    370c:	e3053049 	movw	r3, #20553	; 0x5049
    3710:	e3433255 	movt	r3, #12885	; 0x3255
    3714:	e1510003 	cmp	r1, r3
    3718:	1affff76 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    371c:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    3720:	e19a2009 	orrs	r2, sl, r9
    3724:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    3728:	e38338c7 	orr	r3, r3, #13041664	; 0xc70000
    372c:	e3833903 	orr	r3, r3, #49152	; 0xc000
    3730:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    3734:	e58d3078 	str	r3, [sp, #120]	; 0x78
    3738:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    373c:	1a00005f 	bne	38c0 <ipu_init_channel_buffer+0x688>
    3740:	eaffff72 	b	3510 <ipu_init_channel_buffer+0x2d8>
    3744:	e3032434 	movw	r2, #13364	; 0x3434
    3748:	e3452034 	movt	r2, #20532	; 0x5034
    374c:	e1510002 	cmp	r1, r2
    3750:	0a0006de 	beq	52d0 <ipu_init_channel_buffer+0x2098>
    3754:	e3043752 	movw	r3, #18258	; 0x4752
    3758:	e3453042 	movt	r3, #20546	; 0x5042
    375c:	e1510003 	cmp	r1, r3
    3760:	1affff64 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    3764:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    3768:	e19a3009 	orrs	r3, sl, r9
    376c:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    3770:	e59d307c 	ldr	r3, [sp, #124]	; 0x7c
    3774:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    3778:	e38118e7 	orr	r1, r1, #15138816	; 0xe70000
    377c:	e3822a82 	orr	r2, r2, #532480	; 0x82000
    3780:	e3811903 	orr	r1, r1, #49152	; 0xc000
    3784:	e38334f2 	orr	r3, r3, #-234881024	; 0xf2000000
    3788:	e3822eca 	orr	r2, r2, #3232	; 0xca0
    378c:	e3833503 	orr	r3, r3, #12582912	; 0xc00000
    3790:	e3800b06 	orr	r0, r0, #6144	; 0x1800
    3794:	e58d1078 	str	r1, [sp, #120]	; 0x78
    3798:	e58d2080 	str	r2, [sp, #128]	; 0x80
    379c:	e58d307c 	str	r3, [sp, #124]	; 0x7c
    37a0:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    37a4:	1a000045 	bne	38c0 <ipu_init_channel_buffer+0x688>
    37a8:	eaffff58 	b	3510 <ipu_init_channel_buffer+0x2d8>
    37ac:	e3001000 	movw	r1, #0
    37b0:	e2840060 	add	r0, r4, #96	; 0x60
    37b4:	e3401000 	movt	r1, #0
    37b8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    37bc:	eafffeb2 	b	328c <ipu_init_channel_buffer+0x54>
    37c0:	e305264e 	movw	r2, #22094	; 0x564e
    37c4:	e3432631 	movt	r2, #13873	; 0x3631
    37c8:	e1530002 	cmp	r3, r2
    37cc:	0a00075e 	beq	554c <ipu_init_channel_buffer+0x2314>
    37d0:	9a000024 	bls	3868 <ipu_init_channel_buffer+0x630>
    37d4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    37d8:	e3042752 	movw	r2, #18258	; 0x4752
    37dc:	e3442142 	movt	r2, #16706	; 0x4142
    37e0:	e1530002 	cmp	r3, r2
    37e4:	0a0006fb 	beq	53d8 <ipu_init_channel_buffer+0x21a0>
    37e8:	e3042742 	movw	r2, #18242	; 0x4742
    37ec:	e3442152 	movt	r2, #16722	; 0x4152
    37f0:	e1530002 	cmp	r3, r2
    37f4:	0a000024 	beq	388c <ipu_init_channel_buffer+0x654>
    37f8:	e3052659 	movw	r2, #22105	; 0x5659
    37fc:	e3432631 	movt	r2, #13873	; 0x3631
    3800:	e1530002 	cmp	r3, r2
    3804:	1affff3b 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    3808:	e3590000 	cmp	r9, #0
    380c:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    3810:	059d302c 	ldreq	r3, [sp, #44]	; 0x2c
    3814:	e1a000a7 	lsr	r0, r7, #1
    3818:	11a01009 	movne	r1, r9
    381c:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    3820:	e58d2078 	str	r2, [sp, #120]	; 0x78
    3824:	00010397 	muleq	r1, r7, r3
    3828:	e35a0000 	cmp	sl, #0
    382c:	e1a07000 	mov	r7, r0
    3830:	008100a1 	addeq	r0, r1, r1, lsr #1
    3834:	0a0006a2 	beq	52c4 <ipu_init_channel_buffer+0x208c>
    3838:	e1a0000a 	mov	r0, sl
    383c:	e3570000 	cmp	r7, #0
    3840:	0a00001e 	beq	38c0 <ipu_init_channel_buffer+0x688>
    3844:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    3848:	e2473001 	sub	r3, r7, #1
    384c:	e1823003 	orr	r3, r2, r3
    3850:	e58d3080 	str	r3, [sp, #128]	; 0x80
    3854:	e18a3009 	orr	r3, sl, r9
    3858:	e3530000 	cmp	r3, #0
    385c:	01a09001 	moveq	r9, r1
    3860:	01a0a000 	moveq	sl, r0
    3864:	ea000015 	b	38c0 <ipu_init_channel_buffer+0x688>
    3868:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    386c:	e3043752 	movw	r3, #18258	; 0x4752
    3870:	e3433442 	movt	r3, #13378	; 0x3442
    3874:	e1520003 	cmp	r2, r3
    3878:	0a0006d6 	beq	53d8 <ipu_init_channel_buffer+0x21a0>
    387c:	e3043742 	movw	r3, #18242	; 0x4742
    3880:	e3433452 	movt	r3, #13394	; 0x3452
    3884:	e1520003 	cmp	r2, r3
    3888:	1affff1a 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    388c:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    3890:	e19a3009 	orrs	r3, sl, r9
    3894:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    3898:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    389c:	e1e02602 	mvn	r2, r2, lsl #12
    38a0:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    38a4:	e3833c62 	orr	r3, r3, #25088	; 0x6200
    38a8:	e1e02622 	mvn	r2, r2, lsr #12
    38ac:	e3811903 	orr	r1, r1, #49152	; 0xc000
    38b0:	e3833008 	orr	r3, r3, #8
    38b4:	e58d1078 	str	r1, [sp, #120]	; 0x78
    38b8:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    38bc:	0affff13 	beq	3510 <ipu_init_channel_buffer+0x2d8>
    38c0:	e35a0402 	cmp	sl, #33554432	; 0x2000000
    38c4:	3a000004 	bcc	38dc <ipu_init_channel_buffer+0x6a4>
    38c8:	e3001000 	movw	r1, #0
    38cc:	e1a02006 	mov	r2, r6
    38d0:	e3401000 	movt	r1, #0
    38d4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    38d8:	ebfffffe 	bl	0 <dev_warn>
    38dc:	e1a031a9 	lsr	r3, r9, #3
    38e0:	e1a07aaa 	lsr	r7, sl, #21
    38e4:	e1a081aa 	lsr	r8, sl, #3
    38e8:	e3590402 	cmp	r9, #33554432	; 0x2000000
    38ec:	e1877203 	orr	r7, r7, r3, lsl #4
    38f0:	e2099007 	and	r9, r9, #7
    38f4:	e1a08708 	lsl	r8, r8, #14
    38f8:	e20aa007 	and	sl, sl, #7
    38fc:	3a000004 	bcc	3914 <ipu_init_channel_buffer+0x6dc>
    3900:	e3001000 	movw	r1, #0
    3904:	e1a02006 	mov	r2, r6
    3908:	e3401000 	movt	r1, #0
    390c:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    3910:	ebfffffe 	bl	0 <dev_warn>
    3914:	e35a0000 	cmp	sl, #0
    3918:	0a000004 	beq	3930 <ipu_init_channel_buffer+0x6f8>
    391c:	e3001000 	movw	r1, #0
    3920:	e1a02006 	mov	r2, r6
    3924:	e3401000 	movt	r1, #0
    3928:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    392c:	ebfffffe 	bl	0 <dev_warn>
    3930:	e3590000 	cmp	r9, #0
    3934:	0a000004 	beq	394c <ipu_init_channel_buffer+0x714>
    3938:	e3001000 	movw	r1, #0
    393c:	e1a02006 	mov	r2, r6
    3940:	e3401000 	movt	r1, #0
    3944:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    3948:	ebfffffe 	bl	0 <dev_warn>
    394c:	e300314a 	movw	r3, #330	; 0x14a
    3950:	e59d2054 	ldr	r2, [sp, #84]	; 0x54
    3954:	e19410b3 	ldrh	r1, [r4, r3]
    3958:	e1a00306 	lsl	r0, r6, #6
    395c:	e59d3058 	ldr	r3, [sp, #88]	; 0x58
    3960:	e5959d78 	ldr	r9, [r5, #3448]	; 0xd78
    3964:	e1828008 	orr	r8, r2, r8
    3968:	e3110004 	tst	r1, #4
    396c:	e58d0038 	str	r0, [sp, #56]	; 0x38
    3970:	e1837007 	orr	r7, r3, r7
    3974:	e58d8054 	str	r8, [sp, #84]	; 0x54
    3978:	e58d7058 	str	r7, [sp, #88]	; 0x58
    397c:	e0899000 	add	r9, r9, r0
    3980:	1a000432 	bne	4a50 <ipu_init_channel_buffer+0x1818>
    3984:	e28d7050 	add	r7, sp, #80	; 0x50
    3988:	e2898014 	add	r8, r9, #20
    398c:	e1a0b007 	mov	fp, r7
    3990:	e1a0a009 	mov	sl, r9
    3994:	f57ff04e 	dsb	st
    3998:	ebfffffe 	bl	0 <arm_heavy_mb>
    399c:	e49b3004 	ldr	r3, [fp], #4
    39a0:	e58a3000 	str	r3, [sl]
    39a4:	e28aa004 	add	sl, sl, #4
    39a8:	e15a0008 	cmp	sl, r8
    39ac:	1afffff8 	bne	3994 <ipu_init_channel_buffer+0x75c>
    39b0:	e28d8070 	add	r8, sp, #112	; 0x70
    39b4:	e289a020 	add	sl, r9, #32
    39b8:	e1a0b008 	mov	fp, r8
    39bc:	e2899034 	add	r9, r9, #52	; 0x34
    39c0:	f57ff04e 	dsb	st
    39c4:	ebfffffe 	bl	0 <arm_heavy_mb>
    39c8:	e49b3004 	ldr	r3, [fp], #4
    39cc:	e58a3000 	str	r3, [sl]
    39d0:	e28aa004 	add	sl, sl, #4
    39d4:	e15a0009 	cmp	sl, r9
    39d8:	1afffff8 	bne	39c0 <ipu_init_channel_buffer+0x788>
    39dc:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    39e0:	e3530000 	cmp	r3, #0
    39e4:	0a000026 	beq	3a84 <ipu_init_channel_buffer+0x84c>
    39e8:	e59d3020 	ldr	r3, [sp, #32]
    39ec:	e3530014 	cmp	r3, #20
    39f0:	8a000023 	bhi	3a84 <ipu_init_channel_buffer+0x84c>
    39f4:	e300a000 	movw	sl, #0
    39f8:	e340a000 	movt	sl, #0
    39fc:	e79aa103 	ldr	sl, [sl, r3, lsl #2]
    3a00:	e35a0000 	cmp	sl, #0
    3a04:	da00001e 	ble	3a84 <ipu_init_channel_buffer+0x84c>
    3a08:	e59d3070 	ldr	r3, [sp, #112]	; 0x70
    3a0c:	e59d20d0 	ldr	r2, [sp, #208]	; 0xd0
    3a10:	e3120007 	tst	r2, #7
    3a14:	e18331a2 	orr	r3, r3, r2, lsr #3
    3a18:	e58d3070 	str	r3, [sp, #112]	; 0x70
    3a1c:	1a000595 	bne	5078 <ipu_init_channel_buffer+0x1e40>
    3a20:	e3003162 	movw	r3, #354	; 0x162
    3a24:	e5959d78 	ldr	r9, [r5, #3448]	; 0xd78
    3a28:	e19430b3 	ldrh	r3, [r4, r3]
    3a2c:	e1a0a30a 	lsl	sl, sl, #6
    3a30:	e089b00a 	add	fp, r9, sl
    3a34:	e3130004 	tst	r3, #4
    3a38:	1a000757 	bne	579c <ipu_init_channel_buffer+0x2564>
    3a3c:	e28ba014 	add	sl, fp, #20
    3a40:	e1a0900b 	mov	r9, fp
    3a44:	f57ff04e 	dsb	st
    3a48:	ebfffffe 	bl	0 <arm_heavy_mb>
    3a4c:	e4973004 	ldr	r3, [r7], #4
    3a50:	e5893000 	str	r3, [r9]
    3a54:	e2899004 	add	r9, r9, #4
    3a58:	e159000a 	cmp	r9, sl
    3a5c:	1afffff8 	bne	3a44 <ipu_init_channel_buffer+0x80c>
    3a60:	e28b7020 	add	r7, fp, #32
    3a64:	e28b9034 	add	r9, fp, #52	; 0x34
    3a68:	f57ff04e 	dsb	st
    3a6c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3a70:	e4983004 	ldr	r3, [r8], #4
    3a74:	e5873000 	str	r3, [r7]
    3a78:	e2877004 	add	r7, r7, #4
    3a7c:	e1570009 	cmp	r7, r9
    3a80:	1afffff8 	bne	3a68 <ipu_init_channel_buffer+0x830>
    3a84:	e246800e 	sub	r8, r6, #14
    3a88:	e3580001 	cmp	r8, #1
    3a8c:	9a00023f 	bls	4390 <ipu_init_channel_buffer+0x1158>
    3a90:	e2463017 	sub	r3, r6, #23
    3a94:	e3d33004 	bics	r3, r3, #4
    3a98:	1a000006 	bne	3ab8 <ipu_init_channel_buffer+0x880>
    3a9c:	e59d3018 	ldr	r3, [sp, #24]
    3aa0:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    3aa4:	e0832c42 	add	r2, r3, r2, asr #24
    3aa8:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    3aac:	e7d23003 	ldrb	r3, [r2, r3]
    3ab0:	e3530000 	cmp	r3, #0
    3ab4:	1a000296 	bne	4514 <ipu_init_channel_buffer+0x12dc>
    3ab8:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3abc:	e3530000 	cmp	r3, #0
    3ac0:	0a000025 	beq	3b5c <ipu_init_channel_buffer+0x924>
    3ac4:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    3ac8:	e1a07306 	lsl	r7, r6, #6
    3acc:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3ad0:	e287700c 	add	r7, r7, #12
    3ad4:	e6ef8072 	uxtb	r8, r2
    3ad8:	e0833007 	add	r3, r3, r7
    3adc:	e6ff8f38 	rbit	r8, r8
    3ae0:	e5939000 	ldr	r9, [r3]
    3ae4:	f57ff04f 	dsb	sy
    3ae8:	e1a08ea8 	lsr	r8, r8, #29
    3aec:	e3c9950e 	bic	r9, r9, #58720256	; 0x3800000
    3af0:	e1a08b88 	lsl	r8, r8, #23
    3af4:	e1899008 	orr	r9, r9, r8
    3af8:	f57ff04e 	dsb	st
    3afc:	ebfffffe 	bl	0 <arm_heavy_mb>
    3b00:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3b04:	e0837007 	add	r7, r3, r7
    3b08:	e5879000 	str	r9, [r7]
    3b0c:	e59d2020 	ldr	r2, [sp, #32]
    3b10:	e3520014 	cmp	r2, #20
    3b14:	8a000010 	bhi	3b5c <ipu_init_channel_buffer+0x924>
    3b18:	e300a000 	movw	sl, #0
    3b1c:	e340a000 	movt	sl, #0
    3b20:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    3b24:	e3520000 	cmp	r2, #0
    3b28:	da00000b 	ble	3b5c <ipu_init_channel_buffer+0x924>
    3b2c:	e1a02302 	lsl	r2, r2, #6
    3b30:	e282700c 	add	r7, r2, #12
    3b34:	e0833007 	add	r3, r3, r7
    3b38:	e5933000 	ldr	r3, [r3]
    3b3c:	f57ff04f 	dsb	sy
    3b40:	e3c3350e 	bic	r3, r3, #58720256	; 0x3800000
    3b44:	e1888003 	orr	r8, r8, r3
    3b48:	f57ff04e 	dsb	st
    3b4c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3b50:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3b54:	e0837007 	add	r7, r3, r7
    3b58:	e5878000 	str	r8, [r7]
    3b5c:	e59d303c 	ldr	r3, [sp, #60]	; 0x3c
    3b60:	e3530000 	cmp	r3, #0
    3b64:	0a0001e8 	beq	430c <ipu_init_channel_buffer+0x10d4>
    3b68:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    3b6c:	e3530000 	cmp	r3, #0
    3b70:	0a0001e7 	beq	4314 <ipu_init_channel_buffer+0x10dc>
    3b74:	e1a07206 	lsl	r7, r6, #4
    3b78:	e59d201c 	ldr	r2, [sp, #28]
    3b7c:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3b80:	e287900a 	add	r9, r7, #10
    3b84:	e1a08007 	mov	r8, r7
    3b88:	e1a09109 	lsl	r9, r9, #2
    3b8c:	e312000f 	tst	r2, #15
    3b90:	e0833009 	add	r3, r3, r9
    3b94:	1a00023a 	bne	4484 <ipu_init_channel_buffer+0x124c>
    3b98:	e593a000 	ldr	sl, [r3]
    3b9c:	f57ff04f 	dsb	sy
    3ba0:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    3ba4:	e38aa90f 	orr	sl, sl, #245760	; 0x3c000
    3ba8:	f57ff04e 	dsb	st
    3bac:	ebfffffe 	bl	0 <arm_heavy_mb>
    3bb0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3bb4:	e0832009 	add	r2, r3, r9
    3bb8:	e582a000 	str	sl, [r2]
    3bbc:	e59d2020 	ldr	r2, [sp, #32]
    3bc0:	e3520014 	cmp	r2, #20
    3bc4:	8a000225 	bhi	4460 <ipu_init_channel_buffer+0x1228>
    3bc8:	e300a000 	movw	sl, #0
    3bcc:	e340a000 	movt	sl, #0
    3bd0:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    3bd4:	e3520000 	cmp	r2, #0
    3bd8:	ca00051e 	bgt	5058 <ipu_init_channel_buffer+0x1e20>
    3bdc:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    3be0:	e59d0018 	ldr	r0, [sp, #24]
    3be4:	ebfffffe 	bl	bdd8 <_ipu_disp_chan_is_interlaced>
    3be8:	e3500000 	cmp	r0, #0
    3bec:	0a0001df 	beq	4370 <ipu_init_channel_buffer+0x1138>
    3bf0:	e287900a 	add	r9, r7, #10
    3bf4:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3bf8:	e1a09109 	lsl	r9, r9, #2
    3bfc:	e1a08007 	mov	r8, r7
    3c00:	e249b01c 	sub	fp, r9, #28
    3c04:	e59d2020 	ldr	r2, [sp, #32]
    3c08:	e79aa102 	ldr	sl, [sl, r2, lsl #2]
    3c0c:	e083300b 	add	r3, r3, fp
    3c10:	e5937000 	ldr	r7, [r3]
    3c14:	f57ff04f 	dsb	sy
    3c18:	e3877802 	orr	r7, r7, #131072	; 0x20000
    3c1c:	f57ff04e 	dsb	st
    3c20:	ebfffffe 	bl	0 <arm_heavy_mb>
    3c24:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3c28:	e083b00b 	add	fp, r3, fp
    3c2c:	e58b7000 	str	r7, [fp]
    3c30:	e35a0000 	cmp	sl, #0
    3c34:	da00000a 	ble	3c64 <ipu_init_channel_buffer+0xa2c>
    3c38:	e1a0730a 	lsl	r7, sl, #6
    3c3c:	e287700c 	add	r7, r7, #12
    3c40:	e0833007 	add	r3, r3, r7
    3c44:	e593b000 	ldr	fp, [r3]
    3c48:	f57ff04f 	dsb	sy
    3c4c:	e38bb802 	orr	fp, fp, #131072	; 0x20000
    3c50:	f57ff04e 	dsb	st
    3c54:	ebfffffe 	bl	0 <arm_heavy_mb>
    3c58:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3c5c:	e0837007 	add	r7, r3, r7
    3c60:	e587b000 	str	fp, [r7]
    3c64:	e288800b 	add	r8, r8, #11
    3c68:	e1a08108 	lsl	r8, r8, #2
    3c6c:	e0833008 	add	r3, r3, r8
    3c70:	e5937000 	ldr	r7, [r3]
    3c74:	f57ff04f 	dsb	sy
    3c78:	e7ed7357 	ubfx	r7, r7, #6, #14
    3c7c:	e2877001 	add	r7, r7, #1
    3c80:	e3170007 	tst	r7, #7
    3c84:	1a00021c 	bne	44fc <ipu_init_channel_buffer+0x12c4>
    3c88:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3c8c:	e2481008 	sub	r1, r8, #8
    3c90:	e58d103c 	str	r1, [sp, #60]	; 0x3c
    3c94:	e0833001 	add	r3, r3, r1
    3c98:	e593b000 	ldr	fp, [r3]
    3c9c:	f57ff04f 	dsb	sy
    3ca0:	e1a021a7 	lsr	r2, r7, #3
    3ca4:	e3cbb33f 	bic	fp, fp, #-67108864	; 0xfc000000
    3ca8:	e1a02d02 	lsl	r2, r2, #26
    3cac:	e18bb002 	orr	fp, fp, r2
    3cb0:	e58d204c 	str	r2, [sp, #76]	; 0x4c
    3cb4:	f57ff04e 	dsb	st
    3cb8:	ebfffffe 	bl	0 <arm_heavy_mb>
    3cbc:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3cc0:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    3cc4:	e0831001 	add	r1, r3, r1
    3cc8:	e581b000 	str	fp, [r1]
    3ccc:	e0833009 	add	r3, r3, r9
    3cd0:	e5931000 	ldr	r1, [r3]
    3cd4:	f57ff04f 	dsb	sy
    3cd8:	e3a0b903 	mov	fp, #49152	; 0xc000
    3cdc:	e1a034a7 	lsr	r3, r7, #9
    3ce0:	e34fbfff 	movt	fp, #65535	; 0xffff
    3ce4:	e001100b 	and	r1, r1, fp
    3ce8:	e58d3048 	str	r3, [sp, #72]	; 0x48
    3cec:	e1811003 	orr	r1, r1, r3
    3cf0:	e58d103c 	str	r1, [sp, #60]	; 0x3c
    3cf4:	f57ff04e 	dsb	st
    3cf8:	ebfffffe 	bl	0 <arm_heavy_mb>
    3cfc:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3d00:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    3d04:	e0839009 	add	r9, r3, r9
    3d08:	e5891000 	str	r1, [r9]
    3d0c:	e35a0000 	cmp	sl, #0
    3d10:	da00001a 	ble	3d80 <ipu_init_channel_buffer+0xb48>
    3d14:	e1a0930a 	lsl	r9, sl, #6
    3d18:	e2899024 	add	r9, r9, #36	; 0x24
    3d1c:	e0833009 	add	r3, r3, r9
    3d20:	e5933000 	ldr	r3, [r3]
    3d24:	f57ff04f 	dsb	sy
    3d28:	e59d204c 	ldr	r2, [sp, #76]	; 0x4c
    3d2c:	e3c3333f 	bic	r3, r3, #-67108864	; 0xfc000000
    3d30:	e1822003 	orr	r2, r2, r3
    3d34:	e58d203c 	str	r2, [sp, #60]	; 0x3c
    3d38:	f57ff04e 	dsb	st
    3d3c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3d40:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3d44:	e59d203c 	ldr	r2, [sp, #60]	; 0x3c
    3d48:	e0831009 	add	r1, r3, r9
    3d4c:	e5812000 	str	r2, [r1]
    3d50:	e2899004 	add	r9, r9, #4
    3d54:	e0833009 	add	r3, r3, r9
    3d58:	e5933000 	ldr	r3, [r3]
    3d5c:	f57ff04f 	dsb	sy
    3d60:	e003000b 	and	r0, r3, fp
    3d64:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    3d68:	e183b000 	orr	fp, r3, r0
    3d6c:	f57ff04e 	dsb	st
    3d70:	ebfffffe 	bl	0 <arm_heavy_mb>
    3d74:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3d78:	e0839009 	add	r9, r3, r9
    3d7c:	e589b000 	str	fp, [r9]
    3d80:	e0833008 	add	r3, r3, r8
    3d84:	e5939000 	ldr	r9, [r3]
    3d88:	f57ff04f 	dsb	sy
    3d8c:	e3a0b03f 	mov	fp, #63	; 0x3f
    3d90:	e1a07387 	lsl	r7, r7, #7
    3d94:	e34fbff0 	movt	fp, #65520	; 0xfff0
    3d98:	e2477040 	sub	r7, r7, #64	; 0x40
    3d9c:	e009900b 	and	r9, r9, fp
    3da0:	e1899007 	orr	r9, r9, r7
    3da4:	f57ff04e 	dsb	st
    3da8:	ebfffffe 	bl	0 <arm_heavy_mb>
    3dac:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3db0:	e0838008 	add	r8, r3, r8
    3db4:	e5889000 	str	r9, [r8]
    3db8:	e35a0000 	cmp	sl, #0
    3dbc:	da00000b 	ble	3df0 <ipu_init_channel_buffer+0xbb8>
    3dc0:	e1a0a30a 	lsl	sl, sl, #6
    3dc4:	e28aa02c 	add	sl, sl, #44	; 0x2c
    3dc8:	e083300a 	add	r3, r3, sl
    3dcc:	e5933000 	ldr	r3, [r3]
    3dd0:	f57ff04f 	dsb	sy
    3dd4:	e00bb003 	and	fp, fp, r3
    3dd8:	e187700b 	orr	r7, r7, fp
    3ddc:	f57ff04e 	dsb	st
    3de0:	ebfffffe 	bl	0 <arm_heavy_mb>
    3de4:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3de8:	e083a00a 	add	sl, r3, sl
    3dec:	e58a7000 	str	r7, [sl]
    3df0:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
    3df4:	e3520000 	cmp	r2, #0
    3df8:	1a000003 	bne	3e0c <ipu_init_channel_buffer+0xbd4>
    3dfc:	e246202d 	sub	r2, r6, #45	; 0x2d
    3e00:	e3560005 	cmp	r6, #5
    3e04:	13520005 	cmpne	r2, #5
    3e08:	8a0001f1 	bhi	45d4 <ipu_init_channel_buffer+0x139c>
    3e0c:	e0833306 	add	r3, r3, r6, lsl #6
    3e10:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    3e14:	f57ff04f 	dsb	sy
    3e18:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    3e1c:	e7e62752 	ubfx	r2, r2, #14, #7
    3e20:	e2822001 	add	r2, r2, #1
    3e24:	e1a01006 	mov	r1, r6
    3e28:	e58d2000 	str	r2, [sp]
    3e2c:	e58d3004 	str	r3, [sp, #4]
    3e30:	e59d201c 	ldr	r2, [sp, #28]
    3e34:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    3e38:	e59d0018 	ldr	r0, [sp, #24]
    3e3c:	ebfffffe 	bl	a100 <_ipu_ic_idma_init>
    3e40:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3e44:	e356001c 	cmp	r6, #28
    3e48:	979ff106 	ldrls	pc, [pc, r6, lsl #2]
    3e4c:	ea000106 	b	426c <ipu_init_channel_buffer+0x1034>
    3e50:	00004204 	andeq	r4, r0, r4, lsl #4
    3e54:	00004204 	andeq	r4, r0, r4, lsl #4
    3e58:	00004204 	andeq	r4, r0, r4, lsl #4
    3e5c:	00004204 	andeq	r4, r0, r4, lsl #4
    3e60:	0000426c 	andeq	r4, r0, ip, ror #4
    3e64:	0000426c 	andeq	r4, r0, ip, ror #4
    3e68:	0000426c 	andeq	r4, r0, ip, ror #4
    3e6c:	0000426c 	andeq	r4, r0, ip, ror #4
    3e70:	0000426c 	andeq	r4, r0, ip, ror #4
    3e74:	0000426c 	andeq	r4, r0, ip, ror #4
    3e78:	0000426c 	andeq	r4, r0, ip, ror #4
    3e7c:	0000426c 	andeq	r4, r0, ip, ror #4
    3e80:	0000426c 	andeq	r4, r0, ip, ror #4
    3e84:	0000426c 	andeq	r4, r0, ip, ror #4
    3e88:	0000426c 	andeq	r4, r0, ip, ror #4
    3e8c:	0000426c 	andeq	r4, r0, ip, ror #4
    3e90:	0000426c 	andeq	r4, r0, ip, ror #4
    3e94:	0000426c 	andeq	r4, r0, ip, ror #4
    3e98:	0000426c 	andeq	r4, r0, ip, ror #4
    3e9c:	0000426c 	andeq	r4, r0, ip, ror #4
    3ea0:	0000426c 	andeq	r4, r0, ip, ror #4
    3ea4:	0000426c 	andeq	r4, r0, ip, ror #4
    3ea8:	0000426c 	andeq	r4, r0, ip, ror #4
    3eac:	000041d0 	ldrdeq	r4, [r0], -r0
    3eb0:	0000426c 	andeq	r4, r0, ip, ror #4
    3eb4:	0000426c 	andeq	r4, r0, ip, ror #4
    3eb8:	0000426c 	andeq	r4, r0, ip, ror #4
    3ebc:	0000419c 	muleq	r0, ip, r1
    3ec0:	00003ec4 	andeq	r3, r0, r4, asr #29
    3ec4:	e5958ed8 	ldr	r8, [r5, #3800]	; 0xed8
    3ec8:	e5937728 	ldr	r7, [r3, #1832]	; 0x728
    3ecc:	f57ff04f 	dsb	sy
    3ed0:	e1a08e88 	lsl	r8, r8, #29
    3ed4:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    3ed8:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    3edc:	e1877008 	orr	r7, r7, r8
    3ee0:	f57ff04e 	dsb	st
    3ee4:	ebfffffe 	bl	0 <arm_heavy_mb>
    3ee8:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3eec:	e5837728 	str	r7, [r3, #1832]	; 0x728
    3ef0:	e30171e8 	movw	r7, #4584	; 0x11e8
    3ef4:	e0833007 	add	r3, r3, r7
    3ef8:	e5933000 	ldr	r3, [r3]
    3efc:	f57ff04f 	dsb	sy
    3f00:	e3c33206 	bic	r3, r3, #1610612736	; 0x60000000
    3f04:	e1888003 	orr	r8, r8, r3
    3f08:	f57ff04e 	dsb	st
    3f0c:	ebfffffe 	bl	0 <arm_heavy_mb>
    3f10:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    3f14:	e0837007 	add	r7, r3, r7
    3f18:	e5878000 	str	r8, [r7]
    3f1c:	e1a072a6 	lsr	r7, r6, #5
    3f20:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    3f24:	e2877005 	add	r7, r7, #5
    3f28:	e1a07107 	lsl	r7, r7, #2
    3f2c:	e0833007 	add	r3, r3, r7
    3f30:	e5933000 	ldr	r3, [r3]
    3f34:	f57ff04f 	dsb	sy
    3f38:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
    3f3c:	e3a08001 	mov	r8, #1
    3f40:	e202201f 	and	r2, r2, #31
    3f44:	e1a08218 	lsl	r8, r8, r2
    3f48:	e1130008 	tst	r3, r8
    3f4c:	0a000003 	beq	3f60 <ipu_init_channel_buffer+0xd28>
    3f50:	e59d3018 	ldr	r3, [sp, #24]
    3f54:	e5933004 	ldr	r3, [r3, #4]
    3f58:	e3530003 	cmp	r3, #3
    3f5c:	0a0001cc 	beq	4694 <ipu_init_channel_buffer+0x145c>
    3f60:	e300317a 	movw	r3, #378	; 0x17a
    3f64:	e595cd78 	ldr	ip, [r5, #3448]	; 0xd78
    3f68:	e19430b3 	ldrh	r3, [r4, r3]
    3f6c:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    3f70:	e3130004 	tst	r3, #4
    3f74:	e08c9002 	add	r9, ip, r2
    3f78:	1a0003ed 	bne	4f34 <ipu_init_channel_buffer+0x1cfc>
    3f7c:	e3003192 	movw	r3, #402	; 0x192
    3f80:	e19430b3 	ldrh	r3, [r4, r3]
    3f84:	e3130004 	tst	r3, #4
    3f88:	1a0003d8 	bne	4ef0 <ipu_init_channel_buffer+0x1cb8>
    3f8c:	e30031aa 	movw	r3, #426	; 0x1aa
    3f90:	e19430b3 	ldrh	r3, [r4, r3]
    3f94:	e3130004 	tst	r3, #4
    3f98:	1a0003c7 	bne	4ebc <ipu_init_channel_buffer+0x1c84>
    3f9c:	e30031c2 	movw	r3, #450	; 0x1c2
    3fa0:	e19430b3 	ldrh	r3, [r4, r3]
    3fa4:	e3130004 	tst	r3, #4
    3fa8:	1a0003b6 	bne	4e88 <ipu_init_channel_buffer+0x1c50>
    3fac:	e30031da 	movw	r3, #474	; 0x1da
    3fb0:	e19430b3 	ldrh	r3, [r4, r3]
    3fb4:	e3130004 	tst	r3, #4
    3fb8:	1a0003a5 	bne	4e54 <ipu_init_channel_buffer+0x1c1c>
    3fbc:	e30031f2 	movw	r3, #498	; 0x1f2
    3fc0:	e19430b3 	ldrh	r3, [r4, r3]
    3fc4:	e3130004 	tst	r3, #4
    3fc8:	1a00038d 	bne	4e04 <ipu_init_channel_buffer+0x1bcc>
    3fcc:	e300320a 	movw	r3, #522	; 0x20a
    3fd0:	e19430b3 	ldrh	r3, [r4, r3]
    3fd4:	e3130004 	tst	r3, #4
    3fd8:	1a00037c 	bne	4dd0 <ipu_init_channel_buffer+0x1b98>
    3fdc:	e3003222 	movw	r3, #546	; 0x222
    3fe0:	e19430b3 	ldrh	r3, [r4, r3]
    3fe4:	e3130004 	tst	r3, #4
    3fe8:	1a00036b 	bne	4d9c <ipu_init_channel_buffer+0x1b64>
    3fec:	e300323a 	movw	r3, #570	; 0x23a
    3ff0:	e19430b3 	ldrh	r3, [r4, r3]
    3ff4:	e3130004 	tst	r3, #4
    3ff8:	1a000352 	bne	4d48 <ipu_init_channel_buffer+0x1b10>
    3ffc:	e3003252 	movw	r3, #594	; 0x252
    4000:	e19430b3 	ldrh	r3, [r4, r3]
    4004:	e3130004 	tst	r3, #4
    4008:	1a000341 	bne	4d14 <ipu_init_channel_buffer+0x1adc>
    400c:	e300326a 	movw	r3, #618	; 0x26a
    4010:	e19430b3 	ldrh	r3, [r4, r3]
    4014:	e3130004 	tst	r3, #4
    4018:	1a000330 	bne	4ce0 <ipu_init_channel_buffer+0x1aa8>
    401c:	e3003282 	movw	r3, #642	; 0x282
    4020:	e19430b3 	ldrh	r3, [r4, r3]
    4024:	e3130004 	tst	r3, #4
    4028:	1a00031f 	bne	4cac <ipu_init_channel_buffer+0x1a74>
    402c:	e300329a 	movw	r3, #666	; 0x29a
    4030:	e19430b3 	ldrh	r3, [r4, r3]
    4034:	e3130004 	tst	r3, #4
    4038:	1a000306 	bne	4c58 <ipu_init_channel_buffer+0x1a20>
    403c:	e30032b2 	movw	r3, #690	; 0x2b2
    4040:	e19430b3 	ldrh	r3, [r4, r3]
    4044:	e3130004 	tst	r3, #4
    4048:	1a0002f3 	bne	4c1c <ipu_init_channel_buffer+0x19e4>
    404c:	e30032ca 	movw	r3, #714	; 0x2ca
    4050:	e19430b3 	ldrh	r3, [r4, r3]
    4054:	e3130004 	tst	r3, #4
    4058:	1a0002e2 	bne	4be8 <ipu_init_channel_buffer+0x19b0>
    405c:	e30032e2 	movw	r3, #738	; 0x2e2
    4060:	e19430b3 	ldrh	r3, [r4, r3]
    4064:	e3130004 	tst	r3, #4
    4068:	1a0002d1 	bne	4bb4 <ipu_init_channel_buffer+0x197c>
    406c:	e30032fa 	movw	r3, #762	; 0x2fa
    4070:	e19430b3 	ldrh	r3, [r4, r3]
    4074:	e3130004 	tst	r3, #4
    4078:	1a0002c0 	bne	4b80 <ipu_init_channel_buffer+0x1948>
    407c:	e3003312 	movw	r3, #786	; 0x312
    4080:	e19430b3 	ldrh	r3, [r4, r3]
    4084:	e3130004 	tst	r3, #4
    4088:	1a0002af 	bne	4b4c <ipu_init_channel_buffer+0x1914>
    408c:	e300332a 	movw	r3, #810	; 0x32a
    4090:	e19430b3 	ldrh	r3, [r4, r3]
    4094:	e3130004 	tst	r3, #4
    4098:	1a00029e 	bne	4b18 <ipu_init_channel_buffer+0x18e0>
    409c:	e3003342 	movw	r3, #834	; 0x342
    40a0:	e19430b3 	ldrh	r3, [r4, r3]
    40a4:	e3130004 	tst	r3, #4
    40a8:	1a00028d 	bne	4ae4 <ipu_init_channel_buffer+0x18ac>
    40ac:	e300335a 	movw	r3, #858	; 0x35a
    40b0:	e19430b3 	ldrh	r3, [r4, r3]
    40b4:	e3130004 	tst	r3, #4
    40b8:	1a00027c 	bne	4ab0 <ipu_init_channel_buffer+0x1878>
    40bc:	e3003372 	movw	r3, #882	; 0x372
    40c0:	e19430b3 	ldrh	r3, [r4, r3]
    40c4:	e3130004 	tst	r3, #4
    40c8:	1a00026b 	bne	4a7c <ipu_init_channel_buffer+0x1844>
    40cc:	e59d30d0 	ldr	r3, [sp, #208]	; 0xd0
    40d0:	e2874f4f 	add	r4, r7, #316	; 0x13c
    40d4:	e1e09008 	mvn	r9, r8
    40d8:	e3530000 	cmp	r3, #0
    40dc:	e59d3018 	ldr	r3, [sp, #24]
    40e0:	e5932004 	ldr	r2, [r3, #4]
    40e4:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    40e8:	0a000083 	beq	42fc <ipu_init_channel_buffer+0x10c4>
    40ec:	e3520000 	cmp	r2, #0
    40f0:	1a000199 	bne	475c <ipu_init_channel_buffer+0x1524>
    40f4:	e3a02f4b 	mov	r2, #300	; 0x12c
    40f8:	e0833002 	add	r3, r3, r2
    40fc:	e593a000 	ldr	sl, [r3]
    4100:	f57ff04f 	dsb	sy
    4104:	e59d3018 	ldr	r3, [sp, #24]
    4108:	e00aa009 	and	sl, sl, r9
    410c:	e5933004 	ldr	r3, [r3, #4]
    4110:	e3530000 	cmp	r3, #0
    4114:	12876f59 	addne	r6, r7, #356	; 0x164
    4118:	03a06f4b 	moveq	r6, #300	; 0x12c
    411c:	f57ff04e 	dsb	st
    4120:	ebfffffe 	bl	0 <arm_heavy_mb>
    4124:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    4128:	e0836006 	add	r6, r3, r6
    412c:	e586a000 	str	sl, [r6]
    4130:	e0833004 	add	r3, r3, r4
    4134:	e5933000 	ldr	r3, [r3]
    4138:	f57ff04f 	dsb	sy
    413c:	e59d20cc 	ldr	r2, [sp, #204]	; 0xcc
    4140:	e3520000 	cmp	r2, #0
    4144:	11889003 	orrne	r9, r8, r3
    4148:	00099003 	andeq	r9, r9, r3
    414c:	f57ff04e 	dsb	st
    4150:	ebfffffe 	bl	0 <arm_heavy_mb>
    4154:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    4158:	e0834004 	add	r4, r3, r4
    415c:	e5849000 	str	r9, [r4]
    4160:	e59d3018 	ldr	r3, [sp, #24]
    4164:	e5933004 	ldr	r3, [r3, #4]
    4168:	e3530000 	cmp	r3, #0
    416c:	12877f8a 	addne	r7, r7, #552	; 0x228
    4170:	02877e11 	addeq	r7, r7, #272	; 0x110
    4174:	f57ff04e 	dsb	st
    4178:	ebfffffe 	bl	0 <arm_heavy_mb>
    417c:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    4180:	e0837007 	add	r7, r3, r7
    4184:	e5878000 	str	r8, [r7]
    4188:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    418c:	ebfffffe 	bl	0 <mutex_unlock>
    4190:	e3a00000 	mov	r0, #0
    4194:	e28dd094 	add	sp, sp, #148	; 0x94
    4198:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    419c:	e5958ed4 	ldr	r8, [r5, #3796]	; 0xed4
    41a0:	e59376e8 	ldr	r7, [r3, #1768]	; 0x6e8
    41a4:	f57ff04f 	dsb	sy
    41a8:	e1a08e88 	lsl	r8, r8, #29
    41ac:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    41b0:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    41b4:	e1877008 	orr	r7, r7, r8
    41b8:	f57ff04e 	dsb	st
    41bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    41c0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    41c4:	e58376e8 	str	r7, [r3, #1768]	; 0x6e8
    41c8:	e30171a8 	movw	r7, #4520	; 0x11a8
    41cc:	eaffff48 	b	3ef4 <ipu_init_channel_buffer+0xcbc>
    41d0:	e5958ed0 	ldr	r8, [r5, #3792]	; 0xed0
    41d4:	e59375e8 	ldr	r7, [r3, #1512]	; 0x5e8
    41d8:	f57ff04f 	dsb	sy
    41dc:	e1a08e88 	lsl	r8, r8, #29
    41e0:	e3c77206 	bic	r7, r7, #1610612736	; 0x60000000
    41e4:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    41e8:	e1877008 	orr	r7, r7, r8
    41ec:	f57ff04e 	dsb	st
    41f0:	ebfffffe 	bl	0 <arm_heavy_mb>
    41f4:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    41f8:	e58375e8 	str	r7, [r3, #1512]	; 0x5e8
    41fc:	e3017168 	movw	r7, #4456	; 0x1168
    4200:	eaffff3b 	b	3ef4 <ipu_init_channel_buffer+0xcbc>
    4204:	e1a07306 	lsl	r7, r6, #6
    4208:	e5958ecc 	ldr	r8, [r5, #3788]	; 0xecc
    420c:	e2877028 	add	r7, r7, #40	; 0x28
    4210:	e0833007 	add	r3, r3, r7
    4214:	e5939000 	ldr	r9, [r3]
    4218:	f57ff04f 	dsb	sy
    421c:	e1a08e88 	lsl	r8, r8, #29
    4220:	e3c99206 	bic	r9, r9, #1610612736	; 0x60000000
    4224:	e2088206 	and	r8, r8, #1610612736	; 0x60000000
    4228:	e1899008 	orr	r9, r9, r8
    422c:	f57ff04e 	dsb	st
    4230:	ebfffffe 	bl	0 <arm_heavy_mb>
    4234:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4238:	e0837007 	add	r7, r3, r7
    423c:	e5879000 	str	r9, [r7]
    4240:	e59d1020 	ldr	r1, [sp, #32]
    4244:	e3510014 	cmp	r1, #20
    4248:	8affff33 	bhi	3f1c <ipu_init_channel_buffer+0xce4>
    424c:	e3002000 	movw	r2, #0
    4250:	e3402000 	movt	r2, #0
    4254:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    4258:	e3520000 	cmp	r2, #0
    425c:	c1a02302 	lslgt	r2, r2, #6
    4260:	c2827028 	addgt	r7, r2, #40	; 0x28
    4264:	daffff2c 	ble	3f1c <ipu_init_channel_buffer+0xce4>
    4268:	eaffff21 	b	3ef4 <ipu_init_channel_buffer+0xcbc>
    426c:	e1a07306 	lsl	r7, r6, #6
    4270:	e5959edc 	ldr	r9, [r5, #3804]	; 0xedc
    4274:	e2877028 	add	r7, r7, #40	; 0x28
    4278:	e0833007 	add	r3, r3, r7
    427c:	e5938000 	ldr	r8, [r3]
    4280:	f57ff04f 	dsb	sy
    4284:	e1a09e89 	lsl	r9, r9, #29
    4288:	e3c88206 	bic	r8, r8, #1610612736	; 0x60000000
    428c:	e2099206 	and	r9, r9, #1610612736	; 0x60000000
    4290:	e1888009 	orr	r8, r8, r9
    4294:	f57ff04e 	dsb	st
    4298:	ebfffffe 	bl	0 <arm_heavy_mb>
    429c:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    42a0:	e0837007 	add	r7, r3, r7
    42a4:	e5878000 	str	r8, [r7]
    42a8:	e59d1020 	ldr	r1, [sp, #32]
    42ac:	e3510014 	cmp	r1, #20
    42b0:	8affff19 	bhi	3f1c <ipu_init_channel_buffer+0xce4>
    42b4:	e3002000 	movw	r2, #0
    42b8:	e3402000 	movt	r2, #0
    42bc:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    42c0:	e3520000 	cmp	r2, #0
    42c4:	daffff14 	ble	3f1c <ipu_init_channel_buffer+0xce4>
    42c8:	e1a02302 	lsl	r2, r2, #6
    42cc:	e2827028 	add	r7, r2, #40	; 0x28
    42d0:	e0833007 	add	r3, r3, r7
    42d4:	e5933000 	ldr	r3, [r3]
    42d8:	f57ff04f 	dsb	sy
    42dc:	e3c33206 	bic	r3, r3, #1610612736	; 0x60000000
    42e0:	e1899003 	orr	r9, r9, r3
    42e4:	f57ff04e 	dsb	st
    42e8:	ebfffffe 	bl	0 <arm_heavy_mb>
    42ec:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    42f0:	e0837007 	add	r7, r3, r7
    42f4:	e5879000 	str	r9, [r7]
    42f8:	eaffff07 	b	3f1c <ipu_init_channel_buffer+0xce4>
    42fc:	e3520000 	cmp	r2, #0
    4300:	12872f59 	addne	r2, r7, #356	; 0x164
    4304:	1affff7b 	bne	40f8 <ipu_init_channel_buffer+0xec0>
    4308:	eaffff79 	b	40f4 <ipu_init_channel_buffer+0xebc>
    430c:	e3560005 	cmp	r6, #5
    4310:	0afffe17 	beq	3b74 <ipu_init_channel_buffer+0x93c>
    4314:	e246302d 	sub	r3, r6, #45	; 0x2d
    4318:	e3530005 	cmp	r3, #5
    431c:	9a00015b 	bls	4890 <ipu_init_channel_buffer+0x1658>
    4320:	e2463017 	sub	r3, r6, #23
    4324:	e3530006 	cmp	r3, #6
    4328:	9a000312 	bls	4f78 <ipu_init_channel_buffer+0x1d40>
    432c:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    4330:	e59d0018 	ldr	r0, [sp, #24]
    4334:	ebfffffe 	bl	bdd8 <_ipu_disp_chan_is_interlaced>
    4338:	e3500000 	cmp	r0, #0
    433c:	0a00000b 	beq	4370 <ipu_init_channel_buffer+0x1138>
    4340:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4344:	e1a08206 	lsl	r8, r6, #4
    4348:	e59d2020 	ldr	r2, [sp, #32]
    434c:	e288900a 	add	r9, r8, #10
    4350:	e3520014 	cmp	r2, #20
    4354:	e1a09109 	lsl	r9, r9, #2
    4358:	83e0a015 	mvnhi	sl, #21
    435c:	e249b01c 	sub	fp, r9, #28
    4360:	8afffe29 	bhi	3c0c <ipu_init_channel_buffer+0x9d4>
    4364:	e300a000 	movw	sl, #0
    4368:	e340a000 	movt	sl, #0
    436c:	eafffe24 	b	3c04 <ipu_init_channel_buffer+0x9cc>
    4370:	e59d3018 	ldr	r3, [sp, #24]
    4374:	e0832006 	add	r2, r3, r6
    4378:	e3013dde 	movw	r3, #7646	; 0x1dde
    437c:	e7d22003 	ldrb	r2, [r2, r3]
    4380:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4384:	e3520000 	cmp	r2, #0
    4388:	0afffe98 	beq	3df0 <ipu_init_channel_buffer+0xbb8>
    438c:	eaffffec 	b	4344 <ipu_init_channel_buffer+0x110c>
    4390:	e59d3018 	ldr	r3, [sp, #24]
    4394:	e59d2028 	ldr	r2, [sp, #40]	; 0x28
    4398:	e0832c42 	add	r2, r3, r2, asr #24
    439c:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    43a0:	e7d23003 	ldrb	r3, [r2, r3]
    43a4:	e3530000 	cmp	r3, #0
    43a8:	1a000059 	bne	4514 <ipu_init_channel_buffer+0x12dc>
    43ac:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    43b0:	e3043742 	movw	r3, #18242	; 0x4742
    43b4:	e3443152 	movt	r3, #16722	; 0x4152
    43b8:	e1520003 	cmp	r2, r3
    43bc:	0a000007 	beq	43e0 <ipu_init_channel_buffer+0x11a8>
    43c0:	e3043241 	movw	r3, #16961	; 0x4241
    43c4:	e3453247 	movt	r3, #21063	; 0x5247
    43c8:	e1520003 	cmp	r2, r3
    43cc:	0a000003 	beq	43e0 <ipu_init_channel_buffer+0x11a8>
    43d0:	e3043752 	movw	r3, #18258	; 0x4752
    43d4:	e3443142 	movt	r3, #16706	; 0x4142
    43d8:	e1520003 	cmp	r2, r3
    43dc:	1afffdb5 	bne	3ab8 <ipu_init_channel_buffer+0x880>
    43e0:	e1a07306 	lsl	r7, r6, #6
    43e4:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    43e8:	e2877028 	add	r7, r7, #40	; 0x28
    43ec:	e0833007 	add	r3, r3, r7
    43f0:	e5938000 	ldr	r8, [r3]
    43f4:	f57ff04f 	dsb	sy
    43f8:	e3c88402 	bic	r8, r8, #33554432	; 0x2000000
    43fc:	f57ff04e 	dsb	st
    4400:	ebfffffe 	bl	0 <arm_heavy_mb>
    4404:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4408:	e0837007 	add	r7, r3, r7
    440c:	e5878000 	str	r8, [r7]
    4410:	e59d2020 	ldr	r2, [sp, #32]
    4414:	e3520014 	cmp	r2, #20
    4418:	8afffda6 	bhi	3ab8 <ipu_init_channel_buffer+0x880>
    441c:	e300a000 	movw	sl, #0
    4420:	e340a000 	movt	sl, #0
    4424:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4428:	e3520000 	cmp	r2, #0
    442c:	dafffda1 	ble	3ab8 <ipu_init_channel_buffer+0x880>
    4430:	e1a02302 	lsl	r2, r2, #6
    4434:	e2827028 	add	r7, r2, #40	; 0x28
    4438:	e0833007 	add	r3, r3, r7
    443c:	e5938000 	ldr	r8, [r3]
    4440:	f57ff04f 	dsb	sy
    4444:	e3c88402 	bic	r8, r8, #33554432	; 0x2000000
    4448:	f57ff04e 	dsb	st
    444c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4450:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4454:	e0837007 	add	r7, r3, r7
    4458:	e5878000 	str	r8, [r7]
    445c:	eafffd95 	b	3ab8 <ipu_init_channel_buffer+0x880>
    4460:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    4464:	e59d0018 	ldr	r0, [sp, #24]
    4468:	ebfffffe 	bl	bdd8 <_ipu_disp_chan_is_interlaced>
    446c:	e3500000 	cmp	r0, #0
    4470:	0affffbe 	beq	4370 <ipu_init_channel_buffer+0x1138>
    4474:	e249b01c 	sub	fp, r9, #28
    4478:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    447c:	e3e0a015 	mvn	sl, #21
    4480:	eafffde1 	b	3c0c <ipu_init_channel_buffer+0x9d4>
    4484:	e593a000 	ldr	sl, [r3]
    4488:	f57ff04f 	dsb	sy
    448c:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    4490:	e38aa907 	orr	sl, sl, #114688	; 0x1c000
    4494:	f57ff04e 	dsb	st
    4498:	ebfffffe 	bl	0 <arm_heavy_mb>
    449c:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    44a0:	e0832009 	add	r2, r3, r9
    44a4:	e582a000 	str	sl, [r2]
    44a8:	e59d2020 	ldr	r2, [sp, #32]
    44ac:	e3520014 	cmp	r2, #20
    44b0:	8affffea 	bhi	4460 <ipu_init_channel_buffer+0x1228>
    44b4:	e300a000 	movw	sl, #0
    44b8:	e340a000 	movt	sl, #0
    44bc:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    44c0:	e3520000 	cmp	r2, #0
    44c4:	dafffdc4 	ble	3bdc <ipu_init_channel_buffer+0x9a4>
    44c8:	e1a02302 	lsl	r2, r2, #6
    44cc:	e2828028 	add	r8, r2, #40	; 0x28
    44d0:	e0833008 	add	r3, r3, r8
    44d4:	e5939000 	ldr	r9, [r3]
    44d8:	f57ff04f 	dsb	sy
    44dc:	e3c9997f 	bic	r9, r9, #2080768	; 0x1fc000
    44e0:	e3899907 	orr	r9, r9, #114688	; 0x1c000
    44e4:	f57ff04e 	dsb	st
    44e8:	ebfffffe 	bl	0 <arm_heavy_mb>
    44ec:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    44f0:	e0838008 	add	r8, r3, r8
    44f4:	e5889000 	str	r9, [r8]
    44f8:	eafffdb7 	b	3bdc <ipu_init_channel_buffer+0x9a4>
    44fc:	e3001000 	movw	r1, #0
    4500:	e1a02006 	mov	r2, r6
    4504:	e3401000 	movt	r1, #0
    4508:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    450c:	ebfffffe 	bl	0 <dev_warn>
    4510:	eafffddc 	b	3c88 <ipu_init_channel_buffer+0xa50>
    4514:	e1a07306 	lsl	r7, r6, #6
    4518:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    451c:	e2877028 	add	r7, r7, #40	; 0x28
    4520:	e0833007 	add	r3, r3, r7
    4524:	e5939000 	ldr	r9, [r3]
    4528:	f57ff04f 	dsb	sy
    452c:	e3899402 	orr	r9, r9, #33554432	; 0x2000000
    4530:	f57ff04e 	dsb	st
    4534:	ebfffffe 	bl	0 <arm_heavy_mb>
    4538:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    453c:	e0832007 	add	r2, r3, r7
    4540:	e5829000 	str	r9, [r2]
    4544:	e59d2020 	ldr	r2, [sp, #32]
    4548:	e3520014 	cmp	r2, #20
    454c:	8a00000f 	bhi	4590 <ipu_init_channel_buffer+0x1358>
    4550:	e300a000 	movw	sl, #0
    4554:	e340a000 	movt	sl, #0
    4558:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    455c:	e3520000 	cmp	r2, #0
    4560:	da00000a 	ble	4590 <ipu_init_channel_buffer+0x1358>
    4564:	e1a02302 	lsl	r2, r2, #6
    4568:	e2829028 	add	r9, r2, #40	; 0x28
    456c:	e0833009 	add	r3, r3, r9
    4570:	e593a000 	ldr	sl, [r3]
    4574:	f57ff04f 	dsb	sy
    4578:	e38aa402 	orr	sl, sl, #33554432	; 0x2000000
    457c:	f57ff04e 	dsb	st
    4580:	ebfffffe 	bl	0 <arm_heavy_mb>
    4584:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4588:	e0822009 	add	r2, r2, r9
    458c:	e582a000 	str	sl, [r2]
    4590:	e358000d 	cmp	r8, #13
    4594:	979ff108 	ldrls	pc, [pc, r8, lsl #2]
    4598:	ea000388 	b	53c0 <ipu_init_channel_buffer+0x2188>
    459c:	00005278 	andeq	r5, r0, r8, ror r2
    45a0:	00005094 	muleq	r0, r4, r0
    45a4:	000053c0 	andeq	r5, r0, r0, asr #7
    45a8:	000053c0 	andeq	r5, r0, r0, asr #7
    45ac:	000053c0 	andeq	r5, r0, r0, asr #7
    45b0:	000053c0 	andeq	r5, r0, r0, asr #7
    45b4:	000053c0 	andeq	r5, r0, r0, asr #7
    45b8:	000053c0 	andeq	r5, r0, r0, asr #7
    45bc:	000053c0 	andeq	r5, r0, r0, asr #7
    45c0:	00005288 	andeq	r5, r0, r8, lsl #5
    45c4:	000053c0 	andeq	r5, r0, r0, asr #7
    45c8:	000053c0 	andeq	r5, r0, r0, asr #7
    45cc:	000053c0 	andeq	r5, r0, r0, asr #7
    45d0:	00005280 	andeq	r5, r0, r0, lsl #5
    45d4:	e3560003 	cmp	r6, #3
    45d8:	8afffe19 	bhi	3e44 <ipu_init_channel_buffer+0xc0c>
    45dc:	e0833306 	add	r3, r3, r6, lsl #6
    45e0:	e5932028 	ldr	r2, [r3, #40]	; 0x28
    45e4:	f57ff04f 	dsb	sy
    45e8:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    45ec:	e3053049 	movw	r3, #20553	; 0x5049
    45f0:	e3433055 	movt	r3, #12373	; 0x3055
    45f4:	e7e62752 	ubfx	r2, r2, #14, #7
    45f8:	e2822001 	add	r2, r2, #1
    45fc:	e1510003 	cmp	r1, r3
    4600:	01a02222 	lsreq	r2, r2, #4
    4604:	0a000005 	beq	4620 <ipu_init_channel_buffer+0x13e8>
    4608:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    460c:	e3053049 	movw	r3, #20553	; 0x5049
    4610:	e3433255 	movt	r3, #12885	; 0x3255
    4614:	e1510003 	cmp	r1, r3
    4618:	01a021a2 	lsreq	r2, r2, #3
    461c:	11a02122 	lsrne	r2, r2, #2
    4620:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    4624:	e2422001 	sub	r2, r2, #1
    4628:	e59d0018 	ldr	r0, [sp, #24]
    462c:	ebfffffe 	bl	af74 <_ipu_smfc_set_burst_size>
    4630:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4634:	eafffe02 	b	3e44 <ipu_init_channel_buffer+0xc0c>
    4638:	e3032535 	movw	r2, #13621	; 0x3535
    463c:	e3432135 	movt	r2, #12597	; 0x3135
    4640:	e1510002 	cmp	r1, r2
    4644:	0a000410 	beq	568c <ipu_init_channel_buffer+0x2454>
    4648:	8a000265 	bhi	4fe4 <ipu_init_channel_buffer+0x1dac>
    464c:	e3032449 	movw	r2, #13385	; 0x3449
    4650:	e3432032 	movt	r2, #12338	; 0x3032
    4654:	e1510002 	cmp	r1, r2
    4658:	0a00026a 	beq	5008 <ipu_init_channel_buffer+0x1dd0>
    465c:	e3053049 	movw	r3, #20553	; 0x5049
    4660:	e3433055 	movt	r3, #12373	; 0x3055
    4664:	e1510003 	cmp	r1, r3
    4668:	1afffba2 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    466c:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    4670:	e19a2009 	orrs	r2, sl, r9
    4674:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    4678:	e38338cf 	orr	r3, r3, #13565952	; 0xcf0000
    467c:	e3833903 	orr	r3, r3, #49152	; 0xc000
    4680:	e3822b0a 	orr	r2, r2, #10240	; 0x2800
    4684:	e58d3078 	str	r3, [sp, #120]	; 0x78
    4688:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    468c:	1afffc8b 	bne	38c0 <ipu_init_channel_buffer+0x688>
    4690:	eafffb9e 	b	3510 <ipu_init_channel_buffer+0x2d8>
    4694:	e2463005 	sub	r3, r6, #5
    4698:	e353002d 	cmp	r3, #45	; 0x2d
    469c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    46a0:	ea0003a7 	b	5544 <ipu_init_channel_buffer+0x230c>
    46a4:	0000553c 	andeq	r5, r0, ip, lsr r5
    46a8:	00005544 	andeq	r5, r0, r4, asr #10
    46ac:	00005544 	andeq	r5, r0, r4, asr #10
    46b0:	00005544 	andeq	r5, r0, r4, asr #10
    46b4:	00005544 	andeq	r5, r0, r4, asr #10
    46b8:	00005544 	andeq	r5, r0, r4, asr #10
    46bc:	0000552c 	andeq	r5, r0, ip, lsr #10
    46c0:	000054cc 	andeq	r5, r0, ip, asr #9
    46c4:	00005544 	andeq	r5, r0, r4, asr #10
    46c8:	000054bc 			; <UNDEFINED> instruction: 0x000054bc
    46cc:	000054ac 	andeq	r5, r0, ip, lsr #9
    46d0:	00005544 	andeq	r5, r0, r4, asr #10
    46d4:	00005544 	andeq	r5, r0, r4, asr #10
    46d8:	00005544 	andeq	r5, r0, r4, asr #10
    46dc:	00005544 	andeq	r5, r0, r4, asr #10
    46e0:	0000549c 	muleq	r0, ip, r4
    46e4:	0000548c 	andeq	r5, r0, ip, lsl #9
    46e8:	0000547c 	andeq	r5, r0, ip, ror r4
    46ec:	0000546c 	andeq	r5, r0, ip, ror #8
    46f0:	00005544 	andeq	r5, r0, r4, asr #10
    46f4:	00005544 	andeq	r5, r0, r4, asr #10
    46f8:	00005544 	andeq	r5, r0, r4, asr #10
    46fc:	0000545c 	andeq	r5, r0, ip, asr r4
    4700:	0000550c 	andeq	r5, r0, ip, lsl #10
    4704:	00005544 	andeq	r5, r0, r4, asr #10
    4708:	00005544 	andeq	r5, r0, r4, asr #10
    470c:	00005544 	andeq	r5, r0, r4, asr #10
    4710:	00005544 	andeq	r5, r0, r4, asr #10
    4714:	00005544 	andeq	r5, r0, r4, asr #10
    4718:	00005544 	andeq	r5, r0, r4, asr #10
    471c:	00005544 	andeq	r5, r0, r4, asr #10
    4720:	00005544 	andeq	r5, r0, r4, asr #10
    4724:	00005544 	andeq	r5, r0, r4, asr #10
    4728:	00005544 	andeq	r5, r0, r4, asr #10
    472c:	00005544 	andeq	r5, r0, r4, asr #10
    4730:	00005544 	andeq	r5, r0, r4, asr #10
    4734:	00005544 	andeq	r5, r0, r4, asr #10
    4738:	00005544 	andeq	r5, r0, r4, asr #10
    473c:	00005544 	andeq	r5, r0, r4, asr #10
    4740:	00005544 	andeq	r5, r0, r4, asr #10
    4744:	000054fc 	strdeq	r5, [r0], -ip
    4748:	000054ec 	andeq	r5, r0, ip, ror #9
    474c:	000054dc 	ldrdeq	r5, [r0], -ip
    4750:	0000544c 	andeq	r5, r0, ip, asr #8
    4754:	00005410 	andeq	r5, r0, r0, lsl r4
    4758:	0000551c 	andeq	r5, r0, ip, lsl r5
    475c:	e0833004 	add	r3, r3, r4
    4760:	e5933000 	ldr	r3, [r3]
    4764:	f57ff04f 	dsb	sy
    4768:	e0099003 	and	r9, r9, r3
    476c:	f57ff04e 	dsb	st
    4770:	ebfffffe 	bl	0 <arm_heavy_mb>
    4774:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    4778:	e0834004 	add	r4, r3, r4
    477c:	e5849000 	str	r9, [r4]
    4780:	e59d2018 	ldr	r2, [sp, #24]
    4784:	e5922004 	ldr	r2, [r2, #4]
    4788:	e3520000 	cmp	r2, #0
    478c:	12872f59 	addne	r2, r7, #356	; 0x164
    4790:	03a02f4b 	moveq	r2, #300	; 0x12c
    4794:	e0833002 	add	r3, r3, r2
    4798:	e5933000 	ldr	r3, [r3]
    479c:	f57ff04f 	dsb	sy
    47a0:	e59d2018 	ldr	r2, [sp, #24]
    47a4:	e1888003 	orr	r8, r8, r3
    47a8:	e5922004 	ldr	r2, [r2, #4]
    47ac:	e3520000 	cmp	r2, #0
    47b0:	12877f59 	addne	r7, r7, #356	; 0x164
    47b4:	03a07f4b 	moveq	r7, #300	; 0x12c
    47b8:	f57ff04e 	dsb	st
    47bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    47c0:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    47c4:	e0833007 	add	r3, r3, r7
    47c8:	e5838000 	str	r8, [r3]
    47cc:	e59d7018 	ldr	r7, [sp, #24]
    47d0:	e5973004 	ldr	r3, [r7, #4]
    47d4:	e3530000 	cmp	r3, #0
    47d8:	03a04040 	moveq	r4, #64	; 0x40
    47dc:	13a0403c 	movne	r4, #60	; 0x3c
    47e0:	f57ff04e 	dsb	st
    47e4:	ebfffffe 	bl	0 <arm_heavy_mb>
    47e8:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    47ec:	e3042047 	movw	r2, #16455	; 0x4047
    47f0:	e3402044 	movt	r2, #68	; 0x44
    47f4:	e0833004 	add	r3, r3, r4
    47f8:	e5832000 	str	r2, [r3]
    47fc:	e5973004 	ldr	r3, [r7, #4]
    4800:	e3530000 	cmp	r3, #0
    4804:	03a04040 	moveq	r4, #64	; 0x40
    4808:	13a04038 	movne	r4, #56	; 0x38
    480c:	f57ff04e 	dsb	st
    4810:	ebfffffe 	bl	0 <arm_heavy_mb>
    4814:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    4818:	e3042241 	movw	r2, #16961	; 0x4241
    481c:	e3442600 	movt	r2, #17920	; 0x4600
    4820:	e0833004 	add	r3, r3, r4
    4824:	e5832000 	str	r2, [r3]
    4828:	e5973004 	ldr	r3, [r7, #4]
    482c:	e3530000 	cmp	r3, #0
    4830:	03a0402c 	moveq	r4, #44	; 0x2c
    4834:	13a04030 	movne	r4, #48	; 0x30
    4838:	f57ff04e 	dsb	st
    483c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4840:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    4844:	e3a02045 	mov	r2, #69	; 0x45
    4848:	e0833004 	add	r3, r3, r4
    484c:	e5832000 	str	r2, [r3]
    4850:	e5972004 	ldr	r2, [r7, #4]
    4854:	e1a06086 	lsl	r6, r6, #1
    4858:	e3a07003 	mov	r7, #3
    485c:	e206301e 	and	r3, r6, #30
    4860:	e3520000 	cmp	r2, #0
    4864:	e1a07317 	lsl	r7, r7, r3
    4868:	11a042a6 	lsrne	r4, r6, #5
    486c:	03a04f4b 	moveq	r4, #300	; 0x12c
    4870:	12844096 	addne	r4, r4, #150	; 0x96
    4874:	11a04104 	lslne	r4, r4, #2
    4878:	f57ff04e 	dsb	st
    487c:	ebfffffe 	bl	0 <arm_heavy_mb>
    4880:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    4884:	e0834004 	add	r4, r3, r4
    4888:	e5847000 	str	r7, [r4]
    488c:	eafffe3d 	b	4188 <ipu_init_channel_buffer+0xf50>
    4890:	e1a07206 	lsl	r7, r6, #4
    4894:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4898:	e287900a 	add	r9, r7, #10
    489c:	e1a08007 	mov	r8, r7
    48a0:	e1a09109 	lsl	r9, r9, #2
    48a4:	e0833009 	add	r3, r3, r9
    48a8:	e593a000 	ldr	sl, [r3]
    48ac:	f57ff04f 	dsb	sy
    48b0:	e3caa97f 	bic	sl, sl, #2080768	; 0x1fc000
    48b4:	e38aa907 	orr	sl, sl, #114688	; 0x1c000
    48b8:	f57ff04e 	dsb	st
    48bc:	ebfffffe 	bl	0 <arm_heavy_mb>
    48c0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    48c4:	e0832009 	add	r2, r3, r9
    48c8:	e582a000 	str	sl, [r2]
    48cc:	e59d1020 	ldr	r1, [sp, #32]
    48d0:	e3510014 	cmp	r1, #20
    48d4:	8a000004 	bhi	48ec <ipu_init_channel_buffer+0x16b4>
    48d8:	e3002000 	movw	r2, #0
    48dc:	e3402000 	movt	r2, #0
    48e0:	e7922101 	ldr	r2, [r2, r1, lsl #2]
    48e4:	e3520000 	cmp	r2, #0
    48e8:	ca0002a7 	bgt	538c <ipu_init_channel_buffer+0x2154>
    48ec:	e249b01c 	sub	fp, r9, #28
    48f0:	e083300b 	add	r3, r3, fp
    48f4:	e593a000 	ldr	sl, [r3]
    48f8:	f57ff04f 	dsb	sy
    48fc:	e3caa606 	bic	sl, sl, #6291456	; 0x600000
    4900:	e38aa602 	orr	sl, sl, #2097152	; 0x200000
    4904:	f57ff04e 	dsb	st
    4908:	ebfffffe 	bl	0 <arm_heavy_mb>
    490c:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4910:	e083200b 	add	r2, r3, fp
    4914:	e582a000 	str	sl, [r2]
    4918:	e59d2020 	ldr	r2, [sp, #32]
    491c:	e3520014 	cmp	r2, #20
    4920:	8a0001a7 	bhi	4fc4 <ipu_init_channel_buffer+0x1d8c>
    4924:	e300a000 	movw	sl, #0
    4928:	e340a000 	movt	sl, #0
    492c:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    4930:	e3520000 	cmp	r2, #0
    4934:	dafffca8 	ble	3bdc <ipu_init_channel_buffer+0x9a4>
    4938:	e1a02302 	lsl	r2, r2, #6
    493c:	e282800c 	add	r8, r2, #12
    4940:	e0833008 	add	r3, r3, r8
    4944:	e5939000 	ldr	r9, [r3]
    4948:	f57ff04f 	dsb	sy
    494c:	e3c99606 	bic	r9, r9, #6291456	; 0x600000
    4950:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    4954:	f57ff04e 	dsb	st
    4958:	ebfffffe 	bl	0 <arm_heavy_mb>
    495c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4960:	e0822008 	add	r2, r2, r8
    4964:	e5829000 	str	r9, [r2]
    4968:	eafffc9b 	b	3bdc <ipu_init_channel_buffer+0x9a4>
    496c:	e3001000 	movw	r1, #0
    4970:	e1a02009 	mov	r2, r9
    4974:	e3401000 	movt	r1, #0
    4978:	e59f0e94 	ldr	r0, [pc, #3732]	; 5814 <ipu_init_channel_buffer+0x25dc>
    497c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    4980:	eafffa58 	b	32e8 <ipu_init_channel_buffer+0xb0>
    4984:	e3001000 	movw	r1, #0
    4988:	e59d20cc 	ldr	r2, [sp, #204]	; 0xcc
    498c:	e3401000 	movt	r1, #0
    4990:	e59f0e80 	ldr	r0, [pc, #3712]	; 5818 <ipu_init_channel_buffer+0x25e0>
    4994:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    4998:	e3003102 	movw	r3, #258	; 0x102
    499c:	e19430b3 	ldrh	r3, [r4, r3]
    49a0:	e3130004 	tst	r3, #4
    49a4:	0afffa4b 	beq	32d8 <ipu_init_channel_buffer+0xa0>
    49a8:	e3001000 	movw	r1, #0
    49ac:	e1a0200a 	mov	r2, sl
    49b0:	e3401000 	movt	r1, #0
    49b4:	e59f0e60 	ldr	r0, [pc, #3680]	; 581c <ipu_init_channel_buffer+0x25e4>
    49b8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    49bc:	eafffa45 	b	32d8 <ipu_init_channel_buffer+0xa0>
    49c0:	e3001000 	movw	r1, #0
    49c4:	e59d201c 	ldr	r2, [sp, #28]
    49c8:	e3401000 	movt	r1, #0
    49cc:	e59f0e4c 	ldr	r0, [pc, #3660]	; 5820 <ipu_init_channel_buffer+0x25e8>
    49d0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    49d4:	e1d43ab2 	ldrh	r3, [r4, #162]	; 0xa2
    49d8:	e3130004 	tst	r3, #4
    49dc:	0afffa30 	beq	32a4 <ipu_init_channel_buffer+0x6c>
    49e0:	e3001000 	movw	r1, #0
    49e4:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    49e8:	e3401000 	movt	r1, #0
    49ec:	e59f0e30 	ldr	r0, [pc, #3632]	; 5824 <ipu_init_channel_buffer+0x25ec>
    49f0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    49f4:	e1d43bba 	ldrh	r3, [r4, #186]	; 0xba
    49f8:	e3130004 	tst	r3, #4
    49fc:	0afffa2b 	beq	32b0 <ipu_init_channel_buffer+0x78>
    4a00:	e3001000 	movw	r1, #0
    4a04:	e1a02007 	mov	r2, r7
    4a08:	e3401000 	movt	r1, #0
    4a0c:	e59f0e14 	ldr	r0, [pc, #3604]	; 5828 <ipu_init_channel_buffer+0x25f0>
    4a10:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    4a14:	e1d43db2 	ldrh	r3, [r4, #210]	; 0xd2
    4a18:	e3130004 	tst	r3, #4
    4a1c:	0afffa26 	beq	32bc <ipu_init_channel_buffer+0x84>
    4a20:	e3001000 	movw	r1, #0
    4a24:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    4a28:	e3401000 	movt	r1, #0
    4a2c:	e59f0df8 	ldr	r0, [pc, #3576]	; 582c <ipu_init_channel_buffer+0x25f4>
    4a30:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    4a34:	eafffa20 	b	32bc <ipu_init_channel_buffer+0x84>
    4a38:	e3001000 	movw	r1, #0
    4a3c:	e1a02006 	mov	r2, r6
    4a40:	e3401000 	movt	r1, #0
    4a44:	e59f0de4 	ldr	r0, [pc, #3556]	; 5830 <ipu_init_channel_buffer+0x25f8>
    4a48:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    4a4c:	eafffa31 	b	3318 <ipu_init_channel_buffer+0xe0>
    4a50:	e3002000 	movw	r2, #0
    4a54:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4a58:	e1a03006 	mov	r3, r6
    4a5c:	e58d9000 	str	r9, [sp]
    4a60:	e3402000 	movt	r2, #0
    4a64:	e59f0dc8 	ldr	r0, [pc, #3528]	; 5834 <ipu_init_channel_buffer+0x25fc>
    4a68:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4a6c:	e5959d78 	ldr	r9, [r5, #3448]	; 0xd78
    4a70:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    4a74:	e0899003 	add	r9, r9, r3
    4a78:	eafffbc1 	b	3984 <ipu_init_channel_buffer+0x74c>
    4a7c:	e1a03306 	lsl	r3, r6, #6
    4a80:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4a84:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4a88:	e2833030 	add	r3, r3, #48	; 0x30
    4a8c:	e0823003 	add	r3, r2, r3
    4a90:	e5933000 	ldr	r3, [r3]
    4a94:	f57ff04f 	dsb	sy
    4a98:	e3002000 	movw	r2, #0
    4a9c:	e7e437d3 	ubfx	r3, r3, #15, #5
    4aa0:	e3402000 	movt	r2, #0
    4aa4:	e59f0d8c 	ldr	r0, [pc, #3468]	; 5838 <ipu_init_channel_buffer+0x2600>
    4aa8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4aac:	eafffd86 	b	40cc <ipu_init_channel_buffer+0xe94>
    4ab0:	e1a03306 	lsl	r3, r6, #6
    4ab4:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4ab8:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4abc:	e2833030 	add	r3, r3, #48	; 0x30
    4ac0:	e0823003 	add	r3, r2, r3
    4ac4:	e5933000 	ldr	r3, [r3]
    4ac8:	f57ff04f 	dsb	sy
    4acc:	e3002000 	movw	r2, #0
    4ad0:	e7e43553 	ubfx	r3, r3, #10, #5
    4ad4:	e3402000 	movt	r2, #0
    4ad8:	e59f0d5c 	ldr	r0, [pc, #3420]	; 583c <ipu_init_channel_buffer+0x2604>
    4adc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4ae0:	eafffd75 	b	40bc <ipu_init_channel_buffer+0xe84>
    4ae4:	e1a03306 	lsl	r3, r6, #6
    4ae8:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4aec:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4af0:	e2833030 	add	r3, r3, #48	; 0x30
    4af4:	e0823003 	add	r3, r2, r3
    4af8:	e5933000 	ldr	r3, [r3]
    4afc:	f57ff04f 	dsb	sy
    4b00:	e3002000 	movw	r2, #0
    4b04:	e7e432d3 	ubfx	r3, r3, #5, #5
    4b08:	e3402000 	movt	r2, #0
    4b0c:	e59f0d2c 	ldr	r0, [pc, #3372]	; 5840 <ipu_init_channel_buffer+0x2608>
    4b10:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4b14:	eafffd64 	b	40ac <ipu_init_channel_buffer+0xe74>
    4b18:	e1a03306 	lsl	r3, r6, #6
    4b1c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4b20:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4b24:	e2833030 	add	r3, r3, #48	; 0x30
    4b28:	e0823003 	add	r3, r2, r3
    4b2c:	e5933000 	ldr	r3, [r3]
    4b30:	f57ff04f 	dsb	sy
    4b34:	e3002000 	movw	r2, #0
    4b38:	e203301f 	and	r3, r3, #31
    4b3c:	e3402000 	movt	r2, #0
    4b40:	e59f0cfc 	ldr	r0, [pc, #3324]	; 5844 <ipu_init_channel_buffer+0x260c>
    4b44:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4b48:	eafffd53 	b	409c <ipu_init_channel_buffer+0xe64>
    4b4c:	e1a03306 	lsl	r3, r6, #6
    4b50:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4b54:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4b58:	e283302c 	add	r3, r3, #44	; 0x2c
    4b5c:	e0823003 	add	r3, r2, r3
    4b60:	e5933000 	ldr	r3, [r3]
    4b64:	f57ff04f 	dsb	sy
    4b68:	e3002000 	movw	r2, #0
    4b6c:	e1a03ea3 	lsr	r3, r3, #29
    4b70:	e59f0cd0 	ldr	r0, [pc, #3280]	; 5848 <ipu_init_channel_buffer+0x2610>
    4b74:	e3402000 	movt	r2, #0
    4b78:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4b7c:	eafffd42 	b	408c <ipu_init_channel_buffer+0xe54>
    4b80:	e1a03306 	lsl	r3, r6, #6
    4b84:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4b88:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4b8c:	e283302c 	add	r3, r3, #44	; 0x2c
    4b90:	e0823003 	add	r3, r2, r3
    4b94:	e5933000 	ldr	r3, [r3]
    4b98:	f57ff04f 	dsb	sy
    4b9c:	e3002000 	movw	r2, #0
    4ba0:	e7e23d53 	ubfx	r3, r3, #26, #3
    4ba4:	e3402000 	movt	r2, #0
    4ba8:	e59f0c9c 	ldr	r0, [pc, #3228]	; 584c <ipu_init_channel_buffer+0x2614>
    4bac:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4bb0:	eafffd31 	b	407c <ipu_init_channel_buffer+0xe44>
    4bb4:	e1a03306 	lsl	r3, r6, #6
    4bb8:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4bbc:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4bc0:	e283302c 	add	r3, r3, #44	; 0x2c
    4bc4:	e0823003 	add	r3, r2, r3
    4bc8:	e5933000 	ldr	r3, [r3]
    4bcc:	f57ff04f 	dsb	sy
    4bd0:	e3002000 	movw	r2, #0
    4bd4:	e7e23bd3 	ubfx	r3, r3, #23, #3
    4bd8:	e3402000 	movt	r2, #0
    4bdc:	e59f0c6c 	ldr	r0, [pc, #3180]	; 5850 <ipu_init_channel_buffer+0x2618>
    4be0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4be4:	eafffd20 	b	406c <ipu_init_channel_buffer+0xe34>
    4be8:	e1a03306 	lsl	r3, r6, #6
    4bec:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4bf0:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4bf4:	e283302c 	add	r3, r3, #44	; 0x2c
    4bf8:	e0823003 	add	r3, r2, r3
    4bfc:	e5933000 	ldr	r3, [r3]
    4c00:	f57ff04f 	dsb	sy
    4c04:	e3002000 	movw	r2, #0
    4c08:	e7e23a53 	ubfx	r3, r3, #20, #3
    4c0c:	e3402000 	movt	r2, #0
    4c10:	e59f0c3c 	ldr	r0, [pc, #3132]	; 5854 <ipu_init_channel_buffer+0x261c>
    4c14:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4c18:	eafffd0f 	b	405c <ipu_init_channel_buffer+0xe24>
    4c1c:	e1a03306 	lsl	r3, r6, #6
    4c20:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4c24:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4c28:	e2833008 	add	r3, r3, #8
    4c2c:	e0823003 	add	r3, r2, r3
    4c30:	e5930000 	ldr	r0, [r3]
    4c34:	f57ff04f 	dsb	sy
    4c38:	e30f3ff8 	movw	r3, #65528	; 0xfff8
    4c3c:	e3002000 	movw	r2, #0
    4c40:	e34031ff 	movt	r3, #511	; 0x1ff
    4c44:	e3402000 	movt	r2, #0
    4c48:	e00330a0 	and	r3, r3, r0, lsr #1
    4c4c:	e59f0c04 	ldr	r0, [pc, #3076]	; 5858 <ipu_init_channel_buffer+0x2620>
    4c50:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4c54:	eafffcfc 	b	404c <ipu_init_channel_buffer+0xe14>
    4c58:	e1a03306 	lsl	r3, r6, #6
    4c5c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4c60:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4c64:	e2833004 	add	r3, r3, #4
    4c68:	e0822003 	add	r2, r2, r3
    4c6c:	e592c000 	ldr	ip, [r2]
    4c70:	f57ff04f 	dsb	sy
    4c74:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4c78:	e2833004 	add	r3, r3, #4
    4c7c:	e0823003 	add	r3, r2, r3
    4c80:	e5933000 	ldr	r3, [r3]
    4c84:	f57ff04f 	dsb	sy
    4c88:	e1a03903 	lsl	r3, r3, #18
    4c8c:	e3002000 	movw	r2, #0
    4c90:	e59f0bc4 	ldr	r0, [pc, #3012]	; 585c <ipu_init_channel_buffer+0x2624>
    4c94:	e3402000 	movt	r2, #0
    4c98:	e203370f 	and	r3, r3, #3932160	; 0x3c0000
    4c9c:	e183372c 	orr	r3, r3, ip, lsr #14
    4ca0:	e1a03183 	lsl	r3, r3, #3
    4ca4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4ca8:	eafffce3 	b	403c <ipu_init_channel_buffer+0xe04>
    4cac:	e1a03306 	lsl	r3, r6, #6
    4cb0:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4cb4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4cb8:	e2833030 	add	r3, r3, #48	; 0x30
    4cbc:	e0823003 	add	r3, r2, r3
    4cc0:	e5933000 	ldr	r3, [r3]
    4cc4:	f57ff04f 	dsb	sy
    4cc8:	e3002000 	movw	r2, #0
    4ccc:	e7ed3053 	ubfx	r3, r3, #0, #14
    4cd0:	e3402000 	movt	r2, #0
    4cd4:	e59f0b84 	ldr	r0, [pc, #2948]	; 5860 <ipu_init_channel_buffer+0x2628>
    4cd8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4cdc:	eafffcd2 	b	402c <ipu_init_channel_buffer+0xdf4>
    4ce0:	e1a03306 	lsl	r3, r6, #6
    4ce4:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4ce8:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4cec:	e283300c 	add	r3, r3, #12
    4cf0:	e0823003 	add	r3, r2, r3
    4cf4:	e5933000 	ldr	r3, [r3]
    4cf8:	f57ff04f 	dsb	sy
    4cfc:	e3002000 	movw	r2, #0
    4d00:	e7e038d3 	ubfx	r3, r3, #17, #1
    4d04:	e3402000 	movt	r2, #0
    4d08:	e59f0b54 	ldr	r0, [pc, #2900]	; 5864 <ipu_init_channel_buffer+0x262c>
    4d0c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4d10:	eafffcc1 	b	401c <ipu_init_channel_buffer+0xde4>
    4d14:	e1a03306 	lsl	r3, r6, #6
    4d18:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4d1c:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4d20:	e283302c 	add	r3, r3, #44	; 0x2c
    4d24:	e0823003 	add	r3, r2, r3
    4d28:	e5933000 	ldr	r3, [r3]
    4d2c:	f57ff04f 	dsb	sy
    4d30:	e3002000 	movw	r2, #0
    4d34:	e7ed3353 	ubfx	r3, r3, #6, #14
    4d38:	e3402000 	movt	r2, #0
    4d3c:	e59f0b24 	ldr	r0, [pc, #2852]	; 5868 <ipu_init_channel_buffer+0x2630>
    4d40:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4d44:	eafffcb0 	b	400c <ipu_init_channel_buffer+0xdd4>
    4d48:	e1a03306 	lsl	r3, r6, #6
    4d4c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4d50:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4d54:	e2833020 	add	r3, r3, #32
    4d58:	e0822003 	add	r2, r2, r3
    4d5c:	e592c000 	ldr	ip, [r2]
    4d60:	f57ff04f 	dsb	sy
    4d64:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4d68:	e2833004 	add	r3, r3, #4
    4d6c:	e0823003 	add	r3, r2, r3
    4d70:	e5933000 	ldr	r3, [r3]
    4d74:	f57ff04f 	dsb	sy
    4d78:	e1a03183 	lsl	r3, r3, #3
    4d7c:	e3002000 	movw	r2, #0
    4d80:	e59f0ae4 	ldr	r0, [pc, #2788]	; 586c <ipu_init_channel_buffer+0x2634>
    4d84:	e3402000 	movt	r2, #0
    4d88:	e3c3327e 	bic	r3, r3, #-536870905	; 0xe0000007
    4d8c:	e1833eac 	orr	r3, r3, ip, lsr #29
    4d90:	e1a03183 	lsl	r3, r3, #3
    4d94:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4d98:	eafffc97 	b	3ffc <ipu_init_channel_buffer+0xdc4>
    4d9c:	e1a03306 	lsl	r3, r6, #6
    4da0:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4da4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4da8:	e2833020 	add	r3, r3, #32
    4dac:	e0823003 	add	r3, r2, r3
    4db0:	e5933000 	ldr	r3, [r3]
    4db4:	f57ff04f 	dsb	sy
    4db8:	e3002000 	movw	r2, #0
    4dbc:	e1a03183 	lsl	r3, r3, #3
    4dc0:	e59f0aa8 	ldr	r0, [pc, #2728]	; 5870 <ipu_init_channel_buffer+0x2638>
    4dc4:	e3402000 	movt	r2, #0
    4dc8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4dcc:	eafffc86 	b	3fec <ipu_init_channel_buffer+0xdb4>
    4dd0:	e1a03306 	lsl	r3, r6, #6
    4dd4:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4dd8:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4ddc:	e2833010 	add	r3, r3, #16
    4de0:	e0823003 	add	r3, r2, r3
    4de4:	e5933000 	ldr	r3, [r3]
    4de8:	f57ff04f 	dsb	sy
    4dec:	e3002000 	movw	r2, #0
    4df0:	e7eb3553 	ubfx	r3, r3, #10, #12
    4df4:	e3402000 	movt	r2, #0
    4df8:	e59f0a74 	ldr	r0, [pc, #2676]	; 5874 <ipu_init_channel_buffer+0x263c>
    4dfc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4e00:	eafffc75 	b	3fdc <ipu_init_channel_buffer+0xda4>
    4e04:	e1a02306 	lsl	r2, r6, #6
    4e08:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4e0c:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4e10:	e282200c 	add	r2, r2, #12
    4e14:	e0833002 	add	r3, r3, r2
    4e18:	e5933000 	ldr	r3, [r3]
    4e1c:	f57ff04f 	dsb	sy
    4e20:	e5950d78 	ldr	r0, [r5, #3448]	; 0xd78
    4e24:	e2822004 	add	r2, r2, #4
    4e28:	e0802002 	add	r2, r0, r2
    4e2c:	e5922000 	ldr	r2, [r2]
    4e30:	f57ff04f 	dsb	sy
    4e34:	e301cff8 	movw	ip, #8184	; 0x1ff8
    4e38:	e59f0a38 	ldr	r0, [pc, #2616]	; 5878 <ipu_init_channel_buffer+0x2640>
    4e3c:	e00cc182 	and	ip, ip, r2, lsl #3
    4e40:	e3002000 	movw	r2, #0
    4e44:	e3402000 	movt	r2, #0
    4e48:	e18c3ea3 	orr	r3, ip, r3, lsr #29
    4e4c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4e50:	eafffc5d 	b	3fcc <ipu_init_channel_buffer+0xd94>
    4e54:	e1a03306 	lsl	r3, r6, #6
    4e58:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4e5c:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4e60:	e2833028 	add	r3, r3, #40	; 0x28
    4e64:	e0823003 	add	r3, r2, r3
    4e68:	e5933000 	ldr	r3, [r3]
    4e6c:	f57ff04f 	dsb	sy
    4e70:	e3002000 	movw	r2, #0
    4e74:	e7e63753 	ubfx	r3, r3, #14, #7
    4e78:	e3402000 	movt	r2, #0
    4e7c:	e59f09f8 	ldr	r0, [pc, #2552]	; 587c <ipu_init_channel_buffer+0x2644>
    4e80:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4e84:	eafffc4c 	b	3fbc <ipu_init_channel_buffer+0xd84>
    4e88:	e1a03306 	lsl	r3, r6, #6
    4e8c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4e90:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4e94:	e283300c 	add	r3, r3, #12
    4e98:	e0823003 	add	r3, r2, r3
    4e9c:	e5933000 	ldr	r3, [r3]
    4ea0:	f57ff04f 	dsb	sy
    4ea4:	e3002000 	movw	r2, #0
    4ea8:	e7e235d3 	ubfx	r3, r3, #11, #3
    4eac:	e3402000 	movt	r2, #0
    4eb0:	e59f09c8 	ldr	r0, [pc, #2504]	; 5880 <ipu_init_channel_buffer+0x2648>
    4eb4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4eb8:	eafffc3b 	b	3fac <ipu_init_channel_buffer+0xd74>
    4ebc:	e1a03306 	lsl	r3, r6, #6
    4ec0:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4ec4:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4ec8:	e2833028 	add	r3, r3, #40	; 0x28
    4ecc:	e0823003 	add	r3, r2, r3
    4ed0:	e5933000 	ldr	r3, [r3]
    4ed4:	f57ff04f 	dsb	sy
    4ed8:	e3002000 	movw	r2, #0
    4edc:	e7e33ad3 	ubfx	r3, r3, #21, #4
    4ee0:	e3402000 	movt	r2, #0
    4ee4:	e59f0998 	ldr	r0, [pc, #2456]	; 5884 <ipu_init_channel_buffer+0x264c>
    4ee8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4eec:	eafffc2a 	b	3f9c <ipu_init_channel_buffer+0xd64>
    4ef0:	e5990030 	ldr	r0, [r9, #48]	; 0x30
    4ef4:	e3002000 	movw	r2, #0
    4ef8:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4efc:	e3402000 	movt	r2, #0
    4f00:	e1a03006 	mov	r3, r6
    4f04:	e58d0010 	str	r0, [sp, #16]
    4f08:	e599c02c 	ldr	ip, [r9, #44]	; 0x2c
    4f0c:	e59f0974 	ldr	r0, [pc, #2420]	; 5888 <ipu_init_channel_buffer+0x2650>
    4f10:	e58dc00c 	str	ip, [sp, #12]
    4f14:	e599c028 	ldr	ip, [r9, #40]	; 0x28
    4f18:	e58dc008 	str	ip, [sp, #8]
    4f1c:	e599c024 	ldr	ip, [r9, #36]	; 0x24
    4f20:	e58dc004 	str	ip, [sp, #4]
    4f24:	e599c020 	ldr	ip, [r9, #32]
    4f28:	e58dc000 	str	ip, [sp]
    4f2c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4f30:	eafffc15 	b	3f8c <ipu_init_channel_buffer+0xd54>
    4f34:	e5990010 	ldr	r0, [r9, #16]
    4f38:	e3002000 	movw	r2, #0
    4f3c:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    4f40:	e3402000 	movt	r2, #0
    4f44:	e1a03006 	mov	r3, r6
    4f48:	e58d0010 	str	r0, [sp, #16]
    4f4c:	e599e00c 	ldr	lr, [r9, #12]
    4f50:	e59f0934 	ldr	r0, [pc, #2356]	; 588c <ipu_init_channel_buffer+0x2654>
    4f54:	e58de00c 	str	lr, [sp, #12]
    4f58:	e599e008 	ldr	lr, [r9, #8]
    4f5c:	e58de008 	str	lr, [sp, #8]
    4f60:	e599e004 	ldr	lr, [r9, #4]
    4f64:	e58de004 	str	lr, [sp, #4]
    4f68:	e79cc306 	ldr	ip, [ip, r6, lsl #6]
    4f6c:	e58dc000 	str	ip, [sp]
    4f70:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    4f74:	eafffc00 	b	3f7c <ipu_init_channel_buffer+0xd44>
    4f78:	e1a03306 	lsl	r3, r6, #6
    4f7c:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    4f80:	e2833028 	add	r3, r3, #40	; 0x28
    4f84:	e0823003 	add	r3, r2, r3
    4f88:	e5937000 	ldr	r7, [r3]
    4f8c:	f57ff04f 	dsb	sy
    4f90:	e59d8018 	ldr	r8, [sp, #24]
    4f94:	e1a01006 	mov	r1, r6
    4f98:	e59d201c 	ldr	r2, [sp, #28]
    4f9c:	e1a00008 	mov	r0, r8
    4fa0:	ebfffffe 	bl	bda8 <_ipu_dmfc_set_wait4eot>
    4fa4:	e7e62757 	ubfx	r2, r7, #14, #7
    4fa8:	e1a01006 	mov	r1, r6
    4fac:	e2822001 	add	r2, r2, #1
    4fb0:	e1a00008 	mov	r0, r8
    4fb4:	ebfffffe 	bl	bdac <_ipu_dmfc_set_burst_size>
    4fb8:	eafffcdb 	b	432c <ipu_init_channel_buffer+0x10f4>
    4fbc:	e1a08002 	mov	r8, r2
    4fc0:	eafff8f9 	b	33ac <ipu_init_channel_buffer+0x174>
    4fc4:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    4fc8:	e59d0018 	ldr	r0, [sp, #24]
    4fcc:	ebfffffe 	bl	bdd8 <_ipu_disp_chan_is_interlaced>
    4fd0:	e3500000 	cmp	r0, #0
    4fd4:	0a0000da 	beq	5344 <ipu_init_channel_buffer+0x210c>
    4fd8:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    4fdc:	e3e0a015 	mvn	sl, #21
    4fe0:	eafffb09 	b	3c0c <ipu_init_channel_buffer+0x9d4>
    4fe4:	e59d3024 	ldr	r3, [sp, #36]	; 0x24
    4fe8:	e3052049 	movw	r2, #20553	; 0x5049
    4fec:	e3432155 	movt	r2, #12629	; 0x3155
    4ff0:	e1530002 	cmp	r3, r2
    4ff4:	0afff943 	beq	3508 <ipu_init_channel_buffer+0x2d0>
    4ff8:	e3052559 	movw	r2, #21849	; 0x5559
    4ffc:	e3432231 	movt	r2, #12849	; 0x3231
    5000:	e1530002 	cmp	r3, r2
    5004:	1afff93b 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    5008:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    500c:	e1a0c0a7 	lsr	ip, r7, #1
    5010:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    5014:	e3580000 	cmp	r8, #0
    5018:	e0000297 	mul	r0, r7, r2
    501c:	e001029c 	mul	r1, ip, r2
    5020:	e3832501 	orr	r2, r3, #4194304	; 0x400000
    5024:	e08010a1 	add	r1, r0, r1, lsr #1
    5028:	1a0000a1 	bne	52b4 <ipu_init_channel_buffer+0x207c>
    502c:	e3560003 	cmp	r6, #3
    5030:	83a0391f 	movhi	r3, #507904	; 0x7c000
    5034:	8a000003 	bhi	5048 <ipu_init_channel_buffer+0x1e10>
    5038:	e5d53ee0 	ldrb	r3, [r5, #3808]	; 0xee0
    503c:	e3530000 	cmp	r3, #0
    5040:	03a0391f 	moveq	r3, #507904	; 0x7c000
    5044:	13a0390f 	movne	r3, #245760	; 0x3c000
    5048:	e1822003 	orr	r2, r2, r3
    504c:	e1a0700c 	mov	r7, ip
    5050:	e58d2078 	str	r2, [sp, #120]	; 0x78
    5054:	ea00009a 	b	52c4 <ipu_init_channel_buffer+0x208c>
    5058:	e1a02302 	lsl	r2, r2, #6
    505c:	e2828028 	add	r8, r2, #40	; 0x28
    5060:	e0833008 	add	r3, r3, r8
    5064:	e5939000 	ldr	r9, [r3]
    5068:	f57ff04f 	dsb	sy
    506c:	e3c9997f 	bic	r9, r9, #2080768	; 0x1fc000
    5070:	e389990f 	orr	r9, r9, #245760	; 0x3c000
    5074:	eafffd1a 	b	44e4 <ipu_init_channel_buffer+0x12ac>
    5078:	e3001000 	movw	r1, #0
    507c:	e1a0300a 	mov	r3, sl
    5080:	e3401000 	movt	r1, #0
    5084:	e1a02006 	mov	r2, r6
    5088:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    508c:	ebfffffe 	bl	0 <dev_warn>
    5090:	eafffa62 	b	3a20 <ipu_init_channel_buffer+0x7e8>
    5094:	e3a09301 	mov	r9, #67108864	; 0x4000000
    5098:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    509c:	e0833007 	add	r3, r3, r7
    50a0:	e5938000 	ldr	r8, [r3]
    50a4:	f57ff04f 	dsb	sy
    50a8:	e3c88307 	bic	r8, r8, #469762048	; 0x1c000000
    50ac:	e1888009 	orr	r8, r8, r9
    50b0:	f57ff04e 	dsb	st
    50b4:	ebfffffe 	bl	0 <arm_heavy_mb>
    50b8:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    50bc:	e0832007 	add	r2, r3, r7
    50c0:	e5828000 	str	r8, [r2]
    50c4:	e59d2020 	ldr	r2, [sp, #32]
    50c8:	e3520014 	cmp	r2, #20
    50cc:	8a000010 	bhi	5114 <ipu_init_channel_buffer+0x1edc>
    50d0:	e300a000 	movw	sl, #0
    50d4:	e340a000 	movt	sl, #0
    50d8:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    50dc:	e3520000 	cmp	r2, #0
    50e0:	da00000b 	ble	5114 <ipu_init_channel_buffer+0x1edc>
    50e4:	e1a02302 	lsl	r2, r2, #6
    50e8:	e2828028 	add	r8, r2, #40	; 0x28
    50ec:	e0833008 	add	r3, r3, r8
    50f0:	e5933000 	ldr	r3, [r3]
    50f4:	f57ff04f 	dsb	sy
    50f8:	e3c33307 	bic	r3, r3, #469762048	; 0x1c000000
    50fc:	e1839009 	orr	r9, r3, r9
    5100:	f57ff04e 	dsb	st
    5104:	ebfffffe 	bl	0 <arm_heavy_mb>
    5108:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    510c:	e0832008 	add	r2, r3, r8
    5110:	e5829000 	str	r9, [r2]
    5114:	e2878008 	add	r8, r7, #8
    5118:	e0833008 	add	r3, r3, r8
    511c:	e5939000 	ldr	r9, [r3]
    5120:	f57ff04f 	dsb	sy
    5124:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    5128:	f57ff04e 	dsb	st
    512c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5130:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    5134:	e0832008 	add	r2, r3, r8
    5138:	e5829000 	str	r9, [r2]
    513c:	e59d2020 	ldr	r2, [sp, #32]
    5140:	e3520014 	cmp	r2, #20
    5144:	8a00000f 	bhi	5188 <ipu_init_channel_buffer+0x1f50>
    5148:	e300a000 	movw	sl, #0
    514c:	e340a000 	movt	sl, #0
    5150:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    5154:	e3520000 	cmp	r2, #0
    5158:	da00000a 	ble	5188 <ipu_init_channel_buffer+0x1f50>
    515c:	e1a02302 	lsl	r2, r2, #6
    5160:	e2828030 	add	r8, r2, #48	; 0x30
    5164:	e0833008 	add	r3, r3, r8
    5168:	e5939000 	ldr	r9, [r3]
    516c:	f57ff04f 	dsb	sy
    5170:	e3899602 	orr	r9, r9, #2097152	; 0x200000
    5174:	f57ff04e 	dsb	st
    5178:	ebfffffe 	bl	0 <arm_heavy_mb>
    517c:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    5180:	e0838008 	add	r8, r3, r8
    5184:	e5889000 	str	r9, [r8]
    5188:	e2878004 	add	r8, r7, #4
    518c:	e0833008 	add	r3, r3, r8
    5190:	e5939000 	ldr	r9, [r3]
    5194:	f57ff04f 	dsb	sy
    5198:	e389920e 	orr	r9, r9, #-536870912	; 0xe0000000
    519c:	f57ff04e 	dsb	st
    51a0:	ebfffffe 	bl	0 <arm_heavy_mb>
    51a4:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    51a8:	e0832008 	add	r2, r3, r8
    51ac:	e5829000 	str	r9, [r2]
    51b0:	e59d2020 	ldr	r2, [sp, #32]
    51b4:	e3520014 	cmp	r2, #20
    51b8:	8a00000f 	bhi	51fc <ipu_init_channel_buffer+0x1fc4>
    51bc:	e300a000 	movw	sl, #0
    51c0:	e340a000 	movt	sl, #0
    51c4:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    51c8:	e3520000 	cmp	r2, #0
    51cc:	da00000a 	ble	51fc <ipu_init_channel_buffer+0x1fc4>
    51d0:	e1a02302 	lsl	r2, r2, #6
    51d4:	e282802c 	add	r8, r2, #44	; 0x2c
    51d8:	e0833008 	add	r3, r3, r8
    51dc:	e5939000 	ldr	r9, [r3]
    51e0:	f57ff04f 	dsb	sy
    51e4:	e389920e 	orr	r9, r9, #-536870912	; 0xe0000000
    51e8:	f57ff04e 	dsb	st
    51ec:	ebfffffe 	bl	0 <arm_heavy_mb>
    51f0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    51f4:	e0838008 	add	r8, r3, r8
    51f8:	e5889000 	str	r9, [r8]
    51fc:	e0833007 	add	r3, r3, r7
    5200:	e5938000 	ldr	r8, [r3]
    5204:	f57ff04f 	dsb	sy
    5208:	e3c8897f 	bic	r8, r8, #2080768	; 0x1fc000
    520c:	e388890f 	orr	r8, r8, #245760	; 0x3c000
    5210:	f57ff04e 	dsb	st
    5214:	ebfffffe 	bl	0 <arm_heavy_mb>
    5218:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    521c:	e0837007 	add	r7, r3, r7
    5220:	e5878000 	str	r8, [r7]
    5224:	e59d2020 	ldr	r2, [sp, #32]
    5228:	e3520014 	cmp	r2, #20
    522c:	8afffa21 	bhi	3ab8 <ipu_init_channel_buffer+0x880>
    5230:	e300a000 	movw	sl, #0
    5234:	e340a000 	movt	sl, #0
    5238:	e79a2102 	ldr	r2, [sl, r2, lsl #2]
    523c:	e3520000 	cmp	r2, #0
    5240:	dafffa1c 	ble	3ab8 <ipu_init_channel_buffer+0x880>
    5244:	e1a02302 	lsl	r2, r2, #6
    5248:	e2827028 	add	r7, r2, #40	; 0x28
    524c:	e0833007 	add	r3, r3, r7
    5250:	e5938000 	ldr	r8, [r3]
    5254:	f57ff04f 	dsb	sy
    5258:	e3c8897f 	bic	r8, r8, #2080768	; 0x1fc000
    525c:	e388890f 	orr	r8, r8, #245760	; 0x3c000
    5260:	f57ff04e 	dsb	st
    5264:	ebfffffe 	bl	0 <arm_heavy_mb>
    5268:	e5952d78 	ldr	r2, [r5, #3448]	; 0xd78
    526c:	e0822007 	add	r2, r2, r7
    5270:	e5828000 	str	r8, [r2]
    5274:	eafffa0f 	b	3ab8 <ipu_init_channel_buffer+0x880>
    5278:	e3a09000 	mov	r9, #0
    527c:	eaffff85 	b	5098 <ipu_init_channel_buffer+0x1e60>
    5280:	e3a09302 	mov	r9, #134217728	; 0x8000000
    5284:	eaffff83 	b	5098 <ipu_init_channel_buffer+0x1e60>
    5288:	e3a09201 	mov	r9, #268435456	; 0x10000000
    528c:	eaffff81 	b	5098 <ipu_init_channel_buffer+0x1e60>
    5290:	e59d202c 	ldr	r2, [sp, #44]	; 0x2c
    5294:	e1a0c0a7 	lsr	ip, r7, #1
    5298:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    529c:	e3580000 	cmp	r8, #0
    52a0:	e0010297 	mul	r1, r7, r2
    52a4:	e000029c 	mul	r0, ip, r2
    52a8:	e3832501 	orr	r2, r3, #4194304	; 0x400000
    52ac:	e08100a0 	add	r0, r1, r0, lsr #1
    52b0:	0affff5d 	beq	502c <ipu_init_channel_buffer+0x1df4>
    52b4:	e1a0708c 	lsl	r7, ip, #1
    52b8:	e3832843 	orr	r2, r3, #4390912	; 0x430000
    52bc:	e3822903 	orr	r2, r2, #49152	; 0xc000
    52c0:	e58d2078 	str	r2, [sp, #120]	; 0x78
    52c4:	e3570000 	cmp	r7, #0
    52c8:	1afff95d 	bne	3844 <ipu_init_channel_buffer+0x60c>
    52cc:	eafff960 	b	3854 <ipu_init_channel_buffer+0x61c>
    52d0:	e35a0000 	cmp	sl, #0
    52d4:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    52d8:	059d302c 	ldreq	r3, [sp, #44]	; 0x2c
    52dc:	11a0000a 	movne	r0, sl
    52e0:	e382291f 	orr	r2, r2, #507904	; 0x7c000
    52e4:	e58d2078 	str	r2, [sp, #120]	; 0x78
    52e8:	00000397 	muleq	r0, r7, r3
    52ec:	e3590000 	cmp	r9, #0
    52f0:	01a01080 	lsleq	r1, r0, #1
    52f4:	0afffff2 	beq	52c4 <ipu_init_channel_buffer+0x208c>
    52f8:	e1a01009 	mov	r1, r9
    52fc:	eafff94e 	b	383c <ipu_init_channel_buffer+0x604>
    5300:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    5304:	e19a3009 	orrs	r3, sl, r9
    5308:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    530c:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    5310:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    5314:	e1e02602 	mvn	r2, r2, lsl #12
    5318:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    531c:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    5320:	e1e02622 	mvn	r2, r2, lsr #12
    5324:	e3811903 	orr	r1, r1, #49152	; 0xc000
    5328:	e3833008 	orr	r3, r3, #8
    532c:	e58d1078 	str	r1, [sp, #120]	; 0x78
    5330:	e3801b02 	orr	r1, r0, #2048	; 0x800
    5334:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    5338:	e58d105c 	str	r1, [sp, #92]	; 0x5c
    533c:	1afff95f 	bne	38c0 <ipu_init_channel_buffer+0x688>
    5340:	eafff872 	b	3510 <ipu_init_channel_buffer+0x2d8>
    5344:	e59d3018 	ldr	r3, [sp, #24]
    5348:	e0832006 	add	r2, r3, r6
    534c:	e3013dde 	movw	r3, #7646	; 0x1dde
    5350:	e7d22003 	ldrb	r2, [r2, r3]
    5354:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    5358:	e3520000 	cmp	r2, #0
    535c:	0afffaa3 	beq	3df0 <ipu_init_channel_buffer+0xbb8>
    5360:	e287900a 	add	r9, r7, #10
    5364:	e1a08007 	mov	r8, r7
    5368:	e1a09109 	lsl	r9, r9, #2
    536c:	e3e0a015 	mvn	sl, #21
    5370:	e249b01c 	sub	fp, r9, #28
    5374:	eafffa24 	b	3c0c <ipu_init_channel_buffer+0x9d4>
    5378:	e3053941 	movw	r3, #22849	; 0x5941
    537c:	e3453655 	movt	r3, #22101	; 0x5655
    5380:	e1520003 	cmp	r2, r3
    5384:	1afff85b 	bne	34f8 <ipu_init_channel_buffer+0x2c0>
    5388:	eafff93f 	b	388c <ipu_init_channel_buffer+0x654>
    538c:	e1a02302 	lsl	r2, r2, #6
    5390:	e282a028 	add	sl, r2, #40	; 0x28
    5394:	e083300a 	add	r3, r3, sl
    5398:	e593b000 	ldr	fp, [r3]
    539c:	f57ff04f 	dsb	sy
    53a0:	e3cbb97f 	bic	fp, fp, #2080768	; 0x1fc000
    53a4:	e38bb907 	orr	fp, fp, #114688	; 0x1c000
    53a8:	f57ff04e 	dsb	st
    53ac:	ebfffffe 	bl	0 <arm_heavy_mb>
    53b0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    53b4:	e083a00a 	add	sl, r3, sl
    53b8:	e58ab000 	str	fp, [sl]
    53bc:	eafffd4a 	b	48ec <ipu_init_channel_buffer+0x16b4>
    53c0:	e3001000 	movw	r1, #0
    53c4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    53c8:	e3401000 	movt	r1, #0
    53cc:	ebfffffe 	bl	0 <dev_err>
    53d0:	e5953d78 	ldr	r3, [r5, #3448]	; 0xd78
    53d4:	eaffff4e 	b	5114 <ipu_init_channel_buffer+0x1edc>
    53d8:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    53dc:	e19a3009 	orrs	r3, sl, r9
    53e0:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    53e4:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    53e8:	e1e02602 	mvn	r2, r2, lsl #12
    53ec:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    53f0:	e3833c22 	orr	r3, r3, #8704	; 0x2200
    53f4:	e1e02622 	mvn	r2, r2, lsr #12
    53f8:	e3811903 	orr	r1, r1, #49152	; 0xc000
    53fc:	e3833018 	orr	r3, r3, #24
    5400:	e58d1078 	str	r1, [sp, #120]	; 0x78
    5404:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    5408:	1afff92c 	bne	38c0 <ipu_init_channel_buffer+0x688>
    540c:	eafff83f 	b	3510 <ipu_init_channel_buffer+0x2d8>
    5410:	e3a0a028 	mov	sl, #40	; 0x28
    5414:	e3a03c03 	mov	r3, #768	; 0x300
    5418:	e58d3044 	str	r3, [sp, #68]	; 0x44
    541c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5420:	e083300a 	add	r3, r3, sl
    5424:	e5939000 	ldr	r9, [r3]
    5428:	f57ff04f 	dsb	sy
    542c:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    5430:	e1839009 	orr	r9, r3, r9
    5434:	f57ff04e 	dsb	st
    5438:	ebfffffe 	bl	0 <arm_heavy_mb>
    543c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5440:	e083300a 	add	r3, r3, sl
    5444:	e5839000 	str	r9, [r3]
    5448:	eafffac4 	b	3f60 <ipu_init_channel_buffer+0xd28>
    544c:	e3a030c0 	mov	r3, #192	; 0xc0
    5450:	e3a0a028 	mov	sl, #40	; 0x28
    5454:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5458:	eaffffef 	b	541c <ipu_init_channel_buffer+0x21e4>
    545c:	e3a03703 	mov	r3, #786432	; 0xc0000
    5460:	e3a0a024 	mov	sl, #36	; 0x24
    5464:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5468:	eaffffeb 	b	541c <ipu_init_channel_buffer+0x21e4>
    546c:	e3a03803 	mov	r3, #196608	; 0x30000
    5470:	e3a0a024 	mov	sl, #36	; 0x24
    5474:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5478:	eaffffe7 	b	541c <ipu_init_channel_buffer+0x21e4>
    547c:	e3a03903 	mov	r3, #49152	; 0xc000
    5480:	e3a0a024 	mov	sl, #36	; 0x24
    5484:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5488:	eaffffe3 	b	541c <ipu_init_channel_buffer+0x21e4>
    548c:	e3a03a03 	mov	r3, #12288	; 0x3000
    5490:	e3a0a024 	mov	sl, #36	; 0x24
    5494:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5498:	eaffffdf 	b	541c <ipu_init_channel_buffer+0x21e4>
    549c:	e3a03b03 	mov	r3, #3072	; 0xc00
    54a0:	e3a0a024 	mov	sl, #36	; 0x24
    54a4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54a8:	eaffffdb 	b	541c <ipu_init_channel_buffer+0x21e4>
    54ac:	e3a03c03 	mov	r3, #768	; 0x300
    54b0:	e3a0a024 	mov	sl, #36	; 0x24
    54b4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54b8:	eaffffd7 	b	541c <ipu_init_channel_buffer+0x21e4>
    54bc:	e3a030c0 	mov	r3, #192	; 0xc0
    54c0:	e3a0a024 	mov	sl, #36	; 0x24
    54c4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54c8:	eaffffd3 	b	541c <ipu_init_channel_buffer+0x21e4>
    54cc:	e3a03030 	mov	r3, #48	; 0x30
    54d0:	e3a0a024 	mov	sl, #36	; 0x24
    54d4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54d8:	eaffffcf 	b	541c <ipu_init_channel_buffer+0x21e4>
    54dc:	e3a03030 	mov	r3, #48	; 0x30
    54e0:	e3a0a028 	mov	sl, #40	; 0x28
    54e4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54e8:	eaffffcb 	b	541c <ipu_init_channel_buffer+0x21e4>
    54ec:	e3a0300c 	mov	r3, #12
    54f0:	e3a0a028 	mov	sl, #40	; 0x28
    54f4:	e58d3044 	str	r3, [sp, #68]	; 0x44
    54f8:	eaffffc7 	b	541c <ipu_init_channel_buffer+0x21e4>
    54fc:	e3a03003 	mov	r3, #3
    5500:	e3a0a028 	mov	sl, #40	; 0x28
    5504:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5508:	eaffffc3 	b	541c <ipu_init_channel_buffer+0x21e4>
    550c:	e3a03603 	mov	r3, #3145728	; 0x300000
    5510:	e3a0a024 	mov	sl, #36	; 0x24
    5514:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5518:	eaffffbf 	b	541c <ipu_init_channel_buffer+0x21e4>
    551c:	e3a03b03 	mov	r3, #3072	; 0xc00
    5520:	e3a0a028 	mov	sl, #40	; 0x28
    5524:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5528:	eaffffbb 	b	541c <ipu_init_channel_buffer+0x21e4>
    552c:	e3a0300c 	mov	r3, #12
    5530:	e3a0a024 	mov	sl, #36	; 0x24
    5534:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5538:	eaffffb7 	b	541c <ipu_init_channel_buffer+0x21e4>
    553c:	e3a03003 	mov	r3, #3
    5540:	e58d3044 	str	r3, [sp, #68]	; 0x44
    5544:	e3a0a024 	mov	sl, #36	; 0x24
    5548:	eaffffb3 	b	541c <ipu_init_channel_buffer+0x21e4>
    554c:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5550:	e35a0000 	cmp	sl, #0
    5554:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    5558:	e58d2078 	str	r2, [sp, #120]	; 0x78
    555c:	1a000084 	bne	5774 <ipu_init_channel_buffer+0x253c>
    5560:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    5564:	e1a0100a 	mov	r1, sl
    5568:	e0000397 	mul	r0, r7, r3
    556c:	eaffff54 	b	52c4 <ipu_init_channel_buffer+0x208c>
    5570:	e35a0000 	cmp	sl, #0
    5574:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5578:	059d302c 	ldreq	r3, [sp, #44]	; 0x2c
    557c:	e1a010a7 	lsr	r1, r7, #1
    5580:	11a0000a 	movne	r0, sl
    5584:	e382299f 	orr	r2, r2, #2605056	; 0x27c000
    5588:	e58d2078 	str	r2, [sp, #120]	; 0x78
    558c:	00000397 	muleq	r0, r7, r3
    5590:	e3590000 	cmp	r9, #0
    5594:	e1a07001 	mov	r7, r1
    5598:	008010a0 	addeq	r1, r0, r0, lsr #1
    559c:	0affff48 	beq	52c4 <ipu_init_channel_buffer+0x208c>
    55a0:	eaffff54 	b	52f8 <ipu_init_channel_buffer+0x20c0>
    55a4:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    55a8:	e19a3009 	orrs	r3, sl, r9
    55ac:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    55b0:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    55b4:	e1e02602 	mvn	r2, r2, lsl #12
    55b8:	e38118e3 	orr	r1, r1, #14876672	; 0xe30000
    55bc:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    55c0:	e1e02622 	mvn	r2, r2, lsr #12
    55c4:	e3811903 	orr	r1, r1, #49152	; 0xc000
    55c8:	e3833c01 	orr	r3, r3, #256	; 0x100
    55cc:	e58d1078 	str	r1, [sp, #120]	; 0x78
    55d0:	e1cd27fc 	strd	r2, [sp, #124]	; 0x7c
    55d4:	1afff8b9 	bne	38c0 <ipu_init_channel_buffer+0x688>
    55d8:	eafff7cc 	b	3510 <ipu_init_channel_buffer+0x2d8>
    55dc:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    55e0:	e19a3009 	orrs	r3, sl, r9
    55e4:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    55e8:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    55ec:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    55f0:	e1e02602 	mvn	r2, r2, lsl #12
    55f4:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    55f8:	e3833931 	orr	r3, r3, #802816	; 0xc4000
    55fc:	e1e02622 	mvn	r2, r2, lsr #12
    5600:	e3811903 	orr	r1, r1, #49152	; 0xc000
    5604:	e3833c01 	orr	r3, r3, #256	; 0x100
    5608:	eaffff47 	b	532c <ipu_init_channel_buffer+0x20f4>
    560c:	e59d205c 	ldr	r2, [sp, #92]	; 0x5c
    5610:	e3580000 	cmp	r8, #0
    5614:	e59d3078 	ldr	r3, [sp, #120]	; 0x78
    5618:	e18a1009 	orr	r1, sl, r9
    561c:	e3822b06 	orr	r2, r2, #6144	; 0x1800
    5620:	e58d205c 	str	r2, [sp, #92]	; 0x5c
    5624:	0a000041 	beq	5730 <ipu_init_channel_buffer+0x24f8>
    5628:	e5952ebc 	ldr	r2, [r5, #3772]	; 0xebc
    562c:	e3520000 	cmp	r2, #0
    5630:	1a00003e 	bne	5730 <ipu_init_channel_buffer+0x24f8>
    5634:	e3833401 	orr	r3, r3, #16777216	; 0x1000000
    5638:	e3510000 	cmp	r1, #0
    563c:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    5640:	e58d3078 	str	r3, [sp, #120]	; 0x78
    5644:	1afff89d 	bne	38c0 <ipu_init_channel_buffer+0x688>
    5648:	eafff7b0 	b	3510 <ipu_init_channel_buffer+0x2d8>
    564c:	e35a0000 	cmp	sl, #0
    5650:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5654:	059d302c 	ldreq	r3, [sp, #44]	; 0x2c
    5658:	11a0000a 	movne	r0, sl
    565c:	00000397 	muleq	r0, r7, r3
    5660:	e3580000 	cmp	r8, #0
    5664:	0a00003d 	beq	5760 <ipu_init_channel_buffer+0x2528>
    5668:	e5951ebc 	ldr	r1, [r5, #3772]	; 0xebc
    566c:	e3510000 	cmp	r1, #0
    5670:	1382288f 	orrne	r2, r2, #9371648	; 0x8f0000
    5674:	03822883 	orreq	r2, r2, #8585216	; 0x830000
    5678:	e3822903 	orr	r2, r2, #49152	; 0xc000
    567c:	13a01000 	movne	r1, #0
    5680:	01a07087 	lsleq	r7, r7, #1
    5684:	e58d2078 	str	r2, [sp, #120]	; 0x78
    5688:	eaffff0d 	b	52c4 <ipu_init_channel_buffer+0x208c>
    568c:	e59d2078 	ldr	r2, [sp, #120]	; 0x78
    5690:	e19a3009 	orrs	r3, sl, r9
    5694:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    5698:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    569c:	e59d107c 	ldr	r1, [sp, #124]	; 0x7c
    56a0:	e38228e7 	orr	r2, r2, #15138816	; 0xe70000
    56a4:	e3833db3 	orr	r3, r3, #11456	; 0x2cc0
    56a8:	e3822903 	orr	r2, r2, #49152	; 0xc000
    56ac:	e3833001 	orr	r3, r3, #1
    56b0:	e3800b06 	orr	r0, r0, #6144	; 0x1800
    56b4:	e3811549 	orr	r1, r1, #306184192	; 0x12400000
    56b8:	e58d2078 	str	r2, [sp, #120]	; 0x78
    56bc:	e58d3080 	str	r3, [sp, #128]	; 0x80
    56c0:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    56c4:	e58d107c 	str	r1, [sp, #124]	; 0x7c
    56c8:	1afff87c 	bne	38c0 <ipu_init_channel_buffer+0x688>
    56cc:	eafff78f 	b	3510 <ipu_init_channel_buffer+0x2d8>
    56d0:	e59d207c 	ldr	r2, [sp, #124]	; 0x7c
    56d4:	e19a3009 	orrs	r3, sl, r9
    56d8:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    56dc:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    56e0:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    56e4:	e1e02602 	mvn	r2, r2, lsl #12
    56e8:	e3811739 	orr	r1, r1, #14942208	; 0xe40000
    56ec:	e3833703 	orr	r3, r3, #786432	; 0xc0000
    56f0:	e1e02622 	mvn	r2, r2, lsr #12
    56f4:	e3811903 	orr	r1, r1, #49152	; 0xc000
    56f8:	e3833e11 	orr	r3, r3, #272	; 0x110
    56fc:	eaffff0a 	b	532c <ipu_init_channel_buffer+0x20f4>
    5700:	e59d1078 	ldr	r1, [sp, #120]	; 0x78
    5704:	e19a3009 	orrs	r3, sl, r9
    5708:	e59d2080 	ldr	r2, [sp, #128]	; 0x80
    570c:	e59d307c 	ldr	r3, [sp, #124]	; 0x7c
    5710:	e38118e7 	orr	r1, r1, #15138816	; 0xe70000
    5714:	e59d005c 	ldr	r0, [sp, #92]	; 0x5c
    5718:	e3822c31 	orr	r2, r2, #12544	; 0x3100
    571c:	e3811903 	orr	r1, r1, #49152	; 0xc000
    5720:	e383346d 	orr	r3, r3, #1828716544	; 0x6d000000
    5724:	e3822004 	orr	r2, r2, #4
    5728:	e383360b 	orr	r3, r3, #11534336	; 0xb00000
    572c:	eafff817 	b	3790 <ipu_init_channel_buffer+0x558>
    5730:	e3833741 	orr	r3, r3, #17039360	; 0x1040000
    5734:	e3510000 	cmp	r1, #0
    5738:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    573c:	e58d3078 	str	r3, [sp, #120]	; 0x78
    5740:	1afff85e 	bne	38c0 <ipu_init_channel_buffer+0x688>
    5744:	eafff771 	b	3510 <ipu_init_channel_buffer+0x2d8>
    5748:	e3833751 	orr	r3, r3, #21233664	; 0x1440000
    574c:	e3510000 	cmp	r1, #0
    5750:	e383390f 	orr	r3, r3, #245760	; 0x3c000
    5754:	e58d3078 	str	r3, [sp, #120]	; 0x78
    5758:	1afff858 	bne	38c0 <ipu_init_channel_buffer+0x688>
    575c:	eafff76b 	b	3510 <ipu_init_channel_buffer+0x2d8>
    5760:	e3822887 	orr	r2, r2, #8847360	; 0x870000
    5764:	e1a01008 	mov	r1, r8
    5768:	e3822903 	orr	r2, r2, #49152	; 0xc000
    576c:	e58d2078 	str	r2, [sp, #120]	; 0x78
    5770:	eafffed3 	b	52c4 <ipu_init_channel_buffer+0x208c>
    5774:	e3a01000 	mov	r1, #0
    5778:	eafff82e 	b	3838 <ipu_init_channel_buffer+0x600>
    577c:	e59d3018 	ldr	r3, [sp, #24]
    5780:	e3001000 	movw	r1, #0
    5784:	e3401000 	movt	r1, #0
    5788:	e2833a01 	add	r3, r3, #4096	; 0x1000
    578c:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    5790:	ebfffffe 	bl	0 <dev_err>
    5794:	e3e00015 	mvn	r0, #21
    5798:	eafffa7d 	b	4194 <ipu_init_channel_buffer+0xf5c>
    579c:	e3002000 	movw	r2, #0
    57a0:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    57a4:	e3402000 	movt	r2, #0
    57a8:	e58db000 	str	fp, [sp]
    57ac:	e1a03006 	mov	r3, r6
    57b0:	e59f00d8 	ldr	r0, [pc, #216]	; 5890 <ipu_init_channel_buffer+0x2658>
    57b4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    57b8:	e5959d78 	ldr	r9, [r5, #3448]	; 0xd78
    57bc:	e089b00a 	add	fp, r9, sl
    57c0:	eafff89d 	b	3a3c <ipu_init_channel_buffer+0x804>
    57c4:	e59d3018 	ldr	r3, [sp, #24]
    57c8:	e3001000 	movw	r1, #0
    57cc:	e3401000 	movt	r1, #0
    57d0:	e2832a01 	add	r2, r3, #4096	; 0x1000
    57d4:	e5920d84 	ldr	r0, [r2, #3460]	; 0xd84
    57d8:	e1a02007 	mov	r2, r7
    57dc:	ebfffffe 	bl	0 <dev_err>
    57e0:	e3e00015 	mvn	r0, #21
    57e4:	eafffa6a 	b	4194 <ipu_init_channel_buffer+0xf5c>
    57e8:	e3e00015 	mvn	r0, #21
    57ec:	eafffa68 	b	4194 <ipu_init_channel_buffer+0xf5c>
    57f0:	e59d3018 	ldr	r3, [sp, #24]
    57f4:	e3001000 	movw	r1, #0
    57f8:	e1a02006 	mov	r2, r6
    57fc:	e3401000 	movt	r1, #0
    5800:	e2833a01 	add	r3, r3, #4096	; 0x1000
    5804:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    5808:	ebfffffe 	bl	0 <dev_err>
    580c:	e3e00015 	mvn	r0, #21
    5810:	eafffa5f 	b	4194 <ipu_init_channel_buffer+0xf5c>
    5814:	00000108 	andeq	r0, r0, r8, lsl #2
    5818:	000000d8 	ldrdeq	r0, [r0], -r8
    581c:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    5820:	00000078 	andeq	r0, r0, r8, ror r0
    5824:	00000090 	muleq	r0, r0, r0
    5828:	000000a8 	andeq	r0, r0, r8, lsr #1
    582c:	000000c0 	andeq	r0, r0, r0, asr #1
    5830:	00000120 	andeq	r0, r0, r0, lsr #2
    5834:	00000138 	andeq	r0, r0, r8, lsr r1
    5838:	00000360 	andeq	r0, r0, r0, ror #6
    583c:	00000348 	andeq	r0, r0, r8, asr #6
    5840:	00000330 	andeq	r0, r0, r0, lsr r3
    5844:	00000318 	andeq	r0, r0, r8, lsl r3
    5848:	00000300 	andeq	r0, r0, r0, lsl #6
    584c:	000002e8 	andeq	r0, r0, r8, ror #5
    5850:	000002d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    5854:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
    5858:	000002a0 	andeq	r0, r0, r0, lsr #5
    585c:	00000288 	andeq	r0, r0, r8, lsl #5
    5860:	00000270 	andeq	r0, r0, r0, ror r2
    5864:	00000258 	andeq	r0, r0, r8, asr r2
    5868:	00000240 	andeq	r0, r0, r0, asr #4
    586c:	00000228 	andeq	r0, r0, r8, lsr #4
    5870:	00000210 	andeq	r0, r0, r0, lsl r2
    5874:	000001f8 	strdeq	r0, [r0], -r8
    5878:	000001e0 	andeq	r0, r0, r0, ror #3
    587c:	000001c8 	andeq	r0, r0, r8, asr #3
    5880:	000001b0 			; <UNDEFINED> instruction: 0x000001b0
    5884:	00000198 	muleq	r0, r8, r1
    5888:	00000180 	andeq	r0, r0, r0, lsl #3
    588c:	00000168 	andeq	r0, r0, r8, ror #2
    5890:	00000150 	andeq	r0, r0, r0, asr r1

00005894 <ipu_enable_channel>:
    5894:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5898:	e2809d79 	add	r9, r0, #7744	; 0x1e40
    589c:	e1a07000 	mov	r7, r0
    58a0:	e2899008 	add	r9, r9, #8
    58a4:	e1a08c41 	asr	r8, r1, #24
    58a8:	e24dd014 	sub	sp, sp, #20
    58ac:	e1a00009 	mov	r0, r9
    58b0:	e2875a01 	add	r5, r7, #4096	; 0x1000
    58b4:	e1a04001 	mov	r4, r1
    58b8:	ebfffffe 	bl	0 <mutex_lock>
    58bc:	e3a02001 	mov	r2, #1
    58c0:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    58c4:	e1a02812 	lsl	r2, r2, r8
    58c8:	e1120003 	tst	r2, r3
    58cc:	e58d2000 	str	r2, [sp]
    58d0:	1a0001b4 	bne	5fa8 <ipu_enable_channel+0x714>
    58d4:	e3003000 	movw	r3, #0
    58d8:	e300238a 	movw	r2, #906	; 0x38a
    58dc:	e3403000 	movt	r3, #0
    58e0:	e1a0b924 	lsr	fp, r4, #18
    58e4:	e19320b2 	ldrh	r2, [r3, r2]
    58e8:	e204a03f 	and	sl, r4, #63	; 0x3f
    58ec:	e20b603f 	and	r6, fp, #63	; 0x3f
    58f0:	e3120004 	tst	r2, #4
    58f4:	1a00018f 	bne	5f38 <ipu_enable_channel+0x6a4>
    58f8:	e30023a2 	movw	r2, #930	; 0x3a2
    58fc:	e19330b2 	ldrh	r3, [r3, r2]
    5900:	e3130004 	tst	r3, #4
    5904:	1a000185 	bne	5f20 <ipu_enable_channel+0x68c>
    5908:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    590c:	e5933000 	ldr	r3, [r3]
    5910:	f57ff04f 	dsb	sy
    5914:	e3e024f2 	mvn	r2, #-234881024	; 0xf2000000
    5918:	e1540002 	cmp	r4, r2
    591c:	0a00013b 	beq	5e10 <ipu_enable_channel+0x57c>
    5920:	e354040e 	cmp	r4, #234881024	; 0xe000000
    5924:	aa00001b 	bge	5998 <ipu_enable_channel+0x104>
    5928:	e30e2455 	movw	r2, #58453	; 0xe455
    592c:	e3402530 	movt	r2, #1328	; 0x530
    5930:	e1540002 	cmp	r4, r2
    5934:	0a00002d 	beq	59f0 <ipu_enable_channel+0x15c>
    5938:	da000142 	ble	5e48 <ipu_enable_channel+0x5b4>
    593c:	e30f2fff 	movw	r2, #65535	; 0xffff
    5940:	e3402773 	movt	r2, #1907	; 0x773
    5944:	e1540002 	cmp	r4, r2
    5948:	0a000169 	beq	5ef4 <ipu_enable_channel+0x660>
    594c:	da000190 	ble	5f94 <ipu_enable_channel+0x700>
    5950:	e30f2cff 	movw	r2, #64767	; 0xfcff
    5954:	e340295f 	movt	r2, #2399	; 0x95f
    5958:	e1540002 	cmp	r4, r2
    595c:	0a000146 	beq	5e7c <ipu_enable_channel+0x5e8>
    5960:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    5964:	e3402a6f 	movt	r2, #2671	; 0xa6f
    5968:	e1540002 	cmp	r4, r2
    596c:	1a000022 	bne	59fc <ipu_enable_channel+0x168>
    5970:	e5952e20 	ldr	r2, [r5, #3616]	; 0xe20
    5974:	e3520000 	cmp	r2, #0
    5978:	c3833020 	orrgt	r3, r3, #32
    597c:	e5952e1c 	ldr	r2, [r5, #3612]	; 0xe1c
    5980:	e3520000 	cmp	r2, #0
    5984:	e5952e24 	ldr	r2, [r5, #3620]	; 0xe24
    5988:	c3833c02 	orrgt	r3, r3, #512	; 0x200
    598c:	e3520000 	cmp	r2, #0
    5990:	c3833b01 	orrgt	r3, r3, #1024	; 0x400
    5994:	ea000018 	b	59fc <ipu_enable_channel+0x168>
    5998:	e30f2fc3 	movw	r2, #65475	; 0xffc3
    599c:	e34122ff 	movt	r2, #4863	; 0x12ff
    59a0:	e1540002 	cmp	r4, r2
    59a4:	0a00014e 	beq	5ee4 <ipu_enable_channel+0x650>
    59a8:	da000110 	ble	5df0 <ipu_enable_channel+0x55c>
    59ac:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    59b0:	e34124ff 	movt	r2, #5375	; 0x14ff
    59b4:	e1540002 	cmp	r4, r2
    59b8:	0a00000c 	beq	59f0 <ipu_enable_channel+0x15c>
    59bc:	da00016f 	ble	5f80 <ipu_enable_channel+0x6ec>
    59c0:	e30e2455 	movw	r2, #58453	; 0xe455
    59c4:	e3412624 	movt	r2, #5668	; 0x1624
    59c8:	e1540002 	cmp	r4, r2
    59cc:	0a000003 	beq	59e0 <ipu_enable_channel+0x14c>
    59d0:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    59d4:	e3412927 	movt	r2, #6439	; 0x1927
    59d8:	e1540002 	cmp	r4, r2
    59dc:	1a000006 	bne	59fc <ipu_enable_channel+0x168>
    59e0:	e5952e34 	ldr	r2, [r5, #3636]	; 0xe34
    59e4:	e3520000 	cmp	r2, #0
    59e8:	c3833a01 	orrgt	r3, r3, #4096	; 0x1000
    59ec:	c3833141 	orrgt	r3, r3, #1073741840	; 0x40000010
    59f0:	e5952e2c 	ldr	r2, [r5, #3628]	; 0xe2c
    59f4:	e3520000 	cmp	r2, #0
    59f8:	c3833004 	orrgt	r3, r3, #4
    59fc:	e58d3004 	str	r3, [sp, #4]
    5a00:	f57ff04e 	dsb	st
    5a04:	ebfffffe 	bl	0 <arm_heavy_mb>
    5a08:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    5a0c:	e59d3004 	ldr	r3, [sp, #4]
    5a10:	e5823000 	str	r3, [r2]
    5a14:	e356003f 	cmp	r6, #63	; 0x3f
    5a18:	0a000012 	beq	5a68 <ipu_enable_channel+0x1d4>
    5a1c:	e1a032a6 	lsr	r3, r6, #5
    5a20:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5a24:	e2833001 	add	r3, r3, #1
    5a28:	e1a03103 	lsl	r3, r3, #2
    5a2c:	e0822003 	add	r2, r2, r3
    5a30:	e58d3008 	str	r3, [sp, #8]
    5a34:	e5922000 	ldr	r2, [r2]
    5a38:	f57ff04f 	dsb	sy
    5a3c:	e3a00001 	mov	r0, #1
    5a40:	e20b101f 	and	r1, fp, #31
    5a44:	e1822110 	orr	r2, r2, r0, lsl r1
    5a48:	e58d2004 	str	r2, [sp, #4]
    5a4c:	f57ff04e 	dsb	st
    5a50:	ebfffffe 	bl	0 <arm_heavy_mb>
    5a54:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5a58:	e59d3008 	ldr	r3, [sp, #8]
    5a5c:	e59d2004 	ldr	r2, [sp, #4]
    5a60:	e0813003 	add	r3, r1, r3
    5a64:	e5832000 	str	r2, [r3]
    5a68:	e35a003f 	cmp	sl, #63	; 0x3f
    5a6c:	0a000012 	beq	5abc <ipu_enable_channel+0x228>
    5a70:	e1a032aa 	lsr	r3, sl, #5
    5a74:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5a78:	e2833001 	add	r3, r3, #1
    5a7c:	e1a03103 	lsl	r3, r3, #2
    5a80:	e0822003 	add	r2, r2, r3
    5a84:	e58d3008 	str	r3, [sp, #8]
    5a88:	e5922000 	ldr	r2, [r2]
    5a8c:	f57ff04f 	dsb	sy
    5a90:	e3a00001 	mov	r0, #1
    5a94:	e204101f 	and	r1, r4, #31
    5a98:	e1822110 	orr	r2, r2, r0, lsl r1
    5a9c:	e58d2004 	str	r2, [sp, #4]
    5aa0:	f57ff04e 	dsb	st
    5aa4:	ebfffffe 	bl	0 <arm_heavy_mb>
    5aa8:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5aac:	e59d3008 	ldr	r3, [sp, #8]
    5ab0:	e59d2004 	ldr	r2, [sp, #4]
    5ab4:	e0813003 	add	r3, r1, r3
    5ab8:	e5832000 	str	r2, [r3]
    5abc:	e0878008 	add	r8, r7, r8
    5ac0:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    5ac4:	e7d83003 	ldrb	r3, [r8, r3]
    5ac8:	e3530000 	cmp	r3, #0
    5acc:	0a000023 	beq	5b60 <ipu_enable_channel+0x2cc>
    5ad0:	e30f3496 	movw	r3, #62614	; 0xf496
    5ad4:	e30e1455 	movw	r1, #58453	; 0xe455
    5ad8:	e340362c 	movt	r3, #1580	; 0x62c
    5adc:	e3401530 	movt	r1, #1328	; 0x530
    5ae0:	e1540001 	cmp	r4, r1
    5ae4:	11540003 	cmpne	r4, r3
    5ae8:	e30e2455 	movw	r2, #58453	; 0xe455
    5aec:	03a03001 	moveq	r3, #1
    5af0:	13a03000 	movne	r3, #0
    5af4:	e3412624 	movt	r2, #5668	; 0x1624
    5af8:	e1540002 	cmp	r4, r2
    5afc:	03833001 	orreq	r3, r3, #1
    5b00:	e3530000 	cmp	r3, #0
    5b04:	0a000015 	beq	5b60 <ipu_enable_channel+0x2cc>
    5b08:	e1a01624 	lsr	r1, r4, #12
    5b0c:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5b10:	e201003f 	and	r0, r1, #63	; 0x3f
    5b14:	e1a032a0 	lsr	r3, r0, #5
    5b18:	e2833001 	add	r3, r3, #1
    5b1c:	e1a03103 	lsl	r3, r3, #2
    5b20:	e0822003 	add	r2, r2, r3
    5b24:	e5922000 	ldr	r2, [r2]
    5b28:	f57ff04f 	dsb	sy
    5b2c:	e350003f 	cmp	r0, #63	; 0x3f
    5b30:	e58d3004 	str	r3, [sp, #4]
    5b34:	1201101f 	andne	r1, r1, #31
    5b38:	13a00001 	movne	r0, #1
    5b3c:	11822110 	orrne	r2, r2, r0, lsl r1
    5b40:	e58d2008 	str	r2, [sp, #8]
    5b44:	f57ff04e 	dsb	st
    5b48:	ebfffffe 	bl	0 <arm_heavy_mb>
    5b4c:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5b50:	e59d3004 	ldr	r3, [sp, #4]
    5b54:	e59d2008 	ldr	r2, [sp, #8]
    5b58:	e0813003 	add	r3, r1, r3
    5b5c:	e5832000 	str	r2, [r3]
    5b60:	e3012dbe 	movw	r2, #7614	; 0x1dbe
    5b64:	e30f3cff 	movw	r3, #64767	; 0xfcff
    5b68:	e7d81002 	ldrb	r1, [r8, r2]
    5b6c:	e30f27ff 	movw	r2, #63487	; 0xf7ff
    5b70:	e340395f 	movt	r3, #2399	; 0x95f
    5b74:	e3402a6f 	movt	r2, #2671	; 0xa6f
    5b78:	e0443003 	sub	r3, r4, r3
    5b7c:	e0448002 	sub	r8, r4, r2
    5b80:	e3510000 	cmp	r1, #0
    5b84:	e16f3f13 	clz	r3, r3
    5b88:	e16f8f18 	clz	r8, r8
    5b8c:	e1a032a3 	lsr	r3, r3, #5
    5b90:	e1a082a8 	lsr	r8, r8, #5
    5b94:	0a00002c 	beq	5c4c <ipu_enable_channel+0x3b8>
    5b98:	e30f1496 	movw	r1, #62614	; 0xf496
    5b9c:	e30e2455 	movw	r2, #58453	; 0xe455
    5ba0:	e340162c 	movt	r1, #1580	; 0x62c
    5ba4:	e3402530 	movt	r2, #1328	; 0x530
    5ba8:	e1540002 	cmp	r4, r2
    5bac:	11540001 	cmpne	r4, r1
    5bb0:	1a00006d 	bne	5d6c <ipu_enable_channel+0x4d8>
    5bb4:	e1a00324 	lsr	r0, r4, #6
    5bb8:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    5bbc:	e200c03f 	and	ip, r0, #63	; 0x3f
    5bc0:	e1a022ac 	lsr	r2, ip, #5
    5bc4:	e2822001 	add	r2, r2, #1
    5bc8:	e1a02102 	lsl	r2, r2, #2
    5bcc:	e0811002 	add	r1, r1, r2
    5bd0:	e5911000 	ldr	r1, [r1]
    5bd4:	f57ff04f 	dsb	sy
    5bd8:	e35c003f 	cmp	ip, #63	; 0x3f
    5bdc:	e1cd20f8 	strd	r2, [sp, #8]
    5be0:	1200001f 	andne	r0, r0, #31
    5be4:	13a0c001 	movne	ip, #1
    5be8:	1181101c 	orrne	r1, r1, ip, lsl r0
    5bec:	e58d1004 	str	r1, [sp, #4]
    5bf0:	f57ff04e 	dsb	st
    5bf4:	ebfffffe 	bl	0 <arm_heavy_mb>
    5bf8:	e5950d4c 	ldr	r0, [r5, #3404]	; 0xd4c
    5bfc:	e59d2008 	ldr	r2, [sp, #8]
    5c00:	e59d1004 	ldr	r1, [sp, #4]
    5c04:	e0802002 	add	r2, r0, r2
    5c08:	e5821000 	str	r1, [r2]
    5c0c:	e1a02624 	lsr	r2, r4, #12
    5c10:	e590100c 	ldr	r1, [r0, #12]
    5c14:	f57ff04f 	dsb	sy
    5c18:	e202003f 	and	r0, r2, #63	; 0x3f
    5c1c:	e59d300c 	ldr	r3, [sp, #12]
    5c20:	e350003f 	cmp	r0, #63	; 0x3f
    5c24:	1202201f 	andne	r2, r2, #31
    5c28:	13a00001 	movne	r0, #1
    5c2c:	11811210 	orrne	r1, r1, r0, lsl r2
    5c30:	e98d000a 	stmib	sp, {r1, r3}
    5c34:	f57ff04e 	dsb	st
    5c38:	ebfffffe 	bl	0 <arm_heavy_mb>
    5c3c:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5c40:	e59d1004 	ldr	r1, [sp, #4]
    5c44:	e582100c 	str	r1, [r2, #12]
    5c48:	e59d3008 	ldr	r3, [sp, #8]
    5c4c:	e1883003 	orr	r3, r8, r3
    5c50:	e30f2fff 	movw	r2, #65535	; 0xffff
    5c54:	e3402773 	movt	r2, #1907	; 0x773
    5c58:	e1540002 	cmp	r4, r2
    5c5c:	03833001 	orreq	r3, r3, #1
    5c60:	e3530000 	cmp	r3, #0
    5c64:	0a000014 	beq	5cbc <ipu_enable_channel+0x428>
    5c68:	e1a032a6 	lsr	r3, r6, #5
    5c6c:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5c70:	e2833007 	add	r3, r3, #7
    5c74:	e1a08103 	lsl	r8, r3, #2
    5c78:	e0823008 	add	r3, r2, r8
    5c7c:	e5932000 	ldr	r2, [r3]
    5c80:	f57ff04f 	dsb	sy
    5c84:	e356003f 	cmp	r6, #63	; 0x3f
    5c88:	120bb01f 	andne	fp, fp, #31
    5c8c:	13a03001 	movne	r3, #1
    5c90:	11822b13 	orrne	r2, r2, r3, lsl fp
    5c94:	e58d2004 	str	r2, [sp, #4]
    5c98:	f57ff04e 	dsb	st
    5c9c:	ebfffffe 	bl	0 <arm_heavy_mb>
    5ca0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5ca4:	e59d2004 	ldr	r2, [sp, #4]
    5ca8:	e0833008 	add	r3, r3, r8
    5cac:	e5832000 	str	r2, [r3]
    5cb0:	e1a01004 	mov	r1, r4
    5cb4:	e1a00007 	mov	r0, r7
    5cb8:	ebfffffe 	bl	bde0 <_ipu_dp_dc_enable>
    5cbc:	e246300b 	sub	r3, r6, #11
    5cc0:	e2462011 	sub	r2, r6, #17
    5cc4:	e353000b 	cmp	r3, #11
    5cc8:	93a03001 	movls	r3, #1
    5ccc:	83a03000 	movhi	r3, #0
    5cd0:	e3520001 	cmp	r2, #1
    5cd4:	93a03000 	movls	r3, #0
    5cd8:	e3530000 	cmp	r3, #0
    5cdc:	1a00000f 	bne	5d20 <ipu_enable_channel+0x48c>
    5ce0:	e24a300b 	sub	r3, sl, #11
    5ce4:	e24a2011 	sub	r2, sl, #17
    5ce8:	e353000b 	cmp	r3, #11
    5cec:	93a03001 	movls	r3, #1
    5cf0:	83a03000 	movhi	r3, #0
    5cf4:	e3520001 	cmp	r2, #1
    5cf8:	93a03000 	movls	r3, #0
    5cfc:	e3530000 	cmp	r3, #0
    5d00:	1a000006 	bne	5d20 <ipu_enable_channel+0x48c>
    5d04:	e246602d 	sub	r6, r6, #45	; 0x2d
    5d08:	e3560005 	cmp	r6, #5
    5d0c:	9a000003 	bls	5d20 <ipu_enable_channel+0x48c>
    5d10:	e24a302d 	sub	r3, sl, #45	; 0x2d
    5d14:	e35a0005 	cmp	sl, #5
    5d18:	13530005 	cmpne	r3, #5
    5d1c:	8a000002 	bhi	5d2c <ipu_enable_channel+0x498>
    5d20:	e1a01004 	mov	r1, r4
    5d24:	e1a00007 	mov	r0, r7
    5d28:	ebfffffe 	bl	9500 <_ipu_ic_enable_task>
    5d2c:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    5d30:	e59d2000 	ldr	r2, [sp]
    5d34:	e1833002 	orr	r3, r3, r2
    5d38:	e5853e18 	str	r3, [r5, #3608]	; 0xe18
    5d3c:	e597403c 	ldr	r4, [r7, #60]	; 0x3c
    5d40:	e3540000 	cmp	r4, #0
    5d44:	0a000003 	beq	5d58 <ipu_enable_channel+0x4c4>
    5d48:	e1a00004 	mov	r0, r4
    5d4c:	ebfffffe 	bl	0 <clk_prepare>
    5d50:	e3500000 	cmp	r0, #0
    5d54:	0a000053 	beq	5ea8 <ipu_enable_channel+0x614>
    5d58:	e1a00009 	mov	r0, r9
    5d5c:	ebfffffe 	bl	0 <mutex_unlock>
    5d60:	e3a00000 	mov	r0, #0
    5d64:	e28dd014 	add	sp, sp, #20
    5d68:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    5d6c:	e1983003 	orrs	r3, r8, r3
    5d70:	0affffb6 	beq	5c50 <ipu_enable_channel+0x3bc>
    5d74:	e1a02324 	lsr	r2, r4, #6
    5d78:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5d7c:	e202103f 	and	r1, r2, #63	; 0x3f
    5d80:	e1a082a1 	lsr	r8, r1, #5
    5d84:	e2888001 	add	r8, r8, #1
    5d88:	e1a08108 	lsl	r8, r8, #2
    5d8c:	e0833008 	add	r3, r3, r8
    5d90:	e5933000 	ldr	r3, [r3]
    5d94:	f57ff04f 	dsb	sy
    5d98:	e351003f 	cmp	r1, #63	; 0x3f
    5d9c:	1202201f 	andne	r2, r2, #31
    5da0:	13a01001 	movne	r1, #1
    5da4:	11833211 	orrne	r3, r3, r1, lsl r2
    5da8:	e58d3004 	str	r3, [sp, #4]
    5dac:	f57ff04e 	dsb	st
    5db0:	ebfffffe 	bl	0 <arm_heavy_mb>
    5db4:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    5db8:	e59d3004 	ldr	r3, [sp, #4]
    5dbc:	e0828008 	add	r8, r2, r8
    5dc0:	e5883000 	str	r3, [r8]
    5dc4:	e592800c 	ldr	r8, [r2, #12]
    5dc8:	f57ff04f 	dsb	sy
    5dcc:	e356003f 	cmp	r6, #63	; 0x3f
    5dd0:	120b301f 	andne	r3, fp, #31
    5dd4:	13a02001 	movne	r2, #1
    5dd8:	11888312 	orrne	r8, r8, r2, lsl r3
    5ddc:	f57ff04e 	dsb	st
    5de0:	ebfffffe 	bl	0 <arm_heavy_mb>
    5de4:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    5de8:	e583800c 	str	r8, [r3, #12]
    5dec:	eaffff9d 	b	5c68 <ipu_enable_channel+0x3d4>
    5df0:	e30f2fc0 	movw	r2, #65472	; 0xffc0
    5df4:	e3402fff 	movt	r2, #4095	; 0xfff
    5df8:	e1540002 	cmp	r4, r2
    5dfc:	0a000038 	beq	5ee4 <ipu_enable_channel+0x650>
    5e00:	ca00002f 	bgt	5ec4 <ipu_enable_channel+0x630>
    5e04:	e3e024f1 	mvn	r2, #-251658240	; 0xf1000000
    5e08:	e1540002 	cmp	r4, r2
    5e0c:	1afffefa 	bne	59fc <ipu_enable_channel+0x168>
    5e10:	e5d51d9d 	ldrb	r1, [r5, #3485]	; 0xd9d
    5e14:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5e18:	e282200e 	add	r2, r2, #14
    5e1c:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5e20:	e3520000 	cmp	r2, #0
    5e24:	da000003 	ble	5e38 <ipu_enable_channel+0x5a4>
    5e28:	e3510000 	cmp	r1, #0
    5e2c:	03a02040 	moveq	r2, #64	; 0x40
    5e30:	13a02080 	movne	r2, #128	; 0x80
    5e34:	e1833002 	orr	r3, r3, r2
    5e38:	e5952e1c 	ldr	r2, [r5, #3612]	; 0xe1c
    5e3c:	e3520000 	cmp	r2, #0
    5e40:	c3833c02 	orrgt	r3, r3, #512	; 0x200
    5e44:	eafffeec 	b	59fc <ipu_enable_channel+0x168>
    5e48:	e30f2ff1 	movw	r2, #65521	; 0xfff1
    5e4c:	e34022bb 	movt	r2, #699	; 0x2bb
    5e50:	e1540002 	cmp	r4, r2
    5e54:	0a000004 	beq	5e6c <ipu_enable_channel+0x5d8>
    5e58:	da00003e 	ble	5f58 <ipu_enable_channel+0x6c4>
    5e5c:	e30f2ff2 	movw	r2, #65522	; 0xfff2
    5e60:	e34023bf 	movt	r2, #959	; 0x3bf
    5e64:	e1540002 	cmp	r4, r2
    5e68:	1a00003f 	bne	5f6c <ipu_enable_channel+0x6d8>
    5e6c:	e5952e30 	ldr	r2, [r5, #3632]	; 0xe30
    5e70:	e3520000 	cmp	r2, #0
    5e74:	c3833008 	orrgt	r3, r3, #8
    5e78:	eafffedc 	b	59f0 <ipu_enable_channel+0x15c>
    5e7c:	e5d51d99 	ldrb	r1, [r5, #3481]	; 0xd99
    5e80:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5e84:	e282200e 	add	r2, r2, #14
    5e88:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5e8c:	e3520000 	cmp	r2, #0
    5e90:	dafffeb6 	ble	5970 <ipu_enable_channel+0xdc>
    5e94:	e3510000 	cmp	r1, #0
    5e98:	03a02040 	moveq	r2, #64	; 0x40
    5e9c:	13a02080 	movne	r2, #128	; 0x80
    5ea0:	e1833002 	orr	r3, r3, r2
    5ea4:	eafffeb1 	b	5970 <ipu_enable_channel+0xdc>
    5ea8:	e1a00004 	mov	r0, r4
    5eac:	ebfffffe 	bl	0 <clk_enable>
    5eb0:	e3500000 	cmp	r0, #0
    5eb4:	0affffa7 	beq	5d58 <ipu_enable_channel+0x4c4>
    5eb8:	e1a00004 	mov	r0, r4
    5ebc:	ebfffffe 	bl	0 <clk_unprepare>
    5ec0:	eaffffa4 	b	5d58 <ipu_enable_channel+0x4c4>
    5ec4:	e30f2fc1 	movw	r2, #65473	; 0xffc1
    5ec8:	e34120ff 	movt	r2, #4351	; 0x10ff
    5ecc:	e1540002 	cmp	r4, r2
    5ed0:	0a000003 	beq	5ee4 <ipu_enable_channel+0x650>
    5ed4:	e30f2fc2 	movw	r2, #65474	; 0xffc2
    5ed8:	e34121ff 	movt	r2, #4607	; 0x11ff
    5edc:	e1540002 	cmp	r4, r2
    5ee0:	1afffec5 	bne	59fc <ipu_enable_channel+0x168>
    5ee4:	e5952e28 	ldr	r2, [r5, #3624]	; 0xe28
    5ee8:	e3520000 	cmp	r2, #0
    5eec:	c3833c01 	orrgt	r3, r3, #256	; 0x100
    5ef0:	eafffec1 	b	59fc <ipu_enable_channel+0x168>
    5ef4:	e5d51d95 	ldrb	r1, [r5, #3477]	; 0xd95
    5ef8:	e2812d1e 	add	r2, r1, #1920	; 0x780
    5efc:	e282200e 	add	r2, r2, #14
    5f00:	e7972102 	ldr	r2, [r7, r2, lsl #2]
    5f04:	e3520000 	cmp	r2, #0
    5f08:	dafffe9b 	ble	597c <ipu_enable_channel+0xe8>
    5f0c:	e3510000 	cmp	r1, #0
    5f10:	03a02040 	moveq	r2, #64	; 0x40
    5f14:	13a02080 	movne	r2, #128	; 0x80
    5f18:	e1833002 	orr	r3, r3, r2
    5f1c:	eafffe96 	b	597c <ipu_enable_channel+0xe8>
    5f20:	e3001000 	movw	r1, #0
    5f24:	e1a02006 	mov	r2, r6
    5f28:	e3401000 	movt	r1, #0
    5f2c:	e59f0098 	ldr	r0, [pc, #152]	; 5fcc <ipu_enable_channel+0x738>
    5f30:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    5f34:	eafffe73 	b	5908 <ipu_enable_channel+0x74>
    5f38:	e3001000 	movw	r1, #0
    5f3c:	e2830fde 	add	r0, r3, #888	; 0x378
    5f40:	e1a0200a 	mov	r2, sl
    5f44:	e3401000 	movt	r1, #0
    5f48:	e58d3004 	str	r3, [sp, #4]
    5f4c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    5f50:	e59d3004 	ldr	r3, [sp, #4]
    5f54:	eafffe67 	b	58f8 <ipu_enable_channel+0x64>
    5f58:	e30f2ff0 	movw	r2, #65520	; 0xfff0
    5f5c:	e34021b7 	movt	r2, #439	; 0x1b7
    5f60:	e1540002 	cmp	r4, r2
    5f64:	0affffc0 	beq	5e6c <ipu_enable_channel+0x5d8>
    5f68:	eafffea3 	b	59fc <ipu_enable_channel+0x168>
    5f6c:	e30e2454 	movw	r2, #58452	; 0xe454
    5f70:	e3402430 	movt	r2, #1072	; 0x430
    5f74:	e1540002 	cmp	r4, r2
    5f78:	0afffe9c 	beq	59f0 <ipu_enable_channel+0x15c>
    5f7c:	eafffe9e 	b	59fc <ipu_enable_channel+0x168>
    5f80:	e30f2fd4 	movw	r2, #65492	; 0xffd4
    5f84:	e34123ff 	movt	r2, #5119	; 0x13ff
    5f88:	e1540002 	cmp	r4, r2
    5f8c:	0afffe97 	beq	59f0 <ipu_enable_channel+0x15c>
    5f90:	eafffe99 	b	59fc <ipu_enable_channel+0x168>
    5f94:	e30f2496 	movw	r2, #62614	; 0xf496
    5f98:	e340262c 	movt	r2, #1580	; 0x62c
    5f9c:	e1540002 	cmp	r4, r2
    5fa0:	0afffe92 	beq	59f0 <ipu_enable_channel+0x15c>
    5fa4:	eafffe94 	b	59fc <ipu_enable_channel+0x168>
    5fa8:	e3001000 	movw	r1, #0
    5fac:	e1a02008 	mov	r2, r8
    5fb0:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    5fb4:	e3401000 	movt	r1, #0
    5fb8:	ebfffffe 	bl	0 <dev_err>
    5fbc:	e1a00009 	mov	r0, r9
    5fc0:	ebfffffe 	bl	0 <mutex_unlock>
    5fc4:	e3e0000c 	mvn	r0, #12
    5fc8:	eaffff65 	b	5d64 <ipu_enable_channel+0x4d0>
    5fcc:	00000390 	muleq	r0, r0, r3

00005fd0 <ipu_sync_irq_handler>:
    5fd0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    5fd4:	e2813d79 	add	r3, r1, #7744	; 0x1e40
    5fd8:	e59fe1d8 	ldr	lr, [pc, #472]	; 61b8 <ipu_sync_irq_handler+0x1e8>
    5fdc:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    5fe0:	e283301c 	add	r3, r3, #28
    5fe4:	e1a08001 	mov	r8, r1
    5fe8:	e1a04003 	mov	r4, r3
    5fec:	e58d3008 	str	r3, [sp, #8]
    5ff0:	e28dc010 	add	ip, sp, #16
    5ff4:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    5ff8:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    5ffc:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
    6000:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
    6004:	e89e0003 	ldm	lr, {r0, r1}
    6008:	e88c0003 	stm	ip, {r0, r1}
    600c:	e1a00004 	mov	r0, r4
    6010:	ebfffffe 	bl	0 <_raw_spin_lock>
    6014:	e59d3010 	ldr	r3, [sp, #16]
    6018:	e3530000 	cmp	r3, #0
    601c:	0a00005b 	beq	6190 <ipu_sync_irq_handler+0x1c0>
    6020:	e3002000 	movw	r2, #0
    6024:	e28da010 	add	sl, sp, #16
    6028:	e3402000 	movt	r2, #0
    602c:	e3a09000 	mov	r9, #0
    6030:	e58d200c 	str	r2, [sp, #12]
    6034:	e2882a01 	add	r2, r8, #4096	; 0x1000
    6038:	e58d2004 	str	r2, [sp, #4]
    603c:	e5982004 	ldr	r2, [r8, #4]
    6040:	e59d1004 	ldr	r1, [sp, #4]
    6044:	e3520000 	cmp	r2, #0
    6048:	1283307f 	addne	r3, r3, #127	; 0x7f
    604c:	02833039 	addeq	r3, r3, #57	; 0x39
    6050:	e5912d48 	ldr	r2, [r1, #3400]	; 0xd48
    6054:	e1a03103 	lsl	r3, r3, #2
    6058:	e0823003 	add	r3, r2, r3
    605c:	e5934000 	ldr	r4, [r3]
    6060:	f57ff04f 	dsb	sy
    6064:	e59a2000 	ldr	r2, [sl]
    6068:	e5913d48 	ldr	r3, [r1, #3400]	; 0xd48
    606c:	e282200e 	add	r2, r2, #14
    6070:	e0833102 	add	r3, r3, r2, lsl #2
    6074:	e5933000 	ldr	r3, [r3]
    6078:	e1a02003 	mov	r2, r3
    607c:	e58d3000 	str	r3, [sp]
    6080:	f57ff04f 	dsb	sy
    6084:	e5983004 	ldr	r3, [r8, #4]
    6088:	e0044002 	and	r4, r4, r2
    608c:	e59a5000 	ldr	r5, [sl]
    6090:	e3530000 	cmp	r3, #0
    6094:	1285507f 	addne	r5, r5, #127	; 0x7f
    6098:	02855039 	addeq	r5, r5, #57	; 0x39
    609c:	e1a05105 	lsl	r5, r5, #2
    60a0:	f57ff04e 	dsb	st
    60a4:	ebfffffe 	bl	0 <arm_heavy_mb>
    60a8:	e59d3004 	ldr	r3, [sp, #4]
    60ac:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    60b0:	e0835005 	add	r5, r3, r5
    60b4:	e5854000 	str	r4, [r5]
    60b8:	e2643000 	rsb	r3, r4, #0
    60bc:	e3a06001 	mov	r6, #1
    60c0:	e0033004 	and	r3, r3, r4
    60c4:	e16f3f13 	clz	r3, r3
    60c8:	e3530020 	cmp	r3, #32
    60cc:	e263201f 	rsb	r2, r3, #31
    60d0:	e1e06216 	mvn	r6, r6, lsl r2
    60d4:	0a000033 	beq	61a8 <ipu_sync_irq_handler+0x1d8>
    60d8:	e59a7000 	ldr	r7, [sl]
    60dc:	e0044006 	and	r4, r4, r6
    60e0:	e2475001 	sub	r5, r7, #1
    60e4:	e0825285 	add	r5, r2, r5, lsl #5
    60e8:	e1a03205 	lsl	r3, r5, #4
    60ec:	e088b003 	add	fp, r8, r3
    60f0:	e59b3048 	ldr	r3, [fp, #72]	; 0x48
    60f4:	e2530000 	subs	r0, r3, #0
    60f8:	0a000025 	beq	6194 <ipu_sync_irq_handler+0x1c4>
    60fc:	ebfffffe 	bl	0 <temp_ldr_set_callback_addr>
    6100:	e59f30b4 	ldr	r3, [pc, #180]	; 61bc <ipu_sync_irq_handler+0x1ec>
    6104:	e1d330b0 	ldrh	r3, [r3]
    6108:	e3130004 	tst	r3, #4
    610c:	1a00001b 	bne	6180 <ipu_sync_irq_handler+0x1b0>
    6110:	e1a00005 	mov	r0, r5
    6114:	e59b1050 	ldr	r1, [fp, #80]	; 0x50
    6118:	ebfffffe 	bl	0 <ldr_fiq_callback>
    611c:	e59f309c 	ldr	r3, [pc, #156]	; 61c0 <ipu_sync_irq_handler+0x1f0>
    6120:	e1899000 	orr	r9, r9, r0
    6124:	e1d320b0 	ldrh	r2, [r3]
    6128:	e3120004 	tst	r2, #4
    612c:	1a00000d 	bne	6168 <ipu_sync_irq_handler+0x198>
    6130:	e59b3054 	ldr	r3, [fp, #84]	; 0x54
    6134:	e3130001 	tst	r3, #1
    6138:	0affffde 	beq	60b8 <ipu_sync_irq_handler+0xe8>
    613c:	e59d5000 	ldr	r5, [sp]
    6140:	e0055006 	and	r5, r5, r6
    6144:	e58d5000 	str	r5, [sp]
    6148:	f57ff04e 	dsb	st
    614c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6150:	e59d3004 	ldr	r3, [sp, #4]
    6154:	e287700e 	add	r7, r7, #14
    6158:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    615c:	e0837107 	add	r7, r3, r7, lsl #2
    6160:	e5875000 	str	r5, [r7]
    6164:	eaffffd3 	b	60b8 <ipu_sync_irq_handler+0xe8>
    6168:	e3001000 	movw	r1, #0
    616c:	e2430012 	sub	r0, r3, #18
    6170:	e3401000 	movt	r1, #0
    6174:	e1a02009 	mov	r2, r9
    6178:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    617c:	eaffffeb 	b	6130 <ipu_sync_irq_handler+0x160>
    6180:	e59d100c 	ldr	r1, [sp, #12]
    6184:	e59f0038 	ldr	r0, [pc, #56]	; 61c4 <ipu_sync_irq_handler+0x1f4>
    6188:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    618c:	eaffffdf 	b	6110 <ipu_sync_irq_handler+0x140>
    6190:	e1a09003 	mov	r9, r3
    6194:	e59d0008 	ldr	r0, [sp, #8]
    6198:	ebfffffe 	bl	0 <_raw_spin_unlock>
    619c:	e1a00009 	mov	r0, r9
    61a0:	e28dd03c 	add	sp, sp, #60	; 0x3c
    61a4:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    61a8:	e5ba3004 	ldr	r3, [sl, #4]!
    61ac:	e3530000 	cmp	r3, #0
    61b0:	1affffa1 	bne	603c <ipu_sync_irq_handler+0x6c>
    61b4:	eafffff6 	b	6194 <ipu_sync_irq_handler+0x1c4>
    61b8:	000001c4 	andeq	r0, r0, r4, asr #3
    61bc:	000003ba 			; <UNDEFINED> instruction: 0x000003ba
    61c0:	000003d2 	ldrdeq	r0, [r0], -r2
    61c4:	000003a8 	andeq	r0, r0, r8, lsr #7

000061c8 <_ipu_get>:
    61c8:	e92d4010 	push	{r4, lr}
    61cc:	e590000c 	ldr	r0, [r0, #12]
    61d0:	ebfffffe 	bl	0 <clk_enable>
    61d4:	e3500000 	cmp	r0, #0
    61d8:	a8bd8010 	popge	{r4, pc}
    61dc:	e7f001f2 	udf	#18

000061e0 <ipu_init_channel>:
    61e0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    61e4:	e3009000 	movw	r9, #0
    61e8:	e30033ea 	movw	r3, #1002	; 0x3ea
    61ec:	e3409000 	movt	r9, #0
    61f0:	e2804a01 	add	r4, r0, #4096	; 0x1000
    61f4:	e1a08000 	mov	r8, r0
    61f8:	e19930b3 	ldrh	r3, [r9, r3]
    61fc:	e24dd00c 	sub	sp, sp, #12
    6200:	e1a05001 	mov	r5, r1
    6204:	e1a0a002 	mov	sl, r2
    6208:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    620c:	e1a0bc41 	asr	fp, r1, #24
    6210:	e3130004 	tst	r3, #4
    6214:	1a000123 	bne	66a8 <ipu_init_channel+0x4c8>
    6218:	e3a01004 	mov	r1, #4
    621c:	ebfffffe 	bl	0 <__pm_runtime_resume>
    6220:	e2507000 	subs	r7, r0, #0
    6224:	ba000291 	blt	6c70 <ipu_init_channel+0xa90>
    6228:	e2886d79 	add	r6, r8, #7744	; 0x1e40
    622c:	e1a00008 	mov	r0, r8
    6230:	e2866008 	add	r6, r6, #8
    6234:	ebfffffe 	bl	61c8 <_ipu_get>
    6238:	e1a00006 	mov	r0, r6
    623c:	ebfffffe 	bl	0 <mutex_lock>
    6240:	f57ff04e 	dsb	st
    6244:	ebfffffe 	bl	0 <arm_heavy_mb>
    6248:	e3e07000 	mvn	r7, #0
    624c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6250:	e583704c 	str	r7, [r3, #76]	; 0x4c
    6254:	f57ff04e 	dsb	st
    6258:	ebfffffe 	bl	0 <arm_heavy_mb>
    625c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6260:	e5837050 	str	r7, [r3, #80]	; 0x50
    6264:	f57ff04e 	dsb	st
    6268:	ebfffffe 	bl	0 <arm_heavy_mb>
    626c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6270:	e583705c 	str	r7, [r3, #92]	; 0x5c
    6274:	f57ff04e 	dsb	st
    6278:	ebfffffe 	bl	0 <arm_heavy_mb>
    627c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6280:	e5837060 	str	r7, [r3, #96]	; 0x60
    6284:	e3a07001 	mov	r7, #1
    6288:	e5942e14 	ldr	r2, [r4, #3604]	; 0xe14
    628c:	e1a07b17 	lsl	r7, r7, fp
    6290:	e1170002 	tst	r7, r2
    6294:	1a000084 	bne	64ac <ipu_init_channel+0x2cc>
    6298:	e593b000 	ldr	fp, [r3]
    629c:	f57ff04f 	dsb	sy
    62a0:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    62a4:	e3403fff 	movt	r3, #4095	; 0xfff
    62a8:	e1550003 	cmp	r5, r3
    62ac:	0a0001b5 	beq	6988 <ipu_init_channel+0x7a8>
    62b0:	ca000039 	bgt	639c <ipu_init_channel+0x1bc>
    62b4:	e30f3496 	movw	r3, #62614	; 0xf496
    62b8:	e340362c 	movt	r3, #1580	; 0x62c
    62bc:	e1550003 	cmp	r5, r3
    62c0:	0a00017a 	beq	68b0 <ipu_init_channel+0x6d0>
    62c4:	da000011 	ble	6310 <ipu_init_channel+0x130>
    62c8:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    62cc:	e3403a6f 	movt	r3, #2671	; 0xa6f
    62d0:	e1550003 	cmp	r5, r3
    62d4:	0a0001d3 	beq	6a28 <ipu_init_channel+0x848>
    62d8:	ca0000af 	bgt	659c <ipu_init_channel+0x3bc>
    62dc:	e30f3fff 	movw	r3, #65535	; 0xffff
    62e0:	e3403773 	movt	r3, #1907	; 0x773
    62e4:	e1550003 	cmp	r5, r3
    62e8:	0a00018e 	beq	6928 <ipu_init_channel+0x748>
    62ec:	e30f3cff 	movw	r3, #64767	; 0xfcff
    62f0:	e340395f 	movt	r3, #2399	; 0x95f
    62f4:	e1550003 	cmp	r5, r3
    62f8:	1a000119 	bne	6764 <ipu_init_channel+0x584>
    62fc:	e59a3000 	ldr	r3, [sl]
    6300:	e3530001 	cmp	r3, #1
    6304:	9a000203 	bls	6b18 <ipu_init_channel+0x938>
    6308:	e3e07015 	mvn	r7, #21
    630c:	ea00001d 	b	6388 <ipu_init_channel+0x1a8>
    6310:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    6314:	e34033bf 	movt	r3, #959	; 0x3bf
    6318:	e1550003 	cmp	r5, r3
    631c:	0a0001e9 	beq	6ac8 <ipu_init_channel+0x8e8>
    6320:	ca0000ae 	bgt	65e0 <ipu_init_channel+0x400>
    6324:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    6328:	e34031b7 	movt	r3, #439	; 0x1b7
    632c:	e1550003 	cmp	r5, r3
    6330:	0a0001ee 	beq	6af0 <ipu_init_channel+0x910>
    6334:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    6338:	e34032bb 	movt	r3, #699	; 0x2bb
    633c:	e1550003 	cmp	r5, r3
    6340:	1a000107 	bne	6764 <ipu_init_channel+0x584>
    6344:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6348:	e1a0100a 	mov	r1, sl
    634c:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6350:	e1a00008 	mov	r0, r8
    6354:	e2822001 	add	r2, r2, #1
    6358:	e2833001 	add	r3, r3, #1
    635c:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6360:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6364:	ebfffffe 	bl	9bd4 <_ipu_ic_init_rotate_vf>
    6368:	e5943e14 	ldr	r3, [r4, #3604]	; 0xe14
    636c:	e1837007 	orr	r7, r3, r7
    6370:	e5847e14 	str	r7, [r4, #3604]	; 0xe14
    6374:	f57ff04e 	dsb	st
    6378:	ebfffffe 	bl	0 <arm_heavy_mb>
    637c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6380:	e583b000 	str	fp, [r3]
    6384:	e3a07000 	mov	r7, #0
    6388:	e1a00006 	mov	r0, r6
    638c:	ebfffffe 	bl	0 <mutex_unlock>
    6390:	e1a00007 	mov	r0, r7
    6394:	e28dd00c 	add	sp, sp, #12
    6398:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    639c:	e30e3455 	movw	r3, #58453	; 0xe455
    63a0:	e3413520 	movt	r3, #5408	; 0x1520
    63a4:	e1550003 	cmp	r5, r3
    63a8:	0a00012b 	beq	685c <ipu_init_channel+0x67c>
    63ac:	ca000045 	bgt	64c8 <ipu_init_channel+0x2e8>
    63b0:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    63b4:	e34132ff 	movt	r3, #4863	; 0x12ff
    63b8:	e1550003 	cmp	r5, r3
    63bc:	0a000171 	beq	6988 <ipu_init_channel+0x7a8>
    63c0:	da0000df 	ble	6744 <ipu_init_channel+0x564>
    63c4:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    63c8:	e34133ff 	movt	r3, #5119	; 0x13ff
    63cc:	e1550003 	cmp	r5, r3
    63d0:	0a0000e8 	beq	6778 <ipu_init_channel+0x598>
    63d4:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    63d8:	e34134ff 	movt	r3, #5375	; 0x14ff
    63dc:	e1550003 	cmp	r5, r3
    63e0:	1a0000df 	bne	6764 <ipu_init_channel+0x584>
    63e4:	e59a303c 	ldr	r3, [sl, #60]	; 0x3c
    63e8:	e3530001 	cmp	r3, #1
    63ec:	8affffc5 	bhi	6308 <ipu_init_channel+0x128>
    63f0:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    63f4:	e30e1455 	movw	r1, #58453	; 0xe455
    63f8:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    63fc:	e3411624 	movt	r1, #5668	; 0x1624
    6400:	e3413927 	movt	r3, #6439	; 0x1927
    6404:	e1520003 	cmp	r2, r3
    6408:	11520001 	cmpne	r2, r1
    640c:	0affffbd 	beq	6308 <ipu_init_channel+0x128>
    6410:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    6414:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    6418:	e34124ff 	movt	r2, #5375	; 0x14ff
    641c:	e5842d90 	str	r2, [r4, #3472]	; 0xd90
    6420:	e2833001 	add	r3, r3, #1
    6424:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6428:	e59a303c 	ldr	r3, [sl, #60]	; 0x3c
    642c:	e2833e76 	add	r3, r3, #1888	; 0x760
    6430:	e2833002 	add	r3, r3, #2
    6434:	e7882103 	str	r2, [r8, r3, lsl #2]
    6438:	e5da3048 	ldrb	r3, [sl, #72]	; 0x48
    643c:	e3530000 	cmp	r3, #0
    6440:	1a0001f7 	bne	6c24 <ipu_init_channel+0xa44>
    6444:	e59a203c 	ldr	r2, [sl, #60]	; 0x3c
    6448:	e3a03001 	mov	r3, #1
    644c:	e282101c 	add	r1, r2, #28
    6450:	e1cbb113 	bic	fp, fp, r3, lsl r1
    6454:	e3520000 	cmp	r2, #0
    6458:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    645c:	13cbb101 	bicne	fp, fp, #1073741824	; 0x40000000
    6460:	03cbb103 	biceq	fp, fp, #-1073741824	; 0xc0000000
    6464:	138bb102 	orrne	fp, fp, #-2147483648	; 0x80000000
    6468:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    646c:	f57ff04f 	dsb	sy
    6470:	e3c55102 	bic	r5, r5, #-2147483648	; 0x80000000
    6474:	f57ff04e 	dsb	st
    6478:	ebfffffe 	bl	0 <arm_heavy_mb>
    647c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6480:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    6484:	e30f1fd5 	movw	r1, #65493	; 0xffd5
    6488:	e59a203c 	ldr	r2, [sl, #60]	; 0x3c
    648c:	e1a00008 	mov	r0, r8
    6490:	e34114ff 	movt	r1, #5375	; 0x14ff
    6494:	ebfffffe 	bl	b00c <_ipu_csi_init>
    6498:	e1a0100a 	mov	r1, sl
    649c:	e1a00008 	mov	r0, r8
    64a0:	e3a02001 	mov	r2, #1
    64a4:	ebfffffe 	bl	98e4 <_ipu_ic_init_prpvf>
    64a8:	eaffffae 	b	6368 <ipu_init_channel+0x188>
    64ac:	e3001000 	movw	r1, #0
    64b0:	e1a0200b 	mov	r2, fp
    64b4:	e3401000 	movt	r1, #0
    64b8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    64bc:	ebfffffe 	bl	0 <dev_warn>
    64c0:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    64c4:	eaffff73 	b	6298 <ipu_init_channel+0xb8>
    64c8:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    64cc:	e3413823 	movt	r3, #6179	; 0x1823
    64d0:	e1550003 	cmp	r5, r3
    64d4:	0a0000e0 	beq	685c <ipu_init_channel+0x67c>
    64d8:	ca00007a 	bgt	66c8 <ipu_init_channel+0x4e8>
    64dc:	e30e3455 	movw	r3, #58453	; 0xe455
    64e0:	e3413624 	movt	r3, #5668	; 0x1624
    64e4:	e1550003 	cmp	r5, r3
    64e8:	1a0000d7 	bne	684c <ipu_init_channel+0x66c>
    64ec:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    64f0:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    64f4:	e30f0fc5 	movw	r0, #65477	; 0xffc5
    64f8:	e34134ff 	movt	r3, #5375	; 0x14ff
    64fc:	e3410927 	movt	r0, #6439	; 0x1927
    6500:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    6504:	e1520000 	cmp	r2, r0
    6508:	11520003 	cmpne	r2, r3
    650c:	e34113ff 	movt	r1, #5119	; 0x13ff
    6510:	03a03001 	moveq	r3, #1
    6514:	13a03000 	movne	r3, #0
    6518:	e1520001 	cmp	r2, r1
    651c:	03833001 	orreq	r3, r3, #1
    6520:	e3530000 	cmp	r3, #0
    6524:	1affff77 	bne	6308 <ipu_init_channel+0x128>
    6528:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    652c:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    6530:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    6534:	e2822001 	add	r2, r2, #1
    6538:	e5941d48 	ldr	r1, [r4, #3400]	; 0xd48
    653c:	e2833001 	add	r3, r3, #1
    6540:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6544:	e5843e34 	str	r3, [r4, #3636]	; 0xe34
    6548:	e59150a8 	ldr	r5, [r1, #168]	; 0xa8
    654c:	f57ff04f 	dsb	sy
    6550:	e3c55203 	bic	r5, r5, #805306368	; 0x30000000
    6554:	f57ff04e 	dsb	st
    6558:	ebfffffe 	bl	0 <arm_heavy_mb>
    655c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6560:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    6564:	e5da3020 	ldrb	r3, [sl, #32]
    6568:	e1a0100a 	mov	r1, sl
    656c:	e3a02000 	mov	r2, #0
    6570:	e1a00008 	mov	r0, r8
    6574:	e3530000 	cmp	r3, #0
    6578:	13a03001 	movne	r3, #1
    657c:	15c43db4 	strbne	r3, [r4, #3508]	; 0xdb4
    6580:	ebfffffe 	bl	98e4 <_ipu_ic_init_prpvf>
    6584:	e30e1455 	movw	r1, #58453	; 0xe455
    6588:	e1a0200a 	mov	r2, sl
    658c:	e1a00008 	mov	r0, r8
    6590:	e3411624 	movt	r1, #5668	; 0x1624
    6594:	ebfffffe 	bl	96f0 <_ipu_vdi_init>
    6598:	eaffff72 	b	6368 <ipu_init_channel+0x188>
    659c:	e3e034f2 	mvn	r3, #-234881024	; 0xf2000000
    65a0:	e1550003 	cmp	r5, r3
    65a4:	0a000131 	beq	6a70 <ipu_init_channel+0x890>
    65a8:	e3e034f1 	mvn	r3, #-251658240	; 0xf1000000
    65ac:	e1550003 	cmp	r5, r3
    65b0:	1a00006b 	bne	6764 <ipu_init_channel+0x584>
    65b4:	e59a3000 	ldr	r3, [sl]
    65b8:	e3530001 	cmp	r3, #1
    65bc:	8affff51 	bhi	6308 <ipu_init_channel+0x128>
    65c0:	e5c43d9d 	strb	r3, [r4, #3485]	; 0xd9d
    65c4:	e3053049 	movw	r3, #20553	; 0x5049
    65c8:	e3433055 	movt	r3, #12373	; 0x3055
    65cc:	e59a2000 	ldr	r2, [sl]
    65d0:	e3a01009 	mov	r1, #9
    65d4:	e58d3000 	str	r3, [sp]
    65d8:	e3a03000 	mov	r3, #0
    65dc:	ea00012d 	b	6a98 <ipu_init_channel+0x8b8>
    65e0:	e30e3454 	movw	r3, #58452	; 0xe454
    65e4:	e3403430 	movt	r3, #1072	; 0x430
    65e8:	e1550003 	cmp	r5, r3
    65ec:	0a00009f 	beq	6870 <ipu_init_channel+0x690>
    65f0:	e30e3455 	movw	r3, #58453	; 0xe455
    65f4:	e3403530 	movt	r3, #1328	; 0x530
    65f8:	e1550003 	cmp	r5, r3
    65fc:	1a000058 	bne	6764 <ipu_init_channel+0x584>
    6600:	e5da3020 	ldrb	r3, [sl, #32]
    6604:	e3530000 	cmp	r3, #0
    6608:	0a000016 	beq	6668 <ipu_init_channel+0x488>
    660c:	e59a3024 	ldr	r3, [sl, #36]	; 0x24
    6610:	e3042742 	movw	r2, #18242	; 0x4742
    6614:	e3432452 	movt	r2, #13394	; 0x3452
    6618:	e5da1030 	ldrb	r1, [sl, #48]	; 0x30
    661c:	e1530002 	cmp	r3, r2
    6620:	0a00015d 	beq	6b9c <ipu_init_channel+0x9bc>
    6624:	e3042742 	movw	r2, #18242	; 0x4742
    6628:	e3432452 	movt	r2, #13394	; 0x3452
    662c:	e1530002 	cmp	r3, r2
    6630:	e3042752 	movw	r2, #18258	; 0x4752
    6634:	9a000155 	bls	6b90 <ipu_init_channel+0x9b0>
    6638:	e3442142 	movt	r2, #16706	; 0x4142
    663c:	e1530002 	cmp	r3, r2
    6640:	0a000155 	beq	6b9c <ipu_init_channel+0x9bc>
    6644:	e3042742 	movw	r2, #18242	; 0x4742
    6648:	e3442152 	movt	r2, #16722	; 0x4152
    664c:	e1530002 	cmp	r3, r2
    6650:	0a000151 	beq	6b9c <ipu_init_channel+0x9bc>
    6654:	e3510000 	cmp	r1, #0
    6658:	13a03001 	movne	r3, #1
    665c:	15c43dc3 	strbne	r3, [r4, #3523]	; 0xdc3
    6660:	e3a03001 	mov	r3, #1
    6664:	e5c43da3 	strb	r3, [r4, #3491]	; 0xda3
    6668:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    666c:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    6670:	f57ff04f 	dsb	sy
    6674:	e3855102 	orr	r5, r5, #-2147483648	; 0x80000000
    6678:	f57ff04e 	dsb	st
    667c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6680:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6684:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    6688:	e3a02000 	mov	r2, #0
    668c:	e1a0100a 	mov	r1, sl
    6690:	e1a00008 	mov	r0, r8
    6694:	ebfffffe 	bl	98e4 <_ipu_ic_init_prpvf>
    6698:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    669c:	e2833001 	add	r3, r3, #1
    66a0:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    66a4:	eaffff2f 	b	6368 <ipu_init_channel+0x188>
    66a8:	e3002000 	movw	r2, #0
    66ac:	e1a01000 	mov	r1, r0
    66b0:	e3402000 	movt	r2, #0
    66b4:	e2890ff6 	add	r0, r9, #984	; 0x3d8
    66b8:	e1a0300b 	mov	r3, fp
    66bc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    66c0:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    66c4:	eafffed3 	b	6218 <ipu_init_channel+0x38>
    66c8:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    66cc:	e3413927 	movt	r3, #6439	; 0x1927
    66d0:	e1550003 	cmp	r5, r3
    66d4:	1a000128 	bne	6b7c <ipu_init_channel+0x99c>
    66d8:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    66dc:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    66e0:	e30e0455 	movw	r0, #58453	; 0xe455
    66e4:	e34134ff 	movt	r3, #5375	; 0x14ff
    66e8:	e3410624 	movt	r0, #5668	; 0x1624
    66ec:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    66f0:	e1520000 	cmp	r2, r0
    66f4:	11520003 	cmpne	r2, r3
    66f8:	e34113ff 	movt	r1, #5119	; 0x13ff
    66fc:	03a03001 	moveq	r3, #1
    6700:	13a03000 	movne	r3, #0
    6704:	e1520001 	cmp	r2, r1
    6708:	03833001 	orreq	r3, r3, #1
    670c:	e3530000 	cmp	r3, #0
    6710:	1afffefc 	bne	6308 <ipu_init_channel+0x128>
    6714:	e594ce2c 	ldr	ip, [r4, #3628]	; 0xe2c
    6718:	e1a0200a 	mov	r2, sl
    671c:	e5943e34 	ldr	r3, [r4, #3636]	; 0xe34
    6720:	e1a00008 	mov	r0, r8
    6724:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    6728:	e1a01005 	mov	r1, r5
    672c:	e28cc001 	add	ip, ip, #1
    6730:	e2833001 	add	r3, r3, #1
    6734:	e584ce2c 	str	ip, [r4, #3628]	; 0xe2c
    6738:	e5843e34 	str	r3, [r4, #3636]	; 0xe34
    673c:	ebfffffe 	bl	96f0 <_ipu_vdi_init>
    6740:	eaffff08 	b	6368 <ipu_init_channel+0x188>
    6744:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    6748:	e34130ff 	movt	r3, #4351	; 0x10ff
    674c:	e1550003 	cmp	r5, r3
    6750:	0a00008c 	beq	6988 <ipu_init_channel+0x7a8>
    6754:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    6758:	e34131ff 	movt	r3, #4607	; 0x11ff
    675c:	e1550003 	cmp	r5, r3
    6760:	0a000088 	beq	6988 <ipu_init_channel+0x7a8>
    6764:	e3001000 	movw	r1, #0
    6768:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    676c:	e3401000 	movt	r1, #0
    6770:	ebfffffe 	bl	0 <dev_err>
    6774:	eafffefb 	b	6368 <ipu_init_channel+0x188>
    6778:	e59a3020 	ldr	r3, [sl, #32]
    677c:	e3530001 	cmp	r3, #1
    6780:	8afffee0 	bhi	6308 <ipu_init_channel+0x128>
    6784:	e5942d90 	ldr	r2, [r4, #3472]	; 0xd90
    6788:	e30e1455 	movw	r1, #58453	; 0xe455
    678c:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6790:	e3411624 	movt	r1, #5668	; 0x1624
    6794:	e3413927 	movt	r3, #6439	; 0x1927
    6798:	e1520003 	cmp	r2, r3
    679c:	11520001 	cmpne	r2, r1
    67a0:	0afffed8 	beq	6308 <ipu_init_channel+0x128>
    67a4:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    67a8:	e3002402 	movw	r2, #1026	; 0x402
    67ac:	e5845d90 	str	r5, [r4, #3472]	; 0xd90
    67b0:	e19920b2 	ldrh	r2, [r9, r2]
    67b4:	e2833001 	add	r3, r3, #1
    67b8:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    67bc:	e59a3020 	ldr	r3, [sl, #32]
    67c0:	e3120004 	tst	r2, #4
    67c4:	e2833e76 	add	r3, r3, #1888	; 0x760
    67c8:	e2833002 	add	r3, r3, #2
    67cc:	e7885103 	str	r5, [r8, r3, lsl #2]
    67d0:	1a00011d 	bne	6c4c <ipu_init_channel+0xa6c>
    67d4:	e59a3020 	ldr	r3, [sl, #32]
    67d8:	e3a02001 	mov	r2, #1
    67dc:	e5da102c 	ldrb	r1, [sl, #44]	; 0x2c
    67e0:	e283c01c 	add	ip, r3, #28
    67e4:	e3510000 	cmp	r1, #0
    67e8:	e1a0cc12 	lsl	ip, r2, ip
    67ec:	01cbb00c 	biceq	fp, fp, ip
    67f0:	1a000104 	bne	6c08 <ipu_init_channel+0xa28>
    67f4:	e3530000 	cmp	r3, #0
    67f8:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    67fc:	13cbb101 	bicne	fp, fp, #1073741824	; 0x40000000
    6800:	03cbb103 	biceq	fp, fp, #-1073741824	; 0xc0000000
    6804:	138bb102 	orrne	fp, fp, #-2147483648	; 0x80000000
    6808:	e59350a8 	ldr	r5, [r3, #168]	; 0xa8
    680c:	f57ff04f 	dsb	sy
    6810:	e3c55101 	bic	r5, r5, #1073741824	; 0x40000000
    6814:	f57ff04e 	dsb	st
    6818:	ebfffffe 	bl	0 <arm_heavy_mb>
    681c:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6820:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    6824:	e30f1fd4 	movw	r1, #65492	; 0xffd4
    6828:	e59a2020 	ldr	r2, [sl, #32]
    682c:	e1a00008 	mov	r0, r8
    6830:	e34113ff 	movt	r1, #5119	; 0x13ff
    6834:	ebfffffe 	bl	b00c <_ipu_csi_init>
    6838:	e1a0100a 	mov	r1, sl
    683c:	e1a00008 	mov	r0, r8
    6840:	e3a02001 	mov	r2, #1
    6844:	ebfffffe 	bl	9c04 <_ipu_ic_init_prpenc>
    6848:	eafffec6 	b	6368 <ipu_init_channel+0x188>
    684c:	e30e3455 	movw	r3, #58453	; 0xe455
    6850:	e3413728 	movt	r3, #5928	; 0x1728
    6854:	e1550003 	cmp	r5, r3
    6858:	1affffc1 	bne	6764 <ipu_init_channel+0x584>
    685c:	e1a0200a 	mov	r2, sl
    6860:	e1a01005 	mov	r1, r5
    6864:	e1a00008 	mov	r0, r8
    6868:	ebfffffe 	bl	96f0 <_ipu_vdi_init>
    686c:	eafffebd 	b	6368 <ipu_init_channel+0x188>
    6870:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    6874:	e5942d48 	ldr	r2, [r4, #3400]	; 0xd48
    6878:	e2833001 	add	r3, r3, #1
    687c:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6880:	e59250a8 	ldr	r5, [r2, #168]	; 0xa8
    6884:	f57ff04f 	dsb	sy
    6888:	e3855101 	orr	r5, r5, #1073741824	; 0x40000000
    688c:	f57ff04e 	dsb	st
    6890:	ebfffffe 	bl	0 <arm_heavy_mb>
    6894:	e5943d48 	ldr	r3, [r4, #3400]	; 0xd48
    6898:	e58350a8 	str	r5, [r3, #168]	; 0xa8
    689c:	e3a02000 	mov	r2, #0
    68a0:	e1a0100a 	mov	r1, sl
    68a4:	e1a00008 	mov	r0, r8
    68a8:	ebfffffe 	bl	9c04 <_ipu_ic_init_prpenc>
    68ac:	eafffead 	b	6368 <ipu_init_channel+0x188>
    68b0:	e5da3020 	ldrb	r3, [sl, #32]
    68b4:	e3530000 	cmp	r3, #0
    68b8:	0a000013 	beq	690c <ipu_init_channel+0x72c>
    68bc:	e59a3024 	ldr	r3, [sl, #36]	; 0x24
    68c0:	e3042742 	movw	r2, #18242	; 0x4742
    68c4:	e3432452 	movt	r2, #13394	; 0x3452
    68c8:	e5da1030 	ldrb	r1, [sl, #48]	; 0x30
    68cc:	e1530002 	cmp	r3, r2
    68d0:	0a0000bd 	beq	6bcc <ipu_init_channel+0x9ec>
    68d4:	e3042752 	movw	r2, #18258	; 0x4752
    68d8:	9a0000b8 	bls	6bc0 <ipu_init_channel+0x9e0>
    68dc:	e3442142 	movt	r2, #16706	; 0x4142
    68e0:	e1530002 	cmp	r3, r2
    68e4:	0a0000b8 	beq	6bcc <ipu_init_channel+0x9ec>
    68e8:	e3042742 	movw	r2, #18242	; 0x4742
    68ec:	e3442152 	movt	r2, #16722	; 0x4152
    68f0:	e1530002 	cmp	r3, r2
    68f4:	0a0000b4 	beq	6bcc <ipu_init_channel+0x9ec>
    68f8:	e3510000 	cmp	r1, #0
    68fc:	13a03001 	movne	r3, #1
    6900:	15c43dc4 	strbne	r3, [r4, #3524]	; 0xdc4
    6904:	e3a03001 	mov	r3, #1
    6908:	e5c43da4 	strb	r3, [r4, #3492]	; 0xda4
    690c:	e1a0100a 	mov	r1, sl
    6910:	e1a00008 	mov	r0, r8
    6914:	ebfffffe 	bl	9df8 <_ipu_ic_init_pp>
    6918:	e5943e2c 	ldr	r3, [r4, #3628]	; 0xe2c
    691c:	e2833001 	add	r3, r3, #1
    6920:	e5843e2c 	str	r3, [r4, #3628]	; 0xe2c
    6924:	eafffe8f 	b	6368 <ipu_init_channel+0x188>
    6928:	e59a3000 	ldr	r3, [sl]
    692c:	e3530001 	cmp	r3, #1
    6930:	8afffe74 	bhi	6308 <ipu_init_channel+0x128>
    6934:	e5c43d95 	strb	r3, [r4, #3477]	; 0xd95
    6938:	e3a01001 	mov	r1, #1
    693c:	e59ac00c 	ldr	ip, [sl, #12]
    6940:	e1a00008 	mov	r0, r8
    6944:	e5da3004 	ldrb	r3, [sl, #4]
    6948:	e59a2000 	ldr	r2, [sl]
    694c:	e58dc000 	str	ip, [sp]
    6950:	ebfffffe 	bl	bdd0 <_ipu_dc_init>
    6954:	e59a3000 	ldr	r3, [sl]
    6958:	e0883103 	add	r3, r8, r3, lsl #2
    695c:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6960:	e5932e38 	ldr	r2, [r3, #3640]	; 0xe38
    6964:	e2822001 	add	r2, r2, #1
    6968:	e5832e38 	str	r2, [r3, #3640]	; 0xe38
    696c:	e5942e1c 	ldr	r2, [r4, #3612]	; 0xe1c
    6970:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    6974:	e2822001 	add	r2, r2, #1
    6978:	e2833001 	add	r3, r3, #1
    697c:	e5842e1c 	str	r2, [r4, #3612]	; 0xe1c
    6980:	e5843e24 	str	r3, [r4, #3620]	; 0xe24
    6984:	eafffe77 	b	6368 <ipu_init_channel+0x188>
    6988:	e59a3000 	ldr	r3, [sl]
    698c:	e3530001 	cmp	r3, #1
    6990:	8afffe5c 	bhi	6308 <ipu_init_channel+0x128>
    6994:	e5da200d 	ldrb	r2, [sl, #13]
    6998:	e205303f 	and	r3, r5, #63	; 0x3f
    699c:	e0883003 	add	r3, r8, r3
    69a0:	e3a0e001 	mov	lr, #1
    69a4:	e3520000 	cmp	r2, #0
    69a8:	13012dde 	movwne	r2, #7646	; 0x1dde
    69ac:	13a01001 	movne	r1, #1
    69b0:	03011dde 	movweq	r1, #7646	; 0x1dde
    69b4:	17c31002 	strbne	r1, [r3, r2]
    69b8:	07c32001 	strbeq	r2, [r3, r1]
    69bc:	e5943e28 	ldr	r3, [r4, #3624]	; 0xe28
    69c0:	e2833001 	add	r3, r3, #1
    69c4:	e5843e28 	str	r3, [r4, #3624]	; 0xe28
    69c8:	e59a3000 	ldr	r3, [sl]
    69cc:	e2833e76 	add	r3, r3, #1888	; 0x760
    69d0:	e2833002 	add	r3, r3, #2
    69d4:	e7885103 	str	r5, [r8, r3, lsl #2]
    69d8:	e5da200c 	ldrb	r2, [sl, #12]
    69dc:	e59a3000 	ldr	r3, [sl]
    69e0:	e3520000 	cmp	r2, #0
    69e4:	0a000081 	beq	6bf0 <ipu_init_channel+0xa10>
    69e8:	e283c01c 	add	ip, r3, #28
    69ec:	e59a2008 	ldr	r2, [sl, #8]
    69f0:	e1a01005 	mov	r1, r5
    69f4:	e1a00008 	mov	r0, r8
    69f8:	e18bbc1e 	orr	fp, fp, lr, lsl ip
    69fc:	ebfffffe 	bl	ae04 <_ipu_smfc_init>
    6a00:	e59a3000 	ldr	r3, [sl]
    6a04:	e1a00008 	mov	r0, r8
    6a08:	e59a2004 	ldr	r2, [sl, #4]
    6a0c:	e59a1008 	ldr	r1, [sl, #8]
    6a10:	ebfffffe 	bl	ac68 <_ipu_csi_set_mipi_di>
    6a14:	e59a2000 	ldr	r2, [sl]
    6a18:	e1a01005 	mov	r1, r5
    6a1c:	e1a00008 	mov	r0, r8
    6a20:	ebfffffe 	bl	b00c <_ipu_csi_init>
    6a24:	eafffe4f 	b	6368 <ipu_init_channel+0x188>
    6a28:	e1ca20d8 	ldrd	r2, [sl, #8]
    6a2c:	e1a01005 	mov	r1, r5
    6a30:	e1a00008 	mov	r0, r8
    6a34:	ebfffffe 	bl	bdc4 <_ipu_dp_init>
    6a38:	e5da3010 	ldrb	r3, [sl, #16]
    6a3c:	e3530000 	cmp	r3, #0
    6a40:	13a03001 	movne	r3, #1
    6a44:	15c43dc8 	strbne	r3, [r4, #3528]	; 0xdc8
    6a48:	e5941e1c 	ldr	r1, [r4, #3612]	; 0xe1c
    6a4c:	e5942e20 	ldr	r2, [r4, #3616]	; 0xe20
    6a50:	e5943e24 	ldr	r3, [r4, #3620]	; 0xe24
    6a54:	e2811001 	add	r1, r1, #1
    6a58:	e2822001 	add	r2, r2, #1
    6a5c:	e5841e1c 	str	r1, [r4, #3612]	; 0xe1c
    6a60:	e2833001 	add	r3, r3, #1
    6a64:	e5842e20 	str	r2, [r4, #3616]	; 0xe20
    6a68:	e5843e24 	str	r3, [r4, #3620]	; 0xe24
    6a6c:	eafffe3d 	b	6368 <ipu_init_channel+0x188>
    6a70:	e59a3000 	ldr	r3, [sl]
    6a74:	e3530001 	cmp	r3, #1
    6a78:	8afffe22 	bhi	6308 <ipu_init_channel+0x128>
    6a7c:	e5c43d9c 	strb	r3, [r4, #3484]	; 0xd9c
    6a80:	e3053049 	movw	r3, #20553	; 0x5049
    6a84:	e3433055 	movt	r3, #12373	; 0x3055
    6a88:	e59a2000 	ldr	r2, [sl]
    6a8c:	e3a01008 	mov	r1, #8
    6a90:	e58d3000 	str	r3, [sp]
    6a94:	e3a03000 	mov	r3, #0
    6a98:	e1a00008 	mov	r0, r8
    6a9c:	ebfffffe 	bl	bdd0 <_ipu_dc_init>
    6aa0:	e59a3000 	ldr	r3, [sl]
    6aa4:	e0883103 	add	r3, r8, r3, lsl #2
    6aa8:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6aac:	e5932e38 	ldr	r2, [r3, #3640]	; 0xe38
    6ab0:	e2822001 	add	r2, r2, #1
    6ab4:	e5832e38 	str	r2, [r3, #3640]	; 0xe38
    6ab8:	e5943e1c 	ldr	r3, [r4, #3612]	; 0xe1c
    6abc:	e2833001 	add	r3, r3, #1
    6ac0:	e5843e1c 	str	r3, [r4, #3612]	; 0xe1c
    6ac4:	eafffe27 	b	6368 <ipu_init_channel+0x188>
    6ac8:	e1a0100a 	mov	r1, sl
    6acc:	e1a00008 	mov	r0, r8
    6ad0:	ebfffffe 	bl	a0d0 <_ipu_ic_init_rotate_pp>
    6ad4:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6ad8:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6adc:	e2822001 	add	r2, r2, #1
    6ae0:	e2833001 	add	r3, r3, #1
    6ae4:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6ae8:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6aec:	eafffe1d 	b	6368 <ipu_init_channel+0x188>
    6af0:	e5942e2c 	ldr	r2, [r4, #3628]	; 0xe2c
    6af4:	e1a0100a 	mov	r1, sl
    6af8:	e5943e30 	ldr	r3, [r4, #3632]	; 0xe30
    6afc:	e1a00008 	mov	r0, r8
    6b00:	e2822001 	add	r2, r2, #1
    6b04:	e2833001 	add	r3, r3, #1
    6b08:	e5842e2c 	str	r2, [r4, #3628]	; 0xe2c
    6b0c:	e5843e30 	str	r3, [r4, #3632]	; 0xe30
    6b10:	ebfffffe 	bl	9dc8 <_ipu_ic_init_rotate_enc>
    6b14:	eafffe13 	b	6368 <ipu_init_channel+0x188>
    6b18:	e5da2010 	ldrb	r2, [sl, #16]
    6b1c:	e30f1cff 	movw	r1, #64767	; 0xfcff
    6b20:	e340195f 	movt	r1, #2399	; 0x95f
    6b24:	e1a00008 	mov	r0, r8
    6b28:	e3520000 	cmp	r2, #0
    6b2c:	13a03001 	movne	r3, #1
    6b30:	15c43dc7 	strbne	r3, [r4, #3527]	; 0xdc7
    6b34:	159a3000 	ldrne	r3, [sl]
    6b38:	e5c43d99 	strb	r3, [r4, #3481]	; 0xd99
    6b3c:	e1ca20d8 	ldrd	r2, [sl, #8]
    6b40:	ebfffffe 	bl	bdc4 <_ipu_dp_init>
    6b44:	e59ac00c 	ldr	ip, [sl, #12]
    6b48:	e1a00008 	mov	r0, r8
    6b4c:	e5da3004 	ldrb	r3, [sl, #4]
    6b50:	e3a01005 	mov	r1, #5
    6b54:	e59a2000 	ldr	r2, [sl]
    6b58:	e58dc000 	str	ip, [sp]
    6b5c:	ebfffffe 	bl	bdd0 <_ipu_dc_init>
    6b60:	e59a3000 	ldr	r3, [sl]
    6b64:	e0888103 	add	r8, r8, r3, lsl #2
    6b68:	e2888a01 	add	r8, r8, #4096	; 0x1000
    6b6c:	e5983e38 	ldr	r3, [r8, #3640]	; 0xe38
    6b70:	e2833001 	add	r3, r3, #1
    6b74:	e5883e38 	str	r3, [r8, #3640]	; 0xe38
    6b78:	eaffffb2 	b	6a48 <ipu_init_channel+0x868>
    6b7c:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    6b80:	e3413a2b 	movt	r3, #6699	; 0x1a2b
    6b84:	e1550003 	cmp	r5, r3
    6b88:	0affff33 	beq	685c <ipu_init_channel+0x67c>
    6b8c:	eafffef4 	b	6764 <ipu_init_channel+0x584>
    6b90:	e3432442 	movt	r2, #13378	; 0x3442
    6b94:	e1530002 	cmp	r3, r2
    6b98:	1afffead 	bne	6654 <ipu_init_channel+0x474>
    6b9c:	e3510000 	cmp	r1, #0
    6ba0:	0afffeae 	beq	6660 <ipu_init_channel+0x480>
    6ba4:	e3001000 	movw	r1, #0
    6ba8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6bac:	e3401000 	movt	r1, #0
    6bb0:	e3a0200e 	mov	r2, #14
    6bb4:	ebfffffe 	bl	0 <dev_err>
    6bb8:	e3e07015 	mvn	r7, #21
    6bbc:	eafffdf1 	b	6388 <ipu_init_channel+0x1a8>
    6bc0:	e3432442 	movt	r2, #13378	; 0x3442
    6bc4:	e1530002 	cmp	r3, r2
    6bc8:	1affff4a 	bne	68f8 <ipu_init_channel+0x718>
    6bcc:	e3510000 	cmp	r1, #0
    6bd0:	0affff4b 	beq	6904 <ipu_init_channel+0x724>
    6bd4:	e3001000 	movw	r1, #0
    6bd8:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6bdc:	e3401000 	movt	r1, #0
    6be0:	e3a0200f 	mov	r2, #15
    6be4:	ebfffffe 	bl	0 <dev_err>
    6be8:	e3e07015 	mvn	r7, #21
    6bec:	eafffde5 	b	6388 <ipu_init_channel+0x1a8>
    6bf0:	e283c01c 	add	ip, r3, #28
    6bf4:	e1a01005 	mov	r1, r5
    6bf8:	e1a00008 	mov	r0, r8
    6bfc:	e1cbbc1e 	bic	fp, fp, lr, lsl ip
    6c00:	ebfffffe 	bl	ae04 <_ipu_smfc_init>
    6c04:	eaffff82 	b	6a14 <ipu_init_channel+0x834>
    6c08:	e59a2024 	ldr	r2, [sl, #36]	; 0x24
    6c0c:	e1a00008 	mov	r0, r8
    6c10:	e59a1028 	ldr	r1, [sl, #40]	; 0x28
    6c14:	e18cb00b 	orr	fp, ip, fp
    6c18:	ebfffffe 	bl	ac68 <_ipu_csi_set_mipi_di>
    6c1c:	e59a3020 	ldr	r3, [sl, #32]
    6c20:	eafffef3 	b	67f4 <ipu_init_channel+0x614>
    6c24:	e59a303c 	ldr	r3, [sl, #60]	; 0x3c
    6c28:	e3a0c001 	mov	ip, #1
    6c2c:	e59a2040 	ldr	r2, [sl, #64]	; 0x40
    6c30:	e1a00008 	mov	r0, r8
    6c34:	e59a1044 	ldr	r1, [sl, #68]	; 0x44
    6c38:	e283e01c 	add	lr, r3, #28
    6c3c:	e18bbe1c 	orr	fp, fp, ip, lsl lr
    6c40:	ebfffffe 	bl	ac68 <_ipu_csi_set_mipi_di>
    6c44:	e59a203c 	ldr	r2, [sl, #60]	; 0x3c
    6c48:	eafffe01 	b	6454 <ipu_init_channel+0x274>
    6c4c:	e59ac020 	ldr	ip, [sl, #32]
    6c50:	e3002000 	movw	r2, #0
    6c54:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    6c58:	e3402000 	movt	r2, #0
    6c5c:	e59f302c 	ldr	r3, [pc, #44]	; 6c90 <ipu_init_channel+0xab0>
    6c60:	e59f002c 	ldr	r0, [pc, #44]	; 6c94 <ipu_init_channel+0xab4>
    6c64:	e58dc000 	str	ip, [sp]
    6c68:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    6c6c:	eafffed8 	b	67d4 <ipu_init_channel+0x5f4>
    6c70:	e3001000 	movw	r1, #0
    6c74:	e1a0200b 	mov	r2, fp
    6c78:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6c7c:	e3401000 	movt	r1, #0
    6c80:	e1a03007 	mov	r3, r7
    6c84:	ebfffffe 	bl	0 <dev_err>
    6c88:	ebfffffe 	bl	0 <dump_stack>
    6c8c:	eafffdbf 	b	6390 <ipu_init_channel+0x1b0>
    6c90:	000001ec 	andeq	r0, r0, ip, ror #3
    6c94:	000003f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>

00006c98 <ipu_enable_csi>:
    6c98:	e3510001 	cmp	r1, #1
    6c9c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    6ca0:	e1a06001 	mov	r6, r1
    6ca4:	e24dd00c 	sub	sp, sp, #12
    6ca8:	e1a04000 	mov	r4, r0
    6cac:	8a00002d 	bhi	6d68 <ipu_enable_csi+0xd0>
    6cb0:	e3003000 	movw	r3, #0
    6cb4:	e300241a 	movw	r2, #1050	; 0x41a
    6cb8:	e3403000 	movt	r3, #0
    6cbc:	e19330b2 	ldrh	r3, [r3, r2]
    6cc0:	e3130004 	tst	r3, #4
    6cc4:	1a00001e 	bne	6d44 <ipu_enable_csi+0xac>
    6cc8:	e2845d79 	add	r5, r4, #7744	; 0x1e40
    6ccc:	e1a00004 	mov	r0, r4
    6cd0:	e2855008 	add	r5, r5, #8
    6cd4:	ebfffffe 	bl	61c8 <_ipu_get>
    6cd8:	e1a00005 	mov	r0, r5
    6cdc:	ebfffffe 	bl	0 <mutex_lock>
    6ce0:	e0843106 	add	r3, r4, r6, lsl #2
    6ce4:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6ce8:	e5932e40 	ldr	r2, [r3, #3648]	; 0xe40
    6cec:	e2822001 	add	r2, r2, #1
    6cf0:	e3520001 	cmp	r2, #1
    6cf4:	e5832e40 	str	r2, [r3, #3648]	; 0xe40
    6cf8:	1a00000a 	bne	6d28 <ipu_enable_csi+0x90>
    6cfc:	e2847a01 	add	r7, r4, #4096	; 0x1000
    6d00:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6d04:	e5933000 	ldr	r3, [r3]
    6d08:	f57ff04f 	dsb	sy
    6d0c:	e3560000 	cmp	r6, #0
    6d10:	03836001 	orreq	r6, r3, #1
    6d14:	13836002 	orrne	r6, r3, #2
    6d18:	f57ff04e 	dsb	st
    6d1c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6d20:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6d24:	e5836000 	str	r6, [r3]
    6d28:	e1a00005 	mov	r0, r5
    6d2c:	ebfffffe 	bl	0 <mutex_unlock>
    6d30:	e594000c 	ldr	r0, [r4, #12]
    6d34:	ebfffffe 	bl	0 <clk_disable>
    6d38:	e3a00000 	mov	r0, #0
    6d3c:	e28dd00c 	add	sp, sp, #12
    6d40:	e8bd80f0 	pop	{r4, r5, r6, r7, pc}
    6d44:	e2803a01 	add	r3, r0, #4096	; 0x1000
    6d48:	e3002000 	movw	r2, #0
    6d4c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    6d50:	e3402000 	movt	r2, #0
    6d54:	e58d6000 	str	r6, [sp]
    6d58:	e59f3028 	ldr	r3, [pc, #40]	; 6d88 <ipu_enable_csi+0xf0>
    6d5c:	e59f0028 	ldr	r0, [pc, #40]	; 6d8c <ipu_enable_csi+0xf4>
    6d60:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    6d64:	eaffffd7 	b	6cc8 <ipu_enable_csi+0x30>
    6d68:	e2804a01 	add	r4, r0, #4096	; 0x1000
    6d6c:	e3001000 	movw	r1, #0
    6d70:	e5940d84 	ldr	r0, [r4, #3460]	; 0xd84
    6d74:	e1a02006 	mov	r2, r6
    6d78:	e3401000 	movt	r1, #0
    6d7c:	ebfffffe 	bl	0 <dev_err>
    6d80:	e3e00015 	mvn	r0, #21
    6d84:	eaffffec 	b	6d3c <ipu_enable_csi+0xa4>
    6d88:	00000200 	andeq	r0, r0, r0, lsl #4
    6d8c:	00000408 	andeq	r0, r0, r8, lsl #8

00006d90 <ipu_disable_csi>:
    6d90:	e3510001 	cmp	r1, #1
    6d94:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    6d98:	e1a06001 	mov	r6, r1
    6d9c:	e1a05000 	mov	r5, r0
    6da0:	8a000020 	bhi	6e28 <ipu_disable_csi+0x98>
    6da4:	e2804d79 	add	r4, r0, #7744	; 0x1e40
    6da8:	e2844008 	add	r4, r4, #8
    6dac:	ebfffffe 	bl	61c8 <_ipu_get>
    6db0:	e1a00004 	mov	r0, r4
    6db4:	ebfffffe 	bl	0 <mutex_lock>
    6db8:	e0853106 	add	r3, r5, r6, lsl #2
    6dbc:	e2833a01 	add	r3, r3, #4096	; 0x1000
    6dc0:	e5931e40 	ldr	r1, [r3, #3648]	; 0xe40
    6dc4:	e2411001 	sub	r1, r1, #1
    6dc8:	e3510000 	cmp	r1, #0
    6dcc:	e5831e40 	str	r1, [r3, #3648]	; 0xe40
    6dd0:	0a000005 	beq	6dec <ipu_disable_csi+0x5c>
    6dd4:	e1a00004 	mov	r0, r4
    6dd8:	ebfffffe 	bl	0 <mutex_unlock>
    6ddc:	e595000c 	ldr	r0, [r5, #12]
    6de0:	ebfffffe 	bl	0 <clk_disable>
    6de4:	e3a00000 	mov	r0, #0
    6de8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    6dec:	e5931d88 	ldr	r1, [r3, #3464]	; 0xd88
    6df0:	e1a00005 	mov	r0, r5
    6df4:	e2857a01 	add	r7, r5, #4096	; 0x1000
    6df8:	ebfffffe 	bl	b0bc <_ipu_csi_wait4eof>
    6dfc:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6e00:	e5933000 	ldr	r3, [r3]
    6e04:	f57ff04f 	dsb	sy
    6e08:	e3560000 	cmp	r6, #0
    6e0c:	03c36001 	biceq	r6, r3, #1
    6e10:	13c36002 	bicne	r6, r3, #2
    6e14:	f57ff04e 	dsb	st
    6e18:	ebfffffe 	bl	0 <arm_heavy_mb>
    6e1c:	e5973d48 	ldr	r3, [r7, #3400]	; 0xd48
    6e20:	e5836000 	str	r6, [r3]
    6e24:	eaffffea 	b	6dd4 <ipu_disable_csi+0x44>
    6e28:	e2805a01 	add	r5, r0, #4096	; 0x1000
    6e2c:	e3001000 	movw	r1, #0
    6e30:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    6e34:	e1a02006 	mov	r2, r6
    6e38:	e3401000 	movt	r1, #0
    6e3c:	ebfffffe 	bl	0 <dev_err>
    6e40:	e3e00015 	mvn	r0, #21
    6e44:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

00006e48 <ipu_enable_irq>:
    6e48:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    6e4c:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    6e50:	e286601c 	add	r6, r6, #28
    6e54:	e1a05001 	mov	r5, r1
    6e58:	e1a07000 	mov	r7, r0
    6e5c:	ebfffffe 	bl	61c8 <_ipu_get>
    6e60:	e1a00006 	mov	r0, r6
    6e64:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6e68:	e1a032a5 	lsr	r3, r5, #5
    6e6c:	e1a08000 	mov	r8, r0
    6e70:	e2432006 	sub	r2, r3, #6
    6e74:	e3530003 	cmp	r3, #3
    6e78:	83520001 	cmphi	r2, #1
    6e7c:	9a000019 	bls	6ee8 <ipu_enable_irq+0xa0>
    6e80:	e243200a 	sub	r2, r3, #10
    6e84:	e3520004 	cmp	r2, #4
    6e88:	9a000016 	bls	6ee8 <ipu_enable_irq+0xa0>
    6e8c:	e2879a01 	add	r9, r7, #4096	; 0x1000
    6e90:	e283300f 	add	r3, r3, #15
    6e94:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6e98:	e1a04103 	lsl	r4, r3, #2
    6e9c:	e0823004 	add	r3, r2, r4
    6ea0:	e5932000 	ldr	r2, [r3]
    6ea4:	f57ff04f 	dsb	sy
    6ea8:	e3a03001 	mov	r3, #1
    6eac:	e205501f 	and	r5, r5, #31
    6eb0:	e1825513 	orr	r5, r2, r3, lsl r5
    6eb4:	f57ff04e 	dsb	st
    6eb8:	ebfffffe 	bl	0 <arm_heavy_mb>
    6ebc:	e5993d48 	ldr	r3, [r9, #3400]	; 0xd48
    6ec0:	e0834004 	add	r4, r3, r4
    6ec4:	e5845000 	str	r5, [r4]
    6ec8:	e3a04000 	mov	r4, #0
    6ecc:	e1a01008 	mov	r1, r8
    6ed0:	e1a00006 	mov	r0, r6
    6ed4:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    6ed8:	e597000c 	ldr	r0, [r7, #12]
    6edc:	ebfffffe 	bl	0 <clk_disable>
    6ee0:	e1a00004 	mov	r0, r4
    6ee4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    6ee8:	e0872205 	add	r2, r7, r5, lsl #4
    6eec:	e5922048 	ldr	r2, [r2, #72]	; 0x48
    6ef0:	e3520000 	cmp	r2, #0
    6ef4:	1affffe4 	bne	6e8c <ipu_enable_irq+0x44>
    6ef8:	e2873a01 	add	r3, r7, #4096	; 0x1000
    6efc:	e3001000 	movw	r1, #0
    6f00:	e1a02005 	mov	r2, r5
    6f04:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    6f08:	e3401000 	movt	r1, #0
    6f0c:	e3e0400c 	mvn	r4, #12
    6f10:	ebfffffe 	bl	0 <dev_err>
    6f14:	eaffffec 	b	6ecc <ipu_enable_irq+0x84>

00006f18 <ipu_disable_irq>:
    6f18:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    6f1c:	e1a0a001 	mov	sl, r1
    6f20:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    6f24:	e1a042aa 	lsr	r4, sl, #5
    6f28:	e285501c 	add	r5, r5, #28
    6f2c:	e2809a01 	add	r9, r0, #4096	; 0x1000
    6f30:	e1a06000 	mov	r6, r0
    6f34:	ebfffffe 	bl	61c8 <_ipu_get>
    6f38:	e1a00005 	mov	r0, r5
    6f3c:	e284400f 	add	r4, r4, #15
    6f40:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6f44:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6f48:	e1a04104 	lsl	r4, r4, #2
    6f4c:	e1a08000 	mov	r8, r0
    6f50:	e0822004 	add	r2, r2, r4
    6f54:	e5927000 	ldr	r7, [r2]
    6f58:	f57ff04f 	dsb	sy
    6f5c:	e3a01001 	mov	r1, #1
    6f60:	e20a301f 	and	r3, sl, #31
    6f64:	e1c77311 	bic	r7, r7, r1, lsl r3
    6f68:	f57ff04e 	dsb	st
    6f6c:	ebfffffe 	bl	0 <arm_heavy_mb>
    6f70:	e5992d48 	ldr	r2, [r9, #3400]	; 0xd48
    6f74:	e0824004 	add	r4, r2, r4
    6f78:	e5847000 	str	r7, [r4]
    6f7c:	e1a00005 	mov	r0, r5
    6f80:	e1a01008 	mov	r1, r8
    6f84:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    6f88:	e596000c 	ldr	r0, [r6, #12]
    6f8c:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    6f90:	eafffffe 	b	0 <clk_disable>

00006f94 <ipu_clear_irq>:
    6f94:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    6f98:	e2805d79 	add	r5, r0, #7744	; 0x1e40
    6f9c:	e285501c 	add	r5, r5, #28
    6fa0:	e1a06001 	mov	r6, r1
    6fa4:	e1a04000 	mov	r4, r0
    6fa8:	e1a072a6 	lsr	r7, r6, #5
    6fac:	e206601f 	and	r6, r6, #31
    6fb0:	ebfffffe 	bl	61c8 <_ipu_get>
    6fb4:	e1a00005 	mov	r0, r5
    6fb8:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    6fbc:	e5943004 	ldr	r3, [r4, #4]
    6fc0:	e3a02001 	mov	r2, #1
    6fc4:	e1a08000 	mov	r8, r0
    6fc8:	e1a06612 	lsl	r6, r2, r6
    6fcc:	e3530000 	cmp	r3, #0
    6fd0:	13a03c02 	movne	r3, #512	; 0x200
    6fd4:	03a030e8 	moveq	r3, #232	; 0xe8
    6fd8:	e0837107 	add	r7, r3, r7, lsl #2
    6fdc:	f57ff04e 	dsb	st
    6fe0:	ebfffffe 	bl	0 <arm_heavy_mb>
    6fe4:	e2843a01 	add	r3, r4, #4096	; 0x1000
    6fe8:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    6fec:	e0833007 	add	r3, r3, r7
    6ff0:	e5836000 	str	r6, [r3]
    6ff4:	e1a00005 	mov	r0, r5
    6ff8:	e1a01008 	mov	r1, r8
    6ffc:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    7000:	e594000c 	ldr	r0, [r4, #12]
    7004:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    7008:	eafffffe 	b	0 <clk_disable>

0000700c <ipu_get_irq_status>:
    700c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    7010:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    7014:	e286601c 	add	r6, r6, #28
    7018:	e1a05000 	mov	r5, r0
    701c:	e1a04001 	mov	r4, r1
    7020:	ebfffffe 	bl	61c8 <_ipu_get>
    7024:	e1a00006 	mov	r0, r6
    7028:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    702c:	e5952004 	ldr	r2, [r5, #4]
    7030:	e1a01000 	mov	r1, r0
    7034:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7038:	e1a002a4 	lsr	r0, r4, #5
    703c:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7040:	e3520000 	cmp	r2, #0
    7044:	13a02c02 	movne	r2, #512	; 0x200
    7048:	03a020e8 	moveq	r2, #232	; 0xe8
    704c:	e0822100 	add	r2, r2, r0, lsl #2
    7050:	e0833002 	add	r3, r3, r2
    7054:	e5937000 	ldr	r7, [r3]
    7058:	f57ff04f 	dsb	sy
    705c:	e204401f 	and	r4, r4, #31
    7060:	e1a00006 	mov	r0, r6
    7064:	e1a04437 	lsr	r4, r7, r4
    7068:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    706c:	e595000c 	ldr	r0, [r5, #12]
    7070:	ebfffffe 	bl	0 <clk_disable>
    7074:	e2040001 	and	r0, r4, #1
    7078:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000707c <ipu_request_irq>:
    707c:	e300c000 	movw	ip, #0
    7080:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7084:	e340c000 	movt	ip, #0
    7088:	e300e432 	movw	lr, #1074	; 0x432
    708c:	e1a06000 	mov	r6, r0
    7090:	e1a04001 	mov	r4, r1
    7094:	e19c00be 	ldrh	r0, [ip, lr]
    7098:	e1a0a002 	mov	sl, r2
    709c:	e1a09003 	mov	r9, r3
    70a0:	e3100004 	tst	r0, #4
    70a4:	1a000041 	bne	71b0 <ipu_request_irq+0x134>
    70a8:	e3540e1d 	cmp	r4, #464	; 0x1d0
    70ac:	2a00003e 	bcs	71ac <ipu_request_irq+0x130>
    70b0:	e2867d79 	add	r7, r6, #7744	; 0x1e40
    70b4:	e1a00006 	mov	r0, r6
    70b8:	e287701c 	add	r7, r7, #28
    70bc:	ebfffffe 	bl	61c8 <_ipu_get>
    70c0:	e1a00007 	mov	r0, r7
    70c4:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    70c8:	e1a03204 	lsl	r3, r4, #4
    70cc:	e1a08000 	mov	r8, r0
    70d0:	e0862003 	add	r2, r6, r3
    70d4:	e5922048 	ldr	r2, [r2, #72]	; 0x48
    70d8:	e3520000 	cmp	r2, #0
    70dc:	1a00003b 	bne	71d0 <ipu_request_irq+0x154>
    70e0:	e1a052a4 	lsr	r5, r4, #5
    70e4:	e2452006 	sub	r2, r5, #6
    70e8:	e3550003 	cmp	r5, #3
    70ec:	83520001 	cmphi	r2, #1
    70f0:	8a000029 	bhi	719c <ipu_request_irq+0x120>
    70f4:	e35a0000 	cmp	sl, #0
    70f8:	0a00003c 	beq	71f0 <ipu_request_irq+0x174>
    70fc:	e59d2024 	ldr	r2, [sp, #36]	; 0x24
    7100:	e0863003 	add	r3, r6, r3
    7104:	e5839054 	str	r9, [r3, #84]	; 0x54
    7108:	e1a05105 	lsl	r5, r5, #2
    710c:	e583a048 	str	sl, [r3, #72]	; 0x48
    7110:	e204101f 	and	r1, r4, #31
    7114:	e5832050 	str	r2, [r3, #80]	; 0x50
    7118:	e3a04001 	mov	r4, #1
    711c:	e59d2020 	ldr	r2, [sp, #32]
    7120:	e1a04114 	lsl	r4, r4, r1
    7124:	e583204c 	str	r2, [r3, #76]	; 0x4c
    7128:	e5963004 	ldr	r3, [r6, #4]
    712c:	e3530000 	cmp	r3, #0
    7130:	13a09c02 	movne	r9, #512	; 0x200
    7134:	03a090e8 	moveq	r9, #232	; 0xe8
    7138:	e0859009 	add	r9, r5, r9
    713c:	f57ff04e 	dsb	st
    7140:	e286aa01 	add	sl, r6, #4096	; 0x1000
    7144:	ebfffffe 	bl	0 <arm_heavy_mb>
    7148:	e59a3d48 	ldr	r3, [sl, #3400]	; 0xd48
    714c:	e0839009 	add	r9, r3, r9
    7150:	e5894000 	str	r4, [r9]
    7154:	e285503c 	add	r5, r5, #60	; 0x3c
    7158:	e0833005 	add	r3, r3, r5
    715c:	e5931000 	ldr	r1, [r3]
    7160:	f57ff04f 	dsb	sy
    7164:	e1844001 	orr	r4, r4, r1
    7168:	f57ff04e 	dsb	st
    716c:	ebfffffe 	bl	0 <arm_heavy_mb>
    7170:	e59a3d48 	ldr	r3, [sl, #3400]	; 0xd48
    7174:	e0835005 	add	r5, r3, r5
    7178:	e5854000 	str	r4, [r5]
    717c:	e3a04000 	mov	r4, #0
    7180:	e1a01008 	mov	r1, r8
    7184:	e1a00007 	mov	r0, r7
    7188:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    718c:	e596000c 	ldr	r0, [r6, #12]
    7190:	ebfffffe 	bl	0 <clk_disable>
    7194:	e1a00004 	mov	r0, r4
    7198:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    719c:	e245200a 	sub	r2, r5, #10
    71a0:	e3520004 	cmp	r2, #4
    71a4:	8affffd4 	bhi	70fc <ipu_request_irq+0x80>
    71a8:	eaffffd1 	b	70f4 <ipu_request_irq+0x78>
    71ac:	e7f001f2 	udf	#18
    71b0:	e2863a01 	add	r3, r6, #4096	; 0x1000
    71b4:	e3002000 	movw	r2, #0
    71b8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    71bc:	e28c0e42 	add	r0, ip, #1056	; 0x420
    71c0:	e3402000 	movt	r2, #0
    71c4:	e59f3044 	ldr	r3, [pc, #68]	; 7210 <ipu_request_irq+0x194>
    71c8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    71cc:	eaffffb5 	b	70a8 <ipu_request_irq+0x2c>
    71d0:	e2863a01 	add	r3, r6, #4096	; 0x1000
    71d4:	e3001000 	movw	r1, #0
    71d8:	e1a02004 	mov	r2, r4
    71dc:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    71e0:	e3401000 	movt	r1, #0
    71e4:	e3e04015 	mvn	r4, #21
    71e8:	ebfffffe 	bl	0 <dev_err>
    71ec:	eaffffe3 	b	7180 <ipu_request_irq+0x104>
    71f0:	e2863a01 	add	r3, r6, #4096	; 0x1000
    71f4:	e3001000 	movw	r1, #0
    71f8:	e1a02004 	mov	r2, r4
    71fc:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    7200:	e3401000 	movt	r1, #0
    7204:	e3e04015 	mvn	r4, #21
    7208:	ebfffffe 	bl	0 <dev_err>
    720c:	eaffffdb 	b	7180 <ipu_request_irq+0x104>
    7210:	00000210 	andeq	r0, r0, r0, lsl r2

00007214 <ipu_free_irq>:
    7214:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7218:	e3006000 	movw	r6, #0
    721c:	e300344a 	movw	r3, #1098	; 0x44a
    7220:	e3406000 	movt	r6, #0
    7224:	e24dd00c 	sub	sp, sp, #12
    7228:	e1a05000 	mov	r5, r0
    722c:	e19630b3 	ldrh	r3, [r6, r3]
    7230:	e1a07001 	mov	r7, r1
    7234:	e1a09002 	mov	r9, r2
    7238:	e3130004 	tst	r3, #4
    723c:	1a000036 	bne	731c <ipu_free_irq+0x108>
    7240:	e1a00005 	mov	r0, r5
    7244:	ebfffffe 	bl	61c8 <_ipu_get>
    7248:	e3003462 	movw	r3, #1122	; 0x462
    724c:	e19630b3 	ldrh	r3, [r6, r3]
    7250:	e3130004 	tst	r3, #4
    7254:	1a000036 	bne	7334 <ipu_free_irq+0x120>
    7258:	e285ad79 	add	sl, r5, #7744	; 0x1e40
    725c:	e1a042a7 	lsr	r4, r7, #5
    7260:	e28aa01c 	add	sl, sl, #28
    7264:	e285ba01 	add	fp, r5, #4096	; 0x1000
    7268:	e1a0000a 	mov	r0, sl
    726c:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    7270:	e284400f 	add	r4, r4, #15
    7274:	e59b3d48 	ldr	r3, [fp, #3400]	; 0xd48
    7278:	e1a04104 	lsl	r4, r4, #2
    727c:	e1a08000 	mov	r8, r0
    7280:	e0833004 	add	r3, r3, r4
    7284:	e5932000 	ldr	r2, [r3]
    7288:	f57ff04f 	dsb	sy
    728c:	e3a01001 	mov	r1, #1
    7290:	e207301f 	and	r3, r7, #31
    7294:	e1c22311 	bic	r2, r2, r1, lsl r3
    7298:	e58d2004 	str	r2, [sp, #4]
    729c:	f57ff04e 	dsb	st
    72a0:	ebfffffe 	bl	0 <arm_heavy_mb>
    72a4:	e59b3d48 	ldr	r3, [fp, #3400]	; 0xd48
    72a8:	e59d2004 	ldr	r2, [sp, #4]
    72ac:	e0834004 	add	r4, r3, r4
    72b0:	e5842000 	str	r2, [r4]
    72b4:	e2873005 	add	r3, r7, #5
    72b8:	e7953203 	ldr	r3, [r5, r3, lsl #4]
    72bc:	e1530009 	cmp	r3, r9
    72c0:	0a00000a 	beq	72f0 <ipu_free_irq+0xdc>
    72c4:	e1a01008 	mov	r1, r8
    72c8:	e1a0000a 	mov	r0, sl
    72cc:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    72d0:	e595000c 	ldr	r0, [r5, #12]
    72d4:	ebfffffe 	bl	0 <clk_disable>
    72d8:	e300347a 	movw	r3, #1146	; 0x47a
    72dc:	e19630b3 	ldrh	r3, [r6, r3]
    72e0:	e3130004 	tst	r3, #4
    72e4:	1a000006 	bne	7304 <ipu_free_irq+0xf0>
    72e8:	e28dd00c 	add	sp, sp, #12
    72ec:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    72f0:	e0850207 	add	r0, r5, r7, lsl #4
    72f4:	e3a01010 	mov	r1, #16
    72f8:	e2800048 	add	r0, r0, #72	; 0x48
    72fc:	ebfffffe 	bl	0 <__memzero>
    7300:	eaffffef 	b	72c4 <ipu_free_irq+0xb0>
    7304:	e3001000 	movw	r1, #0
    7308:	e59f0038 	ldr	r0, [pc, #56]	; 7348 <ipu_free_irq+0x134>
    730c:	e3401000 	movt	r1, #0
    7310:	e28dd00c 	add	sp, sp, #12
    7314:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7318:	eafffffe 	b	0 <__dynamic_pr_debug>
    731c:	e3001000 	movw	r1, #0
    7320:	e59f2024 	ldr	r2, [pc, #36]	; 734c <ipu_free_irq+0x138>
    7324:	e3401000 	movt	r1, #0
    7328:	e59f0020 	ldr	r0, [pc, #32]	; 7350 <ipu_free_irq+0x13c>
    732c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7330:	eaffffc2 	b	7240 <ipu_free_irq+0x2c>
    7334:	e3001000 	movw	r1, #0
    7338:	e59f0014 	ldr	r0, [pc, #20]	; 7354 <ipu_free_irq+0x140>
    733c:	e3401000 	movt	r1, #0
    7340:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7344:	eaffffc3 	b	7258 <ipu_free_irq+0x44>
    7348:	00000468 	andeq	r0, r0, r8, ror #8
    734c:	00000220 	andeq	r0, r0, r0, lsr #4
    7350:	00000438 	andeq	r0, r0, r8, lsr r4
    7354:	00000450 	andeq	r0, r0, r0, asr r4

00007358 <ipu_channel_status>:
    7358:	e92d4070 	push	{r4, r5, r6, lr}
    735c:	e2804d79 	add	r4, r0, #7744	; 0x1e40
    7360:	e2844008 	add	r4, r4, #8
    7364:	e24dd008 	sub	sp, sp, #8
    7368:	e1a05000 	mov	r5, r0
    736c:	e1a06001 	mov	r6, r1
    7370:	ebfffffe 	bl	61c8 <_ipu_get>
    7374:	e1a00004 	mov	r0, r4
    7378:	ebfffffe 	bl	0 <mutex_lock>
    737c:	e1a01006 	mov	r1, r6
    7380:	e1a00005 	mov	r0, r5
    7384:	ebfffffe 	bl	560 <ipu_is_channel_busy>
    7388:	e1a06000 	mov	r6, r0
    738c:	e1a00004 	mov	r0, r4
    7390:	ebfffffe 	bl	0 <mutex_unlock>
    7394:	e595000c 	ldr	r0, [r5, #12]
    7398:	ebfffffe 	bl	0 <clk_disable>
    739c:	e3000000 	movw	r0, #0
    73a0:	e3003492 	movw	r3, #1170	; 0x492
    73a4:	e3400000 	movt	r0, #0
    73a8:	e19030b3 	ldrh	r3, [r0, r3]
    73ac:	e3130004 	tst	r3, #4
    73b0:	1a000002 	bne	73c0 <ipu_channel_status+0x68>
    73b4:	e1a00006 	mov	r0, r6
    73b8:	e28dd008 	add	sp, sp, #8
    73bc:	e8bd8070 	pop	{r4, r5, r6, pc}
    73c0:	e2855a01 	add	r5, r5, #4096	; 0x1000
    73c4:	e3002000 	movw	r2, #0
    73c8:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    73cc:	e2800d12 	add	r0, r0, #1152	; 0x480
    73d0:	e58d6000 	str	r6, [sp]
    73d4:	e3402000 	movt	r2, #0
    73d8:	e59f300c 	ldr	r3, [pc, #12]	; 73ec <ipu_channel_status+0x94>
    73dc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    73e0:	e1a00006 	mov	r0, r6
    73e4:	e28dd008 	add	sp, sp, #8
    73e8:	e8bd8070 	pop	{r4, r5, r6, pc}
    73ec:	00000230 	andeq	r0, r0, r0, lsr r2

000073f0 <ipu_ch_param_get_axi_id>:
    73f0:	e0822082 	add	r2, r2, r2, lsl #1
    73f4:	e92d4070 	push	{r4, r5, r6, lr}
    73f8:	e1a02082 	lsl	r2, r2, #1
    73fc:	e1a01231 	lsr	r1, r1, r2
    7400:	e201403f 	and	r4, r1, #63	; 0x3f
    7404:	e354003f 	cmp	r4, #63	; 0x3f
    7408:	0a000013 	beq	745c <ipu_ch_param_get_axi_id+0x6c>
    740c:	e2806d79 	add	r6, r0, #7744	; 0x1e40
    7410:	e1a05000 	mov	r5, r0
    7414:	e2866008 	add	r6, r6, #8
    7418:	e1a04304 	lsl	r4, r4, #6
    741c:	ebfffffe 	bl	61c8 <_ipu_get>
    7420:	e1a00006 	mov	r0, r6
    7424:	e2844028 	add	r4, r4, #40	; 0x28
    7428:	ebfffffe 	bl	0 <mutex_lock>
    742c:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7430:	e5933d78 	ldr	r3, [r3, #3448]	; 0xd78
    7434:	e0834004 	add	r4, r3, r4
    7438:	e5944000 	ldr	r4, [r4]
    743c:	f57ff04f 	dsb	sy
    7440:	e1a00006 	mov	r0, r6
    7444:	e7e14ed4 	ubfx	r4, r4, #29, #2
    7448:	ebfffffe 	bl	0 <mutex_unlock>
    744c:	e595000c 	ldr	r0, [r5, #12]
    7450:	ebfffffe 	bl	0 <clk_disable>
    7454:	e1a00004 	mov	r0, r4
    7458:	e8bd8070 	pop	{r4, r5, r6, pc}
    745c:	e3e04015 	mvn	r4, #21
    7460:	eafffffb 	b	7454 <ipu_ch_param_get_axi_id+0x64>

00007464 <_ipu_put>:
    7464:	eafffffe 	b	c88 <ipu_disable_hsp_clk>

00007468 <ipu_dump_registers>:
    7468:	e92d4070 	push	{r4, r5, r6, lr}
    746c:	e3004000 	movw	r4, #0
    7470:	e30034aa 	movw	r3, #1194	; 0x4aa
    7474:	e3404000 	movt	r4, #0
    7478:	e1a05000 	mov	r5, r0
    747c:	e19430b3 	ldrh	r3, [r4, r3]
    7480:	e3130004 	tst	r3, #4
    7484:	1a00011a 	bne	78f4 <ipu_dump_registers+0x48c>
    7488:	e30034c2 	movw	r3, #1218	; 0x4c2
    748c:	e19430b3 	ldrh	r3, [r4, r3]
    7490:	e3130004 	tst	r3, #4
    7494:	1a00011e 	bne	7914 <ipu_dump_registers+0x4ac>
    7498:	e30034da 	movw	r3, #1242	; 0x4da
    749c:	e19430b3 	ldrh	r3, [r4, r3]
    74a0:	e3130004 	tst	r3, #4
    74a4:	1a000127 	bne	7948 <ipu_dump_registers+0x4e0>
    74a8:	e30034f2 	movw	r3, #1266	; 0x4f2
    74ac:	e19430b3 	ldrh	r3, [r4, r3]
    74b0:	e3130004 	tst	r3, #4
    74b4:	1a00007b 	bne	76a8 <ipu_dump_registers+0x240>
    74b8:	e300350a 	movw	r3, #1290	; 0x50a
    74bc:	e19430b3 	ldrh	r3, [r4, r3]
    74c0:	e3130004 	tst	r3, #4
    74c4:	1a000084 	bne	76dc <ipu_dump_registers+0x274>
    74c8:	e3003522 	movw	r3, #1314	; 0x522
    74cc:	e19430b3 	ldrh	r3, [r4, r3]
    74d0:	e3130004 	tst	r3, #4
    74d4:	1a00008d 	bne	7710 <ipu_dump_registers+0x2a8>
    74d8:	e300353a 	movw	r3, #1338	; 0x53a
    74dc:	e19430b3 	ldrh	r3, [r4, r3]
    74e0:	e3130004 	tst	r3, #4
    74e4:	1a000096 	bne	7744 <ipu_dump_registers+0x2dc>
    74e8:	e3003552 	movw	r3, #1362	; 0x552
    74ec:	e19430b3 	ldrh	r3, [r4, r3]
    74f0:	e3130004 	tst	r3, #4
    74f4:	1a00009f 	bne	7778 <ipu_dump_registers+0x310>
    74f8:	e300356a 	movw	r3, #1386	; 0x56a
    74fc:	e19430b3 	ldrh	r3, [r4, r3]
    7500:	e3130004 	tst	r3, #4
    7504:	1a0000ad 	bne	77c0 <ipu_dump_registers+0x358>
    7508:	e3003582 	movw	r3, #1410	; 0x582
    750c:	e19430b3 	ldrh	r3, [r4, r3]
    7510:	e3130004 	tst	r3, #4
    7514:	1a0000bb 	bne	7808 <ipu_dump_registers+0x3a0>
    7518:	e300359a 	movw	r3, #1434	; 0x59a
    751c:	e19430b3 	ldrh	r3, [r4, r3]
    7520:	e3130004 	tst	r3, #4
    7524:	1a0000c4 	bne	783c <ipu_dump_registers+0x3d4>
    7528:	e5953004 	ldr	r3, [r5, #4]
    752c:	e3530000 	cmp	r3, #0
    7530:	0a000007 	beq	7554 <ipu_dump_registers+0xec>
    7534:	e30035b2 	movw	r3, #1458	; 0x5b2
    7538:	e19430b3 	ldrh	r3, [r4, r3]
    753c:	e3130004 	tst	r3, #4
    7540:	1a00003d 	bne	763c <ipu_dump_registers+0x1d4>
    7544:	e30035ca 	movw	r3, #1482	; 0x5ca
    7548:	e19430b3 	ldrh	r3, [r4, r3]
    754c:	e3130004 	tst	r3, #4
    7550:	1a00016b 	bne	7b04 <ipu_dump_registers+0x69c>
    7554:	e30035e2 	movw	r3, #1506	; 0x5e2
    7558:	e19430b3 	ldrh	r3, [r4, r3]
    755c:	e3130004 	tst	r3, #4
    7560:	1a000102 	bne	7970 <ipu_dump_registers+0x508>
    7564:	e30035fa 	movw	r3, #1530	; 0x5fa
    7568:	e19430b3 	ldrh	r3, [r4, r3]
    756c:	e3130004 	tst	r3, #4
    7570:	1a00010b 	bne	79a4 <ipu_dump_registers+0x53c>
    7574:	e3003612 	movw	r3, #1554	; 0x612
    7578:	e19430b3 	ldrh	r3, [r4, r3]
    757c:	e3130004 	tst	r3, #4
    7580:	1a000114 	bne	79d8 <ipu_dump_registers+0x570>
    7584:	e300362a 	movw	r3, #1578	; 0x62a
    7588:	e19430b3 	ldrh	r3, [r4, r3]
    758c:	e3130004 	tst	r3, #4
    7590:	1a00011d 	bne	7a0c <ipu_dump_registers+0x5a4>
    7594:	e3003642 	movw	r3, #1602	; 0x642
    7598:	e19430b3 	ldrh	r3, [r4, r3]
    759c:	e3130004 	tst	r3, #4
    75a0:	1a000126 	bne	7a40 <ipu_dump_registers+0x5d8>
    75a4:	e300365a 	movw	r3, #1626	; 0x65a
    75a8:	e19430b3 	ldrh	r3, [r4, r3]
    75ac:	e3130004 	tst	r3, #4
    75b0:	1a00012f 	bne	7a74 <ipu_dump_registers+0x60c>
    75b4:	e3003672 	movw	r3, #1650	; 0x672
    75b8:	e19430b3 	ldrh	r3, [r4, r3]
    75bc:	e3130004 	tst	r3, #4
    75c0:	1a000138 	bne	7aa8 <ipu_dump_registers+0x640>
    75c4:	e300368a 	movw	r3, #1674	; 0x68a
    75c8:	e19430b3 	ldrh	r3, [r4, r3]
    75cc:	e3130004 	tst	r3, #4
    75d0:	1a000141 	bne	7adc <ipu_dump_registers+0x674>
    75d4:	e30036a2 	movw	r3, #1698	; 0x6a2
    75d8:	e19430b3 	ldrh	r3, [r4, r3]
    75dc:	e3130004 	tst	r3, #4
    75e0:	1a00009f 	bne	7864 <ipu_dump_registers+0x3fc>
    75e4:	e30036ba 	movw	r3, #1722	; 0x6ba
    75e8:	e19430b3 	ldrh	r3, [r4, r3]
    75ec:	e3130004 	tst	r3, #4
    75f0:	1a0000a8 	bne	7898 <ipu_dump_registers+0x430>
    75f4:	e30036d2 	movw	r3, #1746	; 0x6d2
    75f8:	e19430b3 	ldrh	r3, [r4, r3]
    75fc:	e3130004 	tst	r3, #4
    7600:	1a0000b1 	bne	78cc <ipu_dump_registers+0x464>
    7604:	e30036ea 	movw	r3, #1770	; 0x6ea
    7608:	e19430b3 	ldrh	r3, [r4, r3]
    760c:	e3130004 	tst	r3, #4
    7610:	08bd8070 	popeq	{r4, r5, r6, pc}
    7614:	e2855a01 	add	r5, r5, #4096	; 0x1000
    7618:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    761c:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    7620:	e5933000 	ldr	r3, [r3]
    7624:	f57ff04f 	dsb	sy
    7628:	e3002000 	movw	r2, #0
    762c:	e59f04e0 	ldr	r0, [pc, #1248]	; 7b14 <ipu_dump_registers+0x6ac>
    7630:	e3402000 	movt	r2, #0
    7634:	e8bd4070 	pop	{r4, r5, r6, lr}
    7638:	eafffffe 	b	0 <__dynamic_dev_dbg>
    763c:	e2856a01 	add	r6, r5, #4096	; 0x1000
    7640:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    7644:	e5963d48 	ldr	r3, [r6, #3400]	; 0xd48
    7648:	e5933178 	ldr	r3, [r3, #376]	; 0x178
    764c:	f57ff04f 	dsb	sy
    7650:	e3002000 	movw	r2, #0
    7654:	e59f04bc 	ldr	r0, [pc, #1212]	; 7b18 <ipu_dump_registers+0x6b0>
    7658:	e3402000 	movt	r2, #0
    765c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7660:	e30035ca 	movw	r3, #1482	; 0x5ca
    7664:	e19430b3 	ldrh	r3, [r4, r3]
    7668:	e3130004 	tst	r3, #4
    766c:	0affffb8 	beq	7554 <ipu_dump_registers+0xec>
    7670:	e5953004 	ldr	r3, [r5, #4]
    7674:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    7678:	e3530000 	cmp	r3, #0
    767c:	13a02f5f 	movne	r2, #380	; 0x17c
    7680:	03a02f4b 	moveq	r2, #300	; 0x12c
    7684:	e5963d48 	ldr	r3, [r6, #3400]	; 0xd48
    7688:	e0833002 	add	r3, r3, r2
    768c:	e5933000 	ldr	r3, [r3]
    7690:	f57ff04f 	dsb	sy
    7694:	e3002000 	movw	r2, #0
    7698:	e59f047c 	ldr	r0, [pc, #1148]	; 7b1c <ipu_dump_registers+0x6b4>
    769c:	e3402000 	movt	r2, #0
    76a0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    76a4:	eaffffaa 	b	7554 <ipu_dump_registers+0xec>
    76a8:	e2853a01 	add	r3, r5, #4096	; 0x1000
    76ac:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    76b0:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    76b4:	e5933004 	ldr	r3, [r3, #4]
    76b8:	f57ff04f 	dsb	sy
    76bc:	e3002000 	movw	r2, #0
    76c0:	e59f0458 	ldr	r0, [pc, #1112]	; 7b20 <ipu_dump_registers+0x6b8>
    76c4:	e3402000 	movt	r2, #0
    76c8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    76cc:	e300350a 	movw	r3, #1290	; 0x50a
    76d0:	e19430b3 	ldrh	r3, [r4, r3]
    76d4:	e3130004 	tst	r3, #4
    76d8:	0affff7a 	beq	74c8 <ipu_dump_registers+0x60>
    76dc:	e2853a01 	add	r3, r5, #4096	; 0x1000
    76e0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    76e4:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    76e8:	e5933008 	ldr	r3, [r3, #8]
    76ec:	f57ff04f 	dsb	sy
    76f0:	e3002000 	movw	r2, #0
    76f4:	e59f0428 	ldr	r0, [pc, #1064]	; 7b24 <ipu_dump_registers+0x6bc>
    76f8:	e3402000 	movt	r2, #0
    76fc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7700:	e3003522 	movw	r3, #1314	; 0x522
    7704:	e19430b3 	ldrh	r3, [r4, r3]
    7708:	e3130004 	tst	r3, #4
    770c:	0affff71 	beq	74d8 <ipu_dump_registers+0x70>
    7710:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7714:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7718:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    771c:	e5933014 	ldr	r3, [r3, #20]
    7720:	f57ff04f 	dsb	sy
    7724:	e3002000 	movw	r2, #0
    7728:	e59f03f8 	ldr	r0, [pc, #1016]	; 7b28 <ipu_dump_registers+0x6c0>
    772c:	e3402000 	movt	r2, #0
    7730:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7734:	e300353a 	movw	r3, #1338	; 0x53a
    7738:	e19430b3 	ldrh	r3, [r4, r3]
    773c:	e3130004 	tst	r3, #4
    7740:	0affff68 	beq	74e8 <ipu_dump_registers+0x80>
    7744:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7748:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    774c:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    7750:	e5933018 	ldr	r3, [r3, #24]
    7754:	f57ff04f 	dsb	sy
    7758:	e3002000 	movw	r2, #0
    775c:	e59f03c8 	ldr	r0, [pc, #968]	; 7b2c <ipu_dump_registers+0x6c4>
    7760:	e3402000 	movt	r2, #0
    7764:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7768:	e3003552 	movw	r3, #1362	; 0x552
    776c:	e19430b3 	ldrh	r3, [r4, r3]
    7770:	e3130004 	tst	r3, #4
    7774:	0affff5f 	beq	74f8 <ipu_dump_registers+0x90>
    7778:	e5952004 	ldr	r2, [r5, #4]
    777c:	e2856a01 	add	r6, r5, #4096	; 0x1000
    7780:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    7784:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    7788:	e3520000 	cmp	r2, #0
    778c:	13a02040 	movne	r2, #64	; 0x40
    7790:	03a02034 	moveq	r2, #52	; 0x34
    7794:	e0833002 	add	r3, r3, r2
    7798:	e5933000 	ldr	r3, [r3]
    779c:	f57ff04f 	dsb	sy
    77a0:	e3002000 	movw	r2, #0
    77a4:	e59f0384 	ldr	r0, [pc, #900]	; 7b30 <ipu_dump_registers+0x6c8>
    77a8:	e3402000 	movt	r2, #0
    77ac:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    77b0:	e300356a 	movw	r3, #1386	; 0x56a
    77b4:	e19430b3 	ldrh	r3, [r4, r3]
    77b8:	e3130004 	tst	r3, #4
    77bc:	0affff51 	beq	7508 <ipu_dump_registers+0xa0>
    77c0:	e5952004 	ldr	r2, [r5, #4]
    77c4:	e2856a01 	add	r6, r5, #4096	; 0x1000
    77c8:	e5963d4c 	ldr	r3, [r6, #3404]	; 0xd4c
    77cc:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    77d0:	e3520000 	cmp	r2, #0
    77d4:	13a02044 	movne	r2, #68	; 0x44
    77d8:	03a02038 	moveq	r2, #56	; 0x38
    77dc:	e0833002 	add	r3, r3, r2
    77e0:	e5933000 	ldr	r3, [r3]
    77e4:	f57ff04f 	dsb	sy
    77e8:	e3002000 	movw	r2, #0
    77ec:	e59f0340 	ldr	r0, [pc, #832]	; 7b34 <ipu_dump_registers+0x6cc>
    77f0:	e3402000 	movt	r2, #0
    77f4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    77f8:	e3003582 	movw	r3, #1410	; 0x582
    77fc:	e19430b3 	ldrh	r3, [r4, r3]
    7800:	e3130004 	tst	r3, #4
    7804:	0affff43 	beq	7518 <ipu_dump_registers+0xb0>
    7808:	e2853a01 	add	r3, r5, #4096	; 0x1000
    780c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7810:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7814:	e5933150 	ldr	r3, [r3, #336]	; 0x150
    7818:	f57ff04f 	dsb	sy
    781c:	e3002000 	movw	r2, #0
    7820:	e59f0310 	ldr	r0, [pc, #784]	; 7b38 <ipu_dump_registers+0x6d0>
    7824:	e3402000 	movt	r2, #0
    7828:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    782c:	e300359a 	movw	r3, #1434	; 0x59a
    7830:	e19430b3 	ldrh	r3, [r4, r3]
    7834:	e3130004 	tst	r3, #4
    7838:	0affff3a 	beq	7528 <ipu_dump_registers+0xc0>
    783c:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7840:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7844:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7848:	e5933154 	ldr	r3, [r3, #340]	; 0x154
    784c:	f57ff04f 	dsb	sy
    7850:	e3002000 	movw	r2, #0
    7854:	e59f02e0 	ldr	r0, [pc, #736]	; 7b3c <ipu_dump_registers+0x6d4>
    7858:	e3402000 	movt	r2, #0
    785c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7860:	eaffff30 	b	7528 <ipu_dump_registers+0xc0>
    7864:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7868:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    786c:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7870:	e59330b4 	ldr	r3, [r3, #180]	; 0xb4
    7874:	f57ff04f 	dsb	sy
    7878:	e3002000 	movw	r2, #0
    787c:	e59f02bc 	ldr	r0, [pc, #700]	; 7b40 <ipu_dump_registers+0x6d8>
    7880:	e3402000 	movt	r2, #0
    7884:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7888:	e30036ba 	movw	r3, #1722	; 0x6ba
    788c:	e19430b3 	ldrh	r3, [r4, r3]
    7890:	e3130004 	tst	r3, #4
    7894:	0affff56 	beq	75f4 <ipu_dump_registers+0x18c>
    7898:	e2853a01 	add	r3, r5, #4096	; 0x1000
    789c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    78a0:	e5933d80 	ldr	r3, [r3, #3456]	; 0xd80
    78a4:	e5933000 	ldr	r3, [r3]
    78a8:	f57ff04f 	dsb	sy
    78ac:	e3002000 	movw	r2, #0
    78b0:	e59f028c 	ldr	r0, [pc, #652]	; 7b44 <ipu_dump_registers+0x6dc>
    78b4:	e3402000 	movt	r2, #0
    78b8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    78bc:	e30036d2 	movw	r3, #1746	; 0x6d2
    78c0:	e19430b3 	ldrh	r3, [r4, r3]
    78c4:	e3130004 	tst	r3, #4
    78c8:	0affff4d 	beq	7604 <ipu_dump_registers+0x19c>
    78cc:	e2853a01 	add	r3, r5, #4096	; 0x1000
    78d0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    78d4:	e5933d80 	ldr	r3, [r3, #3456]	; 0xd80
    78d8:	e5933004 	ldr	r3, [r3, #4]
    78dc:	f57ff04f 	dsb	sy
    78e0:	e3002000 	movw	r2, #0
    78e4:	e59f025c 	ldr	r0, [pc, #604]	; 7b48 <ipu_dump_registers+0x6e0>
    78e8:	e3402000 	movt	r2, #0
    78ec:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    78f0:	eaffff43 	b	7604 <ipu_dump_registers+0x19c>
    78f4:	e3001000 	movw	r1, #0
    78f8:	e59f024c 	ldr	r0, [pc, #588]	; 7b4c <ipu_dump_registers+0x6e4>
    78fc:	e3401000 	movt	r1, #0
    7900:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    7904:	e30034c2 	movw	r3, #1218	; 0x4c2
    7908:	e19430b3 	ldrh	r3, [r4, r3]
    790c:	e3130004 	tst	r3, #4
    7910:	0afffee0 	beq	7498 <ipu_dump_registers+0x30>
    7914:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7918:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    791c:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7920:	e5933000 	ldr	r3, [r3]
    7924:	f57ff04f 	dsb	sy
    7928:	e3002000 	movw	r2, #0
    792c:	e59f021c 	ldr	r0, [pc, #540]	; 7b50 <ipu_dump_registers+0x6e8>
    7930:	e3402000 	movt	r2, #0
    7934:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7938:	e30034da 	movw	r3, #1242	; 0x4da
    793c:	e19430b3 	ldrh	r3, [r4, r3]
    7940:	e3130004 	tst	r3, #4
    7944:	0afffed7 	beq	74a8 <ipu_dump_registers+0x40>
    7948:	e2853a01 	add	r3, r5, #4096	; 0x1000
    794c:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7950:	e5933d4c 	ldr	r3, [r3, #3404]	; 0xd4c
    7954:	e5933000 	ldr	r3, [r3]
    7958:	f57ff04f 	dsb	sy
    795c:	e3002000 	movw	r2, #0
    7960:	e59f01ec 	ldr	r0, [pc, #492]	; 7b54 <ipu_dump_registers+0x6ec>
    7964:	e3402000 	movt	r2, #0
    7968:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    796c:	eafffecd 	b	74a8 <ipu_dump_registers+0x40>
    7970:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7974:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7978:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    797c:	e5933004 	ldr	r3, [r3, #4]
    7980:	f57ff04f 	dsb	sy
    7984:	e3002000 	movw	r2, #0
    7988:	e59f01c8 	ldr	r0, [pc, #456]	; 7b58 <ipu_dump_registers+0x6f0>
    798c:	e3402000 	movt	r2, #0
    7990:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7994:	e30035fa 	movw	r3, #1530	; 0x5fa
    7998:	e19430b3 	ldrh	r3, [r4, r3]
    799c:	e3130004 	tst	r3, #4
    79a0:	0afffef3 	beq	7574 <ipu_dump_registers+0x10c>
    79a4:	e2853a01 	add	r3, r5, #4096	; 0x1000
    79a8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    79ac:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    79b0:	e5933008 	ldr	r3, [r3, #8]
    79b4:	f57ff04f 	dsb	sy
    79b8:	e3002000 	movw	r2, #0
    79bc:	e59f0198 	ldr	r0, [pc, #408]	; 7b5c <ipu_dump_registers+0x6f4>
    79c0:	e3402000 	movt	r2, #0
    79c4:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    79c8:	e3003612 	movw	r3, #1554	; 0x612
    79cc:	e19430b3 	ldrh	r3, [r4, r3]
    79d0:	e3130004 	tst	r3, #4
    79d4:	0afffeea 	beq	7584 <ipu_dump_registers+0x11c>
    79d8:	e2853a01 	add	r3, r5, #4096	; 0x1000
    79dc:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    79e0:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    79e4:	e593300c 	ldr	r3, [r3, #12]
    79e8:	f57ff04f 	dsb	sy
    79ec:	e3002000 	movw	r2, #0
    79f0:	e59f0168 	ldr	r0, [pc, #360]	; 7b60 <ipu_dump_registers+0x6f8>
    79f4:	e3402000 	movt	r2, #0
    79f8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    79fc:	e300362a 	movw	r3, #1578	; 0x62a
    7a00:	e19430b3 	ldrh	r3, [r4, r3]
    7a04:	e3130004 	tst	r3, #4
    7a08:	0afffee1 	beq	7594 <ipu_dump_registers+0x12c>
    7a0c:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7a10:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7a14:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    7a18:	e5933010 	ldr	r3, [r3, #16]
    7a1c:	f57ff04f 	dsb	sy
    7a20:	e3002000 	movw	r2, #0
    7a24:	e59f0138 	ldr	r0, [pc, #312]	; 7b64 <ipu_dump_registers+0x6fc>
    7a28:	e3402000 	movt	r2, #0
    7a2c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7a30:	e3003642 	movw	r3, #1602	; 0x642
    7a34:	e19430b3 	ldrh	r3, [r4, r3]
    7a38:	e3130004 	tst	r3, #4
    7a3c:	0afffed8 	beq	75a4 <ipu_dump_registers+0x13c>
    7a40:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7a44:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7a48:	e5933d60 	ldr	r3, [r3, #3424]	; 0xd60
    7a4c:	e593301c 	ldr	r3, [r3, #28]
    7a50:	f57ff04f 	dsb	sy
    7a54:	e3002000 	movw	r2, #0
    7a58:	e59f0108 	ldr	r0, [pc, #264]	; 7b68 <ipu_dump_registers+0x700>
    7a5c:	e3402000 	movt	r2, #0
    7a60:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7a64:	e300365a 	movw	r3, #1626	; 0x65a
    7a68:	e19430b3 	ldrh	r3, [r4, r3]
    7a6c:	e3130004 	tst	r3, #4
    7a70:	0afffecf 	beq	75b4 <ipu_dump_registers+0x14c>
    7a74:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7a78:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7a7c:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7a80:	e59330a8 	ldr	r3, [r3, #168]	; 0xa8
    7a84:	f57ff04f 	dsb	sy
    7a88:	e3002000 	movw	r2, #0
    7a8c:	e59f00d8 	ldr	r0, [pc, #216]	; 7b6c <ipu_dump_registers+0x704>
    7a90:	e3402000 	movt	r2, #0
    7a94:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7a98:	e3003672 	movw	r3, #1650	; 0x672
    7a9c:	e19430b3 	ldrh	r3, [r4, r3]
    7aa0:	e3130004 	tst	r3, #4
    7aa4:	0afffec6 	beq	75c4 <ipu_dump_registers+0x15c>
    7aa8:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7aac:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7ab0:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7ab4:	e59330ac 	ldr	r3, [r3, #172]	; 0xac
    7ab8:	f57ff04f 	dsb	sy
    7abc:	e3002000 	movw	r2, #0
    7ac0:	e59f00a8 	ldr	r0, [pc, #168]	; 7b70 <ipu_dump_registers+0x708>
    7ac4:	e3402000 	movt	r2, #0
    7ac8:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7acc:	e300368a 	movw	r3, #1674	; 0x68a
    7ad0:	e19430b3 	ldrh	r3, [r4, r3]
    7ad4:	e3130004 	tst	r3, #4
    7ad8:	0afffebd 	beq	75d4 <ipu_dump_registers+0x16c>
    7adc:	e2853a01 	add	r3, r5, #4096	; 0x1000
    7ae0:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    7ae4:	e5933d48 	ldr	r3, [r3, #3400]	; 0xd48
    7ae8:	e59330b0 	ldr	r3, [r3, #176]	; 0xb0
    7aec:	f57ff04f 	dsb	sy
    7af0:	e3002000 	movw	r2, #0
    7af4:	e59f0078 	ldr	r0, [pc, #120]	; 7b74 <ipu_dump_registers+0x70c>
    7af8:	e3402000 	movt	r2, #0
    7afc:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    7b00:	eafffeb3 	b	75d4 <ipu_dump_registers+0x16c>
    7b04:	e2856a01 	add	r6, r5, #4096	; 0x1000
    7b08:	e3a02f5f 	mov	r2, #380	; 0x17c
    7b0c:	e5961d84 	ldr	r1, [r6, #3460]	; 0xd84
    7b10:	eafffedb 	b	7684 <ipu_dump_registers+0x21c>
    7b14:	000006d8 	ldrdeq	r0, [r0], -r8
    7b18:	000005a0 	andeq	r0, r0, r0, lsr #11
    7b1c:	000005b8 			; <UNDEFINED> instruction: 0x000005b8
    7b20:	000004e0 	andeq	r0, r0, r0, ror #9
    7b24:	000004f8 	strdeq	r0, [r0], -r8
    7b28:	00000510 	andeq	r0, r0, r0, lsl r5
    7b2c:	00000528 	andeq	r0, r0, r8, lsr #10
    7b30:	00000540 	andeq	r0, r0, r0, asr #10
    7b34:	00000558 	andeq	r0, r0, r8, asr r5
    7b38:	00000570 	andeq	r0, r0, r0, ror r5
    7b3c:	00000588 	andeq	r0, r0, r8, lsl #11
    7b40:	00000690 	muleq	r0, r0, r6
    7b44:	000006a8 	andeq	r0, r0, r8, lsr #13
    7b48:	000006c0 	andeq	r0, r0, r0, asr #13
    7b4c:	00000498 	muleq	r0, r8, r4
    7b50:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
    7b54:	000004c8 	andeq	r0, r0, r8, asr #9
    7b58:	000005d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
    7b5c:	000005e8 	andeq	r0, r0, r8, ror #11
    7b60:	00000600 	andeq	r0, r0, r0, lsl #12
    7b64:	00000618 	andeq	r0, r0, r8, lsl r6
    7b68:	00000630 	andeq	r0, r0, r0, lsr r6
    7b6c:	00000648 	andeq	r0, r0, r8, asr #12
    7b70:	00000660 	andeq	r0, r0, r0, ror #12
    7b74:	00000678 	andeq	r0, r0, r8, ror r6

00007b78 <_ipu_clear_buffer_ready>:
    7b78:	e0822082 	add	r2, r2, r2, lsl #1
    7b7c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    7b80:	e1a02082 	lsl	r2, r2, #1
    7b84:	e1a04231 	lsr	r4, r1, r2
    7b88:	e204503f 	and	r5, r4, #63	; 0x3f
    7b8c:	e355003f 	cmp	r5, #63	; 0x3f
    7b90:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    7b94:	e1a07003 	mov	r7, r3
    7b98:	e1a06000 	mov	r6, r0
    7b9c:	f57ff04e 	dsb	st
    7ba0:	ebfffffe 	bl	0 <arm_heavy_mb>
    7ba4:	e2868a01 	add	r8, r6, #4096	; 0x1000
    7ba8:	e3a03000 	mov	r3, #0
    7bac:	e5982d48 	ldr	r2, [r8, #3400]	; 0xd48
    7bb0:	e34f3030 	movt	r3, #61488	; 0xf030
    7bb4:	e58230e4 	str	r3, [r2, #228]	; 0xe4
    7bb8:	e3570000 	cmp	r7, #0
    7bbc:	e204401f 	and	r4, r4, #31
    7bc0:	e3a01001 	mov	r1, #1
    7bc4:	e1a04411 	lsl	r4, r1, r4
    7bc8:	1a000010 	bne	7c10 <_ipu_clear_buffer_ready+0x98>
    7bcc:	e5963004 	ldr	r3, [r6, #4]
    7bd0:	e1a052a5 	lsr	r5, r5, #5
    7bd4:	e3530000 	cmp	r3, #0
    7bd8:	1285509a 	addne	r5, r5, #154	; 0x9a
    7bdc:	02855050 	addeq	r5, r5, #80	; 0x50
    7be0:	e1a05105 	lsl	r5, r5, #2
    7be4:	f57ff04e 	dsb	st
    7be8:	ebfffffe 	bl	0 <arm_heavy_mb>
    7bec:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    7bf0:	e0835005 	add	r5, r3, r5
    7bf4:	e5854000 	str	r4, [r5]
    7bf8:	f57ff04e 	dsb	st
    7bfc:	ebfffffe 	bl	0 <arm_heavy_mb>
    7c00:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    7c04:	e3a02000 	mov	r2, #0
    7c08:	e58320e4 	str	r2, [r3, #228]	; 0xe4
    7c0c:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    7c10:	e3570001 	cmp	r7, #1
    7c14:	e5963004 	ldr	r3, [r6, #4]
    7c18:	0a000005 	beq	7c34 <_ipu_clear_buffer_ready+0xbc>
    7c1c:	e3530000 	cmp	r3, #0
    7c20:	11a052a5 	lsrne	r5, r5, #5
    7c24:	03a05f4b 	moveq	r5, #300	; 0x12c
    7c28:	128550a2 	addne	r5, r5, #162	; 0xa2
    7c2c:	11a05105 	lslne	r5, r5, #2
    7c30:	eaffffeb 	b	7be4 <_ipu_clear_buffer_ready+0x6c>
    7c34:	e1a052a5 	lsr	r5, r5, #5
    7c38:	e3530000 	cmp	r3, #0
    7c3c:	1285509c 	addne	r5, r5, #156	; 0x9c
    7c40:	02855052 	addeq	r5, r5, #82	; 0x52
    7c44:	e1a05105 	lsl	r5, r5, #2
    7c48:	eaffffe5 	b	7be4 <_ipu_clear_buffer_ready+0x6c>

00007c4c <ipu_clear_buffer_ready>:
    7c4c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    7c50:	e2804d79 	add	r4, r0, #7744	; 0x1e40
    7c54:	e2844020 	add	r4, r4, #32
    7c58:	e1a05000 	mov	r5, r0
    7c5c:	e1a07001 	mov	r7, r1
    7c60:	e1a08002 	mov	r8, r2
    7c64:	e1a09003 	mov	r9, r3
    7c68:	e1a00004 	mov	r0, r4
    7c6c:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    7c70:	e1a01007 	mov	r1, r7
    7c74:	e1a06000 	mov	r6, r0
    7c78:	e1a03009 	mov	r3, r9
    7c7c:	e1a00005 	mov	r0, r5
    7c80:	e1a02008 	mov	r2, r8
    7c84:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    7c88:	e1a01006 	mov	r1, r6
    7c8c:	e1a00004 	mov	r0, r4
    7c90:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    7c94:	eafffffe 	b	0 <_raw_spin_unlock_irqrestore>

00007c98 <ipu_disable_channel>:
    7c98:	e2803d79 	add	r3, r0, #7744	; 0x1e40
    7c9c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    7ca0:	e2833008 	add	r3, r3, #8
    7ca4:	e1a0a001 	mov	sl, r1
    7ca8:	e24dd07c 	sub	sp, sp, #124	; 0x7c
    7cac:	e2805a01 	add	r5, r0, #4096	; 0x1000
    7cb0:	e1a04000 	mov	r4, r0
    7cb4:	e1a00003 	mov	r0, r3
    7cb8:	e1a06002 	mov	r6, r2
    7cbc:	e58d3024 	str	r3, [sp, #36]	; 0x24
    7cc0:	ebfffffe 	bl	0 <mutex_lock>
    7cc4:	e1a03c4a 	asr	r3, sl, #24
    7cc8:	e3a02001 	mov	r2, #1
    7ccc:	e5951e18 	ldr	r1, [r5, #3608]	; 0xe18
    7cd0:	e1a00312 	lsl	r0, r2, r3
    7cd4:	e1100001 	tst	r0, r1
    7cd8:	e58d0034 	str	r0, [sp, #52]	; 0x34
    7cdc:	0a000311 	beq	8928 <ipu_disable_channel+0xc90>
    7ce0:	e1a0c92a 	lsr	ip, sl, #18
    7ce4:	e20ae03f 	and	lr, sl, #63	; 0x3f
    7ce8:	e58de014 	str	lr, [sp, #20]
    7cec:	e20c003f 	and	r0, ip, #63	; 0x3f
    7cf0:	e58dc030 	str	ip, [sp, #48]	; 0x30
    7cf4:	e350003f 	cmp	r0, #63	; 0x3f
    7cf8:	e58d0010 	str	r0, [sp, #16]
    7cfc:	0a00000d 	beq	7d38 <ipu_disable_channel+0xa0>
    7d00:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    7d04:	e1a002a0 	lsr	r0, r0, #5
    7d08:	e2800001 	add	r0, r0, #1
    7d0c:	e0811100 	add	r1, r1, r0, lsl #2
    7d10:	e5911000 	ldr	r1, [r1]
    7d14:	f57ff04f 	dsb	sy
    7d18:	e20c001f 	and	r0, ip, #31
    7d1c:	e0011012 	and	r1, r1, r2, lsl r0
    7d20:	e25e003f 	subs	r0, lr, #63	; 0x3f
    7d24:	13a00001 	movne	r0, #1
    7d28:	e3510000 	cmp	r1, #0
    7d2c:	13a00000 	movne	r0, #0
    7d30:	e3500000 	cmp	r0, #0
    7d34:	1a00010f 	bne	8178 <ipu_disable_channel+0x4e0>
    7d38:	e0843003 	add	r3, r4, r3
    7d3c:	e1a02003 	mov	r2, r3
    7d40:	e58d3004 	str	r3, [sp, #4]
    7d44:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    7d48:	e7d23003 	ldrb	r3, [r2, r3]
    7d4c:	e59d2004 	ldr	r2, [sp, #4]
    7d50:	e3530000 	cmp	r3, #0
    7d54:	17e5365a 	ubfxne	r3, sl, #12, #6
    7d58:	03a0303f 	moveq	r3, #63	; 0x3f
    7d5c:	e58d3018 	str	r3, [sp, #24]
    7d60:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    7d64:	e7d23003 	ldrb	r3, [r2, r3]
    7d68:	e3530000 	cmp	r3, #0
    7d6c:	e58d301c 	str	r3, [sp, #28]
    7d70:	03a0303f 	moveq	r3, #63	; 0x3f
    7d74:	058d3020 	streq	r3, [sp, #32]
    7d78:	0a000006 	beq	7d98 <ipu_disable_channel+0x100>
    7d7c:	e7e5335a 	ubfx	r3, sl, #6, #6
    7d80:	e7e5265a 	ubfx	r2, sl, #12, #6
    7d84:	e58d3020 	str	r3, [sp, #32]
    7d88:	e253303f 	subs	r3, r3, #63	; 0x3f
    7d8c:	13a03001 	movne	r3, #1
    7d90:	e58d2018 	str	r2, [sp, #24]
    7d94:	e58d301c 	str	r3, [sp, #28]
    7d98:	e30f2cff 	movw	r2, #64767	; 0xfcff
    7d9c:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    7da0:	e340295f 	movt	r2, #2399	; 0x95f
    7da4:	e3403a6f 	movt	r3, #2671	; 0xa6f
    7da8:	e15a0003 	cmp	sl, r3
    7dac:	115a0002 	cmpne	sl, r2
    7db0:	03a02001 	moveq	r2, #1
    7db4:	13a02000 	movne	r2, #0
    7db8:	e58d2038 	str	r2, [sp, #56]	; 0x38
    7dbc:	0a0000d4 	beq	8114 <ipu_disable_channel+0x47c>
    7dc0:	e30f3fff 	movw	r3, #65535	; 0xffff
    7dc4:	e3403773 	movt	r3, #1907	; 0x773
    7dc8:	e15a0003 	cmp	sl, r3
    7dcc:	0a0000d2 	beq	811c <ipu_disable_channel+0x484>
    7dd0:	e59d3014 	ldr	r3, [sp, #20]
    7dd4:	e3530003 	cmp	r3, #3
    7dd8:	93a06000 	movls	r6, #0
    7ddc:	82066001 	andhi	r6, r6, #1
    7de0:	e3560000 	cmp	r6, #0
    7de4:	1a00018c 	bne	841c <ipu_disable_channel+0x784>
    7de8:	e59d1010 	ldr	r1, [sp, #16]
    7dec:	e2413011 	sub	r3, r1, #17
    7df0:	e241200b 	sub	r2, r1, #11
    7df4:	e3530001 	cmp	r3, #1
    7df8:	83a03001 	movhi	r3, #1
    7dfc:	93a03000 	movls	r3, #0
    7e00:	e352000b 	cmp	r2, #11
    7e04:	83a03000 	movhi	r3, #0
    7e08:	e3530000 	cmp	r3, #0
    7e0c:	1a000010 	bne	7e54 <ipu_disable_channel+0x1bc>
    7e10:	e59d0014 	ldr	r0, [sp, #20]
    7e14:	e240300b 	sub	r3, r0, #11
    7e18:	e2402011 	sub	r2, r0, #17
    7e1c:	e353000b 	cmp	r3, #11
    7e20:	93a03001 	movls	r3, #1
    7e24:	83a03000 	movhi	r3, #0
    7e28:	e3520001 	cmp	r2, #1
    7e2c:	93a03000 	movls	r3, #0
    7e30:	e3530000 	cmp	r3, #0
    7e34:	1a000006 	bne	7e54 <ipu_disable_channel+0x1bc>
    7e38:	e241302d 	sub	r3, r1, #45	; 0x2d
    7e3c:	e3530005 	cmp	r3, #5
    7e40:	9a000003 	bls	7e54 <ipu_disable_channel+0x1bc>
    7e44:	e240302d 	sub	r3, r0, #45	; 0x2d
    7e48:	e3500005 	cmp	r0, #5
    7e4c:	13530005 	cmpne	r3, #5
    7e50:	8a000002 	bhi	7e60 <ipu_disable_channel+0x1c8>
    7e54:	e1a0100a 	mov	r1, sl
    7e58:	e1a00004 	mov	r0, r4
    7e5c:	ebfffffe 	bl	95f8 <_ipu_ic_disable_task>
    7e60:	e59d3010 	ldr	r3, [sp, #16]
    7e64:	e353003f 	cmp	r3, #63	; 0x3f
    7e68:	0a000029 	beq	7f14 <ipu_disable_channel+0x27c>
    7e6c:	e1a062a3 	lsr	r6, r3, #5
    7e70:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7e74:	e2866001 	add	r6, r6, #1
    7e78:	e1a06106 	lsl	r6, r6, #2
    7e7c:	e0833006 	add	r3, r3, r6
    7e80:	e5938000 	ldr	r8, [r3]
    7e84:	f57ff04f 	dsb	sy
    7e88:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    7e8c:	e3a07001 	mov	r7, #1
    7e90:	e203301f 	and	r3, r3, #31
    7e94:	e1a07317 	lsl	r7, r7, r3
    7e98:	e1c88007 	bic	r8, r8, r7
    7e9c:	f57ff04e 	dsb	st
    7ea0:	ebfffffe 	bl	0 <arm_heavy_mb>
    7ea4:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7ea8:	e0833006 	add	r3, r3, r6
    7eac:	e5838000 	str	r8, [r3]
    7eb0:	e5943004 	ldr	r3, [r4, #4]
    7eb4:	e3530000 	cmp	r3, #0
    7eb8:	12866f8e 	addne	r6, r6, #568	; 0x238
    7ebc:	02866e12 	addeq	r6, r6, #288	; 0x120
    7ec0:	f57ff04e 	dsb	st
    7ec4:	ebfffffe 	bl	0 <arm_heavy_mb>
    7ec8:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7ecc:	e0836006 	add	r6, r3, r6
    7ed0:	e5867000 	str	r7, [r6]
    7ed4:	e59d3010 	ldr	r3, [sp, #16]
    7ed8:	e3a07003 	mov	r7, #3
    7edc:	e5941004 	ldr	r1, [r4, #4]
    7ee0:	e1a03083 	lsl	r3, r3, #1
    7ee4:	e3510000 	cmp	r1, #0
    7ee8:	03a06f4b 	moveq	r6, #300	; 0x12c
    7eec:	11a062a3 	lsrne	r6, r3, #5
    7ef0:	e203201e 	and	r2, r3, #30
    7ef4:	e1a07217 	lsl	r7, r7, r2
    7ef8:	12866096 	addne	r6, r6, #150	; 0x96
    7efc:	11a06106 	lslne	r6, r6, #2
    7f00:	f57ff04e 	dsb	st
    7f04:	ebfffffe 	bl	0 <arm_heavy_mb>
    7f08:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7f0c:	e0836006 	add	r6, r3, r6
    7f10:	e5867000 	str	r7, [r6]
    7f14:	e59d3014 	ldr	r3, [sp, #20]
    7f18:	e353003f 	cmp	r3, #63	; 0x3f
    7f1c:	0a000028 	beq	7fc4 <ipu_disable_channel+0x32c>
    7f20:	e1a062a3 	lsr	r6, r3, #5
    7f24:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7f28:	e2866001 	add	r6, r6, #1
    7f2c:	e1a06106 	lsl	r6, r6, #2
    7f30:	e0833006 	add	r3, r3, r6
    7f34:	e5938000 	ldr	r8, [r3]
    7f38:	f57ff04f 	dsb	sy
    7f3c:	e3a07001 	mov	r7, #1
    7f40:	e20a301f 	and	r3, sl, #31
    7f44:	e1a07317 	lsl	r7, r7, r3
    7f48:	e1c88007 	bic	r8, r8, r7
    7f4c:	f57ff04e 	dsb	st
    7f50:	ebfffffe 	bl	0 <arm_heavy_mb>
    7f54:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    7f58:	e0833006 	add	r3, r3, r6
    7f5c:	e5838000 	str	r8, [r3]
    7f60:	e5943004 	ldr	r3, [r4, #4]
    7f64:	e3530000 	cmp	r3, #0
    7f68:	12866f8e 	addne	r6, r6, #568	; 0x238
    7f6c:	02866e12 	addeq	r6, r6, #288	; 0x120
    7f70:	f57ff04e 	dsb	st
    7f74:	ebfffffe 	bl	0 <arm_heavy_mb>
    7f78:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7f7c:	e0836006 	add	r6, r3, r6
    7f80:	e5867000 	str	r7, [r6]
    7f84:	e59d3014 	ldr	r3, [sp, #20]
    7f88:	e3a07003 	mov	r7, #3
    7f8c:	e5941004 	ldr	r1, [r4, #4]
    7f90:	e1a03083 	lsl	r3, r3, #1
    7f94:	e3510000 	cmp	r1, #0
    7f98:	03a06f4b 	moveq	r6, #300	; 0x12c
    7f9c:	11a062a3 	lsrne	r6, r3, #5
    7fa0:	e203201e 	and	r2, r3, #30
    7fa4:	e1a07217 	lsl	r7, r7, r2
    7fa8:	12866096 	addne	r6, r6, #150	; 0x96
    7fac:	11a06106 	lslne	r6, r6, #2
    7fb0:	f57ff04e 	dsb	st
    7fb4:	ebfffffe 	bl	0 <arm_heavy_mb>
    7fb8:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    7fbc:	e0836006 	add	r6, r3, r6
    7fc0:	e5867000 	str	r7, [r6]
    7fc4:	e59d2018 	ldr	r2, [sp, #24]
    7fc8:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    7fcc:	e252703f 	subs	r7, r2, #63	; 0x3f
    7fd0:	e59d2004 	ldr	r2, [sp, #4]
    7fd4:	13a07001 	movne	r7, #1
    7fd8:	e7d23003 	ldrb	r3, [r2, r3]
    7fdc:	e1170003 	tst	r7, r3
    7fe0:	1a0000a4 	bne	8278 <ipu_disable_channel+0x5e0>
    7fe4:	e59d2004 	ldr	r2, [sp, #4]
    7fe8:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    7fec:	e7d23003 	ldrb	r3, [r2, r3]
    7ff0:	e59d201c 	ldr	r2, [sp, #28]
    7ff4:	e1120003 	tst	r2, r3
    7ff8:	1a000082 	bne	8208 <ipu_disable_channel+0x570>
    7ffc:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    8000:	e3403a6f 	movt	r3, #2671	; 0xa6f
    8004:	e15a0003 	cmp	sl, r3
    8008:	0a0000f9 	beq	83f4 <ipu_disable_channel+0x75c>
    800c:	e2846d79 	add	r6, r4, #7744	; 0x1e40
    8010:	e2866020 	add	r6, r6, #32
    8014:	e1a00006 	mov	r0, r6
    8018:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    801c:	e59d3010 	ldr	r3, [sp, #16]
    8020:	e1a08000 	mov	r8, r0
    8024:	e353003f 	cmp	r3, #63	; 0x3f
    8028:	0a00000e 	beq	8068 <ipu_disable_channel+0x3d0>
    802c:	e3a03000 	mov	r3, #0
    8030:	e3a02003 	mov	r2, #3
    8034:	e1a0100a 	mov	r1, sl
    8038:	e1a00004 	mov	r0, r4
    803c:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8040:	e3a03001 	mov	r3, #1
    8044:	e3a02003 	mov	r2, #3
    8048:	e1a0100a 	mov	r1, sl
    804c:	e1a00004 	mov	r0, r4
    8050:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8054:	e3a03002 	mov	r3, #2
    8058:	e3a02003 	mov	r2, #3
    805c:	e1a0100a 	mov	r1, sl
    8060:	e1a00004 	mov	r0, r4
    8064:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8068:	e59d3014 	ldr	r3, [sp, #20]
    806c:	e353003f 	cmp	r3, #63	; 0x3f
    8070:	0a000009 	beq	809c <ipu_disable_channel+0x404>
    8074:	e3a03000 	mov	r3, #0
    8078:	e1a0100a 	mov	r1, sl
    807c:	e1a02003 	mov	r2, r3
    8080:	e1a00004 	mov	r0, r4
    8084:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8088:	e3a03001 	mov	r3, #1
    808c:	e3a02000 	mov	r2, #0
    8090:	e1a0100a 	mov	r1, sl
    8094:	e1a00004 	mov	r0, r4
    8098:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    809c:	e59d2004 	ldr	r2, [sp, #4]
    80a0:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    80a4:	e7d23003 	ldrb	r3, [r2, r3]
    80a8:	e1170003 	tst	r7, r3
    80ac:	1a00004a 	bne	81dc <ipu_disable_channel+0x544>
    80b0:	e59d2004 	ldr	r2, [sp, #4]
    80b4:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    80b8:	e7d23003 	ldrb	r3, [r2, r3]
    80bc:	e59d201c 	ldr	r2, [sp, #28]
    80c0:	e1120003 	tst	r2, r3
    80c4:	1a000039 	bne	81b0 <ipu_disable_channel+0x518>
    80c8:	e1a01008 	mov	r1, r8
    80cc:	e1a00006 	mov	r0, r6
    80d0:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    80d4:	e5953e18 	ldr	r3, [r5, #3608]	; 0xe18
    80d8:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
    80dc:	e1c33002 	bic	r3, r3, r2
    80e0:	e5853e18 	str	r3, [r5, #3608]	; 0xe18
    80e4:	e594403c 	ldr	r4, [r4, #60]	; 0x3c
    80e8:	e3540000 	cmp	r4, #0
    80ec:	0a000003 	beq	8100 <ipu_disable_channel+0x468>
    80f0:	e1a00004 	mov	r0, r4
    80f4:	ebfffffe 	bl	0 <clk_disable>
    80f8:	e1a00004 	mov	r0, r4
    80fc:	ebfffffe 	bl	0 <clk_unprepare>
    8100:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    8104:	ebfffffe 	bl	0 <mutex_unlock>
    8108:	e3a00000 	mov	r0, #0
    810c:	e28dd07c 	add	sp, sp, #124	; 0x7c
    8110:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    8114:	e15a0003 	cmp	sl, r3
    8118:	0a000071 	beq	82e4 <ipu_disable_channel+0x64c>
    811c:	e3a02000 	mov	r2, #0
    8120:	e1a0100a 	mov	r1, sl
    8124:	e1a00004 	mov	r0, r4
    8128:	ebfffffe 	bl	bde4 <_ipu_dp_dc_disable>
    812c:	e59d1010 	ldr	r1, [sp, #16]
    8130:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    8134:	e1a032a1 	lsr	r3, r1, #5
    8138:	e2833007 	add	r3, r3, #7
    813c:	e1a06103 	lsl	r6, r3, #2
    8140:	e0822006 	add	r2, r2, r6
    8144:	e5927000 	ldr	r7, [r2]
    8148:	f57ff04f 	dsb	sy
    814c:	e351003f 	cmp	r1, #63	; 0x3f
    8150:	159d3030 	ldrne	r3, [sp, #48]	; 0x30
    8154:	13a02001 	movne	r2, #1
    8158:	1203301f 	andne	r3, r3, #31
    815c:	11c77312 	bicne	r7, r7, r2, lsl r3
    8160:	f57ff04e 	dsb	st
    8164:	ebfffffe 	bl	0 <arm_heavy_mb>
    8168:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    816c:	e0833006 	add	r3, r3, r6
    8170:	e5837000 	str	r7, [r3]
    8174:	eaffff1b 	b	7de8 <ipu_disable_channel+0x150>
    8178:	e59d0014 	ldr	r0, [sp, #20]
    817c:	e5951d4c 	ldr	r1, [r5, #3404]	; 0xd4c
    8180:	e1a002a0 	lsr	r0, r0, #5
    8184:	e2800001 	add	r0, r0, #1
    8188:	e0811100 	add	r1, r1, r0, lsl #2
    818c:	e5911000 	ldr	r1, [r1]
    8190:	f57ff04f 	dsb	sy
    8194:	e20a001f 	and	r0, sl, #31
    8198:	e0112012 	ands	r2, r1, r2, lsl r0
    819c:	1afffee5 	bne	7d38 <ipu_disable_channel+0xa0>
    81a0:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    81a4:	ebfffffe 	bl	0 <mutex_unlock>
    81a8:	e3e00015 	mvn	r0, #21
    81ac:	eaffffd6 	b	810c <ipu_disable_channel+0x474>
    81b0:	e1a0100a 	mov	r1, sl
    81b4:	e1a00004 	mov	r0, r4
    81b8:	e3a03000 	mov	r3, #0
    81bc:	e3a02001 	mov	r2, #1
    81c0:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    81c4:	e3a03001 	mov	r3, #1
    81c8:	e1a0100a 	mov	r1, sl
    81cc:	e1a02003 	mov	r2, r3
    81d0:	e1a00004 	mov	r0, r4
    81d4:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    81d8:	eaffffba 	b	80c8 <ipu_disable_channel+0x430>
    81dc:	e1a0100a 	mov	r1, sl
    81e0:	e1a00004 	mov	r0, r4
    81e4:	e3a03000 	mov	r3, #0
    81e8:	e3a02002 	mov	r2, #2
    81ec:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    81f0:	e3a03001 	mov	r3, #1
    81f4:	e3a02002 	mov	r2, #2
    81f8:	e1a0100a 	mov	r1, sl
    81fc:	e1a00004 	mov	r0, r4
    8200:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8204:	eaffffa9 	b	80b0 <ipu_disable_channel+0x418>
    8208:	e59d2020 	ldr	r2, [sp, #32]
    820c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8210:	e1a062a2 	lsr	r6, r2, #5
    8214:	e2866001 	add	r6, r6, #1
    8218:	e1a06106 	lsl	r6, r6, #2
    821c:	e0833006 	add	r3, r3, r6
    8220:	e5939000 	ldr	r9, [r3]
    8224:	f57ff04f 	dsb	sy
    8228:	e3a0b001 	mov	fp, #1
    822c:	e202801f 	and	r8, r2, #31
    8230:	e1a0881b 	lsl	r8, fp, r8
    8234:	e1c99008 	bic	r9, r9, r8
    8238:	f57ff04e 	dsb	st
    823c:	ebfffffe 	bl	0 <arm_heavy_mb>
    8240:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8244:	e0832006 	add	r2, r3, r6
    8248:	e5829000 	str	r9, [r2]
    824c:	e59d2038 	ldr	r2, [sp, #56]	; 0x38
    8250:	e3520000 	cmp	r2, #0
    8254:	0a00004f 	beq	8398 <ipu_disable_channel+0x700>
    8258:	e593900c 	ldr	r9, [r3, #12]
    825c:	f57ff04f 	dsb	sy
    8260:	e59d3010 	ldr	r3, [sp, #16]
    8264:	e353003f 	cmp	r3, #63	; 0x3f
    8268:	159d3030 	ldrne	r3, [sp, #48]	; 0x30
    826c:	1203301f 	andne	r3, r3, #31
    8270:	11c9931b 	bicne	r9, r9, fp, lsl r3
    8274:	ea00004d 	b	83b0 <ipu_disable_channel+0x718>
    8278:	e59d2018 	ldr	r2, [sp, #24]
    827c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8280:	e1a062a2 	lsr	r6, r2, #5
    8284:	e2866001 	add	r6, r6, #1
    8288:	e1a06106 	lsl	r6, r6, #2
    828c:	e0833006 	add	r3, r3, r6
    8290:	e5939000 	ldr	r9, [r3]
    8294:	f57ff04f 	dsb	sy
    8298:	e3a08001 	mov	r8, #1
    829c:	e202301f 	and	r3, r2, #31
    82a0:	e1a08318 	lsl	r8, r8, r3
    82a4:	e1c99008 	bic	r9, r9, r8
    82a8:	f57ff04e 	dsb	st
    82ac:	ebfffffe 	bl	0 <arm_heavy_mb>
    82b0:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    82b4:	e0833006 	add	r3, r3, r6
    82b8:	e5839000 	str	r9, [r3]
    82bc:	e5943004 	ldr	r3, [r4, #4]
    82c0:	e3530000 	cmp	r3, #0
    82c4:	12866f8e 	addne	r6, r6, #568	; 0x238
    82c8:	02866e12 	addeq	r6, r6, #288	; 0x120
    82cc:	f57ff04e 	dsb	st
    82d0:	ebfffffe 	bl	0 <arm_heavy_mb>
    82d4:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    82d8:	e0836006 	add	r6, r3, r6
    82dc:	e5868000 	str	r8, [r6]
    82e0:	eaffff3f 	b	7fe4 <ipu_disable_channel+0x34c>
    82e4:	e1a0100a 	mov	r1, sl
    82e8:	e28d3076 	add	r3, sp, #118	; 0x76
    82ec:	e28d2074 	add	r2, sp, #116	; 0x74
    82f0:	e1a00004 	mov	r0, r4
    82f4:	ebfffffe 	bl	be00 <_ipu_disp_get_window_pos>
    82f8:	e3a03000 	mov	r3, #0
    82fc:	e1a0100a 	mov	r1, sl
    8300:	e1a02003 	mov	r2, r3
    8304:	e1a00004 	mov	r0, r4
    8308:	ebfffffe 	bl	bdf8 <_ipu_disp_set_window_pos>
    830c:	e3a02000 	mov	r2, #0
    8310:	e1a0100a 	mov	r1, sl
    8314:	e1a00004 	mov	r0, r4
    8318:	ebfffffe 	bl	bde4 <_ipu_dp_dc_disable>
    831c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8320:	e5933004 	ldr	r3, [r3, #4]
    8324:	f57ff04f 	dsb	sy
    8328:	e3130502 	tst	r3, #8388608	; 0x800000
    832c:	0a000036 	beq	840c <ipu_disable_channel+0x774>
    8330:	e5943004 	ldr	r3, [r4, #4]
    8334:	e3530000 	cmp	r3, #0
    8338:	03a060e8 	moveq	r6, #232	; 0xe8
    833c:	13a06c02 	movne	r6, #512	; 0x200
    8340:	f57ff04e 	dsb	st
    8344:	ebfffffe 	bl	0 <arm_heavy_mb>
    8348:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    834c:	e3a02502 	mov	r2, #8388608	; 0x800000
    8350:	e0836006 	add	r6, r3, r6
    8354:	e5862000 	str	r2, [r6]
    8358:	e3a06005 	mov	r6, #5
    835c:	e5942004 	ldr	r2, [r4, #4]
    8360:	e3520000 	cmp	r2, #0
    8364:	03a020e8 	moveq	r2, #232	; 0xe8
    8368:	13a02c02 	movne	r2, #512	; 0x200
    836c:	e0833002 	add	r3, r3, r2
    8370:	e5933000 	ldr	r3, [r3]
    8374:	f57ff04f 	dsb	sy
    8378:	e3130502 	tst	r3, #8388608	; 0x800000
    837c:	e3a0000a 	mov	r0, #10
    8380:	1affff69 	bne	812c <ipu_disable_channel+0x494>
    8384:	ebfffffe 	bl	0 <msleep>
    8388:	e2566001 	subs	r6, r6, #1
    838c:	0a000100 	beq	8794 <ipu_disable_channel+0xafc>
    8390:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    8394:	eafffff0 	b	835c <ipu_disable_channel+0x6c4>
    8398:	e593900c 	ldr	r9, [r3, #12]
    839c:	f57ff04f 	dsb	sy
    83a0:	e59d3018 	ldr	r3, [sp, #24]
    83a4:	e353003f 	cmp	r3, #63	; 0x3f
    83a8:	1203301f 	andne	r3, r3, #31
    83ac:	11c9931b 	bicne	r9, r9, fp, lsl r3
    83b0:	f57ff04e 	dsb	st
    83b4:	ebfffffe 	bl	0 <arm_heavy_mb>
    83b8:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    83bc:	e583900c 	str	r9, [r3, #12]
    83c0:	e5943004 	ldr	r3, [r4, #4]
    83c4:	e3530000 	cmp	r3, #0
    83c8:	12866f8e 	addne	r6, r6, #568	; 0x238
    83cc:	02866e12 	addeq	r6, r6, #288	; 0x120
    83d0:	f57ff04e 	dsb	st
    83d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    83d8:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    83dc:	e0836006 	add	r6, r3, r6
    83e0:	e5868000 	str	r8, [r6]
    83e4:	e30f37ff 	movw	r3, #63487	; 0xf7ff
    83e8:	e3403a6f 	movt	r3, #2671	; 0xa6f
    83ec:	e15a0003 	cmp	sl, r3
    83f0:	1affff05 	bne	800c <ipu_disable_channel+0x374>
    83f4:	e1dd37f6 	ldrsh	r3, [sp, #118]	; 0x76
    83f8:	e1a0100a 	mov	r1, sl
    83fc:	e1dd27f4 	ldrsh	r2, [sp, #116]	; 0x74
    8400:	e1a00004 	mov	r0, r4
    8404:	ebfffffe 	bl	bdf8 <_ipu_disp_set_window_pos>
    8408:	eafffeff 	b	800c <ipu_disable_channel+0x374>
    840c:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8410:	e5933008 	ldr	r3, [r3, #8]
    8414:	f57ff04f 	dsb	sy
    8418:	eaffff43 	b	812c <ipu_disable_channel+0x494>
    841c:	e30f2fd5 	movw	r2, #65493	; 0xffd5
    8420:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    8424:	e34124ff 	movt	r2, #5375	; 0x14ff
    8428:	e34133ff 	movt	r3, #5119	; 0x13ff
    842c:	e15a0002 	cmp	sl, r2
    8430:	115a0003 	cmpne	sl, r3
    8434:	0afffe6b 	beq	7de8 <ipu_disable_channel+0x150>
    8438:	e59d7018 	ldr	r7, [sp, #24]
    843c:	e300b000 	movw	fp, #0
    8440:	e59d6010 	ldr	r6, [sp, #16]
    8444:	e340b000 	movt	fp, #0
    8448:	e59d3014 	ldr	r3, [sp, #20]
    844c:	e59d8020 	ldr	r8, [sp, #32]
    8450:	e1a022a7 	lsr	r2, r7, #5
    8454:	e59dc030 	ldr	ip, [sp, #48]	; 0x30
    8458:	e1a002a6 	lsr	r0, r6, #5
    845c:	e356003f 	cmp	r6, #63	; 0x3f
    8460:	e2822010 	add	r2, r2, #16
    8464:	e1a012a3 	lsr	r1, r3, #5
    8468:	e1a02102 	lsl	r2, r2, #2
    846c:	e58d005c 	str	r0, [sp, #92]	; 0x5c
    8470:	e1a032a8 	lsr	r3, r8, #5
    8474:	e2800010 	add	r0, r0, #16
    8478:	e1a00100 	lsl	r0, r0, #2
    847c:	e2811010 	add	r1, r1, #16
    8480:	e58d2054 	str	r2, [sp, #84]	; 0x54
    8484:	e2833010 	add	r3, r3, #16
    8488:	e1a09101 	lsl	r9, r1, #2
    848c:	e1a03103 	lsl	r3, r3, #2
    8490:	e58d0028 	str	r0, [sp, #40]	; 0x28
    8494:	e207201f 	and	r2, r7, #31
    8498:	e28070c0 	add	r7, r0, #192	; 0xc0
    849c:	e59d0054 	ldr	r0, [sp, #84]	; 0x54
    84a0:	e20ce01f 	and	lr, ip, #31
    84a4:	e58d304c 	str	r3, [sp, #76]	; 0x4c
    84a8:	e3a0c001 	mov	ip, #1
    84ac:	e58d702c 	str	r7, [sp, #44]	; 0x2c
    84b0:	e28970c0 	add	r7, r9, #192	; 0xc0
    84b4:	e58d7040 	str	r7, [sp, #64]	; 0x40
    84b8:	e28070c0 	add	r7, r0, #192	; 0xc0
    84bc:	e59d004c 	ldr	r0, [sp, #76]	; 0x4c
    84c0:	e1a0ee1c 	lsl	lr, ip, lr
    84c4:	e20a101f 	and	r1, sl, #31
    84c8:	e1a0221c 	lsl	r2, ip, r2
    84cc:	e208301f 	and	r3, r8, #31
    84d0:	e1a0111c 	lsl	r1, ip, r1
    84d4:	e28000c0 	add	r0, r0, #192	; 0xc0
    84d8:	e1a0331c 	lsl	r3, ip, r3
    84dc:	e30c6498 	movw	r6, #50328	; 0xc498
    84e0:	e58d0050 	str	r0, [sp, #80]	; 0x50
    84e4:	e3406020 	movt	r6, #32
    84e8:	11a0000e 	movne	r0, lr
    84ec:	03a00000 	moveq	r0, #0
    84f0:	e58d903c 	str	r9, [sp, #60]	; 0x3c
    84f4:	e58de044 	str	lr, [sp, #68]	; 0x44
    84f8:	e58d7058 	str	r7, [sp, #88]	; 0x58
    84fc:	e58d0064 	str	r0, [sp, #100]	; 0x64
    8500:	e58d1048 	str	r1, [sp, #72]	; 0x48
    8504:	e58d2068 	str	r2, [sp, #104]	; 0x68
    8508:	e58d3060 	str	r3, [sp, #96]	; 0x60
    850c:	e58d600c 	str	r6, [sp, #12]
    8510:	e58da06c 	str	sl, [sp, #108]	; 0x6c
    8514:	e5942004 	ldr	r2, [r4, #4]
    8518:	e59d002c 	ldr	r0, [sp, #44]	; 0x2c
    851c:	e59d1028 	ldr	r1, [sp, #40]	; 0x28
    8520:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8524:	e3520000 	cmp	r2, #0
    8528:	11a01000 	movne	r1, r0
    852c:	e0833001 	add	r3, r3, r1
    8530:	e5933000 	ldr	r3, [r3]
    8534:	f57ff04f 	dsb	sy
    8538:	e59d2010 	ldr	r2, [sp, #16]
    853c:	e352003f 	cmp	r2, #63	; 0x3f
    8540:	0a000098 	beq	87a8 <ipu_disable_channel+0xb10>
    8544:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    8548:	e1130002 	tst	r3, r2
    854c:	159d1044 	ldrne	r1, [sp, #68]	; 0x44
    8550:	0a000094 	beq	87a8 <ipu_disable_channel+0xb10>
    8554:	e5942004 	ldr	r2, [r4, #4]
    8558:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    855c:	e59d003c 	ldr	r0, [sp, #60]	; 0x3c
    8560:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8564:	e3520000 	cmp	r2, #0
    8568:	11a0000c 	movne	r0, ip
    856c:	e0833000 	add	r3, r3, r0
    8570:	e5933000 	ldr	r3, [r3]
    8574:	f57ff04f 	dsb	sy
    8578:	e59d2014 	ldr	r2, [sp, #20]
    857c:	e352003f 	cmp	r2, #63	; 0x3f
    8580:	03e07000 	mvneq	r7, #0
    8584:	0a000003 	beq	8598 <ipu_disable_channel+0x900>
    8588:	e59d0048 	ldr	r0, [sp, #72]	; 0x48
    858c:	e1130000 	tst	r3, r0
    8590:	11a07002 	movne	r7, r2
    8594:	03e07000 	mvneq	r7, #0
    8598:	e59d0004 	ldr	r0, [sp, #4]
    859c:	e3012d9e 	movw	r2, #7582	; 0x1d9e
    85a0:	e5943004 	ldr	r3, [r4, #4]
    85a4:	e7d02002 	ldrb	r2, [r0, r2]
    85a8:	e3520000 	cmp	r2, #0
    85ac:	0a00000f 	beq	85f0 <ipu_disable_channel+0x958>
    85b0:	e59dc054 	ldr	ip, [sp, #84]	; 0x54
    85b4:	e3530000 	cmp	r3, #0
    85b8:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    85bc:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    85c0:	01a0000c 	moveq	r0, ip
    85c4:	e0823000 	add	r3, r2, r0
    85c8:	e5932000 	ldr	r2, [r3]
    85cc:	f57ff04f 	dsb	sy
    85d0:	e59d3018 	ldr	r3, [sp, #24]
    85d4:	e353003f 	cmp	r3, #63	; 0x3f
    85d8:	e5943004 	ldr	r3, [r4, #4]
    85dc:	0a000003 	beq	85f0 <ipu_disable_channel+0x958>
    85e0:	e59d0068 	ldr	r0, [sp, #104]	; 0x68
    85e4:	e1120000 	tst	r2, r0
    85e8:	e59d2018 	ldr	r2, [sp, #24]
    85ec:	11a07002 	movne	r7, r2
    85f0:	e59d0004 	ldr	r0, [sp, #4]
    85f4:	e3012dbe 	movw	r2, #7614	; 0x1dbe
    85f8:	e7d02002 	ldrb	r2, [r0, r2]
    85fc:	e3520000 	cmp	r2, #0
    8600:	0a00000f 	beq	8644 <ipu_disable_channel+0x9ac>
    8604:	e59dc04c 	ldr	ip, [sp, #76]	; 0x4c
    8608:	e3530000 	cmp	r3, #0
    860c:	e59d0050 	ldr	r0, [sp, #80]	; 0x50
    8610:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    8614:	01a0000c 	moveq	r0, ip
    8618:	e0823000 	add	r3, r2, r0
    861c:	e5932000 	ldr	r2, [r3]
    8620:	f57ff04f 	dsb	sy
    8624:	e59d3020 	ldr	r3, [sp, #32]
    8628:	e353003f 	cmp	r3, #63	; 0x3f
    862c:	e5943004 	ldr	r3, [r4, #4]
    8630:	0a000003 	beq	8644 <ipu_disable_channel+0x9ac>
    8634:	e59d0060 	ldr	r0, [sp, #96]	; 0x60
    8638:	e1120000 	tst	r2, r0
    863c:	e59d2020 	ldr	r2, [sp, #32]
    8640:	11a07002 	movne	r7, r2
    8644:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    8648:	e3530000 	cmp	r3, #0
    864c:	e59d0028 	ldr	r0, [sp, #40]	; 0x28
    8650:	e5952d4c 	ldr	r2, [r5, #3404]	; 0xd4c
    8654:	11a0000c 	movne	r0, ip
    8658:	e0823000 	add	r3, r2, r0
    865c:	e5933000 	ldr	r3, [r3]
    8660:	f57ff04f 	dsb	sy
    8664:	e1130001 	tst	r3, r1
    8668:	1a00005f 	bne	87ec <ipu_disable_channel+0xb54>
    866c:	e3770001 	cmn	r7, #1
    8670:	0a00009f 	beq	88f4 <ipu_disable_channel+0xc5c>
    8674:	e1a082a7 	lsr	r8, r7, #5
    8678:	e2889010 	add	r9, r8, #16
    867c:	e1a09109 	lsl	r9, r9, #2
    8680:	e28930c0 	add	r3, r9, #192	; 0xc0
    8684:	e58d3008 	str	r3, [sp, #8]
    8688:	e5942004 	ldr	r2, [r4, #4]
    868c:	e207301f 	and	r3, r7, #31
    8690:	e1a08108 	lsl	r8, r8, #2
    8694:	e3a06001 	mov	r6, #1
    8698:	e1a06316 	lsl	r6, r6, r3
    869c:	e3520000 	cmp	r2, #0
    86a0:	03a030e8 	moveq	r3, #232	; 0xe8
    86a4:	13a03c02 	movne	r3, #512	; 0x200
    86a8:	e088a003 	add	sl, r8, r3
    86ac:	f57ff04e 	dsb	st
    86b0:	ebfffffe 	bl	0 <arm_heavy_mb>
    86b4:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    86b8:	e082300a 	add	r3, r2, sl
    86bc:	e5836000 	str	r6, [r3]
    86c0:	e59f02a0 	ldr	r0, [pc, #672]	; 8968 <ipu_disable_channel+0xcd0>
    86c4:	e1d030b0 	ldrh	r3, [r0]
    86c8:	e3130004 	tst	r3, #4
    86cc:	1a000076 	bne	88ac <ipu_disable_channel+0xc14>
    86d0:	e1a0300b 	mov	r3, fp
    86d4:	e30ca350 	movw	sl, #50000	; 0xc350
    86d8:	e1a0b004 	mov	fp, r4
    86dc:	e1a00002 	mov	r0, r2
    86e0:	e1a04009 	mov	r4, r9
    86e4:	e1a09003 	mov	r9, r3
    86e8:	ea000006 	b	8708 <ipu_disable_channel+0xa70>
    86ec:	e1160003 	tst	r6, r3
    86f0:	0a000019 	beq	875c <ipu_disable_channel+0xac4>
    86f4:	e5993004 	ldr	r3, [r9, #4]
    86f8:	e12fff33 	blx	r3
    86fc:	e25aa00a 	subs	sl, sl, #10
    8700:	0a000071 	beq	88cc <ipu_disable_channel+0xc34>
    8704:	e5950d48 	ldr	r0, [r5, #3400]	; 0xd48
    8708:	e59b3004 	ldr	r3, [fp, #4]
    870c:	e3530000 	cmp	r3, #0
    8710:	03a030e8 	moveq	r3, #232	; 0xe8
    8714:	13a03c02 	movne	r3, #512	; 0x200
    8718:	e0883003 	add	r3, r8, r3
    871c:	e0803003 	add	r3, r0, r3
    8720:	e5933000 	ldr	r3, [r3]
    8724:	f57ff04f 	dsb	sy
    8728:	e1160003 	tst	r6, r3
    872c:	1a00000a 	bne	875c <ipu_disable_channel+0xac4>
    8730:	e59b0004 	ldr	r0, [fp, #4]
    8734:	e59d2008 	ldr	r2, [sp, #8]
    8738:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    873c:	e3500000 	cmp	r0, #0
    8740:	01a02004 	moveq	r2, r4
    8744:	e0833002 	add	r3, r3, r2
    8748:	e5933000 	ldr	r3, [r3]
    874c:	f57ff04f 	dsb	sy
    8750:	e357003f 	cmp	r7, #63	; 0x3f
    8754:	e59d000c 	ldr	r0, [sp, #12]
    8758:	1affffe3 	bne	86ec <ipu_disable_channel+0xa54>
    875c:	e1a0400b 	mov	r4, fp
    8760:	e1a0b009 	mov	fp, r9
    8764:	e59f0200 	ldr	r0, [pc, #512]	; 896c <ipu_disable_channel+0xcd4>
    8768:	e1d020b0 	ldrh	r2, [r0]
    876c:	e3120004 	tst	r2, #4
    8770:	0affff67 	beq	8514 <ipu_disable_channel+0x87c>
    8774:	e26a3cc3 	rsb	r3, sl, #49920	; 0xc300
    8778:	e3002000 	movw	r2, #0
    877c:	e2833050 	add	r3, r3, #80	; 0x50
    8780:	e2400012 	sub	r0, r0, #18
    8784:	e3402000 	movt	r2, #0
    8788:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    878c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8790:	eaffff5f 	b	8514 <ipu_disable_channel+0x87c>
    8794:	e3001000 	movw	r1, #0
    8798:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    879c:	e3401000 	movt	r1, #0
    87a0:	ebfffffe 	bl	0 <dev_err>
    87a4:	eafffe60 	b	812c <ipu_disable_channel+0x494>
    87a8:	e5942004 	ldr	r2, [r4, #4]
    87ac:	e59d0040 	ldr	r0, [sp, #64]	; 0x40
    87b0:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    87b4:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    87b8:	e3520000 	cmp	r2, #0
    87bc:	11a01000 	movne	r1, r0
    87c0:	e0833001 	add	r3, r3, r1
    87c4:	e5933000 	ldr	r3, [r3]
    87c8:	f57ff04f 	dsb	sy
    87cc:	e59d2014 	ldr	r2, [sp, #20]
    87d0:	e352003f 	cmp	r2, #63	; 0x3f
    87d4:	0a00000a 	beq	8804 <ipu_disable_channel+0xb6c>
    87d8:	e59d2048 	ldr	r2, [sp, #72]	; 0x48
    87dc:	e1130002 	tst	r3, r2
    87e0:	0a000007 	beq	8804 <ipu_disable_channel+0xb6c>
    87e4:	e59d1064 	ldr	r1, [sp, #100]	; 0x64
    87e8:	eaffff59 	b	8554 <ipu_disable_channel+0x8bc>
    87ec:	e59d302c 	ldr	r3, [sp, #44]	; 0x2c
    87f0:	e59d9028 	ldr	r9, [sp, #40]	; 0x28
    87f4:	e59d805c 	ldr	r8, [sp, #92]	; 0x5c
    87f8:	e58d3008 	str	r3, [sp, #8]
    87fc:	e59d7010 	ldr	r7, [sp, #16]
    8800:	eaffffa0 	b	8688 <ipu_disable_channel+0x9f0>
    8804:	e59d2004 	ldr	r2, [sp, #4]
    8808:	e3013d9e 	movw	r3, #7582	; 0x1d9e
    880c:	e7d23003 	ldrb	r3, [r2, r3]
    8810:	e3530000 	cmp	r3, #0
    8814:	0a00000e 	beq	8854 <ipu_disable_channel+0xbbc>
    8818:	e5942004 	ldr	r2, [r4, #4]
    881c:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    8820:	e59d1054 	ldr	r1, [sp, #84]	; 0x54
    8824:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8828:	e3520000 	cmp	r2, #0
    882c:	11a01000 	movne	r1, r0
    8830:	e0833001 	add	r3, r3, r1
    8834:	e5933000 	ldr	r3, [r3]
    8838:	f57ff04f 	dsb	sy
    883c:	e59d2018 	ldr	r2, [sp, #24]
    8840:	e352003f 	cmp	r2, #63	; 0x3f
    8844:	0a000002 	beq	8854 <ipu_disable_channel+0xbbc>
    8848:	e59d2068 	ldr	r2, [sp, #104]	; 0x68
    884c:	e1130002 	tst	r3, r2
    8850:	1affffe3 	bne	87e4 <ipu_disable_channel+0xb4c>
    8854:	e59d2004 	ldr	r2, [sp, #4]
    8858:	e3013dbe 	movw	r3, #7614	; 0x1dbe
    885c:	e7d23003 	ldrb	r3, [r2, r3]
    8860:	e3530000 	cmp	r3, #0
    8864:	0a00000e 	beq	88a4 <ipu_disable_channel+0xc0c>
    8868:	e5942004 	ldr	r2, [r4, #4]
    886c:	e59d0050 	ldr	r0, [sp, #80]	; 0x50
    8870:	e59d104c 	ldr	r1, [sp, #76]	; 0x4c
    8874:	e5953d4c 	ldr	r3, [r5, #3404]	; 0xd4c
    8878:	e3520000 	cmp	r2, #0
    887c:	11a01000 	movne	r1, r0
    8880:	e0833001 	add	r3, r3, r1
    8884:	e5933000 	ldr	r3, [r3]
    8888:	f57ff04f 	dsb	sy
    888c:	e59d2020 	ldr	r2, [sp, #32]
    8890:	e352003f 	cmp	r2, #63	; 0x3f
    8894:	0a000002 	beq	88a4 <ipu_disable_channel+0xc0c>
    8898:	e59d2060 	ldr	r2, [sp, #96]	; 0x60
    889c:	e1130002 	tst	r3, r2
    88a0:	1affffcf 	bne	87e4 <ipu_disable_channel+0xb4c>
    88a4:	e59da06c 	ldr	sl, [sp, #108]	; 0x6c
    88a8:	eafffd4e 	b	7de8 <ipu_disable_channel+0x150>
    88ac:	e3002000 	movw	r2, #0
    88b0:	e2400012 	sub	r0, r0, #18
    88b4:	e3402000 	movt	r2, #0
    88b8:	e1a03007 	mov	r3, r7
    88bc:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    88c0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    88c4:	e5952d48 	ldr	r2, [r5, #3400]	; 0xd48
    88c8:	eaffff80 	b	86d0 <ipu_disable_channel+0xa38>
    88cc:	e1a0400b 	mov	r4, fp
    88d0:	e1a0b009 	mov	fp, r9
    88d4:	e1a00004 	mov	r0, r4
    88d8:	ebfffffe 	bl	7468 <ipu_dump_registers>
    88dc:	e3001000 	movw	r1, #0
    88e0:	e1a02007 	mov	r2, r7
    88e4:	e5950d84 	ldr	r0, [r5, #3460]	; 0xd84
    88e8:	e3401000 	movt	r1, #0
    88ec:	ebfffffe 	bl	0 <dev_err>
    88f0:	eaffff9b 	b	8764 <ipu_disable_channel+0xacc>
    88f4:	e3003000 	movw	r3, #0
    88f8:	e300271a 	movw	r2, #1818	; 0x71a
    88fc:	e3403000 	movt	r3, #0
    8900:	e59da06c 	ldr	sl, [sp, #108]	; 0x6c
    8904:	e19330b2 	ldrh	r3, [r3, r2]
    8908:	e3130004 	tst	r3, #4
    890c:	0afffd35 	beq	7de8 <ipu_disable_channel+0x150>
    8910:	e3002000 	movw	r2, #0
    8914:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    8918:	e3402000 	movt	r2, #0
    891c:	e59f004c 	ldr	r0, [pc, #76]	; 8970 <ipu_disable_channel+0xcd8>
    8920:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8924:	eafffd2f 	b	7de8 <ipu_disable_channel+0x150>
    8928:	e3000000 	movw	r0, #0
    892c:	e3002702 	movw	r2, #1794	; 0x702
    8930:	e3400000 	movt	r0, #0
    8934:	e19020b2 	ldrh	r2, [r0, r2]
    8938:	e3120004 	tst	r2, #4
    893c:	1a000003 	bne	8950 <ipu_disable_channel+0xcb8>
    8940:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    8944:	ebfffffe 	bl	0 <mutex_unlock>
    8948:	e3e0000c 	mvn	r0, #12
    894c:	eafffdee 	b	810c <ipu_disable_channel+0x474>
    8950:	e3002000 	movw	r2, #0
    8954:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    8958:	e2800e6f 	add	r0, r0, #1776	; 0x6f0
    895c:	e3402000 	movt	r2, #0
    8960:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8964:	eafffff5 	b	8940 <ipu_disable_channel+0xca8>
    8968:	00000732 	andeq	r0, r0, r2, lsr r7
    896c:	0000074a 	andeq	r0, r0, sl, asr #14
    8970:	00000708 	andeq	r0, r0, r8, lsl #14

00008974 <ipu_swap_channel>:
    8974:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8978:	e2807d79 	add	r7, r0, #7744	; 0x1e40
    897c:	e1a0b922 	lsr	fp, r2, #18
    8980:	e2877008 	add	r7, r7, #8
    8984:	e24dd00c 	sub	sp, sp, #12
    8988:	e1a05000 	mov	r5, r0
    898c:	e1a0a002 	mov	sl, r2
    8990:	e1a00007 	mov	r0, r7
    8994:	e20b203f 	and	r2, fp, #63	; 0x3f
    8998:	e1a06001 	mov	r6, r1
    899c:	e58d2004 	str	r2, [sp, #4]
    89a0:	ebfffffe 	bl	0 <mutex_lock>
    89a4:	e59d2004 	ldr	r2, [sp, #4]
    89a8:	e2858a01 	add	r8, r5, #4096	; 0x1000
    89ac:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    89b0:	e7e54956 	ubfx	r4, r6, #18, #6
    89b4:	e1a092c2 	asr	r9, r2, #5
    89b8:	e2899001 	add	r9, r9, #1
    89bc:	e1a09109 	lsl	r9, r9, #2
    89c0:	e0833009 	add	r3, r3, r9
    89c4:	e5931000 	ldr	r1, [r3]
    89c8:	f57ff04f 	dsb	sy
    89cc:	e352003f 	cmp	r2, #63	; 0x3f
    89d0:	120bb01f 	andne	fp, fp, #31
    89d4:	13a03001 	movne	r3, #1
    89d8:	11811b13 	orrne	r1, r1, r3, lsl fp
    89dc:	e58d1004 	str	r1, [sp, #4]
    89e0:	f57ff04e 	dsb	st
    89e4:	ebfffffe 	bl	0 <arm_heavy_mb>
    89e8:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    89ec:	e59d1004 	ldr	r1, [sp, #4]
    89f0:	e0839009 	add	r9, r3, r9
    89f4:	e5891000 	str	r1, [r9]
    89f8:	e5982e18 	ldr	r2, [r8, #3608]	; 0xe18
    89fc:	e1a03c4a 	asr	r3, sl, #24
    8a00:	e3a0a001 	mov	sl, #1
    8a04:	e1a092c4 	asr	r9, r4, #5
    8a08:	e1a01006 	mov	r1, r6
    8a0c:	e1a00005 	mov	r0, r5
    8a10:	e089900a 	add	r9, r9, sl
    8a14:	e182331a 	orr	r3, r2, sl, lsl r3
    8a18:	e1a0200a 	mov	r2, sl
    8a1c:	e1a09109 	lsl	r9, r9, #2
    8a20:	e5883e18 	str	r3, [r8, #3608]	; 0xe18
    8a24:	ebfffffe 	bl	bde4 <_ipu_dp_dc_disable>
    8a28:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    8a2c:	e0833009 	add	r3, r3, r9
    8a30:	e593b000 	ldr	fp, [r3]
    8a34:	f57ff04f 	dsb	sy
    8a38:	e354003f 	cmp	r4, #63	; 0x3f
    8a3c:	1204301f 	andne	r3, r4, #31
    8a40:	11cbb31a 	bicne	fp, fp, sl, lsl r3
    8a44:	f57ff04e 	dsb	st
    8a48:	ebfffffe 	bl	0 <arm_heavy_mb>
    8a4c:	e5983d4c 	ldr	r3, [r8, #3404]	; 0xd4c
    8a50:	e0833009 	add	r3, r3, r9
    8a54:	e583b000 	str	fp, [r3]
    8a58:	e354003f 	cmp	r4, #63	; 0x3f
    8a5c:	1204301f 	andne	r3, r4, #31
    8a60:	13a0a001 	movne	sl, #1
    8a64:	11a0a31a 	lslne	sl, sl, r3
    8a68:	e5953004 	ldr	r3, [r5, #4]
    8a6c:	03a0a000 	moveq	sl, #0
    8a70:	e3530000 	cmp	r3, #0
    8a74:	12899f8e 	addne	r9, r9, #568	; 0x238
    8a78:	02899e12 	addeq	r9, r9, #288	; 0x120
    8a7c:	f57ff04e 	dsb	st
    8a80:	ebfffffe 	bl	0 <arm_heavy_mb>
    8a84:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    8a88:	e0839009 	add	r9, r3, r9
    8a8c:	e589a000 	str	sl, [r9]
    8a90:	e5952004 	ldr	r2, [r5, #4]
    8a94:	e1a04084 	lsl	r4, r4, #1
    8a98:	e3a09003 	mov	r9, #3
    8a9c:	e204301e 	and	r3, r4, #30
    8aa0:	e3520000 	cmp	r2, #0
    8aa4:	e1a09319 	lsl	r9, r9, r3
    8aa8:	11a042c4 	asrne	r4, r4, #5
    8aac:	03a04f4b 	moveq	r4, #300	; 0x12c
    8ab0:	12844096 	addne	r4, r4, #150	; 0x96
    8ab4:	11a04104 	lslne	r4, r4, #2
    8ab8:	f57ff04e 	dsb	st
    8abc:	ebfffffe 	bl	0 <arm_heavy_mb>
    8ac0:	e5983d48 	ldr	r3, [r8, #3400]	; 0xd48
    8ac4:	e0834004 	add	r4, r3, r4
    8ac8:	e5849000 	str	r9, [r4]
    8acc:	e5983e18 	ldr	r3, [r8, #3608]	; 0xe18
    8ad0:	e1a02c46 	asr	r2, r6, #24
    8ad4:	e3a09001 	mov	r9, #1
    8ad8:	e2854d79 	add	r4, r5, #7744	; 0x1e40
    8adc:	e2844020 	add	r4, r4, #32
    8ae0:	e1c33219 	bic	r3, r3, r9, lsl r2
    8ae4:	e1a00004 	mov	r0, r4
    8ae8:	e5883e18 	str	r3, [r8, #3608]	; 0xe18
    8aec:	ebfffffe 	bl	0 <_raw_spin_lock_irqsave>
    8af0:	e1a01006 	mov	r1, r6
    8af4:	e1a08000 	mov	r8, r0
    8af8:	e3a03000 	mov	r3, #0
    8afc:	e1a00005 	mov	r0, r5
    8b00:	e3a02003 	mov	r2, #3
    8b04:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8b08:	e1a03009 	mov	r3, r9
    8b0c:	e1a01006 	mov	r1, r6
    8b10:	e1a00005 	mov	r0, r5
    8b14:	e3a02003 	mov	r2, #3
    8b18:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8b1c:	e3a03002 	mov	r3, #2
    8b20:	e3a02003 	mov	r2, #3
    8b24:	e1a01006 	mov	r1, r6
    8b28:	e1a00005 	mov	r0, r5
    8b2c:	ebfffffe 	bl	7b78 <_ipu_clear_buffer_ready>
    8b30:	e1a01008 	mov	r1, r8
    8b34:	e1a00004 	mov	r0, r4
    8b38:	ebfffffe 	bl	0 <_raw_spin_unlock_irqrestore>
    8b3c:	e1a00007 	mov	r0, r7
    8b40:	ebfffffe 	bl	0 <mutex_unlock>
    8b44:	e3a00000 	mov	r0, #0
    8b48:	e28dd00c 	add	sp, sp, #12
    8b4c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

00008b50 <_ipu_channel_status>:
    8b50:	e5902004 	ldr	r2, [r0, #4]
    8b54:	e2800a01 	add	r0, r0, #4096	; 0x1000
    8b58:	e5903d48 	ldr	r3, [r0, #3400]	; 0xd48
    8b5c:	e3520000 	cmp	r2, #0
    8b60:	13a02e25 	movne	r2, #592	; 0x250
    8b64:	03a02f4e 	moveq	r2, #312	; 0x138
    8b68:	e0833002 	add	r3, r3, r2
    8b6c:	e5930000 	ldr	r0, [r3]
    8b70:	f57ff04f 	dsb	sy
    8b74:	e30e3454 	movw	r3, #58452	; 0xe454
    8b78:	e3403430 	movt	r3, #1072	; 0x430
    8b7c:	e1510003 	cmp	r1, r3
    8b80:	0a000024 	beq	8c18 <_ipu_channel_status+0xc8>
    8b84:	da00000d 	ble	8bc0 <_ipu_channel_status+0x70>
    8b88:	e30f3496 	movw	r3, #62614	; 0xf496
    8b8c:	e340362c 	movt	r3, #1580	; 0x62c
    8b90:	e1510003 	cmp	r1, r3
    8b94:	0a00001b 	beq	8c08 <_ipu_channel_status+0xb8>
    8b98:	e30e3455 	movw	r3, #58453	; 0xe455
    8b9c:	e3413624 	movt	r3, #5668	; 0x1624
    8ba0:	e1510003 	cmp	r1, r3
    8ba4:	0a000013 	beq	8bf8 <_ipu_channel_status+0xa8>
    8ba8:	e30e3455 	movw	r3, #58453	; 0xe455
    8bac:	e3403530 	movt	r3, #1328	; 0x530
    8bb0:	e1510003 	cmp	r1, r3
    8bb4:	0a00000f 	beq	8bf8 <_ipu_channel_status+0xa8>
    8bb8:	e3a00000 	mov	r0, #0
    8bbc:	e12fff1e 	bx	lr
    8bc0:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    8bc4:	e34032bb 	movt	r3, #699	; 0x2bb
    8bc8:	e1510003 	cmp	r1, r3
    8bcc:	0a00000f 	beq	8c10 <_ipu_channel_status+0xc0>
    8bd0:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    8bd4:	e34033bf 	movt	r3, #959	; 0x3bf
    8bd8:	e1510003 	cmp	r1, r3
    8bdc:	0a000007 	beq	8c00 <_ipu_channel_status+0xb0>
    8be0:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    8be4:	e34031b7 	movt	r3, #439	; 0x1b7
    8be8:	e1510003 	cmp	r1, r3
    8bec:	1afffff1 	bne	8bb8 <_ipu_channel_status+0x68>
    8bf0:	e7e10350 	ubfx	r0, r0, #6, #2
    8bf4:	e12fff1e 	bx	lr
    8bf8:	e7e10150 	ubfx	r0, r0, #2, #2
    8bfc:	e12fff1e 	bx	lr
    8c00:	e7e10550 	ubfx	r0, r0, #10, #2
    8c04:	e12fff1e 	bx	lr
    8c08:	e7e10250 	ubfx	r0, r0, #4, #2
    8c0c:	e12fff1e 	bx	lr
    8c10:	e7e10450 	ubfx	r0, r0, #8, #2
    8c14:	e12fff1e 	bx	lr
    8c18:	e2000003 	and	r0, r0, #3
    8c1c:	e12fff1e 	bx	lr

00008c20 <ipu_pixel_format_has_alpha>:
    8c20:	e3043742 	movw	r3, #18242	; 0x4742
    8c24:	e3443152 	movt	r3, #16722	; 0x4152
    8c28:	e1500003 	cmp	r0, r3
    8c2c:	0a000009 	beq	8c58 <ipu_pixel_format_has_alpha+0x38>
    8c30:	e3043241 	movw	r3, #16961	; 0x4241
    8c34:	e3453247 	movt	r3, #21063	; 0x5247
    8c38:	e1500003 	cmp	r0, r3
    8c3c:	0a000005 	beq	8c58 <ipu_pixel_format_has_alpha+0x38>
    8c40:	e3043752 	movw	r3, #18258	; 0x4752
    8c44:	e3443142 	movt	r3, #16706	; 0x4142
    8c48:	e1500003 	cmp	r0, r3
    8c4c:	0a000001 	beq	8c58 <ipu_pixel_format_has_alpha+0x38>
    8c50:	e3a00000 	mov	r0, #0
    8c54:	e12fff1e 	bx	lr
    8c58:	e3a00001 	mov	r0, #1
    8c5c:	e12fff1e 	bx	lr

00008c60 <ipu_runtime_suspend>:
    8c60:	e92d4010 	push	{r4, lr}
    8c64:	e1a04000 	mov	r4, r0
    8c68:	e3a00000 	mov	r0, #0
    8c6c:	ebfffffe 	bl	0 <release_bus_freq>
    8c70:	e3000000 	movw	r0, #0
    8c74:	e3003762 	movw	r3, #1890	; 0x762
    8c78:	e3400000 	movt	r0, #0
    8c7c:	e19030b3 	ldrh	r3, [r0, r3]
    8c80:	e3130004 	tst	r3, #4
    8c84:	1a000001 	bne	8c90 <ipu_runtime_suspend+0x30>
    8c88:	e3a00000 	mov	r0, #0
    8c8c:	e8bd8010 	pop	{r4, pc}
    8c90:	e3002000 	movw	r2, #0
    8c94:	e1a01004 	mov	r1, r4
    8c98:	e2800e75 	add	r0, r0, #1872	; 0x750
    8c9c:	e3402000 	movt	r2, #0
    8ca0:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8ca4:	e3a00000 	mov	r0, #0
    8ca8:	e8bd8010 	pop	{r4, pc}

00008cac <ipu_runtime_resume>:
    8cac:	e92d4010 	push	{r4, lr}
    8cb0:	e1a04000 	mov	r4, r0
    8cb4:	e3a00000 	mov	r0, #0
    8cb8:	ebfffffe 	bl	0 <request_bus_freq>
    8cbc:	e3003000 	movw	r3, #0
    8cc0:	e300277a 	movw	r2, #1914	; 0x77a
    8cc4:	e3403000 	movt	r3, #0
    8cc8:	e19330b2 	ldrh	r3, [r3, r2]
    8ccc:	e3130004 	tst	r3, #4
    8cd0:	1a000001 	bne	8cdc <ipu_runtime_resume+0x30>
    8cd4:	e3a00000 	mov	r0, #0
    8cd8:	e8bd8010 	pop	{r4, pc}
    8cdc:	e3002000 	movw	r2, #0
    8ce0:	e1a01004 	mov	r1, r4
    8ce4:	e3402000 	movt	r2, #0
    8ce8:	e59f0008 	ldr	r0, [pc, #8]	; 8cf8 <ipu_runtime_resume+0x4c>
    8cec:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    8cf0:	e3a00000 	mov	r0, #0
    8cf4:	e8bd8010 	pop	{r4, pc}
    8cf8:	00000768 	andeq	r0, r0, r8, ror #14

00008cfc <sw_probe>:
    8cfc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8d00:	e3004000 	movw	r4, #0
    8d04:	e3404000 	movt	r4, #0
    8d08:	e1a01000 	mov	r1, r0
    8d0c:	e3012ee4 	movw	r2, #7908	; 0x1ee4
    8d10:	e1a00004 	mov	r0, r4
    8d14:	ebfffffe 	bl	0 <memcpy>
    8d18:	e3a00509 	mov	r0, #37748736	; 0x2400000
    8d1c:	e59f5130 	ldr	r5, [pc, #304]	; 8e54 <sw_probe+0x158>
    8d20:	ebfffffe 	bl	0 <get_device_base>
    8d24:	e3003000 	movw	r3, #0
    8d28:	e1a0c000 	mov	ip, r0
    8d2c:	e3403000 	movt	r3, #0
    8d30:	e2842a01 	add	r2, r4, #4096	; 0x1000
    8d34:	e593600c 	ldr	r6, [r3, #12]
    8d38:	e2850014 	add	r0, r5, #20
    8d3c:	e593e008 	ldr	lr, [r3, #8]
    8d40:	e3a01004 	mov	r1, #4
    8d44:	e5937004 	ldr	r7, [r3, #4]
    8d48:	e086600c 	add	r6, r6, ip
    8d4c:	e08ee00c 	add	lr, lr, ip
    8d50:	e5826d54 	str	r6, [r2, #3412]	; 0xd54
    8d54:	e582ed4c 	str	lr, [r2, #3404]	; 0xd4c
    8d58:	e087700c 	add	r7, r7, ip
    8d5c:	e5936024 	ldr	r6, [r3, #36]	; 0x24
    8d60:	e593e028 	ldr	lr, [r3, #40]	; 0x28
    8d64:	e5827d48 	str	r7, [r2, #3400]	; 0xd48
    8d68:	e086600c 	add	r6, r6, ip
    8d6c:	e5937034 	ldr	r7, [r3, #52]	; 0x34
    8d70:	e08ee00c 	add	lr, lr, ip
    8d74:	e5826d58 	str	r6, [r2, #3416]	; 0xd58
    8d78:	e582ed60 	str	lr, [r2, #3424]	; 0xd60
    8d7c:	e593601c 	ldr	r6, [r3, #28]
    8d80:	e087700c 	add	r7, r7, ip
    8d84:	e593e020 	ldr	lr, [r3, #32]
    8d88:	e5827d50 	str	r7, [r2, #3408]	; 0xd50
    8d8c:	e086600c 	add	r6, r6, ip
    8d90:	e5937018 	ldr	r7, [r3, #24]
    8d94:	e08ee00c 	add	lr, lr, ip
    8d98:	e5826d68 	str	r6, [r2, #3432]	; 0xd68
    8d9c:	e582ed6c 	str	lr, [r2, #3436]	; 0xd6c
    8da0:	e5936014 	ldr	r6, [r3, #20]
    8da4:	e087700c 	add	r7, r7, ip
    8da8:	e593e030 	ldr	lr, [r3, #48]	; 0x30
    8dac:	e5827d64 	str	r7, [r2, #3428]	; 0xd64
    8db0:	e086600c 	add	r6, r6, ip
    8db4:	e5937010 	ldr	r7, [r3, #16]
    8db8:	e08ee00c 	add	lr, lr, ip
    8dbc:	e5826d74 	str	r6, [r2, #3444]	; 0xd74
    8dc0:	e582ed78 	str	lr, [r2, #3448]	; 0xd78
    8dc4:	e5936038 	ldr	r6, [r3, #56]	; 0x38
    8dc8:	e087700c 	add	r7, r7, ip
    8dcc:	e593e03c 	ldr	lr, [r3, #60]	; 0x3c
    8dd0:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
    8dd4:	e086600c 	add	r6, r6, ip
    8dd8:	e5827d70 	str	r7, [r2, #3440]	; 0xd70
    8ddc:	e08ee00c 	add	lr, lr, ip
    8de0:	e5826d7c 	str	r6, [r2, #3452]	; 0xd7c
    8de4:	e083c00c 	add	ip, r3, ip
    8de8:	e582ed5c 	str	lr, [r2, #3420]	; 0xd5c
    8dec:	e582cd80 	str	ip, [r2, #3456]	; 0xd80
    8df0:	ebfffffe 	bl	0 <__memzero>
    8df4:	e2850018 	add	r0, r5, #24
    8df8:	e3a01004 	mov	r1, #4
    8dfc:	ebfffffe 	bl	0 <__memzero>
    8e00:	e1a00005 	mov	r0, r5
    8e04:	e3a01014 	mov	r1, #20
    8e08:	ebfffffe 	bl	0 <__memzero>
    8e0c:	e3002000 	movw	r2, #0
    8e10:	e3001000 	movw	r1, #0
    8e14:	e1a00005 	mov	r0, r5
    8e18:	e3402000 	movt	r2, #0
    8e1c:	e3401000 	movt	r1, #0
    8e20:	ebfffffe 	bl	0 <__mutex_init>
    8e24:	e3001000 	movw	r1, #0
    8e28:	e1a02004 	mov	r2, r4
    8e2c:	e3401000 	movt	r1, #0
    8e30:	e3a00025 	mov	r0, #37	; 0x25
    8e34:	ebfffffe 	bl	0 <ldr_sw_irq_register>
    8e38:	e3001000 	movw	r1, #0
    8e3c:	e1a02004 	mov	r2, r4
    8e40:	e3401000 	movt	r1, #0
    8e44:	e3a00026 	mov	r0, #38	; 0x26
    8e48:	ebfffffe 	bl	0 <ldr_sw_irq_register>
    8e4c:	e3a00000 	mov	r0, #0
    8e50:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    8e54:	00003d30 	andeq	r3, r0, r0, lsr sp

00008e58 <sw_ipu_init_channel>:
    8e58:	e1a03000 	mov	r3, r0
    8e5c:	e3000000 	movw	r0, #0
    8e60:	e2832004 	add	r2, r3, #4
    8e64:	e5931000 	ldr	r1, [r3]
    8e68:	e3400000 	movt	r0, #0
    8e6c:	eafffffe 	b	61e0 <ipu_init_channel>

00008e70 <sw_ipu_uninit_channel>:
    8e70:	e92d4010 	push	{r4, lr}
    8e74:	e5901000 	ldr	r1, [r0]
    8e78:	e3000000 	movw	r0, #0
    8e7c:	e3400000 	movt	r0, #0
    8e80:	ebfffffe 	bl	26a0 <ipu_uninit_channel>
    8e84:	e3a00000 	mov	r0, #0
    8e88:	e8bd8010 	pop	{r4, pc}

00008e8c <sw_ipu_init_channel_buffer>:
    8e8c:	e1a0c000 	mov	ip, r0
    8e90:	e92d4030 	push	{r4, r5, lr}
    8e94:	e59c502c 	ldr	r5, [ip, #44]	; 0x2c
    8e98:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    8e9c:	e3000000 	movw	r0, #0
    8ea0:	e59ce028 	ldr	lr, [ip, #40]	; 0x28
    8ea4:	e3400000 	movt	r0, #0
    8ea8:	e59c3008 	ldr	r3, [ip, #8]
    8eac:	e89c0006 	ldm	ip, {r1, r2}
    8eb0:	e59c4024 	ldr	r4, [ip, #36]	; 0x24
    8eb4:	e58d5020 	str	r5, [sp, #32]
    8eb8:	e58de01c 	str	lr, [sp, #28]
    8ebc:	e59ce020 	ldr	lr, [ip, #32]
    8ec0:	e58d4018 	str	r4, [sp, #24]
    8ec4:	e59c401c 	ldr	r4, [ip, #28]
    8ec8:	e58de014 	str	lr, [sp, #20]
    8ecc:	e59ce018 	ldr	lr, [ip, #24]
    8ed0:	e58d4010 	str	r4, [sp, #16]
    8ed4:	e59c4014 	ldr	r4, [ip, #20]
    8ed8:	e58de00c 	str	lr, [sp, #12]
    8edc:	e1dce1b0 	ldrh	lr, [ip, #16]
    8ee0:	e1dcc0bc 	ldrh	ip, [ip, #12]
    8ee4:	e58d4008 	str	r4, [sp, #8]
    8ee8:	e88d5000 	stm	sp, {ip, lr}
    8eec:	ebfffffe 	bl	3238 <ipu_init_channel_buffer>
    8ef0:	e28dd02c 	add	sp, sp, #44	; 0x2c
    8ef4:	e8bd8030 	pop	{r4, r5, pc}

00008ef8 <sw_ipu_update_channel_buffer>:
    8ef8:	e1a0c000 	mov	ip, r0
    8efc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    8f00:	e59c3008 	ldr	r3, [ip, #8]
    8f04:	e24dd00c 	sub	sp, sp, #12
    8f08:	e3000000 	movw	r0, #0
    8f0c:	e89c0006 	ldm	ip, {r1, r2}
    8f10:	e3400000 	movt	r0, #0
    8f14:	e59cc00c 	ldr	ip, [ip, #12]
    8f18:	e58dc000 	str	ip, [sp]
    8f1c:	ebfffffe 	bl	1a10 <ipu_update_channel_buffer>
    8f20:	e28dd00c 	add	sp, sp, #12
    8f24:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)

00008f28 <sw_ipu_select_buffer>:
    8f28:	e1a01000 	mov	r1, r0
    8f2c:	e3000000 	movw	r0, #0
    8f30:	e5913008 	ldr	r3, [r1, #8]
    8f34:	e3400000 	movt	r0, #0
    8f38:	e8910006 	ldm	r1, {r1, r2}
    8f3c:	eafffffe 	b	175c <ipu_select_buffer>

00008f40 <sw_ipu_enable_channel>:
    8f40:	e5901000 	ldr	r1, [r0]
    8f44:	e3000000 	movw	r0, #0
    8f48:	e3400000 	movt	r0, #0
    8f4c:	eafffffe 	b	5894 <ipu_enable_channel>

00008f50 <sw_ipu_disable_channel>:
    8f50:	e1a03000 	mov	r3, r0
    8f54:	e3000000 	movw	r0, #0
    8f58:	e5d32004 	ldrb	r2, [r3, #4]
    8f5c:	e3400000 	movt	r0, #0
    8f60:	e5931000 	ldr	r1, [r3]
    8f64:	eafffffe 	b	7c98 <ipu_disable_channel>

00008f68 <sw_ipu_enable_csi>:
    8f68:	e5901000 	ldr	r1, [r0]
    8f6c:	e3000000 	movw	r0, #0
    8f70:	e3400000 	movt	r0, #0
    8f74:	eafffffe 	b	6c98 <ipu_enable_csi>

00008f78 <sw_ipu_disable_csi>:
    8f78:	e5901000 	ldr	r1, [r0]
    8f7c:	e3000000 	movw	r0, #0
    8f80:	e3400000 	movt	r0, #0
    8f84:	eafffffe 	b	6d90 <ipu_disable_csi>

00008f88 <sw_ipu_request_irq>:
    8f88:	e92d4030 	push	{r4, r5, lr}
    8f8c:	e280500c 	add	r5, r0, #12
    8f90:	e1a04000 	mov	r4, r0
    8f94:	e24dd00c 	sub	sp, sp, #12
    8f98:	e1a00005 	mov	r0, r5
    8f9c:	ebfffffe 	bl	0 <strlen>
    8fa0:	e2800004 	add	r0, r0, #4
    8fa4:	e5943008 	ldr	r3, [r4, #8]
    8fa8:	e3c00003 	bic	r0, r0, #3
    8fac:	e5942004 	ldr	r2, [r4, #4]
    8fb0:	e0840000 	add	r0, r4, r0
    8fb4:	e5941000 	ldr	r1, [r4]
    8fb8:	e590c00c 	ldr	ip, [r0, #12]
    8fbc:	e3000000 	movw	r0, #0
    8fc0:	e3400000 	movt	r0, #0
    8fc4:	e88d1020 	stm	sp, {r5, ip}
    8fc8:	ebfffffe 	bl	707c <ipu_request_irq>
    8fcc:	e28dd00c 	add	sp, sp, #12
    8fd0:	e8bd8030 	pop	{r4, r5, pc}

00008fd4 <sw_ipu_free_irq>:
    8fd4:	e1a03000 	mov	r3, r0
    8fd8:	e3000000 	movw	r0, #0
    8fdc:	e92d4010 	push	{r4, lr}
    8fe0:	e3400000 	movt	r0, #0
    8fe4:	e5932004 	ldr	r2, [r3, #4]
    8fe8:	e5931000 	ldr	r1, [r3]
    8fec:	ebfffffe 	bl	7214 <ipu_free_irq>
    8ff0:	e3a00000 	mov	r0, #0
    8ff4:	e8bd8010 	pop	{r4, pc}

00008ff8 <sw_ipu_sync_irq_handler>:
    8ff8:	e92d4010 	push	{r4, lr}
    8ffc:	e1a04000 	mov	r4, r0
    9000:	e3a00001 	mov	r0, #1
    9004:	ebfffffe 	bl	0 <ldr_sw_set_cur_driver_id>
    9008:	e594100c 	ldr	r1, [r4, #12]
    900c:	e5940000 	ldr	r0, [r4]
    9010:	e8bd4010 	pop	{r4, lr}
    9014:	eafff3ed 	b	5fd0 <ipu_sync_irq_handler>

00009018 <sw_ipu_err_irq_handler>:
    9018:	e92d4010 	push	{r4, lr}
    901c:	e1a04000 	mov	r4, r0
    9020:	e3a00001 	mov	r0, #1
    9024:	ebfffffe 	bl	0 <ldr_sw_set_cur_driver_id>
    9028:	e594100c 	ldr	r1, [r4, #12]
    902c:	e5940000 	ldr	r0, [r4]
    9030:	e8bd4010 	pop	{r4, lr}
    9034:	eaffe22e 	b	18f4 <ipu_err_irq_handler>

00009038 <_init_csc>:
    9038:	e3510001 	cmp	r1, #1
    903c:	e92d4070 	push	{r4, r5, r6, lr}
    9040:	e59dc010 	ldr	ip, [sp, #16]
    9044:	0a000022 	beq	90d4 <_init_csc+0x9c>
    9048:	e3510000 	cmp	r1, #0
    904c:	0a000019 	beq	90b8 <_init_csc+0x80>
    9050:	e3510002 	cmp	r1, #2
    9054:	1a000070 	bne	921c <_init_csc+0x1e4>
    9058:	e2800a01 	add	r0, r0, #4096	; 0x1000
    905c:	e35c0001 	cmp	ip, #1
    9060:	e5904d7c 	ldr	r4, [r0, #3452]	; 0xd7c
    9064:	e2844a06 	add	r4, r4, #24576	; 0x6000
    9068:	02844060 	addeq	r4, r4, #96	; 0x60
    906c:	12844078 	addne	r4, r4, #120	; 0x78
    9070:	e3530000 	cmp	r3, #0
    9074:	02021001 	andeq	r1, r2, #1
    9078:	13a01000 	movne	r1, #0
    907c:	e3510000 	cmp	r1, #0
    9080:	1a000018 	bne	90e8 <_init_csc+0xb0>
    9084:	e2221001 	eor	r1, r2, #1
    9088:	e3530001 	cmp	r3, #1
    908c:	13a01000 	movne	r1, #0
    9090:	02011001 	andeq	r1, r1, #1
    9094:	e3510000 	cmp	r1, #0
    9098:	1a000044 	bne	91b0 <_init_csc+0x178>
    909c:	e1925003 	orrs	r5, r2, r3
    90a0:	0a00002c 	beq	9158 <_init_csc+0x120>
    90a4:	e3001000 	movw	r1, #0
    90a8:	e5900d84 	ldr	r0, [r0, #3460]	; 0xd84
    90ac:	e3401000 	movt	r1, #0
    90b0:	e8bd4070 	pop	{r4, r5, r6, lr}
    90b4:	eafffffe 	b	0 <dev_err>
    90b8:	e2800a01 	add	r0, r0, #4096	; 0x1000
    90bc:	e35c0001 	cmp	ip, #1
    90c0:	e5904d7c 	ldr	r4, [r0, #3452]	; 0xd7c
    90c4:	e2844901 	add	r4, r4, #16384	; 0x4000
    90c8:	02844028 	addeq	r4, r4, #40	; 0x28
    90cc:	12844040 	addne	r4, r4, #64	; 0x40
    90d0:	eaffffe6 	b	9070 <_init_csc+0x38>
    90d4:	e2800a01 	add	r0, r0, #4096	; 0x1000
    90d8:	e5904d7c 	ldr	r4, [r0, #3452]	; 0xd7c
    90dc:	e2844a02 	add	r4, r4, #8192	; 0x2000
    90e0:	e2844008 	add	r4, r4, #8
    90e4:	eaffffe1 	b	9070 <_init_csc+0x38>
    90e8:	f57ff04e 	dsb	st
    90ec:	ebfffffe 	bl	0 <arm_heavy_mb>
    90f0:	e3a03b27 	mov	r3, #39936	; 0x9c00
    90f4:	e3413257 	movt	r3, #4695	; 0x1257
    90f8:	e5843000 	str	r3, [r4]
    90fc:	f57ff04e 	dsb	st
    9100:	ebfffffe 	bl	0 <arm_heavy_mb>
    9104:	e30032f2 	movw	r3, #754	; 0x2f2
    9108:	e5843004 	str	r3, [r4, #4]
    910c:	f57ff04e 	dsb	st
    9110:	ebfffffe 	bl	0 <arm_heavy_mb>
    9114:	e3023a95 	movw	r3, #10901	; 0x2a95
    9118:	e3453001 	movt	r3, #20481	; 0x5001
    911c:	e5843008 	str	r3, [r4, #8]
    9120:	f57ff04e 	dsb	st
    9124:	ebfffffe 	bl	0 <arm_heavy_mb>
    9128:	e3a03008 	mov	r3, #8
    912c:	e584300c 	str	r3, [r4, #12]
    9130:	f57ff04e 	dsb	st
    9134:	ebfffffe 	bl	0 <arm_heavy_mb>
    9138:	e30330ff 	movw	r3, #12543	; 0x30ff
    913c:	e34b3333 	movt	r3, #45875	; 0xb333
    9140:	e5843010 	str	r3, [r4, #16]
    9144:	f57ff04e 	dsb	st
    9148:	ebfffffe 	bl	0 <arm_heavy_mb>
    914c:	e3a030ee 	mov	r3, #238	; 0xee
    9150:	e5843014 	str	r3, [r4, #20]
    9154:	e8bd8070 	pop	{r4, r5, r6, pc}
    9158:	f57ff04e 	dsb	st
    915c:	ebfffffe 	bl	0 <arm_heavy_mb>
    9160:	e3a03080 	mov	r3, #128	; 0x80
    9164:	e3403201 	movt	r3, #513	; 0x201
    9168:	e5843000 	str	r3, [r4]
    916c:	f57ff04e 	dsb	st
    9170:	ebfffffe 	bl	0 <arm_heavy_mb>
    9174:	e3a03c02 	mov	r3, #512	; 0x200
    9178:	e5843004 	str	r3, [r4, #4]
    917c:	f57ff04e 	dsb	st
    9180:	ebfffffe 	bl	0 <arm_heavy_mb>
    9184:	e5845008 	str	r5, [r4, #8]
    9188:	f57ff04e 	dsb	st
    918c:	ebfffffe 	bl	0 <arm_heavy_mb>
    9190:	e584500c 	str	r5, [r4, #12]
    9194:	f57ff04e 	dsb	st
    9198:	ebfffffe 	bl	0 <arm_heavy_mb>
    919c:	e5845010 	str	r5, [r4, #16]
    91a0:	f57ff04e 	dsb	st
    91a4:	ebfffffe 	bl	0 <arm_heavy_mb>
    91a8:	e5845014 	str	r5, [r4, #20]
    91ac:	e8bd8070 	pop	{r4, r5, r6, pc}
    91b0:	f57ff04e 	dsb	st
    91b4:	ebfffffe 	bl	0 <arm_heavy_mb>
    91b8:	e3063dee 	movw	r3, #28142	; 0x6dee
    91bc:	e340310b 	movt	r3, #267	; 0x10b
    91c0:	e5843000 	str	r3, [r4]
    91c4:	f57ff04e 	dsb	st
    91c8:	ebfffffe 	bl	0 <arm_heavy_mb>
    91cc:	e3003102 	movw	r3, #258	; 0x102
    91d0:	e5843004 	str	r3, [r4, #4]
    91d4:	f57ff04e 	dsb	st
    91d8:	ebfffffe 	bl	0 <arm_heavy_mb>
    91dc:	e30b3470 	movw	r3, #46192	; 0xb470
    91e0:	e3403207 	movt	r3, #519	; 0x207
    91e4:	e5843008 	str	r3, [r4, #8]
    91e8:	f57ff04e 	dsb	st
    91ec:	ebfffffe 	bl	0 <arm_heavy_mb>
    91f0:	e3a05010 	mov	r5, #16
    91f4:	e584500c 	str	r5, [r4, #12]
    91f8:	f57ff04e 	dsb	st
    91fc:	ebfffffe 	bl	0 <arm_heavy_mb>
    9200:	e30e31a2 	movw	r3, #57762	; 0xe1a2
    9204:	e3403064 	movt	r3, #100	; 0x64
    9208:	e5843010 	str	r3, [r4, #16]
    920c:	f57ff04e 	dsb	st
    9210:	ebfffffe 	bl	0 <arm_heavy_mb>
    9214:	e5845014 	str	r5, [r4, #20]
    9218:	e8bd8070 	pop	{r4, r5, r6, pc}
    921c:	e7f001f2 	udf	#18

00009220 <_calc_resize_coeffs>:
    9220:	e3510a01 	cmp	r1, #4096	; 0x1000
    9224:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    9228:	e24dd018 	sub	sp, sp, #24
    922c:	e1a04001 	mov	r4, r1
    9230:	e1a07000 	mov	r7, r0
    9234:	e59d6030 	ldr	r6, [sp, #48]	; 0x30
    9238:	8a000045 	bhi	9354 <_calc_resize_coeffs+0x134>
    923c:	e3520b01 	cmp	r2, #1024	; 0x400
    9240:	e1a05002 	mov	r5, r2
    9244:	8a00003b 	bhi	9338 <_calc_resize_coeffs+0x118>
    9248:	e1510182 	cmp	r1, r2, lsl #3
    924c:	8a00004f 	bhi	9390 <_calc_resize_coeffs+0x170>
    9250:	e3510b01 	cmp	r1, #1024	; 0x400
    9254:	e1a08003 	mov	r8, r3
    9258:	e1a03082 	lsl	r3, r2, #1
    925c:	9a000016 	bls	92bc <_calc_resize_coeffs+0x9c>
    9260:	e1a000a4 	lsr	r0, r4, #1
    9264:	e3500b01 	cmp	r0, #1024	; 0x400
    9268:	9a000018 	bls	92d0 <_calc_resize_coeffs+0xb0>
    926c:	e1a00124 	lsr	r0, r4, #2
    9270:	e3a03002 	mov	r3, #2
    9274:	e240037f 	sub	r0, r0, #-67108863	; 0xfc000001
    9278:	e5863000 	str	r3, [r6]
    927c:	e24007fe 	sub	r0, r0, #66584576	; 0x3f80000
    9280:	e2451001 	sub	r1, r5, #1
    9284:	e1a00680 	lsl	r0, r0, #13
    9288:	ebfffffe 	bl	0 <__aeabi_uidiv>
    928c:	e3500901 	cmp	r0, #16384	; 0x4000
    9290:	e1a0c000 	mov	ip, r0
    9294:	e5880000 	str	r0, [r8]
    9298:	2a000035 	bcs	9374 <_calc_resize_coeffs+0x154>
    929c:	e3002000 	movw	r2, #0
    92a0:	e3402000 	movt	r2, #0
    92a4:	e1d231b2 	ldrh	r3, [r2, #18]
    92a8:	e7e00153 	ubfx	r0, r3, #2, #1
    92ac:	e3500000 	cmp	r0, #0
    92b0:	1a00000a 	bne	92e0 <_calc_resize_coeffs+0xc0>
    92b4:	e28dd018 	add	sp, sp, #24
    92b8:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    92bc:	e1510003 	cmp	r1, r3
    92c0:	2affffe6 	bcs	9260 <_calc_resize_coeffs+0x40>
    92c4:	e1a00001 	mov	r0, r1
    92c8:	e3a03000 	mov	r3, #0
    92cc:	eaffffe8 	b	9274 <_calc_resize_coeffs+0x54>
    92d0:	e1530000 	cmp	r3, r0
    92d4:	83a03001 	movhi	r3, #1
    92d8:	9affffe3 	bls	926c <_calc_resize_coeffs+0x4c>
    92dc:	eaffffe4 	b	9274 <_calc_resize_coeffs+0x54>
    92e0:	e7ec305c 	ubfx	r3, ip, #0, #13
    92e4:	e302e710 	movw	lr, #10000	; 0x2710
    92e8:	e00e039e 	mul	lr, lr, r3
    92ec:	e1a03004 	mov	r3, r4
    92f0:	e5964000 	ldr	r4, [r6]
    92f4:	e35c0a02 	cmp	ip, #8192	; 0x2000
    92f8:	e2877a01 	add	r7, r7, #4096	; 0x1000
    92fc:	e5971d84 	ldr	r1, [r7, #3460]	; 0xd84
    9300:	e1a00002 	mov	r0, r2
    9304:	e1a0e6ae 	lsr	lr, lr, #13
    9308:	e58dc010 	str	ip, [sp, #16]
    930c:	e3002000 	movw	r2, #0
    9310:	e58d4004 	str	r4, [sp, #4]
    9314:	33a0c000 	movcc	ip, #0
    9318:	23a0c001 	movcs	ip, #1
    931c:	e58d5000 	str	r5, [sp]
    9320:	e3402000 	movt	r2, #0
    9324:	e58dc008 	str	ip, [sp, #8]
    9328:	e58de00c 	str	lr, [sp, #12]
    932c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    9330:	e3a00000 	mov	r0, #0
    9334:	eaffffde 	b	92b4 <_calc_resize_coeffs+0x94>
    9338:	e2807a01 	add	r7, r0, #4096	; 0x1000
    933c:	e3001000 	movw	r1, #0
    9340:	e5970d84 	ldr	r0, [r7, #3460]	; 0xd84
    9344:	e3401000 	movt	r1, #0
    9348:	ebfffffe 	bl	0 <dev_err>
    934c:	e3e00015 	mvn	r0, #21
    9350:	eaffffd7 	b	92b4 <_calc_resize_coeffs+0x94>
    9354:	e2807a01 	add	r7, r0, #4096	; 0x1000
    9358:	e3001000 	movw	r1, #0
    935c:	e5970d84 	ldr	r0, [r7, #3460]	; 0xd84
    9360:	e1a02004 	mov	r2, r4
    9364:	e3401000 	movt	r1, #0
    9368:	ebfffffe 	bl	0 <dev_err>
    936c:	e3e00015 	mvn	r0, #21
    9370:	eaffffcf 	b	92b4 <_calc_resize_coeffs+0x94>
    9374:	e2877a01 	add	r7, r7, #4096	; 0x1000
    9378:	e3001000 	movw	r1, #0
    937c:	e5970d84 	ldr	r0, [r7, #3460]	; 0xd84
    9380:	e3401000 	movt	r1, #0
    9384:	ebfffffe 	bl	0 <dev_err>
    9388:	e3e00015 	mvn	r0, #21
    938c:	eaffffc8 	b	92b4 <_calc_resize_coeffs+0x94>
    9390:	e2807a01 	add	r7, r0, #4096	; 0x1000
    9394:	e3001000 	movw	r1, #0
    9398:	e5970d84 	ldr	r0, [r7, #3460]	; 0xd84
    939c:	e3401000 	movt	r1, #0
    93a0:	ebfffffe 	bl	0 <dev_err>
    93a4:	e3e00015 	mvn	r0, #21
    93a8:	eaffffc1 	b	92b4 <_calc_resize_coeffs+0x94>

000093ac <_ipu_vdi_set_top_field_man>:
    93ac:	e92d4070 	push	{r4, r5, r6, lr}
    93b0:	e2805a01 	add	r5, r0, #4096	; 0x1000
    93b4:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    93b8:	e5934004 	ldr	r4, [r3, #4]
    93bc:	f57ff04f 	dsb	sy
    93c0:	e3510000 	cmp	r1, #0
    93c4:	13c44101 	bicne	r4, r4, #1073741824	; 0x40000000
    93c8:	03844101 	orreq	r4, r4, #1073741824	; 0x40000000
    93cc:	f57ff04e 	dsb	st
    93d0:	ebfffffe 	bl	0 <arm_heavy_mb>
    93d4:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    93d8:	e5834004 	str	r4, [r3, #4]
    93dc:	e8bd8070 	pop	{r4, r5, r6, pc}

000093e0 <_ipu_vdi_set_motion>:
    93e0:	e92d4070 	push	{r4, r5, r6, lr}
    93e4:	e2805a01 	add	r5, r0, #4096	; 0x1000
    93e8:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    93ec:	e5934004 	ldr	r4, [r3, #4]
    93f0:	f57ff04f 	dsb	sy
    93f4:	e3510002 	cmp	r1, #2
    93f8:	e3c4400c 	bic	r4, r4, #12
    93fc:	03844008 	orreq	r4, r4, #8
    9400:	0a000001 	beq	940c <_ipu_vdi_set_motion+0x2c>
    9404:	e3510000 	cmp	r1, #0
    9408:	13844004 	orrne	r4, r4, #4
    940c:	f57ff04e 	dsb	st
    9410:	ebfffffe 	bl	0 <arm_heavy_mb>
    9414:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    9418:	e5834004 	str	r4, [r3, #4]
    941c:	e3000000 	movw	r0, #0
    9420:	e3400000 	movt	r0, #0
    9424:	e1d032ba 	ldrh	r3, [r0, #42]	; 0x2a
    9428:	e3130004 	tst	r3, #4
    942c:	08bd8070 	popeq	{r4, r5, r6, pc}
    9430:	e3002000 	movw	r2, #0
    9434:	e1a03004 	mov	r3, r4
    9438:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    943c:	e2800018 	add	r0, r0, #24
    9440:	e3402000 	movt	r2, #0
    9444:	e8bd4070 	pop	{r4, r5, r6, lr}
    9448:	eafffffe 	b	0 <__dynamic_dev_dbg>

0000944c <ic_dump_register>:
    944c:	e92d4010 	push	{r4, lr}
    9450:	e2804a01 	add	r4, r0, #4096	; 0x1000
    9454:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    9458:	e5931000 	ldr	r1, [r3]
    945c:	f57ff04f 	dsb	sy
    9460:	e3000000 	movw	r0, #0
    9464:	e3400000 	movt	r0, #0
    9468:	ebfffffe 	bl	0 <printk>
    946c:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    9470:	e5931004 	ldr	r1, [r3, #4]
    9474:	f57ff04f 	dsb	sy
    9478:	e3000000 	movw	r0, #0
    947c:	e3400000 	movt	r0, #0
    9480:	ebfffffe 	bl	0 <printk>
    9484:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    9488:	e5931008 	ldr	r1, [r3, #8]
    948c:	f57ff04f 	dsb	sy
    9490:	e3000000 	movw	r0, #0
    9494:	e3400000 	movt	r0, #0
    9498:	ebfffffe 	bl	0 <printk>
    949c:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    94a0:	e593100c 	ldr	r1, [r3, #12]
    94a4:	f57ff04f 	dsb	sy
    94a8:	e3000000 	movw	r0, #0
    94ac:	e3400000 	movt	r0, #0
    94b0:	ebfffffe 	bl	0 <printk>
    94b4:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    94b8:	e5931018 	ldr	r1, [r3, #24]
    94bc:	f57ff04f 	dsb	sy
    94c0:	e3000000 	movw	r0, #0
    94c4:	e3400000 	movt	r0, #0
    94c8:	ebfffffe 	bl	0 <printk>
    94cc:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    94d0:	e593101c 	ldr	r1, [r3, #28]
    94d4:	f57ff04f 	dsb	sy
    94d8:	e3000000 	movw	r0, #0
    94dc:	e3400000 	movt	r0, #0
    94e0:	ebfffffe 	bl	0 <printk>
    94e4:	e5943d54 	ldr	r3, [r4, #3412]	; 0xd54
    94e8:	e5931020 	ldr	r1, [r3, #32]
    94ec:	f57ff04f 	dsb	sy
    94f0:	e3000000 	movw	r0, #0
    94f4:	e8bd4010 	pop	{r4, lr}
    94f8:	e3400000 	movt	r0, #0
    94fc:	eafffffe 	b	0 <printk>

00009500 <_ipu_ic_enable_task>:
    9500:	e92d4070 	push	{r4, r5, r6, lr}
    9504:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9508:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    950c:	e5934000 	ldr	r4, [r3]
    9510:	f57ff04f 	dsb	sy
    9514:	e30e3455 	movw	r3, #58453	; 0xe455
    9518:	e3403530 	movt	r3, #1328	; 0x530
    951c:	e1510003 	cmp	r1, r3
    9520:	0a00000e 	beq	9560 <_ipu_ic_enable_task+0x60>
    9524:	da000013 	ble	9578 <_ipu_ic_enable_task+0x78>
    9528:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    952c:	e34134ff 	movt	r3, #5375	; 0x14ff
    9530:	e1510003 	cmp	r1, r3
    9534:	0a000009 	beq	9560 <_ipu_ic_enable_task+0x60>
    9538:	da000024 	ble	95d0 <_ipu_ic_enable_task+0xd0>
    953c:	e30e3455 	movw	r3, #58453	; 0xe455
    9540:	e3413624 	movt	r3, #5668	; 0x1624
    9544:	e1510003 	cmp	r1, r3
    9548:	0a000004 	beq	9560 <_ipu_ic_enable_task+0x60>
    954c:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    9550:	e3413927 	movt	r3, #6439	; 0x1927
    9554:	e1510003 	cmp	r1, r3
    9558:	03844101 	orreq	r4, r4, #1073741824	; 0x40000000
    955c:	1a000000 	bne	9564 <_ipu_ic_enable_task+0x64>
    9560:	e3844c01 	orr	r4, r4, #256	; 0x100
    9564:	f57ff04e 	dsb	st
    9568:	ebfffffe 	bl	0 <arm_heavy_mb>
    956c:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9570:	e5834000 	str	r4, [r3]
    9574:	e8bd8070 	pop	{r4, r5, r6, pc}
    9578:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    957c:	e34032bb 	movt	r3, #699	; 0x2bb
    9580:	e1510003 	cmp	r1, r3
    9584:	03844a01 	orreq	r4, r4, #4096	; 0x1000
    9588:	0afffff5 	beq	9564 <_ipu_ic_enable_task+0x64>
    958c:	da00000a 	ble	95bc <_ipu_ic_enable_task+0xbc>
    9590:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    9594:	e34033bf 	movt	r3, #959	; 0x3bf
    9598:	e1510003 	cmp	r1, r3
    959c:	03844601 	orreq	r4, r4, #1048576	; 0x100000
    95a0:	0affffef 	beq	9564 <_ipu_ic_enable_task+0x64>
    95a4:	e30e3454 	movw	r3, #58452	; 0xe454
    95a8:	e3403430 	movt	r3, #1072	; 0x430
    95ac:	e1510003 	cmp	r1, r3
    95b0:	1affffeb 	bne	9564 <_ipu_ic_enable_task+0x64>
    95b4:	e3844001 	orr	r4, r4, #1
    95b8:	eaffffe9 	b	9564 <_ipu_ic_enable_task+0x64>
    95bc:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    95c0:	e34031b7 	movt	r3, #439	; 0x1b7
    95c4:	e1510003 	cmp	r1, r3
    95c8:	03844004 	orreq	r4, r4, #4
    95cc:	eaffffe4 	b	9564 <_ipu_ic_enable_task+0x64>
    95d0:	e30f3496 	movw	r3, #62614	; 0xf496
    95d4:	e340362c 	movt	r3, #1580	; 0x62c
    95d8:	e1510003 	cmp	r1, r3
    95dc:	03844801 	orreq	r4, r4, #65536	; 0x10000
    95e0:	0affffdf 	beq	9564 <_ipu_ic_enable_task+0x64>
    95e4:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    95e8:	e34133ff 	movt	r3, #5119	; 0x13ff
    95ec:	e1510003 	cmp	r1, r3
    95f0:	0affffef 	beq	95b4 <_ipu_ic_enable_task+0xb4>
    95f4:	eaffffda 	b	9564 <_ipu_ic_enable_task+0x64>

000095f8 <_ipu_ic_disable_task>:
    95f8:	e92d4070 	push	{r4, r5, r6, lr}
    95fc:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9600:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9604:	e5934000 	ldr	r4, [r3]
    9608:	f57ff04f 	dsb	sy
    960c:	e30e3455 	movw	r3, #58453	; 0xe455
    9610:	e3403530 	movt	r3, #1328	; 0x530
    9614:	e1510003 	cmp	r1, r3
    9618:	0a00000e 	beq	9658 <_ipu_ic_disable_task+0x60>
    961c:	da000013 	ble	9670 <_ipu_ic_disable_task+0x78>
    9620:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    9624:	e34134ff 	movt	r3, #5375	; 0x14ff
    9628:	e1510003 	cmp	r1, r3
    962c:	0a000009 	beq	9658 <_ipu_ic_disable_task+0x60>
    9630:	da000024 	ble	96c8 <_ipu_ic_disable_task+0xd0>
    9634:	e30e3455 	movw	r3, #58453	; 0xe455
    9638:	e3413624 	movt	r3, #5668	; 0x1624
    963c:	e1510003 	cmp	r1, r3
    9640:	0a000004 	beq	9658 <_ipu_ic_disable_task+0x60>
    9644:	e30f3fc5 	movw	r3, #65477	; 0xffc5
    9648:	e3413927 	movt	r3, #6439	; 0x1927
    964c:	e1510003 	cmp	r1, r3
    9650:	03c44101 	biceq	r4, r4, #1073741824	; 0x40000000
    9654:	1a000000 	bne	965c <_ipu_ic_disable_task+0x64>
    9658:	e3c44c01 	bic	r4, r4, #256	; 0x100
    965c:	f57ff04e 	dsb	st
    9660:	ebfffffe 	bl	0 <arm_heavy_mb>
    9664:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9668:	e5834000 	str	r4, [r3]
    966c:	e8bd8070 	pop	{r4, r5, r6, pc}
    9670:	e30f3ff1 	movw	r3, #65521	; 0xfff1
    9674:	e34032bb 	movt	r3, #699	; 0x2bb
    9678:	e1510003 	cmp	r1, r3
    967c:	03c44a01 	biceq	r4, r4, #4096	; 0x1000
    9680:	0afffff5 	beq	965c <_ipu_ic_disable_task+0x64>
    9684:	da00000a 	ble	96b4 <_ipu_ic_disable_task+0xbc>
    9688:	e30f3ff2 	movw	r3, #65522	; 0xfff2
    968c:	e34033bf 	movt	r3, #959	; 0x3bf
    9690:	e1510003 	cmp	r1, r3
    9694:	03c44601 	biceq	r4, r4, #1048576	; 0x100000
    9698:	0affffef 	beq	965c <_ipu_ic_disable_task+0x64>
    969c:	e30e3454 	movw	r3, #58452	; 0xe454
    96a0:	e3403430 	movt	r3, #1072	; 0x430
    96a4:	e1510003 	cmp	r1, r3
    96a8:	1affffeb 	bne	965c <_ipu_ic_disable_task+0x64>
    96ac:	e3c44001 	bic	r4, r4, #1
    96b0:	eaffffe9 	b	965c <_ipu_ic_disable_task+0x64>
    96b4:	e30f3ff0 	movw	r3, #65520	; 0xfff0
    96b8:	e34031b7 	movt	r3, #439	; 0x1b7
    96bc:	e1510003 	cmp	r1, r3
    96c0:	03c44004 	biceq	r4, r4, #4
    96c4:	eaffffe4 	b	965c <_ipu_ic_disable_task+0x64>
    96c8:	e30f3496 	movw	r3, #62614	; 0xf496
    96cc:	e340362c 	movt	r3, #1580	; 0x62c
    96d0:	e1510003 	cmp	r1, r3
    96d4:	03c44801 	biceq	r4, r4, #65536	; 0x10000
    96d8:	0affffdf 	beq	965c <_ipu_ic_disable_task+0x64>
    96dc:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    96e0:	e34133ff 	movt	r3, #5119	; 0x13ff
    96e4:	e1510003 	cmp	r1, r3
    96e8:	0affffef 	beq	96ac <_ipu_ic_disable_task+0xb4>
    96ec:	eaffffda 	b	965c <_ipu_ic_disable_task+0x64>

000096f0 <_ipu_vdi_init>:
    96f0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    96f4:	e1a05002 	mov	r5, r2
    96f8:	e5923004 	ldr	r3, [r2, #4]
    96fc:	e1a07000 	mov	r7, r0
    9700:	e1a08001 	mov	r8, r1
    9704:	e5924000 	ldr	r4, [r2]
    9708:	e2433001 	sub	r3, r3, #1
    970c:	e2444001 	sub	r4, r4, #1
    9710:	e1844803 	orr	r4, r4, r3, lsl #16
    9714:	f57ff04e 	dsb	st
    9718:	e2806a01 	add	r6, r0, #4096	; 0x1000
    971c:	ebfffffe 	bl	0 <arm_heavy_mb>
    9720:	e5962d80 	ldr	r2, [r6, #3456]	; 0xd80
    9724:	e5824000 	str	r4, [r2]
    9728:	e5953008 	ldr	r3, [r5, #8]
    972c:	e3050955 	movw	r0, #22869	; 0x5955
    9730:	e3051559 	movw	r1, #21849	; 0x5559
    9734:	e3450956 	movt	r0, #22870	; 0x5956
    9738:	e3451659 	movt	r1, #22105	; 0x5659
    973c:	e1530001 	cmp	r3, r1
    9740:	11530000 	cmpne	r3, r0
    9744:	03a03001 	moveq	r3, #1
    9748:	13a03000 	movne	r3, #0
    974c:	e3530000 	cmp	r3, #0
    9750:	13a03020 	movne	r3, #32
    9754:	03a03040 	moveq	r3, #64	; 0x40
    9758:	13a04002 	movne	r4, #2
    975c:	03a04000 	moveq	r4, #0
    9760:	e5921004 	ldr	r1, [r2, #4]
    9764:	f57ff04f 	dsb	sy
    9768:	e30e2455 	movw	r2, #58453	; 0xe455
    976c:	e1844001 	orr	r4, r4, r1
    9770:	e3412728 	movt	r2, #5928	; 0x1728
    9774:	e1580002 	cmp	r8, r2
    9778:	0a00004a 	beq	98a8 <_ipu_vdi_init+0x1b8>
    977c:	da000020 	ble	9804 <_ipu_vdi_init+0x114>
    9780:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    9784:	e3412927 	movt	r2, #6439	; 0x1927
    9788:	e1580002 	cmp	r8, r2
    978c:	0a00002f 	beq	9850 <_ipu_vdi_init+0x160>
    9790:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    9794:	e3412a2b 	movt	r2, #6699	; 0x1a2b
    9798:	e1580002 	cmp	r8, r2
    979c:	0a00003c 	beq	9894 <_ipu_vdi_init+0x1a4>
    97a0:	e30f2fc5 	movw	r2, #65477	; 0xffc5
    97a4:	e3412823 	movt	r2, #6179	; 0x1823
    97a8:	e1580002 	cmp	r8, r2
    97ac:	0a00002b 	beq	9860 <_ipu_vdi_init+0x170>
    97b0:	f57ff04e 	dsb	st
    97b4:	ebfffffe 	bl	0 <arm_heavy_mb>
    97b8:	e5962d80 	ldr	r2, [r6, #3456]	; 0xd80
    97bc:	e5824004 	str	r4, [r2, #4]
    97c0:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    97c4:	e3530000 	cmp	r3, #0
    97c8:	0a000018 	beq	9830 <_ipu_vdi_init+0x140>
    97cc:	e3530001 	cmp	r3, #1
    97d0:	0a000027 	beq	9874 <_ipu_vdi_init+0x184>
    97d4:	e5951034 	ldr	r1, [r5, #52]	; 0x34
    97d8:	e1a00007 	mov	r0, r7
    97dc:	ebfffffe 	bl	93e0 <_ipu_vdi_set_motion>
    97e0:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    97e4:	e5934000 	ldr	r4, [r3]
    97e8:	f57ff04f 	dsb	sy
    97ec:	e3c44101 	bic	r4, r4, #1073741824	; 0x40000000
    97f0:	f57ff04e 	dsb	st
    97f4:	ebfffffe 	bl	0 <arm_heavy_mb>
    97f8:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    97fc:	e5834000 	str	r4, [r3]
    9800:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    9804:	e30e3455 	movw	r3, #58453	; 0xe455
    9808:	e3413520 	movt	r3, #5408	; 0x1520
    980c:	e1580003 	cmp	r8, r3
    9810:	03844702 	orreq	r4, r4, #524288	; 0x80000
    9814:	03844030 	orreq	r4, r4, #48	; 0x30
    9818:	0affffe4 	beq	97b0 <_ipu_vdi_init+0xc0>
    981c:	e30e3455 	movw	r3, #58453	; 0xe455
    9820:	e3413624 	movt	r3, #5668	; 0x1624
    9824:	e1580003 	cmp	r8, r3
    9828:	03844c03 	orreq	r4, r4, #768	; 0x300
    982c:	eaffffdf 	b	97b0 <_ipu_vdi_init+0xc0>
    9830:	e5924004 	ldr	r4, [r2, #4]
    9834:	f57ff04f 	dsb	sy
    9838:	e3c44101 	bic	r4, r4, #1073741824	; 0x40000000
    983c:	f57ff04e 	dsb	st
    9840:	ebfffffe 	bl	0 <arm_heavy_mb>
    9844:	e5963d80 	ldr	r3, [r6, #3456]	; 0xd80
    9848:	e5834004 	str	r4, [r3, #4]
    984c:	eaffffe0 	b	97d4 <_ipu_vdi_init+0xe4>
    9850:	e1a03303 	lsl	r3, r3, #6
    9854:	e2433c01 	sub	r3, r3, #256	; 0x100
    9858:	e1844003 	orr	r4, r4, r3
    985c:	eaffffd3 	b	97b0 <_ipu_vdi_init+0xc0>
    9860:	e1a03103 	lsl	r3, r3, #2
    9864:	e3844809 	orr	r4, r4, #589824	; 0x90000
    9868:	e2433010 	sub	r3, r3, #16
    986c:	e1834004 	orr	r4, r3, r4
    9870:	eaffffce 	b	97b0 <_ipu_vdi_init+0xc0>
    9874:	e5924004 	ldr	r4, [r2, #4]
    9878:	f57ff04f 	dsb	sy
    987c:	e3844101 	orr	r4, r4, #1073741824	; 0x40000000
    9880:	f57ff04e 	dsb	st
    9884:	ebfffffe 	bl	0 <arm_heavy_mb>
    9888:	e5963d80 	ldr	r3, [r6, #3456]	; 0xd80
    988c:	e5834004 	str	r4, [r3, #4]
    9890:	eaffffcf 	b	97d4 <_ipu_vdi_init+0xe4>
    9894:	e1a03503 	lsl	r3, r3, #10
    9898:	e3844509 	orr	r4, r4, #37748736	; 0x2400000
    989c:	e2433a01 	sub	r3, r3, #4096	; 0x1000
    98a0:	e1834004 	orr	r4, r3, r4
    98a4:	eaffffc1 	b	97b0 <_ipu_vdi_init+0xc0>
    98a8:	e3844402 	orr	r4, r4, #33554432	; 0x2000000
    98ac:	e3844a03 	orr	r4, r4, #12288	; 0x3000
    98b0:	eaffffbe 	b	97b0 <_ipu_vdi_init+0xc0>

000098b4 <_ipu_vdi_uninit>:
    98b4:	e92d4070 	push	{r4, r5, r6, lr}
    98b8:	f57ff04e 	dsb	st
    98bc:	e2804a01 	add	r4, r0, #4096	; 0x1000
    98c0:	e3a05000 	mov	r5, #0
    98c4:	ebfffffe 	bl	0 <arm_heavy_mb>
    98c8:	e5943d80 	ldr	r3, [r4, #3456]	; 0xd80
    98cc:	e5835000 	str	r5, [r3]
    98d0:	f57ff04e 	dsb	st
    98d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    98d8:	e5943d80 	ldr	r3, [r4, #3456]	; 0xd80
    98dc:	e5835004 	str	r5, [r3, #4]
    98e0:	e8bd8070 	pop	{r4, r5, r6, pc}

000098e4 <_ipu_ic_init_prpvf>:
    98e4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    98e8:	e1a04001 	mov	r4, r1
    98ec:	e591501c 	ldr	r5, [r1, #28]
    98f0:	e24dd010 	sub	sp, sp, #16
    98f4:	e1a08002 	mov	r8, r2
    98f8:	e1a09000 	mov	r9, r0
    98fc:	e3550000 	cmp	r5, #0
    9900:	11a05805 	lslne	r5, r5, #16
    9904:	13a07000 	movne	r7, #0
    9908:	0a000044 	beq	9a20 <_ipu_ic_init_prpvf+0x13c>
    990c:	e5943018 	ldr	r3, [r4, #24]
    9910:	e3530000 	cmp	r3, #0
    9914:	11835005 	orrne	r5, r3, r5
    9918:	0a000050 	beq	9a60 <_ipu_ic_init_prpvf+0x17c>
    991c:	f57ff04e 	dsb	st
    9920:	e2896a01 	add	r6, r9, #4096	; 0x1000
    9924:	ebfffffe 	bl	0 <arm_heavy_mb>
    9928:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    992c:	e5835008 	str	r5, [r3, #8]
    9930:	e5935000 	ldr	r5, [r3]
    9934:	f57ff04f 	dsb	sy
    9938:	e5940008 	ldr	r0, [r4, #8]
    993c:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9940:	e1a0a000 	mov	sl, r0
    9944:	e5940014 	ldr	r0, [r4, #20]
    9948:	ebfffffe 	bl	8a0 <format_to_colorspace>
    994c:	e35a0000 	cmp	sl, #0
    9950:	0a000026 	beq	99f0 <_ipu_ic_init_prpvf+0x10c>
    9954:	e24aa001 	sub	sl, sl, #1
    9958:	e35a0001 	cmp	sl, #1
    995c:	93500000 	cmpls	r0, #0
    9960:	0a000073 	beq	9b34 <_ipu_ic_init_prpvf+0x250>
    9964:	e5d43020 	ldrb	r3, [r4, #32]
    9968:	e3530000 	cmp	r3, #0
    996c:	03c55b02 	biceq	r5, r5, #2048	; 0x800
    9970:	0a000014 	beq	99c8 <_ipu_ic_init_prpvf+0xe4>
    9974:	e2153c02 	ands	r3, r5, #512	; 0x200
    9978:	13855b02 	orrne	r5, r5, #2048	; 0x800
    997c:	0a000051 	beq	9ac8 <_ipu_ic_init_prpvf+0x1e4>
    9980:	e5940024 	ldr	r0, [r4, #36]	; 0x24
    9984:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9988:	e1a0a000 	mov	sl, r0
    998c:	e5940014 	ldr	r0, [r4, #20]
    9990:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9994:	e35a0000 	cmp	sl, #0
    9998:	1a00003d 	bne	9a94 <_ipu_ic_init_prpvf+0x1b0>
    999c:	e2403001 	sub	r3, r0, #1
    99a0:	e3530001 	cmp	r3, #1
    99a4:	9a000076 	bls	9b84 <_ipu_ic_init_prpvf+0x2a0>
    99a8:	e5d43021 	ldrb	r3, [r4, #33]	; 0x21
    99ac:	e3530000 	cmp	r3, #0
    99b0:	03c55201 	biceq	r5, r5, #268435456	; 0x10000000
    99b4:	1a000052 	bne	9b04 <_ipu_ic_init_prpvf+0x220>
    99b8:	e5d43022 	ldrb	r3, [r4, #34]	; 0x22
    99bc:	e3530000 	cmp	r3, #0
    99c0:	03c55202 	biceq	r5, r5, #536870912	; 0x20000000
    99c4:	1a000047 	bne	9ae8 <_ipu_ic_init_prpvf+0x204>
    99c8:	e3580000 	cmp	r8, #0
    99cc:	13c55101 	bicne	r5, r5, #1073741824	; 0x40000000
    99d0:	03855101 	orreq	r5, r5, #1073741824	; 0x40000000
    99d4:	f57ff04e 	dsb	st
    99d8:	ebfffffe 	bl	0 <arm_heavy_mb>
    99dc:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    99e0:	e5835000 	str	r5, [r3]
    99e4:	e1a00007 	mov	r0, r7
    99e8:	e28dd010 	add	sp, sp, #16
    99ec:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    99f0:	e2403001 	sub	r3, r0, #1
    99f4:	e3530001 	cmp	r3, #1
    99f8:	8affffd9 	bhi	9964 <_ipu_ic_init_prpvf+0x80>
    99fc:	e3a02001 	mov	r2, #1
    9a00:	e1a03000 	mov	r3, r0
    9a04:	e58d2000 	str	r2, [sp]
    9a08:	e1a0100a 	mov	r1, sl
    9a0c:	e1a0200a 	mov	r2, sl
    9a10:	e1a00009 	mov	r0, r9
    9a14:	e3855c02 	orr	r5, r5, #512	; 0x200
    9a18:	ebfffd86 	bl	9038 <_init_csc>
    9a1c:	eaffffd0 	b	9964 <_ipu_ic_init_prpvf+0x80>
    9a20:	e28dc008 	add	ip, sp, #8
    9a24:	e5912010 	ldr	r2, [r1, #16]
    9a28:	e28d300c 	add	r3, sp, #12
    9a2c:	e5911004 	ldr	r1, [r1, #4]
    9a30:	e58dc000 	str	ip, [sp]
    9a34:	ebfffdf9 	bl	9220 <_calc_resize_coeffs>
    9a38:	e2507000 	subs	r7, r0, #0
    9a3c:	ba000044 	blt	9b54 <_ipu_ic_init_prpvf+0x270>
    9a40:	e59d500c 	ldr	r5, [sp, #12]
    9a44:	e59d3008 	ldr	r3, [sp, #8]
    9a48:	e1a05805 	lsl	r5, r5, #16
    9a4c:	e1855f03 	orr	r5, r5, r3, lsl #30
    9a50:	e5943018 	ldr	r3, [r4, #24]
    9a54:	e3530000 	cmp	r3, #0
    9a58:	11835005 	orrne	r5, r3, r5
    9a5c:	1affffae 	bne	991c <_ipu_ic_init_prpvf+0x38>
    9a60:	e28d0008 	add	r0, sp, #8
    9a64:	e594200c 	ldr	r2, [r4, #12]
    9a68:	e5941000 	ldr	r1, [r4]
    9a6c:	e28d300c 	add	r3, sp, #12
    9a70:	e58d0000 	str	r0, [sp]
    9a74:	e1a00009 	mov	r0, r9
    9a78:	ebfffde8 	bl	9220 <_calc_resize_coeffs>
    9a7c:	e2507000 	subs	r7, r0, #0
    9a80:	ba000039 	blt	9b6c <_ipu_ic_init_prpvf+0x288>
    9a84:	e1cd20d8 	ldrd	r2, [sp, #8]
    9a88:	e1833702 	orr	r3, r3, r2, lsl #14
    9a8c:	e1835005 	orr	r5, r3, r5
    9a90:	eaffffa1 	b	991c <_ipu_ic_init_prpvf+0x38>
    9a94:	e24aa001 	sub	sl, sl, #1
    9a98:	e35a0001 	cmp	sl, #1
    9a9c:	93500000 	cmpls	r0, #0
    9aa0:	1affffc0 	bne	99a8 <_ipu_ic_init_prpvf+0xc4>
    9aa4:	e3a02002 	mov	r2, #2
    9aa8:	e3a03000 	mov	r3, #0
    9aac:	e1a00009 	mov	r0, r9
    9ab0:	e58d2000 	str	r2, [sp]
    9ab4:	e1a01003 	mov	r1, r3
    9ab8:	e3a02001 	mov	r2, #1
    9abc:	e3855b01 	orr	r5, r5, #1024	; 0x400
    9ac0:	ebfffd5c 	bl	9038 <_init_csc>
    9ac4:	eaffffb7 	b	99a8 <_ipu_ic_init_prpvf+0xc4>
    9ac8:	e3a02001 	mov	r2, #1
    9acc:	e1a01003 	mov	r1, r3
    9ad0:	e58d2000 	str	r2, [sp]
    9ad4:	e1a00009 	mov	r0, r9
    9ad8:	e1a02003 	mov	r2, r3
    9adc:	e3855c0a 	orr	r5, r5, #2560	; 0xa00
    9ae0:	ebfffd54 	bl	9038 <_init_csc>
    9ae4:	eaffffa5 	b	9980 <_ipu_ic_init_prpvf+0x9c>
    9ae8:	e3855202 	orr	r5, r5, #536870912	; 0x20000000
    9aec:	e594402c 	ldr	r4, [r4, #44]	; 0x2c
    9af0:	f57ff04e 	dsb	st
    9af4:	ebfffffe 	bl	0 <arm_heavy_mb>
    9af8:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    9afc:	e5834014 	str	r4, [r3, #20]
    9b00:	eaffffb0 	b	99c8 <_ipu_ic_init_prpvf+0xe4>
    9b04:	e3855201 	orr	r5, r5, #268435456	; 0x10000000
    9b08:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    9b0c:	e5933010 	ldr	r3, [r3, #16]
    9b10:	f57ff04f 	dsb	sy
    9b14:	e5d49028 	ldrb	r9, [r4, #40]	; 0x28
    9b18:	e3c330ff 	bic	r3, r3, #255	; 0xff
    9b1c:	e1899003 	orr	r9, r9, r3
    9b20:	f57ff04e 	dsb	st
    9b24:	ebfffffe 	bl	0 <arm_heavy_mb>
    9b28:	e5963d54 	ldr	r3, [r6, #3412]	; 0xd54
    9b2c:	e5839010 	str	r9, [r3, #16]
    9b30:	eaffffa0 	b	99b8 <_ipu_ic_init_prpvf+0xd4>
    9b34:	e3a02001 	mov	r2, #1
    9b38:	e3a03000 	mov	r3, #0
    9b3c:	e58d2000 	str	r2, [sp]
    9b40:	e1a01003 	mov	r1, r3
    9b44:	e1a00009 	mov	r0, r9
    9b48:	e3855c02 	orr	r5, r5, #512	; 0x200
    9b4c:	ebfffd39 	bl	9038 <_init_csc>
    9b50:	eaffff83 	b	9964 <_ipu_ic_init_prpvf+0x80>
    9b54:	e2899a01 	add	r9, r9, #4096	; 0x1000
    9b58:	e3001000 	movw	r1, #0
    9b5c:	e5990d84 	ldr	r0, [r9, #3460]	; 0xd84
    9b60:	e3401000 	movt	r1, #0
    9b64:	ebfffffe 	bl	0 <dev_err>
    9b68:	eaffff9d 	b	99e4 <_ipu_ic_init_prpvf+0x100>
    9b6c:	e2899a01 	add	r9, r9, #4096	; 0x1000
    9b70:	e3001000 	movw	r1, #0
    9b74:	e5990d84 	ldr	r0, [r9, #3460]	; 0xd84
    9b78:	e3401000 	movt	r1, #0
    9b7c:	ebfffffe 	bl	0 <dev_err>
    9b80:	eaffff97 	b	99e4 <_ipu_ic_init_prpvf+0x100>
    9b84:	e3a02002 	mov	r2, #2
    9b88:	e1a03000 	mov	r3, r0
    9b8c:	e58d2000 	str	r2, [sp]
    9b90:	e1a00009 	mov	r0, r9
    9b94:	e1a0200a 	mov	r2, sl
    9b98:	e1a0100a 	mov	r1, sl
    9b9c:	e3855b01 	orr	r5, r5, #1024	; 0x400
    9ba0:	ebfffd24 	bl	9038 <_init_csc>
    9ba4:	eaffff7f 	b	99a8 <_ipu_ic_init_prpvf+0xc4>

00009ba8 <_ipu_ic_uninit_prpvf>:
    9ba8:	e92d4070 	push	{r4, r5, r6, lr}
    9bac:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9bb0:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9bb4:	e5934000 	ldr	r4, [r3]
    9bb8:	f57ff04f 	dsb	sy
    9bbc:	e3c44c0f 	bic	r4, r4, #3840	; 0xf00
    9bc0:	f57ff04e 	dsb	st
    9bc4:	ebfffffe 	bl	0 <arm_heavy_mb>
    9bc8:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9bcc:	e5834000 	str	r4, [r3]
    9bd0:	e8bd8070 	pop	{r4, r5, r6, pc}

00009bd4 <_ipu_ic_init_rotate_vf>:
    9bd4:	e12fff1e 	bx	lr

00009bd8 <_ipu_ic_uninit_rotate_vf>:
    9bd8:	e92d4070 	push	{r4, r5, r6, lr}
    9bdc:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9be0:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9be4:	e5934000 	ldr	r4, [r3]
    9be8:	f57ff04f 	dsb	sy
    9bec:	e3c44a01 	bic	r4, r4, #4096	; 0x1000
    9bf0:	f57ff04e 	dsb	st
    9bf4:	ebfffffe 	bl	0 <arm_heavy_mb>
    9bf8:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9bfc:	e5834000 	str	r4, [r3]
    9c00:	e8bd8070 	pop	{r4, r5, r6, pc}

00009c04 <_ipu_ic_init_prpenc>:
    9c04:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    9c08:	e1a0a001 	mov	sl, r1
    9c0c:	e591401c 	ldr	r4, [r1, #28]
    9c10:	e24dd010 	sub	sp, sp, #16
    9c14:	e1a09002 	mov	r9, r2
    9c18:	e1a06000 	mov	r6, r0
    9c1c:	e3540000 	cmp	r4, #0
    9c20:	11a04804 	lslne	r4, r4, #16
    9c24:	13a08000 	movne	r8, #0
    9c28:	0a00002a 	beq	9cd8 <_ipu_ic_init_prpenc+0xd4>
    9c2c:	e59a3018 	ldr	r3, [sl, #24]
    9c30:	e3530000 	cmp	r3, #0
    9c34:	11834004 	orrne	r4, r3, r4
    9c38:	0a000036 	beq	9d18 <_ipu_ic_init_prpenc+0x114>
    9c3c:	f57ff04e 	dsb	st
    9c40:	e2867a01 	add	r7, r6, #4096	; 0x1000
    9c44:	ebfffffe 	bl	0 <arm_heavy_mb>
    9c48:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    9c4c:	e5834004 	str	r4, [r3, #4]
    9c50:	e5934000 	ldr	r4, [r3]
    9c54:	f57ff04f 	dsb	sy
    9c58:	e59a0008 	ldr	r0, [sl, #8]
    9c5c:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9c60:	e1a05000 	mov	r5, r0
    9c64:	e59a0014 	ldr	r0, [sl, #20]
    9c68:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9c6c:	e3550000 	cmp	r5, #0
    9c70:	0a00000d 	beq	9cac <_ipu_ic_init_prpenc+0xa8>
    9c74:	e2455001 	sub	r5, r5, #1
    9c78:	e3550001 	cmp	r5, #1
    9c7c:	93500000 	cmpls	r0, #0
    9c80:	0a000031 	beq	9d4c <_ipu_ic_init_prpenc+0x148>
    9c84:	e3590000 	cmp	r9, #0
    9c88:	13c44101 	bicne	r4, r4, #1073741824	; 0x40000000
    9c8c:	03844101 	orreq	r4, r4, #1073741824	; 0x40000000
    9c90:	f57ff04e 	dsb	st
    9c94:	ebfffffe 	bl	0 <arm_heavy_mb>
    9c98:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    9c9c:	e5834000 	str	r4, [r3]
    9ca0:	e1a00008 	mov	r0, r8
    9ca4:	e28dd010 	add	sp, sp, #16
    9ca8:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    9cac:	e2403001 	sub	r3, r0, #1
    9cb0:	e3530001 	cmp	r3, #1
    9cb4:	8afffff2 	bhi	9c84 <_ipu_ic_init_prpenc+0x80>
    9cb8:	e3a01001 	mov	r1, #1
    9cbc:	e1a03000 	mov	r3, r0
    9cc0:	e1a02005 	mov	r2, r5
    9cc4:	e1a00006 	mov	r0, r6
    9cc8:	e58d1000 	str	r1, [sp]
    9ccc:	e3844002 	orr	r4, r4, #2
    9cd0:	ebfffcd8 	bl	9038 <_init_csc>
    9cd4:	eaffffea 	b	9c84 <_ipu_ic_init_prpenc+0x80>
    9cd8:	e28dc008 	add	ip, sp, #8
    9cdc:	e5912010 	ldr	r2, [r1, #16]
    9ce0:	e28d300c 	add	r3, sp, #12
    9ce4:	e5911004 	ldr	r1, [r1, #4]
    9ce8:	e58dc000 	str	ip, [sp]
    9cec:	ebfffd4b 	bl	9220 <_calc_resize_coeffs>
    9cf0:	e2508000 	subs	r8, r0, #0
    9cf4:	ba00001c 	blt	9d6c <_ipu_ic_init_prpenc+0x168>
    9cf8:	e59d400c 	ldr	r4, [sp, #12]
    9cfc:	e59d3008 	ldr	r3, [sp, #8]
    9d00:	e1a04804 	lsl	r4, r4, #16
    9d04:	e1844f03 	orr	r4, r4, r3, lsl #30
    9d08:	e59a3018 	ldr	r3, [sl, #24]
    9d0c:	e3530000 	cmp	r3, #0
    9d10:	11834004 	orrne	r4, r3, r4
    9d14:	1affffc8 	bne	9c3c <_ipu_ic_init_prpenc+0x38>
    9d18:	e28d0008 	add	r0, sp, #8
    9d1c:	e59a200c 	ldr	r2, [sl, #12]
    9d20:	e59a1000 	ldr	r1, [sl]
    9d24:	e28d300c 	add	r3, sp, #12
    9d28:	e58d0000 	str	r0, [sp]
    9d2c:	e1a00006 	mov	r0, r6
    9d30:	ebfffd3a 	bl	9220 <_calc_resize_coeffs>
    9d34:	e2508000 	subs	r8, r0, #0
    9d38:	ba000011 	blt	9d84 <_ipu_ic_init_prpenc+0x180>
    9d3c:	e1cd20d8 	ldrd	r2, [sp, #8]
    9d40:	e1833702 	orr	r3, r3, r2, lsl #14
    9d44:	e1834004 	orr	r4, r3, r4
    9d48:	eaffffbb 	b	9c3c <_ipu_ic_init_prpenc+0x38>
    9d4c:	e3a02001 	mov	r2, #1
    9d50:	e1a00006 	mov	r0, r6
    9d54:	e58d2000 	str	r2, [sp]
    9d58:	e1a01002 	mov	r1, r2
    9d5c:	e3a03000 	mov	r3, #0
    9d60:	e3844002 	orr	r4, r4, #2
    9d64:	ebfffcb3 	bl	9038 <_init_csc>
    9d68:	eaffffc5 	b	9c84 <_ipu_ic_init_prpenc+0x80>
    9d6c:	e2866a01 	add	r6, r6, #4096	; 0x1000
    9d70:	e3001000 	movw	r1, #0
    9d74:	e5960d84 	ldr	r0, [r6, #3460]	; 0xd84
    9d78:	e3401000 	movt	r1, #0
    9d7c:	ebfffffe 	bl	0 <dev_err>
    9d80:	eaffffc6 	b	9ca0 <_ipu_ic_init_prpenc+0x9c>
    9d84:	e2866a01 	add	r6, r6, #4096	; 0x1000
    9d88:	e3001000 	movw	r1, #0
    9d8c:	e5960d84 	ldr	r0, [r6, #3460]	; 0xd84
    9d90:	e3401000 	movt	r1, #0
    9d94:	ebfffffe 	bl	0 <dev_err>
    9d98:	eaffffc0 	b	9ca0 <_ipu_ic_init_prpenc+0x9c>

00009d9c <_ipu_ic_uninit_prpenc>:
    9d9c:	e92d4070 	push	{r4, r5, r6, lr}
    9da0:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9da4:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9da8:	e5934000 	ldr	r4, [r3]
    9dac:	f57ff04f 	dsb	sy
    9db0:	e3c44003 	bic	r4, r4, #3
    9db4:	f57ff04e 	dsb	st
    9db8:	ebfffffe 	bl	0 <arm_heavy_mb>
    9dbc:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9dc0:	e5834000 	str	r4, [r3]
    9dc4:	e8bd8070 	pop	{r4, r5, r6, pc}

00009dc8 <_ipu_ic_init_rotate_enc>:
    9dc8:	e12fff1e 	bx	lr

00009dcc <_ipu_ic_uninit_rotate_enc>:
    9dcc:	e92d4070 	push	{r4, r5, r6, lr}
    9dd0:	e2805a01 	add	r5, r0, #4096	; 0x1000
    9dd4:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9dd8:	e5934000 	ldr	r4, [r3]
    9ddc:	f57ff04f 	dsb	sy
    9de0:	e3c44004 	bic	r4, r4, #4
    9de4:	f57ff04e 	dsb	st
    9de8:	ebfffffe 	bl	0 <arm_heavy_mb>
    9dec:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    9df0:	e5834000 	str	r4, [r3]
    9df4:	e8bd8070 	pop	{r4, r5, r6, pc}

00009df8 <_ipu_ic_init_pp>:
    9df8:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    9dfc:	e1a04001 	mov	r4, r1
    9e00:	e591501c 	ldr	r5, [r1, #28]
    9e04:	e24dd014 	sub	sp, sp, #20
    9e08:	e1a09000 	mov	r9, r0
    9e0c:	e3550000 	cmp	r5, #0
    9e10:	11a05805 	lslne	r5, r5, #16
    9e14:	13a08000 	movne	r8, #0
    9e18:	0a000041 	beq	9f24 <_ipu_ic_init_pp+0x12c>
    9e1c:	e5943018 	ldr	r3, [r4, #24]
    9e20:	e3530000 	cmp	r3, #0
    9e24:	11835005 	orrne	r5, r3, r5
    9e28:	0a00004d 	beq	9f64 <_ipu_ic_init_pp+0x16c>
    9e2c:	f57ff04e 	dsb	st
    9e30:	e2897a01 	add	r7, r9, #4096	; 0x1000
    9e34:	ebfffffe 	bl	0 <arm_heavy_mb>
    9e38:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    9e3c:	e583500c 	str	r5, [r3, #12]
    9e40:	e5935000 	ldr	r5, [r3]
    9e44:	f57ff04f 	dsb	sy
    9e48:	e5940008 	ldr	r0, [r4, #8]
    9e4c:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9e50:	e1a06000 	mov	r6, r0
    9e54:	e5940014 	ldr	r0, [r4, #20]
    9e58:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9e5c:	e3560000 	cmp	r6, #0
    9e60:	0a000023 	beq	9ef4 <_ipu_ic_init_pp+0xfc>
    9e64:	e2466001 	sub	r6, r6, #1
    9e68:	e3560001 	cmp	r6, #1
    9e6c:	93500000 	cmpls	r0, #0
    9e70:	0a00006f 	beq	a034 <_ipu_ic_init_pp+0x23c>
    9e74:	e5d43020 	ldrb	r3, [r4, #32]
    9e78:	e3530000 	cmp	r3, #0
    9e7c:	03c55702 	biceq	r5, r5, #524288	; 0x80000
    9e80:	0a000014 	beq	9ed8 <_ipu_ic_init_pp+0xe0>
    9e84:	e2153802 	ands	r3, r5, #131072	; 0x20000
    9e88:	13855702 	orrne	r5, r5, #524288	; 0x80000
    9e8c:	0a00004d 	beq	9fc8 <_ipu_ic_init_pp+0x1d0>
    9e90:	e5940024 	ldr	r0, [r4, #36]	; 0x24
    9e94:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9e98:	e1a06000 	mov	r6, r0
    9e9c:	e5940014 	ldr	r0, [r4, #20]
    9ea0:	ebfffffe 	bl	8a0 <format_to_colorspace>
    9ea4:	e3560000 	cmp	r6, #0
    9ea8:	1a00003a 	bne	9f98 <_ipu_ic_init_pp+0x1a0>
    9eac:	e2403001 	sub	r3, r0, #1
    9eb0:	e3530001 	cmp	r3, #1
    9eb4:	9a000072 	bls	a084 <_ipu_ic_init_pp+0x28c>
    9eb8:	e5d43021 	ldrb	r3, [r4, #33]	; 0x21
    9ebc:	e3530000 	cmp	r3, #0
    9ec0:	03c55201 	biceq	r5, r5, #268435456	; 0x10000000
    9ec4:	1a00004e 	bne	a004 <_ipu_ic_init_pp+0x20c>
    9ec8:	e5d43022 	ldrb	r3, [r4, #34]	; 0x22
    9ecc:	e3530000 	cmp	r3, #0
    9ed0:	03c55202 	biceq	r5, r5, #536870912	; 0x20000000
    9ed4:	1a000043 	bne	9fe8 <_ipu_ic_init_pp+0x1f0>
    9ed8:	f57ff04e 	dsb	st
    9edc:	ebfffffe 	bl	0 <arm_heavy_mb>
    9ee0:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    9ee4:	e5835000 	str	r5, [r3]
    9ee8:	e1a00008 	mov	r0, r8
    9eec:	e28dd014 	add	sp, sp, #20
    9ef0:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
    9ef4:	e2403001 	sub	r3, r0, #1
    9ef8:	e3530001 	cmp	r3, #1
    9efc:	8affffdc 	bhi	9e74 <_ipu_ic_init_pp+0x7c>
    9f00:	e3a01001 	mov	r1, #1
    9f04:	e1a03000 	mov	r3, r0
    9f08:	e1a02006 	mov	r2, r6
    9f0c:	e58d1000 	str	r1, [sp]
    9f10:	e1a00009 	mov	r0, r9
    9f14:	e3a01002 	mov	r1, #2
    9f18:	e3855802 	orr	r5, r5, #131072	; 0x20000
    9f1c:	ebfffc45 	bl	9038 <_init_csc>
    9f20:	eaffffd3 	b	9e74 <_ipu_ic_init_pp+0x7c>
    9f24:	e28dc008 	add	ip, sp, #8
    9f28:	e5912010 	ldr	r2, [r1, #16]
    9f2c:	e28d300c 	add	r3, sp, #12
    9f30:	e5911004 	ldr	r1, [r1, #4]
    9f34:	e58dc000 	str	ip, [sp]
    9f38:	ebfffcb8 	bl	9220 <_calc_resize_coeffs>
    9f3c:	e2508000 	subs	r8, r0, #0
    9f40:	ba000043 	blt	a054 <_ipu_ic_init_pp+0x25c>
    9f44:	e59d500c 	ldr	r5, [sp, #12]
    9f48:	e59d3008 	ldr	r3, [sp, #8]
    9f4c:	e1a05805 	lsl	r5, r5, #16
    9f50:	e1855f03 	orr	r5, r5, r3, lsl #30
    9f54:	e5943018 	ldr	r3, [r4, #24]
    9f58:	e3530000 	cmp	r3, #0
    9f5c:	11835005 	orrne	r5, r3, r5
    9f60:	1affffb1 	bne	9e2c <_ipu_ic_init_pp+0x34>
    9f64:	e28d0008 	add	r0, sp, #8
    9f68:	e594200c 	ldr	r2, [r4, #12]
    9f6c:	e5941000 	ldr	r1, [r4]
    9f70:	e28d300c 	add	r3, sp, #12
    9f74:	e58d0000 	str	r0, [sp]
    9f78:	e1a00009 	mov	r0, r9
    9f7c:	ebfffca7 	bl	9220 <_calc_resize_coeffs>
    9f80:	e2508000 	subs	r8, r0, #0
    9f84:	ba000038 	blt	a06c <_ipu_ic_init_pp+0x274>
    9f88:	e1cd20d8 	ldrd	r2, [sp, #8]
    9f8c:	e1833702 	orr	r3, r3, r2, lsl #14
    9f90:	e1835005 	orr	r5, r3, r5
    9f94:	eaffffa4 	b	9e2c <_ipu_ic_init_pp+0x34>
    9f98:	e2466001 	sub	r6, r6, #1
    9f9c:	e3560001 	cmp	r6, #1
    9fa0:	93500000 	cmpls	r0, #0
    9fa4:	1affffc3 	bne	9eb8 <_ipu_ic_init_pp+0xc0>
    9fa8:	e3a01002 	mov	r1, #2
    9fac:	e1a00009 	mov	r0, r9
    9fb0:	e58d1000 	str	r1, [sp]
    9fb4:	e3a03000 	mov	r3, #0
    9fb8:	e3a02001 	mov	r2, #1
    9fbc:	e3855701 	orr	r5, r5, #262144	; 0x40000
    9fc0:	ebfffc1c 	bl	9038 <_init_csc>
    9fc4:	eaffffbb 	b	9eb8 <_ipu_ic_init_pp+0xc0>
    9fc8:	e3a02001 	mov	r2, #1
    9fcc:	e3a01002 	mov	r1, #2
    9fd0:	e58d2000 	str	r2, [sp]
    9fd4:	e1a00009 	mov	r0, r9
    9fd8:	e1a02003 	mov	r2, r3
    9fdc:	e385580a 	orr	r5, r5, #655360	; 0xa0000
    9fe0:	ebfffc14 	bl	9038 <_init_csc>
    9fe4:	eaffffa9 	b	9e90 <_ipu_ic_init_pp+0x98>
    9fe8:	e3855202 	orr	r5, r5, #536870912	; 0x20000000
    9fec:	e594402c 	ldr	r4, [r4, #44]	; 0x2c
    9ff0:	f57ff04e 	dsb	st
    9ff4:	ebfffffe 	bl	0 <arm_heavy_mb>
    9ff8:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    9ffc:	e5834014 	str	r4, [r3, #20]
    a000:	eaffffb4 	b	9ed8 <_ipu_ic_init_pp+0xe0>
    a004:	e3855201 	orr	r5, r5, #268435456	; 0x10000000
    a008:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    a00c:	e5936010 	ldr	r6, [r3, #16]
    a010:	f57ff04f 	dsb	sy
    a014:	e5d43028 	ldrb	r3, [r4, #40]	; 0x28
    a018:	e3c66cff 	bic	r6, r6, #65280	; 0xff00
    a01c:	e1866403 	orr	r6, r6, r3, lsl #8
    a020:	f57ff04e 	dsb	st
    a024:	ebfffffe 	bl	0 <arm_heavy_mb>
    a028:	e5973d54 	ldr	r3, [r7, #3412]	; 0xd54
    a02c:	e5836010 	str	r6, [r3, #16]
    a030:	eaffffa4 	b	9ec8 <_ipu_ic_init_pp+0xd0>
    a034:	e3a02001 	mov	r2, #1
    a038:	e3a03000 	mov	r3, #0
    a03c:	e58d2000 	str	r2, [sp]
    a040:	e3a01002 	mov	r1, #2
    a044:	e1a00009 	mov	r0, r9
    a048:	e3855802 	orr	r5, r5, #131072	; 0x20000
    a04c:	ebfffbf9 	bl	9038 <_init_csc>
    a050:	eaffff87 	b	9e74 <_ipu_ic_init_pp+0x7c>
    a054:	e2899a01 	add	r9, r9, #4096	; 0x1000
    a058:	e3001000 	movw	r1, #0
    a05c:	e5990d84 	ldr	r0, [r9, #3460]	; 0xd84
    a060:	e3401000 	movt	r1, #0
    a064:	ebfffffe 	bl	0 <dev_err>
    a068:	eaffff9e 	b	9ee8 <_ipu_ic_init_pp+0xf0>
    a06c:	e2899a01 	add	r9, r9, #4096	; 0x1000
    a070:	e3001000 	movw	r1, #0
    a074:	e5990d84 	ldr	r0, [r9, #3460]	; 0xd84
    a078:	e3401000 	movt	r1, #0
    a07c:	ebfffffe 	bl	0 <dev_err>
    a080:	eaffff98 	b	9ee8 <_ipu_ic_init_pp+0xf0>
    a084:	e3a01002 	mov	r1, #2
    a088:	e1a03000 	mov	r3, r0
    a08c:	e1a02006 	mov	r2, r6
    a090:	e1a00009 	mov	r0, r9
    a094:	e58d1000 	str	r1, [sp]
    a098:	e3855701 	orr	r5, r5, #262144	; 0x40000
    a09c:	ebfffbe5 	bl	9038 <_init_csc>
    a0a0:	eaffff84 	b	9eb8 <_ipu_ic_init_pp+0xc0>

0000a0a4 <_ipu_ic_uninit_pp>:
    a0a4:	e92d4070 	push	{r4, r5, r6, lr}
    a0a8:	e2805a01 	add	r5, r0, #4096	; 0x1000
    a0ac:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a0b0:	e5934000 	ldr	r4, [r3]
    a0b4:	f57ff04f 	dsb	sy
    a0b8:	e3c4480f 	bic	r4, r4, #983040	; 0xf0000
    a0bc:	f57ff04e 	dsb	st
    a0c0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a0c4:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a0c8:	e5834000 	str	r4, [r3]
    a0cc:	e8bd8070 	pop	{r4, r5, r6, pc}

0000a0d0 <_ipu_ic_init_rotate_pp>:
    a0d0:	e12fff1e 	bx	lr

0000a0d4 <_ipu_ic_uninit_rotate_pp>:
    a0d4:	e92d4070 	push	{r4, r5, r6, lr}
    a0d8:	e2805a01 	add	r5, r0, #4096	; 0x1000
    a0dc:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a0e0:	e5934000 	ldr	r4, [r3]
    a0e4:	f57ff04f 	dsb	sy
    a0e8:	e3c44601 	bic	r4, r4, #1048576	; 0x100000
    a0ec:	f57ff04e 	dsb	st
    a0f0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a0f4:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a0f8:	e5834000 	str	r4, [r3]
    a0fc:	e8bd8070 	pop	{r4, r5, r6, pc}

0000a100 <_ipu_ic_idma_init>:
    a100:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a104:	e24dd00c 	sub	sp, sp, #12
    a108:	e59d7030 	ldr	r7, [sp, #48]	; 0x30
    a10c:	e1a05000 	mov	r5, r0
    a110:	e1a08001 	mov	r8, r1
    a114:	e5dd1034 	ldrb	r1, [sp, #52]	; 0x34
    a118:	e2470008 	sub	r0, r7, #8
    a11c:	e3d00008 	bics	r0, r0, #8
    a120:	e3000000 	movw	r0, #0
    a124:	e6ff1f31 	rbit	r1, r1
    a128:	0a000006 	beq	a148 <_ipu_ic_idma_init+0x48>
    a12c:	e3400000 	movt	r0, #0
    a130:	e1d034b2 	ldrh	r3, [r0, #66]	; 0x42
    a134:	e3130004 	tst	r3, #4
    a138:	03e00015 	mvneq	r0, #21
    a13c:	1a000041 	bne	a248 <_ipu_ic_idma_init+0x148>
    a140:	e28dd00c 	add	sp, sp, #12
    a144:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a148:	e3400000 	movt	r0, #0
    a14c:	e1a06ea1 	lsr	r6, r1, #29
    a150:	e1d015ba 	ldrh	r1, [r0, #90]	; 0x5a
    a154:	e2422001 	sub	r2, r2, #1
    a158:	e2433001 	sub	r3, r3, #1
    a15c:	e6ff9072 	uxth	r9, r2
    a160:	e6ffa073 	uxth	sl, r3
    a164:	e206b002 	and	fp, r6, #2
    a168:	e3110004 	tst	r1, #4
    a16c:	1a00003d 	bne	a268 <_ipu_ic_idma_init+0x168>
    a170:	e2855a01 	add	r5, r5, #4096	; 0x1000
    a174:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a178:	e5934018 	ldr	r4, [r3, #24]
    a17c:	f57ff04f 	dsb	sy
    a180:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a184:	e593301c 	ldr	r3, [r3, #28]
    a188:	f57ff04f 	dsb	sy
    a18c:	e5952d54 	ldr	r2, [r5, #3412]	; 0xd54
    a190:	e5922020 	ldr	r2, [r2, #32]
    a194:	f57ff04f 	dsb	sy
    a198:	e3580016 	cmp	r8, #22
    a19c:	0a00001c 	beq	a214 <_ipu_ic_idma_init+0x114>
    a1a0:	e358000b 	cmp	r8, #11
    a1a4:	0a000035 	beq	a280 <_ipu_ic_idma_init+0x180>
    a1a8:	e358002f 	cmp	r8, #47	; 0x2f
    a1ac:	07d34896 	bfieq	r4, r6, #17, #3
    a1b0:	0a000004 	beq	a1c8 <_ipu_ic_idma_init+0xc8>
    a1b4:	e358000c 	cmp	r8, #12
    a1b8:	1a000034 	bne	a290 <_ipu_ic_idma_init+0x190>
    a1bc:	e3570010 	cmp	r7, #16
    a1c0:	03844040 	orreq	r4, r4, #64	; 0x40
    a1c4:	13c44040 	bicne	r4, r4, #64	; 0x40
    a1c8:	e58d2004 	str	r2, [sp, #4]
    a1cc:	e58d3000 	str	r3, [sp]
    a1d0:	f57ff04e 	dsb	st
    a1d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    a1d8:	e5951d54 	ldr	r1, [r5, #3412]	; 0xd54
    a1dc:	e5814018 	str	r4, [r1, #24]
    a1e0:	f57ff04e 	dsb	st
    a1e4:	ebfffffe 	bl	0 <arm_heavy_mb>
    a1e8:	e5951d54 	ldr	r1, [r5, #3412]	; 0xd54
    a1ec:	e59d3000 	ldr	r3, [sp]
    a1f0:	e581301c 	str	r3, [r1, #28]
    a1f4:	f57ff04e 	dsb	st
    a1f8:	ebfffffe 	bl	0 <arm_heavy_mb>
    a1fc:	e5953d54 	ldr	r3, [r5, #3412]	; 0xd54
    a200:	e59d2004 	ldr	r2, [sp, #4]
    a204:	e5832020 	str	r2, [r3, #32]
    a208:	e3a00000 	mov	r0, #0
    a20c:	e28dd00c 	add	sp, sp, #12
    a210:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    a214:	e30f1fff 	movw	r1, #65535	; 0xffff
    a218:	e3570010 	cmp	r7, #16
    a21c:	e34c100f 	movt	r1, #49167	; 0xc00f
    a220:	03844004 	orreq	r4, r4, #4
    a224:	13c44004 	bicne	r4, r4, #4
    a228:	e0033001 	and	r3, r3, r1
    a22c:	e35b0000 	cmp	fp, #0
    a230:	e0022001 	and	r2, r2, r1
    a234:	13844501 	orrne	r4, r4, #4194304	; 0x400000
    a238:	03c44501 	biceq	r4, r4, #4194304	; 0x400000
    a23c:	e1833a0a 	orr	r3, r3, sl, lsl #20
    a240:	e1822a09 	orr	r2, r2, r9, lsl #20
    a244:	eaffffdf 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a248:	e2855a01 	add	r5, r5, #4096	; 0x1000
    a24c:	e3002000 	movw	r2, #0
    a250:	e2800030 	add	r0, r0, #48	; 0x30
    a254:	e5951d84 	ldr	r1, [r5, #3460]	; 0xd84
    a258:	e3402000 	movt	r2, #0
    a25c:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    a260:	e3e00015 	mvn	r0, #21
    a264:	eaffffb5 	b	a140 <_ipu_ic_idma_init+0x40>
    a268:	e3001000 	movw	r1, #0
    a26c:	e2800048 	add	r0, r0, #72	; 0x48
    a270:	e3401000 	movt	r1, #0
    a274:	e1a02007 	mov	r2, r7
    a278:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a27c:	eaffffbb 	b	a170 <_ipu_ic_idma_init+0x70>
    a280:	e3570010 	cmp	r7, #16
    a284:	03844020 	orreq	r4, r4, #32
    a288:	13c44020 	bicne	r4, r4, #32
    a28c:	eaffffcd 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a290:	e3580014 	cmp	r8, #20
    a294:	1a00000c 	bne	a2cc <_ipu_ic_idma_init+0x1cc>
    a298:	e3a01b3f 	mov	r1, #64512	; 0xfc00
    a29c:	e3570010 	cmp	r7, #16
    a2a0:	e34f1fff 	movt	r1, #65535	; 0xffff
    a2a4:	03844001 	orreq	r4, r4, #1
    a2a8:	13c44001 	bicne	r4, r4, #1
    a2ac:	e0033001 	and	r3, r3, r1
    a2b0:	e35b0000 	cmp	fp, #0
    a2b4:	e0022001 	and	r2, r2, r1
    a2b8:	13844601 	orrne	r4, r4, #1048576	; 0x100000
    a2bc:	03c44601 	biceq	r4, r4, #1048576	; 0x100000
    a2c0:	e18a3003 	orr	r3, sl, r3
    a2c4:	e1892002 	orr	r2, r9, r2
    a2c8:	eaffffbe 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a2cc:	e358002d 	cmp	r8, #45	; 0x2d
    a2d0:	07cd4596 	bfieq	r4, r6, #11, #3
    a2d4:	0affffbb 	beq	a1c8 <_ipu_ic_idma_init+0xc8>
    a2d8:	e3580015 	cmp	r8, #21
    a2dc:	1a00000c 	bne	a314 <_ipu_ic_idma_init+0x214>
    a2e0:	e30013ff 	movw	r1, #1023	; 0x3ff
    a2e4:	e3570010 	cmp	r7, #16
    a2e8:	e34f1ff0 	movt	r1, #65520	; 0xfff0
    a2ec:	03844002 	orreq	r4, r4, #2
    a2f0:	13c44002 	bicne	r4, r4, #2
    a2f4:	e0033001 	and	r3, r3, r1
    a2f8:	e35b0000 	cmp	fp, #0
    a2fc:	e0022001 	and	r2, r2, r1
    a300:	13844602 	orrne	r4, r4, #2097152	; 0x200000
    a304:	03c44602 	biceq	r4, r4, #2097152	; 0x200000
    a308:	e183350a 	orr	r3, r3, sl, lsl #10
    a30c:	e1822509 	orr	r2, r2, r9, lsl #10
    a310:	eaffffac 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a314:	e358002e 	cmp	r8, #46	; 0x2e
    a318:	07d04716 	bfieq	r4, r6, #14, #3
    a31c:	0affffa9 	beq	a1c8 <_ipu_ic_idma_init+0xc8>
    a320:	e358000e 	cmp	r8, #14
    a324:	1a000003 	bne	a338 <_ipu_ic_idma_init+0x238>
    a328:	e3570010 	cmp	r7, #16
    a32c:	03844008 	orreq	r4, r4, #8
    a330:	13c44008 	bicne	r4, r4, #8
    a334:	eaffffa3 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a338:	e358000f 	cmp	r8, #15
    a33c:	1a000003 	bne	a350 <_ipu_ic_idma_init+0x250>
    a340:	e3570010 	cmp	r7, #16
    a344:	03844010 	orreq	r4, r4, #16
    a348:	13c44010 	bicne	r4, r4, #16
    a34c:	eaffff9d 	b	a1c8 <_ipu_ic_idma_init+0xc8>
    a350:	e3580005 	cmp	r8, #5
    a354:	1affff9b 	bne	a1c8 <_ipu_ic_idma_init+0xc8>
    a358:	e3570010 	cmp	r7, #16
    a35c:	03844080 	orreq	r4, r4, #128	; 0x80
    a360:	13c44080 	bicne	r4, r4, #128	; 0x80
    a364:	eaffff97 	b	a1c8 <_ipu_ic_idma_init+0xc8>

0000a368 <_ipu_vdi_toggle_top_field_man>:
    a368:	e92d4070 	push	{r4, r5, r6, lr}
    a36c:	e2805a01 	add	r5, r0, #4096	; 0x1000
    a370:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    a374:	e5933004 	ldr	r3, [r3, #4]
    a378:	f57ff04f 	dsb	sy
    a37c:	e3130101 	tst	r3, #1073741824	; 0x40000000
    a380:	13c34101 	bicne	r4, r3, #1073741824	; 0x40000000
    a384:	03834101 	orreq	r4, r3, #1073741824	; 0x40000000
    a388:	f57ff04e 	dsb	st
    a38c:	ebfffffe 	bl	0 <arm_heavy_mb>
    a390:	e5953d80 	ldr	r3, [r5, #3456]	; 0xd80
    a394:	e5834004 	str	r4, [r3, #4]
    a398:	e8bd8070 	pop	{r4, r5, r6, pc}

0000a39c <ipu_csi_get_sensor_protocol>:
    a39c:	e3003000 	movw	r3, #0
    a3a0:	e92d4070 	push	{r4, r5, r6, lr}
    a3a4:	e3403000 	movt	r3, #0
    a3a8:	e1a05000 	mov	r5, r0
    a3ac:	e1a04001 	mov	r4, r1
    a3b0:	e1d321b2 	ldrh	r2, [r3, #18]
    a3b4:	e3120004 	tst	r2, #4
    a3b8:	1a00000a 	bne	a3e8 <ipu_csi_get_sensor_protocol+0x4c>
    a3bc:	e1a00005 	mov	r0, r5
    a3c0:	ebfffffe 	bl	61c8 <_ipu_get>
    a3c4:	e2841e75 	add	r1, r4, #1872	; 0x750
    a3c8:	e281100c 	add	r1, r1, #12
    a3cc:	e7953101 	ldr	r3, [r5, r1, lsl #2]
    a3d0:	e5934000 	ldr	r4, [r3]
    a3d4:	f57ff04f 	dsb	sy
    a3d8:	e1a00005 	mov	r0, r5
    a3dc:	ebfffffe 	bl	7464 <_ipu_put>
    a3e0:	e7e20254 	ubfx	r0, r4, #4, #3
    a3e4:	e8bd8070 	pop	{r4, r5, r6, pc}
    a3e8:	e3002000 	movw	r2, #0
    a3ec:	e3001000 	movw	r1, #0
    a3f0:	e1a00003 	mov	r0, r3
    a3f4:	e3402000 	movt	r2, #0
    a3f8:	e3401000 	movt	r1, #0
    a3fc:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a400:	eaffffed 	b	a3bc <ipu_csi_get_sensor_protocol+0x20>

0000a404 <ipu_csi_get_window_size>:
    a404:	e300c000 	movw	ip, #0
    a408:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    a40c:	e340c000 	movt	ip, #0
    a410:	e1a07001 	mov	r7, r1
    a414:	e1a05000 	mov	r5, r0
    a418:	e1a06002 	mov	r6, r2
    a41c:	e1dc12ba 	ldrh	r1, [ip, #42]	; 0x2a
    a420:	e1a04003 	mov	r4, r3
    a424:	e3110004 	tst	r1, #4
    a428:	1a000015 	bne	a484 <ipu_csi_get_window_size+0x80>
    a42c:	e2858d79 	add	r8, r5, #7744	; 0x1e40
    a430:	e1a00005 	mov	r0, r5
    a434:	e2888008 	add	r8, r8, #8
    a438:	ebfffffe 	bl	61c8 <_ipu_get>
    a43c:	e1a00008 	mov	r0, r8
    a440:	ebfffffe 	bl	0 <mutex_lock>
    a444:	e2843e75 	add	r3, r4, #1872	; 0x750
    a448:	e283300c 	add	r3, r3, #12
    a44c:	e7953103 	ldr	r3, [r5, r3, lsl #2]
    a450:	e5933008 	ldr	r3, [r3, #8]
    a454:	f57ff04f 	dsb	sy
    a458:	e6ff2073 	uxth	r2, r3
    a45c:	e1a03823 	lsr	r3, r3, #16
    a460:	e2822001 	add	r2, r2, #1
    a464:	e2833001 	add	r3, r3, #1
    a468:	e1a00008 	mov	r0, r8
    a46c:	e5872000 	str	r2, [r7]
    a470:	e5863000 	str	r3, [r6]
    a474:	ebfffffe 	bl	0 <mutex_unlock>
    a478:	e1a00005 	mov	r0, r5
    a47c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    a480:	eafffffe 	b	7464 <_ipu_put>
    a484:	e3001000 	movw	r1, #0
    a488:	e28c0018 	add	r0, ip, #24
    a48c:	e3401000 	movt	r1, #0
    a490:	e59f2004 	ldr	r2, [pc, #4]	; a49c <ipu_csi_get_window_size+0x98>
    a494:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a498:	eaffffe3 	b	a42c <ipu_csi_get_window_size+0x28>
    a49c:	0000077c 	andeq	r0, r0, ip, ror r7

0000a4a0 <ipu_csi_set_window_size>:
    a4a0:	e300c000 	movw	ip, #0
    a4a4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    a4a8:	e340c000 	movt	ip, #0
    a4ac:	e1a04001 	mov	r4, r1
    a4b0:	e1a06000 	mov	r6, r0
    a4b4:	e1a08002 	mov	r8, r2
    a4b8:	e1dc14b2 	ldrh	r1, [ip, #66]	; 0x42
    a4bc:	e1a05003 	mov	r5, r3
    a4c0:	e3110004 	tst	r1, #4
    a4c4:	1a000013 	bne	a518 <ipu_csi_set_window_size+0x78>
    a4c8:	e2867d79 	add	r7, r6, #7744	; 0x1e40
    a4cc:	e1a00006 	mov	r0, r6
    a4d0:	e2877008 	add	r7, r7, #8
    a4d4:	e2488001 	sub	r8, r8, #1
    a4d8:	ebfffffe 	bl	61c8 <_ipu_get>
    a4dc:	e2444001 	sub	r4, r4, #1
    a4e0:	e1a00007 	mov	r0, r7
    a4e4:	ebfffffe 	bl	0 <mutex_lock>
    a4e8:	e1844808 	orr	r4, r4, r8, lsl #16
    a4ec:	f57ff04e 	dsb	st
    a4f0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a4f4:	e2853e75 	add	r3, r5, #1872	; 0x750
    a4f8:	e283300c 	add	r3, r3, #12
    a4fc:	e7963103 	ldr	r3, [r6, r3, lsl #2]
    a500:	e5834008 	str	r4, [r3, #8]
    a504:	e1a00007 	mov	r0, r7
    a508:	ebfffffe 	bl	0 <mutex_unlock>
    a50c:	e1a00006 	mov	r0, r6
    a510:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    a514:	eafffffe 	b	7464 <_ipu_put>
    a518:	e3001000 	movw	r1, #0
    a51c:	e28c0030 	add	r0, ip, #48	; 0x30
    a520:	e3401000 	movt	r1, #0
    a524:	e59f2004 	ldr	r2, [pc, #4]	; a530 <ipu_csi_set_window_size+0x90>
    a528:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a52c:	eaffffe5 	b	a4c8 <ipu_csi_set_window_size+0x28>
    a530:	00000794 	muleq	r0, r4, r7

0000a534 <ipu_csi_set_window_pos>:
    a534:	e300c000 	movw	ip, #0
    a538:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    a53c:	e340c000 	movt	ip, #0
    a540:	e1a08001 	mov	r8, r1
    a544:	e1a06000 	mov	r6, r0
    a548:	e1a05002 	mov	r5, r2
    a54c:	e1dc15ba 	ldrh	r1, [ip, #90]	; 0x5a
    a550:	e1a04003 	mov	r4, r3
    a554:	e3110004 	tst	r1, #4
    a558:	1a000018 	bne	a5c0 <ipu_csi_set_window_pos+0x8c>
    a55c:	e2867d79 	add	r7, r6, #7744	; 0x1e40
    a560:	e0864104 	add	r4, r6, r4, lsl #2
    a564:	e1a00006 	mov	r0, r6
    a568:	e2877008 	add	r7, r7, #8
    a56c:	e2844a01 	add	r4, r4, #4096	; 0x1000
    a570:	ebfffffe 	bl	61c8 <_ipu_get>
    a574:	e1a00007 	mov	r0, r7
    a578:	ebfffffe 	bl	0 <mutex_lock>
    a57c:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    a580:	e593300c 	ldr	r3, [r3, #12]
    a584:	f57ff04f 	dsb	sy
    a588:	e3a02a0f 	mov	r2, #61440	; 0xf000
    a58c:	e1855808 	orr	r5, r5, r8, lsl #16
    a590:	e34e2000 	movt	r2, #57344	; 0xe000
    a594:	e0033002 	and	r3, r3, r2
    a598:	e1855003 	orr	r5, r5, r3
    a59c:	f57ff04e 	dsb	st
    a5a0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a5a4:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    a5a8:	e583500c 	str	r5, [r3, #12]
    a5ac:	e1a00007 	mov	r0, r7
    a5b0:	ebfffffe 	bl	0 <mutex_unlock>
    a5b4:	e1a00006 	mov	r0, r6
    a5b8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    a5bc:	eafffffe 	b	7464 <_ipu_put>
    a5c0:	e3001000 	movw	r1, #0
    a5c4:	e28c0048 	add	r0, ip, #72	; 0x48
    a5c8:	e3401000 	movt	r1, #0
    a5cc:	e59f2004 	ldr	r2, [pc, #4]	; a5d8 <ipu_csi_set_window_pos+0xa4>
    a5d0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a5d4:	eaffffe0 	b	a55c <ipu_csi_set_window_pos+0x28>
    a5d8:	000007ac 	andeq	r0, r0, ip, lsr #15

0000a5dc <ipu_csi_init_interface>:
    a5dc:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    a5e0:	e3005000 	movw	r5, #0
    a5e4:	e3405000 	movt	r5, #0
    a5e8:	e1a08001 	mov	r8, r1
    a5ec:	e24dd008 	sub	sp, sp, #8
    a5f0:	e1a06000 	mov	r6, r0
    a5f4:	e1d517b2 	ldrh	r1, [r5, #114]	; 0x72
    a5f8:	e1a09002 	mov	r9, r2
    a5fc:	e3110004 	tst	r1, #4
    a600:	1a0000b2 	bne	a8d0 <ipu_csi_init_interface+0x2f4>
    a604:	e3042742 	movw	r2, #18242	; 0x4742
    a608:	e59da030 	ldr	sl, [sp, #48]	; 0x30
    a60c:	e3432352 	movt	r2, #13138	; 0x3352
    a610:	e1530002 	cmp	r3, r2
    a614:	0a000077 	beq	a7f8 <ipu_csi_init_interface+0x21c>
    a618:	9a00005f 	bls	a79c <ipu_csi_init_interface+0x1c0>
    a61c:	e3042752 	movw	r2, #18258	; 0x4752
    a620:	e3452042 	movt	r2, #20546	; 0x5042
    a624:	e1530002 	cmp	r3, r2
    a628:	0a00009c 	beq	a8a0 <ipu_csi_init_interface+0x2c4>
    a62c:	9a000069 	bls	a7d8 <ipu_csi_init_interface+0x1fc>
    a630:	e3052559 	movw	r2, #21849	; 0x5559
    a634:	e3452659 	movt	r2, #22105	; 0x5659
    a638:	e1530002 	cmp	r3, r2
    a63c:	0a00006b 	beq	a7f0 <ipu_csi_init_interface+0x214>
    a640:	e3052955 	movw	r2, #22869	; 0x5955
    a644:	e3452956 	movt	r2, #22870	; 0x5956
    a648:	e1530002 	cmp	r3, r2
    a64c:	03a03c02 	moveq	r3, #512	; 0x200
    a650:	1a00005d 	bne	a7cc <ipu_csi_init_interface+0x1f0>
    a654:	e5dd2029 	ldrb	r2, [sp, #41]	; 0x29
    a658:	e2867d79 	add	r7, r6, #7744	; 0x1e40
    a65c:	e5dd1028 	ldrb	r1, [sp, #40]	; 0x28
    a660:	e2877008 	add	r7, r7, #8
    a664:	e7e041d2 	ubfx	r4, r2, #3, #1
    a668:	e1a04104 	lsl	r4, r4, #2
    a66c:	e201000f 	and	r0, r1, #15
    a670:	e1844580 	orr	r4, r4, r0, lsl #11
    a674:	e2020001 	and	r0, r2, #1
    a678:	e1844000 	orr	r4, r4, r0
    a67c:	e2020002 	and	r0, r2, #2
    a680:	e1844000 	orr	r4, r4, r0
    a684:	e7e00152 	ubfx	r0, r2, #2, #1
    a688:	e1844180 	orr	r4, r4, r0, lsl #3
    a68c:	e1a003a1 	lsr	r0, r1, #7
    a690:	e1844780 	orr	r4, r4, r0, lsl #15
    a694:	e2011070 	and	r1, r1, #112	; 0x70
    a698:	e7e002d2 	ubfx	r0, r2, #5, #1
    a69c:	e1844001 	orr	r4, r4, r1
    a6a0:	e7e01352 	ubfx	r1, r2, #6, #1
    a6a4:	e1844380 	orr	r4, r4, r0, lsl #7
    a6a8:	e1a023a2 	lsr	r2, r2, #7
    a6ac:	e1844e81 	orr	r4, r4, r1, lsl #29
    a6b0:	e1a00006 	mov	r0, r6
    a6b4:	e1844f82 	orr	r4, r4, r2, lsl #31
    a6b8:	e1844003 	orr	r4, r4, r3
    a6bc:	ebfffffe 	bl	61c8 <_ipu_get>
    a6c0:	e1a00007 	mov	r0, r7
    a6c4:	ebfffffe 	bl	0 <mutex_lock>
    a6c8:	f57ff04e 	dsb	st
    a6cc:	e086a10a 	add	sl, r6, sl, lsl #2
    a6d0:	e28aaa01 	add	sl, sl, #4096	; 0x1000
    a6d4:	ebfffffe 	bl	0 <arm_heavy_mb>
    a6d8:	e59a3d70 	ldr	r3, [sl, #3440]	; 0xd70
    a6dc:	e5834000 	str	r4, [r3]
    a6e0:	e2494001 	sub	r4, r9, #1
    a6e4:	e2483001 	sub	r3, r8, #1
    a6e8:	e1834804 	orr	r4, r3, r4, lsl #16
    a6ec:	f57ff04e 	dsb	st
    a6f0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a6f4:	e59a1d70 	ldr	r1, [sl, #3440]	; 0xd70
    a6f8:	e5814004 	str	r4, [r1, #4]
    a6fc:	e5dd3028 	ldrb	r3, [sp, #40]	; 0x28
    a700:	e2032070 	and	r2, r3, #112	; 0x70
    a704:	e3520020 	cmp	r2, #32
    a708:	0a000056 	beq	a868 <ipu_csi_init_interface+0x28c>
    a70c:	e3520030 	cmp	r2, #48	; 0x30
    a710:	0a00003a 	beq	a800 <ipu_csi_init_interface+0x224>
    a714:	e3130040 	tst	r3, #64	; 0x40
    a718:	e2033060 	and	r3, r3, #96	; 0x60
    a71c:	0a000061 	beq	a8a8 <ipu_csi_init_interface+0x2cc>
    a720:	f57ff04e 	dsb	st
    a724:	ebfffffe 	bl	0 <arm_heavy_mb>
    a728:	e3a03030 	mov	r3, #48	; 0x30
    a72c:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a730:	e3403004 	movt	r3, #4
    a734:	e5823014 	str	r3, [r2, #20]
    a738:	f57ff04e 	dsb	st
    a73c:	ebfffffe 	bl	0 <arm_heavy_mb>
    a740:	e59a3d70 	ldr	r3, [sl, #3440]	; 0xd70
    a744:	e3a028ff 	mov	r2, #16711680	; 0xff0000
    a748:	e583201c 	str	r2, [r3, #28]
    a74c:	e5934014 	ldr	r4, [r3, #20]
    a750:	f57ff04f 	dsb	sy
    a754:	e3844401 	orr	r4, r4, #16777216	; 0x1000000
    a758:	f57ff04e 	dsb	st
    a75c:	ebfffffe 	bl	0 <arm_heavy_mb>
    a760:	e59a3d70 	ldr	r3, [sl, #3440]	; 0xd70
    a764:	e5834014 	str	r4, [r3, #20]
    a768:	e1d538ba 	ldrh	r3, [r5, #138]	; 0x8a
    a76c:	e3130004 	tst	r3, #4
    a770:	1a000068 	bne	a918 <ipu_csi_init_interface+0x33c>
    a774:	e1d53ab2 	ldrh	r3, [r5, #162]	; 0xa2
    a778:	e3130004 	tst	r3, #4
    a77c:	1a00005b 	bne	a8f0 <ipu_csi_init_interface+0x314>
    a780:	e1a00007 	mov	r0, r7
    a784:	ebfffffe 	bl	0 <mutex_unlock>
    a788:	e1a00006 	mov	r0, r6
    a78c:	ebfffffe 	bl	7464 <_ipu_put>
    a790:	e3a00000 	mov	r0, #0
    a794:	e28dd008 	add	sp, sp, #8
    a798:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a79c:	e3052049 	movw	r2, #20553	; 0x5049
    a7a0:	e3432255 	movt	r2, #12885	; 0x3255
    a7a4:	e1530002 	cmp	r3, r2
    a7a8:	0a00003a 	beq	a898 <ipu_csi_init_interface+0x2bc>
    a7ac:	e3042752 	movw	r2, #18258	; 0x4752
    a7b0:	e3432342 	movt	r2, #13122	; 0x3342
    a7b4:	e1530002 	cmp	r3, r2
    a7b8:	0a00000e 	beq	a7f8 <ipu_csi_init_interface+0x21c>
    a7bc:	e3052049 	movw	r2, #20553	; 0x5049
    a7c0:	e3432055 	movt	r2, #12373	; 0x3055
    a7c4:	e1530002 	cmp	r3, r2
    a7c8:	0a000032 	beq	a898 <ipu_csi_init_interface+0x2bc>
    a7cc:	e3e00015 	mvn	r0, #21
    a7d0:	e28dd008 	add	sp, sp, #8
    a7d4:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    a7d8:	e3042752 	movw	r2, #18258	; 0x4752
    a7dc:	e3442f42 	movt	r2, #20290	; 0x4f42
    a7e0:	e1530002 	cmp	r3, r2
    a7e4:	03a03c05 	moveq	r3, #1280	; 0x500
    a7e8:	0affff99 	beq	a654 <ipu_csi_init_interface+0x78>
    a7ec:	eafffff6 	b	a7cc <ipu_csi_init_interface+0x1f0>
    a7f0:	e3a03c01 	mov	r3, #256	; 0x100
    a7f4:	eaffff96 	b	a654 <ipu_csi_init_interface+0x78>
    a7f8:	e3a03000 	mov	r3, #0
    a7fc:	eaffff94 	b	a654 <ipu_csi_init_interface+0x78>
    a800:	e3002271 	movw	r2, #625	; 0x271
    a804:	e2483e2d 	sub	r3, r8, #720	; 0x2d0
    a808:	e1590002 	cmp	r9, r2
    a80c:	03580e2d 	cmpeq	r8, #720	; 0x2d0
    a810:	e16f3f13 	clz	r3, r3
    a814:	e1a032a3 	lsr	r3, r3, #5
    a818:	0a000048 	beq	a940 <ipu_csi_init_interface+0x364>
    a81c:	e300220d 	movw	r2, #525	; 0x20d
    a820:	e1590002 	cmp	r9, r2
    a824:	13a09000 	movne	r9, #0
    a828:	02039001 	andeq	r9, r3, #1
    a82c:	e3590000 	cmp	r9, #0
    a830:	0a00004e 	beq	a970 <ipu_csi_init_interface+0x394>
    a834:	f57ff04e 	dsb	st
    a838:	ebfffffe 	bl	0 <arm_heavy_mb>
    a83c:	e30037df 	movw	r3, #2015	; 0x7df
    a840:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a844:	e340300d 	movt	r3, #13
    a848:	e5823014 	str	r3, [r2, #20]
    a84c:	f57ff04e 	dsb	st
    a850:	ebfffffe 	bl	0 <arm_heavy_mb>
    a854:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a858:	e3003596 	movw	r3, #1430	; 0x596
    a85c:	e3403004 	movt	r3, #4
    a860:	e5823018 	str	r3, [r2, #24]
    a864:	eaffffb3 	b	a738 <ipu_csi_init_interface+0x15c>
    a868:	f57ff04e 	dsb	st
    a86c:	ebfffffe 	bl	0 <arm_heavy_mb>
    a870:	e3a03030 	mov	r3, #48	; 0x30
    a874:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a878:	e3403004 	movt	r3, #4
    a87c:	e5823014 	str	r3, [r2, #20]
    a880:	f57ff04e 	dsb	st
    a884:	ebfffffe 	bl	0 <arm_heavy_mb>
    a888:	e59a3d70 	ldr	r3, [sl, #3440]	; 0xd70
    a88c:	e3a028ff 	mov	r2, #16711680	; 0xff0000
    a890:	e583201c 	str	r2, [r3, #28]
    a894:	eaffffb3 	b	a768 <ipu_csi_init_interface+0x18c>
    a898:	e3a03c03 	mov	r3, #768	; 0x300
    a89c:	eaffff6c 	b	a654 <ipu_csi_init_interface+0x78>
    a8a0:	e3a03b01 	mov	r3, #1024	; 0x400
    a8a4:	eaffff6a 	b	a654 <ipu_csi_init_interface+0x78>
    a8a8:	e3530000 	cmp	r3, #0
    a8ac:	1affffad 	bne	a768 <ipu_csi_init_interface+0x18c>
    a8b0:	e5914014 	ldr	r4, [r1, #20]
    a8b4:	f57ff04f 	dsb	sy
    a8b8:	e3c44401 	bic	r4, r4, #16777216	; 0x1000000
    a8bc:	f57ff04e 	dsb	st
    a8c0:	ebfffffe 	bl	0 <arm_heavy_mb>
    a8c4:	e59a3d70 	ldr	r3, [sl, #3440]	; 0xd70
    a8c8:	e5834014 	str	r4, [r3, #20]
    a8cc:	eaffffa5 	b	a768 <ipu_csi_init_interface+0x18c>
    a8d0:	e3001000 	movw	r1, #0
    a8d4:	e59f20c0 	ldr	r2, [pc, #192]	; a99c <ipu_csi_init_interface+0x3c0>
    a8d8:	e3401000 	movt	r1, #0
    a8dc:	e2850060 	add	r0, r5, #96	; 0x60
    a8e0:	e58d3004 	str	r3, [sp, #4]
    a8e4:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    a8e8:	e59d3004 	ldr	r3, [sp, #4]
    a8ec:	eaffff44 	b	a604 <ipu_csi_init_interface+0x28>
    a8f0:	e2863a01 	add	r3, r6, #4096	; 0x1000
    a8f4:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a8f8:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    a8fc:	e5923008 	ldr	r3, [r2, #8]
    a900:	f57ff04f 	dsb	sy
    a904:	e3002000 	movw	r2, #0
    a908:	e59f0090 	ldr	r0, [pc, #144]	; a9a0 <ipu_csi_init_interface+0x3c4>
    a90c:	e3402000 	movt	r2, #0
    a910:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    a914:	eaffff99 	b	a780 <ipu_csi_init_interface+0x1a4>
    a918:	e2863a01 	add	r3, r6, #4096	; 0x1000
    a91c:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a920:	e5931d84 	ldr	r1, [r3, #3460]	; 0xd84
    a924:	e5923000 	ldr	r3, [r2]
    a928:	f57ff04f 	dsb	sy
    a92c:	e3002000 	movw	r2, #0
    a930:	e59f006c 	ldr	r0, [pc, #108]	; a9a4 <ipu_csi_init_interface+0x3c8>
    a934:	e3402000 	movt	r2, #0
    a938:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    a93c:	eaffff8c 	b	a774 <ipu_csi_init_interface+0x198>
    a940:	f57ff04e 	dsb	st
    a944:	ebfffffe 	bl	0 <arm_heavy_mb>
    a948:	e3003596 	movw	r3, #1430	; 0x596
    a94c:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a950:	e3403004 	movt	r3, #4
    a954:	e5823014 	str	r3, [r2, #20]
    a958:	f57ff04e 	dsb	st
    a95c:	ebfffffe 	bl	0 <arm_heavy_mb>
    a960:	e30037df 	movw	r3, #2015	; 0x7df
    a964:	e59a2d70 	ldr	r2, [sl, #3440]	; 0xd70
    a968:	e340300d 	movt	r3, #13
    a96c:	eaffffbb 	b	a860 <ipu_csi_init_interface+0x284>
    a970:	e2863a01 	add	r3, r6, #4096	; 0x1000
    a974:	e3001000 	movw	r1, #0
    a978:	e5930d84 	ldr	r0, [r3, #3460]	; 0xd84
    a97c:	e3401000 	movt	r1, #0
    a980:	ebfffffe 	bl	0 <dev_err>
    a984:	e1a00007 	mov	r0, r7
    a988:	ebfffffe 	bl	0 <mutex_unlock>
    a98c:	e1a00006 	mov	r0, r6
    a990:	ebfffffe 	bl	7464 <_ipu_put>
    a994:	e3e00015 	mvn	r0, #21
    a998:	eaffff7d 	b	a794 <ipu_csi_init_interface+0x1b8>
    a99c:	000007c4 	andeq	r0, r0, r4, asr #15
    a9a0:	00000870 	andeq	r0, r0, r0, ror r8
    a9a4:	00000858 	andeq	r0, r0, r8, asr r8

0000a9a8 <ipu_csi_enable_mclk>:
    a9a8:	e0801101 	add	r1, r0, r1, lsl #2
    a9ac:	e5910034 	ldr	r0, [r1, #52]	; 0x34
    a9b0:	e3500000 	cmp	r0, #0
    a9b4:	0a00000d 	beq	a9f0 <ipu_csi_enable_mclk+0x48>
    a9b8:	e3520000 	cmp	r2, #0
    a9bc:	e92d4010 	push	{r4, lr}
    a9c0:	e1a04003 	mov	r4, r3
    a9c4:	1a000002 	bne	a9d4 <ipu_csi_enable_mclk+0x2c>
    a9c8:	ebfffffe 	bl	0 <clk_disable>
    a9cc:	e3a00000 	mov	r0, #0
    a9d0:	e8bd8010 	pop	{r4, pc}
    a9d4:	ebfffffe 	bl	0 <clk_enable>
    a9d8:	e3540000 	cmp	r4, #0
    a9dc:	0afffffa 	beq	a9cc <ipu_csi_enable_mclk+0x24>
    a9e0:	e3a0000a 	mov	r0, #10
    a9e4:	ebfffffe 	bl	0 <msleep>
    a9e8:	e3a00000 	mov	r0, #0
    a9ec:	e8bd8010 	pop	{r4, pc}
    a9f0:	e3a00000 	mov	r0, #0
    a9f4:	e12fff1e 	bx	lr

0000a9f8 <_ipu_csi_mclk_set>:
    a9f8:	e92d4070 	push	{r4, r5, r6, lr}
    a9fc:	e1a05001 	mov	r5, r1
    aa00:	e1a04000 	mov	r4, r0
    aa04:	e590000c 	ldr	r0, [r0, #12]
    aa08:	e1a06002 	mov	r6, r2
    aa0c:	ebfffffe 	bl	0 <clk_get_rate>
    aa10:	e1a01005 	mov	r1, r5
    aa14:	ebfffffe 	bl	0 <__aeabi_uidiv>
    aa18:	e2400001 	sub	r0, r0, #1
    aa1c:	e35000ff 	cmp	r0, #255	; 0xff
    aa20:	9a000006 	bls	aa40 <_ipu_csi_mclk_set+0x48>
    aa24:	e3000000 	movw	r0, #0
    aa28:	e3400000 	movt	r0, #0
    aa2c:	e1d03bba 	ldrh	r3, [r0, #186]	; 0xba
    aa30:	e3130004 	tst	r3, #4
    aa34:	1a00000e 	bne	aa74 <_ipu_csi_mclk_set+0x7c>
    aa38:	e3e00015 	mvn	r0, #21
    aa3c:	e8bd8070 	pop	{r4, r5, r6, pc}
    aa40:	e0844106 	add	r4, r4, r6, lsl #2
    aa44:	e2844a01 	add	r4, r4, #4096	; 0x1000
    aa48:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    aa4c:	e5935000 	ldr	r5, [r3]
    aa50:	f57ff04f 	dsb	sy
    aa54:	e3c558ff 	bic	r5, r5, #16711680	; 0xff0000
    aa58:	e1855800 	orr	r5, r5, r0, lsl #16
    aa5c:	f57ff04e 	dsb	st
    aa60:	ebfffffe 	bl	0 <arm_heavy_mb>
    aa64:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    aa68:	e5835000 	str	r5, [r3]
    aa6c:	e3a00000 	mov	r0, #0
    aa70:	e8bd8070 	pop	{r4, r5, r6, pc}
    aa74:	e2844a01 	add	r4, r4, #4096	; 0x1000
    aa78:	e3002000 	movw	r2, #0
    aa7c:	e5941d84 	ldr	r1, [r4, #3460]	; 0xd84
    aa80:	e28000a8 	add	r0, r0, #168	; 0xa8
    aa84:	e3402000 	movt	r2, #0
    aa88:	ebfffffe 	bl	0 <__dynamic_dev_dbg>
    aa8c:	e3e00015 	mvn	r0, #21
    aa90:	e8bd8070 	pop	{r4, r5, r6, pc}

0000aa94 <_ipu_csi_horizontal_downsize_enable>:
    aa94:	e3003000 	movw	r3, #0
    aa98:	e92d4070 	push	{r4, r5, r6, lr}
    aa9c:	e3403000 	movt	r3, #0
    aaa0:	e1a04000 	mov	r4, r0
    aaa4:	e1a05001 	mov	r5, r1
    aaa8:	e1d32db2 	ldrh	r2, [r3, #210]	; 0xd2
    aaac:	e3120004 	tst	r2, #4
    aab0:	1a00000a 	bne	aae0 <_ipu_csi_horizontal_downsize_enable+0x4c>
    aab4:	e0844105 	add	r4, r4, r5, lsl #2
    aab8:	e2844a01 	add	r4, r4, #4096	; 0x1000
    aabc:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    aac0:	e593500c 	ldr	r5, [r3, #12]
    aac4:	f57ff04f 	dsb	sy
    aac8:	e3855102 	orr	r5, r5, #-2147483648	; 0x80000000
    aacc:	f57ff04e 	dsb	st
    aad0:	ebfffffe 	bl	0 <arm_heavy_mb>
    aad4:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    aad8:	e583500c 	str	r5, [r3, #12]
    aadc:	e8bd8070 	pop	{r4, r5, r6, pc}
    aae0:	e3001000 	movw	r1, #0
    aae4:	e28300c0 	add	r0, r3, #192	; 0xc0
    aae8:	e3401000 	movt	r1, #0
    aaec:	e59f2004 	ldr	r2, [pc, #4]	; aaf8 <_ipu_csi_horizontal_downsize_enable+0x64>
    aaf0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    aaf4:	eaffffee 	b	aab4 <_ipu_csi_horizontal_downsize_enable+0x20>
    aaf8:	000007dc 	ldrdeq	r0, [r0], -ip

0000aafc <_ipu_csi_horizontal_downsize_disable>:
    aafc:	e0801101 	add	r1, r0, r1, lsl #2
    ab00:	e92d4070 	push	{r4, r5, r6, lr}
    ab04:	e2814a01 	add	r4, r1, #4096	; 0x1000
    ab08:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab0c:	e593500c 	ldr	r5, [r3, #12]
    ab10:	f57ff04f 	dsb	sy
    ab14:	e3c55102 	bic	r5, r5, #-2147483648	; 0x80000000
    ab18:	f57ff04e 	dsb	st
    ab1c:	ebfffffe 	bl	0 <arm_heavy_mb>
    ab20:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab24:	e583500c 	str	r5, [r3, #12]
    ab28:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ab2c <_ipu_csi_vertical_downsize_enable>:
    ab2c:	e0801101 	add	r1, r0, r1, lsl #2
    ab30:	e92d4070 	push	{r4, r5, r6, lr}
    ab34:	e2814a01 	add	r4, r1, #4096	; 0x1000
    ab38:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab3c:	e593500c 	ldr	r5, [r3, #12]
    ab40:	f57ff04f 	dsb	sy
    ab44:	e3855101 	orr	r5, r5, #1073741824	; 0x40000000
    ab48:	f57ff04e 	dsb	st
    ab4c:	ebfffffe 	bl	0 <arm_heavy_mb>
    ab50:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab54:	e583500c 	str	r5, [r3, #12]
    ab58:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ab5c <_ipu_csi_vertical_downsize_disable>:
    ab5c:	e0801101 	add	r1, r0, r1, lsl #2
    ab60:	e92d4070 	push	{r4, r5, r6, lr}
    ab64:	e2814a01 	add	r4, r1, #4096	; 0x1000
    ab68:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab6c:	e593500c 	ldr	r5, [r3, #12]
    ab70:	f57ff04f 	dsb	sy
    ab74:	e3c55101 	bic	r5, r5, #1073741824	; 0x40000000
    ab78:	f57ff04e 	dsb	st
    ab7c:	ebfffffe 	bl	0 <arm_heavy_mb>
    ab80:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ab84:	e583500c 	str	r5, [r3, #12]
    ab88:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ab8c <_ipu_csi_set_test_generator>:
    ab8c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    ab90:	e1a07003 	mov	r7, r3
    ab94:	e59dc020 	ldr	ip, [sp, #32]
    ab98:	e080510c 	add	r5, r0, ip, lsl #2
    ab9c:	e2855a01 	add	r5, r5, #4096	; 0x1000
    aba0:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    aba4:	e5936010 	ldr	r6, [r3, #16]
    aba8:	f57ff04f 	dsb	sy
    abac:	e3510000 	cmp	r1, #0
    abb0:	0a00000e 	beq	abf0 <_ipu_csi_set_test_generator+0x64>
    abb4:	e1a04002 	mov	r4, r2
    abb8:	e59d101c 	ldr	r1, [sp, #28]
    abbc:	e1a0200c 	mov	r2, ip
    abc0:	e20664ff 	and	r6, r6, #-16777216	; 0xff000000
    abc4:	ebfffffe 	bl	a9f8 <_ipu_csi_mclk_set>
    abc8:	e59d3018 	ldr	r3, [sp, #24]
    abcc:	e1844803 	orr	r4, r4, r3, lsl #16
    abd0:	e3844401 	orr	r4, r4, #16777216	; 0x1000000
    abd4:	e1844407 	orr	r4, r4, r7, lsl #8
    abd8:	e1844006 	orr	r4, r4, r6
    abdc:	f57ff04e 	dsb	st
    abe0:	ebfffffe 	bl	0 <arm_heavy_mb>
    abe4:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    abe8:	e5834010 	str	r4, [r3, #16]
    abec:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    abf0:	e3c66401 	bic	r6, r6, #16777216	; 0x1000000
    abf4:	f57ff04e 	dsb	st
    abf8:	ebfffffe 	bl	0 <arm_heavy_mb>
    abfc:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    ac00:	e5836010 	str	r6, [r3, #16]
    ac04:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000ac08 <_ipu_csi_ccir_err_detection_enable>:
    ac08:	e0801101 	add	r1, r0, r1, lsl #2
    ac0c:	e92d4070 	push	{r4, r5, r6, lr}
    ac10:	e2814a01 	add	r4, r1, #4096	; 0x1000
    ac14:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ac18:	e5935014 	ldr	r5, [r3, #20]
    ac1c:	f57ff04f 	dsb	sy
    ac20:	e3855401 	orr	r5, r5, #16777216	; 0x1000000
    ac24:	f57ff04e 	dsb	st
    ac28:	ebfffffe 	bl	0 <arm_heavy_mb>
    ac2c:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ac30:	e5835014 	str	r5, [r3, #20]
    ac34:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ac38 <_ipu_csi_ccir_err_detection_disable>:
    ac38:	e0801101 	add	r1, r0, r1, lsl #2
    ac3c:	e92d4070 	push	{r4, r5, r6, lr}
    ac40:	e2814a01 	add	r4, r1, #4096	; 0x1000
    ac44:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ac48:	e5935014 	ldr	r5, [r3, #20]
    ac4c:	f57ff04f 	dsb	sy
    ac50:	e3c55401 	bic	r5, r5, #16777216	; 0x1000000
    ac54:	f57ff04e 	dsb	st
    ac58:	ebfffffe 	bl	0 <arm_heavy_mb>
    ac5c:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    ac60:	e5835014 	str	r5, [r3, #20]
    ac64:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ac68 <_ipu_csi_set_mipi_di>:
    ac68:	e35200ff 	cmp	r2, #255	; 0xff
    ac6c:	8a000032 	bhi	ad3c <_ipu_csi_set_mipi_di+0xd4>
    ac70:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    ac74:	e1a04000 	mov	r4, r0
    ac78:	e3000000 	movw	r0, #0
    ac7c:	e1a07003 	mov	r7, r3
    ac80:	e3400000 	movt	r0, #0
    ac84:	e1a05001 	mov	r5, r1
    ac88:	e1d03eba 	ldrh	r3, [r0, #234]	; 0xea
    ac8c:	e1a06002 	mov	r6, r2
    ac90:	e3130004 	tst	r3, #4
    ac94:	1a000021 	bne	ad20 <_ipu_csi_set_mipi_di+0xb8>
    ac98:	e0844107 	add	r4, r4, r7, lsl #2
    ac9c:	e2844a01 	add	r4, r4, #4096	; 0x1000
    aca0:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    aca4:	e5933020 	ldr	r3, [r3, #32]
    aca8:	f57ff04f 	dsb	sy
    acac:	e3550003 	cmp	r5, #3
    acb0:	979ff105 	ldrls	pc, [pc, r5, lsl #2]
    acb4:	ea000022 	b	ad44 <_ipu_csi_set_mipi_di+0xdc>
    acb8:	0000ace8 	andeq	sl, r0, r8, ror #25
    acbc:	0000ad08 	andeq	sl, r0, r8, lsl #26
    acc0:	0000ad14 	andeq	sl, r0, r4, lsl sp
    acc4:	0000acc8 	andeq	sl, r0, r8, asr #25
    acc8:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    accc:	e1836c06 	orr	r6, r3, r6, lsl #24
    acd0:	f57ff04e 	dsb	st
    acd4:	ebfffffe 	bl	0 <arm_heavy_mb>
    acd8:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    acdc:	e5836020 	str	r6, [r3, #32]
    ace0:	e3a00000 	mov	r0, #0
    ace4:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    ace8:	e3c350ff 	bic	r5, r3, #255	; 0xff
    acec:	e1865005 	orr	r5, r6, r5
    acf0:	f57ff04e 	dsb	st
    acf4:	ebfffffe 	bl	0 <arm_heavy_mb>
    acf8:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    acfc:	e5835020 	str	r5, [r3, #32]
    ad00:	e3a00000 	mov	r0, #0
    ad04:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    ad08:	e3c35cff 	bic	r5, r3, #65280	; 0xff00
    ad0c:	e1855406 	orr	r5, r5, r6, lsl #8
    ad10:	eafffff6 	b	acf0 <_ipu_csi_set_mipi_di+0x88>
    ad14:	e3c338ff 	bic	r3, r3, #16711680	; 0xff0000
    ad18:	e1836806 	orr	r6, r3, r6, lsl #16
    ad1c:	eaffffeb 	b	acd0 <_ipu_csi_set_mipi_di+0x68>
    ad20:	e3001000 	movw	r1, #0
    ad24:	e28000d8 	add	r0, r0, #216	; 0xd8
    ad28:	e3401000 	movt	r1, #0
    ad2c:	e1a03005 	mov	r3, r5
    ad30:	e59f2014 	ldr	r2, [pc, #20]	; ad4c <_ipu_csi_set_mipi_di+0xe4>
    ad34:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    ad38:	eaffffd6 	b	ac98 <_ipu_csi_set_mipi_di+0x30>
    ad3c:	e3e00015 	mvn	r0, #21
    ad40:	e12fff1e 	bx	lr
    ad44:	e3e00015 	mvn	r0, #21
    ad48:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    ad4c:	00000800 	andeq	r0, r0, r0, lsl #16

0000ad50 <_ipu_csi_set_skip_isp>:
    ad50:	e3520005 	cmp	r2, #5
    ad54:	8a00000f 	bhi	ad98 <_ipu_csi_set_skip_isp+0x48>
    ad58:	e92d4070 	push	{r4, r5, r6, lr}
    ad5c:	e0805103 	add	r5, r0, r3, lsl #2
    ad60:	e2855a01 	add	r5, r5, #4096	; 0x1000
    ad64:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    ad68:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    ad6c:	f57ff04f 	dsb	sy
    ad70:	e1a04981 	lsl	r4, r1, #19
    ad74:	e3c318ff 	bic	r1, r3, #16711680	; 0xff0000
    ad78:	e1844802 	orr	r4, r4, r2, lsl #16
    ad7c:	e1844001 	orr	r4, r4, r1
    ad80:	f57ff04e 	dsb	st
    ad84:	ebfffffe 	bl	0 <arm_heavy_mb>
    ad88:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    ad8c:	e5834024 	str	r4, [r3, #36]	; 0x24
    ad90:	e3a00000 	mov	r0, #0
    ad94:	e8bd8070 	pop	{r4, r5, r6, pc}
    ad98:	e3e00015 	mvn	r0, #21
    ad9c:	e12fff1e 	bx	lr

0000ada0 <_ipu_csi_set_skip_smfc>:
    ada0:	e3530003 	cmp	r3, #3
    ada4:	93520005 	cmpls	r2, #5
    ada8:	e92d4070 	push	{r4, r5, r6, lr}
    adac:	83a06001 	movhi	r6, #1
    adb0:	93a06000 	movls	r6, #0
    adb4:	8a000010 	bhi	adfc <_ipu_csi_set_skip_smfc+0x5c>
    adb8:	e59dc010 	ldr	ip, [sp, #16]
    adbc:	e080510c 	add	r5, r0, ip, lsl #2
    adc0:	e2855a01 	add	r5, r5, #4096	; 0x1000
    adc4:	e5950d70 	ldr	r0, [r5, #3440]	; 0xd70
    adc8:	e5900024 	ldr	r0, [r0, #36]	; 0x24
    adcc:	f57ff04f 	dsb	sy
    add0:	e1824403 	orr	r4, r2, r3, lsl #8
    add4:	e3c03fff 	bic	r3, r0, #1020	; 0x3fc
    add8:	e3c33003 	bic	r3, r3, #3
    addc:	e1844181 	orr	r4, r4, r1, lsl #3
    ade0:	e1844003 	orr	r4, r4, r3
    ade4:	f57ff04e 	dsb	st
    ade8:	ebfffffe 	bl	0 <arm_heavy_mb>
    adec:	e5953d70 	ldr	r3, [r5, #3440]	; 0xd70
    adf0:	e5834024 	str	r4, [r3, #36]	; 0x24
    adf4:	e1a00006 	mov	r0, r6
    adf8:	e8bd8070 	pop	{r4, r5, r6, pc}
    adfc:	e3e00015 	mvn	r0, #21
    ae00:	e8bd8070 	pop	{r4, r5, r6, pc}

0000ae04 <_ipu_smfc_init>:
    ae04:	e92d4070 	push	{r4, r5, r6, lr}
    ae08:	e2805a01 	add	r5, r0, #4096	; 0x1000
    ae0c:	e5950d6c 	ldr	r0, [r5, #3436]	; 0xd6c
    ae10:	e590c000 	ldr	ip, [r0]
    ae14:	f57ff04f 	dsb	sy
    ae18:	e30f0fc1 	movw	r0, #65473	; 0xffc1
    ae1c:	e34100ff 	movt	r0, #4351	; 0x10ff
    ae20:	e1510000 	cmp	r1, r0
    ae24:	0a00001c 	beq	ae9c <_ipu_smfc_init+0x98>
    ae28:	da000013 	ble	ae7c <_ipu_smfc_init+0x78>
    ae2c:	e30f0fc2 	movw	r0, #65474	; 0xffc2
    ae30:	e34101ff 	movt	r0, #4607	; 0x11ff
    ae34:	e1510000 	cmp	r1, r0
    ae38:	0a00000b 	beq	ae6c <_ipu_smfc_init+0x68>
    ae3c:	e30f0fc3 	movw	r0, #65475	; 0xffc3
    ae40:	e34102ff 	movt	r0, #4863	; 0x12ff
    ae44:	e1510000 	cmp	r1, r0
    ae48:	18bd8070 	popne	{r4, r5, r6, pc}
    ae4c:	e1824103 	orr	r4, r2, r3, lsl #2
    ae50:	e3cccc0e 	bic	ip, ip, #3584	; 0xe00
    ae54:	e18c4484 	orr	r4, ip, r4, lsl #9
    ae58:	f57ff04e 	dsb	st
    ae5c:	ebfffffe 	bl	0 <arm_heavy_mb>
    ae60:	e5953d6c 	ldr	r3, [r5, #3436]	; 0xd6c
    ae64:	e5834000 	str	r4, [r3]
    ae68:	e8bd8070 	pop	{r4, r5, r6, pc}
    ae6c:	e1824103 	orr	r4, r2, r3, lsl #2
    ae70:	e3cccd07 	bic	ip, ip, #448	; 0x1c0
    ae74:	e18c4304 	orr	r4, ip, r4, lsl #6
    ae78:	eafffff6 	b	ae58 <_ipu_smfc_init+0x54>
    ae7c:	e30f0fc0 	movw	r0, #65472	; 0xffc0
    ae80:	e3400fff 	movt	r0, #4095	; 0xfff
    ae84:	e1510000 	cmp	r1, r0
    ae88:	18bd8070 	popne	{r4, r5, r6, pc}
    ae8c:	e1824103 	orr	r4, r2, r3, lsl #2
    ae90:	e3ccc007 	bic	ip, ip, #7
    ae94:	e184400c 	orr	r4, r4, ip
    ae98:	eaffffee 	b	ae58 <_ipu_smfc_init+0x54>
    ae9c:	e1824103 	orr	r4, r2, r3, lsl #2
    aea0:	e3ccc038 	bic	ip, ip, #56	; 0x38
    aea4:	e18c4184 	orr	r4, ip, r4, lsl #3
    aea8:	eaffffea 	b	ae58 <_ipu_smfc_init+0x54>

0000aeac <_ipu_smfc_set_wmc>:
    aeac:	e92d4070 	push	{r4, r5, r6, lr}
    aeb0:	e2805a01 	add	r5, r0, #4096	; 0x1000
    aeb4:	e5950d6c 	ldr	r0, [r5, #3436]	; 0xd6c
    aeb8:	e5904004 	ldr	r4, [r0, #4]
    aebc:	f57ff04f 	dsb	sy
    aec0:	e30f0fc1 	movw	r0, #65473	; 0xffc1
    aec4:	e34100ff 	movt	r0, #4351	; 0x10ff
    aec8:	e1510000 	cmp	r1, r0
    aecc:	0a000022 	beq	af5c <_ipu_smfc_set_wmc+0xb0>
    aed0:	da000017 	ble	af34 <_ipu_smfc_set_wmc+0x88>
    aed4:	e30f0fc2 	movw	r0, #65474	; 0xffc2
    aed8:	e34101ff 	movt	r0, #4607	; 0x11ff
    aedc:	e1510000 	cmp	r1, r0
    aee0:	0a00000d 	beq	af1c <_ipu_smfc_set_wmc+0x70>
    aee4:	e30f0fc3 	movw	r0, #65475	; 0xffc3
    aee8:	e34102ff 	movt	r0, #4863	; 0x12ff
    aeec:	e1510000 	cmp	r1, r0
    aef0:	18bd8070 	popne	{r4, r5, r6, pc}
    aef4:	e3520000 	cmp	r2, #0
    aef8:	13c44507 	bicne	r4, r4, #29360128	; 0x1c00000
    aefc:	03c4440e 	biceq	r4, r4, #234881024	; 0xe000000
    af00:	11844b03 	orrne	r4, r4, r3, lsl #22
    af04:	01844c83 	orreq	r4, r4, r3, lsl #25
    af08:	f57ff04e 	dsb	st
    af0c:	ebfffffe 	bl	0 <arm_heavy_mb>
    af10:	e5953d6c 	ldr	r3, [r5, #3436]	; 0xd6c
    af14:	e5834004 	str	r4, [r3, #4]
    af18:	e8bd8070 	pop	{r4, r5, r6, pc}
    af1c:	e3520000 	cmp	r2, #0
    af20:	13c44807 	bicne	r4, r4, #458752	; 0x70000
    af24:	03c4470e 	biceq	r4, r4, #3670016	; 0x380000
    af28:	11844803 	orrne	r4, r4, r3, lsl #16
    af2c:	01844983 	orreq	r4, r4, r3, lsl #19
    af30:	eafffff4 	b	af08 <_ipu_smfc_set_wmc+0x5c>
    af34:	e30f0fc0 	movw	r0, #65472	; 0xffc0
    af38:	e3400fff 	movt	r0, #4095	; 0xfff
    af3c:	e1510000 	cmp	r1, r0
    af40:	18bd8070 	popne	{r4, r5, r6, pc}
    af44:	e3520000 	cmp	r2, #0
    af48:	13c44007 	bicne	r4, r4, #7
    af4c:	03c44038 	biceq	r4, r4, #56	; 0x38
    af50:	11834004 	orrne	r4, r3, r4
    af54:	01844183 	orreq	r4, r4, r3, lsl #3
    af58:	eaffffea 	b	af08 <_ipu_smfc_set_wmc+0x5c>
    af5c:	e3520000 	cmp	r2, #0
    af60:	13c44d07 	bicne	r4, r4, #448	; 0x1c0
    af64:	03c44c0e 	biceq	r4, r4, #3584	; 0xe00
    af68:	11844303 	orrne	r4, r4, r3, lsl #6
    af6c:	01844483 	orreq	r4, r4, r3, lsl #9
    af70:	eaffffe4 	b	af08 <_ipu_smfc_set_wmc+0x5c>

0000af74 <_ipu_smfc_set_burst_size>:
    af74:	e92d4070 	push	{r4, r5, r6, lr}
    af78:	e2805a01 	add	r5, r0, #4096	; 0x1000
    af7c:	e5953d6c 	ldr	r3, [r5, #3436]	; 0xd6c
    af80:	e5934008 	ldr	r4, [r3, #8]
    af84:	f57ff04f 	dsb	sy
    af88:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    af8c:	e34130ff 	movt	r3, #4351	; 0x10ff
    af90:	e1510003 	cmp	r1, r3
    af94:	0a000019 	beq	b000 <_ipu_smfc_set_burst_size+0x8c>
    af98:	da000011 	ble	afe4 <_ipu_smfc_set_burst_size+0x70>
    af9c:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    afa0:	e34131ff 	movt	r3, #4607	; 0x11ff
    afa4:	e1510003 	cmp	r1, r3
    afa8:	0a00000a 	beq	afd8 <_ipu_smfc_set_burst_size+0x64>
    afac:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    afb0:	e34132ff 	movt	r3, #4863	; 0x12ff
    afb4:	e1510003 	cmp	r1, r3
    afb8:	18bd8070 	popne	{r4, r5, r6, pc}
    afbc:	e3c44a0f 	bic	r4, r4, #61440	; 0xf000
    afc0:	e1844602 	orr	r4, r4, r2, lsl #12
    afc4:	f57ff04e 	dsb	st
    afc8:	ebfffffe 	bl	0 <arm_heavy_mb>
    afcc:	e5953d6c 	ldr	r3, [r5, #3436]	; 0xd6c
    afd0:	e5834008 	str	r4, [r3, #8]
    afd4:	e8bd8070 	pop	{r4, r5, r6, pc}
    afd8:	e3c44c0f 	bic	r4, r4, #3840	; 0xf00
    afdc:	e1844402 	orr	r4, r4, r2, lsl #8
    afe0:	eafffff7 	b	afc4 <_ipu_smfc_set_burst_size+0x50>
    afe4:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    afe8:	e3403fff 	movt	r3, #4095	; 0xfff
    afec:	e1510003 	cmp	r1, r3
    aff0:	18bd8070 	popne	{r4, r5, r6, pc}
    aff4:	e3c4400f 	bic	r4, r4, #15
    aff8:	e1824004 	orr	r4, r2, r4
    affc:	eafffff0 	b	afc4 <_ipu_smfc_set_burst_size+0x50>
    b000:	e3c440f0 	bic	r4, r4, #240	; 0xf0
    b004:	e1844202 	orr	r4, r4, r2, lsl #4
    b008:	eaffffed 	b	afc4 <_ipu_smfc_set_burst_size+0x50>

0000b00c <_ipu_csi_init>:
    b00c:	e30f3fc2 	movw	r3, #65474	; 0xffc2
    b010:	e34131ff 	movt	r3, #4607	; 0x11ff
    b014:	e1510003 	cmp	r1, r3
    b018:	0a000025 	beq	b0b4 <_ipu_csi_init+0xa8>
    b01c:	da00001c 	ble	b094 <_ipu_csi_init+0x88>
    b020:	e30f3fd4 	movw	r3, #65492	; 0xffd4
    b024:	e34133ff 	movt	r3, #5119	; 0x13ff
    b028:	e1510003 	cmp	r1, r3
    b02c:	0a000009 	beq	b058 <_ipu_csi_init+0x4c>
    b030:	e30f3fd5 	movw	r3, #65493	; 0xffd5
    b034:	e34134ff 	movt	r3, #5375	; 0x14ff
    b038:	e1510003 	cmp	r1, r3
    b03c:	0a000005 	beq	b058 <_ipu_csi_init+0x4c>
    b040:	e30f3fc3 	movw	r3, #65475	; 0xffc3
    b044:	e34132ff 	movt	r3, #4863	; 0x12ff
    b048:	e1510003 	cmp	r1, r3
    b04c:	0a000018 	beq	b0b4 <_ipu_csi_init+0xa8>
    b050:	e3e00015 	mvn	r0, #21
    b054:	e12fff1e 	bx	lr
    b058:	e3a03402 	mov	r3, #33554432	; 0x2000000
    b05c:	e92d4070 	push	{r4, r5, r6, lr}
    b060:	e0804102 	add	r4, r0, r2, lsl #2
    b064:	e2844a01 	add	r4, r4, #4096	; 0x1000
    b068:	e5942d70 	ldr	r2, [r4, #3440]	; 0xd70
    b06c:	e5925000 	ldr	r5, [r2]
    b070:	f57ff04f 	dsb	sy
    b074:	e3c55407 	bic	r5, r5, #117440512	; 0x7000000
    b078:	e1855003 	orr	r5, r5, r3
    b07c:	f57ff04e 	dsb	st
    b080:	ebfffffe 	bl	0 <arm_heavy_mb>
    b084:	e5943d70 	ldr	r3, [r4, #3440]	; 0xd70
    b088:	e5835000 	str	r5, [r3]
    b08c:	e3a00000 	mov	r0, #0
    b090:	e8bd8070 	pop	{r4, r5, r6, pc}
    b094:	e30f3fc0 	movw	r3, #65472	; 0xffc0
    b098:	e3403fff 	movt	r3, #4095	; 0xfff
    b09c:	e1510003 	cmp	r1, r3
    b0a0:	0a000003 	beq	b0b4 <_ipu_csi_init+0xa8>
    b0a4:	e30f3fc1 	movw	r3, #65473	; 0xffc1
    b0a8:	e34130ff 	movt	r3, #4351	; 0x10ff
    b0ac:	e1510003 	cmp	r1, r3
    b0b0:	1affffe6 	bne	b050 <_ipu_csi_init+0x44>
    b0b4:	e3a03301 	mov	r3, #67108864	; 0x4000000
    b0b8:	eaffffe7 	b	b05c <_ipu_csi_init+0x50>

0000b0bc <_ipu_csi_wait4eof>:
    b0bc:	e12fff1e 	bx	lr

0000b0c0 <m_calc>:
    b0c0:	e3053659 	movw	r3, #22105	; 0x5659
    b0c4:	e3433231 	movt	r3, #12849	; 0x3231
    b0c8:	e1500003 	cmp	r0, r3
    b0cc:	0a000016 	beq	b12c <m_calc+0x6c>
    b0d0:	9a00000d 	bls	b10c <m_calc+0x4c>
    b0d4:	e3033234 	movw	r3, #12852	; 0x3234
    b0d8:	e3453032 	movt	r3, #20530	; 0x5032
    b0dc:	e1500003 	cmp	r0, r3
    b0e0:	0a000011 	beq	b12c <m_calc+0x6c>
    b0e4:	e3033434 	movw	r3, #13364	; 0x3434
    b0e8:	e3453034 	movt	r3, #20532	; 0x5034
    b0ec:	e1500003 	cmp	r0, r3
    b0f0:	0a00000d 	beq	b12c <m_calc+0x6c>
    b0f4:	e3053659 	movw	r3, #22105	; 0x5659
    b0f8:	e3433631 	movt	r3, #13873	; 0x3631
    b0fc:	e1500003 	cmp	r0, r3
    b100:	0a000009 	beq	b12c <m_calc+0x6c>
    b104:	e3a00008 	mov	r0, #8
    b108:	e12fff1e 	bx	lr
    b10c:	e3033449 	movw	r3, #13385	; 0x3449
    b110:	e3433032 	movt	r3, #12338	; 0x3032
    b114:	e1500003 	cmp	r0, r3
    b118:	0a000003 	beq	b12c <m_calc+0x6c>
    b11c:	e3053559 	movw	r3, #21849	; 0x5559
    b120:	e3433231 	movt	r3, #12849	; 0x3231
    b124:	e1500003 	cmp	r0, r3
    b128:	1afffff5 	bne	b104 <m_calc+0x44>
    b12c:	e3a00010 	mov	r0, #16
    b130:	e12fff1e 	bx	lr

0000b134 <truncate>:
    b134:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    b138:	e1a06002 	mov	r6, r2
    b13c:	e1a07003 	mov	r7, r3
    b140:	e1a02003 	mov	r2, r3
    b144:	e3a03000 	mov	r3, #0
    b148:	e1a08000 	mov	r8, r0
    b14c:	e1921003 	orrs	r1, r2, r3
    b150:	e59d5018 	ldr	r5, [sp, #24]
    b154:	1a000007 	bne	b178 <truncate+0x44>
    b158:	e3580000 	cmp	r8, #0
    b15c:	e0000593 	mul	r0, r3, r5
    b160:	08bd81f0 	popeq	{r4, r5, r6, r7, r8, pc}
    b164:	e1500007 	cmp	r0, r7
    b168:	e3a02000 	mov	r2, #0
    b16c:	01520006 	cmpeq	r2, r6
    b170:	30800005 	addcc	r0, r0, r5
    b174:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    b178:	e1a04005 	mov	r4, r5
    b17c:	e1a00006 	mov	r0, r6
    b180:	e1a01007 	mov	r1, r7
    b184:	ebfffffe 	bl	0 <__do_div64>
    b188:	eafffff2 	b	b158 <truncate+0x24>

0000b18c <calc_split_resize_coeffs>:
    b18c:	e3500a01 	cmp	r0, #4096	; 0x1000
    b190:	e92d4030 	push	{r4, r5, lr}
    b194:	e1a04000 	mov	r4, r0
    b198:	e24dd01c 	sub	sp, sp, #28
    b19c:	9a000007 	bls	b1c0 <calc_split_resize_coeffs+0x34>
    b1a0:	e3000000 	movw	r0, #0
    b1a4:	e3400000 	movt	r0, #0
    b1a8:	e1d031b2 	ldrh	r3, [r0, #18]
    b1ac:	e3130004 	tst	r3, #4
    b1b0:	1a000042 	bne	b2c0 <calc_split_resize_coeffs+0x134>
    b1b4:	e3e00015 	mvn	r0, #21
    b1b8:	e28dd01c 	add	sp, sp, #28
    b1bc:	e8bd8030 	pop	{r4, r5, pc}
    b1c0:	e3510b01 	cmp	r1, #1024	; 0x400
    b1c4:	e1a05001 	mov	r5, r1
    b1c8:	9a00000b 	bls	b1fc <calc_split_resize_coeffs+0x70>
    b1cc:	e3000000 	movw	r0, #0
    b1d0:	e3400000 	movt	r0, #0
    b1d4:	e1d032ba 	ldrh	r3, [r0, #42]	; 0x2a
    b1d8:	e3130004 	tst	r3, #4
    b1dc:	0afffff4 	beq	b1b4 <calc_split_resize_coeffs+0x28>
    b1e0:	e3001000 	movw	r1, #0
    b1e4:	e2800018 	add	r0, r0, #24
    b1e8:	e1a02005 	mov	r2, r5
    b1ec:	e3401000 	movt	r1, #0
    b1f0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    b1f4:	e3e00015 	mvn	r0, #21
    b1f8:	eaffffee 	b	b1b8 <calc_split_resize_coeffs+0x2c>
    b1fc:	e1500181 	cmp	r0, r1, lsl #3
    b200:	8a000023 	bhi	b294 <calc_split_resize_coeffs+0x108>
    b204:	e3500b01 	cmp	r0, #1024	; 0x400
    b208:	e1a01081 	lsl	r1, r1, #1
    b20c:	8a000001 	bhi	b218 <calc_split_resize_coeffs+0x8c>
    b210:	e1500001 	cmp	r0, r1
    b214:	3a000049 	bcc	b340 <calc_split_resize_coeffs+0x1b4>
    b218:	e1a000a4 	lsr	r0, r4, #1
    b21c:	e3500b01 	cmp	r0, #1024	; 0x400
    b220:	8a000002 	bhi	b230 <calc_split_resize_coeffs+0xa4>
    b224:	e1510000 	cmp	r1, r0
    b228:	83a01001 	movhi	r1, #1
    b22c:	8a000001 	bhi	b238 <calc_split_resize_coeffs+0xac>
    b230:	e1a00124 	lsr	r0, r4, #2
    b234:	e3a01002 	mov	r1, #2
    b238:	e240037f 	sub	r0, r0, #-67108863	; 0xfc000001
    b23c:	e5831000 	str	r1, [r3]
    b240:	e24007fe 	sub	r0, r0, #66584576	; 0x3f80000
    b244:	e2451001 	sub	r1, r5, #1
    b248:	e1a00680 	lsl	r0, r0, #13
    b24c:	e58d2014 	str	r2, [sp, #20]
    b250:	e58d3010 	str	r3, [sp, #16]
    b254:	ebfffffe 	bl	0 <__aeabi_uidiv>
    b258:	e59d2014 	ldr	r2, [sp, #20]
    b25c:	e3500901 	cmp	r0, #16384	; 0x4000
    b260:	e59d3010 	ldr	r3, [sp, #16]
    b264:	e5820000 	str	r0, [r2]
    b268:	3a00001a 	bcc	b2d8 <calc_split_resize_coeffs+0x14c>
    b26c:	e3000000 	movw	r0, #0
    b270:	e3400000 	movt	r0, #0
    b274:	e1d035ba 	ldrh	r3, [r0, #90]	; 0x5a
    b278:	e3130004 	tst	r3, #4
    b27c:	0affffcc 	beq	b1b4 <calc_split_resize_coeffs+0x28>
    b280:	e3001000 	movw	r1, #0
    b284:	e2800048 	add	r0, r0, #72	; 0x48
    b288:	e3401000 	movt	r1, #0
    b28c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    b290:	eaffffc7 	b	b1b4 <calc_split_resize_coeffs+0x28>
    b294:	e3000000 	movw	r0, #0
    b298:	e3400000 	movt	r0, #0
    b29c:	e1d034b2 	ldrh	r3, [r0, #66]	; 0x42
    b2a0:	e3130004 	tst	r3, #4
    b2a4:	0affffc2 	beq	b1b4 <calc_split_resize_coeffs+0x28>
    b2a8:	e3001000 	movw	r1, #0
    b2ac:	e2800030 	add	r0, r0, #48	; 0x30
    b2b0:	e3401000 	movt	r1, #0
    b2b4:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    b2b8:	e3e00015 	mvn	r0, #21
    b2bc:	eaffffbd 	b	b1b8 <calc_split_resize_coeffs+0x2c>
    b2c0:	e3001000 	movw	r1, #0
    b2c4:	e1a02004 	mov	r2, r4
    b2c8:	e3401000 	movt	r1, #0
    b2cc:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    b2d0:	e3e00015 	mvn	r0, #21
    b2d4:	eaffffb7 	b	b1b8 <calc_split_resize_coeffs+0x2c>
    b2d8:	e300c000 	movw	ip, #0
    b2dc:	e340c000 	movt	ip, #0
    b2e0:	e1dc27b2 	ldrh	r2, [ip, #114]	; 0x72
    b2e4:	e7e02152 	ubfx	r2, r2, #2, #1
    b2e8:	e3520000 	cmp	r2, #0
    b2ec:	1a000001 	bne	b2f8 <calc_split_resize_coeffs+0x16c>
    b2f0:	e3a00000 	mov	r0, #0
    b2f4:	eaffffaf 	b	b1b8 <calc_split_resize_coeffs+0x2c>
    b2f8:	e7ec2050 	ubfx	r2, r0, #0, #13
    b2fc:	e302e710 	movw	lr, #10000	; 0x2710
    b300:	e00e029e 	mul	lr, lr, r2
    b304:	e5931000 	ldr	r1, [r3]
    b308:	e3500a02 	cmp	r0, #8192	; 0x2000
    b30c:	e58d000c 	str	r0, [sp, #12]
    b310:	33a02000 	movcc	r2, #0
    b314:	23a02001 	movcs	r2, #1
    b318:	e1a03005 	mov	r3, r5
    b31c:	e1a0e6ae 	lsr	lr, lr, #13
    b320:	e88d0006 	stm	sp, {r1, r2}
    b324:	e3001000 	movw	r1, #0
    b328:	e1a02004 	mov	r2, r4
    b32c:	e28c0060 	add	r0, ip, #96	; 0x60
    b330:	e58de008 	str	lr, [sp, #8]
    b334:	e3401000 	movt	r1, #0
    b338:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    b33c:	eaffffeb 	b	b2f0 <calc_split_resize_coeffs+0x164>
    b340:	e3a01000 	mov	r1, #0
    b344:	eaffffbb 	b	b238 <calc_split_resize_coeffs+0xac>

0000b348 <ipu_calc_stripes_sizes>:
    b348:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b34c:	e24dd08c 	sub	sp, sp, #140	; 0x8c
    b350:	e59d30b8 	ldr	r3, [sp, #184]	; 0xb8
    b354:	e1a05000 	mov	r5, r0
    b358:	e58d1030 	str	r1, [sp, #48]	; 0x30
    b35c:	e3130002 	tst	r3, #2
    b360:	e58d2034 	str	r2, [sp, #52]	; 0x34
    b364:	1a00001c 	bne	b3dc <ipu_calc_stripes_sizes+0x94>
    b368:	e59d20bc 	ldr	r2, [sp, #188]	; 0xbc
    b36c:	e3053659 	movw	r3, #22105	; 0x5659
    b370:	e3433631 	movt	r3, #13873	; 0x3631
    b374:	e1520003 	cmp	r2, r3
    b378:	0a000069 	beq	b524 <ipu_calc_stripes_sizes+0x1dc>
    b37c:	9a00005a 	bls	b4ec <ipu_calc_stripes_sizes+0x1a4>
    b380:	e59d20bc 	ldr	r2, [sp, #188]	; 0xbc
    b384:	e3043752 	movw	r3, #18258	; 0x4752
    b388:	e3453042 	movt	r3, #20546	; 0x5042
    b38c:	e1520003 	cmp	r2, r3
    b390:	0a000009 	beq	b3bc <ipu_calc_stripes_sizes+0x74>
    b394:	9a00004a 	bls	b4c4 <ipu_calc_stripes_sizes+0x17c>
    b398:	e59d20bc 	ldr	r2, [sp, #188]	; 0xbc
    b39c:	e3053559 	movw	r3, #21849	; 0x5559
    b3a0:	e3453659 	movt	r3, #22105	; 0x5659
    b3a4:	e1520003 	cmp	r2, r3
    b3a8:	0a000003 	beq	b3bc <ipu_calc_stripes_sizes+0x74>
    b3ac:	e3053955 	movw	r3, #22869	; 0x5955
    b3b0:	e3453956 	movt	r3, #22870	; 0x5956
    b3b4:	e1520003 	cmp	r2, r3
    b3b8:	1a000049 	bne	b4e4 <ipu_calc_stripes_sizes+0x19c>
    b3bc:	e3a0b008 	mov	fp, #8
    b3c0:	e59d00bc 	ldr	r0, [sp, #188]	; 0xbc
    b3c4:	ebffff3d 	bl	b0c0 <m_calc>
    b3c8:	e1a09000 	mov	r9, r0
    b3cc:	e59d00c0 	ldr	r0, [sp, #192]	; 0xc0
    b3d0:	ebffff3a 	bl	b0c0 <m_calc>
    b3d4:	e1a08000 	mov	r8, r0
    b3d8:	ea000002 	b	b3e8 <ipu_calc_stripes_sizes+0xa0>
    b3dc:	e3a08002 	mov	r8, #2
    b3e0:	e3a09008 	mov	r9, #8
    b3e4:	e1a0b008 	mov	fp, r8
    b3e8:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    b3ec:	e3530003 	cmp	r3, #3
    b3f0:	83550003 	cmphi	r5, #3
    b3f4:	93a00001 	movls	r0, #1
    b3f8:	83a00000 	movhi	r0, #0
    b3fc:	9a00002d 	bls	b4b8 <ipu_calc_stripes_sizes+0x170>
    b400:	e59d6030 	ldr	r6, [sp, #48]	; 0x30
    b404:	e16f7f18 	clz	r7, r8
    b408:	e3590000 	cmp	r9, #0
    b40c:	e1a072a7 	lsr	r7, r7, #5
    b410:	e245a001 	sub	sl, r5, #1
    b414:	e2464001 	sub	r4, r6, #1
    b418:	03a07001 	moveq	r7, #1
    b41c:	e1a0100a 	mov	r1, sl
    b420:	ebfffffe 	bl	0 <__do_div64>
    b424:	e1a01004 	mov	r1, r4
    b428:	e1cd24f0 	strd	r2, [sp, #64]	; 0x40
    b42c:	e1a0400a 	mov	r4, sl
    b430:	ebfffffe 	bl	0 <__do_div64>
    b434:	e3570000 	cmp	r7, #0
    b438:	e58d2038 	str	r2, [sp, #56]	; 0x38
    b43c:	e1a0c003 	mov	ip, r3
    b440:	e58d303c 	str	r3, [sp, #60]	; 0x3c
    b444:	1a00001b 	bne	b4b8 <ipu_calc_stripes_sizes+0x170>
    b448:	e1a0408b 	lsl	r4, fp, #1
    b44c:	e1540005 	cmp	r4, r5
    b450:	8a000018 	bhi	b4b8 <ipu_calc_stripes_sizes+0x170>
    b454:	e083229b 	umull	r2, r3, fp, r2
    b458:	e58d604c 	str	r6, [sp, #76]	; 0x4c
    b45c:	e58d7048 	str	r7, [sp, #72]	; 0x48
    b460:	e1cd25f0 	strd	r2, [sp, #80]	; 0x50
    b464:	e59d3054 	ldr	r3, [sp, #84]	; 0x54
    b468:	e0233c9b 	mla	r3, fp, ip, r3
    b46c:	e58d3054 	str	r3, [sp, #84]	; 0x54
    b470:	e1cd25d0 	ldrd	r2, [sp, #80]	; 0x50
    b474:	e0971002 	adds	r1, r7, r2
    b478:	e0a90003 	adc	r0, r9, r3
    b47c:	e0913001 	adds	r3, r1, r1
    b480:	e58d3058 	str	r3, [sp, #88]	; 0x58
    b484:	e0a03000 	adc	r3, r0, r0
    b488:	e58d305c 	str	r3, [sp, #92]	; 0x5c
    b48c:	e1cd05d8 	ldrd	r0, [sp, #88]	; 0x58
    b490:	e1cd24d8 	ldrd	r2, [sp, #72]	; 0x48
    b494:	e1530001 	cmp	r3, r1
    b498:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    b49c:	01520000 	cmpeq	r2, r0
    b4a0:	33a01001 	movcc	r1, #1
    b4a4:	23a01000 	movcs	r1, #0
    b4a8:	e1590003 	cmp	r9, r3
    b4ac:	83811001 	orrhi	r1, r1, #1
    b4b0:	e3510000 	cmp	r1, #0
    b4b4:	0a000021 	beq	b540 <ipu_calc_stripes_sizes+0x1f8>
    b4b8:	e3a00001 	mov	r0, #1
    b4bc:	e28dd08c 	add	sp, sp, #140	; 0x8c
    b4c0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    b4c4:	e3033234 	movw	r3, #12852	; 0x3234
    b4c8:	e3453032 	movt	r3, #20530	; 0x5032
    b4cc:	e1520003 	cmp	r2, r3
    b4d0:	0a000013 	beq	b524 <ipu_calc_stripes_sizes+0x1dc>
    b4d4:	e3033434 	movw	r3, #13364	; 0x3434
    b4d8:	e3453034 	movt	r3, #20532	; 0x5034
    b4dc:	e1520003 	cmp	r2, r3
    b4e0:	0a00000f 	beq	b524 <ipu_calc_stripes_sizes+0x1dc>
    b4e4:	e3a0b002 	mov	fp, #2
    b4e8:	eaffffb4 	b	b3c0 <ipu_calc_stripes_sizes+0x78>
    b4ec:	e3053559 	movw	r3, #21849	; 0x5559
    b4f0:	e3433231 	movt	r3, #12849	; 0x3231
    b4f4:	e1520003 	cmp	r2, r3
    b4f8:	0a000009 	beq	b524 <ipu_calc_stripes_sizes+0x1dc>
    b4fc:	9a00000a 	bls	b52c <ipu_calc_stripes_sizes+0x1e4>
    b500:	e59d20bc 	ldr	r2, [sp, #188]	; 0xbc
    b504:	e305364e 	movw	r3, #22094	; 0x564e
    b508:	e3433231 	movt	r3, #12849	; 0x3231
    b50c:	e1520003 	cmp	r2, r3
    b510:	0affffa9 	beq	b3bc <ipu_calc_stripes_sizes+0x74>
    b514:	e3053659 	movw	r3, #22105	; 0x5659
    b518:	e3433231 	movt	r3, #12849	; 0x3231
    b51c:	e1520003 	cmp	r2, r3
    b520:	1affffef 	bne	b4e4 <ipu_calc_stripes_sizes+0x19c>
    b524:	e3a0b010 	mov	fp, #16
    b528:	eaffffa4 	b	b3c0 <ipu_calc_stripes_sizes+0x78>
    b52c:	e3033449 	movw	r3, #13385	; 0x3449
    b530:	e3433032 	movt	r3, #12338	; 0x3032
    b534:	e1520003 	cmp	r2, r3
    b538:	1affffe9 	bne	b4e4 <ipu_calc_stripes_sizes+0x19c>
    b53c:	eafffff8 	b	b524 <ipu_calc_stripes_sizes+0x1dc>
    b540:	e59d30b8 	ldr	r3, [sp, #184]	; 0xb8
    b544:	e59d2034 	ldr	r2, [sp, #52]	; 0x34
    b548:	e1e03003 	mvn	r3, r3
    b54c:	e1560002 	cmp	r6, r2
    b550:	83a07000 	movhi	r7, #0
    b554:	92037001 	andls	r7, r3, #1
    b558:	e3570000 	cmp	r7, #0
    b55c:	1affffd5 	bne	b4b8 <ipu_calc_stripes_sizes+0x170>
    b560:	e1560082 	cmp	r6, r2, lsl #1
    b564:	8affffd3 	bhi	b4b8 <ipu_calc_stripes_sizes+0x170>
    b568:	e1a01008 	mov	r1, r8
    b56c:	e1a00009 	mov	r0, r9
    b570:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    b574:	e3510000 	cmp	r1, #0
    b578:	e1cd24d8 	ldrd	r2, [sp, #72]	; 0x48
    b57c:	e1a00007 	mov	r0, r7
    b580:	e58d8000 	str	r8, [sp]
    b584:	13a07002 	movne	r7, #2
    b588:	03a07000 	moveq	r7, #0
    b58c:	e58d7058 	str	r7, [sp, #88]	; 0x58
    b590:	ebfffee7 	bl	b134 <truncate>
    b594:	e1560000 	cmp	r6, r0
    b598:	82873004 	addhi	r3, r7, #4
    b59c:	858d0030 	strhi	r0, [sp, #48]	; 0x30
    b5a0:	858d3058 	strhi	r3, [sp, #88]	; 0x58
    b5a4:	e3003000 	movw	r3, #0
    b5a8:	e3403000 	movt	r3, #0
    b5ac:	e58d3050 	str	r3, [sp, #80]	; 0x50
    b5b0:	e1d338ba 	ldrh	r3, [r3, #138]	; 0x8a
    b5b4:	e3130004 	tst	r3, #4
    b5b8:	1a00019d 	bne	bc34 <ipu_calc_stripes_sizes+0x8ec>
    b5bc:	e59d30b8 	ldr	r3, [sp, #184]	; 0xb8
    b5c0:	e2133001 	ands	r3, r3, #1
    b5c4:	e58d3048 	str	r3, [sp, #72]	; 0x48
    b5c8:	0a000048 	beq	b6f0 <ipu_calc_stripes_sizes+0x3a8>
    b5cc:	e1cd2bd0 	ldrd	r2, [sp, #176]	; 0xb0
    b5d0:	e1cd04d0 	ldrd	r0, [sp, #64]	; 0x40
    b5d4:	e1530001 	cmp	r3, r1
    b5d8:	01520000 	cmpeq	r2, r0
    b5dc:	2a00011a 	bcs	ba4c <ipu_calc_stripes_sizes+0x704>
    b5e0:	e1a03089 	lsl	r3, r9, #1
    b5e4:	e1a00005 	mov	r0, r5
    b5e8:	e1a01003 	mov	r1, r3
    b5ec:	e1a06003 	mov	r6, r3
    b5f0:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    b5f4:	e3510000 	cmp	r1, #0
    b5f8:	1a000113 	bne	ba4c <ipu_calc_stripes_sizes+0x704>
    b5fc:	e1a01004 	mov	r1, r4
    b600:	e1a00005 	mov	r0, r5
    b604:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    b608:	e3510000 	cmp	r1, #0
    b60c:	1a00010e 	bne	ba4c <ipu_calc_stripes_sizes+0x704>
    b610:	e59d4030 	ldr	r4, [sp, #48]	; 0x30
    b614:	e1a01088 	lsl	r1, r8, #1
    b618:	e1a00004 	mov	r0, r4
    b61c:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    b620:	e3510000 	cmp	r1, #0
    b624:	1a000108 	bne	ba4c <ipu_calc_stripes_sizes+0x704>
    b628:	e1a01006 	mov	r1, r6
    b62c:	e1a00004 	mov	r0, r4
    b630:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    b634:	e2512000 	subs	r2, r1, #0
    b638:	e1a07002 	mov	r7, r2
    b63c:	1a000102 	bne	ba4c <ipu_calc_stripes_sizes+0x704>
    b640:	e59d10c8 	ldr	r1, [sp, #200]	; 0xc8
    b644:	e1a030a5 	lsr	r3, r5, #1
    b648:	e1a060a4 	lsr	r6, r4, #1
    b64c:	e1a05002 	mov	r5, r2
    b650:	e5813008 	str	r3, [r1, #8]
    b654:	e5813000 	str	r3, [r1]
    b658:	e59d10c4 	ldr	r1, [sp, #196]	; 0xc4
    b65c:	e5813000 	str	r3, [r1]
    b660:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    b664:	e583600c 	str	r6, [r3, #12]
    b668:	e5836004 	str	r6, [r3, #4]
    b66c:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    b670:	e5812008 	str	r2, [r1, #8]
    b674:	e581200c 	str	r2, [r1, #12]
    b678:	e5816004 	str	r6, [r1, #4]
    b67c:	e5931000 	ldr	r1, [r3]
    b680:	e2411001 	sub	r1, r1, #1
    b684:	e1a01681 	lsl	r1, r1, #13
    b688:	e1a04001 	mov	r4, r1
    b68c:	e1943005 	orrs	r3, r4, r5
    b690:	01a02001 	moveq	r2, r1
    b694:	01a03007 	moveq	r3, r7
    b698:	1a0001a9 	bne	bd44 <ipu_calc_stripes_sizes+0x9fc>
    b69c:	e3a01001 	mov	r1, #1
    b6a0:	e3a00000 	mov	r0, #0
    b6a4:	e58d1000 	str	r1, [sp]
    b6a8:	e3a04000 	mov	r4, #0
    b6ac:	e58d0034 	str	r0, [sp, #52]	; 0x34
    b6b0:	e1a06004 	mov	r6, r4
    b6b4:	ebfffe9e 	bl	b134 <truncate>
    b6b8:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    b6bc:	e5830014 	str	r0, [r3, #20]
    b6c0:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    b6c4:	e5830014 	str	r0, [r3, #20]
    b6c8:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    b6cc:	e1c300d0 	ldrd	r0, [r3]
    b6d0:	e1500001 	cmp	r0, r1
    b6d4:	8a000147 	bhi	bbf8 <ipu_calc_stripes_sizes+0x8b0>
    b6d8:	e59d3050 	ldr	r3, [sp, #80]	; 0x50
    b6dc:	e1d33ab2 	ldrh	r3, [r3, #162]	; 0xa2
    b6e0:	e3130004 	tst	r3, #4
    b6e4:	1a00016b 	bne	bc98 <ipu_calc_stripes_sizes+0x950>
    b6e8:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    b6ec:	eaffff72 	b	b4bc <ipu_calc_stripes_sizes+0x174>
    b6f0:	e59d0048 	ldr	r0, [sp, #72]	; 0x48
    b6f4:	e59d4034 	ldr	r4, [sp, #52]	; 0x34
    b6f8:	e58d9000 	str	r9, [sp]
    b6fc:	e2903000 	adds	r3, r0, #0
    b700:	e2a51004 	adc	r1, r5, #4
    b704:	e1a02004 	mov	r2, r4
    b708:	e58d3068 	str	r3, [sp, #104]	; 0x68
    b70c:	e1a03000 	mov	r3, r0
    b710:	e58d106c 	str	r1, [sp, #108]	; 0x6c
    b714:	ebfffe86 	bl	b134 <truncate>
    b718:	e59d1030 	ldr	r1, [sp, #48]	; 0x30
    b71c:	e1a03000 	mov	r3, r0
    b720:	e1cd64d0 	ldrd	r6, [sp, #64]	; 0x40
    b724:	e58db000 	str	fp, [sp]
    b728:	e0412000 	sub	r2, r1, r0
    b72c:	e0411004 	sub	r1, r1, r4
    b730:	e3520001 	cmp	r2, #1
    b734:	e58d1034 	str	r1, [sp, #52]	; 0x34
    b738:	00403009 	subeq	r3, r0, r9
    b73c:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
    b740:	e0810693 	umull	r0, r1, r3, r6
    b744:	e2422001 	sub	r2, r2, #1
    b748:	e58d2040 	str	r2, [sp, #64]	; 0x40
    b74c:	e1cd05f0 	strd	r0, [sp, #80]	; 0x50
    b750:	e3a00000 	mov	r0, #0
    b754:	e59d1054 	ldr	r1, [sp, #84]	; 0x54
    b758:	e0231793 	mla	r3, r3, r7, r1
    b75c:	e58d3054 	str	r3, [sp, #84]	; 0x54
    b760:	e1cd25d0 	ldrd	r2, [sp, #80]	; 0x50
    b764:	ebfffe72 	bl	b134 <truncate>
    b768:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    b76c:	e1a08000 	mov	r8, r0
    b770:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    b774:	e3a00001 	mov	r0, #1
    b778:	e58d9000 	str	r9, [sp]
    b77c:	e04a4008 	sub	r4, sl, r8
    b780:	e1a0a688 	lsl	sl, r8, #13
    b784:	e0832398 	umull	r2, r3, r8, r3
    b788:	e0233198 	mla	r3, r8, r1, r3
    b78c:	ebfffe68 	bl	b134 <truncate>
    b790:	e1a0368b 	lsl	r3, fp, #13
    b794:	e58d5070 	str	r5, [sp, #112]	; 0x70
    b798:	e1a07000 	mov	r7, r0
    b79c:	e1a05004 	mov	r5, r4
    b7a0:	e2636000 	rsb	r6, r3, #0
    b7a4:	e58d6050 	str	r6, [sp, #80]	; 0x50
    b7a8:	e35a0000 	cmp	sl, #0
    b7ac:	e3a02000 	mov	r2, #0
    b7b0:	e3a03000 	mov	r3, #0
    b7b4:	1a0000ff 	bne	bbb8 <ipu_calc_stripes_sizes+0x870>
    b7b8:	e3a01001 	mov	r1, #1
    b7bc:	e3a00000 	mov	r0, #0
    b7c0:	e58d1000 	str	r1, [sp]
    b7c4:	e59d1050 	ldr	r1, [sp, #80]	; 0x50
    b7c8:	e08aa001 	add	sl, sl, r1
    b7cc:	ebfffe58 	bl	b134 <truncate>
    b7d0:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    b7d4:	e1a02000 	mov	r2, r0
    b7d8:	e59dc0c4 	ldr	ip, [sp, #196]	; 0xc4
    b7dc:	e0030297 	mul	r3, r7, r2
    b7e0:	e1a0e005 	mov	lr, r5
    b7e4:	e3a00001 	mov	r0, #1
    b7e8:	e0417007 	sub	r7, r1, r7
    b7ec:	e58c2014 	str	r2, [ip, #20]
    b7f0:	e0020792 	mul	r2, r2, r7
    b7f4:	e1a03983 	lsl	r3, r3, #19
    b7f8:	e3a01000 	mov	r1, #0
    b7fc:	e1cd66d8 	ldrd	r6, [sp, #104]	; 0x68
    b800:	e0513003 	subs	r3, r1, r3
    b804:	e085500b 	add	r5, r5, fp
    b808:	e1a0c982 	lsl	ip, r2, #19
    b80c:	e1a03103 	lsl	r3, r3, #2
    b810:	e1a026a2 	lsr	r2, r2, #13
    b814:	e051c00c 	subs	ip, r1, ip
    b818:	e0ce2002 	sbc	r2, lr, r2
    b81c:	e093300c 	adds	r3, r3, ip
    b820:	e58d3060 	str	r3, [sp, #96]	; 0x60
    b824:	e0a13002 	adc	r3, r1, r2
    b828:	e58d3064 	str	r3, [sp, #100]	; 0x64
    b82c:	e1cd26d0 	ldrd	r2, [sp, #96]	; 0x60
    b830:	e1570003 	cmp	r7, r3
    b834:	01560002 	cmpeq	r6, r2
    b838:	81cd26f8 	strdhi	r2, [sp, #104]	; 0x68
    b83c:	858d8048 	strhi	r8, [sp, #72]	; 0x48
    b840:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    b844:	e048800b 	sub	r8, r8, fp
    b848:	e59d103c 	ldr	r1, [sp, #60]	; 0x3c
    b84c:	e58d9000 	str	r9, [sp]
    b850:	e0832398 	umull	r2, r3, r8, r3
    b854:	e0233198 	mla	r3, r8, r1, r3
    b858:	ebfffe35 	bl	b134 <truncate>
    b85c:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    b860:	e1a07000 	mov	r7, r0
    b864:	e1530000 	cmp	r3, r0
    b868:	9affffce 	bls	b7a8 <ipu_calc_stripes_sizes+0x460>
    b86c:	e59d4048 	ldr	r4, [sp, #72]	; 0x48
    b870:	e3a00001 	mov	r0, #1
    b874:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    b878:	e59dc03c 	ldr	ip, [sp, #60]	; 0x3c
    b87c:	e58d9000 	str	r9, [sp]
    b880:	e59d5070 	ldr	r5, [sp, #112]	; 0x70
    b884:	e0832394 	umull	r2, r3, r4, r3
    b888:	e0233c94 	mla	r3, r4, ip, r3
    b88c:	ebfffe28 	bl	b134 <truncate>
    b890:	e1b01684 	lsls	r1, r4, #13
    b894:	e1a07000 	mov	r7, r0
    b898:	03a02000 	moveq	r2, #0
    b89c:	03a03000 	moveq	r3, #0
    b8a0:	1a000123 	bne	bd34 <ipu_calc_stripes_sizes+0x9ec>
    b8a4:	e3a04001 	mov	r4, #1
    b8a8:	e3a00000 	mov	r0, #0
    b8ac:	e58d4000 	str	r4, [sp]
    b8b0:	ebfffe1f 	bl	b134 <truncate>
    b8b4:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    b8b8:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    b8bc:	e59d10c4 	ldr	r1, [sp, #196]	; 0xc4
    b8c0:	e0436007 	sub	r6, r3, r7
    b8c4:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    b8c8:	e5820014 	str	r0, [r2, #20]
    b8cc:	e3a02000 	mov	r2, #0
    b8d0:	e58d9000 	str	r9, [sp]
    b8d4:	e1a00004 	mov	r0, r4
    b8d8:	e5817004 	str	r7, [r1, #4]
    b8dc:	e0455003 	sub	r5, r5, r3
    b8e0:	e59d10c8 	ldr	r1, [sp, #200]	; 0xc8
    b8e4:	e0833004 	add	r3, r3, r4
    b8e8:	e5816004 	str	r6, [r1, #4]
    b8ec:	ebfffe10 	bl	b134 <truncate>
    b8f0:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    b8f4:	e1a03005 	mov	r3, r5
    b8f8:	e5820000 	str	r0, [r2]
    b8fc:	e3a02000 	mov	r2, #0
    b900:	e58d9000 	str	r9, [sp]
    b904:	e1a00004 	mov	r0, r4
    b908:	ebfffe09 	bl	b134 <truncate>
    b90c:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    b910:	e245337f 	sub	r3, r5, #-67108863	; 0xfc000001
    b914:	e24337fe 	sub	r3, r3, #66584576	; 0x3f80000
    b918:	e1b01683 	lsls	r1, r3, #13
    b91c:	e5926004 	ldr	r6, [r2, #4]
    b920:	e5820000 	str	r0, [r2]
    b924:	03a03000 	moveq	r3, #0
    b928:	03a02000 	moveq	r2, #0
    b92c:	e2466001 	sub	r6, r6, #1
    b930:	1a0000fb 	bne	bd24 <ipu_calc_stripes_sizes+0x9dc>
    b934:	e3a08001 	mov	r8, #1
    b938:	e3a00000 	mov	r0, #0
    b93c:	e58d8000 	str	r8, [sp]
    b940:	e2455001 	sub	r5, r5, #1
    b944:	ebfffdfa 	bl	b134 <truncate>
    b948:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    b94c:	e1a04000 	mov	r4, r0
    b950:	e3a00000 	mov	r0, #0
    b954:	e5834014 	str	r4, [r3, #20]
    b958:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    b95c:	e5931014 	ldr	r1, [r3, #20]
    b960:	e58d8000 	str	r8, [sp]
    b964:	e1a02101 	lsl	r2, r1, #2
    b968:	e1a03f21 	lsr	r3, r1, #30
    b96c:	e0928001 	adds	r8, r2, r1
    b970:	e2a39000 	adc	r9, r3, #0
    b974:	e1a0cf08 	lsl	ip, r8, #30
    b978:	e1a01f09 	lsl	r1, r9, #30
    b97c:	e1a0200c 	mov	r2, ip
    b980:	e1811128 	orr	r1, r1, r8, lsr #2
    b984:	e3a08000 	mov	r8, #0
    b988:	e1a03001 	mov	r3, r1
    b98c:	ebfffde8 	bl	b134 <truncate>
    b990:	e1540000 	cmp	r4, r0
    b994:	81a04000 	movhi	r4, r0
    b998:	859d30c8 	ldrhi	r3, [sp, #200]	; 0xc8
    b99c:	e0040694 	mul	r4, r4, r6
    b9a0:	85830014 	strhi	r0, [r3, #20]
    b9a4:	e0982005 	adds	r2, r8, r5
    b9a8:	e2ab3000 	adc	r3, fp, #0
    b9ac:	e58db000 	str	fp, [sp]
    b9b0:	e1a01984 	lsl	r1, r4, #19
    b9b4:	e1a046a4 	lsr	r4, r4, #13
    b9b8:	e0521001 	subs	r1, r2, r1
    b9bc:	e1a00008 	mov	r0, r8
    b9c0:	e0c33004 	sbc	r3, r3, r4
    b9c4:	e58d1078 	str	r1, [sp, #120]	; 0x78
    b9c8:	e58d307c 	str	r3, [sp, #124]	; 0x7c
    b9cc:	e1cd27d8 	ldrd	r2, [sp, #120]	; 0x78
    b9d0:	e1b030a3 	lsrs	r3, r3, #1
    b9d4:	e1a02062 	rrx	r2, r2
    b9d8:	ebfffdd5 	bl	b134 <truncate>
    b9dc:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    b9e0:	e59d3048 	ldr	r3, [sp, #72]	; 0x48
    b9e4:	e5820008 	str	r0, [r2, #8]
    b9e8:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    b9ec:	e0803003 	add	r3, r0, r3
    b9f0:	e5823008 	str	r3, [r2, #8]
    b9f4:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    b9f8:	e583800c 	str	r8, [r3, #12]
    b9fc:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    ba00:	e582700c 	str	r7, [r2, #12]
    ba04:	e1c300d0 	ldrd	r0, [r3]
    ba08:	e1500001 	cmp	r0, r1
    ba0c:	8a00006e 	bhi	bbcc <ipu_calc_stripes_sizes+0x884>
    ba10:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    ba14:	e1c300d0 	ldrd	r0, [r3]
    ba18:	e1500001 	cmp	r0, r1
    ba1c:	9affff31 	bls	b6e8 <ipu_calc_stripes_sizes+0x3a0>
    ba20:	e28d3084 	add	r3, sp, #132	; 0x84
    ba24:	e28d2080 	add	r2, sp, #128	; 0x80
    ba28:	ebfffdd7 	bl	b18c <calc_split_resize_coeffs>
    ba2c:	e3500000 	cmp	r0, #0
    ba30:	ba0000c9 	blt	bd5c <ipu_calc_stripes_sizes+0xa14>
    ba34:	e59d2084 	ldr	r2, [sp, #132]	; 0x84
    ba38:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    ba3c:	e1833702 	orr	r3, r3, r2, lsl #14
    ba40:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    ba44:	e5823014 	str	r3, [r2, #20]
    ba48:	eaffff26 	b	b6e8 <ipu_calc_stripes_sizes+0x3a0>
    ba4c:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    ba50:	e3a04000 	mov	r4, #0
    ba54:	e58d9000 	str	r9, [sp]
    ba58:	e1a00004 	mov	r0, r4
    ba5c:	e2435001 	sub	r5, r3, #1
    ba60:	e1b030a5 	lsrs	r3, r5, #1
    ba64:	e1a02064 	rrx	r2, r4
    ba68:	ebfffdb1 	bl	b134 <truncate>
    ba6c:	e1cd64d0 	ldrd	r6, [sp, #64]	; 0x40
    ba70:	e1a01000 	mov	r1, r0
    ba74:	e58db000 	str	fp, [sp]
    ba78:	e1a00004 	mov	r0, r4
    ba7c:	e0832691 	umull	r2, r3, r1, r6
    ba80:	e0233791 	mla	r3, r1, r7, r3
    ba84:	ebfffdaa 	bl	b134 <truncate>
    ba88:	e59d3038 	ldr	r3, [sp, #56]	; 0x38
    ba8c:	e1a08000 	mov	r8, r0
    ba90:	e59dc03c 	ldr	ip, [sp, #60]	; 0x3c
    ba94:	e1a07000 	mov	r7, r0
    ba98:	e58d9000 	str	r9, [sp]
    ba9c:	e3a00001 	mov	r0, #1
    baa0:	e0832398 	umull	r2, r3, r8, r3
    baa4:	e0233c98 	mla	r3, r8, ip, r3
    baa8:	ebfffda1 	bl	b134 <truncate>
    baac:	e1b01688 	lsls	r1, r8, #13
    bab0:	e58d0034 	str	r0, [sp, #52]	; 0x34
    bab4:	03a02000 	moveq	r2, #0
    bab8:	03a03000 	moveq	r3, #0
    babc:	1a000094 	bne	bd14 <ipu_calc_stripes_sizes+0x9cc>
    bac0:	e3a04001 	mov	r4, #1
    bac4:	e3a00000 	mov	r0, #0
    bac8:	e58d4000 	str	r4, [sp]
    bacc:	e3a08000 	mov	r8, #0
    bad0:	ebfffd97 	bl	b134 <truncate>
    bad4:	e59d5034 	ldr	r5, [sp, #52]	; 0x34
    bad8:	e1a03000 	mov	r3, r0
    badc:	e59d2030 	ldr	r2, [sp, #48]	; 0x30
    bae0:	e1a00004 	mov	r0, r4
    bae4:	e59d10c4 	ldr	r1, [sp, #196]	; 0xc4
    bae8:	e0426005 	sub	r6, r2, r5
    baec:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    baf0:	e5823014 	str	r3, [r2, #20]
    baf4:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    baf8:	e5823014 	str	r3, [r2, #20]
    bafc:	e2462001 	sub	r2, r6, #1
    bb00:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    bb04:	e5836004 	str	r6, [r3, #4]
    bb08:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    bb0c:	e5933014 	ldr	r3, [r3, #20]
    bb10:	e58d9000 	str	r9, [sp]
    bb14:	e5816004 	str	r6, [r1, #4]
    bb18:	e04a6007 	sub	r6, sl, r7
    bb1c:	e0832392 	umull	r2, r3, r2, r3
    bb20:	e1a01982 	lsl	r1, r2, #19
    bb24:	e1a036a2 	lsr	r3, r2, #13
    bb28:	e0912008 	adds	r2, r1, r8
    bb2c:	e0a33004 	adc	r3, r3, r4
    bb30:	ebfffd7f 	bl	b134 <truncate>
    bb34:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    bb38:	e1a03000 	mov	r3, r0
    bb3c:	e1a00008 	mov	r0, r8
    bb40:	e5823000 	str	r3, [r2]
    bb44:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    bb48:	e5823000 	str	r3, [r2]
    bb4c:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    bb50:	e5931004 	ldr	r1, [r3, #4]
    bb54:	e5933014 	ldr	r3, [r3, #20]
    bb58:	e58db000 	str	fp, [sp]
    bb5c:	e2411001 	sub	r1, r1, #1
    bb60:	e0030193 	mul	r3, r3, r1
    bb64:	e1a04983 	lsl	r4, r3, #19
    bb68:	e1a036a3 	lsr	r3, r3, #13
    bb6c:	e0584004 	subs	r4, r8, r4
    bb70:	e0c66003 	sbc	r6, r6, r3
    bb74:	e0983004 	adds	r3, r8, r4
    bb78:	e58d3070 	str	r3, [sp, #112]	; 0x70
    bb7c:	e0ab3006 	adc	r3, fp, r6
    bb80:	e58d3074 	str	r3, [sp, #116]	; 0x74
    bb84:	e1cd27d0 	ldrd	r2, [sp, #112]	; 0x70
    bb88:	e1b030a3 	lsrs	r3, r3, #1
    bb8c:	e1a02062 	rrx	r2, r2
    bb90:	ebfffd67 	bl	b134 <truncate>
    bb94:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    bb98:	e0803007 	add	r3, r0, r7
    bb9c:	e5820008 	str	r0, [r2, #8]
    bba0:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    bba4:	e5823008 	str	r3, [r2, #8]
    bba8:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    bbac:	e583800c 	str	r8, [r3, #12]
    bbb0:	e582500c 	str	r5, [r2, #12]
    bbb4:	eafffec3 	b	b6c8 <ipu_calc_stripes_sizes+0x380>
    bbb8:	e1a04007 	mov	r4, r7
    bbbc:	e1a0100a 	mov	r1, sl
    bbc0:	e3a00000 	mov	r0, #0
    bbc4:	ebfffffe 	bl	0 <__do_div64>
    bbc8:	eafffefa 	b	b7b8 <ipu_calc_stripes_sizes+0x470>
    bbcc:	e28d3084 	add	r3, sp, #132	; 0x84
    bbd0:	e28d2080 	add	r2, sp, #128	; 0x80
    bbd4:	ebfffd6c 	bl	b18c <calc_split_resize_coeffs>
    bbd8:	e1500008 	cmp	r0, r8
    bbdc:	ba00005e 	blt	bd5c <ipu_calc_stripes_sizes+0xa14>
    bbe0:	e59d2084 	ldr	r2, [sp, #132]	; 0x84
    bbe4:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    bbe8:	e1833702 	orr	r3, r3, r2, lsl #14
    bbec:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    bbf0:	e5823014 	str	r3, [r2, #20]
    bbf4:	eaffff85 	b	ba10 <ipu_calc_stripes_sizes+0x6c8>
    bbf8:	e28d3084 	add	r3, sp, #132	; 0x84
    bbfc:	e28d2080 	add	r2, sp, #128	; 0x80
    bc00:	ebfffd61 	bl	b18c <calc_split_resize_coeffs>
    bc04:	e3500000 	cmp	r0, #0
    bc08:	ba000053 	blt	bd5c <ipu_calc_stripes_sizes+0xa14>
    bc0c:	e59d2084 	ldr	r2, [sp, #132]	; 0x84
    bc10:	e3520000 	cmp	r2, #0
    bc14:	0afffeaf 	beq	b6d8 <ipu_calc_stripes_sizes+0x390>
    bc18:	e59d3080 	ldr	r3, [sp, #128]	; 0x80
    bc1c:	e1833702 	orr	r3, r3, r2, lsl #14
    bc20:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    bc24:	e5823014 	str	r3, [r2, #20]
    bc28:	e59d20c4 	ldr	r2, [sp, #196]	; 0xc4
    bc2c:	e5823014 	str	r3, [r2, #20]
    bc30:	eafffea8 	b	b6d8 <ipu_calc_stripes_sizes+0x390>
    bc34:	e59d3030 	ldr	r3, [sp, #48]	; 0x30
    bc38:	e3001000 	movw	r1, #0
    bc3c:	e1cd6bd0 	ldrd	r6, [sp, #176]	; 0xb0
    bc40:	e3401000 	movt	r1, #0
    bc44:	e59dc038 	ldr	ip, [sp, #56]	; 0x38
    bc48:	e59d20bc 	ldr	r2, [sp, #188]	; 0xbc
    bc4c:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    bc50:	e1cd61f8 	strd	r6, [sp, #24]
    bc54:	e59d30c0 	ldr	r3, [sp, #192]	; 0xc0
    bc58:	e1cd64d0 	ldrd	r6, [sp, #64]	; 0x40
    bc5c:	e59d0050 	ldr	r0, [sp, #80]	; 0x50
    bc60:	e58dc010 	str	ip, [sp, #16]
    bc64:	e59dc03c 	ldr	ip, [sp, #60]	; 0x3c
    bc68:	e58d5028 	str	r5, [sp, #40]	; 0x28
    bc6c:	e2800078 	add	r0, r0, #120	; 0x78
    bc70:	e58d3024 	str	r3, [sp, #36]	; 0x24
    bc74:	e1a03009 	mov	r3, r9
    bc78:	e58d2020 	str	r2, [sp, #32]
    bc7c:	e1a0200b 	mov	r2, fp
    bc80:	e58dc014 	str	ip, [sp, #20]
    bc84:	e1cd60f8 	strd	r6, [sp, #8]
    bc88:	e58d8004 	str	r8, [sp, #4]
    bc8c:	e58d9000 	str	r9, [sp]
    bc90:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    bc94:	eafffe48 	b	b5bc <ipu_calc_stripes_sizes+0x274>
    bc98:	e59d30c4 	ldr	r3, [sp, #196]	; 0xc4
    bc9c:	e3001000 	movw	r1, #0
    bca0:	e59d20c8 	ldr	r2, [sp, #200]	; 0xc8
    bca4:	e3401000 	movt	r1, #0
    bca8:	e59de0c8 	ldr	lr, [sp, #200]	; 0xc8
    bcac:	e593c014 	ldr	ip, [r3, #20]
    bcb0:	e592000c 	ldr	r0, [r2, #12]
    bcb4:	e1a02007 	mov	r2, r7
    bcb8:	e58d4020 	str	r4, [sp, #32]
    bcbc:	e58d6024 	str	r6, [sp, #36]	; 0x24
    bcc0:	e59ee004 	ldr	lr, [lr, #4]
    bcc4:	e58dc028 	str	ip, [sp, #40]	; 0x28
    bcc8:	e59dc0c8 	ldr	ip, [sp, #200]	; 0xc8
    bccc:	e59d3034 	ldr	r3, [sp, #52]	; 0x34
    bcd0:	e59cc008 	ldr	ip, [ip, #8]
    bcd4:	e58d0018 	str	r0, [sp, #24]
    bcd8:	e59d00c8 	ldr	r0, [sp, #200]	; 0xc8
    bcdc:	e5900000 	ldr	r0, [r0]
    bce0:	e58de014 	str	lr, [sp, #20]
    bce4:	e59de0c4 	ldr	lr, [sp, #196]	; 0xc4
    bce8:	e59ee004 	ldr	lr, [lr, #4]
    bcec:	e58dc010 	str	ip, [sp, #16]
    bcf0:	e59dc0c4 	ldr	ip, [sp, #196]	; 0xc4
    bcf4:	e59cc008 	ldr	ip, [ip, #8]
    bcf8:	e58d000c 	str	r0, [sp, #12]
    bcfc:	e59d00c4 	ldr	r0, [sp, #196]	; 0xc4
    bd00:	e5900000 	ldr	r0, [r0]
    bd04:	e88d5001 	stm	sp, {r0, ip, lr}
    bd08:	e59f0054 	ldr	r0, [pc, #84]	; bd64 <ipu_calc_stripes_sizes+0xa1c>
    bd0c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    bd10:	eafffe74 	b	b6e8 <ipu_calc_stripes_sizes+0x3a0>
    bd14:	e1a00004 	mov	r0, r4
    bd18:	e59d4034 	ldr	r4, [sp, #52]	; 0x34
    bd1c:	ebfffffe 	bl	0 <__do_div64>
    bd20:	eaffff66 	b	bac0 <ipu_calc_stripes_sizes+0x778>
    bd24:	e1a04006 	mov	r4, r6
    bd28:	e3a00000 	mov	r0, #0
    bd2c:	ebfffffe 	bl	0 <__do_div64>
    bd30:	eafffeff 	b	b934 <ipu_calc_stripes_sizes+0x5ec>
    bd34:	e1a04000 	mov	r4, r0
    bd38:	e3a00000 	mov	r0, #0
    bd3c:	ebfffffe 	bl	0 <__do_div64>
    bd40:	eafffed7 	b	b8a4 <ipu_calc_stripes_sizes+0x55c>
    bd44:	e59d30c8 	ldr	r3, [sp, #200]	; 0xc8
    bd48:	e1a00007 	mov	r0, r7
    bd4c:	e5934004 	ldr	r4, [r3, #4]
    bd50:	e2444001 	sub	r4, r4, #1
    bd54:	ebfffffe 	bl	0 <__do_div64>
    bd58:	eafffe4f 	b	b69c <ipu_calc_stripes_sizes+0x354>
    bd5c:	e3e00015 	mvn	r0, #21
    bd60:	eafffdd5 	b	b4bc <ipu_calc_stripes_sizes+0x174>
    bd64:	00000960 	andeq	r0, r0, r0, ror #18

0000bd68 <ipu_set_csc_coefficients>:
    bd68:	e12fff1e 	bx	lr

0000bd6c <ipu_init_sync_panel>:
    bd6c:	e3a00000 	mov	r0, #0
    bd70:	e12fff1e 	bx	lr

0000bd74 <ipu_uninit_sync_panel>:
    bd74:	e12fff1e 	bx	lr

0000bd78 <ipu_init_async_panel>:
    bd78:	e12fff1e 	bx	lr

0000bd7c <ipu_disp_set_global_alpha>:
    bd7c:	e12fff1e 	bx	lr

0000bd80 <ipu_disp_set_color_key>:
    bd80:	e3a00000 	mov	r0, #0
    bd84:	e12fff1e 	bx	lr

0000bd88 <ipu_disp_set_gamma_correction>:
    bd88:	e3a00000 	mov	r0, #0
    bd8c:	e12fff1e 	bx	lr

0000bd90 <ipu_disp_set_window_pos>:
    bd90:	e3a00000 	mov	r0, #0
    bd94:	e12fff1e 	bx	lr

0000bd98 <ipu_disp_get_window_pos>:
    bd98:	e3a00000 	mov	r0, #0
    bd9c:	e12fff1e 	bx	lr

0000bda0 <ipu_reset_disp_panel>:
    bda0:	e12fff1e 	bx	lr

0000bda4 <_ipu_dmfc_init>:
    bda4:	e12fff1e 	bx	lr

0000bda8 <_ipu_dmfc_set_wait4eot>:
    bda8:	e12fff1e 	bx	lr

0000bdac <_ipu_dmfc_set_burst_size>:
    bdac:	e12fff1e 	bx	lr

0000bdb0 <__ipu_dp_csc_setup>:
    bdb0:	e24dd008 	sub	sp, sp, #8
    bdb4:	e28d1008 	add	r1, sp, #8
    bdb8:	e901000c 	stmdb	r1, {r2, r3}
    bdbc:	e28dd008 	add	sp, sp, #8
    bdc0:	e12fff1e 	bx	lr

0000bdc4 <_ipu_dp_init>:
    bdc4:	e3a00000 	mov	r0, #0
    bdc8:	e12fff1e 	bx	lr

0000bdcc <_ipu_dp_uninit>:
    bdcc:	e12fff1e 	bx	lr

0000bdd0 <_ipu_dc_init>:
    bdd0:	e12fff1e 	bx	lr

0000bdd4 <_ipu_dc_uninit>:
    bdd4:	e12fff1e 	bx	lr

0000bdd8 <_ipu_disp_chan_is_interlaced>:
    bdd8:	e3a00000 	mov	r0, #0
    bddc:	e12fff1e 	bx	lr

0000bde0 <_ipu_dp_dc_enable>:
    bde0:	e12fff1e 	bx	lr

0000bde4 <_ipu_dp_dc_disable>:
    bde4:	e12fff1e 	bx	lr

0000bde8 <_ipu_init_dc_mappings>:
    bde8:	e12fff1e 	bx	lr

0000bdec <_ipu_pixfmt_to_map>:
    bdec:	e12fff1e 	bx	lr

0000bdf0 <_ipu_dp_set_csc_coefficients>:
    bdf0:	e12fff1e 	bx	lr

0000bdf4 <adapt_panel_to_ipu_restricitions>:
    bdf4:	e12fff1e 	bx	lr

0000bdf8 <_ipu_disp_set_window_pos>:
    bdf8:	e3a00000 	mov	r0, #0
    bdfc:	e12fff1e 	bx	lr

0000be00 <_ipu_disp_get_window_pos>:
    be00:	e3a00000 	mov	r0, #0
    be04:	e12fff1e 	bx	lr

0000be08 <ipu_disp_init>:
    be08:	e12fff1e 	bx	lr

0000be0c <_ipu_pixel_clk_get_parent>:
    be0c:	e5d0000f 	ldrb	r0, [r0, #15]
    be10:	e12fff1e 	bx	lr

0000be14 <_ipu_pixel_clk_set_parent>:
    be14:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    be18:	e1a05000 	mov	r5, r0
    be1c:	e5d0000c 	ldrb	r0, [r0, #12]
    be20:	e1a07001 	mov	r7, r1
    be24:	ebfffffe 	bl	0 <ipu_get_soc>
    be28:	e5d5300d 	ldrb	r3, [r5, #13]
    be2c:	e1a06000 	mov	r6, r0
    be30:	e2833e75 	add	r3, r3, #1872	; 0x750
    be34:	e2833008 	add	r3, r3, #8
    be38:	e0803103 	add	r3, r0, r3, lsl #2
    be3c:	e5933004 	ldr	r3, [r3, #4]
    be40:	e5938000 	ldr	r8, [r3]
    be44:	f57ff04f 	dsb	sy
    be48:	e3570000 	cmp	r7, #0
    be4c:	e5d5400d 	ldrb	r4, [r5, #13]
    be50:	03c88601 	biceq	r8, r8, #1048576	; 0x100000
    be54:	13888601 	orrne	r8, r8, #1048576	; 0x100000
    be58:	f57ff04e 	dsb	st
    be5c:	ebfffffe 	bl	0 <arm_heavy_mb>
    be60:	e2842e75 	add	r2, r4, #1872	; 0x750
    be64:	e2822008 	add	r2, r2, #8
    be68:	e0862102 	add	r2, r6, r2, lsl #2
    be6c:	e5923004 	ldr	r3, [r2, #4]
    be70:	e5838000 	str	r8, [r3]
    be74:	e3000000 	movw	r0, #0
    be78:	e5c5700f 	strb	r7, [r5, #15]
    be7c:	e3400000 	movt	r0, #0
    be80:	e1d031b2 	ldrh	r3, [r0, #18]
    be84:	e3130004 	tst	r3, #4
    be88:	1a000001 	bne	be94 <_ipu_pixel_clk_set_parent+0x80>
    be8c:	e3a00000 	mov	r0, #0
    be90:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
    be94:	e2282601 	eor	r2, r8, #1048576	; 0x100000
    be98:	e3001000 	movw	r1, #0
    be9c:	e7e02a52 	ubfx	r2, r2, #20, #1
    bea0:	e1a03008 	mov	r3, r8
    bea4:	e3401000 	movt	r1, #0
    bea8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    beac:	e3a00000 	mov	r0, #0
    beb0:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}

0000beb4 <_ipu_pixel_clk_disable>:
    beb4:	e92d4070 	push	{r4, r5, r6, lr}
    beb8:	e1a06000 	mov	r6, r0
    bebc:	e5d0000c 	ldrb	r0, [r0, #12]
    bec0:	ebfffffe 	bl	0 <ipu_get_soc>
    bec4:	e2805a01 	add	r5, r0, #4096	; 0x1000
    bec8:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    becc:	e59330c4 	ldr	r3, [r3, #196]	; 0xc4
    bed0:	f57ff04f 	dsb	sy
    bed4:	e5d6200d 	ldrb	r2, [r6, #13]
    bed8:	e3520000 	cmp	r2, #0
    bedc:	13e04402 	mvnne	r4, #33554432	; 0x2000000
    bee0:	03e04401 	mvneq	r4, #16777216	; 0x1000000
    bee4:	e0044003 	and	r4, r4, r3
    bee8:	f57ff04e 	dsb	st
    beec:	ebfffffe 	bl	0 <arm_heavy_mb>
    bef0:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    bef4:	e58340c4 	str	r4, [r3, #196]	; 0xc4
    bef8:	e8bd8070 	pop	{r4, r5, r6, pc}

0000befc <_ipu_pixel_clk_enable>:
    befc:	e92d4070 	push	{r4, r5, r6, lr}
    bf00:	e1a06000 	mov	r6, r0
    bf04:	e5d0000c 	ldrb	r0, [r0, #12]
    bf08:	ebfffffe 	bl	0 <ipu_get_soc>
    bf0c:	e2805a01 	add	r5, r0, #4096	; 0x1000
    bf10:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    bf14:	e59330c4 	ldr	r3, [r3, #196]	; 0xc4
    bf18:	f57ff04f 	dsb	sy
    bf1c:	e5d6200d 	ldrb	r2, [r6, #13]
    bf20:	e3520000 	cmp	r2, #0
    bf24:	13a04402 	movne	r4, #33554432	; 0x2000000
    bf28:	03a04401 	moveq	r4, #16777216	; 0x1000000
    bf2c:	e1844003 	orr	r4, r4, r3
    bf30:	f57ff04e 	dsb	st
    bf34:	ebfffffe 	bl	0 <arm_heavy_mb>
    bf38:	e5953d48 	ldr	r3, [r5, #3400]	; 0xd48
    bf3c:	e58340c4 	str	r4, [r3, #196]	; 0xc4
    bf40:	e3a00000 	mov	r0, #0
    bf44:	e8bd8070 	pop	{r4, r5, r6, pc}

0000bf48 <_ipu_pixel_clk_div_round_rate>:
    bf48:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    bf4c:	e3a07000 	mov	r7, #0
    bf50:	e5925000 	ldr	r5, [r2]
    bf54:	e1a09001 	mov	r9, r1
    bf58:	e1a08e25 	lsr	r8, r5, #28
    bf5c:	e1a05205 	lsl	r5, r5, #4
    bf60:	e1a06008 	mov	r6, r8
    bf64:	e1963007 	orrs	r3, r6, r7
    bf68:	1a000027 	bne	c00c <_ipu_pixel_clk_div_round_rate+0xc4>
    bf6c:	e1a00005 	mov	r0, r5
    bf70:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    bf74:	e3a03000 	mov	r3, #0
    bf78:	e1a02000 	mov	r2, r0
    bf7c:	e15100a9 	cmp	r1, r9, lsr #1
    bf80:	9a000001 	bls	bf8c <_ipu_pixel_clk_div_round_rate+0x44>
    bf84:	e2922001 	adds	r2, r2, #1
    bf88:	e2a33000 	adc	r3, r3, #0
    bf8c:	e3530000 	cmp	r3, #0
    bf90:	0352000f 	cmpeq	r2, #15
    bf94:	93a01010 	movls	r1, #16
    bf98:	9a00000c 	bls	bfd0 <_ipu_pixel_clk_div_round_rate+0x88>
    bf9c:	e3c20efe 	bic	r0, r2, #4064	; 0xfe0
    bfa0:	e1a01003 	mov	r1, r3
    bfa4:	e3c0000f 	bic	r0, r0, #15
    bfa8:	e1901001 	orrs	r1, r0, r1
    bfac:	13001ff8 	movwne	r1, #4088	; 0xff8
    bfb0:	10011002 	andne	r1, r1, r2
    bfb4:	1a000005 	bne	bfd0 <_ipu_pixel_clk_div_round_rate+0x88>
    bfb8:	e3a01000 	mov	r1, #0
    bfbc:	e202000c 	and	r0, r2, #12
    bfc0:	e3510000 	cmp	r1, #0
    bfc4:	0350000c 	cmpeq	r0, #12
    bfc8:	11a01002 	movne	r1, r2
    bfcc:	0a000004 	beq	bfe4 <_ipu_pixel_clk_div_round_rate+0x9c>
    bfd0:	e1963007 	orrs	r3, r6, r7
    bfd4:	1a000006 	bne	bff4 <_ipu_pixel_clk_div_round_rate+0xac>
    bfd8:	e1a00005 	mov	r0, r5
    bfdc:	ebfffffe 	bl	0 <__aeabi_uidiv>
    bfe0:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    bfe4:	e2922010 	adds	r2, r2, #16
    bfe8:	e1963007 	orrs	r3, r6, r7
    bfec:	e3c2100f 	bic	r1, r2, #15
    bff0:	0afffff8 	beq	bfd8 <_ipu_pixel_clk_div_round_rate+0x90>
    bff4:	e1a04001 	mov	r4, r1
    bff8:	e1a00005 	mov	r0, r5
    bffc:	e1a01008 	mov	r1, r8
    c000:	ebfffffe 	bl	0 <__do_div64>
    c004:	e1a00002 	mov	r0, r2
    c008:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    c00c:	e1a04001 	mov	r4, r1
    c010:	e1a00005 	mov	r0, r5
    c014:	e1a01008 	mov	r1, r8
    c018:	ebfffffe 	bl	0 <__do_div64>
    c01c:	eaffffd6 	b	bf7c <_ipu_pixel_clk_div_round_rate+0x34>

0000c020 <_ipu_pixel_clk_div_set_rate>:
    c020:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    c024:	e1a04002 	mov	r4, r2
    c028:	e1a08000 	mov	r8, r0
    c02c:	e5d0000c 	ldrb	r0, [r0, #12]
    c030:	e1a05001 	mov	r5, r1
    c034:	ebfffffe 	bl	0 <ipu_get_soc>
    c038:	e1a01e24 	lsr	r1, r4, #28
    c03c:	e3a03000 	mov	r3, #0
    c040:	e1a06000 	mov	r6, r0
    c044:	e1a00204 	lsl	r0, r4, #4
    c048:	e1a02001 	mov	r2, r1
    c04c:	e1923003 	orrs	r3, r2, r3
    c050:	1a00002b 	bne	c104 <_ipu_pixel_clk_div_set_rate+0xe4>
    c054:	e1a01005 	mov	r1, r5
    c058:	ebfffffe 	bl	0 <__aeabi_uidivmod>
    c05c:	e3a03000 	mov	r3, #0
    c060:	e1a02000 	mov	r2, r0
    c064:	e15100a5 	cmp	r1, r5, lsr #1
    c068:	9a000001 	bls	c074 <_ipu_pixel_clk_div_set_rate+0x54>
    c06c:	e2922001 	adds	r2, r2, #1
    c070:	e2a33000 	adc	r3, r3, #0
    c074:	e3a01000 	mov	r1, #0
    c078:	e202000c 	and	r0, r2, #12
    c07c:	e3510000 	cmp	r1, #0
    c080:	0350000c 	cmpeq	r0, #12
    c084:	1a000003 	bne	c098 <_ipu_pixel_clk_div_set_rate+0x78>
    c088:	e2920010 	adds	r0, r2, #16
    c08c:	e0a31001 	adc	r1, r3, r1
    c090:	e3c0200f 	bic	r2, r0, #15
    c094:	e1a03001 	mov	r3, r1
    c098:	e3530000 	cmp	r3, #0
    c09c:	e1a04002 	mov	r4, r2
    c0a0:	03520a01 	cmpeq	r2, #4096	; 0x1000
    c0a4:	8a000019 	bhi	c110 <_ipu_pixel_clk_div_set_rate+0xf0>
    c0a8:	e1a00006 	mov	r0, r6
    c0ac:	ebfffffe 	bl	61c8 <_ipu_get>
    c0b0:	e5d8700d 	ldrb	r7, [r8, #13]
    c0b4:	f57ff04e 	dsb	st
    c0b8:	e3009758 	movw	r9, #1880	; 0x758
    c0bc:	e0877009 	add	r7, r7, r9
    c0c0:	e0867107 	add	r7, r6, r7, lsl #2
    c0c4:	ebfffffe 	bl	0 <arm_heavy_mb>
    c0c8:	e5973004 	ldr	r3, [r7, #4]
    c0cc:	e5834004 	str	r4, [r3, #4]
    c0d0:	e1a04224 	lsr	r4, r4, #4
    c0d4:	e5d8500d 	ldrb	r5, [r8, #13]
    c0d8:	e1a04804 	lsl	r4, r4, #16
    c0dc:	f57ff04e 	dsb	st
    c0e0:	e0855009 	add	r5, r5, r9
    c0e4:	e0865105 	add	r5, r6, r5, lsl #2
    c0e8:	ebfffffe 	bl	0 <arm_heavy_mb>
    c0ec:	e5953004 	ldr	r3, [r5, #4]
    c0f0:	e5834008 	str	r4, [r3, #8]
    c0f4:	e1a00006 	mov	r0, r6
    c0f8:	ebfffffe 	bl	7464 <_ipu_put>
    c0fc:	e3a00000 	mov	r0, #0
    c100:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    c104:	e1a04005 	mov	r4, r5
    c108:	ebfffffe 	bl	0 <__do_div64>
    c10c:	eaffffd4 	b	c064 <_ipu_pixel_clk_div_set_rate+0x44>
    c110:	e3000000 	movw	r0, #0
    c114:	e5d8100d 	ldrb	r1, [r8, #13]
    c118:	e3400000 	movt	r0, #0
    c11c:	ebfffffe 	bl	0 <printk>
    c120:	eaffffe0 	b	c0a8 <_ipu_pixel_clk_div_set_rate+0x88>

0000c124 <_ipu_pixel_clk_div_recalc_rate>:
    c124:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    c128:	e1a07000 	mov	r7, r0
    c12c:	e24dd014 	sub	sp, sp, #20
    c130:	e5d0000c 	ldrb	r0, [r0, #12]
    c134:	e1a08001 	mov	r8, r1
    c138:	e1a05e21 	lsr	r5, r1, #28
    c13c:	e1a06201 	lsl	r6, r1, #4
    c140:	ebfffffe 	bl	0 <ipu_get_soc>
    c144:	e1a09000 	mov	r9, r0
    c148:	ebfffffe 	bl	61c8 <_ipu_get>
    c14c:	e5d7300d 	ldrb	r3, [r7, #13]
    c150:	e2833e75 	add	r3, r3, #1872	; 0x750
    c154:	e2833008 	add	r3, r3, #8
    c158:	e0893103 	add	r3, r9, r3, lsl #2
    c15c:	e5933004 	ldr	r3, [r3, #4]
    c160:	e5934004 	ldr	r4, [r3, #4]
    c164:	f57ff04f 	dsb	sy
    c168:	e1a00009 	mov	r0, r9
    c16c:	ebfffffe 	bl	7464 <_ipu_put>
    c170:	e3000000 	movw	r0, #0
    c174:	e3400000 	movt	r0, #0
    c178:	e1d032ba 	ldrh	r3, [r0, #42]	; 0x2a
    c17c:	e3130004 	tst	r3, #4
    c180:	1a00000b 	bne	c1b4 <_ipu_pixel_clk_div_recalc_rate+0x90>
    c184:	e3540000 	cmp	r4, #0
    c188:	01a00004 	moveq	r0, r4
    c18c:	0a000006 	beq	c1ac <_ipu_pixel_clk_div_recalc_rate+0x88>
    c190:	e1a02005 	mov	r2, r5
    c194:	e3a03000 	mov	r3, #0
    c198:	e1923003 	orrs	r3, r2, r3
    c19c:	1a00000e 	bne	c1dc <_ipu_pixel_clk_div_recalc_rate+0xb8>
    c1a0:	e1a01004 	mov	r1, r4
    c1a4:	e1a00006 	mov	r0, r6
    c1a8:	ebfffffe 	bl	0 <__aeabi_uidiv>
    c1ac:	e28dd014 	add	sp, sp, #20
    c1b0:	e8bd83f0 	pop	{r4, r5, r6, r7, r8, r9, pc}
    c1b4:	e3001000 	movw	r1, #0
    c1b8:	e5d7200d 	ldrb	r2, [r7, #13]
    c1bc:	e2800018 	add	r0, r0, #24
    c1c0:	e58d8008 	str	r8, [sp, #8]
    c1c4:	e58d6000 	str	r6, [sp]
    c1c8:	e3401000 	movt	r1, #0
    c1cc:	e58d5004 	str	r5, [sp, #4]
    c1d0:	e1a03004 	mov	r3, r4
    c1d4:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c1d8:	eaffffe9 	b	c184 <_ipu_pixel_clk_div_recalc_rate+0x60>
    c1dc:	e1a00006 	mov	r0, r6
    c1e0:	e1a01005 	mov	r1, r5
    c1e4:	ebfffffe 	bl	0 <__do_div64>
    c1e8:	e1a00002 	mov	r0, r2
    c1ec:	eaffffee 	b	c1ac <_ipu_pixel_clk_div_recalc_rate+0x88>

0000c1f0 <clk_register_mux_pix_clk>:
    c1f0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c1f4:	e1a06001 	mov	r6, r1
    c1f8:	e3a010c0 	mov	r1, #192	; 0xc0
    c1fc:	e24dd01c 	sub	sp, sp, #28
    c200:	e1a0b000 	mov	fp, r0
    c204:	e3401140 	movt	r1, #320	; 0x140
    c208:	e3a00010 	mov	r0, #16
    c20c:	e5dd504c 	ldrb	r5, [sp, #76]	; 0x4c
    c210:	e1a0a002 	mov	sl, r2
    c214:	e1a09003 	mov	r9, r3
    c218:	e5dd8044 	ldrb	r8, [sp, #68]	; 0x44
    c21c:	e5dd7048 	ldrb	r7, [sp, #72]	; 0x48
    c220:	ebfffffe 	bl	0 <ldr_malloc>
    c224:	e2504000 	subs	r4, r0, #0
    c228:	03e0500b 	mvneq	r5, #11
    c22c:	0a000013 	beq	c280 <clk_register_mux_pix_clk+0x90>
    c230:	e59d2040 	ldr	r2, [sp, #64]	; 0x40
    c234:	e3855004 	orr	r5, r5, #4
    c238:	e3003000 	movw	r3, #0
    c23c:	e5cd9010 	strb	r9, [sp, #16]
    c240:	e58da00c 	str	sl, [sp, #12]
    c244:	e3403000 	movt	r3, #0
    c248:	e58d2014 	str	r2, [sp, #20]
    c24c:	e28d2004 	add	r2, sp, #4
    c250:	e5c4500e 	strb	r5, [r4, #14]
    c254:	e1a0000b 	mov	r0, fp
    c258:	e1a01004 	mov	r1, r4
    c25c:	e5c4800c 	strb	r8, [r4, #12]
    c260:	e5c4700d 	strb	r7, [r4, #13]
    c264:	e5842008 	str	r2, [r4, #8]
    c268:	e58d6004 	str	r6, [sp, #4]
    c26c:	e58d3008 	str	r3, [sp, #8]
    c270:	ebfffffe 	bl	0 <clk_register>
    c274:	e3700a01 	cmn	r0, #4096	; 0x1000
    c278:	e1a05000 	mov	r5, r0
    c27c:	8a000002 	bhi	c28c <clk_register_mux_pix_clk+0x9c>
    c280:	e1a00005 	mov	r0, r5
    c284:	e28dd01c 	add	sp, sp, #28
    c288:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
    c28c:	e1a00004 	mov	r0, r4
    c290:	ebfffffe 	bl	0 <kfree>
    c294:	eafffff9 	b	c280 <clk_register_mux_pix_clk+0x90>

0000c298 <clk_register_div_pix_clk>:
    c298:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    c29c:	e1a07001 	mov	r7, r1
    c2a0:	e3a010c0 	mov	r1, #192	; 0xc0
    c2a4:	e24dd020 	sub	sp, sp, #32
    c2a8:	e1a06000 	mov	r6, r0
    c2ac:	e3401140 	movt	r1, #320	; 0x140
    c2b0:	e3a00010 	mov	r0, #16
    c2b4:	e1a05003 	mov	r5, r3
    c2b8:	e58d2004 	str	r2, [sp, #4]
    c2bc:	e5dda040 	ldrb	sl, [sp, #64]	; 0x40
    c2c0:	e5dd9044 	ldrb	r9, [sp, #68]	; 0x44
    c2c4:	e5dd8048 	ldrb	r8, [sp, #72]	; 0x48
    c2c8:	ebfffffe 	bl	0 <ldr_malloc>
    c2cc:	e2504000 	subs	r4, r0, #0
    c2d0:	03e0500b 	mvneq	r5, #11
    c2d4:	0a000018 	beq	c33c <clk_register_div_pix_clk+0xa4>
    c2d8:	e59d2004 	ldr	r2, [sp, #4]
    c2dc:	e3003000 	movw	r3, #0
    c2e0:	e3403000 	movt	r3, #0
    c2e4:	e3855004 	orr	r5, r5, #4
    c2e8:	e58d3010 	str	r3, [sp, #16]
    c2ec:	e28d300c 	add	r3, sp, #12
    c2f0:	e3520000 	cmp	r2, #0
    c2f4:	e5c4a00c 	strb	sl, [r4, #12]
    c2f8:	128d1004 	addne	r1, sp, #4
    c2fc:	01a01002 	moveq	r1, r2
    c300:	e2922000 	adds	r2, r2, #0
    c304:	e58d1014 	str	r1, [sp, #20]
    c308:	13a02001 	movne	r2, #1
    c30c:	e5c4900d 	strb	r9, [r4, #13]
    c310:	e5c4800e 	strb	r8, [r4, #14]
    c314:	e1a00006 	mov	r0, r6
    c318:	e58d501c 	str	r5, [sp, #28]
    c31c:	e1a01004 	mov	r1, r4
    c320:	e5cd2018 	strb	r2, [sp, #24]
    c324:	e5843008 	str	r3, [r4, #8]
    c328:	e58d700c 	str	r7, [sp, #12]
    c32c:	ebfffffe 	bl	0 <clk_register>
    c330:	e3700a01 	cmn	r0, #4096	; 0x1000
    c334:	e1a05000 	mov	r5, r0
    c338:	8a000002 	bhi	c348 <clk_register_div_pix_clk+0xb0>
    c33c:	e1a00005 	mov	r0, r5
    c340:	e28dd020 	add	sp, sp, #32
    c344:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    c348:	e1a00004 	mov	r0, r4
    c34c:	ebfffffe 	bl	0 <kfree>
    c350:	eafffff9 	b	c33c <clk_register_div_pix_clk+0xa4>

0000c354 <clk_register_gate_pix_clk>:
    c354:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    c358:	e1a07001 	mov	r7, r1
    c35c:	e3a010c0 	mov	r1, #192	; 0xc0
    c360:	e24dd020 	sub	sp, sp, #32
    c364:	e1a06000 	mov	r6, r0
    c368:	e3401140 	movt	r1, #320	; 0x140
    c36c:	e3a00010 	mov	r0, #16
    c370:	e1a05003 	mov	r5, r3
    c374:	e58d2004 	str	r2, [sp, #4]
    c378:	e5dda040 	ldrb	sl, [sp, #64]	; 0x40
    c37c:	e5dd9044 	ldrb	r9, [sp, #68]	; 0x44
    c380:	e5dd8048 	ldrb	r8, [sp, #72]	; 0x48
    c384:	ebfffffe 	bl	0 <ldr_malloc>
    c388:	e2504000 	subs	r4, r0, #0
    c38c:	03e0500b 	mvneq	r5, #11
    c390:	0a000017 	beq	c3f4 <clk_register_gate_pix_clk+0xa0>
    c394:	e59d2004 	ldr	r2, [sp, #4]
    c398:	e3855004 	orr	r5, r5, #4
    c39c:	e59f3068 	ldr	r3, [pc, #104]	; c40c <clk_register_gate_pix_clk+0xb8>
    c3a0:	e1a00006 	mov	r0, r6
    c3a4:	e5c4a00c 	strb	sl, [r4, #12]
    c3a8:	e3520000 	cmp	r2, #0
    c3ac:	e5c4900d 	strb	r9, [r4, #13]
    c3b0:	128d1004 	addne	r1, sp, #4
    c3b4:	01a01002 	moveq	r1, r2
    c3b8:	e2922000 	adds	r2, r2, #0
    c3bc:	e58d3010 	str	r3, [sp, #16]
    c3c0:	13a02001 	movne	r2, #1
    c3c4:	e28d300c 	add	r3, sp, #12
    c3c8:	e58d1014 	str	r1, [sp, #20]
    c3cc:	e1a01004 	mov	r1, r4
    c3d0:	e5c4800e 	strb	r8, [r4, #14]
    c3d4:	e5cd2018 	strb	r2, [sp, #24]
    c3d8:	e58d501c 	str	r5, [sp, #28]
    c3dc:	e5843008 	str	r3, [r4, #8]
    c3e0:	e58d700c 	str	r7, [sp, #12]
    c3e4:	ebfffffe 	bl	0 <clk_register>
    c3e8:	e3700a01 	cmn	r0, #4096	; 0x1000
    c3ec:	e1a05000 	mov	r5, r0
    c3f0:	8a000002 	bhi	c400 <clk_register_gate_pix_clk+0xac>
    c3f4:	e1a00005 	mov	r0, r5
    c3f8:	e28dd020 	add	sp, sp, #32
    c3fc:	e8bd87f0 	pop	{r4, r5, r6, r7, r8, r9, sl, pc}
    c400:	e1a00004 	mov	r0, r4
    c404:	ebfffffe 	bl	0 <kfree>
    c408:	eafffff9 	b	c3f4 <clk_register_gate_pix_clk+0xa0>
    c40c:	000001f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>

0000c410 <dispatch>:
    c410:	e92d4010 	push	{r4, lr}
    c414:	e1a04001 	mov	r4, r1
    c418:	e350000b 	cmp	r0, #11
    c41c:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
    c420:	ea0000a8 	b	c6c8 <dispatch+0x2b8>
    c424:	0000c478 	andeq	ip, r0, r8, ror r4
    c428:	0000c498 	muleq	r0, r8, r4
    c42c:	0000c4b8 			; <UNDEFINED> instruction: 0x0000c4b8
    c430:	0000c4d8 	ldrdeq	ip, [r0], -r8
    c434:	0000c4f8 	strdeq	ip, [r0], -r8
    c438:	0000c518 	andeq	ip, r0, r8, lsl r5
    c43c:	0000c538 	andeq	ip, r0, r8, lsr r5
    c440:	0000c558 	andeq	ip, r0, r8, asr r5
    c444:	0000c578 	andeq	ip, r0, r8, ror r5
    c448:	0000c598 	muleq	r0, r8, r5
    c44c:	0000c5b8 			; <UNDEFINED> instruction: 0x0000c5b8
    c450:	0000c454 	andeq	ip, r0, r4, asr r4
    c454:	e3000000 	movw	r0, #0
    c458:	e300311a 	movw	r3, #282	; 0x11a
    c45c:	e3400000 	movt	r0, #0
    c460:	e19030b3 	ldrh	r3, [r0, r3]
    c464:	e3130004 	tst	r3, #4
    c468:	1a00005b 	bne	c5dc <dispatch+0x1cc>
    c46c:	e1a00004 	mov	r0, r4
    c470:	e8bd4010 	pop	{r4, lr}
    c474:	eafffffe 	b	8fd4 <sw_ipu_free_irq>
    c478:	e3000000 	movw	r0, #0
    c47c:	e3400000 	movt	r0, #0
    c480:	e1d031b2 	ldrh	r3, [r0, #18]
    c484:	e3130004 	tst	r3, #4
    c488:	1a00008a 	bne	c6b8 <dispatch+0x2a8>
    c48c:	e1a00004 	mov	r0, r4
    c490:	e8bd4010 	pop	{r4, lr}
    c494:	eafffffe 	b	8cfc <sw_probe>
    c498:	e3000000 	movw	r0, #0
    c49c:	e3400000 	movt	r0, #0
    c4a0:	e1d032ba 	ldrh	r3, [r0, #42]	; 0x2a
    c4a4:	e3130004 	tst	r3, #4
    c4a8:	1a00007d 	bne	c6a4 <dispatch+0x294>
    c4ac:	e1a00004 	mov	r0, r4
    c4b0:	e8bd4010 	pop	{r4, lr}
    c4b4:	eafffffe 	b	8e58 <sw_ipu_init_channel>
    c4b8:	e3000000 	movw	r0, #0
    c4bc:	e3400000 	movt	r0, #0
    c4c0:	e1d034b2 	ldrh	r3, [r0, #66]	; 0x42
    c4c4:	e3130004 	tst	r3, #4
    c4c8:	1a000070 	bne	c690 <dispatch+0x280>
    c4cc:	e1a00004 	mov	r0, r4
    c4d0:	e8bd4010 	pop	{r4, lr}
    c4d4:	eafffffe 	b	8e70 <sw_ipu_uninit_channel>
    c4d8:	e3000000 	movw	r0, #0
    c4dc:	e3400000 	movt	r0, #0
    c4e0:	e1d035ba 	ldrh	r3, [r0, #90]	; 0x5a
    c4e4:	e3130004 	tst	r3, #4
    c4e8:	1a000063 	bne	c67c <dispatch+0x26c>
    c4ec:	e1a00004 	mov	r0, r4
    c4f0:	e8bd4010 	pop	{r4, lr}
    c4f4:	eafffffe 	b	8e8c <sw_ipu_init_channel_buffer>
    c4f8:	e3000000 	movw	r0, #0
    c4fc:	e3400000 	movt	r0, #0
    c500:	e1d037b2 	ldrh	r3, [r0, #114]	; 0x72
    c504:	e3130004 	tst	r3, #4
    c508:	1a000056 	bne	c668 <dispatch+0x258>
    c50c:	e1a00004 	mov	r0, r4
    c510:	e8bd4010 	pop	{r4, lr}
    c514:	eafffffe 	b	8ef8 <sw_ipu_update_channel_buffer>
    c518:	e3000000 	movw	r0, #0
    c51c:	e3400000 	movt	r0, #0
    c520:	e1d038ba 	ldrh	r3, [r0, #138]	; 0x8a
    c524:	e3130004 	tst	r3, #4
    c528:	1a000049 	bne	c654 <dispatch+0x244>
    c52c:	e1a00004 	mov	r0, r4
    c530:	e8bd4010 	pop	{r4, lr}
    c534:	eafffffe 	b	8f28 <sw_ipu_select_buffer>
    c538:	e3000000 	movw	r0, #0
    c53c:	e3400000 	movt	r0, #0
    c540:	e1d03ab2 	ldrh	r3, [r0, #162]	; 0xa2
    c544:	e3130004 	tst	r3, #4
    c548:	1a00003c 	bne	c640 <dispatch+0x230>
    c54c:	e1a00004 	mov	r0, r4
    c550:	e8bd4010 	pop	{r4, lr}
    c554:	eafffffe 	b	8f40 <sw_ipu_enable_channel>
    c558:	e3000000 	movw	r0, #0
    c55c:	e3400000 	movt	r0, #0
    c560:	e1d03bba 	ldrh	r3, [r0, #186]	; 0xba
    c564:	e3130004 	tst	r3, #4
    c568:	1a00002f 	bne	c62c <dispatch+0x21c>
    c56c:	e1a00004 	mov	r0, r4
    c570:	e8bd4010 	pop	{r4, lr}
    c574:	eafffffe 	b	8f50 <sw_ipu_disable_channel>
    c578:	e3000000 	movw	r0, #0
    c57c:	e3400000 	movt	r0, #0
    c580:	e1d03db2 	ldrh	r3, [r0, #210]	; 0xd2
    c584:	e3130004 	tst	r3, #4
    c588:	1a000022 	bne	c618 <dispatch+0x208>
    c58c:	e1a00004 	mov	r0, r4
    c590:	e8bd4010 	pop	{r4, lr}
    c594:	eafffffe 	b	8f68 <sw_ipu_enable_csi>
    c598:	e3000000 	movw	r0, #0
    c59c:	e3400000 	movt	r0, #0
    c5a0:	e1d03eba 	ldrh	r3, [r0, #234]	; 0xea
    c5a4:	e3130004 	tst	r3, #4
    c5a8:	1a000015 	bne	c604 <dispatch+0x1f4>
    c5ac:	e1a00004 	mov	r0, r4
    c5b0:	e8bd4010 	pop	{r4, lr}
    c5b4:	eafffffe 	b	8f78 <sw_ipu_disable_csi>
    c5b8:	e3000000 	movw	r0, #0
    c5bc:	e3003102 	movw	r3, #258	; 0x102
    c5c0:	e3400000 	movt	r0, #0
    c5c4:	e19030b3 	ldrh	r3, [r0, r3]
    c5c8:	e3130004 	tst	r3, #4
    c5cc:	1a000007 	bne	c5f0 <dispatch+0x1e0>
    c5d0:	e1a00004 	mov	r0, r4
    c5d4:	e8bd4010 	pop	{r4, lr}
    c5d8:	eafffffe 	b	8f88 <sw_ipu_request_irq>
    c5dc:	e3001000 	movw	r1, #0
    c5e0:	e2800f42 	add	r0, r0, #264	; 0x108
    c5e4:	e3401000 	movt	r1, #0
    c5e8:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c5ec:	eaffff9e 	b	c46c <dispatch+0x5c>
    c5f0:	e3001000 	movw	r1, #0
    c5f4:	e28000f0 	add	r0, r0, #240	; 0xf0
    c5f8:	e3401000 	movt	r1, #0
    c5fc:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c600:	eafffff2 	b	c5d0 <dispatch+0x1c0>
    c604:	e3001000 	movw	r1, #0
    c608:	e28000d8 	add	r0, r0, #216	; 0xd8
    c60c:	e3401000 	movt	r1, #0
    c610:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c614:	eaffffe4 	b	c5ac <dispatch+0x19c>
    c618:	e3001000 	movw	r1, #0
    c61c:	e28000c0 	add	r0, r0, #192	; 0xc0
    c620:	e3401000 	movt	r1, #0
    c624:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c628:	eaffffd7 	b	c58c <dispatch+0x17c>
    c62c:	e3001000 	movw	r1, #0
    c630:	e28000a8 	add	r0, r0, #168	; 0xa8
    c634:	e3401000 	movt	r1, #0
    c638:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c63c:	eaffffca 	b	c56c <dispatch+0x15c>
    c640:	e3001000 	movw	r1, #0
    c644:	e2800090 	add	r0, r0, #144	; 0x90
    c648:	e3401000 	movt	r1, #0
    c64c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c650:	eaffffbd 	b	c54c <dispatch+0x13c>
    c654:	e3001000 	movw	r1, #0
    c658:	e2800078 	add	r0, r0, #120	; 0x78
    c65c:	e3401000 	movt	r1, #0
    c660:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c664:	eaffffb0 	b	c52c <dispatch+0x11c>
    c668:	e3001000 	movw	r1, #0
    c66c:	e2800060 	add	r0, r0, #96	; 0x60
    c670:	e3401000 	movt	r1, #0
    c674:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c678:	eaffffa3 	b	c50c <dispatch+0xfc>
    c67c:	e3001000 	movw	r1, #0
    c680:	e2800048 	add	r0, r0, #72	; 0x48
    c684:	e3401000 	movt	r1, #0
    c688:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c68c:	eaffff96 	b	c4ec <dispatch+0xdc>
    c690:	e3001000 	movw	r1, #0
    c694:	e2800030 	add	r0, r0, #48	; 0x30
    c698:	e3401000 	movt	r1, #0
    c69c:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c6a0:	eaffff89 	b	c4cc <dispatch+0xbc>
    c6a4:	e3001000 	movw	r1, #0
    c6a8:	e2800018 	add	r0, r0, #24
    c6ac:	e3401000 	movt	r1, #0
    c6b0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c6b4:	eaffff7c 	b	c4ac <dispatch+0x9c>
    c6b8:	e3001000 	movw	r1, #0
    c6bc:	e3401000 	movt	r1, #0
    c6c0:	ebfffffe 	bl	0 <__dynamic_pr_debug>
    c6c4:	eaffff70 	b	c48c <dispatch+0x7c>
    c6c8:	e3000000 	movw	r0, #0
    c6cc:	e3400000 	movt	r0, #0
    c6d0:	ebfffffe 	bl	0 <printk>
    c6d4:	e3a00000 	mov	r0, #0
    c6d8:	e8bd8010 	pop	{r4, pc}

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

Disassembly of section __ksymtab:

00000000 <__ksymtab_bytes_per_pixel>:
   0:	00000000 	andeq	r0, r0, r0
   4:	000000c8 	andeq	r0, r0, r8, asr #1

00000008 <__ksymtab_format_to_colorspace>:
   8:	00000000 	andeq	r0, r0, r0
   c:	000000b3 	strheq	r0, [r0], -r3

00000010 <__ksymtab_ipu_calc_stripes_sizes>:
  10:	00000000 	andeq	r0, r0, r0
  14:	0000039a 	muleq	r0, sl, r3

00000018 <__ksymtab_ipu_ch_param_bad_alpha_pos>:
  18:	00000000 	andeq	r0, r0, r0
  1c:	00000098 	muleq	r0, r8, r0

00000020 <__ksymtab_ipu_ch_param_get_axi_id>:
	...

00000028 <__ksymtab_ipu_channel_status>:
  28:	00000000 	andeq	r0, r0, r0
  2c:	000000e9 	andeq	r0, r0, r9, ror #1

00000030 <__ksymtab_ipu_check_buffer_ready>:
  30:	00000000 	andeq	r0, r0, r0
  34:	000001ba 			; <UNDEFINED> instruction: 0x000001ba

00000038 <__ksymtab_ipu_clear_buffer_ready>:
  38:	00000000 	andeq	r0, r0, r0
  3c:	000001a3 	andeq	r0, r0, r3, lsr #3

00000040 <__ksymtab_ipu_clear_irq>:
  40:	00000000 	andeq	r0, r0, r0
  44:	00000143 	andeq	r0, r0, r3, asr #2

00000048 <__ksymtab_ipu_csi_enable_mclk>:
  48:	00000000 	andeq	r0, r0, r0
  4c:	00000353 	andeq	r0, r0, r3, asr r3

00000050 <__ksymtab_ipu_csi_get_sensor_protocol>:
  50:	00000000 	andeq	r0, r0, r0
  54:	00000367 	andeq	r0, r0, r7, ror #6

00000058 <__ksymtab_ipu_csi_get_window_size>:
  58:	00000000 	andeq	r0, r0, r0
  5c:	0000033b 	andeq	r0, r0, fp, lsr r3

00000060 <__ksymtab_ipu_csi_init_interface>:
  60:	00000000 	andeq	r0, r0, r0
  64:	00000383 	andeq	r0, r0, r3, lsl #7

00000068 <__ksymtab_ipu_csi_set_window_pos>:
  68:	00000000 	andeq	r0, r0, r0
  6c:	0000030c 	andeq	r0, r0, ip, lsl #6

00000070 <__ksymtab_ipu_csi_set_window_size>:
  70:	00000000 	andeq	r0, r0, r0
  74:	00000323 	andeq	r0, r0, r3, lsr #6

00000078 <__ksymtab_ipu_disable_channel>:
  78:	00000000 	andeq	r0, r0, r0
  7c:	0000018f 	andeq	r0, r0, pc, lsl #3

00000080 <__ksymtab_ipu_disable_csi>:
  80:	00000000 	andeq	r0, r0, r0
  84:	00000170 	andeq	r0, r0, r0, ror r1

00000088 <__ksymtab_ipu_disable_hsp_clk>:
  88:	00000000 	andeq	r0, r0, r0
  8c:	000002ec 	andeq	r0, r0, ip, ror #5

00000090 <__ksymtab_ipu_disable_irq>:
  90:	00000000 	andeq	r0, r0, r0
  94:	00000151 	andeq	r0, r0, r1, asr r1

00000098 <__ksymtab_ipu_disp_get_window_pos>:
  98:	00000000 	andeq	r0, r0, r0
  9c:	000003c6 	andeq	r0, r0, r6, asr #7

000000a0 <__ksymtab_ipu_disp_set_color_key>:
  a0:	00000000 	andeq	r0, r0, r0
  a4:	00000414 	andeq	r0, r0, r4, lsl r4

000000a8 <__ksymtab_ipu_disp_set_gamma_correction>:
  a8:	00000000 	andeq	r0, r0, r0
  ac:	000003f6 	strdeq	r0, [r0], -r6

000000b0 <__ksymtab_ipu_disp_set_global_alpha>:
  b0:	00000000 	andeq	r0, r0, r0
  b4:	0000042b 	andeq	r0, r0, fp, lsr #8

000000b8 <__ksymtab_ipu_disp_set_window_pos>:
  b8:	00000000 	andeq	r0, r0, r0
  bc:	000003de 	ldrdeq	r0, [r0], -lr

000000c0 <__ksymtab_ipu_enable_channel>:
  c0:	00000000 	andeq	r0, r0, r0
  c4:	000001d1 	ldrdeq	r0, [r0], -r1

000000c8 <__ksymtab_ipu_enable_csi>:
  c8:	00000000 	andeq	r0, r0, r0
  cc:	00000180 	andeq	r0, r0, r0, lsl #3

000000d0 <__ksymtab_ipu_enable_irq>:
  d0:	00000000 	andeq	r0, r0, r0
  d4:	00000161 	andeq	r0, r0, r1, ror #2

000000d8 <__ksymtab_ipu_free_irq>:
  d8:	00000000 	andeq	r0, r0, r0
  dc:	00000113 	andeq	r0, r0, r3, lsl r1

000000e0 <__ksymtab_ipu_get_channel_offset>:
  e0:	00000000 	andeq	r0, r0, r0
  e4:	0000024c 	andeq	r0, r0, ip, asr #4

000000e8 <__ksymtab_ipu_get_cur_buffer_idx>:
  e8:	00000000 	andeq	r0, r0, r0
  ec:	000000fc 	strdeq	r0, [r0], -ip

000000f0 <__ksymtab_ipu_get_irq_status>:
  f0:	00000000 	andeq	r0, r0, r0
  f4:	00000130 	andeq	r0, r0, r0, lsr r1

000000f8 <__ksymtab_ipu_init_async_panel>:
  f8:	00000000 	andeq	r0, r0, r0
  fc:	00000445 	andeq	r0, r0, r5, asr #8

00000100 <__ksymtab_ipu_init_channel>:
 100:	00000000 	andeq	r0, r0, r0
 104:	000002db 	ldrdeq	r0, [r0], -fp

00000108 <__ksymtab_ipu_init_channel_buffer>:
 108:	00000000 	andeq	r0, r0, r0
 10c:	000002b0 			; <UNDEFINED> instruction: 0x000002b0

00000110 <__ksymtab_ipu_init_sync_panel>:
 110:	00000000 	andeq	r0, r0, r0
 114:	00000470 	andeq	r0, r0, r0, ror r4

00000118 <__ksymtab_ipu_is_channel_busy>:
 118:	00000000 	andeq	r0, r0, r0
 11c:	000001e4 	andeq	r0, r0, r4, ror #3

00000120 <__ksymtab_ipu_link_channels>:
 120:	00000000 	andeq	r0, r0, r0
 124:	0000020c 	andeq	r0, r0, ip, lsl #4

00000128 <__ksymtab_ipu_pixel_format_is_gpu_tile>:
 128:	00000000 	andeq	r0, r0, r0
 12c:	0000007b 	andeq	r0, r0, fp, ror r0

00000130 <__ksymtab_ipu_pixel_format_is_multiplanar_yuv>:
 130:	00000000 	andeq	r0, r0, r0
 134:	00000018 	andeq	r0, r0, r8, lsl r0

00000138 <__ksymtab_ipu_pixel_format_is_pre_yuv>:
 138:	00000000 	andeq	r0, r0, r0
 13c:	0000003c 	andeq	r0, r0, ip, lsr r0

00000140 <__ksymtab_ipu_pixel_format_is_split_gpu_tile>:
 140:	00000000 	andeq	r0, r0, r0
 144:	00000058 	andeq	r0, r0, r8, asr r0

00000148 <__ksymtab_ipu_request_irq>:
 148:	00000000 	andeq	r0, r0, r0
 14c:	00000120 	andeq	r0, r0, r0, lsr #2

00000150 <__ksymtab_ipu_reset_disp_panel>:
 150:	00000000 	andeq	r0, r0, r0
 154:	000003b1 			; <UNDEFINED> instruction: 0x000003b1

00000158 <__ksymtab_ipu_select_buffer>:
 158:	00000000 	andeq	r0, r0, r0
 15c:	0000023a 	andeq	r0, r0, sl, lsr r2

00000160 <__ksymtab_ipu_select_multi_vdi_buffer>:
 160:	00000000 	andeq	r0, r0, r0
 164:	0000021e 	andeq	r0, r0, lr, lsl r2

00000168 <__ksymtab_ipu_set_channel_bandmode>:
 168:	00000000 	andeq	r0, r0, r0
 16c:	0000027d 	andeq	r0, r0, sp, ror r2

00000170 <__ksymtab_ipu_set_csc_coefficients>:
 170:	00000000 	andeq	r0, r0, r0
 174:	00000484 	andeq	r0, r0, r4, lsl #9

00000178 <__ksymtab_ipu_swap_channel>:
 178:	00000000 	andeq	r0, r0, r0
 17c:	000000d8 	ldrdeq	r0, [r0], -r8

00000180 <__ksymtab_ipu_uninit_channel>:
 180:	00000000 	andeq	r0, r0, r0
 184:	000002c8 	andeq	r0, r0, r8, asr #5

00000188 <__ksymtab_ipu_uninit_sync_panel>:
 188:	00000000 	andeq	r0, r0, r0
 18c:	0000045a 	andeq	r0, r0, sl, asr r4

00000190 <__ksymtab_ipu_unlink_channels>:
 190:	00000000 	andeq	r0, r0, r0
 194:	000001f8 	strdeq	r0, [r0], -r8

00000198 <__ksymtab_ipu_update_channel_buffer>:
 198:	00000000 	andeq	r0, r0, r0
 19c:	00000296 	muleq	r0, r6, r2

000001a0 <__ksymtab_ipu_update_channel_offset>:
 1a0:	00000000 	andeq	r0, r0, r0
 1a4:	00000263 	andeq	r0, r0, r3, ror #4

Disassembly of section __ksymtab_gpl:

00000000 <__ksymtab_ipu_get_soc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000300 	andeq	r0, r0, r0, lsl #6

Disassembly of section __kcrctab:

00000000 <__kcrctab>:
	...

Disassembly of section __kcrctab_gpl:

00000000 <__kcrctab_gpl>:
   0:	00000000 	andeq	r0, r0, r0

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

00000210 <__func__.38447>:
 210:	5f757069 	svcpl	0x00757069
 214:	75716572 	ldrbvc	r6, [r1, #-1394]!	; 0xfffffa8e
 218:	5f747365 	svcpl	0x00747365
 21c:	00717269 	rsbseq	r7, r1, r9, ror #4

00000220 <__func__.38469>:
 220:	5f757069 	svcpl	0x00757069
 224:	65657266 	strbvs	r7, [r5, #-614]!	; 0xfffffd9a
 228:	7172695f 	cmnvc	r2, pc, asr r9
 22c:	00000000 	andeq	r0, r0, r0

00000230 <__func__.38518>:
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

0000025c <__func__.38707>:
 25c:	5f757069 	svcpl	0x00757069
 260:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
 264:	5f656d69 	svcpl	0x00656d69
 268:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
 26c:	0000656d 	andeq	r6, r0, sp, ror #10

00000270 <__func__.38702>:
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

00000724 <__func__.28845>:
 724:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 728:	5f63695f 	svcpl	0x0063695f
 72c:	616d6469 	cmnvs	sp, r9, ror #8
 730:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 734:	00000074 	andeq	r0, r0, r4, ror r0

00000738 <__func__.28872>:
 738:	6c61635f 	stclvs	3, cr6, [r1], #-380	; 0xfffffe84
 73c:	65725f63 	ldrbvs	r5, [r2, #-3939]!	; 0xfffff09d
 740:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
 744:	656f635f 	strbvs	r6, [pc, #-863]!	; 3ed <__mod_of__imx_ipuv3_dt_ids_device_table+0xa1>
 748:	00736666 	rsbseq	r6, r3, r6, ror #12

0000074c <__func__.28699>:
 74c:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 750:	6964765f 	stmdbvs	r4!, {r0, r1, r2, r3, r4, r6, r9, sl, ip, sp, lr}^
 754:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 758:	746f6d5f 	strbtvc	r6, [pc], #-3423	; 760 <__func__.28425>
 75c:	006e6f69 	rsbeq	r6, lr, r9, ror #30

00000760 <__func__.28425>:
 760:	5f757069 	svcpl	0x00757069
 764:	5f697363 	svcpl	0x00697363
 768:	5f746567 	svcpl	0x00746567
 76c:	736e6573 	cmnvc	lr, #482344960	; 0x1cc00000
 770:	705f726f 	subsvc	r7, pc, pc, ror #4
 774:	6f746f72 	svcvs	0x00746f72
 778:	006c6f63 	rsbeq	r6, ip, r3, ror #30

0000077c <__func__.28452>:
 77c:	5f757069 	svcpl	0x00757069
 780:	5f697363 	svcpl	0x00697363
 784:	5f746567 	svcpl	0x00746567
 788:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 78c:	735f776f 	cmpvc	pc, #29097984	; 0x1bc0000
 790:	00657a69 	rsbeq	r7, r5, r9, ror #20

00000794 <__func__.28467>:
 794:	5f757069 	svcpl	0x00757069
 798:	5f697363 	svcpl	0x00697363
 79c:	5f746573 	svcpl	0x00746573
 7a0:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 7a4:	735f776f 	cmpvc	pc, #29097984	; 0x1bc0000
 7a8:	00657a69 	rsbeq	r7, r5, r9, ror #20

000007ac <__func__.28483>:
 7ac:	5f757069 	svcpl	0x00757069
 7b0:	5f697363 	svcpl	0x00697363
 7b4:	5f746573 	svcpl	0x00746573
 7b8:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 7bc:	705f776f 	subsvc	r7, pc, pc, ror #14
 7c0:	0000736f 	andeq	r7, r0, pc, ror #6

000007c4 <__func__.28396>:
 7c4:	5f757069 	svcpl	0x00757069
 7c8:	5f697363 	svcpl	0x00697363
 7cc:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 7d0:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
 7d4:	61667265 	cmnvs	r6, r5, ror #4
 7d8:	00006563 	andeq	r6, r0, r3, ror #10

000007dc <__func__.28497>:
 7dc:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 7e0:	6973635f 	ldmdbvs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
 7e4:	726f685f 	rsbvc	r6, pc, #6225920	; 0x5f0000
 7e8:	6e6f7a69 	vnmulvs.f32	s15, s30, s19
 7ec:	5f6c6174 	svcpl	0x006c6174
 7f0:	6e776f64 	cdpvs	15, 7, cr6, cr7, cr4, {3}
 7f4:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0xfffff68d
 7f8:	616e655f 	cmnvs	lr, pc, asr r5
 7fc:	00656c62 	rsbeq	r6, r5, r2, ror #24

00000800 <__func__.28543>:
 800:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 804:	6973635f 	ldmdbvs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
 808:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 80c:	70696d5f 	rsbvc	r6, r9, pc, asr sp
 810:	69645f69 	stmdbvs	r4!, {r0, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 814:	00000000 	andeq	r0, r0, r0

00000818 <__func__.28387>:
 818:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 81c:	6973635f 	ldmdbvs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
 820:	6c636d5f 	stclvs	13, cr6, [r3], #-380	; 0xfffffe84
 824:	65735f6b 	ldrbvs	r5, [r3, #-3947]!	; 0xfffff095
 828:	00000074 	andeq	r0, r0, r4, ror r0

0000082c <__func__.17378>:
 82c:	636c6163 	cmnvs	ip, #-1073741800	; 0xc0000018
 830:	6c70735f 	ldclvs	3, cr7, [r0], #-380	; 0xfffffe84
 834:	725f7469 	subsvc	r7, pc, #1761607680	; 0x69000000
 838:	7a697365 	bvc	1a5d5d4 <__crc_ipu_ch_param_bad_alpha_pos+0x1270255>
 83c:	6f635f65 	svcvs	0x00635f65
 840:	73666665 	cmnvc	r6, #105906176	; 0x6500000
 844:	00000000 	andeq	r0, r0, r0

00000848 <__func__.17424>:
 848:	5f757069 	svcpl	0x00757069
 84c:	636c6163 	cmnvs	ip, #-1073741800	; 0xc0000018
 850:	7274735f 	rsbsvc	r7, r4, #2080374785	; 0x7c000001
 854:	73657069 	cmnvc	r5, #105	; 0x69
 858:	7a69735f 	bvc	1a5d5dc <__crc_ipu_ch_param_bad_alpha_pos+0x127025d>
 85c:	00007365 	andeq	r7, r0, r5, ror #6

00000860 <clk_mux_di_ops>:
	...

000008b0 <__func__.29910>:
 8b0:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 8b4:	7869705f 	stmdavc	r9!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 8b8:	635f6c65 	cmpvs	pc, #25856	; 0x6500
 8bc:	645f6b6c 	ldrbvs	r6, [pc], #-2924	; 8c4 <__func__.29910+0x14>
 8c0:	725f7669 	subsvc	r7, pc, #110100480	; 0x6900000
 8c4:	6c616365 	stclvs	3, cr6, [r1], #-404	; 0xfffffe6c
 8c8:	61725f63 	cmnvs	r2, r3, ror #30
 8cc:	00006574 	andeq	r6, r0, r4, ror r5

000008d0 <__func__.29862>:
 8d0:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
 8d4:	7869705f 	stmdavc	r9!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
 8d8:	635f6c65 	cmpvs	pc, #25856	; 0x6500
 8dc:	735f6b6c 	cmpvc	pc, #108, 22	; 0x1b000
 8e0:	705f7465 	subsvc	r7, pc, r5, ror #8
 8e4:	6e657261 	cdpvs	2, 6, cr7, cr5, cr1, {3}
 8e8:	00000074 	andeq	r0, r0, r4, ror r0

000008ec <__func__.31288>:
 8ec:	70736964 	rsbsvc	r6, r3, r4, ror #18
 8f0:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
	...

Disassembly of section .ARM.exidx.init.text:

00000000 <.ARM.exidx.init.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section .ARM.exidx.exit.text:

00000000 <.ARM.exidx.exit.text>:
   0:	00000000 	andeq	r0, r0, r0
   4:	80b0b0b0 	ldrhthi	fp, [r0], r0

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
     2d8:	6c706972 			; <UNDEFINED> instruction: 0x6c706972
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
     384:	6d646920 			; <UNDEFINED> instruction: 0x6d646920
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
     3c8:	6e67696c 	vnmulvs.f16	s13, s14, s25	; <UNPREDICTABLE>
     3cc:	000a6465 	andeq	r6, sl, r5, ror #8

000003d0 <.LC32>:
     3d0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     3d4:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
     3d8:	676e697a 			; <UNDEFINED> instruction: 0x676e697a
     3dc:	6d646920 			; <UNDEFINED> instruction: 0x6d646920
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
     550:	2c312b64 			; <UNDEFINED> instruction: 0x2c312b64
     554:	00000020 	andeq	r0, r0, r0, lsr #32

00000558 <.LC50>:
     558:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
     55c:	25203168 	strcs	r3, [r0, #-360]!	; 0xfffffe98
     560:	2c312b64 			; <UNDEFINED> instruction: 0x2c312b64
     564:	00000020 	andeq	r0, r0, r0, lsr #32

00000568 <.LC51>:
     568:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
     56c:	25203268 	strcs	r3, [r0, #-616]!	; 0xfffffd98
     570:	2c312b64 			; <UNDEFINED> instruction: 0x2c312b64
     574:	00000020 	andeq	r0, r0, r0, lsr #32

00000578 <.LC52>:
     578:	74646957 	strbtvc	r6, [r4], #-2391	; 0xfffff6a9
     57c:	25203368 	strcs	r3, [r0, #-872]!	; 0xfffffc98
     580:	2c312b64 			; <UNDEFINED> instruction: 0x2c312b64
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
     618:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     61c:	69746169 	ldmdbvs	r4!, {r0, r3, r5, r6, r8, sp, lr}^
     620:	4c20676e 	stcmi	7, cr6, [r0], #-440	; 0xfffffe48
     624:	2e204346 	cdpcs	3, 2, cr4, cr0, cr6, {2}
     628:	0a2e2e2e 	beq	b8bee8 <__crc_ipu_ch_param_bad_alpha_pos+0x39eb69>
     62c:	00000000 	andeq	r0, r0, r0

00000630 <.LC61>:
     630:	2043464c 	subcs	r4, r3, ip, asr #12
     634:	75736572 	ldrbvc	r6, [r3, #-1394]!	; 0xfffffa8e
     638:	203a746c 	eorscs	r7, sl, ip, ror #8
     63c:	0a2e6425 	beq	b996d8 <__crc_ipu_ch_param_bad_alpha_pos+0x3ac359>
     640:	00000000 	andeq	r0, r0, r0

00000644 <.LC62>:
     644:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     648:	61686320 	cmnvs	r8, r0, lsr #6
     64c:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
     650:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xfffff2e0
     654:	00000a64 	andeq	r0, r0, r4, ror #20

00000658 <.LC63>:
     658:	3d206863 	stccc	8, cr6, [r0, #-396]!	; 0xfffffe74
     65c:	2c642520 	cfstr64cs	mvdx2, [r4], #-128	; 0xffffff80
     660:	5f6d7020 	svcpl	0x006d7020
     664:	746e7572 	strbtvc	r7, [lr], #-1394	; 0xfffffa8e
     668:	5f656d69 	svcpl	0x00656d69
     66c:	20746567 	rsbscs	r6, r4, r7, ror #10
     670:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     674:	253a6465 	ldrcs	r6, [sl, #-1125]!	; 0xfffffb9b
     678:	000a2164 	andeq	r2, sl, r4, ror #2

0000067c <.LC64>:
     67c:	6e726157 	mrcvs	1, 3, r6, cr2, cr7, {2}
     680:	3a676e69 	bcc	19dc02c <__crc_ipu_ch_param_bad_alpha_pos+0x11eecad>
     684:	61686320 	cmnvs	r8, r0, lsr #6
     688:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
     68c:	726c6120 	rsbvc	r6, ip, #32, 2
     690:	79646165 	stmdbvc	r4!, {r0, r2, r5, r6, r8, sp, lr}^
     694:	696e6920 	stmdbvs	lr!, {r5, r8, fp, sp, lr}^
     698:	6c616974 			; <UNDEFINED> instruction: 0x6c616974
     69c:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xfffff597
     6a0:	0a642520 	beq	1909b28 <__crc_ipu_ch_param_bad_alpha_pos+0x111c7a9>
     6a4:	00000000 	andeq	r0, r0, r0

000006a8 <.LC65>:
     6a8:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
     6ac:	2c292873 	stccs	8, cr2, [r9], #-460	; 0xfffffe34
     6b0:	69736320 	ldmdbvs	r3!, {r5, r8, r9, sp, lr}^
     6b4:	6425203a 	strtvs	r2, [r5], #-58	; 0xffffffc6
     6b8:	0000000a 	andeq	r0, r0, sl

000006bc <.LC66>:
     6bc:	20646162 	rsbcs	r6, r4, r2, ror #2
     6c0:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
     6c4:	6f66206c 	svcvs	0x0066206c
     6c8:	74616d72 	strbtvc	r6, [r1], #-3442	; 0xfffff28e
     6cc:	726f6620 	rsbvc	r6, pc, #32, 12	; 0x2000000
     6d0:	61726720 	cmnvs	r2, r0, lsr #14
     6d4:	63696870 	cmnvs	r9, #112, 16	; 0x700000
     6d8:	6c702073 	ldclvs	0, cr2, [r0], #-460	; 0xfffffe34
     6dc:	20656e61 	rsbcs	r6, r5, r1, ror #28
     6e0:	6d6f7266 	sfmvs	f7, 2, [pc, #-408]!	; 550 <.LC49+0x8>
     6e4:	25686320 	strbcs	r6, [r8, #-800]!	; 0xfffffce0
     6e8:	00000a64 	andeq	r0, r0, r4, ror #20

000006ec <.LC67>:
     6ec:	7373694d 	cmnvc	r3, #1261568	; 0x134000
     6f0:	20676e69 	rsbcs	r6, r7, r9, ror #28
     6f4:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
     6f8:	206c656e 	rsbcs	r6, ip, lr, ror #10
     6fc:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
     700:	696c6169 	stmdbvs	ip!, {r0, r3, r5, r6, r8, sp, lr}^
     704:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
     708:	000a6e6f 	andeq	r6, sl, pc, ror #28

0000070c <.LC68>:
     70c:	6e6f7257 	mcrvs	2, 3, r7, cr15, cr7, {2}
     710:	73632067 	cmnvc	r3, #103	; 0x67
     714:	756e2069 	strbvc	r2, [lr, #-105]!	; 0xffffff97
     718:	64255f6d 	strtvs	r5, [r5], #-3949	; 0xfffff093
     71c:	0000000a 	andeq	r0, r0, sl

00000720 <.LC69>:
     720:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
     724:	3a292873 	bcc	a4a8f8 <__crc_ipu_ch_param_bad_alpha_pos+0x25d579>
     728:	616e6520 	cmnvs	lr, r0, lsr #10
     72c:	20656c62 	rsbcs	r6, r5, r2, ror #24
     730:	20697363 	rsbcs	r7, r9, r3, ror #6
     734:	000a6425 	andeq	r6, sl, r5, lsr #8

00000738 <.LC70>:
     738:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
     73c:	2072656c 	rsbscs	r6, r2, ip, ror #10
     740:	6e736168 	rpwvssz	f6, f3, #0.0
     744:	62207427 	eorvs	r7, r0, #654311424	; 0x27000000
     748:	206e6565 	rsbcs	r6, lr, r5, ror #10
     74c:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     750:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     754:	6f206465 	svcvs	0x00206465
     758:	7973206e 	ldmdbvc	r3!, {r1, r2, r3, r5, r6, sp}^
     75c:	6920636e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sp, lr}
     760:	25207172 	strcs	r7, [r0, #-370]!	; 0xfffffe8e
     764:	00000a64 	andeq	r0, r0, r4, ror #20

00000768 <.LC71>:
     768:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
     76c:	0a292873 	beq	a4a940 <__crc_ipu_ch_param_bad_alpha_pos+0x25d5c1>
     770:	00000000 	andeq	r0, r0, r0

00000774 <.LC72>:
     774:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
     778:	2072656c 	rsbscs	r6, r2, ip, ror #10
     77c:	65726c61 	ldrbvs	r6, [r2, #-3169]!	; 0xfffff39f
     780:	20796461 	rsbscs	r6, r9, r1, ror #8
     784:	74736e69 	ldrbtvc	r6, [r3], #-3689	; 0xfffff197
     788:	656c6c61 	strbvs	r6, [ip, #-3169]!	; 0xfffff39f
     78c:	6e6f2064 	cdpvs	0, 6, cr2, cr15, cr4, {3}
     790:	71726920 	cmnvc	r2, r0, lsr #18
     794:	0a642520 	beq	1909c1c <__crc_ipu_ch_param_bad_alpha_pos+0x111c89d>
     798:	00000000 	andeq	r0, r0, r0

0000079c <.LC73>:
     79c:	646e6168 	strbtvs	r6, [lr], #-360	; 0xfffffe98
     7a0:	2072656c 	rsbscs	r6, r2, ip, ror #10
     7a4:	4e207369 	cdpmi	3, 2, cr7, cr0, cr9, {3}
     7a8:	204c4c55 	subcs	r4, ip, r5, asr ip
     7ac:	20726f66 	rsbscs	r6, r2, r6, ror #30
     7b0:	636e7973 	cmnvs	lr, #1884160	; 0x1cc000
     7b4:	71726920 	cmnvc	r2, r0, lsr #18
     7b8:	0a642520 	beq	1909c40 <__crc_ipu_ch_param_bad_alpha_pos+0x111c8c1>
     7bc:	00000000 	andeq	r0, r0, r0

000007c0 <.LC74>:
     7c0:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
     7c4:	25206564 	strcs	r6, [r0, #-1380]!	; 0xfffffa9c
     7c8:	2e292873 	mcrcs	8, 1, r2, cr9, cr3, {3}
     7cc:	0000000a 	andeq	r0, r0, sl

000007d0 <.LC75>:
     7d0:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
     7d4:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
     7d8:	73202928 			; <UNDEFINED> instruction: 0x73202928
     7dc:	65636375 	strbvs	r6, [r3, #-885]!	; 0xfffffc8b
     7e0:	0a2e7373 	beq	b9d5b4 <__crc_ipu_ch_param_bad_alpha_pos+0x3b0235>
     7e4:	00000000 	andeq	r0, r0, r0

000007e8 <.LC76>:
     7e8:	7570695f 	ldrbvc	r6, [r0, #-2399]!	; 0xfffff6a1
     7ec:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0xffffffa1
     7f0:	73202928 			; <UNDEFINED> instruction: 0x73202928
     7f4:	65636375 	strbvs	r6, [r3, #-885]!	; 0xfffffc8b
     7f8:	0a2e7373 	beq	b9d5cc <__crc_ipu_ch_param_bad_alpha_pos+0x3b024d>
     7fc:	00000000 	andeq	r0, r0, r0

00000800 <.LC77>:
     800:	202c7325 	eorcs	r7, ip, r5, lsr #6
     804:	5f616d64 	svcpl	0x00616d64
     808:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     80c:	253a7375 	ldrcs	r7, [sl, #-885]!	; 0xfffffc8b
     810:	000a2e64 	andeq	r2, sl, r4, ror #28

00000814 <.LC78>:
     814:	706d7564 	rsbvc	r7, sp, r4, ror #10
     818:	20676e69 	rsbcs	r6, r7, r9, ror #28
     81c:	20757069 	rsbscs	r7, r5, r9, rrx
     820:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     824:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
     828:	2e2e2073 	mcrcs	0, 1, r2, cr14, cr3, {3}
     82c:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000830 <.LC79>:
     830:	5f555049 	svcpl	0x00555049
     834:	464e4f43 	strbmi	r4, [lr], -r3, asr #30
     838:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     83c:	30257830 	eorcc	r7, r5, r0, lsr r8
     840:	000a5838 	andeq	r5, sl, r8, lsr r8

00000844 <.LC80>:
     844:	414d4449 	cmpmi	sp, r9, asr #8
     848:	4f435f43 	svcmi	0x00435f43
     84c:	3d20464e 	stccc	6, cr4, [r0, #-312]!	; 0xfffffec8
     850:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     854:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     858:	0000000a 	andeq	r0, r0, sl

0000085c <.LC81>:
     85c:	414d4449 	cmpmi	sp, r9, asr #8
     860:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
     864:	4e455f41 	cdpmi	15, 4, cr5, cr5, cr1, {2}
     868:	203d2031 	eorscs	r2, sp, r1, lsr r0
     86c:	25783009 	ldrbcs	r3, [r8, #-9]!
     870:	0a583830 	beq	160e938 <__crc_ipu_ch_param_bad_alpha_pos+0xe215b9>
     874:	00000000 	andeq	r0, r0, r0

00000878 <.LC82>:
     878:	414d4449 	cmpmi	sp, r9, asr #8
     87c:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
     880:	4e455f41 	cdpmi	15, 4, cr5, cr5, cr1, {2}
     884:	203d2032 	eorscs	r2, sp, r2, lsr r0
     888:	25783009 	ldrbcs	r3, [r8, #-9]!
     88c:	0a583830 	beq	160e954 <__crc_ipu_ch_param_bad_alpha_pos+0xe215d5>
     890:	00000000 	andeq	r0, r0, r0

00000894 <.LC83>:
     894:	414d4449 	cmpmi	sp, r9, asr #8
     898:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
     89c:	52505f41 	subspl	r5, r0, #260	; 0x104
     8a0:	3d203149 	stfccs	f3, [r0, #-292]!	; 0xfffffedc
     8a4:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     8a8:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     8ac:	0000000a 	andeq	r0, r0, sl

000008b0 <.LC84>:
     8b0:	414d4449 	cmpmi	sp, r9, asr #8
     8b4:	48435f43 	stmdami	r3, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
     8b8:	52505f41 	subspl	r5, r0, #260	; 0x104
     8bc:	3d203249 	sfmcc	f3, 4, [r0, #-292]!	; 0xfffffedc
     8c0:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     8c4:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     8c8:	0000000a 	andeq	r0, r0, sl

000008cc <.LC85>:
     8cc:	414d4449 	cmpmi	sp, r9, asr #8
     8d0:	41425f43 	cmpmi	r2, r3, asr #30
     8d4:	455f444e 	ldrbmi	r4, [pc, #-1102]	; 48e <.LC36+0xa>
     8d8:	3d20314e 	stfccs	f3, [r0, #-312]!	; 0xfffffec8
     8dc:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     8e0:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     8e4:	0000000a 	andeq	r0, r0, sl

000008e8 <.LC86>:
     8e8:	414d4449 	cmpmi	sp, r9, asr #8
     8ec:	41425f43 	cmpmi	r2, r3, asr #30
     8f0:	455f444e 	ldrbmi	r4, [pc, #-1102]	; 4aa <.LC36+0x26>
     8f4:	3d20324e 	sfmcc	f3, 4, [r0, #-312]!	; 0xfffffec8
     8f8:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     8fc:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     900:	0000000a 	andeq	r0, r0, sl

00000904 <.LC87>:
     904:	5f555049 	svcpl	0x00555049
     908:	5f414843 	svcpl	0x00414843
     90c:	4d5f4244 	lfmmi	f4, 2, [pc, #-272]	; 804 <.LC77+0x4>
     910:	5f45444f 	svcpl	0x0045444f
     914:	304c4553 	subcc	r4, ip, r3, asr r5
     918:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     91c:	30257830 	eorcc	r7, r5, r0, lsr r8
     920:	000a5838 	andeq	r5, sl, r8, lsr r8

00000924 <.LC88>:
     924:	5f555049 	svcpl	0x00555049
     928:	5f414843 	svcpl	0x00414843
     92c:	4d5f4244 	lfmmi	f4, 2, [pc, #-272]	; 824 <.LC78+0x10>
     930:	5f45444f 	svcpl	0x0045444f
     934:	314c4553 	cmpcc	ip, r3, asr r5
     938:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     93c:	30257830 	eorcc	r7, r5, r0, lsr r8
     940:	000a5838 	andeq	r5, sl, r8, lsr r8

00000944 <.LC89>:
     944:	5f555049 	svcpl	0x00555049
     948:	5f414843 	svcpl	0x00414843
     94c:	5f425254 	svcpl	0x00425254
     950:	45444f4d 	strbmi	r4, [r4, #-3917]	; 0xfffff0b3
     954:	4c45535f 	mcrrmi	3, 5, r5, r5, cr15
     958:	203d2030 	eorscs	r2, sp, r0, lsr r0
     95c:	25783009 	ldrbcs	r3, [r8, #-9]!
     960:	0a583830 	beq	160ea28 <__crc_ipu_ch_param_bad_alpha_pos+0xe216a9>
     964:	00000000 	andeq	r0, r0, r0

00000968 <.LC90>:
     968:	5f555049 	svcpl	0x00555049
     96c:	5f414843 	svcpl	0x00414843
     970:	5f425254 	svcpl	0x00425254
     974:	45444f4d 	strbmi	r4, [r4, #-3917]	; 0xfffff0b3
     978:	4c45535f 	mcrrmi	3, 5, r5, r5, cr15
     97c:	203d2031 	eorscs	r2, sp, r1, lsr r0
     980:	25783009 	ldrbcs	r3, [r8, #-9]!
     984:	0a583830 	beq	160ea4c <__crc_ipu_ch_param_bad_alpha_pos+0xe216cd>
     988:	00000000 	andeq	r0, r0, r0

0000098c <.LC91>:
     98c:	43464d44 	movtmi	r4, #27972	; 0x6d44
     990:	5f52575f 	svcpl	0x0052575f
     994:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
     998:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     99c:	30257830 	eorcc	r7, r5, r0, lsr r8
     9a0:	000a5838 	andeq	r5, sl, r8, lsr r8

000009a4 <.LC92>:
     9a4:	43464d44 	movtmi	r4, #27972	; 0x6d44
     9a8:	5f52575f 	svcpl	0x0052575f
     9ac:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
     9b0:	4645445f 			; <UNDEFINED> instruction: 0x4645445f
     9b4:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     9b8:	30257830 	eorcc	r7, r5, r0, lsr r8
     9bc:	000a5838 	andeq	r5, sl, r8, lsr r8

000009c0 <.LC93>:
     9c0:	43464d44 	movtmi	r4, #27972	; 0x6d44
     9c4:	5f50445f 	svcpl	0x0050445f
     9c8:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
     9cc:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     9d0:	30257830 	eorcc	r7, r5, r0, lsr r8
     9d4:	000a5838 	andeq	r5, sl, r8, lsr r8

000009d8 <.LC94>:
     9d8:	43464d44 	movtmi	r4, #27972	; 0x6d44
     9dc:	5f50445f 	svcpl	0x0050445f
     9e0:	4e414843 	cdpmi	8, 4, cr4, cr1, cr3, {2}
     9e4:	4645445f 			; <UNDEFINED> instruction: 0x4645445f
     9e8:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     9ec:	30257830 	eorcc	r7, r5, r0, lsr r8
     9f0:	000a5838 	andeq	r5, sl, r8, lsr r8

000009f4 <.LC95>:
     9f4:	43464d44 	movtmi	r4, #27972	; 0x6d44
     9f8:	5f43495f 	svcpl	0x0043495f
     9fc:	4c525443 	cfldrdmi	mvd5, [r2], {67}	; 0x43
     a00:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     a04:	30257830 	eorcc	r7, r5, r0, lsr r8
     a08:	000a5838 	andeq	r5, sl, r8, lsr r8

00000a0c <.LC96>:
     a0c:	5f555049 	svcpl	0x00555049
     a10:	505f5346 	subspl	r5, pc, r6, asr #6
     a14:	5f434f52 	svcpl	0x00434f52
     a18:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
     a1c:	203d2031 	eorscs	r2, sp, r1, lsr r0
     a20:	25783009 	ldrbcs	r3, [r8, #-9]!
     a24:	0a583830 	beq	160eaec <__crc_ipu_ch_param_bad_alpha_pos+0xe2176d>
     a28:	00000000 	andeq	r0, r0, r0

00000a2c <.LC97>:
     a2c:	5f555049 	svcpl	0x00555049
     a30:	505f5346 	subspl	r5, pc, r6, asr #6
     a34:	5f434f52 	svcpl	0x00434f52
     a38:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
     a3c:	203d2032 	eorscs	r2, sp, r2, lsr r0
     a40:	25783009 	ldrbcs	r3, [r8, #-9]!
     a44:	0a583830 	beq	160eb0c <__crc_ipu_ch_param_bad_alpha_pos+0xe2178d>
     a48:	00000000 	andeq	r0, r0, r0

00000a4c <.LC98>:
     a4c:	5f555049 	svcpl	0x00555049
     a50:	505f5346 	subspl	r5, pc, r6, asr #6
     a54:	5f434f52 	svcpl	0x00434f52
     a58:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
     a5c:	203d2033 	eorscs	r2, sp, r3, lsr r0
     a60:	25783009 	ldrbcs	r3, [r8, #-9]!
     a64:	0a583830 	beq	160eb2c <__crc_ipu_ch_param_bad_alpha_pos+0xe217ad>
     a68:	00000000 	andeq	r0, r0, r0

00000a6c <.LC99>:
     a6c:	5f555049 	svcpl	0x00555049
     a70:	445f5346 	ldrbmi	r5, [pc], #-838	; a78 <.LC99+0xc>
     a74:	5f505349 	svcpl	0x00505349
     a78:	574f4c46 	strbpl	r4, [pc, -r6, asr #24]
     a7c:	203d2031 	eorscs	r2, sp, r1, lsr r0
     a80:	25783009 	ldrbcs	r3, [r8, #-9]!
     a84:	0a583830 	beq	160eb4c <__crc_ipu_ch_param_bad_alpha_pos+0xe217cd>
     a88:	00000000 	andeq	r0, r0, r0

00000a8c <.LC100>:
     a8c:	5f555049 	svcpl	0x00555049
     a90:	43494456 	movtmi	r4, #37974	; 0x9456
     a94:	4944565f 	stmdbmi	r4, {r0, r1, r2, r3, r4, r6, r9, sl, ip, lr}^
     a98:	4953465f 	ldmdbmi	r3, {r0, r1, r2, r3, r4, r6, r9, sl, lr}^
     a9c:	3d20455a 	cfstr32cc	mvfx4, [r0, #-360]!	; 0xfffffe98
     aa0:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     aa4:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     aa8:	0000000a 	andeq	r0, r0, sl

00000aac <.LC101>:
     aac:	5f555049 	svcpl	0x00555049
     ab0:	43494456 	movtmi	r4, #37974	; 0x9456
     ab4:	4944565f 	stmdbmi	r4, {r0, r1, r2, r3, r4, r6, r9, sl, ip, lr}^
     ab8:	3d20435f 	stccc	3, cr4, [r0, #-380]!	; 0xfffffe84
     abc:	78300920 	ldmdavc	r0!, {r5, r8, fp}
     ac0:	58383025 	ldmdapl	r8!, {r0, r2, r5, ip, sp}
     ac4:	0000000a 	andeq	r0, r0, sl

00000ac8 <.LC102>:
     ac8:	5f555049 	svcpl	0x00555049
     acc:	435f4349 	cmpmi	pc, #603979777	; 0x24000001
     ad0:	20464e4f 	subcs	r4, r6, pc, asr #28
     ad4:	3009203d 	andcc	r2, r9, sp, lsr r0
     ad8:	38302578 	ldmdacc	r0!, {r3, r4, r5, r6, r8, sl, sp}
     adc:	00000a58 	andeq	r0, r0, r8, asr sl

00000ae0 <.LC103>:
     ae0:	6e616843 	cdpvs	8, 6, cr6, cr1, cr3, {2}
     ae4:	206c656e 	rsbcs	r6, ip, lr, ror #10
     ae8:	65726c61 	ldrbvs	r6, [r2, #-3169]!	; 0xfffff39f
     aec:	20796461 	rsbscs	r6, r9, r1, ror #8
     af0:	61736964 	cmnvs	r3, r4, ror #18
     af4:	64656c62 	strbtvs	r6, [r5], #-3170	; 0xfffff39e
     af8:	0a642520 	beq	1909f80 <__crc_ipu_ch_param_bad_alpha_pos+0x111cc01>
     afc:	00000000 	andeq	r0, r0, r0

00000b00 <.LC104>:
     b00:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
     b04:	3a676e69 	bcc	19dc4b0 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef131>
     b08:	69617720 	stmdbvs	r1!, {r5, r8, r9, sl, ip, sp, lr}^
     b0c:	6f662074 	svcvs	0x00662074
     b10:	67622072 			; <UNDEFINED> instruction: 0x67622072
     b14:	6e797320 	cdpvs	3, 7, cr7, cr9, cr0, {1}
     b18:	6f652063 	svcvs	0x00652063
     b1c:	69742066 	ldmdbvs	r4!, {r1, r2, r5, r6, sp}^
     b20:	756f656d 	strbvc	r6, [pc, #-1389]!	; 5bb <.LC56+0x3>
     b24:	00000a74 	andeq	r0, r0, r4, ror sl

00000b28 <.LC105>:
     b28:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
     b2c:	3a676e69 	bcc	19dc4d8 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef159>
     b30:	206f6e20 	rsbcs	r6, pc, r0, lsr #28
     b34:	6e616863 	cdpvs	8, 6, cr6, cr1, cr3, {3}
     b38:	206c656e 	rsbcs	r6, ip, lr, ror #10
     b3c:	79737562 	ldmdbvc	r3!, {r1, r5, r6, r8, sl, ip, sp, lr}^
     b40:	7262202c 	rsbvc	r2, r2, #44	; 0x2c
     b44:	0a6b6165 	beq	1ad90e0 <__crc_ipu_ch_param_bad_alpha_pos+0x12ebd61>
     b48:	00000000 	andeq	r0, r0, r0

00000b4c <.LC106>:
     b4c:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
     b50:	3a676e69 	bcc	19dc4fc <__crc_ipu_ch_param_bad_alpha_pos+0x11ef17d>
     b54:	61686320 	cmnvs	r8, r0, lsr #6
     b58:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
     b5c:	20642520 	rsbcs	r2, r4, r0, lsr #10
     b60:	79737562 	ldmdbvc	r3!, {r1, r5, r6, r8, sl, ip, sp, lr}^
     b64:	656e202c 	strbvs	r2, [lr, #-44]!	; 0xffffffd4
     b68:	77206465 	strvc	r6, [r0, -r5, ror #8]!
     b6c:	0a746961 	beq	1d1b0f8 <__crc_ipu_ch_param_bad_alpha_pos+0x152dd79>
     b70:	00000000 	andeq	r0, r0, r0

00000b74 <.LC107>:
     b74:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
     b78:	3a676e69 	bcc	19dc524 <__crc_ipu_ch_param_bad_alpha_pos+0x11ef1a5>
     b7c:	73696420 	cmnvc	r9, #32, 8	; 0x20000000
     b80:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
     b84:	75706920 	ldrbvc	r6, [r0, #-2336]!	; 0xfffff6e0
     b88:	616d6420 	cmnvs	sp, r0, lsr #8
     b8c:	61686320 	cmnvs	r8, r0, lsr #6
     b90:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
     b94:	20642520 	rsbcs	r2, r4, r0, lsr #10
     b98:	69727564 	ldmdbvs	r2!, {r2, r5, r6, r8, sl, ip, sp, lr}^
     b9c:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
     ba0:	62207374 	eorvs	r7, r0, #116, 6	; 0xd0000001
     ba4:	20797375 	rsbscs	r7, r9, r5, ror r3
     ba8:	74617473 	strbtvc	r7, [r1], #-1139	; 0xfffffb8d
     bac:	00000a65 	andeq	r0, r0, r5, ror #20

00000bb0 <.LC108>:
     bb0:	74696177 	strbtvc	r6, [r9], #-375	; 0xfffffe89
     bb4:	6d69745f 	cfstrdvs	mvd7, [r9, #-380]!	; 0xfffffe84
     bb8:	64253a65 	strtvs	r3, [r5], #-2661	; 0xfffff59b
     bbc:	0000000a 	andeq	r0, r0, sl

00000bc0 <.LC109>:
     bc0:	20757069 	rsbscs	r7, r5, r9, rrx
     bc4:	66737562 	ldrbtvs	r7, [r3], -r2, ror #10
     bc8:	20716572 	rsbscs	r6, r1, r2, ror r5
     bcc:	68676968 	stmdavs	r7!, {r3, r5, r6, r8, fp, sp, lr}^
     bd0:	6c657220 	sfmvs	f7, 2, [r5], #-128	; 0xffffff80
     bd4:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
     bd8:	00000a2e 	andeq	r0, r0, lr, lsr #20

00000bdc <.LC110>:
     bdc:	20757069 	rsbscs	r7, r5, r9, rrx
     be0:	66737562 	ldrbtvs	r7, [r3], -r2, ror #10
     be4:	20716572 	rsbscs	r6, r1, r2, ror r5
     be8:	68676968 	stmdavs	r7!, {r3, r5, r6, r8, fp, sp, lr}^
     bec:	71657220 	cmnvc	r5, r0, lsr #4
     bf0:	2e747375 	mrccs	3, 3, r7, cr4, cr5, {3}
     bf4:	0000000a 	andeq	r0, r0, sl

00000bf8 <.LC111>:
     bf8:	75706926 	ldrbvc	r6, [r0, #-2342]!	; 0xfffff6da
     bfc:	756d3e2d 	strbvc	r3, [sp, #-3629]!	; 0xfffff1d3
     c00:	5f786574 	svcpl	0x00786574
     c04:	6b636f6c 	blvs	18dc9bc <__crc_ipu_ch_param_bad_alpha_pos+0x10ef63d>
     c08:	00000000 	andeq	r0, r0, r0
     c0c:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
     c10:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
     c14:	00000000 	andeq	r0, r0, r0
     c18:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
     c1c:	00004833 	andeq	r4, r0, r3, lsr r8
     c20:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
     c24:	00004d33 	andeq	r4, r0, r3, lsr sp
     c28:	76555049 	ldrbvc	r5, [r5], -r9, asr #32
     c2c:	00584533 	subseq	r4, r8, r3, lsr r5
     c30:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; b7c <.LC107+0x8>
     c34:	6f6e2f65 	svcvs	0x006e2f65
     c38:	5f6e616c 	svcpl	0x006e616c
     c3c:	2f6e6179 	svccs	0x006e6179
     c40:	6b736544 	blvs	1cda158 <__crc_ipu_ch_param_bad_alpha_pos+0x14ecdd9>
     c44:	2f706f74 	svccs	0x00706f74
     c48:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
     c4c:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
     c50:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     c54:	70692f73 	rsbvc	r2, r9, r3, ror pc
     c58:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
     c5c:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
     c60:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
     c64:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
     c68:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
     c6c:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
     c70:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
     c74:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
     c78:	7261705f 	rsbvc	r7, r1, #95	; 0x5f
     c7c:	6d5f6d61 	ldclvs	13, cr6, [pc, #-388]	; b00 <.LC104>
     c80:	682e6d65 	stmdavs	lr!, {r0, r2, r5, r6, r8, sl, fp, sp, lr}
     c84:	00000000 	andeq	r0, r0, r0

00000c88 <.LC0>:
     c88:	75736e55 	ldrbvc	r6, [r3, #-3669]!	; 0xfffff1ab
     c8c:	726f7070 	rsbvc	r7, pc, #112	; 0x70
     c90:	20646574 	rsbcs	r6, r4, r4, ror r5
     c94:	6f6c6f63 	svcvs	0x006c6f63
     c98:	70732072 	rsbsvc	r2, r3, r2, ror r0
     c9c:	20656361 	rsbcs	r6, r5, r1, ror #6
     ca0:	766e6f63 	strbtvc	r6, [lr], -r3, ror #30
     ca4:	69737265 	ldmdbvs	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
     ca8:	000a6e6f 	andeq	r6, sl, pc, ror #28

00000cac <.LC1>:
     cac:	69204349 	stmdbvs	r0!, {r0, r3, r6, r8, r9, lr}
     cb0:	7475706e 	ldrbtvc	r7, [r5], #-110	; 0xffffff92
     cb4:	7a697320 	bvc	1a5d93c <__crc_ipu_ch_param_bad_alpha_pos+0x12705bd>
     cb8:	64252865 	strtvs	r2, [r5], #-2149	; 0xfffff79b
     cbc:	61632029 	cmnvs	r3, r9, lsr #32
     cc0:	746f6e6e 	strbtvc	r6, [pc], #-3694	; cc8 <.LC1+0x1c>
     cc4:	63786520 	cmnvs	r8, #32, 10	; 0x8000000
     cc8:	20646565 	rsbcs	r6, r4, r5, ror #10
     ccc:	36393034 			; <UNDEFINED> instruction: 0x36393034
     cd0:	0000000a 	andeq	r0, r0, sl

00000cd4 <.LC2>:
     cd4:	6f204349 	svcvs	0x00204349
     cd8:	75707475 	ldrbvc	r7, [r0, #-1141]!	; 0xfffffb8b
     cdc:	69732074 	ldmdbvs	r3!, {r2, r4, r5, r6, sp}^
     ce0:	2528657a 	strcs	r6, [r8, #-1402]!	; 0xfffffa86
     ce4:	63202964 			; <UNDEFINED> instruction: 0x63202964
     ce8:	6f6e6e61 	svcvs	0x006e6e61
     cec:	78652074 	stmdavc	r5!, {r2, r4, r5, r6, sp}^
     cf0:	64656563 	strbtvs	r6, [r5], #-1379	; 0xfffffa9d
     cf4:	32303120 	eorscc	r3, r0, #32, 2
     cf8:	00000a34 	andeq	r0, r0, r4, lsr sl

00000cfc <.LC3>:
     cfc:	63204349 			; <UNDEFINED> instruction: 0x63204349
     d00:	6f6e6e61 	svcvs	0x006e6e61
     d04:	6f642074 	svcvs	0x00642074
     d08:	69736e77 	ldmdbvs	r3!, {r0, r1, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
     d0c:	6d20657a 	cfstr32vs	mvfx6, [r0, #-488]!	; 0xfffffe18
     d10:	2065726f 	rsbcs	r7, r5, pc, ror #4
     d14:	6e616874 	mcrvs	8, 3, r6, cr1, cr4, {3}
     d18:	313a3820 	teqcc	sl, r0, lsr #16
     d1c:	0000000a 	andeq	r0, r0, sl

00000d20 <.LC4>:
     d20:	7265764f 	rsbvc	r7, r5, #82837504	; 0x4f00000
     d24:	776f6c66 	strbvc	r6, [pc, -r6, ror #24]!
     d28:	206e6f20 	rsbcs	r6, lr, r0, lsr #30
     d2c:	72204349 	eorvc	r4, r0, #603979777	; 0x24000001
     d30:	7a697365 	bvc	1a5dacc <__crc_ipu_ch_param_bad_alpha_pos+0x127074d>
     d34:	6f632065 	svcvs	0x00632065
     d38:	69666665 	stmdbvs	r6!, {r0, r2, r5, r6, r9, sl, sp, lr}^
     d3c:	6e656963 	vnmulvs.f16	s13, s10, s7	; <UNPREDICTABLE>
     d40:	000a2e74 	andeq	r2, sl, r4, ror lr

00000d44 <.LC5>:
     d44:	69736572 	ldmdbvs	r3!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     d48:	676e697a 			; <UNDEFINED> instruction: 0x676e697a
     d4c:	6f726620 	svcvs	0x00726620
     d50:	7525206d 	strvc	r2, [r5, #-109]!	; 0xffffff93
     d54:	203e2d20 	eorscs	r2, lr, r0, lsr #26
     d58:	70207525 	eorvc	r7, r0, r5, lsr #10
     d5c:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
     d60:	64202c73 	strtvs	r2, [r0], #-3187	; 0xfffff38d
     d64:	736e776f 	cmnvc	lr, #29097984	; 0x1bc0000
     d68:	3d657a69 	vstmdbcc	r5!, {s15-s119}
     d6c:	202c7525 	eorcs	r7, ip, r5, lsr #10
     d70:	69736572 	ldmdbvs	r3!, {r1, r4, r5, r6, r8, sl, sp, lr}^
     d74:	253d657a 	ldrcs	r6, [sp, #-1402]!	; 0xfffffa86
     d78:	6c252e75 	stcvs	14, cr2, [r5], #-468	; 0xfffffe2c
     d7c:	72282075 	eorvc	r2, r8, #117	; 0x75
     d80:	253d6765 	ldrcs	r6, [sp, #-1893]!	; 0xfffff89b
     d84:	000a2975 	andeq	r2, sl, r5, ror r9

00000d88 <.LC6>:
     d88:	5f494456 	svcpl	0x00494456
     d8c:	203d2043 	eorscs	r2, sp, r3, asr #32
     d90:	25783009 	ldrbcs	r3, [r8, #-9]!
     d94:	0a583830 	beq	160ee5c <__crc_ipu_ch_param_bad_alpha_pos+0xe21add>
     d98:	00000000 	andeq	r0, r0, r0

00000d9c <.LC7>:
     d9c:	43493701 	movtmi	r3, #38657	; 0x9701
     da0:	4e4f435f 	mcrmi	3, 2, r4, cr15, cr15, {2}
     da4:	203d2046 	eorscs	r2, sp, r6, asr #32
     da8:	25783009 	ldrbcs	r3, [r8, #-9]!
     dac:	0a583830 	beq	160ee74 <__crc_ipu_ch_param_bad_alpha_pos+0xe21af5>
     db0:	00000000 	andeq	r0, r0, r0

00000db4 <.LC8>:
     db4:	43493701 	movtmi	r3, #38657	; 0x9701
     db8:	5052505f 	subspl	r5, r2, pc, asr r0
     dbc:	434e455f 	movtmi	r4, #58719	; 0xe55f
     dc0:	4353525f 	cmpmi	r3, #-268435451	; 0xf0000005
     dc4:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     dc8:	30257830 	eorcc	r7, r5, r0, lsr r8
     dcc:	000a5838 	andeq	r5, sl, r8, lsr r8

00000dd0 <.LC9>:
     dd0:	43493701 	movtmi	r3, #38657	; 0x9701
     dd4:	5052505f 	subspl	r5, r2, pc, asr r0
     dd8:	5f46565f 	svcpl	0x0046565f
     ddc:	20435352 	subcs	r5, r3, r2, asr r3
     de0:	3009203d 	andcc	r2, r9, sp, lsr r0
     de4:	38302578 	ldmdacc	r0!, {r3, r4, r5, r6, r8, sl, sp}
     de8:	00000a58 	andeq	r0, r0, r8, asr sl

00000dec <.LC10>:
     dec:	43493701 	movtmi	r3, #38657	; 0x9701
     df0:	5f50505f 	svcpl	0x0050505f
     df4:	20435352 	subcs	r5, r3, r2, asr r3
     df8:	3009203d 	andcc	r2, r9, sp, lsr r0
     dfc:	38302578 	ldmdacc	r0!, {r3, r4, r5, r6, r8, sl, sp}
     e00:	00000a58 	andeq	r0, r0, r8, asr sl

00000e04 <.LC11>:
     e04:	43493701 	movtmi	r3, #38657	; 0x9701
     e08:	4d44495f 	vstrmi.16	s9, [r4, #-190]	; 0xffffff42	; <UNPREDICTABLE>
     e0c:	315f4341 	cmpcc	pc, r1, asr #6
     e10:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     e14:	30257830 	eorcc	r7, r5, r0, lsr r8
     e18:	000a5838 	andeq	r5, sl, r8, lsr r8

00000e1c <.LC12>:
     e1c:	43493701 	movtmi	r3, #38657	; 0x9701
     e20:	4d44495f 	vstrmi.16	s9, [r4, #-190]	; 0xffffff42	; <UNPREDICTABLE>
     e24:	325f4341 	subscc	r4, pc, #67108865	; 0x4000001
     e28:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     e2c:	30257830 	eorcc	r7, r5, r0, lsr r8
     e30:	000a5838 	andeq	r5, sl, r8, lsr r8

00000e34 <.LC13>:
     e34:	43493701 	movtmi	r3, #38657	; 0x9701
     e38:	4d44495f 	vstrmi.16	s9, [r4, #-190]	; 0xffffff42	; <UNPREDICTABLE>
     e3c:	335f4341 	cmpcc	pc, #67108865	; 0x4000001
     e40:	09203d20 	stmdbeq	r0!, {r5, r8, sl, fp, ip, sp}
     e44:	30257830 	eorcc	r7, r5, r0, lsr r8
     e48:	000a5838 	andeq	r5, sl, r8, lsr r8

00000e4c <.LC14>:
     e4c:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     e50:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     e54:	6163206f 	cmnvs	r3, pc, rrx
     e58:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     e5c:	20657461 	rsbcs	r7, r5, r1, ror #8
     e60:	76707270 			; <UNDEFINED> instruction: 0x76707270
     e64:	65682066 	strbvs	r2, [r8, #-102]!	; 0xffffff9a
     e68:	74686769 	strbtvc	r6, [r8], #-1897	; 0xfffff897
     e6c:	61637320 	cmnvs	r3, r0, lsr #6
     e70:	676e696c 	strbvs	r6, [lr, -ip, ror #18]!
     e74:	656f6320 	strbvs	r6, [pc, #-800]!	; b5c <.LC106+0x10>
     e78:	63696666 	cmnvs	r9, #106954752	; 0x6600000
     e7c:	746e6569 	strbtvc	r6, [lr], #-1385	; 0xfffffa97
     e80:	00000a73 	andeq	r0, r0, r3, ror sl

00000e84 <.LC15>:
     e84:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     e88:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     e8c:	6163206f 	cmnvs	r3, pc, rrx
     e90:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     e94:	20657461 	rsbcs	r7, r5, r1, ror #8
     e98:	76707270 			; <UNDEFINED> instruction: 0x76707270
     e9c:	69772066 	ldmdbvs	r7!, {r1, r2, r5, r6, sp}^
     ea0:	20687464 	rsbcs	r7, r8, r4, ror #8
     ea4:	6c616373 	stclvs	3, cr6, [r1], #-460	; 0xfffffe34
     ea8:	20676e69 	rsbcs	r6, r7, r9, ror #28
     eac:	66656f63 	strbtvs	r6, [r5], -r3, ror #30
     eb0:	69636966 	stmdbvs	r3!, {r1, r2, r5, r6, r8, fp, sp, lr}^
     eb4:	73746e65 	cmnvc	r4, #1616	; 0x650
     eb8:	0000000a 	andeq	r0, r0, sl

00000ebc <.LC16>:
     ebc:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     ec0:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     ec4:	6163206f 	cmnvs	r3, pc, rrx
     ec8:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     ecc:	20657461 	rsbcs	r7, r5, r1, ror #8
     ed0:	65707270 	ldrbvs	r7, [r0, #-624]!	; 0xfffffd90
     ed4:	6820636e 	stmdavs	r0!, {r1, r2, r3, r5, r6, r8, r9, sp, lr}
     ed8:	68676965 	stmdavs	r7!, {r0, r2, r5, r6, r8, fp, sp, lr}^
     edc:	63732074 	cmnvs	r3, #116	; 0x74
     ee0:	6e696c61 	cdpvs	12, 6, cr6, cr9, cr1, {3}
     ee4:	6f632067 	svcvs	0x00632067
     ee8:	69666665 	stmdbvs	r6!, {r0, r2, r5, r6, r9, sl, sp, lr}^
     eec:	6e656963 	vnmulvs.f16	s13, s10, s7	; <UNPREDICTABLE>
     ef0:	000a7374 	andeq	r7, sl, r4, ror r3

00000ef4 <.LC17>:
     ef4:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     ef8:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     efc:	6163206f 	cmnvs	r3, pc, rrx
     f00:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     f04:	20657461 	rsbcs	r7, r5, r1, ror #8
     f08:	65707270 	ldrbvs	r7, [r0, #-624]!	; 0xfffffd90
     f0c:	7720636e 	strvc	r6, [r0, -lr, ror #6]!
     f10:	68746469 	ldmdavs	r4!, {r0, r3, r5, r6, sl, sp, lr}^
     f14:	61637320 	cmnvs	r3, r0, lsr #6
     f18:	676e696c 	strbvs	r6, [lr, -ip, ror #18]!
     f1c:	656f6320 	strbvs	r6, [pc, #-800]!	; c04 <.LC111+0xc>
     f20:	63696666 	cmnvs	r9, #106954752	; 0x6600000
     f24:	746e6569 	strbtvc	r6, [lr], #-1385	; 0xfffffa97
     f28:	00000a73 	andeq	r0, r0, r3, ror sl

00000f2c <.LC18>:
     f2c:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     f30:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     f34:	6163206f 	cmnvs	r3, pc, rrx
     f38:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     f3c:	20657461 	rsbcs	r7, r5, r1, ror #8
     f40:	68207070 	stmdavs	r0!, {r4, r5, r6, ip, sp, lr}
     f44:	68676965 	stmdavs	r7!, {r0, r2, r5, r6, r8, fp, sp, lr}^
     f48:	63732074 	cmnvs	r3, #116	; 0x74
     f4c:	6e696c61 	cdpvs	12, 6, cr6, cr9, cr1, {3}
     f50:	6f632067 	svcvs	0x00632067
     f54:	69666665 	stmdbvs	r6!, {r0, r2, r5, r6, r9, sl, sp, lr}^
     f58:	6e656963 	vnmulvs.f16	s13, s10, s7	; <UNPREDICTABLE>
     f5c:	000a7374 	andeq	r7, sl, r4, ror r3

00000f60 <.LC19>:
     f60:	6c696166 	stfvse	f6, [r9], #-408	; 0xfffffe68
     f64:	74206465 	strtvc	r6, [r0], #-1125	; 0xfffffb9b
     f68:	6163206f 	cmnvs	r3, pc, rrx
     f6c:	6c75636c 	ldclvs	3, cr6, [r5], #-432	; 0xfffffe50
     f70:	20657461 	rsbcs	r7, r5, r1, ror #8
     f74:	77207070 			; <UNDEFINED> instruction: 0x77207070
     f78:	68746469 	ldmdavs	r4!, {r0, r3, r5, r6, sl, sp, lr}^
     f7c:	61637320 	cmnvs	r3, r0, lsr #6
     f80:	676e696c 	strbvs	r6, [lr, -ip, ror #18]!
     f84:	656f6320 	strbvs	r6, [pc, #-800]!	; c6c <.LC111+0x74>
     f88:	63696666 	cmnvs	r9, #106954752	; 0x6600000
     f8c:	746e6569 	strbtvc	r6, [lr], #-1385	; 0xfffffa97
     f90:	00000a73 	andeq	r0, r0, r3, ror sl

00000f94 <.LC20>:
     f94:	656c6c49 	strbvs	r6, [ip, #-3145]!	; 0xfffff3b7
     f98:	206c6167 	rsbcs	r6, ip, r7, ror #2
     f9c:	73727562 	cmnvc	r2, #411041792	; 0x18800000
     fa0:	656c2074 	strbvs	r2, [ip, #-116]!	; 0xffffff8c
     fa4:	6874676e 	ldmdavs	r4!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}^
     fa8:	726f6620 	rsbvc	r6, pc, #32, 12	; 0x2000000
     fac:	0a434920 	beq	10d3434 <__crc_ipu_ch_param_bad_alpha_pos+0x8e60b5>
     fb0:	00000000 	andeq	r0, r0, r0

00000fb4 <.LC21>:
     fb4:	73727562 	cmnvc	r2, #411041792	; 0x18800000
     fb8:	69735f74 	ldmdbvs	r3!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
     fbc:	203a657a 	eorscs	r6, sl, sl, ror r5
     fc0:	000a6425 	andeq	r6, sl, r5, lsr #8
     fc4:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
     fc8:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
     fcc:	00000000 	andeq	r0, r0, r0
     fd0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; f1c <.LC17+0x28>
     fd4:	6f6e2f65 	svcvs	0x006e2f65
     fd8:	5f6e616c 	svcpl	0x006e616c
     fdc:	2f6e6179 	svccs	0x006e6179
     fe0:	6b736544 	blvs	1cda4f8 <__crc_ipu_ch_param_bad_alpha_pos+0x14ed179>
     fe4:	2f706f74 	svccs	0x00706f74
     fe8:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
     fec:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
     ff0:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
     ff4:	70692f73 	rsbvc	r2, r9, r3, ror pc
     ff8:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
     ffc:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
    1000:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
    1004:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
    1008:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
    100c:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1010:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
    1014:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1018:	2e63695f 			; <UNDEFINED> instruction: 0x2e63695f
    101c:	00000063 	andeq	r0, r0, r3, rrx

00001020 <.LC0>:
    1020:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
    1024:	0a292873 	beq	a4b1f8 <__crc_ipu_ch_param_bad_alpha_pos+0x25de79>
    1028:	00000000 	andeq	r0, r0, r0

0000102c <.LC1>:
    102c:	75736e55 	ldrbvc	r6, [r3, #-3669]!	; 0xfffff1ab
    1030:	726f7070 	rsbvc	r7, pc, #112	; 0x70
    1034:	20646574 	rsbcs	r6, r4, r4, ror r5
    1038:	52494343 	subpl	r4, r9, #201326593	; 0xc000001
    103c:	20363536 	eorscs	r3, r6, r6, lsr r5
    1040:	65746e69 	ldrbvs	r6, [r4, #-3689]!	; 0xfffff197
    1044:	63616c72 	cmnvs	r1, #29184	; 0x7200
    1048:	76206465 	strtvc	r6, [r0], -r5, ror #8
    104c:	6f656469 	svcvs	0x00656469
    1050:	646f6d20 	strbtvs	r6, [pc], #-3360	; 1058 <.LC2>
    1054:	00000a65 	andeq	r0, r0, r5, ror #20

00001058 <.LC2>:
    1058:	5f495343 	svcpl	0x00495343
    105c:	534e4553 	movtpl	r4, #58707	; 0xe553
    1060:	4e4f435f 	mcrmi	3, 2, r4, cr15, cr15, {2}
    1064:	203d2046 	eorscs	r2, sp, r6, asr #32
    1068:	30257830 	eorcc	r7, r5, r0, lsr r8
    106c:	000a5838 	andeq	r5, sl, r8, lsr r8

00001070 <.LC3>:
    1070:	5f495343 	svcpl	0x00495343
    1074:	5f544341 	svcpl	0x00544341
    1078:	5f4d5246 	svcpl	0x004d5246
    107c:	455a4953 	ldrbmi	r4, [sl, #-2387]	; 0xfffff6ad
    1080:	30203d20 	eorcc	r3, r0, r0, lsr #26
    1084:	38302578 	ldmdacc	r0!, {r3, r4, r5, r6, r8, sl, sp}
    1088:	00000a58 	andeq	r0, r0, r8, asr sl

0000108c <.LC4>:
    108c:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
    1090:	666f2065 	strbtvs	r2, [pc], -r5, rrx
    1094:	78697020 	stmdavc	r9!, {r5, ip, sp, lr}^
    1098:	635f6c65 	cmpvs	pc, #25856	; 0x6500
    109c:	65206b6c 	strvs	r6, [r0, #-2924]!	; 0xfffff494
    10a0:	6e657478 	mcrvs	4, 3, r7, cr5, cr8, {3}
    10a4:	6e207364 	cdpvs	3, 2, cr7, cr0, cr4, {3}
    10a8:	616d726f 	cmnvs	sp, pc, ror #4
    10ac:	6172206c 	cmnvs	r2, ip, rrx
    10b0:	0a65676e 	beq	195ae70 <__crc_ipu_ch_param_bad_alpha_pos+0x116daf1>
    10b4:	00000000 	andeq	r0, r0, r0

000010b8 <.LC5>:
    10b8:	25206e49 	strcs	r6, [r0, #-3657]!	; 0xfffff1b7
    10bc:	2c292873 	stccs	8, cr2, [r9], #-460	; 0xfffffe34
    10c0:	23494420 	movtcs	r4, #37920	; 0x9420
    10c4:	6425203a 	strtvs	r2, [r5], #-58	; 0xffffffc6
    10c8:	0000000a 	andeq	r0, r0, sl
    10cc:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
    10d0:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
    10d4:	00000000 	andeq	r0, r0, r0
    10d8:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1024 <.LC0+0x4>
    10dc:	6f6e2f65 	svcvs	0x006e2f65
    10e0:	5f6e616c 	svcpl	0x006e616c
    10e4:	2f6e6179 	svccs	0x006e6179
    10e8:	6b736544 	blvs	1cda600 <__crc_ipu_ch_param_bad_alpha_pos+0x14ed281>
    10ec:	2f706f74 	svccs	0x00706f74
    10f0:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
    10f4:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
    10f8:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    10fc:	70692f73 	rsbvc	r2, r9, r3, ror pc
    1100:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
    1104:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
    1108:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
    110c:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
    1110:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
    1114:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1118:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
    111c:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1120:	7061635f 	rsbvc	r6, r1, pc, asr r3
    1124:	65727574 	ldrbvs	r7, [r2, #-1396]!	; 0xfffffa8c
    1128:	0000632e 	andeq	r6, r0, lr, lsr #6

0000112c <.LC0>:
    112c:	69204349 	stmdbvs	r0!, {r0, r3, r6, r8, r9, lr}
    1130:	7475706e 	ldrbtvc	r7, [r5], #-110	; 0xffffff92
    1134:	7a697320 	bvc	1a5ddbc <__crc_ipu_ch_param_bad_alpha_pos+0x1270a3d>
    1138:	64252865 	strtvs	r2, [r5], #-2149	; 0xfffff79b
    113c:	61632029 	cmnvs	r3, r9, lsr #32
    1140:	746f6e6e 	strbtvc	r6, [pc], #-3694	; 1148 <.LC0+0x1c>
    1144:	63786520 	cmnvs	r8, #32, 10	; 0x8000000
    1148:	20646565 	rsbcs	r6, r4, r5, ror #10
    114c:	36393034 			; <UNDEFINED> instruction: 0x36393034
    1150:	0000000a 	andeq	r0, r0, sl

00001154 <.LC1>:
    1154:	6f204349 	svcvs	0x00204349
    1158:	75707475 	ldrbvc	r7, [r0, #-1141]!	; 0xfffffb8b
    115c:	69732074 	ldmdbvs	r3!, {r2, r4, r5, r6, sp}^
    1160:	2528657a 	strcs	r6, [r8, #-1402]!	; 0xfffffa86
    1164:	63202964 			; <UNDEFINED> instruction: 0x63202964
    1168:	6f6e6e61 	svcvs	0x006e6e61
    116c:	78652074 	stmdavc	r5!, {r2, r4, r5, r6, sp}^
    1170:	64656563 	strbtvs	r6, [r5], #-1379	; 0xfffffa9d
    1174:	32303120 	eorscc	r3, r0, #32, 2
    1178:	00000a34 	andeq	r0, r0, r4, lsr sl

0000117c <.LC2>:
    117c:	63204349 			; <UNDEFINED> instruction: 0x63204349
    1180:	6f6e6e61 	svcvs	0x006e6e61
    1184:	6f642074 	svcvs	0x00642074
    1188:	69736e77 	ldmdbvs	r3!, {r0, r1, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
    118c:	6d20657a 	cfstr32vs	mvfx6, [r0, #-488]!	; 0xfffffe18
    1190:	2065726f 	rsbcs	r7, r5, pc, ror #4
    1194:	6e616874 	mcrvs	8, 3, r6, cr1, cr4, {3}
    1198:	313a3820 	teqcc	sl, r0, lsr #16
    119c:	0000000a 	andeq	r0, r0, sl

000011a0 <.LC3>:
    11a0:	7265764f 	rsbvc	r7, r5, #82837504	; 0x4f00000
    11a4:	776f6c66 	strbvc	r6, [pc, -r6, ror #24]!
    11a8:	206e6f20 	rsbcs	r6, lr, r0, lsr #30
    11ac:	72204349 	eorvc	r4, r0, #603979777	; 0x24000001
    11b0:	7a697365 	bvc	1a5df4c <__crc_ipu_ch_param_bad_alpha_pos+0x1270bcd>
    11b4:	6f632065 	svcvs	0x00632065
    11b8:	69666665 	stmdbvs	r6!, {r0, r2, r5, r6, r9, sl, sp, lr}^
    11bc:	6e656963 	vnmulvs.f16	s13, s10, s7	; <UNPREDICTABLE>
    11c0:	000a2e74 	andeq	r2, sl, r4, ror lr

000011c4 <.LC4>:
    11c4:	69736572 	ldmdbvs	r3!, {r1, r4, r5, r6, r8, sl, sp, lr}^
    11c8:	676e697a 			; <UNDEFINED> instruction: 0x676e697a
    11cc:	6f726620 	svcvs	0x00726620
    11d0:	7525206d 	strvc	r2, [r5, #-109]!	; 0xffffff93
    11d4:	203e2d20 	eorscs	r2, lr, r0, lsr #26
    11d8:	70207525 	eorvc	r7, r0, r5, lsr #10
    11dc:	6c657869 	stclvs	8, cr7, [r5], #-420	; 0xfffffe5c
    11e0:	64202c73 	strtvs	r2, [r0], #-3187	; 0xfffff38d
    11e4:	736e776f 	cmnvc	lr, #29097984	; 0x1bc0000
    11e8:	3d657a69 	vstmdbcc	r5!, {s15-s119}
    11ec:	202c7525 	eorcs	r7, ip, r5, lsr #10
    11f0:	69736572 	ldmdbvs	r3!, {r1, r4, r5, r6, r8, sl, sp, lr}^
    11f4:	253d657a 	ldrcs	r6, [sp, #-1402]!	; 0xfffffa86
    11f8:	6c252e75 	stcvs	14, cr2, [r5], #-468	; 0xfffffe2c
    11fc:	72282075 	eorvc	r2, r8, #117	; 0x75
    1200:	253d6765 	ldrcs	r6, [sp, #-1893]!	; 0xfffff89b
    1204:	000a2975 	andeq	r2, sl, r5, ror r9

00001208 <.LC5>:
    1208:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
    120c:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
    1210:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
    1214:	2d2d2d2d 	stccs	13, cr2, [sp, #-180]!	; 0xffffff4c
    1218:	66690a3e 			; <UNDEFINED> instruction: 0x66690a3e
    121c:	203d2020 	eorscs	r2, sp, r0, lsr #32
    1220:	690a6425 	stmdbvs	sl, {r0, r2, r5, sl, sp, lr}
    1224:	3d20206d 	stccc	0, cr2, [r0, #-436]!	; 0xfffffe4c
    1228:	0a642520 	beq	190a6b0 <__crc_ipu_ch_param_bad_alpha_pos+0x111d331>
    122c:	3d20666f 	stccc	6, cr6, [r0, #-444]!	; 0xfffffe44
    1230:	0a642520 	beq	190a6b8 <__crc_ipu_ch_param_bad_alpha_pos+0x111d339>
    1234:	3d206d6f 	stccc	13, cr6, [r0, #-444]!	; 0xfffffe44
    1238:	0a642520 	beq	190a6c0 <__crc_ipu_ch_param_bad_alpha_pos+0x111d341>
    123c:	5f727269 	svcpl	0x00727269
    1240:	2074706f 	rsbscs	r7, r4, pc, rrx
    1244:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xfffff2e0
    1248:	0a756c6c 	beq	1d5c400 <__crc_ipu_ch_param_bad_alpha_pos+0x156f081>
    124c:	6f5f7272 	svcvs	0x005f7272
    1250:	20207470 	eorcs	r7, r0, r0, ror r4
    1254:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xfffff2e0
    1258:	0a756c6c 	beq	1d5c410 <__crc_ipu_ch_param_bad_alpha_pos+0x156f091>
    125c:	72726963 	rsbsvc	r6, r2, #1622016	; 0x18c000
    1260:	20202020 	eorcs	r2, r0, r0, lsr #32
    1264:	25203d20 	strcs	r3, [r0, #-3360]!	; 0xfffff2e0
    1268:	0a756c6c 	beq	1d5c420 <__crc_ipu_ch_param_bad_alpha_pos+0x156f0a1>
    126c:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
    1270:	6e69206c 	cdpvs	0, 6, cr2, cr9, cr12, {3}
    1274:	203d2020 	eorscs	r2, sp, r0, lsr #32
    1278:	78383025 	ldmdavc	r8!, {r0, r2, r5, ip, sp}
    127c:	7869700a 	stmdavc	r9!, {r1, r3, ip, sp, lr}^
    1280:	6f206c65 	svcvs	0x00206c65
    1284:	3d207475 	cfstrscc	mvf7, [r0, #-468]!	; 0xfffffe2c
    1288:	38302520 	ldmdacc	r0!, {r5, r8, sl, sp}
    128c:	66690a78 			; <UNDEFINED> instruction: 0x66690a78
    1290:	203d2077 	eorscs	r2, sp, r7, ror r0
    1294:	6f0a6425 	svcvs	0x000a6425
    1298:	64697766 	strbtvs	r7, [r9], #-1894	; 0xfffff89a
    129c:	3d206874 	stccc	8, cr6, [r0, #-464]!	; 0xfffffe30
    12a0:	0a642520 	beq	190a728 <__crc_ipu_ch_param_bad_alpha_pos+0x111d3a9>
    12a4:	00000000 	andeq	r0, r0, r0

000012a8 <.LC6>:
    12a8:	20776e69 	rsbscs	r6, r7, r9, ror #28
    12ac:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12b0:	20776e6f 	rsbscs	r6, r7, pc, ror #28
    12b4:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12b8:	20776c69 	rsbscs	r6, r7, r9, ror #24
    12bc:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12c0:	20636c69 	rsbcs	r6, r3, r9, ror #24
    12c4:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12c8:	20776c6f 	rsbscs	r6, r7, pc, ror #24
    12cc:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12d0:	20777269 	rsbscs	r7, r7, r9, ror #4
    12d4:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12d8:	20637269 	rsbcs	r7, r3, r9, ror #4
    12dc:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12e0:	2077726f 	rsbscs	r7, r7, pc, ror #4
    12e4:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12e8:	2063726f 	rsbcs	r7, r3, pc, ror #4
    12ec:	202c6425 	eorcs	r6, ip, r5, lsr #8
    12f0:	77666964 	strbvc	r6, [r6, -r4, ror #18]!
    12f4:	25202072 	strcs	r2, [r0, #-114]!	; 0xffffff8e
    12f8:	2c756c6c 	ldclcs	12, cr6, [r5], #-432	; 0xfffffe50
    12fc:	72696c20 	rsbvc	r6, r9, #32, 24	; 0x2000
    1300:	75252072 	strvc	r2, [r5, #-114]!	; 0xffffff8e
    1304:	0000000a 	andeq	r0, r0, sl
    1308:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
    130c:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
    1310:	00000000 	andeq	r0, r0, r0
    1314:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1260 <.LC5+0x58>
    1318:	6f6e2f65 	svcvs	0x006e2f65
    131c:	5f6e616c 	svcpl	0x006e616c
    1320:	2f6e6179 	svccs	0x006e6179
    1324:	6b736544 	blvs	1cda83c <__crc_ipu_ch_param_bad_alpha_pos+0x14ed4bd>
    1328:	2f706f74 	svccs	0x00706f74
    132c:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
    1330:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
    1334:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    1338:	70692f73 	rsbvc	r2, r9, r3, ror pc
    133c:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
    1340:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
    1344:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
    1348:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
    134c:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
    1350:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1354:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
    1358:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    135c:	6c61635f 	stclvs	3, cr6, [r1], #-380	; 0xfffffe84
    1360:	74735f63 	ldrbtvc	r5, [r3], #-3939	; 0xfffff09d
    1364:	65706972 	ldrbvs	r6, [r0, #-2418]!	; 0xfffff68e
    1368:	69735f73 	ldmdbvs	r3!, {r0, r1, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
    136c:	2e73657a 	mrccs	5, 3, r6, cr3, cr10, {3}
    1370:	00000063 	andeq	r0, r0, r3, rrx

00001374 <.LC0>:
    1374:	5f757069 	svcpl	0x00757069
    1378:	65786970 	ldrbvs	r6, [r8, #-2416]!	; 0xfffff690
    137c:	6c635f6c 	stclvs	15, cr5, [r3], #-432	; 0xfffffe50
    1380:	64203a6b 	strtvs	r3, [r0], #-2667	; 0xfffff595
    1384:	6c635f69 	stclvs	15, cr5, [r3], #-420	; 0xfffffe5c
    1388:	78655f6b 	stmdavc	r5!, {r0, r1, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
    138c:	78303a74 	ldmdavc	r0!, {r2, r4, r5, r6, r9, fp, ip, sp}
    1390:	202c7825 	eorcs	r7, ip, r5, lsr #16
    1394:	675f6964 	ldrbvs	r6, [pc, -r4, ror #18]
    1398:	72206e65 	eorvc	r6, r0, #1616	; 0x650
    139c:	303a6765 	eorscc	r6, sl, r5, ror #14
    13a0:	2e782578 	mrccs	5, 3, r2, cr8, cr8, {3}
    13a4:	0000000a 	andeq	r0, r0, sl

000013a8 <.LC1>:
    13a8:	764f3301 	strbvc	r3, [pc], -r1, lsl #6
    13ac:	6c667265 	sfmvs	f7, 2, [r6], #-404	; 0xfffffe6c
    13b0:	202c776f 	eorcs	r7, ip, pc, ror #14
    13b4:	253a6964 	ldrcs	r6, [sl, #-2404]!	; 0xfffff69c
    13b8:	44202c64 	strtmi	r2, [r0], #-3172	; 0xfffff39c
    13bc:	53425f49 	movtpl	r5, #12105	; 0x2f49
    13c0:	4b4c435f 	blmi	1312144 <__crc_ipu_ch_param_bad_alpha_pos+0xb24dc5>
    13c4:	304e4547 	subcc	r4, lr, r7, asr #10
    13c8:	76696420 	strbtvc	r6, [r9], -r0, lsr #8
    13cc:	2578303a 	ldrbcs	r3, [r8, #-58]!	; 0xffffffc6
    13d0:	00000a78 	andeq	r0, r0, r8, ror sl

000013d4 <.LC2>:
    13d4:	5f757069 	svcpl	0x00757069
    13d8:	64256964 	strtvs	r6, [r5], #-2404	; 0xfffff69c
    13dc:	61657220 	cmnvs	r5, r0, lsr #4
    13e0:	53422064 	movtpl	r2, #8292	; 0x2064
    13e4:	4b4c435f 	blmi	1312168 <__crc_ipu_ch_param_bad_alpha_pos+0xb24de9>
    13e8:	304e4547 	subcc	r4, lr, r7, asr #10
    13ec:	76696420 	strbtvc	r6, [r9], -r0, lsr #8
    13f0:	2c64253a 	cfstr64cs	mvdx2, [r4], #-232	; 0xffffff18
    13f4:	6e696620 	cdpvs	6, 6, cr6, cr9, cr0, {1}
    13f8:	725f6c61 	subsvc	r6, pc, #24832	; 0x6100
    13fc:	3a657461 	bcc	195e588 <__crc_ipu_ch_param_bad_alpha_pos+0x1171209>
    1400:	646c6c25 	strbtvs	r6, [ip], #-3109	; 0xfffff3db
    1404:	7270202c 	rsbsvc	r2, r0, #44	; 0x2c
    1408:	3a657461 	bcc	195e594 <__crc_ipu_ch_param_bad_alpha_pos+0x1171215>
    140c:	0a646c25 	beq	191c4a8 <__crc_ipu_ch_param_bad_alpha_pos+0x112f129>
    1410:	00000000 	andeq	r0, r0, r0
    1414:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
    1418:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
    141c:	00000000 	andeq	r0, r0, r0
    1420:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 136c <.LC6+0xc4>
    1424:	6f6e2f65 	svcvs	0x006e2f65
    1428:	5f6e616c 	svcpl	0x006e616c
    142c:	2f6e6179 	svccs	0x006e6179
    1430:	6b736544 	blvs	1cda948 <__crc_ipu_ch_param_bad_alpha_pos+0x14ed5c9>
    1434:	2f706f74 	svccs	0x00706f74
    1438:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
    143c:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
    1440:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    1444:	70692f73 	rsbvc	r2, r9, r3, ror pc
    1448:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
    144c:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
    1450:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
    1454:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
    1458:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
    145c:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1460:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
    1464:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    1468:	7869705f 	stmdavc	r9!, {r0, r1, r2, r3, r4, r6, ip, sp, lr}^
    146c:	635f6c65 	cmpvs	pc, #25856	; 0x6500
    1470:	632e6b6c 			; <UNDEFINED> instruction: 0x632e6b6c
    1474:	00000000 	andeq	r0, r0, r0

00001478 <.LC0>:
    1478:	70736964 	rsbsvc	r6, r3, r4, ror #18
    147c:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1480:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1484:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1488:	73206564 			; <UNDEFINED> instruction: 0x73206564
    148c:	72705f77 	rsbsvc	r5, r0, #476	; 0x1dc
    1490:	2865626f 	stmdacs	r5!, {r0, r1, r2, r3, r5, r6, r9, sp, lr}^
    1494:	000a2e29 	andeq	r2, sl, r9, lsr #28

00001498 <.LC1>:
    1498:	70736964 	rsbsvc	r6, r3, r4, ror #18
    149c:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    14a0:	20676e69 	rsbcs	r6, r7, r9, ror #28
    14a4:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    14a8:	73206564 			; <UNDEFINED> instruction: 0x73206564
    14ac:	70695f77 	rsbvc	r5, r9, r7, ror pc
    14b0:	6e695f75 	mcrvs	15, 3, r5, cr9, cr5, {3}
    14b4:	635f7469 	cmpvs	pc, #1761607680	; 0x69000000
    14b8:	6e6e6168 	powvsez	f6, f6, #0.0
    14bc:	29286c65 	stmdbcs	r8!, {r0, r2, r5, r6, sl, fp, sp, lr}
    14c0:	00000a2e 	andeq	r0, r0, lr, lsr #20

000014c4 <.LC2>:
    14c4:	70736964 	rsbsvc	r6, r3, r4, ror #18
    14c8:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    14cc:	20676e69 	rsbcs	r6, r7, r9, ror #28
    14d0:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    14d4:	73206564 			; <UNDEFINED> instruction: 0x73206564
    14d8:	70695f77 	rsbvc	r5, r9, r7, ror pc
    14dc:	6e755f75 	mrcvs	15, 3, r5, cr5, cr5, {3}
    14e0:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
    14e4:	6168635f 	cmnvs	r8, pc, asr r3
    14e8:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
    14ec:	0a2e2928 	beq	b8b994 <__crc_ipu_ch_param_bad_alpha_pos+0x39e615>
    14f0:	00000000 	andeq	r0, r0, r0

000014f4 <.LC3>:
    14f4:	70736964 	rsbsvc	r6, r3, r4, ror #18
    14f8:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    14fc:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1500:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1504:	73206564 			; <UNDEFINED> instruction: 0x73206564
    1508:	70695f77 	rsbvc	r5, r9, r7, ror pc
    150c:	6e695f75 	mcrvs	15, 3, r5, cr9, cr5, {3}
    1510:	635f7469 	cmpvs	pc, #1761607680	; 0x69000000
    1514:	6e6e6168 	powvsez	f6, f6, #0.0
    1518:	625f6c65 	subsvs	r6, pc, #25856	; 0x6500
    151c:	65666675 	strbvs	r6, [r6, #-1653]!	; 0xfffff98b
    1520:	2e292872 	mcrcs	8, 1, r2, cr9, cr2, {3}
    1524:	0000000a 	andeq	r0, r0, sl

00001528 <.LC4>:
    1528:	70736964 	rsbsvc	r6, r3, r4, ror #18
    152c:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1530:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1534:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1538:	73206564 			; <UNDEFINED> instruction: 0x73206564
    153c:	70695f77 	rsbvc	r5, r9, r7, ror pc
    1540:	70755f75 	rsbsvc	r5, r5, r5, ror pc
    1544:	65746164 	ldrbvs	r6, [r4, #-356]!	; 0xfffffe9c
    1548:	6168635f 	cmnvs	r8, pc, asr r3
    154c:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
    1550:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
    1554:	28726566 	ldmdacs	r2!, {r1, r2, r5, r6, r8, sl, sp, lr}^
    1558:	000a2e29 	andeq	r2, sl, r9, lsr #28

0000155c <.LC5>:
    155c:	70736964 	rsbsvc	r6, r3, r4, ror #18
    1560:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1564:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1568:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    156c:	73206564 			; <UNDEFINED> instruction: 0x73206564
    1570:	70695f77 	rsbvc	r5, r9, r7, ror pc
    1574:	65735f75 	ldrbvs	r5, [r3, #-3957]!	; 0xfffff08b
    1578:	7463656c 	strbtvc	r6, [r3], #-1388	; 0xfffffa94
    157c:	6675625f 			; <UNDEFINED> instruction: 0x6675625f
    1580:	28726566 	ldmdacs	r2!, {r1, r2, r5, r6, r8, sl, sp, lr}^
    1584:	000a2e29 	andeq	r2, sl, r9, lsr #28

00001588 <.LC6>:
    1588:	70736964 	rsbsvc	r6, r3, r4, ror #18
    158c:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1590:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1594:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1598:	73206564 			; <UNDEFINED> instruction: 0x73206564
    159c:	70695f77 	rsbvc	r5, r9, r7, ror pc
    15a0:	6e655f75 	mcrvs	15, 3, r5, cr5, cr5, {3}
    15a4:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
    15a8:	6168635f 	cmnvs	r8, pc, asr r3
    15ac:	6c656e6e 	stclvs	14, cr6, [r5], #-440	; 0xfffffe48
    15b0:	0a2e2928 	beq	b8ba58 <__crc_ipu_ch_param_bad_alpha_pos+0x39e6d9>
    15b4:	00000000 	andeq	r0, r0, r0

000015b8 <.LC7>:
    15b8:	70736964 	rsbsvc	r6, r3, r4, ror #18
    15bc:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    15c0:	20676e69 	rsbcs	r6, r7, r9, ror #28
    15c4:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    15c8:	73206564 			; <UNDEFINED> instruction: 0x73206564
    15cc:	70695f77 	rsbvc	r5, r9, r7, ror pc
    15d0:	69645f75 	stmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
    15d4:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
    15d8:	68635f65 	stmdavs	r3!, {r0, r2, r5, r6, r8, r9, sl, fp, ip, lr}^
    15dc:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
    15e0:	2e29286c 	cdpcs	8, 2, cr2, cr9, cr12, {3}
    15e4:	0000000a 	andeq	r0, r0, sl

000015e8 <.LC8>:
    15e8:	70736964 	rsbsvc	r6, r3, r4, ror #18
    15ec:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    15f0:	20676e69 	rsbcs	r6, r7, r9, ror #28
    15f4:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    15f8:	73206564 			; <UNDEFINED> instruction: 0x73206564
    15fc:	70695f77 	rsbvc	r5, r9, r7, ror pc
    1600:	6e655f75 	mcrvs	15, 3, r5, cr5, cr5, {3}
    1604:	656c6261 	strbvs	r6, [ip, #-609]!	; 0xfffffd9f
    1608:	6973635f 	ldmdbvs	r3!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
    160c:	0a2e2928 	beq	b8bab4 <__crc_ipu_ch_param_bad_alpha_pos+0x39e735>
    1610:	00000000 	andeq	r0, r0, r0

00001614 <.LC9>:
    1614:	70736964 	rsbsvc	r6, r3, r4, ror #18
    1618:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    161c:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1620:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1624:	73206564 			; <UNDEFINED> instruction: 0x73206564
    1628:	70695f77 	rsbvc	r5, r9, r7, ror pc
    162c:	69645f75 	stmdbvs	r4!, {r0, r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
    1630:	6c626173 	stfvse	f6, [r2], #-460	; 0xfffffe34
    1634:	73635f65 	cmnvc	r3, #404	; 0x194
    1638:	2e292869 	cdpcs	8, 2, cr2, cr9, cr9, {3}
    163c:	0000000a 	andeq	r0, r0, sl

00001640 <.LC10>:
    1640:	70736964 	rsbsvc	r6, r3, r4, ror #18
    1644:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1648:	20676e69 	rsbcs	r6, r7, r9, ror #28
    164c:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    1650:	73206564 			; <UNDEFINED> instruction: 0x73206564
    1654:	70695f77 	rsbvc	r5, r9, r7, ror pc
    1658:	65725f75 	ldrbvs	r5, [r2, #-3957]!	; 0xfffff08b
    165c:	73657571 	cmnvc	r5, #473956352	; 0x1c400000
    1660:	72695f74 	rsbvc	r5, r9, #116, 30	; 0x1d0
    1664:	2e292871 	mcrcs	8, 1, r2, cr9, cr1, {3}
    1668:	0000000a 	andeq	r0, r0, sl

0000166c <.LC11>:
    166c:	70736964 	rsbsvc	r6, r3, r4, ror #18
    1670:	68637461 	stmdavs	r3!, {r0, r5, r6, sl, ip, sp, lr}^
    1674:	20676e69 	rsbcs	r6, r7, r9, ror #28
    1678:	69736e69 	ldmdbvs	r3!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
    167c:	73206564 			; <UNDEFINED> instruction: 0x73206564
    1680:	70695f77 	rsbvc	r5, r9, r7, ror pc
    1684:	72665f75 	rsbvc	r5, r6, #468	; 0x1d4
    1688:	695f6565 	ldmdbvs	pc, {r0, r2, r5, r6, r8, sl, sp, lr}^	; <UNPREDICTABLE>
    168c:	29287172 	stmdbcs	r8!, {r1, r4, r5, r6, r8, ip, sp, lr}
    1690:	00000a2e 	andeq	r0, r0, lr, lsr #20

00001694 <.LC12>:
    1694:	52453301 	subpl	r3, r5, #67108864	; 0x4000000
    1698:	3a524f52 	bcc	14953e8 <__crc_ipu_ch_param_bad_alpha_pos+0xca8069>
    169c:	6b6e5520 	blvs	1b96b24 <__crc_ipu_ch_param_bad_alpha_pos+0x13a97a5>
    16a0:	6e776f6e 	cdpvs	15, 7, cr6, cr7, cr14, {3}
    16a4:	6e756620 	cdpvs	6, 7, cr6, cr5, cr0, {1}
    16a8:	6f697463 	svcvs	0x00697463
    16ac:	000a2e6e 	andeq	r2, sl, lr, ror #28
    16b0:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
    16b4:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
    16b8:	00000000 	andeq	r0, r0, r0
    16bc:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 1608 <.LC8+0x20>
    16c0:	6f6e2f65 	svcvs	0x006e2f65
    16c4:	5f6e616c 	svcpl	0x006e616c
    16c8:	2f6e6179 	svccs	0x006e6179
    16cc:	6b736544 	blvs	1cdabe4 <__crc_ipu_ch_param_bad_alpha_pos+0x14ed865>
    16d0:	2f706f74 	svccs	0x00706f74
    16d4:	36786d69 	ldrbtcc	r6, [r8], -r9, ror #26
    16d8:	72645f71 	rsbvc	r5, r4, #452	; 0x1c4
    16dc:	72657669 	rsbvc	r7, r5, #110100480	; 0x6900000
    16e0:	70692f73 	rsbvc	r2, r9, r3, ror pc
    16e4:	6c5f3375 	mrrcvs	3, 7, r3, pc, cr5	; <UNPREDICTABLE>
    16e8:	765f7264 	ldrbvc	r7, [pc], -r4, ror #4
    16ec:	65745f32 	ldrbvs	r5, [r4, #-3890]!	; 0xfffff0ce
    16f0:	656d706d 	strbvs	r7, [sp, #-109]!	; 0xffffff93
    16f4:	6665726d 	strbtvs	r7, [r5], -sp, ror #4
    16f8:	7570692f 	ldrbvc	r6, [r0, #-2351]!	; 0xfffff6d1
    16fc:	57535f33 	smmlarpl	r3, r3, pc, r5	; <UNPREDICTABLE>
    1700:	7369642f 	cmnvc	r9, #788529152	; 0x2f000000
    1704:	63746170 	cmnvs	r4, #112, 2
    1708:	2e726568 	cdpcs	5, 7, cr6, cr2, cr8, {3}
    170c:	Address 0x000000000000170c is out of bounds.


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

0000030c <__kstrtab_ipu_csi_set_window_pos>:
 30c:	5f757069 	svcpl	0x00757069
 310:	5f697363 	svcpl	0x00697363
 314:	5f746573 	svcpl	0x00746573
 318:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 31c:	705f776f 	subsvc	r7, pc, pc, ror #14
 320:	6900736f 	stmdbvs	r0, {r0, r1, r2, r3, r5, r6, r8, r9, ip, sp, lr}

00000323 <__kstrtab_ipu_csi_set_window_size>:
 323:	5f757069 	svcpl	0x00757069
 327:	5f697363 	svcpl	0x00697363
 32b:	5f746573 	svcpl	0x00746573
 32f:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 333:	735f776f 	cmpvc	pc, #29097984	; 0x1bc0000
 337:	00657a69 	rsbeq	r7, r5, r9, ror #20

0000033b <__kstrtab_ipu_csi_get_window_size>:
 33b:	5f757069 	svcpl	0x00757069
 33f:	5f697363 	svcpl	0x00697363
 343:	5f746567 	svcpl	0x00746567
 347:	646e6977 	strbtvs	r6, [lr], #-2423	; 0xfffff689
 34b:	735f776f 	cmpvc	pc, #29097984	; 0x1bc0000
 34f:	00657a69 	rsbeq	r7, r5, r9, ror #20

00000353 <__kstrtab_ipu_csi_enable_mclk>:
 353:	5f757069 	svcpl	0x00757069
 357:	5f697363 	svcpl	0x00697363
 35b:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
 35f:	6d5f656c 	cfldr64vs	mvdx6, [pc, #-432]	; 1b4 <__kstrtab_ipu_clear_buffer_ready+0x11>
 363:	006b6c63 	rsbeq	r6, fp, r3, ror #24

00000367 <__kstrtab_ipu_csi_get_sensor_protocol>:
 367:	5f757069 	svcpl	0x00757069
 36b:	5f697363 	svcpl	0x00697363
 36f:	5f746567 	svcpl	0x00746567
 373:	736e6573 	cmnvc	lr, #482344960	; 0x1cc00000
 377:	705f726f 	subsvc	r7, pc, pc, ror #4
 37b:	6f746f72 	svcvs	0x00746f72
 37f:	006c6f63 	rsbeq	r6, ip, r3, ror #30

00000383 <__kstrtab_ipu_csi_init_interface>:
 383:	5f757069 	svcpl	0x00757069
 387:	5f697363 	svcpl	0x00697363
 38b:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 38f:	746e695f 	strbtvc	r6, [lr], #-2399	; 0xfffff6a1
 393:	61667265 	cmnvs	r6, r5, ror #4
 397:	69006563 	stmdbvs	r0, {r0, r1, r5, r6, r8, sl, sp, lr}

0000039a <__kstrtab_ipu_calc_stripes_sizes>:
 39a:	5f757069 	svcpl	0x00757069
 39e:	636c6163 	cmnvs	ip, #-1073741800	; 0xc0000018
 3a2:	7274735f 	rsbsvc	r7, r4, #2080374785	; 0x7c000001
 3a6:	73657069 	cmnvc	r5, #105	; 0x69
 3aa:	7a69735f 	bvc	1a5d12e <__crc_ipu_ch_param_bad_alpha_pos+0x126fdaf>
 3ae:	69007365 	stmdbvs	r0, {r0, r2, r5, r6, r8, r9, ip, sp, lr}

000003b1 <__kstrtab_ipu_reset_disp_panel>:
 3b1:	5f757069 	svcpl	0x00757069
 3b5:	65736572 	ldrbvs	r6, [r3, #-1394]!	; 0xfffffa8e
 3b9:	69645f74 	stmdbvs	r4!, {r2, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
 3bd:	705f7073 	subsvc	r7, pc, r3, ror r0	; <UNPREDICTABLE>
 3c1:	6c656e61 	stclvs	14, cr6, [r5], #-388	; 0xfffffe7c
	...

000003c6 <__kstrtab_ipu_disp_get_window_pos>:
 3c6:	5f757069 	svcpl	0x00757069
 3ca:	70736964 	rsbsvc	r6, r3, r4, ror #18
 3ce:	7465675f 	strbtvc	r6, [r5], #-1887	; 0xfffff8a1
 3d2:	6e69775f 	mcrvs	7, 3, r7, cr9, cr15, {2}
 3d6:	5f776f64 	svcpl	0x00776f64
 3da:	00736f70 	rsbseq	r6, r3, r0, ror pc

000003de <__kstrtab_ipu_disp_set_window_pos>:
 3de:	5f757069 	svcpl	0x00757069
 3e2:	70736964 	rsbsvc	r6, r3, r4, ror #18
 3e6:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 3ea:	6e69775f 	mcrvs	7, 3, r7, cr9, cr15, {2}
 3ee:	5f776f64 	svcpl	0x00776f64
 3f2:	00736f70 	rsbseq	r6, r3, r0, ror pc

000003f6 <__kstrtab_ipu_disp_set_gamma_correction>:
 3f6:	5f757069 	svcpl	0x00757069
 3fa:	70736964 	rsbsvc	r6, r3, r4, ror #18
 3fe:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 402:	6d61675f 	stclvs	7, cr6, [r1, #-380]!	; 0xfffffe84
 406:	635f616d 	cmpvs	pc, #1073741851	; 0x4000001b
 40a:	6572726f 	ldrbvs	r7, [r2, #-623]!	; 0xfffffd91
 40e:	6f697463 	svcvs	0x00697463
 412:	7069006e 	rsbvc	r0, r9, lr, rrx

00000414 <__kstrtab_ipu_disp_set_color_key>:
 414:	5f757069 	svcpl	0x00757069
 418:	70736964 	rsbsvc	r6, r3, r4, ror #18
 41c:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 420:	6c6f635f 	stclvs	3, cr6, [pc], #-380	; 2ac <__kstrtab_ipu_update_channel_buffer+0x16>
 424:	6b5f726f 	blvs	17dcde8 <__crc_ipu_ch_param_bad_alpha_pos+0xfefa69>
 428:	69007965 	stmdbvs	r0, {r0, r2, r5, r6, r8, fp, ip, sp, lr}

0000042b <__kstrtab_ipu_disp_set_global_alpha>:
 42b:	5f757069 	svcpl	0x00757069
 42f:	70736964 	rsbsvc	r6, r3, r4, ror #18
 433:	7465735f 	strbtvc	r7, [r5], #-863	; 0xfffffca1
 437:	6f6c675f 	svcvs	0x006c675f
 43b:	5f6c6162 	svcpl	0x006c6162
 43f:	68706c61 	ldmdavs	r0!, {r0, r5, r6, sl, fp, sp, lr}^
 443:	70690061 	rsbvc	r0, r9, r1, rrx

00000445 <__kstrtab_ipu_init_async_panel>:
 445:	5f757069 	svcpl	0x00757069
 449:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 44d:	7973615f 	ldmdbvc	r3!, {r0, r1, r2, r3, r4, r6, r8, sp, lr}^
 451:	705f636e 	subsvc	r6, pc, lr, ror #6
 455:	6c656e61 	stclvs	14, cr6, [r5], #-388	; 0xfffffe7c
	...

0000045a <__kstrtab_ipu_uninit_sync_panel>:
 45a:	5f757069 	svcpl	0x00757069
 45e:	6e696e75 	mcrvs	14, 3, r6, cr9, cr5, {3}
 462:	735f7469 	cmpvc	pc, #1761607680	; 0x69000000
 466:	5f636e79 	svcpl	0x00636e79
 46a:	656e6170 	strbvs	r6, [lr, #-368]!	; 0xfffffe90
 46e:	7069006c 	rsbvc	r0, r9, ip, rrx

00000470 <__kstrtab_ipu_init_sync_panel>:
 470:	5f757069 	svcpl	0x00757069
 474:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 478:	6e79735f 	mrcvs	3, 3, r7, cr9, cr15, {2}
 47c:	61705f63 	cmnvs	r0, r3, ror #30
 480:	006c656e 	rsbeq	r6, ip, lr, ror #10

00000484 <__kstrtab_ipu_set_csc_coefficients>:
 484:	5f757069 	svcpl	0x00757069
 488:	5f746573 	svcpl	0x00746573
 48c:	5f637363 	svcpl	0x00637363
 490:	66656f63 	strbtvs	r6, [r5], -r3, ror #30
 494:	69636966 	stmdbvs	r3!, {r1, r2, r5, r6, r8, fp, sp, lr}^
 498:	73746e65 	cmnvc	r4, #1616	; 0x650
	...

Disassembly of section .data:

00000000 <ipu_type_imx6q>:
   0:	00000c18 	andeq	r0, r0, r8, lsl ip
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
  68:	00000c18 	andeq	r0, r0, r8, lsl ip
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
  d0:	00000c20 	andeq	r0, r0, r0, lsr #24
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
 138:	00000c28 	andeq	r0, r0, r8, lsr #24
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

000001a0 <clk_div_ops>:
	...

000001f0 <clk_gate_di_ops>:
	...

Disassembly of section __verbose:

00000000 <descriptor.37959>:
   0:	00000c0c 	andeq	r0, r0, ip, lsl #24
   4:	00000068 	andeq	r0, r0, r8, rrx
   8:	00000190 	muleq	r0, r0, r1
   c:	000000d8 	ldrdeq	r0, [r0], -r8
  10:	000006a7 	andeq	r0, r0, r7, lsr #13
  14:	00000000 	andeq	r0, r0, r0

00000018 <descriptor.37143>:
  18:	00000c0c 	andeq	r0, r0, ip, lsl #24
  1c:	000002ac 	andeq	r0, r0, ip, lsr #5
  20:	00000c30 	andeq	r0, r0, r0, lsr ip
  24:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
  28:	000003dc 	ldrdeq	r0, [r0], -ip
  2c:	00000000 	andeq	r0, r0, r0

00000030 <descriptor.37978>:
  30:	00000c0c 	andeq	r0, r0, ip, lsl #24
  34:	000002c8 	andeq	r0, r0, r8, asr #5
  38:	00000190 	muleq	r0, r0, r1
  3c:	000000fc 	strdeq	r0, [r0], -ip
  40:	000006e4 	andeq	r0, r0, r4, ror #13
  44:	00000000 	andeq	r0, r0, r0

00000048 <descriptor.37828>:
  48:	00000c0c 	andeq	r0, r0, ip, lsl #24
  4c:	00000324 	andeq	r0, r0, r4, lsr #6
  50:	00000190 	muleq	r0, r0, r1
  54:	0000011c 	andeq	r0, r0, ip, lsl r1
  58:	0000046f 	andeq	r0, r0, pc, ror #8
  5c:	00000000 	andeq	r0, r0, r0

00000060 <descriptor.37892>:
  60:	00000c0c 	andeq	r0, r0, ip, lsl #24
  64:	0000030c 	andeq	r0, r0, ip, lsl #6
  68:	00000190 	muleq	r0, r0, r1
  6c:	000001e4 	andeq	r0, r0, r4, ror #3
  70:	0000058c 	andeq	r0, r0, ip, lsl #11
  74:	00000000 	andeq	r0, r0, r0

00000078 <descriptor.37894>:
  78:	00000c0c 	andeq	r0, r0, ip, lsl #24
  7c:	0000030c 	andeq	r0, r0, ip, lsl #6
  80:	00000190 	muleq	r0, r0, r1
  84:	000001f8 	strdeq	r0, [r0], -r8
  88:	0000058e 	andeq	r0, r0, lr, lsl #11
  8c:	00000000 	andeq	r0, r0, r0

00000090 <descriptor.37895>:
  90:	00000c0c 	andeq	r0, r0, ip, lsl #24
  94:	0000030c 	andeq	r0, r0, ip, lsl #6
  98:	00000190 	muleq	r0, r0, r1
  9c:	00000204 	andeq	r0, r0, r4, lsl #4
  a0:	0000058f 	andeq	r0, r0, pc, lsl #11
  a4:	00000000 	andeq	r0, r0, r0

000000a8 <descriptor.37896>:
  a8:	00000c0c 	andeq	r0, r0, ip, lsl #24
  ac:	0000030c 	andeq	r0, r0, ip, lsl #6
  b0:	00000190 	muleq	r0, r0, r1
  b4:	00000210 	andeq	r0, r0, r0, lsl r2
  b8:	00000590 	muleq	r0, r0, r5
  bc:	00000000 	andeq	r0, r0, r0

000000c0 <descriptor.37897>:
  c0:	00000c0c 	andeq	r0, r0, ip, lsl #24
  c4:	0000030c 	andeq	r0, r0, ip, lsl #6
  c8:	00000190 	muleq	r0, r0, r1
  cc:	0000021c 	andeq	r0, r0, ip, lsl r2
  d0:	00000591 	muleq	r0, r1, r5
  d4:	00000000 	andeq	r0, r0, r0

000000d8 <descriptor.37898>:
  d8:	00000c0c 	andeq	r0, r0, ip, lsl #24
  dc:	0000030c 	andeq	r0, r0, ip, lsl #6
  e0:	00000190 	muleq	r0, r0, r1
  e4:	00000228 	andeq	r0, r0, r8, lsr #4
  e8:	00000592 	muleq	r0, r2, r5
  ec:	00000000 	andeq	r0, r0, r0

000000f0 <descriptor.37899>:
  f0:	00000c0c 	andeq	r0, r0, ip, lsl #24
  f4:	0000030c 	andeq	r0, r0, ip, lsl #6
  f8:	00000190 	muleq	r0, r0, r1
  fc:	00000234 	andeq	r0, r0, r4, lsr r2
 100:	00000593 	muleq	r0, r3, r5
 104:	00000000 	andeq	r0, r0, r0

00000108 <descriptor.37900>:
 108:	00000c0c 	andeq	r0, r0, ip, lsl #24
 10c:	0000030c 	andeq	r0, r0, ip, lsl #6
 110:	00000190 	muleq	r0, r0, r1
 114:	0000023c 	andeq	r0, r0, ip, lsr r2
 118:	00000594 	muleq	r0, r4, r5
 11c:	00000000 	andeq	r0, r0, r0

00000120 <descriptor.37901>:
 120:	00000c0c 	andeq	r0, r0, ip, lsl #24
 124:	0000030c 	andeq	r0, r0, ip, lsl #6
 128:	00000190 	muleq	r0, r0, r1
 12c:	00000244 	andeq	r0, r0, r4, asr #4
 130:	00000599 	muleq	r0, r9, r5
 134:	00000000 	andeq	r0, r0, r0

00000138 <descriptor.36462>:
 138:	00000c0c 	andeq	r0, r0, ip, lsl #24
 13c:	000002f8 	strdeq	r0, [r0], -r8
 140:	00000c30 	andeq	r0, r0, r0, lsr ip
 144:	00000378 	andeq	r0, r0, r8, ror r3
 148:	00000217 	andeq	r0, r0, r7, lsl r2
 14c:	00000000 	andeq	r0, r0, r0

00000150 <descriptor.36468>:
 150:	00000c0c 	andeq	r0, r0, ip, lsl #24
 154:	000002f8 	strdeq	r0, [r0], -r8
 158:	00000c30 	andeq	r0, r0, r0, lsr ip
 15c:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 160:	00000226 	andeq	r0, r0, r6, lsr #4
 164:	00000000 	andeq	r0, r0, r0

00000168 <descriptor.35929>:
 168:	00000c0c 	andeq	r0, r0, ip, lsl #24
 16c:	000002e4 	andeq	r0, r0, r4, ror #5
 170:	00000c30 	andeq	r0, r0, r0, lsr ip
 174:	00000458 	andeq	r0, r0, r8, asr r4
 178:	000000c3 	andeq	r0, r0, r3, asr #1
 17c:	00000000 	andeq	r0, r0, r0

00000180 <descriptor.35931>:
 180:	00000c0c 	andeq	r0, r0, ip, lsl #24
 184:	000002e4 	andeq	r0, r0, r4, ror #5
 188:	00000c30 	andeq	r0, r0, r0, lsr ip
 18c:	00000484 	andeq	r0, r0, r4, lsl #9
 190:	000000c6 	andeq	r0, r0, r6, asr #1
 194:	00000000 	andeq	r0, r0, r0

00000198 <descriptor.35932>:
 198:	00000c0c 	andeq	r0, r0, ip, lsl #24
 19c:	000002e4 	andeq	r0, r0, r4, ror #5
 1a0:	00000c30 	andeq	r0, r0, r0, lsr ip
 1a4:	000004b0 			; <UNDEFINED> instruction: 0x000004b0
 1a8:	000000c8 	andeq	r0, r0, r8, asr #1
 1ac:	00000000 	andeq	r0, r0, r0

000001b0 <descriptor.35948>:
 1b0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 1b4:	000002e4 	andeq	r0, r0, r4, ror #5
 1b8:	00000c30 	andeq	r0, r0, r0, lsr ip
 1bc:	000004bc 			; <UNDEFINED> instruction: 0x000004bc
 1c0:	000000ca 	andeq	r0, r0, sl, asr #1
 1c4:	00000000 	andeq	r0, r0, r0

000001c8 <descriptor.35964>:
 1c8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 1cc:	000002e4 	andeq	r0, r0, r4, ror #5
 1d0:	00000c30 	andeq	r0, r0, r0, lsr ip
 1d4:	000004c8 	andeq	r0, r0, r8, asr #9
 1d8:	000000cc 	andeq	r0, r0, ip, asr #1
 1dc:	00000000 	andeq	r0, r0, r0

000001e0 <descriptor.35980>:
 1e0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 1e4:	000002e4 	andeq	r0, r0, r4, ror #5
 1e8:	00000c30 	andeq	r0, r0, r0, lsr ip
 1ec:	000004d4 	ldrdeq	r0, [r0], -r4
 1f0:	000000cf 	andeq	r0, r0, pc, asr #1
 1f4:	00000000 	andeq	r0, r0, r0

000001f8 <descriptor.35996>:
 1f8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 1fc:	000002e4 	andeq	r0, r0, r4, ror #5
 200:	00000c30 	andeq	r0, r0, r0, lsr ip
 204:	000004dc 	ldrdeq	r0, [r0], -ip
 208:	000000d1 	ldrdeq	r0, [r0], -r1
 20c:	00000000 	andeq	r0, r0, r0

00000210 <descriptor.36012>:
 210:	00000c0c 	andeq	r0, r0, ip, lsl #24
 214:	000002e4 	andeq	r0, r0, r4, ror #5
 218:	00000c30 	andeq	r0, r0, r0, lsr ip
 21c:	000004e4 	andeq	r0, r0, r4, ror #9
 220:	000000d3 	ldrdeq	r0, [r0], -r3
 224:	00000000 	andeq	r0, r0, r0

00000228 <descriptor.36028>:
 228:	00000c0c 	andeq	r0, r0, ip, lsl #24
 22c:	000002e4 	andeq	r0, r0, r4, ror #5
 230:	00000c30 	andeq	r0, r0, r0, lsr ip
 234:	000004f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 238:	000000d5 	ldrdeq	r0, [r0], -r5
 23c:	00000000 	andeq	r0, r0, r0

00000240 <descriptor.36044>:
 240:	00000c0c 	andeq	r0, r0, ip, lsl #24
 244:	000002e4 	andeq	r0, r0, r4, ror #5
 248:	00000c30 	andeq	r0, r0, r0, lsr ip
 24c:	000004fc 	strdeq	r0, [r0], -ip
 250:	000000d7 	ldrdeq	r0, [r0], -r7
 254:	00000000 	andeq	r0, r0, r0

00000258 <descriptor.36060>:
 258:	00000c0c 	andeq	r0, r0, ip, lsl #24
 25c:	000002e4 	andeq	r0, r0, r4, ror #5
 260:	00000c30 	andeq	r0, r0, r0, lsr ip
 264:	00000508 	andeq	r0, r0, r8, lsl #10
 268:	000000d9 	ldrdeq	r0, [r0], -r9
 26c:	00000000 	andeq	r0, r0, r0

00000270 <descriptor.36076>:
 270:	00000c0c 	andeq	r0, r0, ip, lsl #24
 274:	000002e4 	andeq	r0, r0, r4, ror #5
 278:	00000c30 	andeq	r0, r0, r0, lsr ip
 27c:	00000518 	andeq	r0, r0, r8, lsl r5
 280:	000000db 	ldrdeq	r0, [r0], -fp
 284:	00000000 	andeq	r0, r0, r0

00000288 <descriptor.36092>:
 288:	00000c0c 	andeq	r0, r0, ip, lsl #24
 28c:	000002e4 	andeq	r0, r0, r4, ror #5
 290:	00000c30 	andeq	r0, r0, r0, lsr ip
 294:	00000528 	andeq	r0, r0, r8, lsr #10
 298:	000000dd 	ldrdeq	r0, [r0], -sp
 29c:	00000000 	andeq	r0, r0, r0

000002a0 <descriptor.36108>:
 2a0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 2a4:	000002e4 	andeq	r0, r0, r4, ror #5
 2a8:	00000c30 	andeq	r0, r0, r0, lsr ip
 2ac:	00000538 	andeq	r0, r0, r8, lsr r5
 2b0:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 2b4:	00000000 	andeq	r0, r0, r0

000002b8 <descriptor.36124>:
 2b8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 2bc:	000002e4 	andeq	r0, r0, r4, ror #5
 2c0:	00000c30 	andeq	r0, r0, r0, lsr ip
 2c4:	00000548 	andeq	r0, r0, r8, asr #10
 2c8:	000000e2 	andeq	r0, r0, r2, ror #1
 2cc:	00000000 	andeq	r0, r0, r0

000002d0 <descriptor.36140>:
 2d0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 2d4:	000002e4 	andeq	r0, r0, r4, ror #5
 2d8:	00000c30 	andeq	r0, r0, r0, lsr ip
 2dc:	00000558 	andeq	r0, r0, r8, asr r5
 2e0:	000000e4 	andeq	r0, r0, r4, ror #1
 2e4:	00000000 	andeq	r0, r0, r0

000002e8 <descriptor.36156>:
 2e8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 2ec:	000002e4 	andeq	r0, r0, r4, ror #5
 2f0:	00000c30 	andeq	r0, r0, r0, lsr ip
 2f4:	00000568 	andeq	r0, r0, r8, ror #10
 2f8:	000000e6 	andeq	r0, r0, r6, ror #1
 2fc:	00000000 	andeq	r0, r0, r0

00000300 <descriptor.36172>:
 300:	00000c0c 	andeq	r0, r0, ip, lsl #24
 304:	000002e4 	andeq	r0, r0, r4, ror #5
 308:	00000c30 	andeq	r0, r0, r0, lsr ip
 30c:	00000578 	andeq	r0, r0, r8, ror r5
 310:	000000e8 	andeq	r0, r0, r8, ror #1
 314:	00000000 	andeq	r0, r0, r0

00000318 <descriptor.36188>:
 318:	00000c0c 	andeq	r0, r0, ip, lsl #24
 31c:	000002e4 	andeq	r0, r0, r4, ror #5
 320:	00000c30 	andeq	r0, r0, r0, lsr ip
 324:	00000588 	andeq	r0, r0, r8, lsl #11
 328:	000000ea 	andeq	r0, r0, sl, ror #1
 32c:	00000000 	andeq	r0, r0, r0

00000330 <descriptor.36204>:
 330:	00000c0c 	andeq	r0, r0, ip, lsl #24
 334:	000002e4 	andeq	r0, r0, r4, ror #5
 338:	00000c30 	andeq	r0, r0, r0, lsr ip
 33c:	00000598 	muleq	r0, r8, r5
 340:	000000ec 	andeq	r0, r0, ip, ror #1
 344:	00000000 	andeq	r0, r0, r0

00000348 <descriptor.36220>:
 348:	00000c0c 	andeq	r0, r0, ip, lsl #24
 34c:	000002e4 	andeq	r0, r0, r4, ror #5
 350:	00000c30 	andeq	r0, r0, r0, lsr ip
 354:	000005a8 	andeq	r0, r0, r8, lsr #11
 358:	000000ee 	andeq	r0, r0, lr, ror #1
 35c:	00000000 	andeq	r0, r0, r0

00000360 <descriptor.36236>:
 360:	00000c0c 	andeq	r0, r0, ip, lsl #24
 364:	000002e4 	andeq	r0, r0, r4, ror #5
 368:	00000c30 	andeq	r0, r0, r0, lsr ip
 36c:	000005b8 			; <UNDEFINED> instruction: 0x000005b8
 370:	000000f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 374:	00000000 	andeq	r0, r0, r0

00000378 <descriptor.38205>:
 378:	00000c0c 	andeq	r0, r0, ip, lsl #24
 37c:	00000298 	muleq	r0, r8, r2
 380:	00000190 	muleq	r0, r0, r1
 384:	000005ec 	andeq	r0, r0, ip, ror #11
 388:	00000950 	andeq	r0, r0, r0, asr r9
 38c:	00000000 	andeq	r0, r0, r0

00000390 <descriptor.38207>:
 390:	00000c0c 	andeq	r0, r0, ip, lsl #24
 394:	00000298 	muleq	r0, r8, r2
 398:	00000190 	muleq	r0, r0, r1
 39c:	00000604 	andeq	r0, r0, r4, lsl #12
 3a0:	00000951 	andeq	r0, r0, r1, asr r9
 3a4:	00000000 	andeq	r0, r0, r0

000003a8 <descriptor.38356>:
 3a8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 3ac:	00000244 	andeq	r0, r0, r4, asr #4
 3b0:	00000190 	muleq	r0, r0, r1
 3b4:	00000618 	andeq	r0, r0, r8, lsl r6
 3b8:	00000b82 	andeq	r0, r0, r2, lsl #23
 3bc:	00000000 	andeq	r0, r0, r0

000003c0 <descriptor.38358>:
 3c0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 3c4:	00000244 	andeq	r0, r0, r4, asr #4
 3c8:	00000190 	muleq	r0, r0, r1
 3cc:	00000630 	andeq	r0, r0, r0, lsr r6
 3d0:	00000b84 	andeq	r0, r0, r4, lsl #23
 3d4:	00000000 	andeq	r0, r0, r0

000003d8 <descriptor.37783>:
 3d8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 3dc:	000001ec 	andeq	r0, r0, ip, ror #3
 3e0:	00000190 	muleq	r0, r0, r1
 3e4:	00000644 	andeq	r0, r0, r4, asr #12
 3e8:	00000301 	andeq	r0, r0, r1, lsl #6
 3ec:	00000000 	andeq	r0, r0, r0

000003f0 <descriptor.37792>:
 3f0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 3f4:	000001ec 	andeq	r0, r0, ip, ror #3
 3f8:	00000190 	muleq	r0, r0, r1
 3fc:	000006a8 	andeq	r0, r0, r8, lsr #13
 400:	0000035a 	andeq	r0, r0, sl, asr r3
 404:	00000000 	andeq	r0, r0, r0

00000408 <descriptor.38321>:
 408:	00000c0c 	andeq	r0, r0, ip, lsl #24
 40c:	00000200 	andeq	r0, r0, r0, lsl #4
 410:	00000190 	muleq	r0, r0, r1
 414:	00000720 	andeq	r0, r0, r0, lsr #14
 418:	00000b21 	andeq	r0, r0, r1, lsr #22
 41c:	00000000 	andeq	r0, r0, r0

00000420 <descriptor.38446>:
 420:	00000c0c 	andeq	r0, r0, ip, lsl #24
 424:	00000210 	andeq	r0, r0, r0, lsl r2
 428:	00000190 	muleq	r0, r0, r1
 42c:	00000768 	andeq	r0, r0, r8, ror #14
 430:	00000c4e 	andeq	r0, r0, lr, asr #24
 434:	00000000 	andeq	r0, r0, r0

00000438 <descriptor.38468>:
 438:	00000c0c 	andeq	r0, r0, ip, lsl #24
 43c:	00000220 	andeq	r0, r0, r0, lsr #4
 440:	00000190 	muleq	r0, r0, r1
 444:	000007c0 	andeq	r0, r0, r0, asr #15
 448:	00000c8f 	andeq	r0, r0, pc, lsl #25
 44c:	00000000 	andeq	r0, r0, r0

00000450 <descriptor.38470>:
 450:	00000c0c 	andeq	r0, r0, ip, lsl #24
 454:	00000220 	andeq	r0, r0, r0, lsr #4
 458:	00000190 	muleq	r0, r0, r1
 45c:	000007d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 460:	00000c93 	muleq	r0, r3, ip
 464:	00000000 	andeq	r0, r0, r0

00000468 <descriptor.38477>:
 468:	00000c0c 	andeq	r0, r0, ip, lsl #24
 46c:	00000220 	andeq	r0, r0, r0, lsr #4
 470:	00000190 	muleq	r0, r0, r1
 474:	000007e8 	andeq	r0, r0, r8, ror #15
 478:	00000ca2 	andeq	r0, r0, r2, lsr #25
 47c:	00000000 	andeq	r0, r0, r0

00000480 <descriptor.38517>:
 480:	00000c0c 	andeq	r0, r0, ip, lsl #24
 484:	00000230 	andeq	r0, r0, r0, lsr r2
 488:	00000190 	muleq	r0, r0, r1
 48c:	00000800 	andeq	r0, r0, r0, lsl #16
 490:	00000cf9 	strdeq	r0, [r0], -r9
 494:	00000000 	andeq	r0, r0, r0

00000498 <descriptor.37746>:
 498:	00000c0c 	andeq	r0, r0, ip, lsl #24
 49c:	00000338 	andeq	r0, r0, r8, lsr r3
 4a0:	00000190 	muleq	r0, r0, r1
 4a4:	00000814 	andeq	r0, r0, r4, lsl r8
 4a8:	000002bc 			; <UNDEFINED> instruction: 0x000002bc
 4ac:	00000000 	andeq	r0, r0, r0

000004b0 <descriptor.37748>:
 4b0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 4b4:	00000338 	andeq	r0, r0, r8, lsr r3
 4b8:	00000190 	muleq	r0, r0, r1
 4bc:	00000830 	andeq	r0, r0, r0, lsr r8
 4c0:	000002bd 			; <UNDEFINED> instruction: 0x000002bd
 4c4:	00000000 	andeq	r0, r0, r0

000004c8 <descriptor.37749>:
 4c8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 4cc:	00000338 	andeq	r0, r0, r8, lsr r3
 4d0:	00000190 	muleq	r0, r0, r1
 4d4:	00000844 	andeq	r0, r0, r4, asr #16
 4d8:	000002be 			; <UNDEFINED> instruction: 0x000002be
 4dc:	00000000 	andeq	r0, r0, r0

000004e0 <descriptor.37750>:
 4e0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 4e4:	00000338 	andeq	r0, r0, r8, lsr r3
 4e8:	00000190 	muleq	r0, r0, r1
 4ec:	0000085c 	andeq	r0, r0, ip, asr r8
 4f0:	000002c0 	andeq	r0, r0, r0, asr #5
 4f4:	00000000 	andeq	r0, r0, r0

000004f8 <descriptor.37751>:
 4f8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 4fc:	00000338 	andeq	r0, r0, r8, lsr r3
 500:	00000190 	muleq	r0, r0, r1
 504:	00000878 	andeq	r0, r0, r8, ror r8
 508:	000002c2 	andeq	r0, r0, r2, asr #5
 50c:	00000000 	andeq	r0, r0, r0

00000510 <descriptor.37752>:
 510:	00000c0c 	andeq	r0, r0, ip, lsl #24
 514:	00000338 	andeq	r0, r0, r8, lsr r3
 518:	00000190 	muleq	r0, r0, r1
 51c:	00000894 	muleq	r0, r4, r8
 520:	000002c4 	andeq	r0, r0, r4, asr #5
 524:	00000000 	andeq	r0, r0, r0

00000528 <descriptor.37753>:
 528:	00000c0c 	andeq	r0, r0, ip, lsl #24
 52c:	00000338 	andeq	r0, r0, r8, lsr r3
 530:	00000190 	muleq	r0, r0, r1
 534:	000008b0 			; <UNDEFINED> instruction: 0x000008b0
 538:	000002c6 	andeq	r0, r0, r6, asr #5
 53c:	00000000 	andeq	r0, r0, r0

00000540 <descriptor.37754>:
 540:	00000c0c 	andeq	r0, r0, ip, lsl #24
 544:	00000338 	andeq	r0, r0, r8, lsr r3
 548:	00000190 	muleq	r0, r0, r1
 54c:	000008cc 	andeq	r0, r0, ip, asr #17
 550:	000002c8 	andeq	r0, r0, r8, asr #5
 554:	00000000 	andeq	r0, r0, r0

00000558 <descriptor.37755>:
 558:	00000c0c 	andeq	r0, r0, ip, lsl #24
 55c:	00000338 	andeq	r0, r0, r8, lsr r3
 560:	00000190 	muleq	r0, r0, r1
 564:	000008e8 	andeq	r0, r0, r8, ror #17
 568:	000002ca 	andeq	r0, r0, sl, asr #5
 56c:	00000000 	andeq	r0, r0, r0

00000570 <descriptor.37756>:
 570:	00000c0c 	andeq	r0, r0, ip, lsl #24
 574:	00000338 	andeq	r0, r0, r8, lsr r3
 578:	00000190 	muleq	r0, r0, r1
 57c:	00000904 	andeq	r0, r0, r4, lsl #18
 580:	000002cc 	andeq	r0, r0, ip, asr #5
 584:	00000000 	andeq	r0, r0, r0

00000588 <descriptor.37757>:
 588:	00000c0c 	andeq	r0, r0, ip, lsl #24
 58c:	00000338 	andeq	r0, r0, r8, lsr r3
 590:	00000190 	muleq	r0, r0, r1
 594:	00000924 	andeq	r0, r0, r4, lsr #18
 598:	000002ce 	andeq	r0, r0, lr, asr #5
 59c:	00000000 	andeq	r0, r0, r0

000005a0 <descriptor.37758>:
 5a0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 5a4:	00000338 	andeq	r0, r0, r8, lsr r3
 5a8:	00000190 	muleq	r0, r0, r1
 5ac:	00000944 	andeq	r0, r0, r4, asr #18
 5b0:	000002d1 	ldrdeq	r0, [r0], -r1
 5b4:	00000000 	andeq	r0, r0, r0

000005b8 <descriptor.37759>:
 5b8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 5bc:	00000338 	andeq	r0, r0, r8, lsr r3
 5c0:	00000190 	muleq	r0, r0, r1
 5c4:	00000968 	andeq	r0, r0, r8, ror #18
 5c8:	000002d4 	ldrdeq	r0, [r0], -r4
 5cc:	00000000 	andeq	r0, r0, r0

000005d0 <descriptor.37760>:
 5d0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 5d4:	00000338 	andeq	r0, r0, r8, lsr r3
 5d8:	00000190 	muleq	r0, r0, r1
 5dc:	0000098c 	andeq	r0, r0, ip, lsl #19
 5e0:	000002d7 	ldrdeq	r0, [r0], -r7
 5e4:	00000000 	andeq	r0, r0, r0

000005e8 <descriptor.37761>:
 5e8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 5ec:	00000338 	andeq	r0, r0, r8, lsr r3
 5f0:	00000190 	muleq	r0, r0, r1
 5f4:	000009a4 	andeq	r0, r0, r4, lsr #19
 5f8:	000002d9 	ldrdeq	r0, [r0], -r9
 5fc:	00000000 	andeq	r0, r0, r0

00000600 <descriptor.37762>:
 600:	00000c0c 	andeq	r0, r0, ip, lsl #24
 604:	00000338 	andeq	r0, r0, r8, lsr r3
 608:	00000190 	muleq	r0, r0, r1
 60c:	000009c0 	andeq	r0, r0, r0, asr #19
 610:	000002db 	ldrdeq	r0, [r0], -fp
 614:	00000000 	andeq	r0, r0, r0

00000618 <descriptor.37763>:
 618:	00000c0c 	andeq	r0, r0, ip, lsl #24
 61c:	00000338 	andeq	r0, r0, r8, lsr r3
 620:	00000190 	muleq	r0, r0, r1
 624:	000009d8 	ldrdeq	r0, [r0], -r8
 628:	000002dd 	ldrdeq	r0, [r0], -sp
 62c:	00000000 	andeq	r0, r0, r0

00000630 <descriptor.37764>:
 630:	00000c0c 	andeq	r0, r0, ip, lsl #24
 634:	00000338 	andeq	r0, r0, r8, lsr r3
 638:	00000190 	muleq	r0, r0, r1
 63c:	000009f4 	strdeq	r0, [r0], -r4
 640:	000002df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 644:	00000000 	andeq	r0, r0, r0

00000648 <descriptor.37765>:
 648:	00000c0c 	andeq	r0, r0, ip, lsl #24
 64c:	00000338 	andeq	r0, r0, r8, lsr r3
 650:	00000190 	muleq	r0, r0, r1
 654:	00000a0c 	andeq	r0, r0, ip, lsl #20
 658:	000002e1 	andeq	r0, r0, r1, ror #5
 65c:	00000000 	andeq	r0, r0, r0

00000660 <descriptor.37766>:
 660:	00000c0c 	andeq	r0, r0, ip, lsl #24
 664:	00000338 	andeq	r0, r0, r8, lsr r3
 668:	00000190 	muleq	r0, r0, r1
 66c:	00000a2c 	andeq	r0, r0, ip, lsr #20
 670:	000002e3 	andeq	r0, r0, r3, ror #5
 674:	00000000 	andeq	r0, r0, r0

00000678 <descriptor.37767>:
 678:	00000c0c 	andeq	r0, r0, ip, lsl #24
 67c:	00000338 	andeq	r0, r0, r8, lsr r3
 680:	00000190 	muleq	r0, r0, r1
 684:	00000a4c 	andeq	r0, r0, ip, asr #20
 688:	000002e5 	andeq	r0, r0, r5, ror #5
 68c:	00000000 	andeq	r0, r0, r0

00000690 <descriptor.37768>:
 690:	00000c0c 	andeq	r0, r0, ip, lsl #24
 694:	00000338 	andeq	r0, r0, r8, lsr r3
 698:	00000190 	muleq	r0, r0, r1
 69c:	00000a6c 	andeq	r0, r0, ip, ror #20
 6a0:	000002e7 	andeq	r0, r0, r7, ror #5
 6a4:	00000000 	andeq	r0, r0, r0

000006a8 <descriptor.37769>:
 6a8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 6ac:	00000338 	andeq	r0, r0, r8, lsr r3
 6b0:	00000190 	muleq	r0, r0, r1
 6b4:	00000a8c 	andeq	r0, r0, ip, lsl #21
 6b8:	000002e9 	andeq	r0, r0, r9, ror #5
 6bc:	00000000 	andeq	r0, r0, r0

000006c0 <descriptor.37770>:
 6c0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 6c4:	00000338 	andeq	r0, r0, r8, lsr r3
 6c8:	00000190 	muleq	r0, r0, r1
 6cc:	00000aac 	andeq	r0, r0, ip, lsr #21
 6d0:	000002eb 	andeq	r0, r0, fp, ror #5
 6d4:	00000000 	andeq	r0, r0, r0

000006d8 <descriptor.37771>:
 6d8:	00000c0c 	andeq	r0, r0, ip, lsl #24
 6dc:	00000338 	andeq	r0, r0, r8, lsr r3
 6e0:	00000190 	muleq	r0, r0, r1
 6e4:	00000ac8 	andeq	r0, r0, r8, asr #21
 6e8:	000002ed 	andeq	r0, r0, sp, ror #5
 6ec:	00000000 	andeq	r0, r0, r0

000006f0 <descriptor.38290>:
 6f0:	00000c0c 	andeq	r0, r0, ip, lsl #24
 6f4:	00000284 	andeq	r0, r0, r4, lsl #5
 6f8:	00000190 	muleq	r0, r0, r1
 6fc:	00000ae0 	andeq	r0, r0, r0, ror #21
 700:	00000a49 	andeq	r0, r0, r9, asr #20
 704:	00000000 	andeq	r0, r0, r0

00000708 <descriptor.38298>:
 708:	00000c0c 	andeq	r0, r0, ip, lsl #24
 70c:	00000284 	andeq	r0, r0, r4, lsl #5
 710:	00000190 	muleq	r0, r0, r1
 714:	00000b28 	andeq	r0, r0, r8, lsr #22
 718:	00000a9f 	muleq	r0, pc, sl	; <UNPREDICTABLE>
 71c:	00000000 	andeq	r0, r0, r0

00000720 <descriptor.38300>:
 720:	00000c0c 	andeq	r0, r0, ip, lsl #24
 724:	00000284 	andeq	r0, r0, r4, lsl #5
 728:	00000190 	muleq	r0, r0, r1
 72c:	00000b4c 	andeq	r0, r0, ip, asr #22
 730:	00000aa6 	andeq	r0, r0, r6, lsr #21
 734:	00000000 	andeq	r0, r0, r0

00000738 <descriptor.38304>:
 738:	00000c0c 	andeq	r0, r0, ip, lsl #24
 73c:	00000284 	andeq	r0, r0, r4, lsl #5
 740:	00000190 	muleq	r0, r0, r1
 744:	00000bb0 			; <UNDEFINED> instruction: 0x00000bb0
 748:	00000ab5 			; <UNDEFINED> instruction: 0x00000ab5
 74c:	00000000 	andeq	r0, r0, r0

00000750 <descriptor.38701>:
 750:	00000c0c 	andeq	r0, r0, ip, lsl #24
 754:	00000270 	andeq	r0, r0, r0, ror r2
 758:	00000190 	muleq	r0, r0, r1
 75c:	00000bc0 	andeq	r0, r0, r0, asr #23
 760:	00000dec 	andeq	r0, r0, ip, ror #27
 764:	00000000 	andeq	r0, r0, r0

00000768 <descriptor.38706>:
 768:	00000c0c 	andeq	r0, r0, ip, lsl #24
 76c:	0000025c 	andeq	r0, r0, ip, asr r2
 770:	00000190 	muleq	r0, r0, r1
 774:	00000bdc 	ldrdeq	r0, [r0], -ip
 778:	00000df4 	strdeq	r0, [r0], -r4
 77c:	00000000 	andeq	r0, r0, r0

00000780 <descriptor.28871>:
 780:	00000fc4 	andeq	r0, r0, r4, asr #31
 784:	00000738 	andeq	r0, r0, r8, lsr r7
 788:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 78c:	00000d44 	andeq	r0, r0, r4, asr #26
 790:	0000038c 	andeq	r0, r0, ip, lsl #7
 794:	00000000 	andeq	r0, r0, r0

00000798 <descriptor.28698>:
 798:	00000fc4 	andeq	r0, r0, r4, asr #31
 79c:	0000074c 	andeq	r0, r0, ip, asr #14
 7a0:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 7a4:	00000d88 	andeq	r0, r0, r8, lsl #27
 7a8:	00000048 	andeq	r0, r0, r8, asr #32
 7ac:	00000000 	andeq	r0, r0, r0

000007b0 <descriptor.28844>:
 7b0:	00000fc4 	andeq	r0, r0, r4, asr #31
 7b4:	00000724 	andeq	r0, r0, r4, lsr #14
 7b8:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 7bc:	00000f94 	muleq	r0, r4, pc	; <UNPREDICTABLE>
 7c0:	0000026a 	andeq	r0, r0, sl, ror #4
 7c4:	00000000 	andeq	r0, r0, r0

000007c8 <descriptor.28846>:
 7c8:	00000fc4 	andeq	r0, r0, r4, asr #31
 7cc:	00000724 	andeq	r0, r0, r4, lsr #14
 7d0:	00000fd0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 7d4:	00000fb4 			; <UNDEFINED> instruction: 0x00000fb4
 7d8:	00000274 	andeq	r0, r0, r4, ror r2
 7dc:	00000000 	andeq	r0, r0, r0

000007e0 <descriptor.28424>:
 7e0:	000010cc 	andeq	r1, r0, ip, asr #1
 7e4:	00000760 	andeq	r0, r0, r0, ror #14
 7e8:	000010d8 	ldrdeq	r1, [r0], -r8
 7ec:	00001020 	andeq	r1, r0, r0, lsr #32
 7f0:	000000db 	ldrdeq	r0, [r0], -fp
 7f4:	00000000 	andeq	r0, r0, r0

000007f8 <descriptor.28451>:
 7f8:	000010cc 	andeq	r1, r0, ip, asr #1
 7fc:	0000077c 	andeq	r0, r0, ip, ror r7
 800:	000010d8 	ldrdeq	r1, [r0], -r8
 804:	00001020 	andeq	r1, r0, r0, lsr #32
 808:	0000010c 	andeq	r0, r0, ip, lsl #2
 80c:	00000000 	andeq	r0, r0, r0

00000810 <descriptor.28466>:
 810:	000010cc 	andeq	r1, r0, ip, asr #1
 814:	00000794 	muleq	r0, r4, r7
 818:	000010d8 	ldrdeq	r1, [r0], -r8
 81c:	00001020 	andeq	r1, r0, r0, lsr #32
 820:	00000126 	andeq	r0, r0, r6, lsr #2
 824:	00000000 	andeq	r0, r0, r0

00000828 <descriptor.28482>:
 828:	000010cc 	andeq	r1, r0, ip, asr #1
 82c:	000007ac 	andeq	r0, r0, ip, lsr #15
 830:	000010d8 	ldrdeq	r1, [r0], -r8
 834:	00001020 	andeq	r1, r0, r0, lsr #32
 838:	0000013e 	andeq	r0, r0, lr, lsr r1
 83c:	00000000 	andeq	r0, r0, r0

00000840 <descriptor.28395>:
 840:	000010cc 	andeq	r1, r0, ip, asr #1
 844:	000007c4 	andeq	r0, r0, r4, asr #15
 848:	000010d8 	ldrdeq	r1, [r0], -r8
 84c:	00001020 	andeq	r1, r0, r0, lsr #32
 850:	00000052 	andeq	r0, r0, r2, asr r0
 854:	00000000 	andeq	r0, r0, r0

00000858 <descriptor.28409>:
 858:	000010cc 	andeq	r1, r0, ip, asr #1
 85c:	000007c4 	andeq	r0, r0, r4, asr #15
 860:	000010d8 	ldrdeq	r1, [r0], -r8
 864:	00001058 	andeq	r1, r0, r8, asr r0
 868:	000000c4 	andeq	r0, r0, r4, asr #1
 86c:	00000000 	andeq	r0, r0, r0

00000870 <descriptor.28410>:
 870:	000010cc 	andeq	r1, r0, ip, asr #1
 874:	000007c4 	andeq	r0, r0, r4, asr #15
 878:	000010d8 	ldrdeq	r1, [r0], -r8
 87c:	00001070 	andeq	r1, r0, r0, ror r0
 880:	000000c6 	andeq	r0, r0, r6, asr #1
 884:	00000000 	andeq	r0, r0, r0

00000888 <descriptor.28386>:
 888:	000010cc 	andeq	r1, r0, ip, asr #1
 88c:	00000818 	andeq	r0, r0, r8, lsl r8
 890:	000010d8 	ldrdeq	r1, [r0], -r8
 894:	0000108c 	andeq	r1, r0, ip, lsl #1
 898:	00000033 	andeq	r0, r0, r3, lsr r0
 89c:	00000000 	andeq	r0, r0, r0

000008a0 <descriptor.28496>:
 8a0:	000010cc 	andeq	r1, r0, ip, asr #1
 8a4:	000007dc 	ldrdeq	r0, [r0], -ip
 8a8:	000010d8 	ldrdeq	r1, [r0], -r8
 8ac:	00001020 	andeq	r1, r0, r0, lsr #32
 8b0:	00000159 	andeq	r0, r0, r9, asr r1
 8b4:	00000000 	andeq	r0, r0, r0

000008b8 <descriptor.28542>:
 8b8:	000010cc 	andeq	r1, r0, ip, asr #1
 8bc:	00000800 	andeq	r0, r0, r0, lsl #16
 8c0:	000010d8 	ldrdeq	r1, [r0], -r8
 8c4:	000010b8 	strheq	r1, [r0], -r8
 8c8:	000001eb 	andeq	r0, r0, fp, ror #3
 8cc:	00000000 	andeq	r0, r0, r0

000008d0 <descriptor.17377>:
 8d0:	00001308 	andeq	r1, r0, r8, lsl #6
 8d4:	0000082c 	andeq	r0, r0, ip, lsr #16
 8d8:	00001314 	andeq	r1, r0, r4, lsl r3
 8dc:	0000112c 	andeq	r1, r0, ip, lsr #2
 8e0:	0000008f 	andeq	r0, r0, pc, lsl #1
 8e4:	00000000 	andeq	r0, r0, r0

000008e8 <descriptor.17379>:
 8e8:	00001308 	andeq	r1, r0, r8, lsl #6
 8ec:	0000082c 	andeq	r0, r0, ip, lsr #16
 8f0:	00001314 	andeq	r1, r0, r4, lsl r3
 8f4:	00001154 	andeq	r1, r0, r4, asr r1
 8f8:	00000095 	muleq	r0, r5, r0
 8fc:	00000000 	andeq	r0, r0, r0

00000900 <descriptor.17380>:
 900:	00001308 	andeq	r1, r0, r8, lsl #6
 904:	0000082c 	andeq	r0, r0, ip, lsr #16
 908:	00001314 	andeq	r1, r0, r4, lsl r3
 90c:	0000117c 	andeq	r1, r0, ip, ror r1
 910:	0000009a 	muleq	r0, sl, r0
 914:	00000000 	andeq	r0, r0, r0

00000918 <descriptor.17384>:
 918:	00001308 	andeq	r1, r0, r8, lsl #6
 91c:	0000082c 	andeq	r0, r0, ip, lsr #16
 920:	00001314 	andeq	r1, r0, r4, lsl r3
 924:	000011a0 	andeq	r1, r0, r0, lsr #3
 928:	000000ae 	andeq	r0, r0, lr, lsr #1
 92c:	00000000 	andeq	r0, r0, r0

00000930 <descriptor.17385>:
 930:	00001308 	andeq	r1, r0, r8, lsl #6
 934:	0000082c 	andeq	r0, r0, ip, lsr #16
 938:	00001314 	andeq	r1, r0, r4, lsl r3
 93c:	000011c4 	andeq	r1, r0, r4, asr #3
 940:	000000b5 	strheq	r0, [r0], -r5
 944:	00000000 	andeq	r0, r0, r0

00000948 <descriptor.17423>:
 948:	00001308 	andeq	r1, r0, r8, lsl #6
 94c:	00000848 	andeq	r0, r0, r8, asr #16
 950:	00001314 	andeq	r1, r0, r4, lsl r3
 954:	00001208 	andeq	r1, r0, r8, lsl #4
 958:	0000014f 	andeq	r0, r0, pc, asr #2
 95c:	00000000 	andeq	r0, r0, r0

00000960 <descriptor.17425>:
 960:	00001308 	andeq	r1, r0, r8, lsl #6
 964:	00000848 	andeq	r0, r0, r8, asr #16
 968:	00001314 	andeq	r1, r0, r4, lsl r3
 96c:	000012a8 	andeq	r1, r0, r8, lsr #5
 970:	00000194 	muleq	r0, r4, r1
 974:	00000000 	andeq	r0, r0, r0

00000978 <descriptor.29861>:
 978:	00001414 	andeq	r1, r0, r4, lsl r4
 97c:	000008d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 980:	00001420 	andeq	r1, r0, r0, lsr #8
 984:	00001374 	andeq	r1, r0, r4, ror r3
 988:	0000003d 	andeq	r0, r0, sp, lsr r0
 98c:	00000000 	andeq	r0, r0, r0

00000990 <descriptor.29909>:
 990:	00001414 	andeq	r1, r0, r4, lsl r4
 994:	000008b0 			; <UNDEFINED> instruction: 0x000008b0
 998:	00001420 	andeq	r1, r0, r0, lsr #8
 99c:	000013d4 	ldrdeq	r1, [r0], -r4
 9a0:	00000084 	andeq	r0, r0, r4, lsl #1
 9a4:	00000000 	andeq	r0, r0, r0

000009a8 <descriptor.31287>:
 9a8:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 9ac:	000008ec 	andeq	r0, r0, ip, ror #17
 9b0:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 9b4:	00001478 	andeq	r1, r0, r8, ror r4
 9b8:	0000001c 	andeq	r0, r0, ip, lsl r0
 9bc:	00000000 	andeq	r0, r0, r0

000009c0 <descriptor.31291>:
 9c0:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 9c4:	000008ec 	andeq	r0, r0, ip, ror #17
 9c8:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 9cc:	00001498 	muleq	r0, r8, r4
 9d0:	00000021 	andeq	r0, r0, r1, lsr #32
 9d4:	00000000 	andeq	r0, r0, r0

000009d8 <descriptor.31293>:
 9d8:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 9dc:	000008ec 	andeq	r0, r0, ip, ror #17
 9e0:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 9e4:	000014c4 	andeq	r1, r0, r4, asr #9
 9e8:	00000026 	andeq	r0, r0, r6, lsr #32
 9ec:	00000000 	andeq	r0, r0, r0

000009f0 <descriptor.31295>:
 9f0:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 9f4:	000008ec 	andeq	r0, r0, ip, ror #17
 9f8:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 9fc:	000014f4 	strdeq	r1, [r0], -r4
 a00:	0000002b 	andeq	r0, r0, fp, lsr #32
 a04:	00000000 	andeq	r0, r0, r0

00000a08 <descriptor.31297>:
 a08:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a0c:	000008ec 	andeq	r0, r0, ip, ror #17
 a10:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a14:	00001528 	andeq	r1, r0, r8, lsr #10
 a18:	00000030 	andeq	r0, r0, r0, lsr r0
 a1c:	00000000 	andeq	r0, r0, r0

00000a20 <descriptor.31299>:
 a20:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a24:	000008ec 	andeq	r0, r0, ip, ror #17
 a28:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a2c:	0000155c 	andeq	r1, r0, ip, asr r5
 a30:	00000035 	andeq	r0, r0, r5, lsr r0
 a34:	00000000 	andeq	r0, r0, r0

00000a38 <descriptor.31301>:
 a38:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a3c:	000008ec 	andeq	r0, r0, ip, ror #17
 a40:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a44:	00001588 	andeq	r1, r0, r8, lsl #11
 a48:	0000003a 	andeq	r0, r0, sl, lsr r0
 a4c:	00000000 	andeq	r0, r0, r0

00000a50 <descriptor.31303>:
 a50:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a54:	000008ec 	andeq	r0, r0, ip, ror #17
 a58:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a5c:	000015b8 			; <UNDEFINED> instruction: 0x000015b8
 a60:	0000003f 	andeq	r0, r0, pc, lsr r0
 a64:	00000000 	andeq	r0, r0, r0

00000a68 <descriptor.31305>:
 a68:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a6c:	000008ec 	andeq	r0, r0, ip, ror #17
 a70:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a74:	000015e8 	andeq	r1, r0, r8, ror #11
 a78:	00000044 	andeq	r0, r0, r4, asr #32
 a7c:	00000000 	andeq	r0, r0, r0

00000a80 <descriptor.31307>:
 a80:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a84:	000008ec 	andeq	r0, r0, ip, ror #17
 a88:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 a8c:	00001614 	andeq	r1, r0, r4, lsl r6
 a90:	00000049 	andeq	r0, r0, r9, asr #32
 a94:	00000000 	andeq	r0, r0, r0

00000a98 <descriptor.31309>:
 a98:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 a9c:	000008ec 	andeq	r0, r0, ip, ror #17
 aa0:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 aa4:	00001640 	andeq	r1, r0, r0, asr #12
 aa8:	0000004e 	andeq	r0, r0, lr, asr #32
 aac:	00000000 	andeq	r0, r0, r0

00000ab0 <descriptor.31311>:
 ab0:	000016b0 			; <UNDEFINED> instruction: 0x000016b0
 ab4:	000008ec 	andeq	r0, r0, ip, ror #17
 ab8:	000016bc 			; <UNDEFINED> instruction: 0x000016bc
 abc:	0000166c 	andeq	r1, r0, ip, ror #12
 ac0:	00000053 	andeq	r0, r0, r3, asr r0
 ac4:	00000000 	andeq	r0, r0, r0

Disassembly of section .gnu.linkonce.this_module:

00000000 <__this_module>:
	...
   c:	76757069 	ldrbtvc	r7, [r5], -r9, rrx
  10:	77735f33 			; <UNDEFINED> instruction: 0x77735f33
	...

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
  88:	00001ca8 	andeq	r1, r0, r8, lsr #25
  8c:	8001aeb0 			; <UNDEFINED> instruction: 0x8001aeb0
  90:	00001e60 	andeq	r1, r0, r0, ror #28
  94:	80b108af 	adcshi	r0, r1, pc, lsr #17
  98:	00002374 	andeq	r2, r0, r4, ror r3
  9c:	80b108af 	adcshi	r0, r1, pc, lsr #17
  a0:	000026a0 	andeq	r2, r0, r0, lsr #13
  a4:	8006afb0 			; <UNDEFINED> instruction: 0x8006afb0
  a8:	00003114 	andeq	r3, r0, r4, lsl r1
  ac:	80a8b0b0 	strhthi	fp, [r8], r0
  b0:	00003238 	andeq	r3, r0, r8, lsr r2
  b4:	8024afb0 	strhthi	sl, [r4], -r0
  b8:	00005894 	muleq	r0, r4, r8
  bc:	8004afb0 			; <UNDEFINED> instruction: 0x8004afb0
  c0:	00005fd0 	ldrdeq	r5, [r0], -r0
  c4:	800eafb0 			; <UNDEFINED> instruction: 0x800eafb0
  c8:	000061c8 	andeq	r6, r0, r8, asr #3
  cc:	80a8b0b0 	strhthi	fp, [r8], r0
  d0:	000061e0 	andeq	r6, r0, r0, ror #3
  d4:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
  d8:	00006c98 	muleq	r0, r8, ip
  dc:	8002abb0 			; <UNDEFINED> instruction: 0x8002abb0
  e0:	00006d90 	muleq	r0, r0, sp
  e4:	80acb0b0 	strhthi	fp, [ip], r0
  e8:	00006e48 	andeq	r6, r0, r8, asr #28
  ec:	80aeb0b0 	strhthi	fp, [lr], r0
  f0:	00006f18 	andeq	r6, r0, r8, lsl pc
  f4:	80aeb0b0 	strhthi	fp, [lr], r0
  f8:	00006f94 	muleq	r0, r4, pc	; <UNPREDICTABLE>
  fc:	80acb0b0 	strhthi	fp, [ip], r0
 100:	0000700c 	andeq	r7, r0, ip
 104:	80acb0b0 	strhthi	fp, [ip], r0
 108:	0000707c 	andeq	r7, r0, ip, ror r0
 10c:	80aeb0b0 	strhthi	fp, [lr], r0
 110:	00007214 	andeq	r7, r0, r4, lsl r2
 114:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
 118:	00007358 	andeq	r7, r0, r8, asr r3
 11c:	8001aab0 			; <UNDEFINED> instruction: 0x8001aab0
 120:	000073f0 	strdeq	r7, [r0], -r0
 124:	80aab0b0 	strhthi	fp, [sl], r0
 128:	00007464 	andeq	r7, r0, r4, ror #8
 12c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 130:	00007468 	andeq	r7, r0, r8, ror #8
 134:	80aab0b0 	strhthi	fp, [sl], r0
 138:	00007b78 	andeq	r7, r0, r8, ror fp
 13c:	80acb0b0 	strhthi	fp, [ip], r0
 140:	00007c4c 	andeq	r7, r0, ip, asr #24
 144:	80aeb0b0 	strhthi	fp, [lr], r0
 148:	00007c98 	muleq	r0, r8, ip
 14c:	801eafb0 			; <UNDEFINED> instruction: 0x801eafb0
 150:	00008974 	andeq	r8, r0, r4, ror r9
 154:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
 158:	00008b50 	andeq	r8, r0, r0, asr fp
 15c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 160:	00008c20 	andeq	r8, r0, r0, lsr #24
 164:	80b0b0b0 	ldrhthi	fp, [r0], r0
 168:	00008c60 	andeq	r8, r0, r0, ror #24
 16c:	80a8b0b0 	strhthi	fp, [r8], r0
 170:	00008cac 	andeq	r8, r0, ip, lsr #25
 174:	80a8b0b0 	strhthi	fp, [r8], r0
 178:	00008cfc 	strdeq	r8, [r0], -ip
 17c:	80acb0b0 	strhthi	fp, [ip], r0
 180:	00008e58 	andeq	r8, r0, r8, asr lr
 184:	80b0b0b0 	ldrhthi	fp, [r0], r0
 188:	00008e70 	andeq	r8, r0, r0, ror lr
 18c:	80a8b0b0 	strhthi	fp, [r8], r0
 190:	00008e8c 	andeq	r8, r0, ip, lsl #29
 194:	800aa9b0 			; <UNDEFINED> instruction: 0x800aa9b0
 198:	00008ef8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 19c:	80028400 	andhi	r8, r2, r0, lsl #8
 1a0:	00008f28 	andeq	r8, r0, r8, lsr #30
 1a4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1a8:	00008f40 	andeq	r8, r0, r0, asr #30
 1ac:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1b0:	00008f50 	andeq	r8, r0, r0, asr pc
 1b4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1b8:	00008f68 	andeq	r8, r0, r8, ror #30
 1bc:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1c0:	00008f78 	andeq	r8, r0, r8, ror pc
 1c4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 1c8:	00008f88 	andeq	r8, r0, r8, lsl #31
 1cc:	8002a9b0 			; <UNDEFINED> instruction: 0x8002a9b0
 1d0:	00008fd4 	ldrdeq	r8, [r0], -r4
 1d4:	80a8b0b0 	strhthi	fp, [r8], r0
 1d8:	00008ff8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 1dc:	80a8b0b0 	strhthi	fp, [r8], r0
 1e0:	00009018 	andeq	r9, r0, r8, lsl r0
 1e4:	80a8b0b0 	strhthi	fp, [r8], r0
 1e8:	00009038 	andeq	r9, r0, r8, lsr r0
 1ec:	80aab0b0 	strhthi	fp, [sl], r0
 1f0:	00009220 	andeq	r9, r0, r0, lsr #4
 1f4:	8005acb0 			; <UNDEFINED> instruction: 0x8005acb0
 1f8:	000093ac 	andeq	r9, r0, ip, lsr #7
 1fc:	80aab0b0 	strhthi	fp, [sl], r0
 200:	000093e0 	andeq	r9, r0, r0, ror #7
 204:	80aab0b0 	strhthi	fp, [sl], r0
 208:	0000944c 	andeq	r9, r0, ip, asr #8
 20c:	80a8b0b0 	strhthi	fp, [r8], r0
 210:	00009500 	andeq	r9, r0, r0, lsl #10
 214:	80aab0b0 	strhthi	fp, [sl], r0
 218:	000095f8 	strdeq	r9, [r0], -r8
 21c:	80aab0b0 	strhthi	fp, [sl], r0
 220:	000096f0 	strdeq	r9, [r0], -r0
 224:	80acb0b0 	strhthi	fp, [ip], r0
 228:	000098b4 			; <UNDEFINED> instruction: 0x000098b4
 22c:	80aab0b0 	strhthi	fp, [sl], r0
 230:	000098e4 	andeq	r9, r0, r4, ror #17
 234:	8003aeb0 			; <UNDEFINED> instruction: 0x8003aeb0
 238:	00009ba8 	andeq	r9, r0, r8, lsr #23
 23c:	80aab0b0 	strhthi	fp, [sl], r0
 240:	00009bd4 	ldrdeq	r9, [r0], -r4
 244:	80b0b0b0 	ldrhthi	fp, [r0], r0
 248:	00009bd8 	ldrdeq	r9, [r0], -r8
 24c:	80aab0b0 	strhthi	fp, [sl], r0
 250:	00009c04 	andeq	r9, r0, r4, lsl #24
 254:	8003aeb0 			; <UNDEFINED> instruction: 0x8003aeb0
 258:	00009d9c 	muleq	r0, ip, sp
 25c:	80aab0b0 	strhthi	fp, [sl], r0
 260:	00009dc8 	andeq	r9, r0, r8, asr #27
 264:	80b0b0b0 	ldrhthi	fp, [r0], r0
 268:	00009dcc 	andeq	r9, r0, ip, asr #27
 26c:	80aab0b0 	strhthi	fp, [sl], r0
 270:	00009df8 	strdeq	r9, [r0], -r8
 274:	8004adb0 			; <UNDEFINED> instruction: 0x8004adb0
 278:	0000a0a4 	andeq	sl, r0, r4, lsr #1
 27c:	80aab0b0 	strhthi	fp, [sl], r0
 280:	0000a0d0 	ldrdeq	sl, [r0], -r0
 284:	80b0b0b0 	ldrhthi	fp, [r0], r0
 288:	0000a0d4 	ldrdeq	sl, [r0], -r4
 28c:	80aab0b0 	strhthi	fp, [sl], r0
 290:	0000a100 	andeq	sl, r0, r0, lsl #2
 294:	8002afb0 			; <UNDEFINED> instruction: 0x8002afb0
 298:	0000a368 	andeq	sl, r0, r8, ror #6
 29c:	80aab0b0 	strhthi	fp, [sl], r0
 2a0:	0000a39c 	muleq	r0, ip, r3
 2a4:	80aab0b0 	strhthi	fp, [sl], r0
 2a8:	0000a404 	andeq	sl, r0, r4, lsl #8
 2ac:	80acb0b0 	strhthi	fp, [ip], r0
 2b0:	0000a4a0 	andeq	sl, r0, r0, lsr #9
 2b4:	80acb0b0 	strhthi	fp, [ip], r0
 2b8:	0000a534 	andeq	sl, r0, r4, lsr r5
 2bc:	80acb0b0 	strhthi	fp, [ip], r0
 2c0:	0000a5dc 	ldrdeq	sl, [r0], -ip
 2c4:	8001aeb0 			; <UNDEFINED> instruction: 0x8001aeb0
 2c8:	0000a9a8 	andeq	sl, r0, r8, lsr #19
 2cc:	80a8b0b0 	strhthi	fp, [r8], r0
 2d0:	0000a9f8 	strdeq	sl, [r0], -r8
 2d4:	80aab0b0 	strhthi	fp, [sl], r0
 2d8:	0000aa94 	muleq	r0, r4, sl
 2dc:	80aab0b0 	strhthi	fp, [sl], r0
 2e0:	0000aafc 	strdeq	sl, [r0], -ip
 2e4:	80aab0b0 	strhthi	fp, [sl], r0
 2e8:	0000ab2c 	andeq	sl, r0, ip, lsr #22
 2ec:	80aab0b0 	strhthi	fp, [sl], r0
 2f0:	0000ab5c 	andeq	sl, r0, ip, asr fp
 2f4:	80aab0b0 	strhthi	fp, [sl], r0
 2f8:	0000ab8c 	andeq	sl, r0, ip, lsl #23
 2fc:	80acb0b0 	strhthi	fp, [ip], r0
 300:	0000ac08 	andeq	sl, r0, r8, lsl #24
 304:	80aab0b0 	strhthi	fp, [sl], r0
 308:	0000ac38 	andeq	sl, r0, r8, lsr ip
 30c:	80aab0b0 	strhthi	fp, [sl], r0
 310:	0000ac68 	andeq	sl, r0, r8, ror #24
 314:	80acb0b0 	strhthi	fp, [ip], r0
 318:	0000ad50 	andeq	sl, r0, r0, asr sp
 31c:	80aab0b0 	strhthi	fp, [sl], r0
 320:	0000ada0 	andeq	sl, r0, r0, lsr #27
 324:	80aab0b0 	strhthi	fp, [sl], r0
 328:	0000ae04 	andeq	sl, r0, r4, lsl #28
 32c:	80aab0b0 	strhthi	fp, [sl], r0
 330:	0000aeac 	andeq	sl, r0, ip, lsr #29
 334:	80aab0b0 	strhthi	fp, [sl], r0
 338:	0000af74 	andeq	sl, r0, r4, ror pc
 33c:	80aab0b0 	strhthi	fp, [sl], r0
 340:	0000b00c 	andeq	fp, r0, ip
 344:	80aab0b0 	strhthi	fp, [sl], r0
 348:	0000b0bc 	strheq	fp, [r0], -ip
 34c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 350:	0000b0c0 	andeq	fp, r0, r0, asr #1
 354:	80b0b0b0 	ldrhthi	fp, [r0], r0
 358:	0000b134 	andeq	fp, r0, r4, lsr r1
 35c:	80acb0b0 	strhthi	fp, [ip], r0
 360:	0000b18c 	andeq	fp, r0, ip, lsl #3
 364:	8006a9b0 			; <UNDEFINED> instruction: 0x8006a9b0
 368:	0000b348 	andeq	fp, r0, r8, asr #6
 36c:	8022afb0 	strhthi	sl, [r2], -r0
 370:	0000bd68 	andeq	fp, r0, r8, ror #26
 374:	80b0b0b0 	ldrhthi	fp, [r0], r0
 378:	0000bd6c 	andeq	fp, r0, ip, ror #26
 37c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 380:	0000bd74 	andeq	fp, r0, r4, ror sp
 384:	80b0b0b0 	ldrhthi	fp, [r0], r0
 388:	0000bd78 	andeq	fp, r0, r8, ror sp
 38c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 390:	0000bd7c 	andeq	fp, r0, ip, ror sp
 394:	80b0b0b0 	ldrhthi	fp, [r0], r0
 398:	0000bd80 	andeq	fp, r0, r0, lsl #27
 39c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3a0:	0000bd88 	andeq	fp, r0, r8, lsl #27
 3a4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3a8:	0000bd90 	muleq	r0, r0, sp
 3ac:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3b0:	0000bd98 	muleq	r0, r8, sp
 3b4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3b8:	0000bda0 	andeq	fp, r0, r0, lsr #27
 3bc:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3c0:	0000bda4 	andeq	fp, r0, r4, lsr #27
 3c4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3c8:	0000bda8 	andeq	fp, r0, r8, lsr #27
 3cc:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3d0:	0000bdac 	andeq	fp, r0, ip, lsr #27
 3d4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3d8:	0000bdb0 			; <UNDEFINED> instruction: 0x0000bdb0
 3dc:	8001b0b0 	strhhi	fp, [r1], -r0
 3e0:	0000bdc4 	andeq	fp, r0, r4, asr #27
 3e4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3e8:	0000bdcc 	andeq	fp, r0, ip, asr #27
 3ec:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3f0:	0000bdd0 	ldrdeq	fp, [r0], -r0
 3f4:	80b0b0b0 	ldrhthi	fp, [r0], r0
 3f8:	0000bdd4 	ldrdeq	fp, [r0], -r4
 3fc:	80b0b0b0 	ldrhthi	fp, [r0], r0
 400:	0000bdd8 	ldrdeq	fp, [r0], -r8
 404:	80b0b0b0 	ldrhthi	fp, [r0], r0
 408:	0000bde0 	andeq	fp, r0, r0, ror #27
 40c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 410:	0000bde4 	andeq	fp, r0, r4, ror #27
 414:	80b0b0b0 	ldrhthi	fp, [r0], r0
 418:	0000bde8 	andeq	fp, r0, r8, ror #27
 41c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 420:	0000bdec 	andeq	fp, r0, ip, ror #27
 424:	80b0b0b0 	ldrhthi	fp, [r0], r0
 428:	0000bdf0 	strdeq	fp, [r0], -r0
 42c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 430:	0000bdf4 	strdeq	fp, [r0], -r4
 434:	80b0b0b0 	ldrhthi	fp, [r0], r0
 438:	0000bdf8 	strdeq	fp, [r0], -r8
 43c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 440:	0000be00 	andeq	fp, r0, r0, lsl #28
 444:	80b0b0b0 	ldrhthi	fp, [r0], r0
 448:	0000be08 	andeq	fp, r0, r8, lsl #28
 44c:	80b0b0b0 	ldrhthi	fp, [r0], r0
 450:	0000be0c 	andeq	fp, r0, ip, lsl #28
 454:	80b0b0b0 	ldrhthi	fp, [r0], r0
 458:	0000be14 	andeq	fp, r0, r4, lsl lr
 45c:	80acb0b0 	strhthi	fp, [ip], r0
 460:	0000beb4 			; <UNDEFINED> instruction: 0x0000beb4
 464:	80aab0b0 	strhthi	fp, [sl], r0
 468:	0000befc 	strdeq	fp, [r0], -ip
 46c:	80aab0b0 	strhthi	fp, [sl], r0
 470:	0000bf48 	andeq	fp, r0, r8, asr #30
 474:	80aeb0b0 	strhthi	fp, [lr], r0
 478:	0000c020 	andeq	ip, r0, r0, lsr #32
 47c:	80aeb0b0 	strhthi	fp, [lr], r0
 480:	0000c124 	andeq	ip, r0, r4, lsr #2
 484:	8004adb0 			; <UNDEFINED> instruction: 0x8004adb0
 488:	0000c1f0 	strdeq	ip, [r0], -r0
 48c:	8006afb0 			; <UNDEFINED> instruction: 0x8006afb0
 490:	0000c298 	muleq	r0, r8, r2
 494:	8007aeb0 			; <UNDEFINED> instruction: 0x8007aeb0
 498:	0000c354 	andeq	ip, r0, r4, asr r3
 49c:	8007aeb0 			; <UNDEFINED> instruction: 0x8007aeb0
 4a0:	0000c410 	andeq	ip, r0, r0, lsl r4
 4a4:	80a8b0b0 	strhthi	fp, [r8], r0

Disassembly of section .modinfo:

00000000 <__UNIQUE_ID_srcversion18>:
   0:	76637273 			; <UNDEFINED> instruction: 0x76637273
   4:	69737265 	ldmdbvs	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
   8:	453d6e6f 	ldrmi	r6, [sp, #-3695]!	; 0xfffff191
   c:	43363042 	teqmi	r6, #66	; 0x42
  10:	31333239 	teqcc	r3, r9, lsr r2
  14:	42334436 	eorsmi	r4, r3, #905969664	; 0x36000000
  18:	39324238 	ldmdbcc	r2!, {r3, r4, r5, r9, lr}
  1c:	35334643 	ldrcc	r4, [r3, #-1603]!	; 0xfffff9bd
  20:	61003237 	tstvs	r0, r7, lsr r2

00000023 <__UNIQUE_ID_alias17>:
  23:	61696c61 	cmnvs	r9, r1, ror #24
  27:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  2b:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  2f:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  33:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  37:	70713678 	rsbsvc	r3, r1, r8, ror r6
  3b:	7570692d 	ldrbvc	r6, [r0, #-2349]!	; 0xfffff6d3
  3f:	61002a43 	tstvs	r0, r3, asr #20

00000042 <__UNIQUE_ID_alias16>:
  42:	61696c61 	cmnvs	r9, r1, ror #24
  46:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  4a:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  4e:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  52:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  56:	70713678 	rsbsvc	r3, r1, r8, ror r6
  5a:	7570692d 	ldrbvc	r6, [r0, #-2349]!	; 0xfffff6d3
	...

0000005f <__UNIQUE_ID_alias15>:
  5f:	61696c61 	cmnvs	r9, r1, ror #24
  63:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  67:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  6b:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  6f:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  73:	2d713678 	ldclcs	6, cr3, [r1, #-480]!	; 0xfffffe20
  77:	43757069 	cmnmi	r5, #105	; 0x69
  7b:	6c61002a 	stclvs	0, cr0, [r1], #-168	; 0xffffff58

0000007d <__UNIQUE_ID_alias14>:
  7d:	61696c61 	cmnvs	r9, r1, ror #24
  81:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  85:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  89:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  8d:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  91:	2d713678 	ldclcs	6, cr3, [r1, #-480]!	; 0xfffffe20
  95:	00757069 	rsbseq	r7, r5, r9, rrx

00000099 <__UNIQUE_ID_alias13>:
  99:	61696c61 	cmnvs	r9, r1, ror #24
  9d:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  a1:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  a5:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  a9:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  ad:	2d333578 	cfldr32cs	mvfx3, [r3, #-480]!	; 0xfffffe20
  b1:	43757069 	cmnmi	r5, #105	; 0x69
  b5:	6c61002a 	stclvs	0, cr0, [r1], #-168	; 0xffffff58

000000b7 <__UNIQUE_ID_alias12>:
  b7:	61696c61 	cmnvs	r9, r1, ror #24
  bb:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  bf:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  c3:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  c7:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  cb:	2d333578 	cfldr32cs	mvfx3, [r3, #-480]!	; 0xfffffe20
  cf:	00757069 	rsbseq	r7, r5, r9, rrx

000000d3 <__UNIQUE_ID_alias11>:
  d3:	61696c61 	cmnvs	r9, r1, ror #24
  d7:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  db:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  df:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
  e3:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
  e7:	2d313578 	cfldr32cs	mvfx3, [r1, #-480]!	; 0xfffffe20
  eb:	43757069 	cmnmi	r5, #105	; 0x69
  ef:	6c61002a 	stclvs	0, cr0, [r1], #-168	; 0xffffff58

000000f1 <__UNIQUE_ID_alias10>:
  f1:	61696c61 	cmnvs	r9, r1, ror #24
  f5:	666f3d73 			; <UNDEFINED> instruction: 0x666f3d73
  f9:	542a4e3a 	strtpl	r4, [sl], #-3642	; 0xfffff1c6
  fd:	7366432a 	cmnvc	r6, #-1476395008	; 0xa8000000
 101:	6d692c6c 	stclvs	12, cr2, [r9, #-432]!	; 0xfffffe50
 105:	2d313578 	cfldr32cs	mvfx3, [r1, #-480]!	; 0xfffffe20
 109:	00757069 	rsbseq	r7, r5, r9, rrx
 10d:	64000000 	strvs	r0, [r0], #-0

00000110 <__module_depends>:
 110:	65706564 	ldrbvs	r6, [r0, #-1380]!	; 0xfffffa9c
 114:	3d73646e 	cfldrdcc	mvd6, [r3, #-440]!	; 0xfffffe48
	...

00000119 <__UNIQUE_ID_name9>:
 119:	656d616e 	strbvs	r6, [sp, #-366]!	; 0xfffffe92
 11d:	7570693d 	ldrbvc	r6, [r0, #-2365]!	; 0xfffff6c3
 121:	735f3376 	cmpvc	pc, #-671088639	; 0xd8000001
 125:	65760077 	ldrbvs	r0, [r6, #-119]!	; 0xffffff89

00000127 <__UNIQUE_ID_vermagic8>:
 127:	6d726576 	cfldr64vs	mvdx6, [r2, #-472]!	; 0xfffffe28
 12b:	63696761 	cmnvs	r9, #25427968	; 0x1840000
 12f:	312e343d 			; <UNDEFINED> instruction: 0x312e343d
 133:	38392e34 	ldmdacc	r9!, {r2, r4, r5, r9, sl, fp, sp}
 137:	3734672d 	ldrcc	r6, [r4, -sp, lsr #14]!
 13b:	33393538 	teqcc	r9, #56, 10	; 0xe000000
 13f:	20343364 	eorscs	r3, r4, r4, ror #6
 143:	20504d53 	subscs	r4, r0, r3, asr sp
 147:	65657270 	strbvs	r7, [r5, #-624]!	; 0xfffffd90
 14b:	2074706d 	rsbscs	r7, r4, sp, rrx
 14f:	5f646f6d 	svcpl	0x00646f6d
 153:	6f6c6e75 	svcvs	0x006c6e75
 157:	6d206461 	cfstrsvs	mvf6, [r0, #-388]!	; 0xfffffe7c
 15b:	6576646f 	ldrbvs	r6, [r6, #-1135]!	; 0xfffffb91
 15f:	6f697372 	svcvs	0x00697372
 163:	4120736e 			; <UNDEFINED> instruction: 0x4120736e
 167:	37764d52 			; <UNDEFINED> instruction: 0x37764d52
 16b:	76327020 	ldrtvc	r7, [r2], -r0, lsr #32
 16f:	Address 0x000000000000016f is out of bounds.


Disassembly of section __versions:

00000000 <____versions>:
   0:	833850da 	teqhi	r8, #218	; 0xda
   4:	75646f6d 	strbvc	r6, [r4, #-3949]!	; 0xfffff093
   8:	6c5f656c 	cfldr64vs	mvdx6, [pc], {108}	; 0x6c
   c:	756f7961 	strbvc	r7, [pc, #-2401]!	; fffff6b3 <__crc_ipu_init_async_panel+0x3529382>
  10:	00000074 	andeq	r0, r0, r4, ror r0
	...
  40:	b077e70a 	rsbslt	lr, r7, sl, lsl #14
  44:	5f6b6c63 	svcpl	0x006b6c63
  48:	72706e75 	rsbsvc	r6, r0, #1872	; 0x750
  4c:	72617065 	rsbvc	r7, r1, #101	; 0x65
  50:	00000065 	andeq	r0, r0, r5, rrx
	...
  80:	f9a482f9 			; <UNDEFINED> instruction: 0xf9a482f9
  84:	656c736d 	strbvs	r7, [ip, #-877]!	; 0xfffffc93
  88:	00007065 	andeq	r7, r0, r5, rrx
	...
  c0:	815588a6 	cmphi	r5, r6, lsr #17
  c4:	5f6b6c63 	svcpl	0x006b6c63
  c8:	62616e65 	rsbvs	r6, r1, #1616	; 0x650
  cc:	0000656c 	andeq	r6, r0, ip, ror #10
	...
 100:	5fc56a46 	svcpl	0x00c56a46
 104:	7761725f 			; <UNDEFINED> instruction: 0x7761725f
 108:	6970735f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 10c:	6e755f6e 	cdpvs	15, 7, cr5, cr5, cr14, {3}
 110:	6b636f6c 	blvs	18dbec8 <__crc_ipu_ch_param_bad_alpha_pos+0x10eeb49>
	...
 140:	97255bdf 			; <UNDEFINED> instruction: 0x97255bdf
 144:	6c727473 	cfldrdvs	mvd7, [r2], #-460	; 0xfffffe34
 148:	00006e65 	andeq	r6, r0, r5, ror #28
	...
 180:	63facba0 	mvnsvs	ip, #160, 22	; 0x28000
 184:	6d705f5f 	ldclvs	15, cr5, [r0, #-380]!	; 0xfffffe84
 188:	6e75725f 	mrcvs	2, 3, r7, cr5, cr15, {2}
 18c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 190:	7375735f 	cmnvc	r5, #2080374785	; 0x7c000001
 194:	646e6570 	strbtvs	r6, [lr], #-1392	; 0xfffffa90
	...
 1c0:	b6e6d99d 	usatlt	sp, #6, sp, lsl #19
 1c4:	5f6b6c63 	svcpl	0x006b6c63
 1c8:	61736964 	cmnvs	r3, r4, ror #18
 1cc:	00656c62 	rsbeq	r6, r5, r2, ror #24
	...
 200:	8c5d225c 	lfmhi	f2, 2, [sp], {92}	; 0x5c
 204:	5f6b6c63 	svcpl	0x006b6c63
 208:	69676572 	stmdbvs	r7!, {r1, r4, r5, r6, r8, sl, sp, lr}^
 20c:	72657473 	rsbvc	r7, r5, #1929379840	; 0x73000000
	...
 240:	f7802486 			; <UNDEFINED> instruction: 0xf7802486
 244:	65615f5f 	strbvs	r5, [r1, #-3935]!	; 0xfffff0a1
 248:	5f696261 	svcpl	0x00696261
 24c:	69646975 	stmdbvs	r4!, {r0, r2, r4, r5, r6, r8, fp, sp, lr}^
 250:	646f6d76 	strbtvs	r6, [pc], #-3446	; 258 <____versions+0x258>
	...
 280:	44b1d426 	ldrtmi	sp, [r1], #1062	; 0x426
 284:	79645f5f 	stmdbvc	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 288:	696d616e 	stmdbvs	sp!, {r1, r2, r3, r5, r6, r8, sp, lr}^
 28c:	72705f63 	rsbsvc	r5, r0, #396	; 0x18c
 290:	6265645f 	rsbvs	r6, r5, #1593835520	; 0x5f000000
 294:	00006775 	andeq	r6, r0, r5, ror r7
	...
 2c0:	e4ca3b4f 	strb	r3, [sl], #2895	; 0xb4f
 2c4:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0xfffffa93
 2c8:	6e755f78 	mrcvs	15, 3, r5, cr5, cr8, {3}
 2cc:	6b636f6c 	blvs	18dc084 <__crc_ipu_ch_param_bad_alpha_pos+0x10eed05>
	...
 300:	9c9b02d0 	lfmls	f0, 4, [fp], {208}	; 0xd0
 304:	6d705f5f 	ldclvs	15, cr5, [r0, #-380]!	; 0xfffffe84
 308:	6e75725f 	mrcvs	2, 3, r7, cr5, cr15, {2}
 30c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
 310:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
 314:	00656d75 	rsbeq	r6, r5, r5, ror sp
	...
 340:	556e4390 	strbpl	r4, [lr, #-912]!	; 0xfffffc70
 344:	5f6b6c63 	svcpl	0x006b6c63
 348:	5f746567 	svcpl	0x00746567
 34c:	65746172 	ldrbvs	r6, [r4, #-370]!	; 0xfffffe8e
	...
 380:	e707d823 	str	sp, [r7, -r3, lsr #16]
 384:	65615f5f 	strbvs	r5, [r1, #-3935]!	; 0xfffff0a1
 388:	5f696261 	svcpl	0x00696261
 38c:	69646975 	stmdbvs	r4!, {r0, r2, r4, r5, r6, r8, fp, sp, lr}^
 390:	00000076 	andeq	r0, r0, r6, ror r0
	...
 3c0:	0fa2a45e 	svceq	0x00a2a45e
 3c4:	656d5f5f 	strbvs	r5, [sp, #-3935]!	; 0xfffff0a1
 3c8:	72657a6d 	rsbvc	r7, r5, #446464	; 0x6d000
 3cc:	0000006f 	andeq	r0, r0, pc, rrx
	...
 400:	3a4760a1 	bcc	11d868c <__crc_ipu_ch_param_bad_alpha_pos+0x9eb30d>
 404:	5f766564 	svcpl	0x00766564
 408:	00727265 	rsbseq	r7, r2, r5, ror #4
	...
 440:	51d559d1 	ldrsbpl	r5, [r5, #145]	; 0x91
 444:	7761725f 			; <UNDEFINED> instruction: 0x7761725f
 448:	6970735f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 44c:	6e755f6e 	cdpvs	15, 7, cr5, cr5, cr14, {3}
 450:	6b636f6c 	blvs	18dc208 <__crc_ipu_ch_param_bad_alpha_pos+0x10eee89>
 454:	7172695f 	cmnvc	r2, pc, asr r9
 458:	74736572 	ldrbtvc	r6, [r3], #-1394	; 0xfffffa8e
 45c:	0065726f 	rsbeq	r7, r5, pc, ror #4
	...
 480:	2aee63f4 	bcs	ffb99458 <__crc_ipu_init_async_panel+0x30c3127>
 484:	756d5f5f 	strbvc	r5, [sp, #-3935]!	; 0xfffff0a1
 488:	5f786574 	svcpl	0x00786574
 48c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
	...
 4c0:	27e1a049 	strbcs	sl, [r1, r9, asr #32]!
 4c4:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 4c8:	00006b74 	andeq	r6, r0, r4, ror fp
	...
 500:	16305289 	ldrtne	r5, [r0], -r9, lsl #5
 504:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
 508:	6f6c735f 	svcvs	0x006c735f
 50c:	74617077 	strbtvc	r7, [r1], #-119	; 0xffffff89
 510:	756e5f68 	strbvc	r5, [lr, #-3944]!	; 0xfffff098
 514:	00006c6c 	andeq	r6, r0, ip, ror #24
	...
 540:	fd16e532 	ldc2	5, cr14, [r6, #-200]	; 0xffffff38
 544:	6574756d 	ldrbvs	r7, [r4, #-1389]!	; 0xfffffa93
 548:	6f6c5f78 	svcvs	0x006c5f78
 54c:	00006b63 	andeq	r6, r0, r3, ror #22
	...
 580:	8e865d3c 	mcrhi	13, 4, r5, cr6, cr12, {1}
 584:	5f6d7261 	svcpl	0x006d7261
 588:	616c6564 	cmnvs	ip, r4, ror #10
 58c:	706f5f79 	rsbvc	r5, pc, r9, ror pc	; <UNPREDICTABLE>
 590:	00000073 	andeq	r0, r0, r3, ror r0
	...
 5c0:	59e5070d 	stmibpl	r5!, {r0, r2, r3, r8, r9, sl}^
 5c4:	6f645f5f 	svcvs	0x00645f5f
 5c8:	7669645f 			; <UNDEFINED> instruction: 0x7669645f
 5cc:	00003436 	andeq	r3, r0, r6, lsr r4
	...
 600:	ab6757a1 	blge	19d648c <__crc_ipu_ch_param_bad_alpha_pos+0x11e910d>
 604:	5f72646c 	svcpl	0x0072646c
 608:	5f716966 	svcpl	0x00716966
 60c:	6c6c6163 	stfvse	f6, [ip], #-396	; 0xfffffe74
 610:	6b636162 	blvs	18d8ba0 <__crc_ipu_ch_param_bad_alpha_pos+0x10eb821>
	...
 640:	6b2dc060 	blvs	b707c8 <__crc_ipu_ch_param_bad_alpha_pos+0x383449>
 644:	706d7564 	rsbvc	r7, sp, r4, ror #10
 648:	6174735f 	cmnvs	r4, pc, asr r3
 64c:	00006b63 	andeq	r6, r0, r3, ror #22
	...
 680:	7c9a7371 	ldcvc	3, cr7, [sl], {113}	; 0x71
 684:	5f6b6c63 	svcpl	0x006b6c63
 688:	70657270 	rsbvc	r7, r5, r0, ror r2
 68c:	00657261 	rsbeq	r7, r5, r1, ror #4
	...
 6c0:	9c0bd51f 	cfstr32ls	mvfx13, [fp], {31}
 6c4:	7761725f 			; <UNDEFINED> instruction: 0x7761725f
 6c8:	6970735f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 6cc:	6f6c5f6e 	svcvs	0x006c5f6e
 6d0:	00006b63 	andeq	r6, r0, r3, ror #22
	...
 700:	13bec41d 			; <UNDEFINED> instruction: 0x13bec41d
 704:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0xfffffa8e
 708:	5f657361 	svcpl	0x00657361
 70c:	5f737562 	svcpl	0x00737562
 710:	71657266 	cmnvc	r5, r6, ror #4
	...
 740:	b3766836 	cmnlt	r6, #3538944	; 0x360000
 744:	79645f5f 	stmdbvc	r4!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 748:	696d616e 	stmdbvs	sp!, {r1, r2, r3, r5, r6, r8, sp, lr}^
 74c:	65645f63 	strbvs	r5, [r4, #-3939]!	; 0xfffff09d
 750:	62645f76 	rsbvs	r5, r4, #472	; 0x1d8
 754:	00000067 	andeq	r0, r0, r7, rrx
	...
 780:	598542b2 	stmibpl	r5, {r1, r4, r5, r7, r9, lr}
 784:	7761725f 			; <UNDEFINED> instruction: 0x7761725f
 788:	6970735f 	ldmdbvs	r0!, {r0, r1, r2, r3, r4, r6, r8, r9, ip, sp, lr}^
 78c:	6f6c5f6e 	svcvs	0x006c5f6e
 790:	695f6b63 	ldmdbvs	pc, {r0, r1, r5, r6, r8, r9, fp, sp, lr}^	; <UNPREDICTABLE>
 794:	61737172 	cmnvs	r3, r2, ror r1
 798:	00006576 	andeq	r6, r0, r6, ror r5
	...
 7c0:	822137e2 	eorhi	r3, r1, #59244544	; 0x3880000
 7c4:	5f6d7261 	svcpl	0x006d7261
 7c8:	76616568 	strbtvc	r6, [r1], -r8, ror #10
 7cc:	626d5f79 	rsbvs	r5, sp, #484	; 0x1e4
	...
 800:	037a0cba 	cmneq	sl, #47616	; 0xba00
 804:	6572666b 	ldrbvs	r6, [r2, #-1643]!	; 0xfffff995
 808:	00000065 	andeq	r0, r0, r5, rrx
	...
 840:	9d669763 	stclls	7, cr9, [r6, #-396]!	; 0xfffffe74
 844:	636d656d 	cmnvs	sp, #457179136	; 0x1b400000
 848:	00007970 	andeq	r7, r0, r0, ror r9
	...
 880:	3f59d6dd 	svccc	0x0059d6dd
 884:	75716572 	ldrbvc	r6, [r1, #-1394]!	; 0xfffffa8e
 888:	5f747365 	svcpl	0x00747365
 88c:	5f737562 	svcpl	0x00737562
 890:	71657266 	cmnvc	r5, r6, ror #4
	...
 8c0:	c1d38a3d 	bicsgt	r8, r3, sp, lsr sl
 8c4:	5f766564 	svcpl	0x00766564
 8c8:	6e726177 	mrcvs	1, 3, r6, cr2, cr7, {3}
	...
 900:	efd6cf06 	svc	0x00d6cf06
 904:	65615f5f 	strbvs	r5, [r1, #-3935]!	; 0xfffff0a1
 908:	5f696261 	svcpl	0x00696261
 90c:	69776e75 	ldmdbvs	r7!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 910:	635f646e 	cmpvs	pc, #1845493760	; 0x6e000000
 914:	705f7070 	subsvc	r7, pc, r0, ror r0	; <UNPREDICTABLE>
 918:	00003072 	andeq	r3, r0, r2, ror r0
	...

Disassembly of section .bss:

00000000 <dum>:
       0:	00000000 	andeq	r0, r0, r0

00000004 <ipu_dum>:
	...

00001ee8 <ipu_array>:
	...

00005cb0 <dmfc_type_setup>:
    5cb0:	00000000 	andeq	r0, r0, r0

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
  6c:	0000302e 	andeq	r3, r0, lr, lsr #32
  70:	3a434347 	bcc	10d0d94 <__crc_ipu_ch_param_bad_alpha_pos+0x8e3a15>
  74:	694c2820 	stmdbvs	ip, {r5, fp, sp}^
  78:	6f72616e 	svcvs	0x0072616e
  7c:	43434720 	movtmi	r4, #14112	; 0x3720
  80:	352e3720 	strcc	r3, [lr, #-1824]!	; 0xfffff8e0
  84:	3130322d 	teqcc	r0, sp, lsr #4
  88:	32312e39 	eorscc	r2, r1, #912	; 0x390
  8c:	2e372029 	cdpcs	0, 3, cr2, cr7, cr9, {1}
  90:	00302e35 	eorseq	r2, r0, r5, lsr lr
  94:	43434700 	movtmi	r4, #14080	; 0x3700
  98:	4c28203a 	stcmi	0, cr2, [r8], #-232	; 0xffffff18
  9c:	72616e69 	rsbvc	r6, r1, #1680	; 0x690
  a0:	4347206f 	movtmi	r2, #28783	; 0x706f
  a4:	2e372043 	cdpcs	0, 3, cr2, cr7, cr3, {2}
  a8:	30322d35 	eorscc	r2, r2, r5, lsr sp
  ac:	312e3931 			; <UNDEFINED> instruction: 0x312e3931
  b0:	37202932 			; <UNDEFINED> instruction: 0x37202932
  b4:	302e352e 	eorcc	r3, lr, lr, lsr #10
  b8:	43470000 	movtmi	r0, #28672	; 0x7000
  bc:	28203a43 	stmdacs	r0!, {r0, r1, r6, r9, fp, ip, sp}
  c0:	616e694c 	cmnvs	lr, ip, asr #18
  c4:	47206f72 			; <UNDEFINED> instruction: 0x47206f72
  c8:	37204343 	strcc	r4, [r0, -r3, asr #6]!
  cc:	322d352e 	eorcc	r3, sp, #192937984	; 0xb800000
  d0:	2e393130 	mrccs	1, 1, r3, cr9, cr0, {1}
  d4:	20293231 	eorcs	r3, r9, r1, lsr r2
  d8:	2e352e37 	mrccs	14, 1, r2, cr5, cr7, {1}
  dc:	47000030 	smladxmi	r0, r0, r0, r0
  e0:	203a4343 	eorscs	r4, sl, r3, asr #6
  e4:	6e694c28 	cdpvs	12, 6, cr4, cr9, cr8, {1}
  e8:	206f7261 	rsbcs	r7, pc, r1, ror #4
  ec:	20434347 	subcs	r4, r3, r7, asr #6
  f0:	2d352e37 	ldccs	14, cr2, [r5, #-220]!	; 0xffffff24
  f4:	39313032 	ldmdbcc	r1!, {r1, r4, r5, ip, sp}
  f8:	2932312e 	ldmdbcs	r2!, {r1, r2, r3, r5, r8, ip, sp}
  fc:	352e3720 	strcc	r3, [lr, #-1824]!	; 0xfffff8e0
 100:	0000302e 	andeq	r3, r0, lr, lsr #32
 104:	3a434347 	bcc	10d0e28 <__crc_ipu_ch_param_bad_alpha_pos+0x8e3aa9>
 108:	694c2820 	stmdbvs	ip, {r5, fp, sp}^
 10c:	6f72616e 	svcvs	0x0072616e
 110:	43434720 	movtmi	r4, #14112	; 0x3720
 114:	352e3720 	strcc	r3, [lr, #-1824]!	; 0xfffff8e0
 118:	3130322d 	teqcc	r0, sp, lsr #4
 11c:	32312e39 	eorscc	r2, r1, #912	; 0x390
 120:	2e372029 	cdpcs	0, 3, cr2, cr7, cr9, {1}
 124:	00302e35 	eorseq	r2, r0, r5, lsr lr

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
  28:	1a011901 	bne	46434 <dispatch+0x3a024>
  2c:	22021e02 	andcs	r1, r2, #2, 28
  30:	Address 0x0000000000000030 is out of bounds.


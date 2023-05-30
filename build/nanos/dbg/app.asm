
build/nanos/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0d00000 <main>:
c0d00000:	b5b0      	push	{r4, r5, r7, lr}
c0d00002:	b08c      	sub	sp, #48	; 0x30
c0d00004:	b662      	cpsie	i
c0d00006:	f002 fe21 	bl	c0d02c4c <os_boot>
c0d0000a:	4c22      	ldr	r4, [pc, #136]	; (c0d00094 <main+0x94>)
c0d0000c:	2021      	movs	r0, #33	; 0x21
c0d0000e:	00c1      	lsls	r1, r0, #3
c0d00010:	4620      	mov	r0, r4
c0d00012:	f007 fb1d 	bl	c0d07650 <__aeabi_memclr>
c0d00016:	466d      	mov	r5, sp
c0d00018:	4628      	mov	r0, r5
c0d0001a:	f007 fc53 	bl	c0d078c4 <setjmp>
c0d0001e:	85a8      	strh	r0, [r5, #44]	; 0x2c
c0d00020:	b280      	uxth	r0, r0
c0d00022:	2805      	cmp	r0, #5
c0d00024:	d01c      	beq.n	c0d00060 <main+0x60>
c0d00026:	2800      	cmp	r0, #0
c0d00028:	d124      	bne.n	c0d00074 <main+0x74>
c0d0002a:	466d      	mov	r5, sp
c0d0002c:	4628      	mov	r0, r5
c0d0002e:	f005 fa6f 	bl	c0d05510 <try_context_set>
c0d00032:	900a      	str	r0, [sp, #40]	; 0x28
c0d00034:	f002 ff24 	bl	c0d02e80 <io_seproxyhal_init>
c0d00038:	2000      	movs	r0, #0
c0d0003a:	f006 fee3 	bl	c0d06e04 <USB_power>
c0d0003e:	2001      	movs	r0, #1
c0d00040:	f006 fee0 	bl	c0d06e04 <USB_power>
c0d00044:	f000 f83a 	bl	c0d000bc <app_main>
c0d00048:	f005 fa58 	bl	c0d054fc <try_context_get>
c0d0004c:	42a8      	cmp	r0, r5
c0d0004e:	d102      	bne.n	c0d00056 <main+0x56>
c0d00050:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d00052:	f005 fa5d 	bl	c0d05510 <try_context_set>
c0d00056:	4668      	mov	r0, sp
c0d00058:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d0005a:	2800      	cmp	r0, #0
c0d0005c:	d0d6      	beq.n	c0d0000c <main+0xc>
c0d0005e:	e017      	b.n	c0d00090 <main+0x90>
c0d00060:	4668      	mov	r0, sp
c0d00062:	2100      	movs	r1, #0
c0d00064:	8581      	strh	r1, [r0, #44]	; 0x2c
c0d00066:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d00068:	f005 fa52 	bl	c0d05510 <try_context_set>
c0d0006c:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d0006e:	f005 fa4f 	bl	c0d05510 <try_context_set>
c0d00072:	e7cb      	b.n	c0d0000c <main+0xc>
c0d00074:	4668      	mov	r0, sp
c0d00076:	2400      	movs	r4, #0
c0d00078:	8584      	strh	r4, [r0, #44]	; 0x2c
c0d0007a:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d0007c:	f005 fa48 	bl	c0d05510 <try_context_set>
c0d00080:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d00082:	f005 fa45 	bl	c0d05510 <try_context_set>
c0d00086:	f002 fdbe 	bl	c0d02c06 <app_exit>
c0d0008a:	4620      	mov	r0, r4
c0d0008c:	b00c      	add	sp, #48	; 0x30
c0d0008e:	bdb0      	pop	{r4, r5, r7, pc}
c0d00090:	f002 fde1 	bl	c0d02c56 <os_longjmp>
c0d00094:	20000288 	.word	0x20000288

c0d00098 <ui_idle>:
c0d00098:	b510      	push	{r4, lr}
c0d0009a:	2400      	movs	r4, #0
c0d0009c:	43e0      	mvns	r0, r4
c0d0009e:	4905      	ldr	r1, [pc, #20]	; (c0d000b4 <ui_idle+0x1c>)
c0d000a0:	6008      	str	r0, [r1, #0]
c0d000a2:	f002 f9ad 	bl	c0d02400 <nanos_clear_timer>
c0d000a6:	4904      	ldr	r1, [pc, #16]	; (c0d000b8 <ui_idle+0x20>)
c0d000a8:	4479      	add	r1, pc
c0d000aa:	4620      	mov	r0, r4
c0d000ac:	4622      	mov	r2, r4
c0d000ae:	f007 f8af 	bl	c0d07210 <ux_menu_display>
c0d000b2:	bd10      	pop	{r4, pc}
c0d000b4:	200009ac 	.word	0x200009ac
c0d000b8:	00008364 	.word	0x00008364

c0d000bc <app_main>:
c0d000bc:	b094      	sub	sp, #80	; 0x50
c0d000be:	2500      	movs	r5, #0
c0d000c0:	9513      	str	r5, [sp, #76]	; 0x4c
c0d000c2:	9512      	str	r5, [sp, #72]	; 0x48
c0d000c4:	a811      	add	r0, sp, #68	; 0x44
c0d000c6:	7005      	strb	r5, [r0, #0]
c0d000c8:	43e8      	mvns	r0, r5
c0d000ca:	9004      	str	r0, [sp, #16]
c0d000cc:	4862      	ldr	r0, [pc, #392]	; (c0d00258 <app_main+0x19c>)
c0d000ce:	4478      	add	r0, pc
c0d000d0:	9003      	str	r0, [sp, #12]
c0d000d2:	4c5d      	ldr	r4, [pc, #372]	; (c0d00248 <app_main+0x18c>)
c0d000d4:	4e59      	ldr	r6, [pc, #356]	; (c0d0023c <app_main+0x180>)
c0d000d6:	9502      	str	r5, [sp, #8]
c0d000d8:	af05      	add	r7, sp, #20
c0d000da:	4638      	mov	r0, r7
c0d000dc:	f007 fbf2 	bl	c0d078c4 <setjmp>
c0d000e0:	85b8      	strh	r0, [r7, #44]	; 0x2c
c0d000e2:	b287      	uxth	r7, r0
c0d000e4:	2f00      	cmp	r7, #0
c0d000e6:	d01a      	beq.n	c0d0011e <app_main+0x62>
c0d000e8:	2047      	movs	r0, #71	; 0x47
c0d000ea:	0200      	lsls	r0, r0, #8
c0d000ec:	4287      	cmp	r7, r0
c0d000ee:	d023      	beq.n	c0d00138 <app_main+0x7c>
c0d000f0:	2f05      	cmp	r7, #5
c0d000f2:	d100      	bne.n	c0d000f6 <app_main+0x3a>
c0d000f4:	e089      	b.n	c0d0020a <app_main+0x14e>
c0d000f6:	a805      	add	r0, sp, #20
c0d000f8:	8585      	strh	r5, [r0, #44]	; 0x2c
c0d000fa:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d000fc:	f005 fa08 	bl	c0d05510 <try_context_set>
c0d00100:	4854      	ldr	r0, [pc, #336]	; (c0d00254 <app_main+0x198>)
c0d00102:	1838      	adds	r0, r7, r0
c0d00104:	2812      	cmp	r0, #18
c0d00106:	d81c      	bhi.n	c0d00142 <app_main+0x86>
c0d00108:	2100      	movs	r1, #0
c0d0010a:	4638      	mov	r0, r7
c0d0010c:	460a      	mov	r2, r1
c0d0010e:	f002 f9b3 	bl	c0d02478 <io_send_buf>
c0d00112:	a811      	add	r0, sp, #68	; 0x44
c0d00114:	2110      	movs	r1, #16
c0d00116:	7001      	strb	r1, [r0, #0]
c0d00118:	f7ff ffbe 	bl	c0d00098 <ui_idle>
c0d0011c:	e063      	b.n	c0d001e6 <app_main+0x12a>
c0d0011e:	a805      	add	r0, sp, #20
c0d00120:	f005 f9f6 	bl	c0d05510 <try_context_set>
c0d00124:	9912      	ldr	r1, [sp, #72]	; 0x48
c0d00126:	9113      	str	r1, [sp, #76]	; 0x4c
c0d00128:	9512      	str	r5, [sp, #72]	; 0x48
c0d0012a:	900f      	str	r0, [sp, #60]	; 0x3c
c0d0012c:	9813      	ldr	r0, [sp, #76]	; 0x4c
c0d0012e:	0880      	lsrs	r0, r0, #2
c0d00130:	2841      	cmp	r0, #65	; 0x41
c0d00132:	d30b      	bcc.n	c0d0014c <app_main+0x90>
c0d00134:	4628      	mov	r0, r5
c0d00136:	e00a      	b.n	c0d0014e <app_main+0x92>
c0d00138:	a805      	add	r0, sp, #20
c0d0013a:	8585      	strh	r5, [r0, #44]	; 0x2c
c0d0013c:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d0013e:	f005 f9e7 	bl	c0d05510 <try_context_set>
c0d00142:	9804      	ldr	r0, [sp, #16]
c0d00144:	6030      	str	r0, [r6, #0]
c0d00146:	f002 ff87 	bl	c0d03058 <io_seproxyhal_se_reset>
c0d0014a:	e04c      	b.n	c0d001e6 <app_main+0x12a>
c0d0014c:	2001      	movs	r0, #1
c0d0014e:	9903      	ldr	r1, [sp, #12]
c0d00150:	f000 f886 	bl	c0d00260 <assert>
c0d00154:	ae11      	add	r6, sp, #68	; 0x44
c0d00156:	7830      	ldrb	r0, [r6, #0]
c0d00158:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d0015a:	b289      	uxth	r1, r1
c0d0015c:	f002 ffa6 	bl	c0d030ac <io_exchange>
c0d00160:	9013      	str	r0, [sp, #76]	; 0x4c
c0d00162:	7035      	strb	r5, [r6, #0]
c0d00164:	4e36      	ldr	r6, [pc, #216]	; (c0d00240 <app_main+0x184>)
c0d00166:	7831      	ldrb	r1, [r6, #0]
c0d00168:	392a      	subs	r1, #42	; 0x2a
c0d0016a:	4248      	negs	r0, r1
c0d0016c:	4148      	adcs	r0, r1
c0d0016e:	493b      	ldr	r1, [pc, #236]	; (c0d0025c <app_main+0x1a0>)
c0d00170:	4479      	add	r1, pc
c0d00172:	f000 f875 	bl	c0d00260 <assert>
c0d00176:	2031      	movs	r0, #49	; 0x31
c0d00178:	7030      	strb	r0, [r6, #0]
c0d0017a:	9813      	ldr	r0, [sp, #76]	; 0x4c
c0d0017c:	2800      	cmp	r0, #0
c0d0017e:	d049      	beq.n	c0d00214 <app_main+0x158>
c0d00180:	f002 fcb2 	bl	c0d02ae8 <device_is_unlocked>
c0d00184:	2800      	cmp	r0, #0
c0d00186:	d048      	beq.n	c0d0021a <app_main+0x15e>
c0d00188:	9813      	ldr	r0, [sp, #76]	; 0x4c
c0d0018a:	2804      	cmp	r0, #4
c0d0018c:	d93a      	bls.n	c0d00204 <app_main+0x148>
c0d0018e:	7920      	ldrb	r0, [r4, #4]
c0d00190:	1d40      	adds	r0, r0, #5
c0d00192:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d00194:	4281      	cmp	r1, r0
c0d00196:	d135      	bne.n	c0d00204 <app_main+0x148>
c0d00198:	7820      	ldrb	r0, [r4, #0]
c0d0019a:	28d7      	cmp	r0, #215	; 0xd7
c0d0019c:	d141      	bne.n	c0d00222 <app_main+0x166>
c0d0019e:	7860      	ldrb	r0, [r4, #1]
c0d001a0:	f002 f8c2 	bl	c0d02328 <lookupHandler>
c0d001a4:	2800      	cmp	r0, #0
c0d001a6:	d040      	beq.n	c0d0022a <app_main+0x16e>
c0d001a8:	4607      	mov	r7, r0
c0d001aa:	4625      	mov	r5, r4
c0d001ac:	4c23      	ldr	r4, [pc, #140]	; (c0d0023c <app_main+0x180>)
c0d001ae:	6820      	ldr	r0, [r4, #0]
c0d001b0:	1c46      	adds	r6, r0, #1
c0d001b2:	d004      	beq.n	c0d001be <app_main+0x102>
c0d001b4:	462c      	mov	r4, r5
c0d001b6:	7869      	ldrb	r1, [r5, #1]
c0d001b8:	4288      	cmp	r0, r1
c0d001ba:	d007      	beq.n	c0d001cc <app_main+0x110>
c0d001bc:	e039      	b.n	c0d00232 <app_main+0x176>
c0d001be:	4823      	ldr	r0, [pc, #140]	; (c0d0024c <app_main+0x190>)
c0d001c0:	4923      	ldr	r1, [pc, #140]	; (c0d00250 <app_main+0x194>)
c0d001c2:	f007 fa5b 	bl	c0d0767c <explicit_bzero>
c0d001c6:	7868      	ldrb	r0, [r5, #1]
c0d001c8:	6020      	str	r0, [r4, #0]
c0d001ca:	462c      	mov	r4, r5
c0d001cc:	4272      	negs	r2, r6
c0d001ce:	4172      	adcs	r2, r6
c0d001d0:	7923      	ldrb	r3, [r4, #4]
c0d001d2:	78e1      	ldrb	r1, [r4, #3]
c0d001d4:	78a0      	ldrb	r0, [r4, #2]
c0d001d6:	9200      	str	r2, [sp, #0]
c0d001d8:	1d62      	adds	r2, r4, #5
c0d001da:	47b8      	blx	r7
c0d001dc:	a811      	add	r0, sp, #68	; 0x44
c0d001de:	2110      	movs	r1, #16
c0d001e0:	7001      	strb	r1, [r0, #0]
c0d001e2:	4e16      	ldr	r6, [pc, #88]	; (c0d0023c <app_main+0x180>)
c0d001e4:	9d02      	ldr	r5, [sp, #8]
c0d001e6:	f005 f989 	bl	c0d054fc <try_context_get>
c0d001ea:	a905      	add	r1, sp, #20
c0d001ec:	4288      	cmp	r0, r1
c0d001ee:	d102      	bne.n	c0d001f6 <app_main+0x13a>
c0d001f0:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d001f2:	f005 f98d 	bl	c0d05510 <try_context_set>
c0d001f6:	a805      	add	r0, sp, #20
c0d001f8:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d001fa:	2800      	cmp	r0, #0
c0d001fc:	d100      	bne.n	c0d00200 <app_main+0x144>
c0d001fe:	e76b      	b.n	c0d000d8 <app_main+0x1c>
c0d00200:	f002 fd29 	bl	c0d02c56 <os_longjmp>
c0d00204:	480f      	ldr	r0, [pc, #60]	; (c0d00244 <app_main+0x188>)
c0d00206:	f002 fd26 	bl	c0d02c56 <os_longjmp>
c0d0020a:	a805      	add	r0, sp, #20
c0d0020c:	8585      	strh	r5, [r0, #44]	; 0x2c
c0d0020e:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d00210:	f005 f97e 	bl	c0d05510 <try_context_set>
c0d00214:	2005      	movs	r0, #5
c0d00216:	f002 fd1e 	bl	c0d02c56 <os_longjmp>
c0d0021a:	480a      	ldr	r0, [pc, #40]	; (c0d00244 <app_main+0x188>)
c0d0021c:	3010      	adds	r0, #16
c0d0021e:	f002 fd1a 	bl	c0d02c56 <os_longjmp>
c0d00222:	4808      	ldr	r0, [pc, #32]	; (c0d00244 <app_main+0x188>)
c0d00224:	1c40      	adds	r0, r0, #1
c0d00226:	f002 fd16 	bl	c0d02c56 <os_longjmp>
c0d0022a:	4806      	ldr	r0, [pc, #24]	; (c0d00244 <app_main+0x188>)
c0d0022c:	1c80      	adds	r0, r0, #2
c0d0022e:	f002 fd12 	bl	c0d02c56 <os_longjmp>
c0d00232:	4804      	ldr	r0, [pc, #16]	; (c0d00244 <app_main+0x188>)
c0d00234:	1cc0      	adds	r0, r0, #3
c0d00236:	f002 fd0e 	bl	c0d02c56 <os_longjmp>
c0d0023a:	46c0      	nop			; (mov r8, r8)
c0d0023c:	200009ac 	.word	0x200009ac
c0d00240:	20000284 	.word	0x20000284
c0d00244:	00006e01 	.word	0x00006e01
c0d00248:	20000398 	.word	0x20000398
c0d0024c:	20000518 	.word	0x20000518
c0d00250:	00000494 	.word	0x00000494
c0d00254:	ffff9200 	.word	0xffff9200
c0d00258:	000078b2 	.word	0x000078b2
c0d0025c:	00007822 	.word	0x00007822

c0d00260 <assert>:
c0d00260:	b580      	push	{r7, lr}
c0d00262:	2800      	cmp	r0, #0
c0d00264:	d000      	beq.n	c0d00268 <assert+0x8>
c0d00266:	bd80      	pop	{r7, pc}
c0d00268:	f002 fef6 	bl	c0d03058 <io_seproxyhal_se_reset>
c0d0026c:	bd80      	pop	{r7, pc}
	...

c0d00270 <bip44_parseFromWire>:
c0d00270:	b570      	push	{r4, r5, r6, lr}
c0d00272:	2a00      	cmp	r2, #0
c0d00274:	d01b      	beq.n	c0d002ae <bip44_parseFromWire+0x3e>
c0d00276:	780c      	ldrb	r4, [r1, #0]
c0d00278:	2c0b      	cmp	r4, #11
c0d0027a:	d218      	bcs.n	c0d002ae <bip44_parseFromWire+0x3e>
c0d0027c:	00a3      	lsls	r3, r4, #2
c0d0027e:	1c5d      	adds	r5, r3, #1
c0d00280:	4295      	cmp	r5, r2
c0d00282:	d814      	bhi.n	c0d002ae <bip44_parseFromWire+0x3e>
c0d00284:	6284      	str	r4, [r0, #40]	; 0x28
c0d00286:	1c4a      	adds	r2, r1, #1
c0d00288:	2100      	movs	r1, #0
c0d0028a:	428b      	cmp	r3, r1
c0d0028c:	d00d      	beq.n	c0d002aa <bip44_parseFromWire+0x3a>
c0d0028e:	5c54      	ldrb	r4, [r2, r1]
c0d00290:	1855      	adds	r5, r2, r1
c0d00292:	786e      	ldrb	r6, [r5, #1]
c0d00294:	0236      	lsls	r6, r6, #8
c0d00296:	1934      	adds	r4, r6, r4
c0d00298:	78ae      	ldrb	r6, [r5, #2]
c0d0029a:	78ed      	ldrb	r5, [r5, #3]
c0d0029c:	022d      	lsls	r5, r5, #8
c0d0029e:	19ad      	adds	r5, r5, r6
c0d002a0:	042d      	lsls	r5, r5, #16
c0d002a2:	192c      	adds	r4, r5, r4
c0d002a4:	5044      	str	r4, [r0, r1]
c0d002a6:	1d09      	adds	r1, r1, #4
c0d002a8:	e7ef      	b.n	c0d0028a <bip44_parseFromWire+0x1a>
c0d002aa:	1c48      	adds	r0, r1, #1
c0d002ac:	bd70      	pop	{r4, r5, r6, pc}
c0d002ae:	4801      	ldr	r0, [pc, #4]	; (c0d002b4 <bip44_parseFromWire+0x44>)
c0d002b0:	f002 fcd1 	bl	c0d02c56 <os_longjmp>
c0d002b4:	00006e07 	.word	0x00006e07

c0d002b8 <bip44_hasValidFIOPrefix>:
c0d002b8:	b5b0      	push	{r4, r5, r7, lr}
c0d002ba:	4601      	mov	r1, r0
c0d002bc:	6a82      	ldr	r2, [r0, #40]	; 0x28
c0d002be:	2000      	movs	r0, #0
c0d002c0:	2a02      	cmp	r2, #2
c0d002c2:	d312      	bcc.n	c0d002ea <bip44_hasValidFIOPrefix+0x32>
c0d002c4:	680c      	ldr	r4, [r1, #0]
c0d002c6:	2201      	movs	r2, #1
c0d002c8:	07d3      	lsls	r3, r2, #31
c0d002ca:	461d      	mov	r5, r3
c0d002cc:	352c      	adds	r5, #44	; 0x2c
c0d002ce:	42ac      	cmp	r4, r5
c0d002d0:	d10b      	bne.n	c0d002ea <bip44_hasValidFIOPrefix+0x32>
c0d002d2:	461c      	mov	r4, r3
c0d002d4:	34eb      	adds	r4, #235	; 0xeb
c0d002d6:	684d      	ldr	r5, [r1, #4]
c0d002d8:	42a5      	cmp	r5, r4
c0d002da:	d106      	bne.n	c0d002ea <bip44_hasValidFIOPrefix+0x32>
c0d002dc:	688c      	ldr	r4, [r1, #8]
c0d002de:	429c      	cmp	r4, r3
c0d002e0:	d103      	bne.n	c0d002ea <bip44_hasValidFIOPrefix+0x32>
c0d002e2:	68c9      	ldr	r1, [r1, #12]
c0d002e4:	2900      	cmp	r1, #0
c0d002e6:	d100      	bne.n	c0d002ea <bip44_hasValidFIOPrefix+0x32>
c0d002e8:	4610      	mov	r0, r2
c0d002ea:	bdb0      	pop	{r4, r5, r7, pc}

c0d002ec <bip44_containsAddress>:
c0d002ec:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d002ee:	2804      	cmp	r0, #4
c0d002f0:	d801      	bhi.n	c0d002f6 <bip44_containsAddress+0xa>
c0d002f2:	2000      	movs	r0, #0
c0d002f4:	4770      	bx	lr
c0d002f6:	2001      	movs	r0, #1
c0d002f8:	4770      	bx	lr
	...

c0d002fc <bip44_getAddressValue>:
c0d002fc:	b510      	push	{r4, lr}
c0d002fe:	4604      	mov	r4, r0
c0d00300:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d00302:	2804      	cmp	r0, #4
c0d00304:	d801      	bhi.n	c0d0030a <bip44_getAddressValue+0xe>
c0d00306:	2000      	movs	r0, #0
c0d00308:	e000      	b.n	c0d0030c <bip44_getAddressValue+0x10>
c0d0030a:	2001      	movs	r0, #1
c0d0030c:	4902      	ldr	r1, [pc, #8]	; (c0d00318 <bip44_getAddressValue+0x1c>)
c0d0030e:	4479      	add	r1, pc
c0d00310:	f7ff ffa6 	bl	c0d00260 <assert>
c0d00314:	6920      	ldr	r0, [r4, #16]
c0d00316:	bd10      	pop	{r4, pc}
c0d00318:	000076a5 	.word	0x000076a5

c0d0031c <bip44_hasReasonableAddress>:
c0d0031c:	b580      	push	{r7, lr}
c0d0031e:	6a81      	ldr	r1, [r0, #40]	; 0x28
c0d00320:	2905      	cmp	r1, #5
c0d00322:	d304      	bcc.n	c0d0032e <bip44_hasReasonableAddress+0x12>
c0d00324:	f7ff ffea 	bl	c0d002fc <bip44_getAddressValue>
c0d00328:	4903      	ldr	r1, [pc, #12]	; (c0d00338 <bip44_hasReasonableAddress+0x1c>)
c0d0032a:	4288      	cmp	r0, r1
c0d0032c:	d301      	bcc.n	c0d00332 <bip44_hasReasonableAddress+0x16>
c0d0032e:	2000      	movs	r0, #0
c0d00330:	bd80      	pop	{r7, pc}
c0d00332:	2001      	movs	r0, #1
c0d00334:	bd80      	pop	{r7, pc}
c0d00336:	46c0      	nop			; (mov r8, r8)
c0d00338:	000003e9 	.word	0x000003e9

c0d0033c <bip44_containsMoreThanAddress>:
c0d0033c:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d0033e:	2805      	cmp	r0, #5
c0d00340:	d801      	bhi.n	c0d00346 <bip44_containsMoreThanAddress+0xa>
c0d00342:	2000      	movs	r0, #0
c0d00344:	4770      	bx	lr
c0d00346:	2001      	movs	r0, #1
c0d00348:	4770      	bx	lr
	...

c0d0034c <bip44_printToStr>:
c0d0034c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0034e:	b085      	sub	sp, #20
c0d00350:	4616      	mov	r6, r2
c0d00352:	460f      	mov	r7, r1
c0d00354:	9001      	str	r0, [sp, #4]
c0d00356:	0a91      	lsrs	r1, r2, #10
c0d00358:	4248      	negs	r0, r1
c0d0035a:	4148      	adcs	r0, r1
c0d0035c:	4945      	ldr	r1, [pc, #276]	; (c0d00474 <bip44_printToStr+0x128>)
c0d0035e:	4479      	add	r1, pc
c0d00360:	4c45      	ldr	r4, [pc, #276]	; (c0d00478 <bip44_printToStr+0x12c>)
c0d00362:	447c      	add	r4, pc
c0d00364:	47a0      	blx	r4
c0d00366:	1e71      	subs	r1, r6, #1
c0d00368:	4630      	mov	r0, r6
c0d0036a:	4188      	sbcs	r0, r1
c0d0036c:	4943      	ldr	r1, [pc, #268]	; (c0d0047c <bip44_printToStr+0x130>)
c0d0036e:	4479      	add	r1, pc
c0d00370:	47a0      	blx	r4
c0d00372:	43f0      	mvns	r0, r6
c0d00374:	0fc0      	lsrs	r0, r0, #31
c0d00376:	4d42      	ldr	r5, [pc, #264]	; (c0d00480 <bip44_printToStr+0x134>)
c0d00378:	447d      	add	r5, pc
c0d0037a:	4629      	mov	r1, r5
c0d0037c:	47a0      	blx	r4
c0d0037e:	4a41      	ldr	r2, [pc, #260]	; (c0d00484 <bip44_printToStr+0x138>)
c0d00380:	447a      	add	r2, pc
c0d00382:	4638      	mov	r0, r7
c0d00384:	4631      	mov	r1, r6
c0d00386:	f003 f8fb 	bl	c0d03580 <snprintf>
c0d0038a:	9700      	str	r7, [sp, #0]
c0d0038c:	4638      	mov	r0, r7
c0d0038e:	f007 fab3 	bl	c0d078f8 <strlen>
c0d00392:	9002      	str	r0, [sp, #8]
c0d00394:	1c40      	adds	r0, r0, #1
c0d00396:	2701      	movs	r7, #1
c0d00398:	2100      	movs	r1, #0
c0d0039a:	42b0      	cmp	r0, r6
c0d0039c:	4638      	mov	r0, r7
c0d0039e:	d900      	bls.n	c0d003a2 <bip44_printToStr+0x56>
c0d003a0:	4608      	mov	r0, r1
c0d003a2:	9104      	str	r1, [sp, #16]
c0d003a4:	4629      	mov	r1, r5
c0d003a6:	47a0      	blx	r4
c0d003a8:	9801      	ldr	r0, [sp, #4]
c0d003aa:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d003ac:	280a      	cmp	r0, #10
c0d003ae:	d300      	bcc.n	c0d003b2 <bip44_printToStr+0x66>
c0d003b0:	9f04      	ldr	r7, [sp, #16]
c0d003b2:	4935      	ldr	r1, [pc, #212]	; (c0d00488 <bip44_printToStr+0x13c>)
c0d003b4:	4479      	add	r1, pc
c0d003b6:	4638      	mov	r0, r7
c0d003b8:	47a0      	blx	r4
c0d003ba:	9800      	ldr	r0, [sp, #0]
c0d003bc:	1981      	adds	r1, r0, r6
c0d003be:	9103      	str	r1, [sp, #12]
c0d003c0:	9902      	ldr	r1, [sp, #8]
c0d003c2:	1846      	adds	r6, r0, r1
c0d003c4:	9a01      	ldr	r2, [sp, #4]
c0d003c6:	9904      	ldr	r1, [sp, #16]
c0d003c8:	9801      	ldr	r0, [sp, #4]
c0d003ca:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d003cc:	4281      	cmp	r1, r0
c0d003ce:	d238      	bcs.n	c0d00442 <bip44_printToStr+0xf6>
c0d003d0:	9803      	ldr	r0, [sp, #12]
c0d003d2:	4286      	cmp	r6, r0
c0d003d4:	d901      	bls.n	c0d003da <bip44_printToStr+0x8e>
c0d003d6:	2000      	movs	r0, #0
c0d003d8:	e000      	b.n	c0d003dc <bip44_printToStr+0x90>
c0d003da:	2001      	movs	r0, #1
c0d003dc:	9104      	str	r1, [sp, #16]
c0d003de:	9202      	str	r2, [sp, #8]
c0d003e0:	6815      	ldr	r5, [r2, #0]
c0d003e2:	2d00      	cmp	r5, #0
c0d003e4:	d409      	bmi.n	c0d003fa <bip44_printToStr+0xae>
c0d003e6:	4f2d      	ldr	r7, [pc, #180]	; (c0d0049c <bip44_printToStr+0x150>)
c0d003e8:	447f      	add	r7, pc
c0d003ea:	4639      	mov	r1, r7
c0d003ec:	f7ff ff38 	bl	c0d00260 <assert>
c0d003f0:	9803      	ldr	r0, [sp, #12]
c0d003f2:	1b84      	subs	r4, r0, r6
c0d003f4:	4a2a      	ldr	r2, [pc, #168]	; (c0d004a0 <bip44_printToStr+0x154>)
c0d003f6:	447a      	add	r2, pc
c0d003f8:	e00b      	b.n	c0d00412 <bip44_printToStr+0xc6>
c0d003fa:	4f26      	ldr	r7, [pc, #152]	; (c0d00494 <bip44_printToStr+0x148>)
c0d003fc:	447f      	add	r7, pc
c0d003fe:	4639      	mov	r1, r7
c0d00400:	f7ff ff2e 	bl	c0d00260 <assert>
c0d00404:	9803      	ldr	r0, [sp, #12]
c0d00406:	1b84      	subs	r4, r0, r6
c0d00408:	2001      	movs	r0, #1
c0d0040a:	07c0      	lsls	r0, r0, #31
c0d0040c:	4385      	bics	r5, r0
c0d0040e:	4a22      	ldr	r2, [pc, #136]	; (c0d00498 <bip44_printToStr+0x14c>)
c0d00410:	447a      	add	r2, pc
c0d00412:	4630      	mov	r0, r6
c0d00414:	4621      	mov	r1, r4
c0d00416:	462b      	mov	r3, r5
c0d00418:	f003 f8b2 	bl	c0d03580 <snprintf>
c0d0041c:	4630      	mov	r0, r6
c0d0041e:	f007 fa6b 	bl	c0d078f8 <strlen>
c0d00422:	4605      	mov	r5, r0
c0d00424:	1c40      	adds	r0, r0, #1
c0d00426:	42a0      	cmp	r0, r4
c0d00428:	d901      	bls.n	c0d0042e <bip44_printToStr+0xe2>
c0d0042a:	2000      	movs	r0, #0
c0d0042c:	e000      	b.n	c0d00430 <bip44_printToStr+0xe4>
c0d0042e:	2001      	movs	r0, #1
c0d00430:	4639      	mov	r1, r7
c0d00432:	f7ff ff15 	bl	c0d00260 <assert>
c0d00436:	1976      	adds	r6, r6, r5
c0d00438:	9a02      	ldr	r2, [sp, #8]
c0d0043a:	1d12      	adds	r2, r2, #4
c0d0043c:	9904      	ldr	r1, [sp, #16]
c0d0043e:	1c49      	adds	r1, r1, #1
c0d00440:	e7c2      	b.n	c0d003c8 <bip44_printToStr+0x7c>
c0d00442:	2401      	movs	r4, #1
c0d00444:	2500      	movs	r5, #0
c0d00446:	9803      	ldr	r0, [sp, #12]
c0d00448:	4286      	cmp	r6, r0
c0d0044a:	4620      	mov	r0, r4
c0d0044c:	d300      	bcc.n	c0d00450 <bip44_printToStr+0x104>
c0d0044e:	4628      	mov	r0, r5
c0d00450:	490e      	ldr	r1, [pc, #56]	; (c0d0048c <bip44_printToStr+0x140>)
c0d00452:	4479      	add	r1, pc
c0d00454:	f7ff ff04 	bl	c0d00260 <assert>
c0d00458:	9800      	ldr	r0, [sp, #0]
c0d0045a:	4286      	cmp	r6, r0
c0d0045c:	d200      	bcs.n	c0d00460 <bip44_printToStr+0x114>
c0d0045e:	462c      	mov	r4, r5
c0d00460:	490b      	ldr	r1, [pc, #44]	; (c0d00490 <bip44_printToStr+0x144>)
c0d00462:	4479      	add	r1, pc
c0d00464:	4620      	mov	r0, r4
c0d00466:	f7ff fefb 	bl	c0d00260 <assert>
c0d0046a:	9800      	ldr	r0, [sp, #0]
c0d0046c:	1a30      	subs	r0, r6, r0
c0d0046e:	b005      	add	sp, #20
c0d00470:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d00472:	46c0      	nop			; (mov r8, r8)
c0d00474:	00007664 	.word	0x00007664
c0d00478:	fffffefb 	.word	0xfffffefb
c0d0047c:	00007663 	.word	0x00007663
c0d00480:	00007668 	.word	0x00007668
c0d00484:	000077c2 	.word	0x000077c2
c0d00488:	0000763b 	.word	0x0000763b
c0d0048c:	000075d5 	.word	0x000075d5
c0d00490:	000075d5 	.word	0x000075d5
c0d00494:	00007602 	.word	0x00007602
c0d00498:	000075fe 	.word	0x000075fe
c0d0049c:	0000762b 	.word	0x0000762b
c0d004a0:	0000762d 	.word	0x0000762d

c0d004a4 <cx_aes_dec_block>:
c0d004a4:	b403      	push	{r0, r1}
c0d004a6:	4801      	ldr	r0, [pc, #4]	; (c0d004ac <cx_aes_dec_block+0x8>)
c0d004a8:	e06b      	b.n	c0d00582 <cx_trampoline_helper>
c0d004aa:	0000      	.short	0x0000
c0d004ac:	00000000 	.word	0x00000000

c0d004b0 <cx_aes_enc_block>:
c0d004b0:	b403      	push	{r0, r1}
c0d004b2:	4801      	ldr	r0, [pc, #4]	; (c0d004b8 <cx_aes_enc_block+0x8>)
c0d004b4:	e065      	b.n	c0d00582 <cx_trampoline_helper>
c0d004b6:	0000      	.short	0x0000
c0d004b8:	00000001 	.word	0x00000001

c0d004bc <cx_aes_init_key_no_throw>:
c0d004bc:	b403      	push	{r0, r1}
c0d004be:	4801      	ldr	r0, [pc, #4]	; (c0d004c4 <cx_aes_init_key_no_throw+0x8>)
c0d004c0:	e05f      	b.n	c0d00582 <cx_trampoline_helper>
c0d004c2:	0000      	.short	0x0000
c0d004c4:	00000002 	.word	0x00000002

c0d004c8 <cx_ecdh_no_throw>:
c0d004c8:	b403      	push	{r0, r1}
c0d004ca:	4801      	ldr	r0, [pc, #4]	; (c0d004d0 <cx_ecdh_no_throw+0x8>)
c0d004cc:	e059      	b.n	c0d00582 <cx_trampoline_helper>
c0d004ce:	0000      	.short	0x0000
c0d004d0:	00000014 	.word	0x00000014

c0d004d4 <cx_ecdsa_sign_no_throw>:
c0d004d4:	b403      	push	{r0, r1}
c0d004d6:	4801      	ldr	r0, [pc, #4]	; (c0d004dc <cx_ecdsa_sign_no_throw+0x8>)
c0d004d8:	e053      	b.n	c0d00582 <cx_trampoline_helper>
c0d004da:	0000      	.short	0x0000
c0d004dc:	00000015 	.word	0x00000015

c0d004e0 <cx_ecfp_generate_pair_no_throw>:
c0d004e0:	b403      	push	{r0, r1}
c0d004e2:	4801      	ldr	r0, [pc, #4]	; (c0d004e8 <cx_ecfp_generate_pair_no_throw+0x8>)
c0d004e4:	e04d      	b.n	c0d00582 <cx_trampoline_helper>
c0d004e6:	0000      	.short	0x0000
c0d004e8:	0000001b 	.word	0x0000001b

c0d004ec <cx_ecfp_init_private_key_no_throw>:
c0d004ec:	b403      	push	{r0, r1}
c0d004ee:	4801      	ldr	r0, [pc, #4]	; (c0d004f4 <cx_ecfp_init_private_key_no_throw+0x8>)
c0d004f0:	e047      	b.n	c0d00582 <cx_trampoline_helper>
c0d004f2:	0000      	.short	0x0000
c0d004f4:	0000001c 	.word	0x0000001c

c0d004f8 <cx_ecfp_init_public_key_no_throw>:
c0d004f8:	b403      	push	{r0, r1}
c0d004fa:	4801      	ldr	r0, [pc, #4]	; (c0d00500 <cx_ecfp_init_public_key_no_throw+0x8>)
c0d004fc:	e041      	b.n	c0d00582 <cx_trampoline_helper>
c0d004fe:	0000      	.short	0x0000
c0d00500:	0000001d 	.word	0x0000001d

c0d00504 <cx_hash_get_size>:
c0d00504:	b403      	push	{r0, r1}
c0d00506:	4801      	ldr	r0, [pc, #4]	; (c0d0050c <cx_hash_get_size+0x8>)
c0d00508:	e03b      	b.n	c0d00582 <cx_trampoline_helper>
c0d0050a:	0000      	.short	0x0000
c0d0050c:	0000002f 	.word	0x0000002f

c0d00510 <cx_hash_no_throw>:
c0d00510:	b403      	push	{r0, r1}
c0d00512:	4801      	ldr	r0, [pc, #4]	; (c0d00518 <cx_hash_no_throw+0x8>)
c0d00514:	e035      	b.n	c0d00582 <cx_trampoline_helper>
c0d00516:	0000      	.short	0x0000
c0d00518:	00000032 	.word	0x00000032

c0d0051c <cx_hmac_final>:
c0d0051c:	b403      	push	{r0, r1}
c0d0051e:	4801      	ldr	r0, [pc, #4]	; (c0d00524 <cx_hmac_final+0x8>)
c0d00520:	e02f      	b.n	c0d00582 <cx_trampoline_helper>
c0d00522:	0000      	.short	0x0000
c0d00524:	00000038 	.word	0x00000038

c0d00528 <cx_hmac_no_throw>:
c0d00528:	b403      	push	{r0, r1}
c0d0052a:	4801      	ldr	r0, [pc, #4]	; (c0d00530 <cx_hmac_no_throw+0x8>)
c0d0052c:	e029      	b.n	c0d00582 <cx_trampoline_helper>
c0d0052e:	0000      	.short	0x0000
c0d00530:	0000003a 	.word	0x0000003a

c0d00534 <cx_hmac_sha256_init_no_throw>:
c0d00534:	b403      	push	{r0, r1}
c0d00536:	4801      	ldr	r0, [pc, #4]	; (c0d0053c <cx_hmac_sha256_init_no_throw+0x8>)
c0d00538:	e023      	b.n	c0d00582 <cx_trampoline_helper>
c0d0053a:	0000      	.short	0x0000
c0d0053c:	0000003e 	.word	0x0000003e

c0d00540 <cx_hmac_update>:
c0d00540:	b403      	push	{r0, r1}
c0d00542:	4801      	ldr	r0, [pc, #4]	; (c0d00548 <cx_hmac_update+0x8>)
c0d00544:	e01d      	b.n	c0d00582 <cx_trampoline_helper>
c0d00546:	0000      	.short	0x0000
c0d00548:	00000042 	.word	0x00000042

c0d0054c <cx_ripemd160_init_no_throw>:
c0d0054c:	b403      	push	{r0, r1}
c0d0054e:	4801      	ldr	r0, [pc, #4]	; (c0d00554 <cx_ripemd160_init_no_throw+0x8>)
c0d00550:	e017      	b.n	c0d00582 <cx_trampoline_helper>
c0d00552:	0000      	.short	0x0000
c0d00554:	00000056 	.word	0x00000056

c0d00558 <cx_rng_no_throw>:
c0d00558:	b403      	push	{r0, r1}
c0d0055a:	4801      	ldr	r0, [pc, #4]	; (c0d00560 <cx_rng_no_throw+0x8>)
c0d0055c:	e011      	b.n	c0d00582 <cx_trampoline_helper>
c0d0055e:	0000      	.short	0x0000
c0d00560:	00000058 	.word	0x00000058

c0d00564 <cx_sha256_init_no_throw>:
c0d00564:	b403      	push	{r0, r1}
c0d00566:	4801      	ldr	r0, [pc, #4]	; (c0d0056c <cx_sha256_init_no_throw+0x8>)
c0d00568:	e00b      	b.n	c0d00582 <cx_trampoline_helper>
c0d0056a:	0000      	.short	0x0000
c0d0056c:	0000005f 	.word	0x0000005f

c0d00570 <cx_sha512_init_no_throw>:
c0d00570:	b403      	push	{r0, r1}
c0d00572:	4801      	ldr	r0, [pc, #4]	; (c0d00578 <cx_sha512_init_no_throw+0x8>)
c0d00574:	e005      	b.n	c0d00582 <cx_trampoline_helper>
c0d00576:	0000      	.short	0x0000
c0d00578:	00000068 	.word	0x00000068

c0d0057c <cx_x448>:
c0d0057c:	b403      	push	{r0, r1}
c0d0057e:	4802      	ldr	r0, [pc, #8]	; (c0d00588 <cx_trampoline_helper+0x6>)
c0d00580:	e7ff      	b.n	c0d00582 <cx_trampoline_helper>

c0d00582 <cx_trampoline_helper>:
c0d00582:	4902      	ldr	r1, [pc, #8]	; (c0d0058c <cx_trampoline_helper+0xa>)
c0d00584:	4708      	bx	r1
c0d00586:	0000      	.short	0x0000
c0d00588:	00000071 	.word	0x00000071
c0d0058c:	00120001 	.word	0x00120001

c0d00590 <decode_handleAPDU>:
c0d00590:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d00592:	b087      	sub	sp, #28
c0d00594:	460c      	mov	r4, r1
c0d00596:	214b      	movs	r1, #75	; 0x4b
c0d00598:	008e      	lsls	r6, r1, #2
c0d0059a:	990c      	ldr	r1, [sp, #48]	; 0x30
c0d0059c:	2900      	cmp	r1, #0
c0d0059e:	d010      	beq.n	c0d005c2 <decode_handleAPDU+0x32>
c0d005a0:	9304      	str	r3, [sp, #16]
c0d005a2:	2801      	cmp	r0, #1
c0d005a4:	d000      	beq.n	c0d005a8 <decode_handleAPDU+0x18>
c0d005a6:	e1bc      	b.n	c0d00922 <decode_handleAPDU+0x392>
c0d005a8:	9203      	str	r2, [sp, #12]
c0d005aa:	4631      	mov	r1, r6
c0d005ac:	31c8      	adds	r1, #200	; 0xc8
c0d005ae:	4fe2      	ldr	r7, [pc, #904]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d005b0:	4638      	mov	r0, r7
c0d005b2:	f007 f863 	bl	c0d0767c <explicit_bzero>
c0d005b6:	207c      	movs	r0, #124	; 0x7c
c0d005b8:	2100      	movs	r1, #0
c0d005ba:	5239      	strh	r1, [r7, r0]
c0d005bc:	2001      	movs	r0, #1
c0d005be:	7038      	strb	r0, [r7, #0]
c0d005c0:	e009      	b.n	c0d005d6 <decode_handleAPDU+0x46>
c0d005c2:	2803      	cmp	r0, #3
c0d005c4:	d100      	bne.n	c0d005c8 <decode_handleAPDU+0x38>
c0d005c6:	e0ce      	b.n	c0d00766 <decode_handleAPDU+0x1d6>
c0d005c8:	9304      	str	r3, [sp, #16]
c0d005ca:	2802      	cmp	r0, #2
c0d005cc:	d023      	beq.n	c0d00616 <decode_handleAPDU+0x86>
c0d005ce:	9203      	str	r2, [sp, #12]
c0d005d0:	2801      	cmp	r0, #1
c0d005d2:	d000      	beq.n	c0d005d6 <decode_handleAPDU+0x46>
c0d005d4:	e19b      	b.n	c0d0090e <decode_handleAPDU+0x37e>
c0d005d6:	2c00      	cmp	r4, #0
c0d005d8:	d000      	beq.n	c0d005dc <decode_handleAPDU+0x4c>
c0d005da:	e198      	b.n	c0d0090e <decode_handleAPDU+0x37e>
c0d005dc:	4635      	mov	r5, r6
c0d005de:	2001      	movs	r0, #1
c0d005e0:	f000 f9c8 	bl	c0d00974 <CHECK_STAGE>
c0d005e4:	247c      	movs	r4, #124	; 0x7c
c0d005e6:	4fd4      	ldr	r7, [pc, #848]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d005e8:	5b38      	ldrh	r0, [r7, r4]
c0d005ea:	9a04      	ldr	r2, [sp, #16]
c0d005ec:	1886      	adds	r6, r0, r2
c0d005ee:	3519      	adds	r5, #25
c0d005f0:	42ae      	cmp	r6, r5
c0d005f2:	d300      	bcc.n	c0d005f6 <decode_handleAPDU+0x66>
c0d005f4:	e192      	b.n	c0d0091c <decode_handleAPDU+0x38c>
c0d005f6:	1838      	adds	r0, r7, r0
c0d005f8:	3080      	adds	r0, #128	; 0x80
c0d005fa:	9903      	ldr	r1, [sp, #12]
c0d005fc:	f007 f82e 	bl	c0d0765c <__aeabi_memcpy>
c0d00600:	533e      	strh	r6, [r7, r4]
c0d00602:	2009      	movs	r0, #9
c0d00604:	0300      	lsls	r0, r0, #12
c0d00606:	2100      	movs	r1, #0
c0d00608:	460a      	mov	r2, r1
c0d0060a:	f001 ff35 	bl	c0d02478 <io_send_buf>
c0d0060e:	f005 faef 	bl	c0d05bf0 <ui_displayBusy>
c0d00612:	b007      	add	sp, #28
c0d00614:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d00616:	4615      	mov	r5, r2
c0d00618:	9601      	str	r6, [sp, #4]
c0d0061a:	2001      	movs	r0, #1
c0d0061c:	9003      	str	r0, [sp, #12]
c0d0061e:	f000 f9a9 	bl	c0d00974 <CHECK_STAGE>
c0d00622:	4ec5      	ldr	r6, [pc, #788]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d00624:	2002      	movs	r0, #2
c0d00626:	7030      	strb	r0, [r6, #0]
c0d00628:	2c01      	cmp	r4, #1
c0d0062a:	d002      	beq.n	c0d00632 <decode_handleAPDU+0xa2>
c0d0062c:	2c02      	cmp	r4, #2
c0d0062e:	d000      	beq.n	c0d00632 <decode_handleAPDU+0xa2>
c0d00630:	e16d      	b.n	c0d0090e <decode_handleAPDU+0x37e>
c0d00632:	9804      	ldr	r0, [sp, #16]
c0d00634:	2841      	cmp	r0, #65	; 0x41
c0d00636:	d800      	bhi.n	c0d0063a <decode_handleAPDU+0xaa>
c0d00638:	e16c      	b.n	c0d00914 <decode_handleAPDU+0x384>
c0d0063a:	4633      	mov	r3, r6
c0d0063c:	3330      	adds	r3, #48	; 0x30
c0d0063e:	2021      	movs	r0, #33	; 0x21
c0d00640:	2241      	movs	r2, #65	; 0x41
c0d00642:	4629      	mov	r1, r5
c0d00644:	9302      	str	r3, [sp, #8]
c0d00646:	f7ff ff57 	bl	c0d004f8 <cx_ecfp_init_public_key_no_throw>
c0d0064a:	2800      	cmp	r0, #0
c0d0064c:	d000      	beq.n	c0d00650 <decode_handleAPDU+0xc0>
c0d0064e:	e161      	b.n	c0d00914 <decode_handleAPDU+0x384>
c0d00650:	1d37      	adds	r7, r6, #4
c0d00652:	3541      	adds	r5, #65	; 0x41
c0d00654:	9e04      	ldr	r6, [sp, #16]
c0d00656:	3e41      	subs	r6, #65	; 0x41
c0d00658:	4638      	mov	r0, r7
c0d0065a:	4629      	mov	r1, r5
c0d0065c:	4632      	mov	r2, r6
c0d0065e:	f7ff fe07 	bl	c0d00270 <bip44_parseFromWire>
c0d00662:	42b0      	cmp	r0, r6
c0d00664:	d000      	beq.n	c0d00668 <decode_handleAPDU+0xd8>
c0d00666:	e155      	b.n	c0d00914 <decode_handleAPDU+0x384>
c0d00668:	4638      	mov	r0, r7
c0d0066a:	f003 f9b8 	bl	c0d039de <policyForDecodeDHDecode>
c0d0066e:	2801      	cmp	r0, #1
c0d00670:	d100      	bne.n	c0d00674 <decode_handleAPDU+0xe4>
c0d00672:	e15a      	b.n	c0d0092a <decode_handleAPDU+0x39a>
c0d00674:	9704      	str	r7, [sp, #16]
c0d00676:	207c      	movs	r0, #124	; 0x7c
c0d00678:	4605      	mov	r5, r0
c0d0067a:	49af      	ldr	r1, [pc, #700]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d0067c:	5a08      	ldrh	r0, [r1, r0]
c0d0067e:	21ff      	movs	r1, #255	; 0xff
c0d00680:	3146      	adds	r1, #70	; 0x46
c0d00682:	2700      	movs	r7, #0
c0d00684:	4288      	cmp	r0, r1
c0d00686:	9803      	ldr	r0, [sp, #12]
c0d00688:	d300      	bcc.n	c0d0068c <decode_handleAPDU+0xfc>
c0d0068a:	4638      	mov	r0, r7
c0d0068c:	49ae      	ldr	r1, [pc, #696]	; (c0d00948 <decode_handleAPDU+0x3b8>)
c0d0068e:	4479      	add	r1, pc
c0d00690:	f7ff fde6 	bl	c0d00260 <assert>
c0d00694:	4ea8      	ldr	r6, [pc, #672]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d00696:	5b73      	ldrh	r3, [r6, r5]
c0d00698:	4632      	mov	r2, r6
c0d0069a:	3280      	adds	r2, #128	; 0x80
c0d0069c:	9804      	ldr	r0, [sp, #16]
c0d0069e:	9902      	ldr	r1, [sp, #8]
c0d006a0:	f001 f8ca 	bl	c0d01838 <dh_decode>
c0d006a4:	2171      	movs	r1, #113	; 0x71
c0d006a6:	0089      	lsls	r1, r1, #2
c0d006a8:	4aa4      	ldr	r2, [pc, #656]	; (c0d0093c <decode_handleAPDU+0x3ac>)
c0d006aa:	5272      	strh	r2, [r6, r1]
c0d006ac:	9504      	str	r5, [sp, #16]
c0d006ae:	5370      	strh	r0, [r6, r5]
c0d006b0:	207e      	movs	r0, #126	; 0x7e
c0d006b2:	5237      	strh	r7, [r6, r0]
c0d006b4:	2039      	movs	r0, #57	; 0x39
c0d006b6:	00c0      	lsls	r0, r0, #3
c0d006b8:	9003      	str	r0, [sp, #12]
c0d006ba:	5831      	ldr	r1, [r6, r0]
c0d006bc:	4248      	negs	r0, r1
c0d006be:	4148      	adcs	r0, r1
c0d006c0:	2c01      	cmp	r4, #1
c0d006c2:	d000      	beq.n	c0d006c6 <decode_handleAPDU+0x136>
c0d006c4:	e0b0      	b.n	c0d00828 <decode_handleAPDU+0x298>
c0d006c6:	49a1      	ldr	r1, [pc, #644]	; (c0d0094c <decode_handleAPDU+0x3bc>)
c0d006c8:	4479      	add	r1, pc
c0d006ca:	f7ff fdc9 	bl	c0d00260 <assert>
c0d006ce:	2073      	movs	r0, #115	; 0x73
c0d006d0:	0080      	lsls	r0, r0, #2
c0d006d2:	1835      	adds	r5, r6, r0
c0d006d4:	2128      	movs	r1, #40	; 0x28
c0d006d6:	4628      	mov	r0, r5
c0d006d8:	f006 ffd0 	bl	c0d0767c <explicit_bzero>
c0d006dc:	2000      	movs	r0, #0
c0d006de:	9005      	str	r0, [sp, #20]
c0d006e0:	ac05      	add	r4, sp, #20
c0d006e2:	4f9b      	ldr	r7, [pc, #620]	; (c0d00950 <decode_handleAPDU+0x3c0>)
c0d006e4:	447f      	add	r7, pc
c0d006e6:	4620      	mov	r0, r4
c0d006e8:	4629      	mov	r1, r5
c0d006ea:	47b8      	blx	r7
c0d006ec:	2075      	movs	r0, #117	; 0x75
c0d006ee:	0080      	lsls	r0, r0, #2
c0d006f0:	1831      	adds	r1, r6, r0
c0d006f2:	4620      	mov	r0, r4
c0d006f4:	47b8      	blx	r7
c0d006f6:	203b      	movs	r0, #59	; 0x3b
c0d006f8:	00c0      	lsls	r0, r0, #3
c0d006fa:	1831      	adds	r1, r6, r0
c0d006fc:	4620      	mov	r0, r4
c0d006fe:	47b8      	blx	r7
c0d00700:	2077      	movs	r0, #119	; 0x77
c0d00702:	0080      	lsls	r0, r0, #2
c0d00704:	1831      	adds	r1, r6, r0
c0d00706:	4620      	mov	r0, r4
c0d00708:	47b8      	blx	r7
c0d0070a:	203d      	movs	r0, #61	; 0x3d
c0d0070c:	00c0      	lsls	r0, r0, #3
c0d0070e:	9002      	str	r0, [sp, #8]
c0d00710:	1831      	adds	r1, r6, r0
c0d00712:	4e90      	ldr	r6, [pc, #576]	; (c0d00954 <decode_handleAPDU+0x3c4>)
c0d00714:	447e      	add	r6, pc
c0d00716:	4620      	mov	r0, r4
c0d00718:	47b0      	blx	r6
c0d0071a:	207b      	movs	r0, #123	; 0x7b
c0d0071c:	0087      	lsls	r7, r0, #2
c0d0071e:	4886      	ldr	r0, [pc, #536]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d00720:	19c1      	adds	r1, r0, r7
c0d00722:	4620      	mov	r0, r4
c0d00724:	47b0      	blx	r6
c0d00726:	201f      	movs	r0, #31
c0d00728:	0105      	lsls	r5, r0, #4
c0d0072a:	4883      	ldr	r0, [pc, #524]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d0072c:	1941      	adds	r1, r0, r5
c0d0072e:	4620      	mov	r0, r4
c0d00730:	47b0      	blx	r6
c0d00732:	4b81      	ldr	r3, [pc, #516]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d00734:	9804      	ldr	r0, [sp, #16]
c0d00736:	5a18      	ldrh	r0, [r3, r0]
c0d00738:	9905      	ldr	r1, [sp, #20]
c0d0073a:	4281      	cmp	r1, r0
c0d0073c:	d000      	beq.n	c0d00740 <decode_handleAPDU+0x1b0>
c0d0073e:	e0e9      	b.n	c0d00914 <decode_handleAPDU+0x384>
c0d00740:	5958      	ldr	r0, [r3, r5]
c0d00742:	59d9      	ldr	r1, [r3, r7]
c0d00744:	9a02      	ldr	r2, [sp, #8]
c0d00746:	589a      	ldr	r2, [r3, r2]
c0d00748:	2a00      	cmp	r2, #0
c0d0074a:	d100      	bne.n	c0d0074e <decode_handleAPDU+0x1be>
c0d0074c:	e0c7      	b.n	c0d008de <decode_handleAPDU+0x34e>
c0d0074e:	2900      	cmp	r1, #0
c0d00750:	d000      	beq.n	c0d00754 <decode_handleAPDU+0x1c4>
c0d00752:	e0c4      	b.n	c0d008de <decode_handleAPDU+0x34e>
c0d00754:	2800      	cmp	r0, #0
c0d00756:	d000      	beq.n	c0d0075a <decode_handleAPDU+0x1ca>
c0d00758:	e0c1      	b.n	c0d008de <decode_handleAPDU+0x34e>
c0d0075a:	20c8      	movs	r0, #200	; 0xc8
c0d0075c:	9903      	ldr	r1, [sp, #12]
c0d0075e:	5058      	str	r0, [r3, r1]
c0d00760:	f000 f94e 	bl	c0d00a00 <decodeNewfundsreqMemo_ui_runStep>
c0d00764:	e755      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d00766:	2c00      	cmp	r4, #0
c0d00768:	d000      	beq.n	c0d0076c <decode_handleAPDU+0x1dc>
c0d0076a:	e0d0      	b.n	c0d0090e <decode_handleAPDU+0x37e>
c0d0076c:	2b00      	cmp	r3, #0
c0d0076e:	d000      	beq.n	c0d00772 <decode_handleAPDU+0x1e2>
c0d00770:	e0cd      	b.n	c0d0090e <decode_handleAPDU+0x37e>
c0d00772:	2003      	movs	r0, #3
c0d00774:	f000 f8fe 	bl	c0d00974 <CHECK_STAGE>
c0d00778:	2071      	movs	r0, #113	; 0x71
c0d0077a:	0080      	lsls	r0, r0, #2
c0d0077c:	4f6e      	ldr	r7, [pc, #440]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d0077e:	5a38      	ldrh	r0, [r7, r0]
c0d00780:	496e      	ldr	r1, [pc, #440]	; (c0d0093c <decode_handleAPDU+0x3ac>)
c0d00782:	4288      	cmp	r0, r1
c0d00784:	d000      	beq.n	c0d00788 <decode_handleAPDU+0x1f8>
c0d00786:	e0cc      	b.n	c0d00922 <decode_handleAPDU+0x392>
c0d00788:	207c      	movs	r0, #124	; 0x7c
c0d0078a:	9004      	str	r0, [sp, #16]
c0d0078c:	5a38      	ldrh	r0, [r7, r0]
c0d0078e:	21ff      	movs	r1, #255	; 0xff
c0d00790:	3146      	adds	r1, #70	; 0x46
c0d00792:	2401      	movs	r4, #1
c0d00794:	2600      	movs	r6, #0
c0d00796:	4288      	cmp	r0, r1
c0d00798:	4620      	mov	r0, r4
c0d0079a:	d300      	bcc.n	c0d0079e <decode_handleAPDU+0x20e>
c0d0079c:	4630      	mov	r0, r6
c0d0079e:	4971      	ldr	r1, [pc, #452]	; (c0d00964 <decode_handleAPDU+0x3d4>)
c0d007a0:	4479      	add	r1, pc
c0d007a2:	4d71      	ldr	r5, [pc, #452]	; (c0d00968 <decode_handleAPDU+0x3d8>)
c0d007a4:	447d      	add	r5, pc
c0d007a6:	47a8      	blx	r5
c0d007a8:	9804      	ldr	r0, [sp, #16]
c0d007aa:	5a38      	ldrh	r0, [r7, r0]
c0d007ac:	4639      	mov	r1, r7
c0d007ae:	277e      	movs	r7, #126	; 0x7e
c0d007b0:	5bc9      	ldrh	r1, [r1, r7]
c0d007b2:	4281      	cmp	r1, r0
c0d007b4:	4620      	mov	r0, r4
c0d007b6:	d900      	bls.n	c0d007ba <decode_handleAPDU+0x22a>
c0d007b8:	4630      	mov	r0, r6
c0d007ba:	496c      	ldr	r1, [pc, #432]	; (c0d0096c <decode_handleAPDU+0x3dc>)
c0d007bc:	4479      	add	r1, pc
c0d007be:	47a8      	blx	r5
c0d007c0:	485d      	ldr	r0, [pc, #372]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d007c2:	5bc1      	ldrh	r1, [r0, r7]
c0d007c4:	9103      	str	r1, [sp, #12]
c0d007c6:	9904      	ldr	r1, [sp, #16]
c0d007c8:	5a46      	ldrh	r6, [r0, r1]
c0d007ca:	4969      	ldr	r1, [pc, #420]	; (c0d00970 <decode_handleAPDU+0x3e0>)
c0d007cc:	4479      	add	r1, pc
c0d007ce:	4620      	mov	r0, r4
c0d007d0:	47a8      	blx	r5
c0d007d2:	0a30      	lsrs	r0, r6, #8
c0d007d4:	495a      	ldr	r1, [pc, #360]	; (c0d00940 <decode_handleAPDU+0x3b0>)
c0d007d6:	7048      	strb	r0, [r1, #1]
c0d007d8:	700e      	strb	r6, [r1, #0]
c0d007da:	9803      	ldr	r0, [sp, #12]
c0d007dc:	1a36      	subs	r6, r6, r0
c0d007de:	b2b0      	uxth	r0, r6
c0d007e0:	28c8      	cmp	r0, #200	; 0xc8
c0d007e2:	d300      	bcc.n	c0d007e6 <decode_handleAPDU+0x256>
c0d007e4:	26c8      	movs	r6, #200	; 0xc8
c0d007e6:	708e      	strb	r6, [r1, #2]
c0d007e8:	b2b5      	uxth	r5, r6
c0d007ea:	4c53      	ldr	r4, [pc, #332]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d007ec:	5be0      	ldrh	r0, [r4, r7]
c0d007ee:	460a      	mov	r2, r1
c0d007f0:	1821      	adds	r1, r4, r0
c0d007f2:	3180      	adds	r1, #128	; 0x80
c0d007f4:	1cd0      	adds	r0, r2, #3
c0d007f6:	462a      	mov	r2, r5
c0d007f8:	f006 ff30 	bl	c0d0765c <__aeabi_memcpy>
c0d007fc:	1cea      	adds	r2, r5, #3
c0d007fe:	2009      	movs	r0, #9
c0d00800:	0300      	lsls	r0, r0, #12
c0d00802:	494f      	ldr	r1, [pc, #316]	; (c0d00940 <decode_handleAPDU+0x3b0>)
c0d00804:	f001 fe38 	bl	c0d02478 <io_send_buf>
c0d00808:	f005 f9f2 	bl	c0d05bf0 <ui_displayBusy>
c0d0080c:	5be0      	ldrh	r0, [r4, r7]
c0d0080e:	1980      	adds	r0, r0, r6
c0d00810:	53e0      	strh	r0, [r4, r7]
c0d00812:	b280      	uxth	r0, r0
c0d00814:	9904      	ldr	r1, [sp, #16]
c0d00816:	5a61      	ldrh	r1, [r4, r1]
c0d00818:	4288      	cmp	r0, r1
c0d0081a:	d000      	beq.n	c0d0081e <decode_handleAPDU+0x28e>
c0d0081c:	e6f9      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d0081e:	2000      	movs	r0, #0
c0d00820:	7020      	strb	r0, [r4, #0]
c0d00822:	f7ff fc39 	bl	c0d00098 <ui_idle>
c0d00826:	e6f4      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d00828:	494b      	ldr	r1, [pc, #300]	; (c0d00958 <decode_handleAPDU+0x3c8>)
c0d0082a:	4479      	add	r1, pc
c0d0082c:	f7ff fd18 	bl	c0d00260 <assert>
c0d00830:	2073      	movs	r0, #115	; 0x73
c0d00832:	0080      	lsls	r0, r0, #2
c0d00834:	1835      	adds	r5, r6, r0
c0d00836:	2128      	movs	r1, #40	; 0x28
c0d00838:	4628      	mov	r0, r5
c0d0083a:	f006 ff1f 	bl	c0d0767c <explicit_bzero>
c0d0083e:	2000      	movs	r0, #0
c0d00840:	9006      	str	r0, [sp, #24]
c0d00842:	201d      	movs	r0, #29
c0d00844:	0100      	lsls	r0, r0, #4
c0d00846:	1831      	adds	r1, r6, r0
c0d00848:	ac06      	add	r4, sp, #24
c0d0084a:	4f44      	ldr	r7, [pc, #272]	; (c0d0095c <decode_handleAPDU+0x3cc>)
c0d0084c:	447f      	add	r7, pc
c0d0084e:	4620      	mov	r0, r4
c0d00850:	47b8      	blx	r7
c0d00852:	4620      	mov	r0, r4
c0d00854:	4629      	mov	r1, r5
c0d00856:	47b8      	blx	r7
c0d00858:	2075      	movs	r0, #117	; 0x75
c0d0085a:	0080      	lsls	r0, r0, #2
c0d0085c:	1831      	adds	r1, r6, r0
c0d0085e:	4620      	mov	r0, r4
c0d00860:	47b8      	blx	r7
c0d00862:	203b      	movs	r0, #59	; 0x3b
c0d00864:	00c0      	lsls	r0, r0, #3
c0d00866:	1831      	adds	r1, r6, r0
c0d00868:	4620      	mov	r0, r4
c0d0086a:	47b8      	blx	r7
c0d0086c:	2077      	movs	r0, #119	; 0x77
c0d0086e:	0080      	lsls	r0, r0, #2
c0d00870:	1831      	adds	r1, r6, r0
c0d00872:	4620      	mov	r0, r4
c0d00874:	47b8      	blx	r7
c0d00876:	200f      	movs	r0, #15
c0d00878:	0140      	lsls	r0, r0, #5
c0d0087a:	1831      	adds	r1, r6, r0
c0d0087c:	4620      	mov	r0, r4
c0d0087e:	47b8      	blx	r7
c0d00880:	2079      	movs	r0, #121	; 0x79
c0d00882:	0080      	lsls	r0, r0, #2
c0d00884:	1831      	adds	r1, r6, r0
c0d00886:	4620      	mov	r0, r4
c0d00888:	47b8      	blx	r7
c0d0088a:	203d      	movs	r0, #61	; 0x3d
c0d0088c:	00c0      	lsls	r0, r0, #3
c0d0088e:	9002      	str	r0, [sp, #8]
c0d00890:	1831      	adds	r1, r6, r0
c0d00892:	4e33      	ldr	r6, [pc, #204]	; (c0d00960 <decode_handleAPDU+0x3d0>)
c0d00894:	447e      	add	r6, pc
c0d00896:	4620      	mov	r0, r4
c0d00898:	47b0      	blx	r6
c0d0089a:	207b      	movs	r0, #123	; 0x7b
c0d0089c:	0087      	lsls	r7, r0, #2
c0d0089e:	4826      	ldr	r0, [pc, #152]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d008a0:	19c1      	adds	r1, r0, r7
c0d008a2:	4620      	mov	r0, r4
c0d008a4:	47b0      	blx	r6
c0d008a6:	201f      	movs	r0, #31
c0d008a8:	0105      	lsls	r5, r0, #4
c0d008aa:	4823      	ldr	r0, [pc, #140]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d008ac:	1941      	adds	r1, r0, r5
c0d008ae:	4620      	mov	r0, r4
c0d008b0:	47b0      	blx	r6
c0d008b2:	4b21      	ldr	r3, [pc, #132]	; (c0d00938 <decode_handleAPDU+0x3a8>)
c0d008b4:	9804      	ldr	r0, [sp, #16]
c0d008b6:	5a18      	ldrh	r0, [r3, r0]
c0d008b8:	9906      	ldr	r1, [sp, #24]
c0d008ba:	4281      	cmp	r1, r0
c0d008bc:	d12a      	bne.n	c0d00914 <decode_handleAPDU+0x384>
c0d008be:	5958      	ldr	r0, [r3, r5]
c0d008c0:	59d9      	ldr	r1, [r3, r7]
c0d008c2:	9a02      	ldr	r2, [sp, #8]
c0d008c4:	589a      	ldr	r2, [r3, r2]
c0d008c6:	2a00      	cmp	r2, #0
c0d008c8:	9c01      	ldr	r4, [sp, #4]
c0d008ca:	d014      	beq.n	c0d008f6 <decode_handleAPDU+0x366>
c0d008cc:	2900      	cmp	r1, #0
c0d008ce:	d112      	bne.n	c0d008f6 <decode_handleAPDU+0x366>
c0d008d0:	2800      	cmp	r0, #0
c0d008d2:	d110      	bne.n	c0d008f6 <decode_handleAPDU+0x366>
c0d008d4:	9803      	ldr	r0, [sp, #12]
c0d008d6:	501c      	str	r4, [r3, r0]
c0d008d8:	f000 fa58 	bl	c0d00d8c <decodeRecordobtMemo_ui_runStep>
c0d008dc:	e699      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d008de:	2a00      	cmp	r2, #0
c0d008e0:	d118      	bne.n	c0d00914 <decode_handleAPDU+0x384>
c0d008e2:	2900      	cmp	r1, #0
c0d008e4:	d016      	beq.n	c0d00914 <decode_handleAPDU+0x384>
c0d008e6:	2800      	cmp	r0, #0
c0d008e8:	d014      	beq.n	c0d00914 <decode_handleAPDU+0x384>
c0d008ea:	20fa      	movs	r0, #250	; 0xfa
c0d008ec:	9903      	ldr	r1, [sp, #12]
c0d008ee:	5058      	str	r0, [r3, r1]
c0d008f0:	f000 f964 	bl	c0d00bbc <decodeNewfundsreqHash_ui_runStep>
c0d008f4:	e68d      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d008f6:	2a00      	cmp	r2, #0
c0d008f8:	d10c      	bne.n	c0d00914 <decode_handleAPDU+0x384>
c0d008fa:	2900      	cmp	r1, #0
c0d008fc:	d00a      	beq.n	c0d00914 <decode_handleAPDU+0x384>
c0d008fe:	2800      	cmp	r0, #0
c0d00900:	d008      	beq.n	c0d00914 <decode_handleAPDU+0x384>
c0d00902:	3432      	adds	r4, #50	; 0x32
c0d00904:	9803      	ldr	r0, [sp, #12]
c0d00906:	501c      	str	r4, [r3, r0]
c0d00908:	f000 fb54 	bl	c0d00fb4 <decodeRecordobtHash_ui_runStep>
c0d0090c:	e681      	b.n	c0d00612 <decode_handleAPDU+0x82>
c0d0090e:	4809      	ldr	r0, [pc, #36]	; (c0d00934 <decode_handleAPDU+0x3a4>)
c0d00910:	f002 f9a1 	bl	c0d02c56 <os_longjmp>
c0d00914:	4807      	ldr	r0, [pc, #28]	; (c0d00934 <decode_handleAPDU+0x3a4>)
c0d00916:	1c80      	adds	r0, r0, #2
c0d00918:	f002 f99d 	bl	c0d02c56 <os_longjmp>
c0d0091c:	4809      	ldr	r0, [pc, #36]	; (c0d00944 <decode_handleAPDU+0x3b4>)
c0d0091e:	f002 f99a 	bl	c0d02c56 <os_longjmp>
c0d00922:	4804      	ldr	r0, [pc, #16]	; (c0d00934 <decode_handleAPDU+0x3a4>)
c0d00924:	1c40      	adds	r0, r0, #1
c0d00926:	f002 f996 	bl	c0d02c56 <os_longjmp>
c0d0092a:	4802      	ldr	r0, [pc, #8]	; (c0d00934 <decode_handleAPDU+0x3a4>)
c0d0092c:	300b      	adds	r0, #11
c0d0092e:	f002 f992 	bl	c0d02c56 <os_longjmp>
c0d00932:	46c0      	nop			; (mov r8, r8)
c0d00934:	00006e05 	.word	0x00006e05
c0d00938:	20000518 	.word	0x20000518
c0d0093c:	00005ba0 	.word	0x00005ba0
c0d00940:	20000398 	.word	0x20000398
c0d00944:	00004711 	.word	0x00004711
c0d00948:	000073b9 	.word	0x000073b9
c0d0094c:	000073cb 	.word	0x000073cb
c0d00950:	000002a9 	.word	0x000002a9
c0d00954:	000002ad 	.word	0x000002ad
c0d00958:	0000736d 	.word	0x0000736d
c0d0095c:	00000141 	.word	0x00000141
c0d00960:	0000012d 	.word	0x0000012d
c0d00964:	000072ba 	.word	0x000072ba
c0d00968:	fffffab9 	.word	0xfffffab9
c0d0096c:	000072b1 	.word	0x000072b1
c0d00970:	000072b4 	.word	0x000072b4

c0d00974 <CHECK_STAGE>:
c0d00974:	b580      	push	{r7, lr}
c0d00976:	4904      	ldr	r1, [pc, #16]	; (c0d00988 <CHECK_STAGE+0x14>)
c0d00978:	7809      	ldrb	r1, [r1, #0]
c0d0097a:	4281      	cmp	r1, r0
c0d0097c:	d100      	bne.n	c0d00980 <CHECK_STAGE+0xc>
c0d0097e:	bd80      	pop	{r7, pc}
c0d00980:	4802      	ldr	r0, [pc, #8]	; (c0d0098c <CHECK_STAGE+0x18>)
c0d00982:	f002 f968 	bl	c0d02c56 <os_longjmp>
c0d00986:	46c0      	nop			; (mov r8, r8)
c0d00988:	20000518 	.word	0x20000518
c0d0098c:	00006e06 	.word	0x00006e06

c0d00990 <readStringWithLength>:
c0d00990:	b5b0      	push	{r4, r5, r7, lr}
c0d00992:	227c      	movs	r2, #124	; 0x7c
c0d00994:	4c09      	ldr	r4, [pc, #36]	; (c0d009bc <readStringWithLength+0x2c>)
c0d00996:	5aa2      	ldrh	r2, [r4, r2]
c0d00998:	6805      	ldr	r5, [r0, #0]
c0d0099a:	1c6b      	adds	r3, r5, #1
c0d0099c:	4293      	cmp	r3, r2
c0d0099e:	d80a      	bhi.n	c0d009b6 <readStringWithLength+0x26>
c0d009a0:	1964      	adds	r4, r4, r5
c0d009a2:	4625      	mov	r5, r4
c0d009a4:	3580      	adds	r5, #128	; 0x80
c0d009a6:	600d      	str	r5, [r1, #0]
c0d009a8:	2180      	movs	r1, #128	; 0x80
c0d009aa:	5c61      	ldrb	r1, [r4, r1]
c0d009ac:	1859      	adds	r1, r3, r1
c0d009ae:	6001      	str	r1, [r0, #0]
c0d009b0:	4291      	cmp	r1, r2
c0d009b2:	d800      	bhi.n	c0d009b6 <readStringWithLength+0x26>
c0d009b4:	bdb0      	pop	{r4, r5, r7, pc}
c0d009b6:	4802      	ldr	r0, [pc, #8]	; (c0d009c0 <readStringWithLength+0x30>)
c0d009b8:	f002 f94d 	bl	c0d02c56 <os_longjmp>
c0d009bc:	20000518 	.word	0x20000518
c0d009c0:	00006e07 	.word	0x00006e07

c0d009c4 <readOptionalStringWithLength>:
c0d009c4:	b5b0      	push	{r4, r5, r7, lr}
c0d009c6:	227c      	movs	r2, #124	; 0x7c
c0d009c8:	4b0b      	ldr	r3, [pc, #44]	; (c0d009f8 <readOptionalStringWithLength+0x34>)
c0d009ca:	5a9d      	ldrh	r5, [r3, r2]
c0d009cc:	6804      	ldr	r4, [r0, #0]
c0d009ce:	1c62      	adds	r2, r4, #1
c0d009d0:	42aa      	cmp	r2, r5
c0d009d2:	d80e      	bhi.n	c0d009f2 <readOptionalStringWithLength+0x2e>
c0d009d4:	191b      	adds	r3, r3, r4
c0d009d6:	2480      	movs	r4, #128	; 0x80
c0d009d8:	5d1b      	ldrb	r3, [r3, r4]
c0d009da:	2b00      	cmp	r3, #0
c0d009dc:	d005      	beq.n	c0d009ea <readOptionalStringWithLength+0x26>
c0d009de:	2b01      	cmp	r3, #1
c0d009e0:	d107      	bne.n	c0d009f2 <readOptionalStringWithLength+0x2e>
c0d009e2:	6002      	str	r2, [r0, #0]
c0d009e4:	f7ff ffd4 	bl	c0d00990 <readStringWithLength>
c0d009e8:	bdb0      	pop	{r4, r5, r7, pc}
c0d009ea:	2300      	movs	r3, #0
c0d009ec:	600b      	str	r3, [r1, #0]
c0d009ee:	6002      	str	r2, [r0, #0]
c0d009f0:	bdb0      	pop	{r4, r5, r7, pc}
c0d009f2:	4802      	ldr	r0, [pc, #8]	; (c0d009fc <readOptionalStringWithLength+0x38>)
c0d009f4:	f002 f92f 	bl	c0d02c56 <os_longjmp>
c0d009f8:	20000518 	.word	0x20000518
c0d009fc:	00006e07 	.word	0x00006e07

c0d00a00 <decodeNewfundsreqMemo_ui_runStep>:
c0d00a00:	b570      	push	{r4, r5, r6, lr}
c0d00a02:	2039      	movs	r0, #57	; 0x39
c0d00a04:	00c4      	lsls	r4, r0, #3
c0d00a06:	4d48      	ldr	r5, [pc, #288]	; (c0d00b28 <decodeNewfundsreqMemo_ui_runStep+0x128>)
c0d00a08:	5928      	ldr	r0, [r5, r4]
c0d00a0a:	28c8      	cmp	r0, #200	; 0xc8
c0d00a0c:	d01b      	beq.n	c0d00a46 <decodeNewfundsreqMemo_ui_runStep+0x46>
c0d00a0e:	28c9      	cmp	r0, #201	; 0xc9
c0d00a10:	d023      	beq.n	c0d00a5a <decodeNewfundsreqMemo_ui_runStep+0x5a>
c0d00a12:	28ca      	cmp	r0, #202	; 0xca
c0d00a14:	d02b      	beq.n	c0d00a6e <decodeNewfundsreqMemo_ui_runStep+0x6e>
c0d00a16:	28cb      	cmp	r0, #203	; 0xcb
c0d00a18:	d036      	beq.n	c0d00a88 <decodeNewfundsreqMemo_ui_runStep+0x88>
c0d00a1a:	28cc      	cmp	r0, #204	; 0xcc
c0d00a1c:	d041      	beq.n	c0d00aa2 <decodeNewfundsreqMemo_ui_runStep+0xa2>
c0d00a1e:	28cd      	cmp	r0, #205	; 0xcd
c0d00a20:	d04c      	beq.n	c0d00abc <decodeNewfundsreqMemo_ui_runStep+0xbc>
c0d00a22:	28ce      	cmp	r0, #206	; 0xce
c0d00a24:	d057      	beq.n	c0d00ad6 <decodeNewfundsreqMemo_ui_runStep+0xd6>
c0d00a26:	28cf      	cmp	r0, #207	; 0xcf
c0d00a28:	d069      	beq.n	c0d00afe <decodeNewfundsreqMemo_ui_runStep+0xfe>
c0d00a2a:	28d0      	cmp	r0, #208	; 0xd0
c0d00a2c:	d173      	bne.n	c0d00b16 <decodeNewfundsreqMemo_ui_runStep+0x116>
c0d00a2e:	2009      	movs	r0, #9
c0d00a30:	0300      	lsls	r0, r0, #12
c0d00a32:	2100      	movs	r1, #0
c0d00a34:	460a      	mov	r2, r1
c0d00a36:	f001 fd1f 	bl	c0d02478 <io_send_buf>
c0d00a3a:	f005 f8d9 	bl	c0d05bf0 <ui_displayBusy>
c0d00a3e:	2003      	movs	r0, #3
c0d00a40:	7028      	strb	r0, [r5, #0]
c0d00a42:	20d1      	movs	r0, #209	; 0xd1
c0d00a44:	e06d      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00a46:	483a      	ldr	r0, [pc, #232]	; (c0d00b30 <decodeNewfundsreqMemo_ui_runStep+0x130>)
c0d00a48:	4478      	add	r0, pc
c0d00a4a:	493a      	ldr	r1, [pc, #232]	; (c0d00b34 <decodeNewfundsreqMemo_ui_runStep+0x134>)
c0d00a4c:	4479      	add	r1, pc
c0d00a4e:	4a3a      	ldr	r2, [pc, #232]	; (c0d00b38 <decodeNewfundsreqMemo_ui_runStep+0x138>)
c0d00a50:	447a      	add	r2, pc
c0d00a52:	f004 ff71 	bl	c0d05938 <ui_displayPaginatedText>
c0d00a56:	20c9      	movs	r0, #201	; 0xc9
c0d00a58:	e063      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00a5a:	4838      	ldr	r0, [pc, #224]	; (c0d00b3c <decodeNewfundsreqMemo_ui_runStep+0x13c>)
c0d00a5c:	4478      	add	r0, pc
c0d00a5e:	4938      	ldr	r1, [pc, #224]	; (c0d00b40 <decodeNewfundsreqMemo_ui_runStep+0x140>)
c0d00a60:	4479      	add	r1, pc
c0d00a62:	4a38      	ldr	r2, [pc, #224]	; (c0d00b44 <decodeNewfundsreqMemo_ui_runStep+0x144>)
c0d00a64:	447a      	add	r2, pc
c0d00a66:	f004 ff67 	bl	c0d05938 <ui_displayPaginatedText>
c0d00a6a:	20ca      	movs	r0, #202	; 0xca
c0d00a6c:	e059      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00a6e:	2073      	movs	r0, #115	; 0x73
c0d00a70:	0080      	lsls	r0, r0, #2
c0d00a72:	5828      	ldr	r0, [r5, r0]
c0d00a74:	7802      	ldrb	r2, [r0, #0]
c0d00a76:	1c41      	adds	r1, r0, #1
c0d00a78:	4833      	ldr	r0, [pc, #204]	; (c0d00b48 <decodeNewfundsreqMemo_ui_runStep+0x148>)
c0d00a7a:	4478      	add	r0, pc
c0d00a7c:	4b33      	ldr	r3, [pc, #204]	; (c0d00b4c <decodeNewfundsreqMemo_ui_runStep+0x14c>)
c0d00a7e:	447b      	add	r3, pc
c0d00a80:	f005 faf6 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00a84:	20cb      	movs	r0, #203	; 0xcb
c0d00a86:	e04c      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00a88:	2075      	movs	r0, #117	; 0x75
c0d00a8a:	0080      	lsls	r0, r0, #2
c0d00a8c:	5828      	ldr	r0, [r5, r0]
c0d00a8e:	7802      	ldrb	r2, [r0, #0]
c0d00a90:	1c41      	adds	r1, r0, #1
c0d00a92:	482f      	ldr	r0, [pc, #188]	; (c0d00b50 <decodeNewfundsreqMemo_ui_runStep+0x150>)
c0d00a94:	4478      	add	r0, pc
c0d00a96:	4b2f      	ldr	r3, [pc, #188]	; (c0d00b54 <decodeNewfundsreqMemo_ui_runStep+0x154>)
c0d00a98:	447b      	add	r3, pc
c0d00a9a:	f005 fae9 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00a9e:	20cc      	movs	r0, #204	; 0xcc
c0d00aa0:	e03f      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00aa2:	203b      	movs	r0, #59	; 0x3b
c0d00aa4:	00c0      	lsls	r0, r0, #3
c0d00aa6:	5828      	ldr	r0, [r5, r0]
c0d00aa8:	7802      	ldrb	r2, [r0, #0]
c0d00aaa:	1c41      	adds	r1, r0, #1
c0d00aac:	482a      	ldr	r0, [pc, #168]	; (c0d00b58 <decodeNewfundsreqMemo_ui_runStep+0x158>)
c0d00aae:	4478      	add	r0, pc
c0d00ab0:	4b2a      	ldr	r3, [pc, #168]	; (c0d00b5c <decodeNewfundsreqMemo_ui_runStep+0x15c>)
c0d00ab2:	447b      	add	r3, pc
c0d00ab4:	f005 fadc 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00ab8:	20cd      	movs	r0, #205	; 0xcd
c0d00aba:	e032      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00abc:	2077      	movs	r0, #119	; 0x77
c0d00abe:	0080      	lsls	r0, r0, #2
c0d00ac0:	5828      	ldr	r0, [r5, r0]
c0d00ac2:	7802      	ldrb	r2, [r0, #0]
c0d00ac4:	1c41      	adds	r1, r0, #1
c0d00ac6:	4826      	ldr	r0, [pc, #152]	; (c0d00b60 <decodeNewfundsreqMemo_ui_runStep+0x160>)
c0d00ac8:	4478      	add	r0, pc
c0d00aca:	4b26      	ldr	r3, [pc, #152]	; (c0d00b64 <decodeNewfundsreqMemo_ui_runStep+0x164>)
c0d00acc:	447b      	add	r3, pc
c0d00ace:	f005 facf 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00ad2:	20ce      	movs	r0, #206	; 0xce
c0d00ad4:	e025      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00ad6:	203d      	movs	r0, #61	; 0x3d
c0d00ad8:	00c6      	lsls	r6, r0, #3
c0d00ada:	59a8      	ldr	r0, [r5, r6]
c0d00adc:	1e41      	subs	r1, r0, #1
c0d00ade:	4188      	sbcs	r0, r1
c0d00ae0:	4921      	ldr	r1, [pc, #132]	; (c0d00b68 <decodeNewfundsreqMemo_ui_runStep+0x168>)
c0d00ae2:	4479      	add	r1, pc
c0d00ae4:	f7ff fbbc 	bl	c0d00260 <assert>
c0d00ae8:	59a8      	ldr	r0, [r5, r6]
c0d00aea:	7802      	ldrb	r2, [r0, #0]
c0d00aec:	1c41      	adds	r1, r0, #1
c0d00aee:	481f      	ldr	r0, [pc, #124]	; (c0d00b6c <decodeNewfundsreqMemo_ui_runStep+0x16c>)
c0d00af0:	4478      	add	r0, pc
c0d00af2:	4b1f      	ldr	r3, [pc, #124]	; (c0d00b70 <decodeNewfundsreqMemo_ui_runStep+0x170>)
c0d00af4:	447b      	add	r3, pc
c0d00af6:	f005 fabb 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00afa:	20cf      	movs	r0, #207	; 0xcf
c0d00afc:	e011      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00afe:	481d      	ldr	r0, [pc, #116]	; (c0d00b74 <decodeNewfundsreqMemo_ui_runStep+0x174>)
c0d00b00:	4478      	add	r0, pc
c0d00b02:	491d      	ldr	r1, [pc, #116]	; (c0d00b78 <decodeNewfundsreqMemo_ui_runStep+0x178>)
c0d00b04:	4479      	add	r1, pc
c0d00b06:	4a1d      	ldr	r2, [pc, #116]	; (c0d00b7c <decodeNewfundsreqMemo_ui_runStep+0x17c>)
c0d00b08:	447a      	add	r2, pc
c0d00b0a:	4b1d      	ldr	r3, [pc, #116]	; (c0d00b80 <decodeNewfundsreqMemo_ui_runStep+0x180>)
c0d00b0c:	447b      	add	r3, pc
c0d00b0e:	f004 feb7 	bl	c0d05880 <ui_displayPrompt>
c0d00b12:	20d0      	movs	r0, #208	; 0xd0
c0d00b14:	e005      	b.n	c0d00b22 <decodeNewfundsreqMemo_ui_runStep+0x122>
c0d00b16:	2000      	movs	r0, #0
c0d00b18:	4904      	ldr	r1, [pc, #16]	; (c0d00b2c <decodeNewfundsreqMemo_ui_runStep+0x12c>)
c0d00b1a:	4479      	add	r1, pc
c0d00b1c:	f7ff fba0 	bl	c0d00260 <assert>
c0d00b20:	20c8      	movs	r0, #200	; 0xc8
c0d00b22:	5128      	str	r0, [r5, r4]
c0d00b24:	bd70      	pop	{r4, r5, r6, pc}
c0d00b26:	46c0      	nop			; (mov r8, r8)
c0d00b28:	20000518 	.word	0x20000518
c0d00b2c:	00006f8c 	.word	0x00006f8c
c0d00b30:	00007070 	.word	0x00007070
c0d00b34:	00006fc6 	.word	0x00006fc6
c0d00b38:	ffffffad 	.word	0xffffffad
c0d00b3c:	0000706c 	.word	0x0000706c
c0d00b40:	00007075 	.word	0x00007075
c0d00b44:	ffffff99 	.word	0xffffff99
c0d00b48:	00007078 	.word	0x00007078
c0d00b4c:	ffffff7f 	.word	0xffffff7f
c0d00b50:	00007073 	.word	0x00007073
c0d00b54:	ffffff65 	.word	0xffffff65
c0d00b58:	00007060 	.word	0x00007060
c0d00b5c:	ffffff4b 	.word	0xffffff4b
c0d00b60:	00007051 	.word	0x00007051
c0d00b64:	ffffff31 	.word	0xffffff31
c0d00b68:	00007042 	.word	0x00007042
c0d00b6c:	00007047 	.word	0x00007047
c0d00b70:	ffffff09 	.word	0xffffff09
c0d00b74:	0000703c 	.word	0x0000703c
c0d00b78:	00007040 	.word	0x00007040
c0d00b7c:	fffffef5 	.word	0xfffffef5
c0d00b80:	00000075 	.word	0x00000075

c0d00b84 <dh_respond_with_user_reject>:
c0d00b84:	b510      	push	{r4, lr}
c0d00b86:	2041      	movs	r0, #65	; 0x41
c0d00b88:	0084      	lsls	r4, r0, #2
c0d00b8a:	4809      	ldr	r0, [pc, #36]	; (c0d00bb0 <dh_respond_with_user_reject+0x2c>)
c0d00b8c:	4621      	mov	r1, r4
c0d00b8e:	f006 fd75 	bl	c0d0767c <explicit_bzero>
c0d00b92:	4808      	ldr	r0, [pc, #32]	; (c0d00bb4 <dh_respond_with_user_reject+0x30>)
c0d00b94:	3080      	adds	r0, #128	; 0x80
c0d00b96:	3440      	adds	r4, #64	; 0x40
c0d00b98:	4621      	mov	r1, r4
c0d00b9a:	f006 fd6f 	bl	c0d0767c <explicit_bzero>
c0d00b9e:	4806      	ldr	r0, [pc, #24]	; (c0d00bb8 <dh_respond_with_user_reject+0x34>)
c0d00ba0:	2100      	movs	r1, #0
c0d00ba2:	460a      	mov	r2, r1
c0d00ba4:	f001 fc68 	bl	c0d02478 <io_send_buf>
c0d00ba8:	f7ff fa76 	bl	c0d00098 <ui_idle>
c0d00bac:	bd10      	pop	{r4, pc}
c0d00bae:	46c0      	nop			; (mov r8, r8)
c0d00bb0:	20000398 	.word	0x20000398
c0d00bb4:	20000518 	.word	0x20000518
c0d00bb8:	00006e09 	.word	0x00006e09

c0d00bbc <decodeNewfundsreqHash_ui_runStep>:
c0d00bbc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00bbe:	2039      	movs	r0, #57	; 0x39
c0d00bc0:	00c4      	lsls	r4, r0, #3
c0d00bc2:	4d58      	ldr	r5, [pc, #352]	; (c0d00d24 <decodeNewfundsreqHash_ui_runStep+0x168>)
c0d00bc4:	5928      	ldr	r0, [r5, r4]
c0d00bc6:	28fa      	cmp	r0, #250	; 0xfa
c0d00bc8:	d027      	beq.n	c0d00c1a <decodeNewfundsreqHash_ui_runStep+0x5e>
c0d00bca:	28fb      	cmp	r0, #251	; 0xfb
c0d00bcc:	d02f      	beq.n	c0d00c2e <decodeNewfundsreqHash_ui_runStep+0x72>
c0d00bce:	28fc      	cmp	r0, #252	; 0xfc
c0d00bd0:	d037      	beq.n	c0d00c42 <decodeNewfundsreqHash_ui_runStep+0x86>
c0d00bd2:	28fd      	cmp	r0, #253	; 0xfd
c0d00bd4:	d042      	beq.n	c0d00c5c <decodeNewfundsreqHash_ui_runStep+0xa0>
c0d00bd6:	28fe      	cmp	r0, #254	; 0xfe
c0d00bd8:	d04d      	beq.n	c0d00c76 <decodeNewfundsreqHash_ui_runStep+0xba>
c0d00bda:	28ff      	cmp	r0, #255	; 0xff
c0d00bdc:	d058      	beq.n	c0d00c90 <decodeNewfundsreqHash_ui_runStep+0xd4>
c0d00bde:	2101      	movs	r1, #1
c0d00be0:	020e      	lsls	r6, r1, #8
c0d00be2:	42b0      	cmp	r0, r6
c0d00be4:	d062      	beq.n	c0d00cac <decodeNewfundsreqHash_ui_runStep+0xf0>
c0d00be6:	21ff      	movs	r1, #255	; 0xff
c0d00be8:	460a      	mov	r2, r1
c0d00bea:	3202      	adds	r2, #2
c0d00bec:	4290      	cmp	r0, r2
c0d00bee:	d071      	beq.n	c0d00cd4 <decodeNewfundsreqHash_ui_runStep+0x118>
c0d00bf0:	2281      	movs	r2, #129	; 0x81
c0d00bf2:	0052      	lsls	r2, r2, #1
c0d00bf4:	4290      	cmp	r0, r2
c0d00bf6:	d100      	bne.n	c0d00bfa <decodeNewfundsreqHash_ui_runStep+0x3e>
c0d00bf8:	e080      	b.n	c0d00cfc <decodeNewfundsreqHash_ui_runStep+0x140>
c0d00bfa:	3104      	adds	r1, #4
c0d00bfc:	4288      	cmp	r0, r1
c0d00bfe:	d000      	beq.n	c0d00c02 <decodeNewfundsreqHash_ui_runStep+0x46>
c0d00c00:	e088      	b.n	c0d00d14 <decodeNewfundsreqHash_ui_runStep+0x158>
c0d00c02:	2009      	movs	r0, #9
c0d00c04:	0300      	lsls	r0, r0, #12
c0d00c06:	2100      	movs	r1, #0
c0d00c08:	460a      	mov	r2, r1
c0d00c0a:	f001 fc35 	bl	c0d02478 <io_send_buf>
c0d00c0e:	f004 ffef 	bl	c0d05bf0 <ui_displayBusy>
c0d00c12:	2003      	movs	r0, #3
c0d00c14:	7028      	strb	r0, [r5, #0]
c0d00c16:	1d30      	adds	r0, r6, #4
c0d00c18:	e082      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c1a:	4844      	ldr	r0, [pc, #272]	; (c0d00d2c <decodeNewfundsreqHash_ui_runStep+0x170>)
c0d00c1c:	4478      	add	r0, pc
c0d00c1e:	4944      	ldr	r1, [pc, #272]	; (c0d00d30 <decodeNewfundsreqHash_ui_runStep+0x174>)
c0d00c20:	4479      	add	r1, pc
c0d00c22:	4a44      	ldr	r2, [pc, #272]	; (c0d00d34 <decodeNewfundsreqHash_ui_runStep+0x178>)
c0d00c24:	447a      	add	r2, pc
c0d00c26:	f004 fe87 	bl	c0d05938 <ui_displayPaginatedText>
c0d00c2a:	20fb      	movs	r0, #251	; 0xfb
c0d00c2c:	e078      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c2e:	4842      	ldr	r0, [pc, #264]	; (c0d00d38 <decodeNewfundsreqHash_ui_runStep+0x17c>)
c0d00c30:	4478      	add	r0, pc
c0d00c32:	4942      	ldr	r1, [pc, #264]	; (c0d00d3c <decodeNewfundsreqHash_ui_runStep+0x180>)
c0d00c34:	4479      	add	r1, pc
c0d00c36:	4a42      	ldr	r2, [pc, #264]	; (c0d00d40 <decodeNewfundsreqHash_ui_runStep+0x184>)
c0d00c38:	447a      	add	r2, pc
c0d00c3a:	f004 fe7d 	bl	c0d05938 <ui_displayPaginatedText>
c0d00c3e:	20fc      	movs	r0, #252	; 0xfc
c0d00c40:	e06e      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c42:	2073      	movs	r0, #115	; 0x73
c0d00c44:	0080      	lsls	r0, r0, #2
c0d00c46:	5828      	ldr	r0, [r5, r0]
c0d00c48:	7802      	ldrb	r2, [r0, #0]
c0d00c4a:	1c41      	adds	r1, r0, #1
c0d00c4c:	483d      	ldr	r0, [pc, #244]	; (c0d00d44 <decodeNewfundsreqHash_ui_runStep+0x188>)
c0d00c4e:	4478      	add	r0, pc
c0d00c50:	4b3d      	ldr	r3, [pc, #244]	; (c0d00d48 <decodeNewfundsreqHash_ui_runStep+0x18c>)
c0d00c52:	447b      	add	r3, pc
c0d00c54:	f005 fa0c 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00c58:	20fd      	movs	r0, #253	; 0xfd
c0d00c5a:	e061      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c5c:	2075      	movs	r0, #117	; 0x75
c0d00c5e:	0080      	lsls	r0, r0, #2
c0d00c60:	5828      	ldr	r0, [r5, r0]
c0d00c62:	7802      	ldrb	r2, [r0, #0]
c0d00c64:	1c41      	adds	r1, r0, #1
c0d00c66:	4839      	ldr	r0, [pc, #228]	; (c0d00d4c <decodeNewfundsreqHash_ui_runStep+0x190>)
c0d00c68:	4478      	add	r0, pc
c0d00c6a:	4b39      	ldr	r3, [pc, #228]	; (c0d00d50 <decodeNewfundsreqHash_ui_runStep+0x194>)
c0d00c6c:	447b      	add	r3, pc
c0d00c6e:	f005 f9ff 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00c72:	20fe      	movs	r0, #254	; 0xfe
c0d00c74:	e054      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c76:	203b      	movs	r0, #59	; 0x3b
c0d00c78:	00c0      	lsls	r0, r0, #3
c0d00c7a:	5828      	ldr	r0, [r5, r0]
c0d00c7c:	7802      	ldrb	r2, [r0, #0]
c0d00c7e:	1c41      	adds	r1, r0, #1
c0d00c80:	4834      	ldr	r0, [pc, #208]	; (c0d00d54 <decodeNewfundsreqHash_ui_runStep+0x198>)
c0d00c82:	4478      	add	r0, pc
c0d00c84:	4b34      	ldr	r3, [pc, #208]	; (c0d00d58 <decodeNewfundsreqHash_ui_runStep+0x19c>)
c0d00c86:	447b      	add	r3, pc
c0d00c88:	f005 f9f2 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00c8c:	20ff      	movs	r0, #255	; 0xff
c0d00c8e:	e047      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00c90:	2077      	movs	r0, #119	; 0x77
c0d00c92:	0080      	lsls	r0, r0, #2
c0d00c94:	5828      	ldr	r0, [r5, r0]
c0d00c96:	7802      	ldrb	r2, [r0, #0]
c0d00c98:	1c41      	adds	r1, r0, #1
c0d00c9a:	4830      	ldr	r0, [pc, #192]	; (c0d00d5c <decodeNewfundsreqHash_ui_runStep+0x1a0>)
c0d00c9c:	4478      	add	r0, pc
c0d00c9e:	4b30      	ldr	r3, [pc, #192]	; (c0d00d60 <decodeNewfundsreqHash_ui_runStep+0x1a4>)
c0d00ca0:	447b      	add	r3, pc
c0d00ca2:	f005 f9e5 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00ca6:	2001      	movs	r0, #1
c0d00ca8:	0200      	lsls	r0, r0, #8
c0d00caa:	e039      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00cac:	207b      	movs	r0, #123	; 0x7b
c0d00cae:	0087      	lsls	r7, r0, #2
c0d00cb0:	59e8      	ldr	r0, [r5, r7]
c0d00cb2:	1e41      	subs	r1, r0, #1
c0d00cb4:	4188      	sbcs	r0, r1
c0d00cb6:	492b      	ldr	r1, [pc, #172]	; (c0d00d64 <decodeNewfundsreqHash_ui_runStep+0x1a8>)
c0d00cb8:	4479      	add	r1, pc
c0d00cba:	f7ff fad1 	bl	c0d00260 <assert>
c0d00cbe:	59e8      	ldr	r0, [r5, r7]
c0d00cc0:	7802      	ldrb	r2, [r0, #0]
c0d00cc2:	1c41      	adds	r1, r0, #1
c0d00cc4:	4828      	ldr	r0, [pc, #160]	; (c0d00d68 <decodeNewfundsreqHash_ui_runStep+0x1ac>)
c0d00cc6:	4478      	add	r0, pc
c0d00cc8:	4b28      	ldr	r3, [pc, #160]	; (c0d00d6c <decodeNewfundsreqHash_ui_runStep+0x1b0>)
c0d00cca:	447b      	add	r3, pc
c0d00ccc:	f005 f9d0 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00cd0:	1c70      	adds	r0, r6, #1
c0d00cd2:	e025      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00cd4:	201f      	movs	r0, #31
c0d00cd6:	0107      	lsls	r7, r0, #4
c0d00cd8:	59e8      	ldr	r0, [r5, r7]
c0d00cda:	1e41      	subs	r1, r0, #1
c0d00cdc:	4188      	sbcs	r0, r1
c0d00cde:	4924      	ldr	r1, [pc, #144]	; (c0d00d70 <decodeNewfundsreqHash_ui_runStep+0x1b4>)
c0d00ce0:	4479      	add	r1, pc
c0d00ce2:	f7ff fabd 	bl	c0d00260 <assert>
c0d00ce6:	59e8      	ldr	r0, [r5, r7]
c0d00ce8:	7802      	ldrb	r2, [r0, #0]
c0d00cea:	1c41      	adds	r1, r0, #1
c0d00cec:	4821      	ldr	r0, [pc, #132]	; (c0d00d74 <decodeNewfundsreqHash_ui_runStep+0x1b8>)
c0d00cee:	4478      	add	r0, pc
c0d00cf0:	4b21      	ldr	r3, [pc, #132]	; (c0d00d78 <decodeNewfundsreqHash_ui_runStep+0x1bc>)
c0d00cf2:	447b      	add	r3, pc
c0d00cf4:	f005 f9bc 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00cf8:	1cb0      	adds	r0, r6, #2
c0d00cfa:	e011      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00cfc:	481f      	ldr	r0, [pc, #124]	; (c0d00d7c <decodeNewfundsreqHash_ui_runStep+0x1c0>)
c0d00cfe:	4478      	add	r0, pc
c0d00d00:	491f      	ldr	r1, [pc, #124]	; (c0d00d80 <decodeNewfundsreqHash_ui_runStep+0x1c4>)
c0d00d02:	4479      	add	r1, pc
c0d00d04:	4a1f      	ldr	r2, [pc, #124]	; (c0d00d84 <decodeNewfundsreqHash_ui_runStep+0x1c8>)
c0d00d06:	447a      	add	r2, pc
c0d00d08:	4b1f      	ldr	r3, [pc, #124]	; (c0d00d88 <decodeNewfundsreqHash_ui_runStep+0x1cc>)
c0d00d0a:	447b      	add	r3, pc
c0d00d0c:	f004 fdb8 	bl	c0d05880 <ui_displayPrompt>
c0d00d10:	1cf0      	adds	r0, r6, #3
c0d00d12:	e005      	b.n	c0d00d20 <decodeNewfundsreqHash_ui_runStep+0x164>
c0d00d14:	2000      	movs	r0, #0
c0d00d16:	4904      	ldr	r1, [pc, #16]	; (c0d00d28 <decodeNewfundsreqHash_ui_runStep+0x16c>)
c0d00d18:	4479      	add	r1, pc
c0d00d1a:	f7ff faa1 	bl	c0d00260 <assert>
c0d00d1e:	20fa      	movs	r0, #250	; 0xfa
c0d00d20:	5128      	str	r0, [r5, r4]
c0d00d22:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d00d24:	20000518 	.word	0x20000518
c0d00d28:	00006e35 	.word	0x00006e35
c0d00d2c:	00006e9c 	.word	0x00006e9c
c0d00d30:	00006df2 	.word	0x00006df2
c0d00d34:	ffffff95 	.word	0xffffff95
c0d00d38:	00006e98 	.word	0x00006e98
c0d00d3c:	00006ea1 	.word	0x00006ea1
c0d00d40:	ffffff81 	.word	0xffffff81
c0d00d44:	00006ea4 	.word	0x00006ea4
c0d00d48:	ffffff67 	.word	0xffffff67
c0d00d4c:	00006e9f 	.word	0x00006e9f
c0d00d50:	ffffff4d 	.word	0xffffff4d
c0d00d54:	00006e8c 	.word	0x00006e8c
c0d00d58:	ffffff33 	.word	0xffffff33
c0d00d5c:	00006e7d 	.word	0x00006e7d
c0d00d60:	ffffff19 	.word	0xffffff19
c0d00d64:	00006ea8 	.word	0x00006ea8
c0d00d68:	00006ead 	.word	0x00006ead
c0d00d6c:	fffffeef 	.word	0xfffffeef
c0d00d70:	00006e98 	.word	0x00006e98
c0d00d74:	00006e9d 	.word	0x00006e9d
c0d00d78:	fffffec7 	.word	0xfffffec7
c0d00d7c:	00006e3e 	.word	0x00006e3e
c0d00d80:	00006e42 	.word	0x00006e42
c0d00d84:	fffffeb3 	.word	0xfffffeb3
c0d00d88:	fffffe77 	.word	0xfffffe77

c0d00d8c <decodeRecordobtMemo_ui_runStep>:
c0d00d8c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00d8e:	2039      	movs	r0, #57	; 0x39
c0d00d90:	00c4      	lsls	r4, r0, #3
c0d00d92:	4d6b      	ldr	r5, [pc, #428]	; (c0d00f40 <decodeRecordobtMemo_ui_runStep+0x1b4>)
c0d00d94:	5928      	ldr	r0, [r5, r4]
c0d00d96:	214b      	movs	r1, #75	; 0x4b
c0d00d98:	008e      	lsls	r6, r1, #2
c0d00d9a:	42b0      	cmp	r0, r6
c0d00d9c:	d03a      	beq.n	c0d00e14 <decodeRecordobtMemo_ui_runStep+0x88>
c0d00d9e:	21ff      	movs	r1, #255	; 0xff
c0d00da0:	460a      	mov	r2, r1
c0d00da2:	322e      	adds	r2, #46	; 0x2e
c0d00da4:	4290      	cmp	r0, r2
c0d00da6:	d03f      	beq.n	c0d00e28 <decodeRecordobtMemo_ui_runStep+0x9c>
c0d00da8:	2297      	movs	r2, #151	; 0x97
c0d00daa:	0052      	lsls	r2, r2, #1
c0d00dac:	4290      	cmp	r0, r2
c0d00dae:	d045      	beq.n	c0d00e3c <decodeRecordobtMemo_ui_runStep+0xb0>
c0d00db0:	460a      	mov	r2, r1
c0d00db2:	3230      	adds	r2, #48	; 0x30
c0d00db4:	4290      	cmp	r0, r2
c0d00db6:	d04e      	beq.n	c0d00e56 <decodeRecordobtMemo_ui_runStep+0xca>
c0d00db8:	2213      	movs	r2, #19
c0d00dba:	0112      	lsls	r2, r2, #4
c0d00dbc:	4290      	cmp	r0, r2
c0d00dbe:	d057      	beq.n	c0d00e70 <decodeRecordobtMemo_ui_runStep+0xe4>
c0d00dc0:	460a      	mov	r2, r1
c0d00dc2:	3232      	adds	r2, #50	; 0x32
c0d00dc4:	4290      	cmp	r0, r2
c0d00dc6:	d060      	beq.n	c0d00e8a <decodeRecordobtMemo_ui_runStep+0xfe>
c0d00dc8:	2299      	movs	r2, #153	; 0x99
c0d00dca:	0052      	lsls	r2, r2, #1
c0d00dcc:	4290      	cmp	r0, r2
c0d00dce:	d069      	beq.n	c0d00ea4 <decodeRecordobtMemo_ui_runStep+0x118>
c0d00dd0:	460a      	mov	r2, r1
c0d00dd2:	3234      	adds	r2, #52	; 0x34
c0d00dd4:	4290      	cmp	r0, r2
c0d00dd6:	d072      	beq.n	c0d00ebe <decodeRecordobtMemo_ui_runStep+0x132>
c0d00dd8:	224d      	movs	r2, #77	; 0x4d
c0d00dda:	0092      	lsls	r2, r2, #2
c0d00ddc:	4290      	cmp	r0, r2
c0d00dde:	d07b      	beq.n	c0d00ed8 <decodeRecordobtMemo_ui_runStep+0x14c>
c0d00de0:	460a      	mov	r2, r1
c0d00de2:	3236      	adds	r2, #54	; 0x36
c0d00de4:	4290      	cmp	r0, r2
c0d00de6:	d100      	bne.n	c0d00dea <decodeRecordobtMemo_ui_runStep+0x5e>
c0d00de8:	e083      	b.n	c0d00ef2 <decodeRecordobtMemo_ui_runStep+0x166>
c0d00dea:	229b      	movs	r2, #155	; 0x9b
c0d00dec:	0052      	lsls	r2, r2, #1
c0d00dee:	4290      	cmp	r0, r2
c0d00df0:	d100      	bne.n	c0d00df4 <decodeRecordobtMemo_ui_runStep+0x68>
c0d00df2:	e092      	b.n	c0d00f1a <decodeRecordobtMemo_ui_runStep+0x18e>
c0d00df4:	3138      	adds	r1, #56	; 0x38
c0d00df6:	4288      	cmp	r0, r1
c0d00df8:	d000      	beq.n	c0d00dfc <decodeRecordobtMemo_ui_runStep+0x70>
c0d00dfa:	e09a      	b.n	c0d00f32 <decodeRecordobtMemo_ui_runStep+0x1a6>
c0d00dfc:	2009      	movs	r0, #9
c0d00dfe:	0300      	lsls	r0, r0, #12
c0d00e00:	2100      	movs	r1, #0
c0d00e02:	460a      	mov	r2, r1
c0d00e04:	f001 fb38 	bl	c0d02478 <io_send_buf>
c0d00e08:	f004 fef2 	bl	c0d05bf0 <ui_displayBusy>
c0d00e0c:	2003      	movs	r0, #3
c0d00e0e:	7028      	strb	r0, [r5, #0]
c0d00e10:	360c      	adds	r6, #12
c0d00e12:	e093      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e14:	484c      	ldr	r0, [pc, #304]	; (c0d00f48 <decodeRecordobtMemo_ui_runStep+0x1bc>)
c0d00e16:	4478      	add	r0, pc
c0d00e18:	494c      	ldr	r1, [pc, #304]	; (c0d00f4c <decodeRecordobtMemo_ui_runStep+0x1c0>)
c0d00e1a:	4479      	add	r1, pc
c0d00e1c:	4a4c      	ldr	r2, [pc, #304]	; (c0d00f50 <decodeRecordobtMemo_ui_runStep+0x1c4>)
c0d00e1e:	447a      	add	r2, pc
c0d00e20:	f004 fd8a 	bl	c0d05938 <ui_displayPaginatedText>
c0d00e24:	1c76      	adds	r6, r6, #1
c0d00e26:	e089      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e28:	484a      	ldr	r0, [pc, #296]	; (c0d00f54 <decodeRecordobtMemo_ui_runStep+0x1c8>)
c0d00e2a:	4478      	add	r0, pc
c0d00e2c:	494a      	ldr	r1, [pc, #296]	; (c0d00f58 <decodeRecordobtMemo_ui_runStep+0x1cc>)
c0d00e2e:	4479      	add	r1, pc
c0d00e30:	4a4a      	ldr	r2, [pc, #296]	; (c0d00f5c <decodeRecordobtMemo_ui_runStep+0x1d0>)
c0d00e32:	447a      	add	r2, pc
c0d00e34:	f004 fd80 	bl	c0d05938 <ui_displayPaginatedText>
c0d00e38:	1cb6      	adds	r6, r6, #2
c0d00e3a:	e07f      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e3c:	2073      	movs	r0, #115	; 0x73
c0d00e3e:	0080      	lsls	r0, r0, #2
c0d00e40:	5828      	ldr	r0, [r5, r0]
c0d00e42:	7802      	ldrb	r2, [r0, #0]
c0d00e44:	1c41      	adds	r1, r0, #1
c0d00e46:	4846      	ldr	r0, [pc, #280]	; (c0d00f60 <decodeRecordobtMemo_ui_runStep+0x1d4>)
c0d00e48:	4478      	add	r0, pc
c0d00e4a:	4b46      	ldr	r3, [pc, #280]	; (c0d00f64 <decodeRecordobtMemo_ui_runStep+0x1d8>)
c0d00e4c:	447b      	add	r3, pc
c0d00e4e:	f005 f90f 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00e52:	1cf6      	adds	r6, r6, #3
c0d00e54:	e072      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e56:	201d      	movs	r0, #29
c0d00e58:	0100      	lsls	r0, r0, #4
c0d00e5a:	5828      	ldr	r0, [r5, r0]
c0d00e5c:	7802      	ldrb	r2, [r0, #0]
c0d00e5e:	1c41      	adds	r1, r0, #1
c0d00e60:	4841      	ldr	r0, [pc, #260]	; (c0d00f68 <decodeRecordobtMemo_ui_runStep+0x1dc>)
c0d00e62:	4478      	add	r0, pc
c0d00e64:	4b41      	ldr	r3, [pc, #260]	; (c0d00f6c <decodeRecordobtMemo_ui_runStep+0x1e0>)
c0d00e66:	447b      	add	r3, pc
c0d00e68:	f005 f902 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00e6c:	1d36      	adds	r6, r6, #4
c0d00e6e:	e065      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e70:	2075      	movs	r0, #117	; 0x75
c0d00e72:	0080      	lsls	r0, r0, #2
c0d00e74:	5828      	ldr	r0, [r5, r0]
c0d00e76:	7802      	ldrb	r2, [r0, #0]
c0d00e78:	1c41      	adds	r1, r0, #1
c0d00e7a:	483d      	ldr	r0, [pc, #244]	; (c0d00f70 <decodeRecordobtMemo_ui_runStep+0x1e4>)
c0d00e7c:	4478      	add	r0, pc
c0d00e7e:	4b3d      	ldr	r3, [pc, #244]	; (c0d00f74 <decodeRecordobtMemo_ui_runStep+0x1e8>)
c0d00e80:	447b      	add	r3, pc
c0d00e82:	f005 f8f5 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00e86:	1d76      	adds	r6, r6, #5
c0d00e88:	e058      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00e8a:	203b      	movs	r0, #59	; 0x3b
c0d00e8c:	00c0      	lsls	r0, r0, #3
c0d00e8e:	5828      	ldr	r0, [r5, r0]
c0d00e90:	7802      	ldrb	r2, [r0, #0]
c0d00e92:	1c41      	adds	r1, r0, #1
c0d00e94:	4838      	ldr	r0, [pc, #224]	; (c0d00f78 <decodeRecordobtMemo_ui_runStep+0x1ec>)
c0d00e96:	4478      	add	r0, pc
c0d00e98:	4b38      	ldr	r3, [pc, #224]	; (c0d00f7c <decodeRecordobtMemo_ui_runStep+0x1f0>)
c0d00e9a:	447b      	add	r3, pc
c0d00e9c:	f005 f8e8 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00ea0:	1db6      	adds	r6, r6, #6
c0d00ea2:	e04b      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00ea4:	2077      	movs	r0, #119	; 0x77
c0d00ea6:	0080      	lsls	r0, r0, #2
c0d00ea8:	5828      	ldr	r0, [r5, r0]
c0d00eaa:	7802      	ldrb	r2, [r0, #0]
c0d00eac:	1c41      	adds	r1, r0, #1
c0d00eae:	4834      	ldr	r0, [pc, #208]	; (c0d00f80 <decodeRecordobtMemo_ui_runStep+0x1f4>)
c0d00eb0:	4478      	add	r0, pc
c0d00eb2:	4b34      	ldr	r3, [pc, #208]	; (c0d00f84 <decodeRecordobtMemo_ui_runStep+0x1f8>)
c0d00eb4:	447b      	add	r3, pc
c0d00eb6:	f005 f8db 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00eba:	1df6      	adds	r6, r6, #7
c0d00ebc:	e03e      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00ebe:	200f      	movs	r0, #15
c0d00ec0:	0140      	lsls	r0, r0, #5
c0d00ec2:	5828      	ldr	r0, [r5, r0]
c0d00ec4:	7802      	ldrb	r2, [r0, #0]
c0d00ec6:	1c41      	adds	r1, r0, #1
c0d00ec8:	482f      	ldr	r0, [pc, #188]	; (c0d00f88 <decodeRecordobtMemo_ui_runStep+0x1fc>)
c0d00eca:	4478      	add	r0, pc
c0d00ecc:	4b2f      	ldr	r3, [pc, #188]	; (c0d00f8c <decodeRecordobtMemo_ui_runStep+0x200>)
c0d00ece:	447b      	add	r3, pc
c0d00ed0:	f005 f8ce 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00ed4:	3608      	adds	r6, #8
c0d00ed6:	e031      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00ed8:	2079      	movs	r0, #121	; 0x79
c0d00eda:	0080      	lsls	r0, r0, #2
c0d00edc:	5828      	ldr	r0, [r5, r0]
c0d00ede:	7802      	ldrb	r2, [r0, #0]
c0d00ee0:	1c41      	adds	r1, r0, #1
c0d00ee2:	482b      	ldr	r0, [pc, #172]	; (c0d00f90 <decodeRecordobtMemo_ui_runStep+0x204>)
c0d00ee4:	4478      	add	r0, pc
c0d00ee6:	4b2b      	ldr	r3, [pc, #172]	; (c0d00f94 <decodeRecordobtMemo_ui_runStep+0x208>)
c0d00ee8:	447b      	add	r3, pc
c0d00eea:	f005 f8c1 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00eee:	3609      	adds	r6, #9
c0d00ef0:	e024      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00ef2:	203d      	movs	r0, #61	; 0x3d
c0d00ef4:	00c7      	lsls	r7, r0, #3
c0d00ef6:	59e8      	ldr	r0, [r5, r7]
c0d00ef8:	1e41      	subs	r1, r0, #1
c0d00efa:	4188      	sbcs	r0, r1
c0d00efc:	4926      	ldr	r1, [pc, #152]	; (c0d00f98 <decodeRecordobtMemo_ui_runStep+0x20c>)
c0d00efe:	4479      	add	r1, pc
c0d00f00:	f7ff f9ae 	bl	c0d00260 <assert>
c0d00f04:	59e8      	ldr	r0, [r5, r7]
c0d00f06:	7802      	ldrb	r2, [r0, #0]
c0d00f08:	1c41      	adds	r1, r0, #1
c0d00f0a:	4824      	ldr	r0, [pc, #144]	; (c0d00f9c <decodeRecordobtMemo_ui_runStep+0x210>)
c0d00f0c:	4478      	add	r0, pc
c0d00f0e:	4b24      	ldr	r3, [pc, #144]	; (c0d00fa0 <decodeRecordobtMemo_ui_runStep+0x214>)
c0d00f10:	447b      	add	r3, pc
c0d00f12:	f005 f8ad 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d00f16:	360a      	adds	r6, #10
c0d00f18:	e010      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00f1a:	4822      	ldr	r0, [pc, #136]	; (c0d00fa4 <decodeRecordobtMemo_ui_runStep+0x218>)
c0d00f1c:	4478      	add	r0, pc
c0d00f1e:	4922      	ldr	r1, [pc, #136]	; (c0d00fa8 <decodeRecordobtMemo_ui_runStep+0x21c>)
c0d00f20:	4479      	add	r1, pc
c0d00f22:	4a22      	ldr	r2, [pc, #136]	; (c0d00fac <decodeRecordobtMemo_ui_runStep+0x220>)
c0d00f24:	447a      	add	r2, pc
c0d00f26:	4b22      	ldr	r3, [pc, #136]	; (c0d00fb0 <decodeRecordobtMemo_ui_runStep+0x224>)
c0d00f28:	447b      	add	r3, pc
c0d00f2a:	f004 fca9 	bl	c0d05880 <ui_displayPrompt>
c0d00f2e:	360b      	adds	r6, #11
c0d00f30:	e004      	b.n	c0d00f3c <decodeRecordobtMemo_ui_runStep+0x1b0>
c0d00f32:	2000      	movs	r0, #0
c0d00f34:	4903      	ldr	r1, [pc, #12]	; (c0d00f44 <decodeRecordobtMemo_ui_runStep+0x1b8>)
c0d00f36:	4479      	add	r1, pc
c0d00f38:	f7ff f992 	bl	c0d00260 <assert>
c0d00f3c:	512e      	str	r6, [r5, r4]
c0d00f3e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d00f40:	20000518 	.word	0x20000518
c0d00f44:	00006c74 	.word	0x00006c74
c0d00f48:	00006ca2 	.word	0x00006ca2
c0d00f4c:	00006bf8 	.word	0x00006bf8
c0d00f50:	ffffff6b 	.word	0xffffff6b
c0d00f54:	00006c9e 	.word	0x00006c9e
c0d00f58:	00006d8f 	.word	0x00006d8f
c0d00f5c:	ffffff57 	.word	0xffffff57
c0d00f60:	00006caa 	.word	0x00006caa
c0d00f64:	ffffff3d 	.word	0xffffff3d
c0d00f68:	00006d97 	.word	0x00006d97
c0d00f6c:	ffffff23 	.word	0xffffff23
c0d00f70:	00006c8b 	.word	0x00006c8b
c0d00f74:	ffffff09 	.word	0xffffff09
c0d00f78:	00006c78 	.word	0x00006c78
c0d00f7c:	fffffeef 	.word	0xfffffeef
c0d00f80:	00006c69 	.word	0x00006c69
c0d00f84:	fffffed5 	.word	0xfffffed5
c0d00f88:	00006d44 	.word	0x00006d44
c0d00f8c:	fffffebb 	.word	0xfffffebb
c0d00f90:	00006d31 	.word	0x00006d31
c0d00f94:	fffffea1 	.word	0xfffffea1
c0d00f98:	00006d1e 	.word	0x00006d1e
c0d00f9c:	00006c2b 	.word	0x00006c2b
c0d00fa0:	fffffe79 	.word	0xfffffe79
c0d00fa4:	00006c20 	.word	0x00006c20
c0d00fa8:	00006c24 	.word	0x00006c24
c0d00fac:	fffffe65 	.word	0xfffffe65
c0d00fb0:	fffffc59 	.word	0xfffffc59

c0d00fb4 <decodeRecordobtHash_ui_runStep>:
c0d00fb4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d00fb6:	2039      	movs	r0, #57	; 0x39
c0d00fb8:	00c4      	lsls	r4, r0, #3
c0d00fba:	4d78      	ldr	r5, [pc, #480]	; (c0d0119c <decodeRecordobtHash_ui_runStep+0x1e8>)
c0d00fbc:	5928      	ldr	r0, [r5, r4]
c0d00fbe:	21af      	movs	r1, #175	; 0xaf
c0d00fc0:	004e      	lsls	r6, r1, #1
c0d00fc2:	42b0      	cmp	r0, r6
c0d00fc4:	d040      	beq.n	c0d01048 <decodeRecordobtHash_ui_runStep+0x94>
c0d00fc6:	21ff      	movs	r1, #255	; 0xff
c0d00fc8:	460a      	mov	r2, r1
c0d00fca:	3260      	adds	r2, #96	; 0x60
c0d00fcc:	4290      	cmp	r0, r2
c0d00fce:	d045      	beq.n	c0d0105c <decodeRecordobtHash_ui_runStep+0xa8>
c0d00fd0:	220b      	movs	r2, #11
c0d00fd2:	0152      	lsls	r2, r2, #5
c0d00fd4:	4290      	cmp	r0, r2
c0d00fd6:	d04b      	beq.n	c0d01070 <decodeRecordobtHash_ui_runStep+0xbc>
c0d00fd8:	460a      	mov	r2, r1
c0d00fda:	3262      	adds	r2, #98	; 0x62
c0d00fdc:	4290      	cmp	r0, r2
c0d00fde:	d054      	beq.n	c0d0108a <decodeRecordobtHash_ui_runStep+0xd6>
c0d00fe0:	22b1      	movs	r2, #177	; 0xb1
c0d00fe2:	0052      	lsls	r2, r2, #1
c0d00fe4:	4290      	cmp	r0, r2
c0d00fe6:	d05d      	beq.n	c0d010a4 <decodeRecordobtHash_ui_runStep+0xf0>
c0d00fe8:	460a      	mov	r2, r1
c0d00fea:	3264      	adds	r2, #100	; 0x64
c0d00fec:	4290      	cmp	r0, r2
c0d00fee:	d066      	beq.n	c0d010be <decodeRecordobtHash_ui_runStep+0x10a>
c0d00ff0:	2259      	movs	r2, #89	; 0x59
c0d00ff2:	0092      	lsls	r2, r2, #2
c0d00ff4:	4290      	cmp	r0, r2
c0d00ff6:	d06f      	beq.n	c0d010d8 <decodeRecordobtHash_ui_runStep+0x124>
c0d00ff8:	460a      	mov	r2, r1
c0d00ffa:	3266      	adds	r2, #102	; 0x66
c0d00ffc:	4290      	cmp	r0, r2
c0d00ffe:	d078      	beq.n	c0d010f2 <decodeRecordobtHash_ui_runStep+0x13e>
c0d01000:	22b3      	movs	r2, #179	; 0xb3
c0d01002:	0052      	lsls	r2, r2, #1
c0d01004:	4290      	cmp	r0, r2
c0d01006:	d100      	bne.n	c0d0100a <decodeRecordobtHash_ui_runStep+0x56>
c0d01008:	e080      	b.n	c0d0110c <decodeRecordobtHash_ui_runStep+0x158>
c0d0100a:	460a      	mov	r2, r1
c0d0100c:	3268      	adds	r2, #104	; 0x68
c0d0100e:	4290      	cmp	r0, r2
c0d01010:	d100      	bne.n	c0d01014 <decodeRecordobtHash_ui_runStep+0x60>
c0d01012:	e088      	b.n	c0d01126 <decodeRecordobtHash_ui_runStep+0x172>
c0d01014:	222d      	movs	r2, #45	; 0x2d
c0d01016:	00d2      	lsls	r2, r2, #3
c0d01018:	4290      	cmp	r0, r2
c0d0101a:	d100      	bne.n	c0d0101e <decodeRecordobtHash_ui_runStep+0x6a>
c0d0101c:	e097      	b.n	c0d0114e <decodeRecordobtHash_ui_runStep+0x19a>
c0d0101e:	316a      	adds	r1, #106	; 0x6a
c0d01020:	4288      	cmp	r0, r1
c0d01022:	d100      	bne.n	c0d01026 <decodeRecordobtHash_ui_runStep+0x72>
c0d01024:	e0a7      	b.n	c0d01176 <decodeRecordobtHash_ui_runStep+0x1c2>
c0d01026:	21b5      	movs	r1, #181	; 0xb5
c0d01028:	0049      	lsls	r1, r1, #1
c0d0102a:	4288      	cmp	r0, r1
c0d0102c:	d000      	beq.n	c0d01030 <decodeRecordobtHash_ui_runStep+0x7c>
c0d0102e:	e0ae      	b.n	c0d0118e <decodeRecordobtHash_ui_runStep+0x1da>
c0d01030:	2009      	movs	r0, #9
c0d01032:	0300      	lsls	r0, r0, #12
c0d01034:	2100      	movs	r1, #0
c0d01036:	460a      	mov	r2, r1
c0d01038:	f001 fa1e 	bl	c0d02478 <io_send_buf>
c0d0103c:	f004 fdd8 	bl	c0d05bf0 <ui_displayBusy>
c0d01040:	2003      	movs	r0, #3
c0d01042:	7028      	strb	r0, [r5, #0]
c0d01044:	360d      	adds	r6, #13
c0d01046:	e0a7      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d01048:	4856      	ldr	r0, [pc, #344]	; (c0d011a4 <decodeRecordobtHash_ui_runStep+0x1f0>)
c0d0104a:	4478      	add	r0, pc
c0d0104c:	4956      	ldr	r1, [pc, #344]	; (c0d011a8 <decodeRecordobtHash_ui_runStep+0x1f4>)
c0d0104e:	4479      	add	r1, pc
c0d01050:	4a56      	ldr	r2, [pc, #344]	; (c0d011ac <decodeRecordobtHash_ui_runStep+0x1f8>)
c0d01052:	447a      	add	r2, pc
c0d01054:	f004 fc70 	bl	c0d05938 <ui_displayPaginatedText>
c0d01058:	1c76      	adds	r6, r6, #1
c0d0105a:	e09d      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d0105c:	4854      	ldr	r0, [pc, #336]	; (c0d011b0 <decodeRecordobtHash_ui_runStep+0x1fc>)
c0d0105e:	4478      	add	r0, pc
c0d01060:	4954      	ldr	r1, [pc, #336]	; (c0d011b4 <decodeRecordobtHash_ui_runStep+0x200>)
c0d01062:	4479      	add	r1, pc
c0d01064:	4a54      	ldr	r2, [pc, #336]	; (c0d011b8 <decodeRecordobtHash_ui_runStep+0x204>)
c0d01066:	447a      	add	r2, pc
c0d01068:	f004 fc66 	bl	c0d05938 <ui_displayPaginatedText>
c0d0106c:	1cb6      	adds	r6, r6, #2
c0d0106e:	e093      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d01070:	2073      	movs	r0, #115	; 0x73
c0d01072:	0080      	lsls	r0, r0, #2
c0d01074:	5828      	ldr	r0, [r5, r0]
c0d01076:	7802      	ldrb	r2, [r0, #0]
c0d01078:	1c41      	adds	r1, r0, #1
c0d0107a:	4850      	ldr	r0, [pc, #320]	; (c0d011bc <decodeRecordobtHash_ui_runStep+0x208>)
c0d0107c:	4478      	add	r0, pc
c0d0107e:	4b50      	ldr	r3, [pc, #320]	; (c0d011c0 <decodeRecordobtHash_ui_runStep+0x20c>)
c0d01080:	447b      	add	r3, pc
c0d01082:	f004 fff5 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d01086:	1cf6      	adds	r6, r6, #3
c0d01088:	e086      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d0108a:	201d      	movs	r0, #29
c0d0108c:	0100      	lsls	r0, r0, #4
c0d0108e:	5828      	ldr	r0, [r5, r0]
c0d01090:	7802      	ldrb	r2, [r0, #0]
c0d01092:	1c41      	adds	r1, r0, #1
c0d01094:	484b      	ldr	r0, [pc, #300]	; (c0d011c4 <decodeRecordobtHash_ui_runStep+0x210>)
c0d01096:	4478      	add	r0, pc
c0d01098:	4b4b      	ldr	r3, [pc, #300]	; (c0d011c8 <decodeRecordobtHash_ui_runStep+0x214>)
c0d0109a:	447b      	add	r3, pc
c0d0109c:	f004 ffe8 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d010a0:	1d36      	adds	r6, r6, #4
c0d010a2:	e079      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d010a4:	2075      	movs	r0, #117	; 0x75
c0d010a6:	0080      	lsls	r0, r0, #2
c0d010a8:	5828      	ldr	r0, [r5, r0]
c0d010aa:	7802      	ldrb	r2, [r0, #0]
c0d010ac:	1c41      	adds	r1, r0, #1
c0d010ae:	4847      	ldr	r0, [pc, #284]	; (c0d011cc <decodeRecordobtHash_ui_runStep+0x218>)
c0d010b0:	4478      	add	r0, pc
c0d010b2:	4b47      	ldr	r3, [pc, #284]	; (c0d011d0 <decodeRecordobtHash_ui_runStep+0x21c>)
c0d010b4:	447b      	add	r3, pc
c0d010b6:	f004 ffdb 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d010ba:	1d76      	adds	r6, r6, #5
c0d010bc:	e06c      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d010be:	203b      	movs	r0, #59	; 0x3b
c0d010c0:	00c0      	lsls	r0, r0, #3
c0d010c2:	5828      	ldr	r0, [r5, r0]
c0d010c4:	7802      	ldrb	r2, [r0, #0]
c0d010c6:	1c41      	adds	r1, r0, #1
c0d010c8:	4842      	ldr	r0, [pc, #264]	; (c0d011d4 <decodeRecordobtHash_ui_runStep+0x220>)
c0d010ca:	4478      	add	r0, pc
c0d010cc:	4b42      	ldr	r3, [pc, #264]	; (c0d011d8 <decodeRecordobtHash_ui_runStep+0x224>)
c0d010ce:	447b      	add	r3, pc
c0d010d0:	f004 ffce 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d010d4:	1db6      	adds	r6, r6, #6
c0d010d6:	e05f      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d010d8:	2077      	movs	r0, #119	; 0x77
c0d010da:	0080      	lsls	r0, r0, #2
c0d010dc:	5828      	ldr	r0, [r5, r0]
c0d010de:	7802      	ldrb	r2, [r0, #0]
c0d010e0:	1c41      	adds	r1, r0, #1
c0d010e2:	483e      	ldr	r0, [pc, #248]	; (c0d011dc <decodeRecordobtHash_ui_runStep+0x228>)
c0d010e4:	4478      	add	r0, pc
c0d010e6:	4b3e      	ldr	r3, [pc, #248]	; (c0d011e0 <decodeRecordobtHash_ui_runStep+0x22c>)
c0d010e8:	447b      	add	r3, pc
c0d010ea:	f004 ffc1 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d010ee:	1df6      	adds	r6, r6, #7
c0d010f0:	e052      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d010f2:	200f      	movs	r0, #15
c0d010f4:	0140      	lsls	r0, r0, #5
c0d010f6:	5828      	ldr	r0, [r5, r0]
c0d010f8:	7802      	ldrb	r2, [r0, #0]
c0d010fa:	1c41      	adds	r1, r0, #1
c0d010fc:	4839      	ldr	r0, [pc, #228]	; (c0d011e4 <decodeRecordobtHash_ui_runStep+0x230>)
c0d010fe:	4478      	add	r0, pc
c0d01100:	4b39      	ldr	r3, [pc, #228]	; (c0d011e8 <decodeRecordobtHash_ui_runStep+0x234>)
c0d01102:	447b      	add	r3, pc
c0d01104:	f004 ffb4 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d01108:	3608      	adds	r6, #8
c0d0110a:	e045      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d0110c:	2079      	movs	r0, #121	; 0x79
c0d0110e:	0080      	lsls	r0, r0, #2
c0d01110:	5828      	ldr	r0, [r5, r0]
c0d01112:	7802      	ldrb	r2, [r0, #0]
c0d01114:	1c41      	adds	r1, r0, #1
c0d01116:	4835      	ldr	r0, [pc, #212]	; (c0d011ec <decodeRecordobtHash_ui_runStep+0x238>)
c0d01118:	4478      	add	r0, pc
c0d0111a:	4b35      	ldr	r3, [pc, #212]	; (c0d011f0 <decodeRecordobtHash_ui_runStep+0x23c>)
c0d0111c:	447b      	add	r3, pc
c0d0111e:	f004 ffa7 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d01122:	3609      	adds	r6, #9
c0d01124:	e038      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d01126:	207b      	movs	r0, #123	; 0x7b
c0d01128:	0087      	lsls	r7, r0, #2
c0d0112a:	59e8      	ldr	r0, [r5, r7]
c0d0112c:	1e41      	subs	r1, r0, #1
c0d0112e:	4188      	sbcs	r0, r1
c0d01130:	4930      	ldr	r1, [pc, #192]	; (c0d011f4 <decodeRecordobtHash_ui_runStep+0x240>)
c0d01132:	4479      	add	r1, pc
c0d01134:	f7ff f894 	bl	c0d00260 <assert>
c0d01138:	59e8      	ldr	r0, [r5, r7]
c0d0113a:	7802      	ldrb	r2, [r0, #0]
c0d0113c:	1c41      	adds	r1, r0, #1
c0d0113e:	482e      	ldr	r0, [pc, #184]	; (c0d011f8 <decodeRecordobtHash_ui_runStep+0x244>)
c0d01140:	4478      	add	r0, pc
c0d01142:	4b2e      	ldr	r3, [pc, #184]	; (c0d011fc <decodeRecordobtHash_ui_runStep+0x248>)
c0d01144:	447b      	add	r3, pc
c0d01146:	f004 ff93 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d0114a:	360a      	adds	r6, #10
c0d0114c:	e024      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d0114e:	201f      	movs	r0, #31
c0d01150:	0107      	lsls	r7, r0, #4
c0d01152:	59e8      	ldr	r0, [r5, r7]
c0d01154:	1e41      	subs	r1, r0, #1
c0d01156:	4188      	sbcs	r0, r1
c0d01158:	4929      	ldr	r1, [pc, #164]	; (c0d01200 <decodeRecordobtHash_ui_runStep+0x24c>)
c0d0115a:	4479      	add	r1, pc
c0d0115c:	f7ff f880 	bl	c0d00260 <assert>
c0d01160:	59e8      	ldr	r0, [r5, r7]
c0d01162:	7802      	ldrb	r2, [r0, #0]
c0d01164:	1c41      	adds	r1, r0, #1
c0d01166:	4827      	ldr	r0, [pc, #156]	; (c0d01204 <decodeRecordobtHash_ui_runStep+0x250>)
c0d01168:	4478      	add	r0, pc
c0d0116a:	4b27      	ldr	r3, [pc, #156]	; (c0d01208 <decodeRecordobtHash_ui_runStep+0x254>)
c0d0116c:	447b      	add	r3, pc
c0d0116e:	f004 ff7f 	bl	c0d06070 <ui_displayAsciiBufferScreen>
c0d01172:	360b      	adds	r6, #11
c0d01174:	e010      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d01176:	4825      	ldr	r0, [pc, #148]	; (c0d0120c <decodeRecordobtHash_ui_runStep+0x258>)
c0d01178:	4478      	add	r0, pc
c0d0117a:	4925      	ldr	r1, [pc, #148]	; (c0d01210 <decodeRecordobtHash_ui_runStep+0x25c>)
c0d0117c:	4479      	add	r1, pc
c0d0117e:	4a25      	ldr	r2, [pc, #148]	; (c0d01214 <decodeRecordobtHash_ui_runStep+0x260>)
c0d01180:	447a      	add	r2, pc
c0d01182:	4b25      	ldr	r3, [pc, #148]	; (c0d01218 <decodeRecordobtHash_ui_runStep+0x264>)
c0d01184:	447b      	add	r3, pc
c0d01186:	f004 fb7b 	bl	c0d05880 <ui_displayPrompt>
c0d0118a:	360c      	adds	r6, #12
c0d0118c:	e004      	b.n	c0d01198 <decodeRecordobtHash_ui_runStep+0x1e4>
c0d0118e:	2000      	movs	r0, #0
c0d01190:	4903      	ldr	r1, [pc, #12]	; (c0d011a0 <decodeRecordobtHash_ui_runStep+0x1ec>)
c0d01192:	4479      	add	r1, pc
c0d01194:	f7ff f864 	bl	c0d00260 <assert>
c0d01198:	512e      	str	r6, [r5, r4]
c0d0119a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d0119c:	20000518 	.word	0x20000518
c0d011a0:	00006a9d 	.word	0x00006a9d
c0d011a4:	00006a6e 	.word	0x00006a6e
c0d011a8:	000069c4 	.word	0x000069c4
c0d011ac:	ffffff5f 	.word	0xffffff5f
c0d011b0:	00006a6a 	.word	0x00006a6a
c0d011b4:	00006b5b 	.word	0x00006b5b
c0d011b8:	ffffff4b 	.word	0xffffff4b
c0d011bc:	00006a76 	.word	0x00006a76
c0d011c0:	ffffff31 	.word	0xffffff31
c0d011c4:	00006b63 	.word	0x00006b63
c0d011c8:	ffffff17 	.word	0xffffff17
c0d011cc:	00006a57 	.word	0x00006a57
c0d011d0:	fffffefd 	.word	0xfffffefd
c0d011d4:	00006a44 	.word	0x00006a44
c0d011d8:	fffffee3 	.word	0xfffffee3
c0d011dc:	00006a35 	.word	0x00006a35
c0d011e0:	fffffec9 	.word	0xfffffec9
c0d011e4:	00006b10 	.word	0x00006b10
c0d011e8:	fffffeaf 	.word	0xfffffeaf
c0d011ec:	00006afd 	.word	0x00006afd
c0d011f0:	fffffe95 	.word	0xfffffe95
c0d011f4:	00006b10 	.word	0x00006b10
c0d011f8:	00006a33 	.word	0x00006a33
c0d011fc:	fffffe6d 	.word	0xfffffe6d
c0d01200:	00006afb 	.word	0x00006afb
c0d01204:	00006a23 	.word	0x00006a23
c0d01208:	fffffe45 	.word	0xfffffe45
c0d0120c:	000069c4 	.word	0x000069c4
c0d01210:	000069c8 	.word	0x000069c8
c0d01214:	fffffe31 	.word	0xfffffe31
c0d01218:	fffff9fd 	.word	0xfffff9fd

c0d0121c <dh_init_aes_key>:
c0d0121c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0121e:	b0ff      	sub	sp, #508	; 0x1fc
c0d01220:	b084      	sub	sp, #16
c0d01222:	4614      	mov	r4, r2
c0d01224:	460d      	mov	r5, r1
c0d01226:	4607      	mov	r7, r0
c0d01228:	ae11      	add	r6, sp, #68	; 0x44
c0d0122a:	4630      	mov	r0, r6
c0d0122c:	f006 fb4a 	bl	c0d078c4 <setjmp>
c0d01230:	85b0      	strh	r0, [r6, #44]	; 0x2c
c0d01232:	0400      	lsls	r0, r0, #16
c0d01234:	d000      	beq.n	c0d01238 <dh_init_aes_key+0x1c>
c0d01236:	e09a      	b.n	c0d0136e <dh_init_aes_key+0x152>
c0d01238:	a811      	add	r0, sp, #68	; 0x44
c0d0123a:	f004 f969 	bl	c0d05510 <try_context_set>
c0d0123e:	901b      	str	r0, [sp, #108]	; 0x6c
c0d01240:	9710      	str	r7, [sp, #64]	; 0x40
c0d01242:	af45      	add	r7, sp, #276	; 0x114
c0d01244:	4628      	mov	r0, r5
c0d01246:	4639      	mov	r1, r7
c0d01248:	f001 fc56 	bl	c0d02af8 <derivePrivateKey>
c0d0124c:	6863      	ldr	r3, [r4, #4]
c0d0124e:	2020      	movs	r0, #32
c0d01250:	900f      	str	r0, [sp, #60]	; 0x3c
c0d01252:	9001      	str	r0, [sp, #4]
c0d01254:	a83d      	add	r0, sp, #244	; 0xf4
c0d01256:	9007      	str	r0, [sp, #28]
c0d01258:	9000      	str	r0, [sp, #0]
c0d0125a:	2001      	movs	r0, #1
c0d0125c:	0341      	lsls	r1, r0, #13
c0d0125e:	4605      	mov	r5, r0
c0d01260:	3408      	adds	r4, #8
c0d01262:	4638      	mov	r0, r7
c0d01264:	4622      	mov	r2, r4
c0d01266:	f7ff f92f 	bl	c0d004c8 <cx_ecdh_no_throw>
c0d0126a:	4241      	negs	r1, r0
c0d0126c:	4148      	adcs	r0, r1
c0d0126e:	4951      	ldr	r1, [pc, #324]	; (c0d013b4 <dh_init_aes_key+0x198>)
c0d01270:	4479      	add	r1, pc
c0d01272:	4c51      	ldr	r4, [pc, #324]	; (c0d013b8 <dh_init_aes_key+0x19c>)
c0d01274:	447c      	add	r4, pc
c0d01276:	47a0      	blx	r4
c0d01278:	4950      	ldr	r1, [pc, #320]	; (c0d013bc <dh_init_aes_key+0x1a0>)
c0d0127a:	4479      	add	r1, pc
c0d0127c:	910e      	str	r1, [sp, #56]	; 0x38
c0d0127e:	4628      	mov	r0, r5
c0d01280:	47a0      	blx	r4
c0d01282:	494f      	ldr	r1, [pc, #316]	; (c0d013c0 <dh_init_aes_key+0x1a4>)
c0d01284:	4479      	add	r1, pc
c0d01286:	910d      	str	r1, [sp, #52]	; 0x34
c0d01288:	4628      	mov	r0, r5
c0d0128a:	9505      	str	r5, [sp, #20]
c0d0128c:	47a0      	blx	r4
c0d0128e:	ae4f      	add	r6, sp, #316	; 0x13c
c0d01290:	1d30      	adds	r0, r6, #4
c0d01292:	9006      	str	r0, [sp, #24]
c0d01294:	f7ff f96c 	bl	c0d00570 <cx_sha512_init_no_throw>
c0d01298:	4845      	ldr	r0, [pc, #276]	; (c0d013b0 <dh_init_aes_key+0x194>)
c0d0129a:	8030      	strh	r0, [r6, #0]
c0d0129c:	4949      	ldr	r1, [pc, #292]	; (c0d013c4 <dh_init_aes_key+0x1a8>)
c0d0129e:	4479      	add	r1, pc
c0d012a0:	910c      	str	r1, [sp, #48]	; 0x30
c0d012a2:	4628      	mov	r0, r5
c0d012a4:	47a0      	blx	r4
c0d012a6:	2700      	movs	r7, #0
c0d012a8:	9700      	str	r7, [sp, #0]
c0d012aa:	9701      	str	r7, [sp, #4]
c0d012ac:	4d46      	ldr	r5, [pc, #280]	; (c0d013c8 <dh_init_aes_key+0x1ac>)
c0d012ae:	447d      	add	r5, pc
c0d012b0:	9806      	ldr	r0, [sp, #24]
c0d012b2:	4639      	mov	r1, r7
c0d012b4:	9a07      	ldr	r2, [sp, #28]
c0d012b6:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
c0d012b8:	47a8      	blx	r5
c0d012ba:	9509      	str	r5, [sp, #36]	; 0x24
c0d012bc:	8830      	ldrh	r0, [r6, #0]
c0d012be:	493c      	ldr	r1, [pc, #240]	; (c0d013b0 <dh_init_aes_key+0x194>)
c0d012c0:	1a41      	subs	r1, r0, r1
c0d012c2:	4248      	negs	r0, r1
c0d012c4:	4148      	adcs	r0, r1
c0d012c6:	4941      	ldr	r1, [pc, #260]	; (c0d013cc <dh_init_aes_key+0x1b0>)
c0d012c8:	4479      	add	r1, pc
c0d012ca:	910b      	str	r1, [sp, #44]	; 0x2c
c0d012cc:	47a0      	blx	r4
c0d012ce:	4940      	ldr	r1, [pc, #256]	; (c0d013d0 <dh_init_aes_key+0x1b4>)
c0d012d0:	4479      	add	r1, pc
c0d012d2:	910a      	str	r1, [sp, #40]	; 0x28
c0d012d4:	9e05      	ldr	r6, [sp, #20]
c0d012d6:	4630      	mov	r0, r6
c0d012d8:	47a0      	blx	r4
c0d012da:	2040      	movs	r0, #64	; 0x40
c0d012dc:	9008      	str	r0, [sp, #32]
c0d012de:	9001      	str	r0, [sp, #4]
c0d012e0:	a82d      	add	r0, sp, #180	; 0xb4
c0d012e2:	9004      	str	r0, [sp, #16]
c0d012e4:	9000      	str	r0, [sp, #0]
c0d012e6:	9806      	ldr	r0, [sp, #24]
c0d012e8:	4631      	mov	r1, r6
c0d012ea:	463a      	mov	r2, r7
c0d012ec:	463b      	mov	r3, r7
c0d012ee:	47a8      	blx	r5
c0d012f0:	4630      	mov	r0, r6
c0d012f2:	990e      	ldr	r1, [sp, #56]	; 0x38
c0d012f4:	47a0      	blx	r4
c0d012f6:	4630      	mov	r0, r6
c0d012f8:	990d      	ldr	r1, [sp, #52]	; 0x34
c0d012fa:	47a0      	blx	r4
c0d012fc:	ad4f      	add	r5, sp, #316	; 0x13c
c0d012fe:	1d2e      	adds	r6, r5, #4
c0d01300:	4630      	mov	r0, r6
c0d01302:	9603      	str	r6, [sp, #12]
c0d01304:	f7ff f934 	bl	c0d00570 <cx_sha512_init_no_throw>
c0d01308:	4829      	ldr	r0, [pc, #164]	; (c0d013b0 <dh_init_aes_key+0x194>)
c0d0130a:	8028      	strh	r0, [r5, #0]
c0d0130c:	9805      	ldr	r0, [sp, #20]
c0d0130e:	990c      	ldr	r1, [sp, #48]	; 0x30
c0d01310:	47a0      	blx	r4
c0d01312:	9700      	str	r7, [sp, #0]
c0d01314:	9701      	str	r7, [sp, #4]
c0d01316:	4630      	mov	r0, r6
c0d01318:	4639      	mov	r1, r7
c0d0131a:	9a04      	ldr	r2, [sp, #16]
c0d0131c:	9b08      	ldr	r3, [sp, #32]
c0d0131e:	9e09      	ldr	r6, [sp, #36]	; 0x24
c0d01320:	47b0      	blx	r6
c0d01322:	8828      	ldrh	r0, [r5, #0]
c0d01324:	4922      	ldr	r1, [pc, #136]	; (c0d013b0 <dh_init_aes_key+0x194>)
c0d01326:	1a41      	subs	r1, r0, r1
c0d01328:	4248      	negs	r0, r1
c0d0132a:	4148      	adcs	r0, r1
c0d0132c:	990b      	ldr	r1, [sp, #44]	; 0x2c
c0d0132e:	47a0      	blx	r4
c0d01330:	9e05      	ldr	r6, [sp, #20]
c0d01332:	4630      	mov	r0, r6
c0d01334:	990a      	ldr	r1, [sp, #40]	; 0x28
c0d01336:	47a0      	blx	r4
c0d01338:	9808      	ldr	r0, [sp, #32]
c0d0133a:	9001      	str	r0, [sp, #4]
c0d0133c:	ad1d      	add	r5, sp, #116	; 0x74
c0d0133e:	9500      	str	r5, [sp, #0]
c0d01340:	9803      	ldr	r0, [sp, #12]
c0d01342:	4631      	mov	r1, r6
c0d01344:	463a      	mov	r2, r7
c0d01346:	463b      	mov	r3, r7
c0d01348:	9c09      	ldr	r4, [sp, #36]	; 0x24
c0d0134a:	47a0      	blx	r4
c0d0134c:	9c10      	ldr	r4, [sp, #64]	; 0x40
c0d0134e:	1d22      	adds	r2, r4, #4
c0d01350:	4628      	mov	r0, r5
c0d01352:	9e0f      	ldr	r6, [sp, #60]	; 0x3c
c0d01354:	4631      	mov	r1, r6
c0d01356:	f7ff f8b1 	bl	c0d004bc <cx_aes_init_key_no_throw>
c0d0135a:	4620      	mov	r0, r4
c0d0135c:	3028      	adds	r0, #40	; 0x28
c0d0135e:	3520      	adds	r5, #32
c0d01360:	4629      	mov	r1, r5
c0d01362:	4632      	mov	r2, r6
c0d01364:	f006 f97a 	bl	c0d0765c <__aeabi_memcpy>
c0d01368:	4811      	ldr	r0, [pc, #68]	; (c0d013b0 <dh_init_aes_key+0x194>)
c0d0136a:	1c40      	adds	r0, r0, #1
c0d0136c:	8020      	strh	r0, [r4, #0]
c0d0136e:	f004 f8c5 	bl	c0d054fc <try_context_get>
c0d01372:	a911      	add	r1, sp, #68	; 0x44
c0d01374:	4288      	cmp	r0, r1
c0d01376:	d102      	bne.n	c0d0137e <dh_init_aes_key+0x162>
c0d01378:	981b      	ldr	r0, [sp, #108]	; 0x6c
c0d0137a:	f004 f8c9 	bl	c0d05510 <try_context_set>
c0d0137e:	a845      	add	r0, sp, #276	; 0x114
c0d01380:	2128      	movs	r1, #40	; 0x28
c0d01382:	4d14      	ldr	r5, [pc, #80]	; (c0d013d4 <dh_init_aes_key+0x1b8>)
c0d01384:	447d      	add	r5, pc
c0d01386:	47a8      	blx	r5
c0d01388:	a83d      	add	r0, sp, #244	; 0xf4
c0d0138a:	2120      	movs	r1, #32
c0d0138c:	47a8      	blx	r5
c0d0138e:	a82d      	add	r0, sp, #180	; 0xb4
c0d01390:	2440      	movs	r4, #64	; 0x40
c0d01392:	4621      	mov	r1, r4
c0d01394:	47a8      	blx	r5
c0d01396:	a81d      	add	r0, sp, #116	; 0x74
c0d01398:	4621      	mov	r1, r4
c0d0139a:	47a8      	blx	r5
c0d0139c:	a811      	add	r0, sp, #68	; 0x44
c0d0139e:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d013a0:	2800      	cmp	r0, #0
c0d013a2:	d102      	bne.n	c0d013aa <dh_init_aes_key+0x18e>
c0d013a4:	b07f      	add	sp, #508	; 0x1fc
c0d013a6:	b004      	add	sp, #16
c0d013a8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d013aa:	f001 fc54 	bl	c0d02c56 <os_longjmp>
c0d013ae:	46c0      	nop			; (mov r8, r8)
c0d013b0:	00003039 	.word	0x00003039
c0d013b4:	000069f8 	.word	0x000069f8
c0d013b8:	ffffefe9 	.word	0xffffefe9
c0d013bc:	00006bce 	.word	0x00006bce
c0d013c0:	00006bd3 	.word	0x00006bd3
c0d013c4:	00006bc8 	.word	0x00006bc8
c0d013c8:	00000717 	.word	0x00000717
c0d013cc:	00006bac 	.word	0x00006bac
c0d013d0:	00006bb2 	.word	0x00006bb2
c0d013d4:	000062f5 	.word	0x000062f5

c0d013d8 <dh_encode_init>:
c0d013d8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d013da:	b087      	sub	sp, #28
c0d013dc:	9305      	str	r3, [sp, #20]
c0d013de:	9206      	str	r2, [sp, #24]
c0d013e0:	460e      	mov	r6, r1
c0d013e2:	9100      	str	r1, [sp, #0]
c0d013e4:	4605      	mov	r5, r0
c0d013e6:	4619      	mov	r1, r3
c0d013e8:	3910      	subs	r1, #16
c0d013ea:	4248      	negs	r0, r1
c0d013ec:	4148      	adcs	r0, r1
c0d013ee:	492a      	ldr	r1, [pc, #168]	; (c0d01498 <dh_encode_init+0xc0>)
c0d013f0:	4479      	add	r1, pc
c0d013f2:	4c2a      	ldr	r4, [pc, #168]	; (c0d0149c <dh_encode_init+0xc4>)
c0d013f4:	447c      	add	r4, pc
c0d013f6:	47a0      	blx	r4
c0d013f8:	9402      	str	r4, [sp, #8]
c0d013fa:	4826      	ldr	r0, [pc, #152]	; (c0d01494 <dh_encode_init+0xbc>)
c0d013fc:	43c0      	mvns	r0, r0
c0d013fe:	8831      	ldrh	r1, [r6, #0]
c0d01400:	1841      	adds	r1, r0, r1
c0d01402:	4248      	negs	r0, r1
c0d01404:	4148      	adcs	r0, r1
c0d01406:	4926      	ldr	r1, [pc, #152]	; (c0d014a0 <dh_encode_init+0xc8>)
c0d01408:	4479      	add	r1, pc
c0d0140a:	47a0      	blx	r4
c0d0140c:	2400      	movs	r4, #0
c0d0140e:	74ac      	strb	r4, [r5, #18]
c0d01410:	4628      	mov	r0, r5
c0d01412:	3013      	adds	r0, #19
c0d01414:	2710      	movs	r7, #16
c0d01416:	4e23      	ldr	r6, [pc, #140]	; (c0d014a4 <dh_encode_init+0xcc>)
c0d01418:	447e      	add	r6, pc
c0d0141a:	4639      	mov	r1, r7
c0d0141c:	47b0      	blx	r6
c0d0141e:	2123      	movs	r1, #35	; 0x23
c0d01420:	9104      	str	r1, [sp, #16]
c0d01422:	546c      	strb	r4, [r5, r1]
c0d01424:	4628      	mov	r0, r5
c0d01426:	3024      	adds	r0, #36	; 0x24
c0d01428:	9003      	str	r0, [sp, #12]
c0d0142a:	47b0      	blx	r6
c0d0142c:	1ca8      	adds	r0, r5, #2
c0d0142e:	9001      	str	r0, [sp, #4]
c0d01430:	9906      	ldr	r1, [sp, #24]
c0d01432:	463a      	mov	r2, r7
c0d01434:	f006 f912 	bl	c0d0765c <__aeabi_memcpy>
c0d01438:	462c      	mov	r4, r5
c0d0143a:	3448      	adds	r4, #72	; 0x48
c0d0143c:	21ec      	movs	r1, #236	; 0xec
c0d0143e:	4620      	mov	r0, r4
c0d01440:	47b0      	blx	r6
c0d01442:	9900      	ldr	r1, [sp, #0]
c0d01444:	3128      	adds	r1, #40	; 0x28
c0d01446:	2220      	movs	r2, #32
c0d01448:	4620      	mov	r0, r4
c0d0144a:	f7ff f873 	bl	c0d00534 <cx_hmac_sha256_init_no_throw>
c0d0144e:	4241      	negs	r1, r0
c0d01450:	4148      	adcs	r0, r1
c0d01452:	4915      	ldr	r1, [pc, #84]	; (c0d014a8 <dh_encode_init+0xd0>)
c0d01454:	4479      	add	r1, pc
c0d01456:	9e02      	ldr	r6, [sp, #8]
c0d01458:	47b0      	blx	r6
c0d0145a:	4620      	mov	r0, r4
c0d0145c:	9906      	ldr	r1, [sp, #24]
c0d0145e:	9a05      	ldr	r2, [sp, #20]
c0d01460:	f7ff f86e 	bl	c0d00540 <cx_hmac_update>
c0d01464:	4241      	negs	r1, r0
c0d01466:	4148      	adcs	r0, r1
c0d01468:	4910      	ldr	r1, [pc, #64]	; (c0d014ac <dh_encode_init+0xd4>)
c0d0146a:	4479      	add	r1, pc
c0d0146c:	47b0      	blx	r6
c0d0146e:	4809      	ldr	r0, [pc, #36]	; (c0d01494 <dh_encode_init+0xbc>)
c0d01470:	8028      	strh	r0, [r5, #0]
c0d01472:	9e03      	ldr	r6, [sp, #12]
c0d01474:	4630      	mov	r0, r6
c0d01476:	9901      	ldr	r1, [sp, #4]
c0d01478:	463a      	mov	r2, r7
c0d0147a:	f006 f8ef 	bl	c0d0765c <__aeabi_memcpy>
c0d0147e:	9804      	ldr	r0, [sp, #16]
c0d01480:	542f      	strb	r7, [r5, r0]
c0d01482:	3523      	adds	r5, #35	; 0x23
c0d01484:	9a0c      	ldr	r2, [sp, #48]	; 0x30
c0d01486:	9b0d      	ldr	r3, [sp, #52]	; 0x34
c0d01488:	4630      	mov	r0, r6
c0d0148a:	4629      	mov	r1, r5
c0d0148c:	f000 f810 	bl	c0d014b0 <base64EncWholeBlocks>
c0d01490:	b007      	add	sp, #28
c0d01492:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01494:	00003039 	.word	0x00003039
c0d01498:	00006890 	.word	0x00006890
c0d0149c:	ffffee69 	.word	0xffffee69
c0d014a0:	00006890 	.word	0x00006890
c0d014a4:	00006261 	.word	0x00006261
c0d014a8:	0000685c 	.word	0x0000685c
c0d014ac:	0000685e 	.word	0x0000685e

c0d014b0 <base64EncWholeBlocks>:
c0d014b0:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d014b2:	9301      	str	r3, [sp, #4]
c0d014b4:	9200      	str	r2, [sp, #0]
c0d014b6:	460d      	mov	r5, r1
c0d014b8:	9002      	str	r0, [sp, #8]
c0d014ba:	2400      	movs	r4, #0
c0d014bc:	b2e6      	uxtb	r6, r4
c0d014be:	1c70      	adds	r0, r6, #1
c0d014c0:	2703      	movs	r7, #3
c0d014c2:	463a      	mov	r2, r7
c0d014c4:	4342      	muls	r2, r0
c0d014c6:	7829      	ldrb	r1, [r5, #0]
c0d014c8:	428a      	cmp	r2, r1
c0d014ca:	d814      	bhi.n	c0d014f6 <base64EncWholeBlocks+0x46>
c0d014cc:	0080      	lsls	r0, r0, #2
c0d014ce:	9901      	ldr	r1, [sp, #4]
c0d014d0:	4281      	cmp	r1, r0
c0d014d2:	d201      	bcs.n	c0d014d8 <base64EncWholeBlocks+0x28>
c0d014d4:	2000      	movs	r0, #0
c0d014d6:	e000      	b.n	c0d014da <base64EncWholeBlocks+0x2a>
c0d014d8:	2001      	movs	r0, #1
c0d014da:	490c      	ldr	r1, [pc, #48]	; (c0d0150c <base64EncWholeBlocks+0x5c>)
c0d014dc:	4479      	add	r1, pc
c0d014de:	f7fe febf 	bl	c0d00260 <assert>
c0d014e2:	4377      	muls	r7, r6
c0d014e4:	9802      	ldr	r0, [sp, #8]
c0d014e6:	19c0      	adds	r0, r0, r7
c0d014e8:	00b1      	lsls	r1, r6, #2
c0d014ea:	9a00      	ldr	r2, [sp, #0]
c0d014ec:	1851      	adds	r1, r2, r1
c0d014ee:	f000 f983 	bl	c0d017f8 <base64EncBlock>
c0d014f2:	1c64      	adds	r4, r4, #1
c0d014f4:	e7e2      	b.n	c0d014bc <base64EncWholeBlocks+0xc>
c0d014f6:	4377      	muls	r7, r6
c0d014f8:	1bca      	subs	r2, r1, r7
c0d014fa:	702a      	strb	r2, [r5, #0]
c0d014fc:	9802      	ldr	r0, [sp, #8]
c0d014fe:	19c1      	adds	r1, r0, r7
c0d01500:	b2d2      	uxtb	r2, r2
c0d01502:	f006 f8af 	bl	c0d07664 <__aeabi_memmove>
c0d01506:	00b0      	lsls	r0, r6, #2
c0d01508:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d0150a:	46c0      	nop			; (mov r8, r8)
c0d0150c:	000069b4 	.word	0x000069b4

c0d01510 <dh_encode_append>:
c0d01510:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01512:	b087      	sub	sp, #28
c0d01514:	9204      	str	r2, [sp, #16]
c0d01516:	460e      	mov	r6, r1
c0d01518:	4607      	mov	r7, r0
c0d0151a:	9305      	str	r3, [sp, #20]
c0d0151c:	0a99      	lsrs	r1, r3, #10
c0d0151e:	4248      	negs	r0, r1
c0d01520:	4148      	adcs	r0, r1
c0d01522:	4926      	ldr	r1, [pc, #152]	; (c0d015bc <dh_encode_append+0xac>)
c0d01524:	4479      	add	r1, pc
c0d01526:	4d26      	ldr	r5, [pc, #152]	; (c0d015c0 <dh_encode_append+0xb0>)
c0d01528:	447d      	add	r5, pc
c0d0152a:	47a8      	blx	r5
c0d0152c:	8838      	ldrh	r0, [r7, #0]
c0d0152e:	4c22      	ldr	r4, [pc, #136]	; (c0d015b8 <dh_encode_append+0xa8>)
c0d01530:	1b01      	subs	r1, r0, r4
c0d01532:	4248      	negs	r0, r1
c0d01534:	4148      	adcs	r0, r1
c0d01536:	4923      	ldr	r1, [pc, #140]	; (c0d015c4 <dh_encode_append+0xb4>)
c0d01538:	4479      	add	r1, pc
c0d0153a:	47a8      	blx	r5
c0d0153c:	43e0      	mvns	r0, r4
c0d0153e:	9603      	str	r6, [sp, #12]
c0d01540:	8831      	ldrh	r1, [r6, #0]
c0d01542:	1841      	adds	r1, r0, r1
c0d01544:	4248      	negs	r0, r1
c0d01546:	4148      	adcs	r0, r1
c0d01548:	491f      	ldr	r1, [pc, #124]	; (c0d015c8 <dh_encode_append+0xb8>)
c0d0154a:	4479      	add	r1, pc
c0d0154c:	47a8      	blx	r5
c0d0154e:	7cb8      	ldrb	r0, [r7, #18]
c0d01550:	2400      	movs	r4, #0
c0d01552:	2810      	cmp	r0, #16
c0d01554:	d301      	bcc.n	c0d0155a <dh_encode_append+0x4a>
c0d01556:	4620      	mov	r0, r4
c0d01558:	e000      	b.n	c0d0155c <dh_encode_append+0x4c>
c0d0155a:	2001      	movs	r0, #1
c0d0155c:	491b      	ldr	r1, [pc, #108]	; (c0d015cc <dh_encode_append+0xbc>)
c0d0155e:	4479      	add	r1, pc
c0d01560:	47a8      	blx	r5
c0d01562:	980d      	ldr	r0, [sp, #52]	; 0x34
c0d01564:	9002      	str	r0, [sp, #8]
c0d01566:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d01568:	9001      	str	r0, [sp, #4]
c0d0156a:	9406      	str	r4, [sp, #24]
c0d0156c:	4625      	mov	r5, r4
c0d0156e:	9805      	ldr	r0, [sp, #20]
c0d01570:	1b40      	subs	r0, r0, r5
c0d01572:	7cbc      	ldrb	r4, [r7, #18]
c0d01574:	2110      	movs	r1, #16
c0d01576:	1b0e      	subs	r6, r1, r4
c0d01578:	4286      	cmp	r6, r0
c0d0157a:	d300      	bcc.n	c0d0157e <dh_encode_append+0x6e>
c0d0157c:	4606      	mov	r6, r0
c0d0157e:	9804      	ldr	r0, [sp, #16]
c0d01580:	1941      	adds	r1, r0, r5
c0d01582:	1938      	adds	r0, r7, r4
c0d01584:	3013      	adds	r0, #19
c0d01586:	4632      	mov	r2, r6
c0d01588:	f006 f868 	bl	c0d0765c <__aeabi_memcpy>
c0d0158c:	19a0      	adds	r0, r4, r6
c0d0158e:	74b8      	strb	r0, [r7, #18]
c0d01590:	b2c0      	uxtb	r0, r0
c0d01592:	2810      	cmp	r0, #16
c0d01594:	d30c      	bcc.n	c0d015b0 <dh_encode_append+0xa0>
c0d01596:	9c06      	ldr	r4, [sp, #24]
c0d01598:	9801      	ldr	r0, [sp, #4]
c0d0159a:	1902      	adds	r2, r0, r4
c0d0159c:	9802      	ldr	r0, [sp, #8]
c0d0159e:	1b03      	subs	r3, r0, r4
c0d015a0:	4638      	mov	r0, r7
c0d015a2:	9903      	ldr	r1, [sp, #12]
c0d015a4:	f000 f814 	bl	c0d015d0 <processDHOneBlockFromCache>
c0d015a8:	1904      	adds	r4, r0, r4
c0d015aa:	9406      	str	r4, [sp, #24]
c0d015ac:	1975      	adds	r5, r6, r5
c0d015ae:	e7de      	b.n	c0d0156e <dh_encode_append+0x5e>
c0d015b0:	9806      	ldr	r0, [sp, #24]
c0d015b2:	b007      	add	sp, #28
c0d015b4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d015b6:	46c0      	nop			; (mov r8, r8)
c0d015b8:	00003039 	.word	0x00003039
c0d015bc:	000067bc 	.word	0x000067bc
c0d015c0:	ffffed35 	.word	0xffffed35
c0d015c4:	000067c0 	.word	0x000067c0
c0d015c8:	000067c6 	.word	0x000067c6
c0d015cc:	000067ca 	.word	0x000067ca

c0d015d0 <processDHOneBlockFromCache>:
c0d015d0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d015d2:	b085      	sub	sp, #20
c0d015d4:	9304      	str	r3, [sp, #16]
c0d015d6:	9203      	str	r2, [sp, #12]
c0d015d8:	460c      	mov	r4, r1
c0d015da:	4606      	mov	r6, r0
c0d015dc:	7c81      	ldrb	r1, [r0, #18]
c0d015de:	3910      	subs	r1, #16
c0d015e0:	4248      	negs	r0, r1
c0d015e2:	4148      	adcs	r0, r1
c0d015e4:	4926      	ldr	r1, [pc, #152]	; (c0d01680 <processDHOneBlockFromCache+0xb0>)
c0d015e6:	4479      	add	r1, pc
c0d015e8:	f7fe fe3a 	bl	c0d00260 <assert>
c0d015ec:	2002      	movs	r0, #2
c0d015ee:	2812      	cmp	r0, #18
c0d015f0:	d006      	beq.n	c0d01600 <processDHOneBlockFromCache+0x30>
c0d015f2:	5c31      	ldrb	r1, [r6, r0]
c0d015f4:	1832      	adds	r2, r6, r0
c0d015f6:	7c53      	ldrb	r3, [r2, #17]
c0d015f8:	404b      	eors	r3, r1
c0d015fa:	7453      	strb	r3, [r2, #17]
c0d015fc:	1c40      	adds	r0, r0, #1
c0d015fe:	e7f6      	b.n	c0d015ee <processDHOneBlockFromCache+0x1e>
c0d01600:	1d20      	adds	r0, r4, #4
c0d01602:	4631      	mov	r1, r6
c0d01604:	3113      	adds	r1, #19
c0d01606:	9101      	str	r1, [sp, #4]
c0d01608:	1cb4      	adds	r4, r6, #2
c0d0160a:	4622      	mov	r2, r4
c0d0160c:	f7fe ff50 	bl	c0d004b0 <cx_aes_enc_block>
c0d01610:	4241      	negs	r1, r0
c0d01612:	4148      	adcs	r0, r1
c0d01614:	491b      	ldr	r1, [pc, #108]	; (c0d01684 <processDHOneBlockFromCache+0xb4>)
c0d01616:	4479      	add	r1, pc
c0d01618:	4d1b      	ldr	r5, [pc, #108]	; (c0d01688 <processDHOneBlockFromCache+0xb8>)
c0d0161a:	447d      	add	r5, pc
c0d0161c:	47a8      	blx	r5
c0d0161e:	4630      	mov	r0, r6
c0d01620:	3048      	adds	r0, #72	; 0x48
c0d01622:	2710      	movs	r7, #16
c0d01624:	9402      	str	r4, [sp, #8]
c0d01626:	4621      	mov	r1, r4
c0d01628:	463a      	mov	r2, r7
c0d0162a:	f7fe ff89 	bl	c0d00540 <cx_hmac_update>
c0d0162e:	4241      	negs	r1, r0
c0d01630:	4148      	adcs	r0, r1
c0d01632:	4916      	ldr	r1, [pc, #88]	; (c0d0168c <processDHOneBlockFromCache+0xbc>)
c0d01634:	4479      	add	r1, pc
c0d01636:	9500      	str	r5, [sp, #0]
c0d01638:	47a8      	blx	r5
c0d0163a:	9801      	ldr	r0, [sp, #4]
c0d0163c:	9701      	str	r7, [sp, #4]
c0d0163e:	4639      	mov	r1, r7
c0d01640:	f006 f81c 	bl	c0d0767c <explicit_bzero>
c0d01644:	2000      	movs	r0, #0
c0d01646:	74b0      	strb	r0, [r6, #18]
c0d01648:	2423      	movs	r4, #35	; 0x23
c0d0164a:	5d31      	ldrb	r1, [r6, r4]
c0d0164c:	2903      	cmp	r1, #3
c0d0164e:	d200      	bcs.n	c0d01652 <processDHOneBlockFromCache+0x82>
c0d01650:	2001      	movs	r0, #1
c0d01652:	490f      	ldr	r1, [pc, #60]	; (c0d01690 <processDHOneBlockFromCache+0xc0>)
c0d01654:	4479      	add	r1, pc
c0d01656:	9a00      	ldr	r2, [sp, #0]
c0d01658:	4790      	blx	r2
c0d0165a:	5d37      	ldrb	r7, [r6, r4]
c0d0165c:	4635      	mov	r5, r6
c0d0165e:	3524      	adds	r5, #36	; 0x24
c0d01660:	19e8      	adds	r0, r5, r7
c0d01662:	9902      	ldr	r1, [sp, #8]
c0d01664:	9a01      	ldr	r2, [sp, #4]
c0d01666:	f005 fff9 	bl	c0d0765c <__aeabi_memcpy>
c0d0166a:	3710      	adds	r7, #16
c0d0166c:	5537      	strb	r7, [r6, r4]
c0d0166e:	3623      	adds	r6, #35	; 0x23
c0d01670:	4628      	mov	r0, r5
c0d01672:	4631      	mov	r1, r6
c0d01674:	9a03      	ldr	r2, [sp, #12]
c0d01676:	9b04      	ldr	r3, [sp, #16]
c0d01678:	f7ff ff1a 	bl	c0d014b0 <base64EncWholeBlocks>
c0d0167c:	b005      	add	sp, #20
c0d0167e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01680:	000068c1 	.word	0x000068c1
c0d01684:	000068a8 	.word	0x000068a8
c0d01688:	ffffec43 	.word	0xffffec43
c0d0168c:	000068a1 	.word	0x000068a1
c0d01690:	00006898 	.word	0x00006898

c0d01694 <dh_encode_finalize>:
c0d01694:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01696:	b085      	sub	sp, #20
c0d01698:	9301      	str	r3, [sp, #4]
c0d0169a:	9202      	str	r2, [sp, #8]
c0d0169c:	460c      	mov	r4, r1
c0d0169e:	4607      	mov	r7, r0
c0d016a0:	8800      	ldrh	r0, [r0, #0]
c0d016a2:	4e4b      	ldr	r6, [pc, #300]	; (c0d017d0 <dh_encode_finalize+0x13c>)
c0d016a4:	1b81      	subs	r1, r0, r6
c0d016a6:	4248      	negs	r0, r1
c0d016a8:	4148      	adcs	r0, r1
c0d016aa:	494a      	ldr	r1, [pc, #296]	; (c0d017d4 <dh_encode_finalize+0x140>)
c0d016ac:	4479      	add	r1, pc
c0d016ae:	4d4a      	ldr	r5, [pc, #296]	; (c0d017d8 <dh_encode_finalize+0x144>)
c0d016b0:	447d      	add	r5, pc
c0d016b2:	47a8      	blx	r5
c0d016b4:	43f0      	mvns	r0, r6
c0d016b6:	8821      	ldrh	r1, [r4, #0]
c0d016b8:	1841      	adds	r1, r0, r1
c0d016ba:	4248      	negs	r0, r1
c0d016bc:	4148      	adcs	r0, r1
c0d016be:	4947      	ldr	r1, [pc, #284]	; (c0d017dc <dh_encode_finalize+0x148>)
c0d016c0:	4479      	add	r1, pc
c0d016c2:	47a8      	blx	r5
c0d016c4:	7cb8      	ldrb	r0, [r7, #18]
c0d016c6:	2810      	cmp	r0, #16
c0d016c8:	d301      	bcc.n	c0d016ce <dh_encode_finalize+0x3a>
c0d016ca:	2000      	movs	r0, #0
c0d016cc:	e000      	b.n	c0d016d0 <dh_encode_finalize+0x3c>
c0d016ce:	2001      	movs	r0, #1
c0d016d0:	4943      	ldr	r1, [pc, #268]	; (c0d017e0 <dh_encode_finalize+0x14c>)
c0d016d2:	4479      	add	r1, pc
c0d016d4:	47a8      	blx	r5
c0d016d6:	7cb9      	ldrb	r1, [r7, #18]
c0d016d8:	2010      	movs	r0, #16
c0d016da:	1a42      	subs	r2, r0, r1
c0d016dc:	463e      	mov	r6, r7
c0d016de:	3623      	adds	r6, #35	; 0x23
c0d016e0:	2910      	cmp	r1, #16
c0d016e2:	d203      	bcs.n	c0d016ec <dh_encode_finalize+0x58>
c0d016e4:	187b      	adds	r3, r7, r1
c0d016e6:	74da      	strb	r2, [r3, #19]
c0d016e8:	1c49      	adds	r1, r1, #1
c0d016ea:	e7f9      	b.n	c0d016e0 <dh_encode_finalize+0x4c>
c0d016ec:	74b8      	strb	r0, [r7, #18]
c0d016ee:	4638      	mov	r0, r7
c0d016f0:	4621      	mov	r1, r4
c0d016f2:	9d02      	ldr	r5, [sp, #8]
c0d016f4:	462a      	mov	r2, r5
c0d016f6:	9c01      	ldr	r4, [sp, #4]
c0d016f8:	4623      	mov	r3, r4
c0d016fa:	f7ff ff69 	bl	c0d015d0 <processDHOneBlockFromCache>
c0d016fe:	9000      	str	r0, [sp, #0]
c0d01700:	7830      	ldrb	r0, [r6, #0]
c0d01702:	2123      	movs	r1, #35	; 0x23
c0d01704:	1a09      	subs	r1, r1, r0
c0d01706:	9104      	str	r1, [sp, #16]
c0d01708:	1839      	adds	r1, r7, r0
c0d0170a:	3124      	adds	r1, #36	; 0x24
c0d0170c:	3748      	adds	r7, #72	; 0x48
c0d0170e:	aa04      	add	r2, sp, #16
c0d01710:	4638      	mov	r0, r7
c0d01712:	f7fe ff03 	bl	c0d0051c <cx_hmac_final>
c0d01716:	4241      	negs	r1, r0
c0d01718:	4148      	adcs	r0, r1
c0d0171a:	4932      	ldr	r1, [pc, #200]	; (c0d017e4 <dh_encode_finalize+0x150>)
c0d0171c:	4479      	add	r1, pc
c0d0171e:	f7fe fd9f 	bl	c0d00260 <assert>
c0d01722:	9904      	ldr	r1, [sp, #16]
c0d01724:	3920      	subs	r1, #32
c0d01726:	4248      	negs	r0, r1
c0d01728:	4148      	adcs	r0, r1
c0d0172a:	492f      	ldr	r1, [pc, #188]	; (c0d017e8 <dh_encode_finalize+0x154>)
c0d0172c:	4479      	add	r1, pc
c0d0172e:	f7fe fd97 	bl	c0d00260 <assert>
c0d01732:	7830      	ldrb	r0, [r6, #0]
c0d01734:	3020      	adds	r0, #32
c0d01736:	7030      	strb	r0, [r6, #0]
c0d01738:	9f00      	ldr	r7, [sp, #0]
c0d0173a:	b2f8      	uxtb	r0, r7
c0d0173c:	182a      	adds	r2, r5, r0
c0d0173e:	1a23      	subs	r3, r4, r0
c0d01740:	1c74      	adds	r4, r6, #1
c0d01742:	4620      	mov	r0, r4
c0d01744:	4631      	mov	r1, r6
c0d01746:	f7ff feb3 	bl	c0d014b0 <base64EncWholeBlocks>
c0d0174a:	aa03      	add	r2, sp, #12
c0d0174c:	2100      	movs	r1, #0
c0d0174e:	7091      	strb	r1, [r2, #2]
c0d01750:	8011      	strh	r1, [r2, #0]
c0d01752:	19c5      	adds	r5, r0, r7
c0d01754:	7830      	ldrb	r0, [r6, #0]
c0d01756:	2800      	cmp	r0, #0
c0d01758:	d037      	beq.n	c0d017ca <dh_encode_finalize+0x136>
c0d0175a:	2801      	cmp	r0, #1
c0d0175c:	d018      	beq.n	c0d01790 <dh_encode_finalize+0xfc>
c0d0175e:	2802      	cmp	r0, #2
c0d01760:	d11d      	bne.n	c0d0179e <dh_encode_finalize+0x10a>
c0d01762:	b2ec      	uxtb	r4, r5
c0d01764:	1d25      	adds	r5, r4, #4
c0d01766:	2701      	movs	r7, #1
c0d01768:	9801      	ldr	r0, [sp, #4]
c0d0176a:	4285      	cmp	r5, r0
c0d0176c:	4638      	mov	r0, r7
c0d0176e:	d900      	bls.n	c0d01772 <dh_encode_finalize+0xde>
c0d01770:	4608      	mov	r0, r1
c0d01772:	491e      	ldr	r1, [pc, #120]	; (c0d017ec <dh_encode_finalize+0x158>)
c0d01774:	4479      	add	r1, pc
c0d01776:	f7fe fd73 	bl	c0d00260 <assert>
c0d0177a:	5bf1      	ldrh	r1, [r6, r7]
c0d0177c:	a803      	add	r0, sp, #12
c0d0177e:	8001      	strh	r1, [r0, #0]
c0d01780:	9902      	ldr	r1, [sp, #8]
c0d01782:	190c      	adds	r4, r1, r4
c0d01784:	4621      	mov	r1, r4
c0d01786:	f000 f837 	bl	c0d017f8 <base64EncBlock>
c0d0178a:	203d      	movs	r0, #61	; 0x3d
c0d0178c:	70e0      	strb	r0, [r4, #3]
c0d0178e:	e01c      	b.n	c0d017ca <dh_encode_finalize+0x136>
c0d01790:	b2ee      	uxtb	r6, r5
c0d01792:	1d35      	adds	r5, r6, #4
c0d01794:	9801      	ldr	r0, [sp, #4]
c0d01796:	4285      	cmp	r5, r0
c0d01798:	d907      	bls.n	c0d017aa <dh_encode_finalize+0x116>
c0d0179a:	2000      	movs	r0, #0
c0d0179c:	e006      	b.n	c0d017ac <dh_encode_finalize+0x118>
c0d0179e:	2000      	movs	r0, #0
c0d017a0:	4914      	ldr	r1, [pc, #80]	; (c0d017f4 <dh_encode_finalize+0x160>)
c0d017a2:	4479      	add	r1, pc
c0d017a4:	f7fe fd5c 	bl	c0d00260 <assert>
c0d017a8:	e00f      	b.n	c0d017ca <dh_encode_finalize+0x136>
c0d017aa:	2001      	movs	r0, #1
c0d017ac:	4910      	ldr	r1, [pc, #64]	; (c0d017f0 <dh_encode_finalize+0x15c>)
c0d017ae:	4479      	add	r1, pc
c0d017b0:	f7fe fd56 	bl	c0d00260 <assert>
c0d017b4:	7821      	ldrb	r1, [r4, #0]
c0d017b6:	a803      	add	r0, sp, #12
c0d017b8:	7001      	strb	r1, [r0, #0]
c0d017ba:	9902      	ldr	r1, [sp, #8]
c0d017bc:	198c      	adds	r4, r1, r6
c0d017be:	4621      	mov	r1, r4
c0d017c0:	f000 f81a 	bl	c0d017f8 <base64EncBlock>
c0d017c4:	203d      	movs	r0, #61	; 0x3d
c0d017c6:	70e0      	strb	r0, [r4, #3]
c0d017c8:	70a0      	strb	r0, [r4, #2]
c0d017ca:	b2e8      	uxtb	r0, r5
c0d017cc:	b005      	add	sp, #20
c0d017ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d017d0:	00003039 	.word	0x00003039
c0d017d4:	00006694 	.word	0x00006694
c0d017d8:	ffffebad 	.word	0xffffebad
c0d017dc:	00006698 	.word	0x00006698
c0d017e0:	0000669e 	.word	0x0000669e
c0d017e4:	0000666c 	.word	0x0000666c
c0d017e8:	00006674 	.word	0x00006674
c0d017ec:	0000665c 	.word	0x0000665c
c0d017f0:	0000660a 	.word	0x0000660a
c0d017f4:	00006646 	.word	0x00006646

c0d017f8 <base64EncBlock>:
c0d017f8:	b510      	push	{r4, lr}
c0d017fa:	7802      	ldrb	r2, [r0, #0]
c0d017fc:	0893      	lsrs	r3, r2, #2
c0d017fe:	4a0d      	ldr	r2, [pc, #52]	; (c0d01834 <base64EncBlock+0x3c>)
c0d01800:	447a      	add	r2, pc
c0d01802:	5cd3      	ldrb	r3, [r2, r3]
c0d01804:	700b      	strb	r3, [r1, #0]
c0d01806:	7843      	ldrb	r3, [r0, #1]
c0d01808:	091b      	lsrs	r3, r3, #4
c0d0180a:	7804      	ldrb	r4, [r0, #0]
c0d0180c:	07a4      	lsls	r4, r4, #30
c0d0180e:	0ea4      	lsrs	r4, r4, #26
c0d01810:	18e3      	adds	r3, r4, r3
c0d01812:	5cd3      	ldrb	r3, [r2, r3]
c0d01814:	704b      	strb	r3, [r1, #1]
c0d01816:	7883      	ldrb	r3, [r0, #2]
c0d01818:	099b      	lsrs	r3, r3, #6
c0d0181a:	7844      	ldrb	r4, [r0, #1]
c0d0181c:	0724      	lsls	r4, r4, #28
c0d0181e:	0ea4      	lsrs	r4, r4, #26
c0d01820:	18e3      	adds	r3, r4, r3
c0d01822:	5cd3      	ldrb	r3, [r2, r3]
c0d01824:	708b      	strb	r3, [r1, #2]
c0d01826:	7880      	ldrb	r0, [r0, #2]
c0d01828:	233f      	movs	r3, #63	; 0x3f
c0d0182a:	4003      	ands	r3, r0
c0d0182c:	5cd0      	ldrb	r0, [r2, r3]
c0d0182e:	70c8      	strb	r0, [r1, #3]
c0d01830:	bd10      	pop	{r4, pc}
c0d01832:	46c0      	nop			; (mov r8, r8)
c0d01834:	00006763 	.word	0x00006763

c0d01838 <dh_decode>:
c0d01838:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0183a:	b0a5      	sub	sp, #148	; 0x94
c0d0183c:	9202      	str	r2, [sp, #8]
c0d0183e:	2b3f      	cmp	r3, #63	; 0x3f
c0d01840:	d968      	bls.n	c0d01914 <dh_decode+0xdc>
c0d01842:	461e      	mov	r6, r3
c0d01844:	4607      	mov	r7, r0
c0d01846:	0718      	lsls	r0, r3, #28
c0d01848:	d164      	bne.n	c0d01914 <dh_decode+0xdc>
c0d0184a:	460c      	mov	r4, r1
c0d0184c:	ad07      	add	r5, sp, #28
c0d0184e:	4628      	mov	r0, r5
c0d01850:	f006 f838 	bl	c0d078c4 <setjmp>
c0d01854:	85a8      	strh	r0, [r5, #44]	; 0x2c
c0d01856:	0400      	lsls	r0, r0, #16
c0d01858:	d001      	beq.n	c0d0185e <dh_decode+0x26>
c0d0185a:	2400      	movs	r4, #0
c0d0185c:	e043      	b.n	c0d018e6 <dh_decode+0xae>
c0d0185e:	a807      	add	r0, sp, #28
c0d01860:	f003 fe56 	bl	c0d05510 <try_context_set>
c0d01864:	9011      	str	r0, [sp, #68]	; 0x44
c0d01866:	ad13      	add	r5, sp, #76	; 0x4c
c0d01868:	4628      	mov	r0, r5
c0d0186a:	4639      	mov	r1, r7
c0d0186c:	4622      	mov	r2, r4
c0d0186e:	f7ff fcd5 	bl	c0d0121c <dh_init_aes_key>
c0d01872:	4628      	mov	r0, r5
c0d01874:	9c02      	ldr	r4, [sp, #8]
c0d01876:	4621      	mov	r1, r4
c0d01878:	4632      	mov	r2, r6
c0d0187a:	f000 f855 	bl	c0d01928 <validateHmac>
c0d0187e:	a803      	add	r0, sp, #12
c0d01880:	2710      	movs	r7, #16
c0d01882:	4621      	mov	r1, r4
c0d01884:	463a      	mov	r2, r7
c0d01886:	f005 fee9 	bl	c0d0765c <__aeabi_memcpy>
c0d0188a:	1d28      	adds	r0, r5, #4
c0d0188c:	9001      	str	r0, [sp, #4]
c0d0188e:	3e20      	subs	r6, #32
c0d01890:	9600      	str	r6, [sp, #0]
c0d01892:	2500      	movs	r5, #0
c0d01894:	9800      	ldr	r0, [sp, #0]
c0d01896:	4287      	cmp	r7, r0
c0d01898:	d224      	bcs.n	c0d018e4 <dh_decode+0xac>
c0d0189a:	2001      	movs	r0, #1
c0d0189c:	4920      	ldr	r1, [pc, #128]	; (c0d01920 <dh_decode+0xe8>)
c0d0189e:	4479      	add	r1, pc
c0d018a0:	f7fe fcde 	bl	c0d00260 <assert>
c0d018a4:	9802      	ldr	r0, [sp, #8]
c0d018a6:	19c6      	adds	r6, r0, r7
c0d018a8:	1942      	adds	r2, r0, r5
c0d018aa:	9801      	ldr	r0, [sp, #4]
c0d018ac:	4631      	mov	r1, r6
c0d018ae:	f7fe fdf9 	bl	c0d004a4 <cx_aes_dec_block>
c0d018b2:	4241      	negs	r1, r0
c0d018b4:	4148      	adcs	r0, r1
c0d018b6:	491b      	ldr	r1, [pc, #108]	; (c0d01924 <dh_decode+0xec>)
c0d018b8:	4479      	add	r1, pc
c0d018ba:	f7fe fcd1 	bl	c0d00260 <assert>
c0d018be:	2000      	movs	r0, #0
c0d018c0:	2810      	cmp	r0, #16
c0d018c2:	d006      	beq.n	c0d018d2 <dh_decode+0x9a>
c0d018c4:	a903      	add	r1, sp, #12
c0d018c6:	5c09      	ldrb	r1, [r1, r0]
c0d018c8:	5c22      	ldrb	r2, [r4, r0]
c0d018ca:	404a      	eors	r2, r1
c0d018cc:	5422      	strb	r2, [r4, r0]
c0d018ce:	1c40      	adds	r0, r0, #1
c0d018d0:	e7f6      	b.n	c0d018c0 <dh_decode+0x88>
c0d018d2:	a803      	add	r0, sp, #12
c0d018d4:	2210      	movs	r2, #16
c0d018d6:	4631      	mov	r1, r6
c0d018d8:	f005 fec0 	bl	c0d0765c <__aeabi_memcpy>
c0d018dc:	3410      	adds	r4, #16
c0d018de:	3710      	adds	r7, #16
c0d018e0:	3510      	adds	r5, #16
c0d018e2:	e7d7      	b.n	c0d01894 <dh_decode+0x5c>
c0d018e4:	462c      	mov	r4, r5
c0d018e6:	f003 fe09 	bl	c0d054fc <try_context_get>
c0d018ea:	a907      	add	r1, sp, #28
c0d018ec:	4288      	cmp	r0, r1
c0d018ee:	d102      	bne.n	c0d018f6 <dh_decode+0xbe>
c0d018f0:	9811      	ldr	r0, [sp, #68]	; 0x44
c0d018f2:	f003 fe0d 	bl	c0d05510 <try_context_set>
c0d018f6:	a813      	add	r0, sp, #76	; 0x4c
c0d018f8:	2148      	movs	r1, #72	; 0x48
c0d018fa:	f005 febf 	bl	c0d0767c <explicit_bzero>
c0d018fe:	a807      	add	r0, sp, #28
c0d01900:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d01902:	2800      	cmp	r0, #0
c0d01904:	d107      	bne.n	c0d01916 <dh_decode+0xde>
c0d01906:	9802      	ldr	r0, [sp, #8]
c0d01908:	1820      	adds	r0, r4, r0
c0d0190a:	1e40      	subs	r0, r0, #1
c0d0190c:	7800      	ldrb	r0, [r0, #0]
c0d0190e:	1a20      	subs	r0, r4, r0
c0d01910:	b025      	add	sp, #148	; 0x94
c0d01912:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01914:	4801      	ldr	r0, [pc, #4]	; (c0d0191c <dh_decode+0xe4>)
c0d01916:	f001 f99e 	bl	c0d02c56 <os_longjmp>
c0d0191a:	46c0      	nop			; (mov r8, r8)
c0d0191c:	00006e07 	.word	0x00006e07
c0d01920:	0000657a 	.word	0x0000657a
c0d01924:	00006578 	.word	0x00006578

c0d01928 <validateHmac>:
c0d01928:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0192a:	b0c7      	sub	sp, #284	; 0x11c
c0d0192c:	4614      	mov	r4, r2
c0d0192e:	9202      	str	r2, [sp, #8]
c0d01930:	460e      	mov	r6, r1
c0d01932:	9101      	str	r1, [sp, #4]
c0d01934:	4601      	mov	r1, r0
c0d01936:	3128      	adds	r1, #40	; 0x28
c0d01938:	af0c      	add	r7, sp, #48	; 0x30
c0d0193a:	2220      	movs	r2, #32
c0d0193c:	9200      	str	r2, [sp, #0]
c0d0193e:	4638      	mov	r0, r7
c0d01940:	f7fe fdf8 	bl	c0d00534 <cx_hmac_sha256_init_no_throw>
c0d01944:	4241      	negs	r1, r0
c0d01946:	4148      	adcs	r0, r1
c0d01948:	491a      	ldr	r1, [pc, #104]	; (c0d019b4 <validateHmac+0x8c>)
c0d0194a:	4479      	add	r1, pc
c0d0194c:	4d1a      	ldr	r5, [pc, #104]	; (c0d019b8 <validateHmac+0x90>)
c0d0194e:	447d      	add	r5, pc
c0d01950:	47a8      	blx	r5
c0d01952:	3c20      	subs	r4, #32
c0d01954:	4638      	mov	r0, r7
c0d01956:	4631      	mov	r1, r6
c0d01958:	4622      	mov	r2, r4
c0d0195a:	f7fe fdf1 	bl	c0d00540 <cx_hmac_update>
c0d0195e:	4241      	negs	r1, r0
c0d01960:	4148      	adcs	r0, r1
c0d01962:	4916      	ldr	r1, [pc, #88]	; (c0d019bc <validateHmac+0x94>)
c0d01964:	4479      	add	r1, pc
c0d01966:	47a8      	blx	r5
c0d01968:	9e00      	ldr	r6, [sp, #0]
c0d0196a:	9603      	str	r6, [sp, #12]
c0d0196c:	ac04      	add	r4, sp, #16
c0d0196e:	aa03      	add	r2, sp, #12
c0d01970:	4638      	mov	r0, r7
c0d01972:	4621      	mov	r1, r4
c0d01974:	f7fe fdd2 	bl	c0d0051c <cx_hmac_final>
c0d01978:	4241      	negs	r1, r0
c0d0197a:	4148      	adcs	r0, r1
c0d0197c:	4910      	ldr	r1, [pc, #64]	; (c0d019c0 <validateHmac+0x98>)
c0d0197e:	4479      	add	r1, pc
c0d01980:	47a8      	blx	r5
c0d01982:	9903      	ldr	r1, [sp, #12]
c0d01984:	3920      	subs	r1, #32
c0d01986:	4248      	negs	r0, r1
c0d01988:	4148      	adcs	r0, r1
c0d0198a:	490e      	ldr	r1, [pc, #56]	; (c0d019c4 <validateHmac+0x9c>)
c0d0198c:	4479      	add	r1, pc
c0d0198e:	47a8      	blx	r5
c0d01990:	9802      	ldr	r0, [sp, #8]
c0d01992:	9901      	ldr	r1, [sp, #4]
c0d01994:	1809      	adds	r1, r1, r0
c0d01996:	3920      	subs	r1, #32
c0d01998:	4620      	mov	r0, r4
c0d0199a:	4632      	mov	r2, r6
c0d0199c:	f005 fe72 	bl	c0d07684 <memcmp>
c0d019a0:	2800      	cmp	r0, #0
c0d019a2:	d101      	bne.n	c0d019a8 <validateHmac+0x80>
c0d019a4:	b047      	add	sp, #284	; 0x11c
c0d019a6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d019a8:	4801      	ldr	r0, [pc, #4]	; (c0d019b0 <validateHmac+0x88>)
c0d019aa:	f001 f954 	bl	c0d02c56 <os_longjmp>
c0d019ae:	46c0      	nop			; (mov r8, r8)
c0d019b0:	00006e12 	.word	0x00006e12
c0d019b4:	000065b9 	.word	0x000065b9
c0d019b8:	ffffe90f 	.word	0xffffe90f
c0d019bc:	000065b7 	.word	0x000065b7
c0d019c0:	000065b5 	.word	0x000065b5
c0d019c4:	000065bf 	.word	0x000065bf

c0d019c8 <cx_hash>:
c0d019c8:	b51c      	push	{r2, r3, r4, lr}
c0d019ca:	4604      	mov	r4, r0
c0d019cc:	9805      	ldr	r0, [sp, #20]
c0d019ce:	9001      	str	r0, [sp, #4]
c0d019d0:	9804      	ldr	r0, [sp, #16]
c0d019d2:	9000      	str	r0, [sp, #0]
c0d019d4:	4620      	mov	r0, r4
c0d019d6:	f7fe fd9b 	bl	c0d00510 <cx_hash_no_throw>
c0d019da:	2800      	cmp	r0, #0
c0d019dc:	d103      	bne.n	c0d019e6 <cx_hash+0x1e>
c0d019de:	4620      	mov	r0, r4
c0d019e0:	f7fe fd90 	bl	c0d00504 <cx_hash_get_size>
c0d019e4:	bd1c      	pop	{r2, r3, r4, pc}
c0d019e6:	f001 f936 	bl	c0d02c56 <os_longjmp>

c0d019ea <check_canonical>:
c0d019ea:	4601      	mov	r1, r0
c0d019ec:	4602      	mov	r2, r0
c0d019ee:	3220      	adds	r2, #32
c0d019f0:	7800      	ldrb	r0, [r0, #0]
c0d019f2:	b243      	sxtb	r3, r0
c0d019f4:	2000      	movs	r0, #0
c0d019f6:	2b00      	cmp	r3, #0
c0d019f8:	d407      	bmi.n	c0d01a0a <check_canonical+0x20>
c0d019fa:	d007      	beq.n	c0d01a0c <check_canonical+0x22>
c0d019fc:	7811      	ldrb	r1, [r2, #0]
c0d019fe:	b249      	sxtb	r1, r1
c0d01a00:	2900      	cmp	r1, #0
c0d01a02:	d402      	bmi.n	c0d01a0a <check_canonical+0x20>
c0d01a04:	2001      	movs	r0, #1
c0d01a06:	2900      	cmp	r1, #0
c0d01a08:	d005      	beq.n	c0d01a16 <check_canonical+0x2c>
c0d01a0a:	4770      	bx	lr
c0d01a0c:	2301      	movs	r3, #1
c0d01a0e:	56c9      	ldrsb	r1, [r1, r3]
c0d01a10:	2900      	cmp	r1, #0
c0d01a12:	d5fa      	bpl.n	c0d01a0a <check_canonical+0x20>
c0d01a14:	e7f2      	b.n	c0d019fc <check_canonical+0x12>
c0d01a16:	5611      	ldrsb	r1, [r2, r0]
c0d01a18:	2900      	cmp	r1, #0
c0d01a1a:	d4f6      	bmi.n	c0d01a0a <check_canonical+0x20>
c0d01a1c:	2000      	movs	r0, #0
c0d01a1e:	4770      	bx	lr

c0d01a20 <ecdsa_der_to_sig>:
c0d01a20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d01a22:	460c      	mov	r4, r1
c0d01a24:	4605      	mov	r5, r0
c0d01a26:	78c6      	ldrb	r6, [r0, #3]
c0d01a28:	7900      	ldrb	r0, [r0, #4]
c0d01a2a:	2800      	cmp	r0, #0
c0d01a2c:	d001      	beq.n	c0d01a32 <ecdsa_der_to_sig+0x12>
c0d01a2e:	2704      	movs	r7, #4
c0d01a30:	e003      	b.n	c0d01a3a <ecdsa_der_to_sig+0x1a>
c0d01a32:	2e00      	cmp	r6, #0
c0d01a34:	d01d      	beq.n	c0d01a72 <ecdsa_der_to_sig+0x52>
c0d01a36:	1e76      	subs	r6, r6, #1
c0d01a38:	2705      	movs	r7, #5
c0d01a3a:	2e20      	cmp	r6, #32
c0d01a3c:	dc19      	bgt.n	c0d01a72 <ecdsa_der_to_sig+0x52>
c0d01a3e:	2000      	movs	r0, #0
c0d01a40:	1831      	adds	r1, r6, r0
c0d01a42:	291f      	cmp	r1, #31
c0d01a44:	dc03      	bgt.n	c0d01a4e <ecdsa_der_to_sig+0x2e>
c0d01a46:	2100      	movs	r1, #0
c0d01a48:	5421      	strb	r1, [r4, r0]
c0d01a4a:	1c40      	adds	r0, r0, #1
c0d01a4c:	e7f8      	b.n	c0d01a40 <ecdsa_der_to_sig+0x20>
c0d01a4e:	1820      	adds	r0, r4, r0
c0d01a50:	19e9      	adds	r1, r5, r7
c0d01a52:	4632      	mov	r2, r6
c0d01a54:	f005 fe02 	bl	c0d0765c <__aeabi_memcpy>
c0d01a58:	19f1      	adds	r1, r6, r7
c0d01a5a:	1c88      	adds	r0, r1, #2
c0d01a5c:	5c2b      	ldrb	r3, [r5, r0]
c0d01a5e:	194a      	adds	r2, r1, r5
c0d01a60:	7852      	ldrb	r2, [r2, #1]
c0d01a62:	2b00      	cmp	r3, #0
c0d01a64:	d103      	bne.n	c0d01a6e <ecdsa_der_to_sig+0x4e>
c0d01a66:	2a00      	cmp	r2, #0
c0d01a68:	d003      	beq.n	c0d01a72 <ecdsa_der_to_sig+0x52>
c0d01a6a:	1cc8      	adds	r0, r1, #3
c0d01a6c:	1e52      	subs	r2, r2, #1
c0d01a6e:	2a20      	cmp	r2, #32
c0d01a70:	dd01      	ble.n	c0d01a76 <ecdsa_der_to_sig+0x56>
c0d01a72:	2000      	movs	r0, #0
c0d01a74:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d01a76:	4621      	mov	r1, r4
c0d01a78:	3120      	adds	r1, #32
c0d01a7a:	2300      	movs	r3, #0
c0d01a7c:	18d6      	adds	r6, r2, r3
c0d01a7e:	2e1f      	cmp	r6, #31
c0d01a80:	dc03      	bgt.n	c0d01a8a <ecdsa_der_to_sig+0x6a>
c0d01a82:	2600      	movs	r6, #0
c0d01a84:	54ce      	strb	r6, [r1, r3]
c0d01a86:	1c5b      	adds	r3, r3, #1
c0d01a88:	e7f8      	b.n	c0d01a7c <ecdsa_der_to_sig+0x5c>
c0d01a8a:	1829      	adds	r1, r5, r0
c0d01a8c:	18e0      	adds	r0, r4, r3
c0d01a8e:	3020      	adds	r0, #32
c0d01a90:	f005 fde4 	bl	c0d0765c <__aeabi_memcpy>
c0d01a94:	2001      	movs	r0, #1
c0d01a96:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d01a98 <rng_rfc6979>:
c0d01a98:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01a9a:	b0cb      	sub	sp, #300	; 0x12c
c0d01a9c:	920b      	str	r2, [sp, #44]	; 0x2c
c0d01a9e:	9104      	str	r1, [sp, #16]
c0d01aa0:	900d      	str	r0, [sp, #52]	; 0x34
c0d01aa2:	2001      	movs	r0, #1
c0d01aa4:	2720      	movs	r7, #32
c0d01aa6:	9a53      	ldr	r2, [sp, #332]	; 0x14c
c0d01aa8:	9c52      	ldr	r4, [sp, #328]	; 0x148
c0d01aaa:	9951      	ldr	r1, [sp, #324]	; 0x144
c0d01aac:	910a      	str	r1, [sp, #40]	; 0x28
c0d01aae:	9950      	ldr	r1, [sp, #320]	; 0x140
c0d01ab0:	9102      	str	r1, [sp, #8]
c0d01ab2:	4615      	mov	r5, r2
c0d01ab4:	920f      	str	r2, [sp, #60]	; 0x3c
c0d01ab6:	940e      	str	r4, [sp, #56]	; 0x38
c0d01ab8:	07c0      	lsls	r0, r0, #31
c0d01aba:	d100      	bne.n	c0d01abe <rng_rfc6979+0x26>
c0d01abc:	e0ac      	b.n	c0d01c18 <rng_rfc6979+0x180>
c0d01abe:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d01ac0:	2800      	cmp	r0, #0
c0d01ac2:	970c      	str	r7, [sp, #48]	; 0x30
c0d01ac4:	d059      	beq.n	c0d01b7a <rng_rfc6979+0xe2>
c0d01ac6:	2201      	movs	r2, #1
c0d01ac8:	9207      	str	r2, [sp, #28]
c0d01aca:	4620      	mov	r0, r4
c0d01acc:	4639      	mov	r1, r7
c0d01ace:	9309      	str	r3, [sp, #36]	; 0x24
c0d01ad0:	f005 fdcc 	bl	c0d0766c <__aeabi_memset>
c0d01ad4:	4628      	mov	r0, r5
c0d01ad6:	4639      	mov	r1, r7
c0d01ad8:	f005 fdba 	bl	c0d07650 <__aeabi_memclr>
c0d01adc:	2000      	movs	r0, #0
c0d01ade:	9006      	str	r0, [sp, #24]
c0d01ae0:	55e0      	strb	r0, [r4, r7]
c0d01ae2:	ac10      	add	r4, sp, #64	; 0x40
c0d01ae4:	4a4d      	ldr	r2, [pc, #308]	; (c0d01c1c <rng_rfc6979+0x184>)
c0d01ae6:	447a      	add	r2, pc
c0d01ae8:	9208      	str	r2, [sp, #32]
c0d01aea:	4620      	mov	r0, r4
c0d01aec:	4629      	mov	r1, r5
c0d01aee:	4790      	blx	r2
c0d01af0:	9500      	str	r5, [sp, #0]
c0d01af2:	1c7b      	adds	r3, r7, #1
c0d01af4:	9303      	str	r3, [sp, #12]
c0d01af6:	4e4a      	ldr	r6, [pc, #296]	; (c0d01c20 <rng_rfc6979+0x188>)
c0d01af8:	447e      	add	r6, pc
c0d01afa:	9605      	str	r6, [sp, #20]
c0d01afc:	4620      	mov	r0, r4
c0d01afe:	462f      	mov	r7, r5
c0d01b00:	9d06      	ldr	r5, [sp, #24]
c0d01b02:	4629      	mov	r1, r5
c0d01b04:	9a0e      	ldr	r2, [sp, #56]	; 0x38
c0d01b06:	47b0      	blx	r6
c0d01b08:	9700      	str	r7, [sp, #0]
c0d01b0a:	4620      	mov	r0, r4
c0d01b0c:	4629      	mov	r1, r5
c0d01b0e:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
c0d01b10:	9b09      	ldr	r3, [sp, #36]	; 0x24
c0d01b12:	47b0      	blx	r6
c0d01b14:	9700      	str	r7, [sp, #0]
c0d01b16:	4620      	mov	r0, r4
c0d01b18:	9d07      	ldr	r5, [sp, #28]
c0d01b1a:	4629      	mov	r1, r5
c0d01b1c:	9a04      	ldr	r2, [sp, #16]
c0d01b1e:	9b0c      	ldr	r3, [sp, #48]	; 0x30
c0d01b20:	47b0      	blx	r6
c0d01b22:	4620      	mov	r0, r4
c0d01b24:	990f      	ldr	r1, [sp, #60]	; 0x3c
c0d01b26:	9a08      	ldr	r2, [sp, #32]
c0d01b28:	4790      	blx	r2
c0d01b2a:	9a0e      	ldr	r2, [sp, #56]	; 0x38
c0d01b2c:	9200      	str	r2, [sp, #0]
c0d01b2e:	4620      	mov	r0, r4
c0d01b30:	4629      	mov	r1, r5
c0d01b32:	9e0c      	ldr	r6, [sp, #48]	; 0x30
c0d01b34:	4633      	mov	r3, r6
c0d01b36:	9f05      	ldr	r7, [sp, #20]
c0d01b38:	47b8      	blx	r7
c0d01b3a:	9f0e      	ldr	r7, [sp, #56]	; 0x38
c0d01b3c:	55bd      	strb	r5, [r7, r6]
c0d01b3e:	4620      	mov	r0, r4
c0d01b40:	990f      	ldr	r1, [sp, #60]	; 0x3c
c0d01b42:	9a08      	ldr	r2, [sp, #32]
c0d01b44:	4790      	blx	r2
c0d01b46:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d01b48:	9000      	str	r0, [sp, #0]
c0d01b4a:	4620      	mov	r0, r4
c0d01b4c:	9e06      	ldr	r6, [sp, #24]
c0d01b4e:	4631      	mov	r1, r6
c0d01b50:	463a      	mov	r2, r7
c0d01b52:	9b03      	ldr	r3, [sp, #12]
c0d01b54:	9d05      	ldr	r5, [sp, #20]
c0d01b56:	47a8      	blx	r5
c0d01b58:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d01b5a:	9000      	str	r0, [sp, #0]
c0d01b5c:	4620      	mov	r0, r4
c0d01b5e:	4631      	mov	r1, r6
c0d01b60:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
c0d01b62:	9b09      	ldr	r3, [sp, #36]	; 0x24
c0d01b64:	47a8      	blx	r5
c0d01b66:	462e      	mov	r6, r5
c0d01b68:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d01b6a:	9000      	str	r0, [sp, #0]
c0d01b6c:	4620      	mov	r0, r4
c0d01b6e:	9907      	ldr	r1, [sp, #28]
c0d01b70:	9a04      	ldr	r2, [sp, #16]
c0d01b72:	9d0f      	ldr	r5, [sp, #60]	; 0x3c
c0d01b74:	9b0c      	ldr	r3, [sp, #48]	; 0x30
c0d01b76:	47b0      	blx	r6
c0d01b78:	e010      	b.n	c0d01b9c <rng_rfc6979+0x104>
c0d01b7a:	2000      	movs	r0, #0
c0d01b7c:	463e      	mov	r6, r7
c0d01b7e:	55e0      	strb	r0, [r4, r7]
c0d01b80:	af10      	add	r7, sp, #64	; 0x40
c0d01b82:	4638      	mov	r0, r7
c0d01b84:	4629      	mov	r1, r5
c0d01b86:	f000 f84d 	bl	c0d01c24 <cx_hmac_sha256_init>
c0d01b8a:	980f      	ldr	r0, [sp, #60]	; 0x3c
c0d01b8c:	9000      	str	r0, [sp, #0]
c0d01b8e:	1c73      	adds	r3, r6, #1
c0d01b90:	2101      	movs	r1, #1
c0d01b92:	4638      	mov	r0, r7
c0d01b94:	4627      	mov	r7, r4
c0d01b96:	4622      	mov	r2, r4
c0d01b98:	f000 f84d 	bl	c0d01c36 <cx_hmac>
c0d01b9c:	ac10      	add	r4, sp, #64	; 0x40
c0d01b9e:	4620      	mov	r0, r4
c0d01ba0:	4629      	mov	r1, r5
c0d01ba2:	f000 f83f 	bl	c0d01c24 <cx_hmac_sha256_init>
c0d01ba6:	463a      	mov	r2, r7
c0d01ba8:	9700      	str	r7, [sp, #0]
c0d01baa:	2101      	movs	r1, #1
c0d01bac:	4620      	mov	r0, r4
c0d01bae:	9f0c      	ldr	r7, [sp, #48]	; 0x30
c0d01bb0:	463b      	mov	r3, r7
c0d01bb2:	f000 f840 	bl	c0d01c36 <cx_hmac>
c0d01bb6:	9d0a      	ldr	r5, [sp, #40]	; 0x28
c0d01bb8:	2d00      	cmp	r5, #0
c0d01bba:	d018      	beq.n	c0d01bee <rng_rfc6979+0x156>
c0d01bbc:	ae10      	add	r6, sp, #64	; 0x40
c0d01bbe:	4630      	mov	r0, r6
c0d01bc0:	990f      	ldr	r1, [sp, #60]	; 0x3c
c0d01bc2:	f000 f82f 	bl	c0d01c24 <cx_hmac_sha256_init>
c0d01bc6:	9a0e      	ldr	r2, [sp, #56]	; 0x38
c0d01bc8:	9200      	str	r2, [sp, #0]
c0d01bca:	42bd      	cmp	r5, r7
c0d01bcc:	462c      	mov	r4, r5
c0d01bce:	d300      	bcc.n	c0d01bd2 <rng_rfc6979+0x13a>
c0d01bd0:	463c      	mov	r4, r7
c0d01bd2:	2101      	movs	r1, #1
c0d01bd4:	4630      	mov	r0, r6
c0d01bd6:	4616      	mov	r6, r2
c0d01bd8:	4623      	mov	r3, r4
c0d01bda:	f000 f82c 	bl	c0d01c36 <cx_hmac>
c0d01bde:	980d      	ldr	r0, [sp, #52]	; 0x34
c0d01be0:	4631      	mov	r1, r6
c0d01be2:	4622      	mov	r2, r4
c0d01be4:	f005 fd3a 	bl	c0d0765c <__aeabi_memcpy>
c0d01be8:	1b2d      	subs	r5, r5, r4
c0d01bea:	4627      	mov	r7, r4
c0d01bec:	e7e4      	b.n	c0d01bb8 <rng_rfc6979+0x120>
c0d01bee:	9a02      	ldr	r2, [sp, #8]
c0d01bf0:	9b0e      	ldr	r3, [sp, #56]	; 0x38
c0d01bf2:	990a      	ldr	r1, [sp, #40]	; 0x28
c0d01bf4:	4248      	negs	r0, r1
c0d01bf6:	4148      	adcs	r0, r1
c0d01bf8:	2900      	cmp	r1, #0
c0d01bfa:	d008      	beq.n	c0d01c0e <rng_rfc6979+0x176>
c0d01bfc:	1c54      	adds	r4, r2, #1
c0d01bfe:	1c5d      	adds	r5, r3, #1
c0d01c00:	1e49      	subs	r1, r1, #1
c0d01c02:	7812      	ldrb	r2, [r2, #0]
c0d01c04:	781b      	ldrb	r3, [r3, #0]
c0d01c06:	4293      	cmp	r3, r2
c0d01c08:	4622      	mov	r2, r4
c0d01c0a:	462b      	mov	r3, r5
c0d01c0c:	d2f2      	bcs.n	c0d01bf4 <rng_rfc6979+0x15c>
c0d01c0e:	2300      	movs	r3, #0
c0d01c10:	930b      	str	r3, [sp, #44]	; 0x2c
c0d01c12:	9d0f      	ldr	r5, [sp, #60]	; 0x3c
c0d01c14:	9c0e      	ldr	r4, [sp, #56]	; 0x38
c0d01c16:	e74f      	b.n	c0d01ab8 <rng_rfc6979+0x20>
c0d01c18:	b04b      	add	sp, #300	; 0x12c
c0d01c1a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01c1c:	0000013b 	.word	0x0000013b
c0d01c20:	0000013b 	.word	0x0000013b

c0d01c24 <cx_hmac_sha256_init>:
c0d01c24:	b580      	push	{r7, lr}
c0d01c26:	2220      	movs	r2, #32
c0d01c28:	f7fe fc84 	bl	c0d00534 <cx_hmac_sha256_init_no_throw>
c0d01c2c:	2800      	cmp	r0, #0
c0d01c2e:	d100      	bne.n	c0d01c32 <cx_hmac_sha256_init+0xe>
c0d01c30:	bd80      	pop	{r7, pc}
c0d01c32:	f001 f810 	bl	c0d02c56 <os_longjmp>

c0d01c36 <cx_hmac>:
c0d01c36:	b51c      	push	{r2, r3, r4, lr}
c0d01c38:	4604      	mov	r4, r0
c0d01c3a:	2020      	movs	r0, #32
c0d01c3c:	9001      	str	r0, [sp, #4]
c0d01c3e:	9804      	ldr	r0, [sp, #16]
c0d01c40:	9000      	str	r0, [sp, #0]
c0d01c42:	4620      	mov	r0, r4
c0d01c44:	f7fe fc70 	bl	c0d00528 <cx_hmac_no_throw>
c0d01c48:	2800      	cmp	r0, #0
c0d01c4a:	d106      	bne.n	c0d01c5a <cx_hmac+0x24>
c0d01c4c:	2080      	movs	r0, #128	; 0x80
c0d01c4e:	5820      	ldr	r0, [r4, r0]
c0d01c50:	7800      	ldrb	r0, [r0, #0]
c0d01c52:	1e40      	subs	r0, r0, #1
c0d01c54:	2805      	cmp	r0, #5
c0d01c56:	d202      	bcs.n	c0d01c5e <cx_hmac+0x28>
c0d01c58:	bd1c      	pop	{r2, r3, r4, pc}
c0d01c5a:	f000 fffc 	bl	c0d02c56 <os_longjmp>
c0d01c5e:	2077      	movs	r0, #119	; 0x77
c0d01c60:	43c0      	mvns	r0, r0
c0d01c62:	f000 fff8 	bl	c0d02c56 <os_longjmp>
	...

c0d01c68 <b58enc>:
c0d01c68:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01c6a:	b099      	sub	sp, #100	; 0x64
c0d01c6c:	461d      	mov	r5, r3
c0d01c6e:	9200      	str	r2, [sp, #0]
c0d01c70:	9003      	str	r0, [sp, #12]
c0d01c72:	2200      	movs	r2, #0
c0d01c74:	4291      	cmp	r1, r2
c0d01c76:	d005      	beq.n	c0d01c84 <b58enc+0x1c>
c0d01c78:	9803      	ldr	r0, [sp, #12]
c0d01c7a:	5c80      	ldrb	r0, [r0, r2]
c0d01c7c:	2800      	cmp	r0, #0
c0d01c7e:	d102      	bne.n	c0d01c86 <b58enc+0x1e>
c0d01c80:	1c52      	adds	r2, r2, #1
c0d01c82:	e7f7      	b.n	c0d01c74 <b58enc+0xc>
c0d01c84:	460a      	mov	r2, r1
c0d01c86:	9201      	str	r2, [sp, #4]
c0d01c88:	1a88      	subs	r0, r1, r2
c0d01c8a:	248a      	movs	r4, #138	; 0x8a
c0d01c8c:	4344      	muls	r4, r0
c0d01c8e:	4851      	ldr	r0, [pc, #324]	; (c0d01dd4 <b58enc+0x16c>)
c0d01c90:	4284      	cmp	r4, r0
c0d01c92:	9102      	str	r1, [sp, #8]
c0d01c94:	d301      	bcc.n	c0d01c9a <b58enc+0x32>
c0d01c96:	2000      	movs	r0, #0
c0d01c98:	e000      	b.n	c0d01c9c <b58enc+0x34>
c0d01c9a:	2001      	movs	r0, #1
c0d01c9c:	494e      	ldr	r1, [pc, #312]	; (c0d01dd8 <b58enc+0x170>)
c0d01c9e:	4479      	add	r1, pc
c0d01ca0:	f7fe fade 	bl	c0d00260 <assert>
c0d01ca4:	a80a      	add	r0, sp, #40	; 0x28
c0d01ca6:	213c      	movs	r1, #60	; 0x3c
c0d01ca8:	f005 fcd2 	bl	c0d07650 <__aeabi_memclr>
c0d01cac:	2164      	movs	r1, #100	; 0x64
c0d01cae:	4620      	mov	r0, r4
c0d01cb0:	f005 fb3c 	bl	c0d0732c <__udivsi3>
c0d01cb4:	4606      	mov	r6, r0
c0d01cb6:	4849      	ldr	r0, [pc, #292]	; (c0d01ddc <b58enc+0x174>)
c0d01cb8:	4478      	add	r0, pc
c0d01cba:	9006      	str	r0, [sp, #24]
c0d01cbc:	9c01      	ldr	r4, [sp, #4]
c0d01cbe:	4621      	mov	r1, r4
c0d01cc0:	9605      	str	r6, [sp, #20]
c0d01cc2:	9504      	str	r5, [sp, #16]
c0d01cc4:	9607      	str	r6, [sp, #28]
c0d01cc6:	9802      	ldr	r0, [sp, #8]
c0d01cc8:	4281      	cmp	r1, r0
c0d01cca:	d22a      	bcs.n	c0d01d22 <b58enc+0xba>
c0d01ccc:	9803      	ldr	r0, [sp, #12]
c0d01cce:	5c45      	ldrb	r5, [r0, r1]
c0d01cd0:	4634      	mov	r4, r6
c0d01cd2:	9108      	str	r1, [sp, #32]
c0d01cd4:	2d00      	cmp	r5, #0
c0d01cd6:	d102      	bne.n	c0d01cde <b58enc+0x76>
c0d01cd8:	9805      	ldr	r0, [sp, #20]
c0d01cda:	4284      	cmp	r4, r0
c0d01cdc:	d91c      	bls.n	c0d01d18 <b58enc+0xb0>
c0d01cde:	42b4      	cmp	r4, r6
c0d01ce0:	d901      	bls.n	c0d01ce6 <b58enc+0x7e>
c0d01ce2:	2000      	movs	r0, #0
c0d01ce4:	e000      	b.n	c0d01ce8 <b58enc+0x80>
c0d01ce6:	2001      	movs	r0, #1
c0d01ce8:	9906      	ldr	r1, [sp, #24]
c0d01cea:	f7fe fab9 	bl	c0d00260 <assert>
c0d01cee:	a80a      	add	r0, sp, #40	; 0x28
c0d01cf0:	9009      	str	r0, [sp, #36]	; 0x24
c0d01cf2:	5d00      	ldrb	r0, [r0, r4]
c0d01cf4:	0200      	lsls	r0, r0, #8
c0d01cf6:	1946      	adds	r6, r0, r5
c0d01cf8:	273a      	movs	r7, #58	; 0x3a
c0d01cfa:	4630      	mov	r0, r6
c0d01cfc:	4639      	mov	r1, r7
c0d01cfe:	f005 fb5b 	bl	c0d073b8 <__divsi3>
c0d01d02:	4605      	mov	r5, r0
c0d01d04:	4347      	muls	r7, r0
c0d01d06:	1bf0      	subs	r0, r6, r7
c0d01d08:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d01d0a:	5508      	strb	r0, [r1, r4]
c0d01d0c:	2c00      	cmp	r4, #0
c0d01d0e:	9e07      	ldr	r6, [sp, #28]
c0d01d10:	9908      	ldr	r1, [sp, #32]
c0d01d12:	d001      	beq.n	c0d01d18 <b58enc+0xb0>
c0d01d14:	1e64      	subs	r4, r4, #1
c0d01d16:	e7dd      	b.n	c0d01cd4 <b58enc+0x6c>
c0d01d18:	1c49      	adds	r1, r1, #1
c0d01d1a:	9405      	str	r4, [sp, #20]
c0d01d1c:	9d04      	ldr	r5, [sp, #16]
c0d01d1e:	9c01      	ldr	r4, [sp, #4]
c0d01d20:	e7d1      	b.n	c0d01cc6 <b58enc+0x5e>
c0d01d22:	1c77      	adds	r7, r6, #1
c0d01d24:	2000      	movs	r0, #0
c0d01d26:	4287      	cmp	r7, r0
c0d01d28:	d006      	beq.n	c0d01d38 <b58enc+0xd0>
c0d01d2a:	a90a      	add	r1, sp, #40	; 0x28
c0d01d2c:	5c09      	ldrb	r1, [r1, r0]
c0d01d2e:	2900      	cmp	r1, #0
c0d01d30:	d101      	bne.n	c0d01d36 <b58enc+0xce>
c0d01d32:	1c40      	adds	r0, r0, #1
c0d01d34:	e7f7      	b.n	c0d01d26 <b58enc+0xbe>
c0d01d36:	4607      	mov	r7, r0
c0d01d38:	19a0      	adds	r0, r4, r6
c0d01d3a:	1bc0      	subs	r0, r0, r7
c0d01d3c:	1c42      	adds	r2, r0, #1
c0d01d3e:	682b      	ldr	r3, [r5, #0]
c0d01d40:	4293      	cmp	r3, r2
c0d01d42:	4610      	mov	r0, r2
c0d01d44:	d93d      	bls.n	c0d01dc2 <b58enc+0x15a>
c0d01d46:	2c00      	cmp	r4, #0
c0d01d48:	9208      	str	r2, [sp, #32]
c0d01d4a:	d007      	beq.n	c0d01d5c <b58enc+0xf4>
c0d01d4c:	2231      	movs	r2, #49	; 0x31
c0d01d4e:	9800      	ldr	r0, [sp, #0]
c0d01d50:	4621      	mov	r1, r4
c0d01d52:	461d      	mov	r5, r3
c0d01d54:	f005 fc8a 	bl	c0d0766c <__aeabi_memset>
c0d01d58:	462b      	mov	r3, r5
c0d01d5a:	9a08      	ldr	r2, [sp, #32]
c0d01d5c:	4820      	ldr	r0, [pc, #128]	; (c0d01de0 <b58enc+0x178>)
c0d01d5e:	4478      	add	r0, pc
c0d01d60:	9005      	str	r0, [sp, #20]
c0d01d62:	4820      	ldr	r0, [pc, #128]	; (c0d01de4 <b58enc+0x17c>)
c0d01d64:	4478      	add	r0, pc
c0d01d66:	9003      	str	r0, [sp, #12]
c0d01d68:	481f      	ldr	r0, [pc, #124]	; (c0d01de8 <b58enc+0x180>)
c0d01d6a:	4478      	add	r0, pc
c0d01d6c:	9002      	str	r0, [sp, #8]
c0d01d6e:	9306      	str	r3, [sp, #24]
c0d01d70:	42b7      	cmp	r7, r6
c0d01d72:	d821      	bhi.n	c0d01db8 <b58enc+0x150>
c0d01d74:	4626      	mov	r6, r4
c0d01d76:	a80a      	add	r0, sp, #40	; 0x28
c0d01d78:	9709      	str	r7, [sp, #36]	; 0x24
c0d01d7a:	5dc5      	ldrb	r5, [r0, r7]
c0d01d7c:	2401      	movs	r4, #1
c0d01d7e:	2700      	movs	r7, #0
c0d01d80:	2d3a      	cmp	r5, #58	; 0x3a
c0d01d82:	4620      	mov	r0, r4
c0d01d84:	d300      	bcc.n	c0d01d88 <b58enc+0x120>
c0d01d86:	4638      	mov	r0, r7
c0d01d88:	9905      	ldr	r1, [sp, #20]
c0d01d8a:	f7fe fa69 	bl	c0d00260 <assert>
c0d01d8e:	9804      	ldr	r0, [sp, #16]
c0d01d90:	6800      	ldr	r0, [r0, #0]
c0d01d92:	4286      	cmp	r6, r0
c0d01d94:	d300      	bcc.n	c0d01d98 <b58enc+0x130>
c0d01d96:	463c      	mov	r4, r7
c0d01d98:	4620      	mov	r0, r4
c0d01d9a:	9903      	ldr	r1, [sp, #12]
c0d01d9c:	f7fe fa60 	bl	c0d00260 <assert>
c0d01da0:	9802      	ldr	r0, [sp, #8]
c0d01da2:	5d40      	ldrb	r0, [r0, r5]
c0d01da4:	9900      	ldr	r1, [sp, #0]
c0d01da6:	4634      	mov	r4, r6
c0d01da8:	5588      	strb	r0, [r1, r6]
c0d01daa:	9f09      	ldr	r7, [sp, #36]	; 0x24
c0d01dac:	1c7f      	adds	r7, r7, #1
c0d01dae:	1c74      	adds	r4, r6, #1
c0d01db0:	9e07      	ldr	r6, [sp, #28]
c0d01db2:	9a08      	ldr	r2, [sp, #32]
c0d01db4:	9b06      	ldr	r3, [sp, #24]
c0d01db6:	e7db      	b.n	c0d01d70 <b58enc+0x108>
c0d01db8:	2000      	movs	r0, #0
c0d01dba:	9900      	ldr	r1, [sp, #0]
c0d01dbc:	5508      	strb	r0, [r1, r4]
c0d01dbe:	4620      	mov	r0, r4
c0d01dc0:	9d04      	ldr	r5, [sp, #16]
c0d01dc2:	1c40      	adds	r0, r0, #1
c0d01dc4:	6028      	str	r0, [r5, #0]
c0d01dc6:	4293      	cmp	r3, r2
c0d01dc8:	d801      	bhi.n	c0d01dce <b58enc+0x166>
c0d01dca:	2000      	movs	r0, #0
c0d01dcc:	e000      	b.n	c0d01dd0 <b58enc+0x168>
c0d01dce:	2001      	movs	r0, #1
c0d01dd0:	b019      	add	sp, #100	; 0x64
c0d01dd2:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01dd4:	00001770 	.word	0x00001770
c0d01dd8:	0000633f 	.word	0x0000633f
c0d01ddc:	00006339 	.word	0x00006339
c0d01de0:	000062a7 	.word	0x000062a7
c0d01de4:	000062b5 	.word	0x000062b5
c0d01de8:	00006239 	.word	0x00006239

c0d01dec <compressed_public_key_to_wif>:
c0d01dec:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01dee:	b0ad      	sub	sp, #180	; 0xb4
c0d01df0:	9303      	str	r3, [sp, #12]
c0d01df2:	9202      	str	r2, [sp, #8]
c0d01df4:	460c      	mov	r4, r1
c0d01df6:	4607      	mov	r7, r0
c0d01df8:	1e41      	subs	r1, r0, #1
c0d01dfa:	4188      	sbcs	r0, r1
c0d01dfc:	4932      	ldr	r1, [pc, #200]	; (c0d01ec8 <compressed_public_key_to_wif+0xdc>)
c0d01dfe:	4479      	add	r1, pc
c0d01e00:	4d32      	ldr	r5, [pc, #200]	; (c0d01ecc <compressed_public_key_to_wif+0xe0>)
c0d01e02:	447d      	add	r5, pc
c0d01e04:	47a8      	blx	r5
c0d01e06:	2001      	movs	r0, #1
c0d01e08:	2600      	movs	r6, #0
c0d01e0a:	2c20      	cmp	r4, #32
c0d01e0c:	9004      	str	r0, [sp, #16]
c0d01e0e:	d800      	bhi.n	c0d01e12 <compressed_public_key_to_wif+0x26>
c0d01e10:	4630      	mov	r0, r6
c0d01e12:	492f      	ldr	r1, [pc, #188]	; (c0d01ed0 <compressed_public_key_to_wif+0xe4>)
c0d01e14:	4479      	add	r1, pc
c0d01e16:	47a8      	blx	r5
c0d01e18:	9803      	ldr	r0, [sp, #12]
c0d01e1a:	2827      	cmp	r0, #39	; 0x27
c0d01e1c:	9804      	ldr	r0, [sp, #16]
c0d01e1e:	d800      	bhi.n	c0d01e22 <compressed_public_key_to_wif+0x36>
c0d01e20:	4630      	mov	r0, r6
c0d01e22:	492c      	ldr	r1, [pc, #176]	; (c0d01ed4 <compressed_public_key_to_wif+0xe8>)
c0d01e24:	4479      	add	r1, pc
c0d01e26:	47a8      	blx	r5
c0d01e28:	2421      	movs	r4, #33	; 0x21
c0d01e2a:	ad23      	add	r5, sp, #140	; 0x8c
c0d01e2c:	552e      	strb	r6, [r5, r4]
c0d01e2e:	4628      	mov	r0, r5
c0d01e30:	3021      	adds	r0, #33	; 0x21
c0d01e32:	70c6      	strb	r6, [r0, #3]
c0d01e34:	7086      	strb	r6, [r0, #2]
c0d01e36:	7046      	strb	r6, [r0, #1]
c0d01e38:	4628      	mov	r0, r5
c0d01e3a:	4639      	mov	r1, r7
c0d01e3c:	4622      	mov	r2, r4
c0d01e3e:	f005 fc0d 	bl	c0d0765c <__aeabi_memcpy>
c0d01e42:	af06      	add	r7, sp, #24
c0d01e44:	4638      	mov	r0, r7
c0d01e46:	f7fe fb81 	bl	c0d0054c <cx_ripemd160_init_no_throw>
c0d01e4a:	2014      	movs	r0, #20
c0d01e4c:	9001      	str	r0, [sp, #4]
c0d01e4e:	a81e      	add	r0, sp, #120	; 0x78
c0d01e50:	9000      	str	r0, [sp, #0]
c0d01e52:	4638      	mov	r0, r7
c0d01e54:	9904      	ldr	r1, [sp, #16]
c0d01e56:	462a      	mov	r2, r5
c0d01e58:	4623      	mov	r3, r4
c0d01e5a:	f7fe fb59 	bl	c0d00510 <cx_hash_no_throw>
c0d01e5e:	2800      	cmp	r0, #0
c0d01e60:	d12f      	bne.n	c0d01ec2 <compressed_public_key_to_wif+0xd6>
c0d01e62:	a806      	add	r0, sp, #24
c0d01e64:	f7fe fb4e 	bl	c0d00504 <cx_hash_get_size>
c0d01e68:	ae23      	add	r6, sp, #140	; 0x8c
c0d01e6a:	981e      	ldr	r0, [sp, #120]	; 0x78
c0d01e6c:	5530      	strb	r0, [r6, r4]
c0d01e6e:	4631      	mov	r1, r6
c0d01e70:	3121      	adds	r1, #33	; 0x21
c0d01e72:	0e02      	lsrs	r2, r0, #24
c0d01e74:	70ca      	strb	r2, [r1, #3]
c0d01e76:	0c02      	lsrs	r2, r0, #16
c0d01e78:	708a      	strb	r2, [r1, #2]
c0d01e7a:	0a00      	lsrs	r0, r0, #8
c0d01e7c:	7048      	strb	r0, [r1, #1]
c0d01e7e:	9c02      	ldr	r4, [sp, #8]
c0d01e80:	4620      	mov	r0, r4
c0d01e82:	9d03      	ldr	r5, [sp, #12]
c0d01e84:	4629      	mov	r1, r5
c0d01e86:	f005 fbe3 	bl	c0d07650 <__aeabi_memclr>
c0d01e8a:	204f      	movs	r0, #79	; 0x4f
c0d01e8c:	70a0      	strb	r0, [r4, #2]
c0d01e8e:	2049      	movs	r0, #73	; 0x49
c0d01e90:	7060      	strb	r0, [r4, #1]
c0d01e92:	2046      	movs	r0, #70	; 0x46
c0d01e94:	7020      	strb	r0, [r4, #0]
c0d01e96:	1ee8      	subs	r0, r5, #3
c0d01e98:	9005      	str	r0, [sp, #20]
c0d01e9a:	1ce2      	adds	r2, r4, #3
c0d01e9c:	2125      	movs	r1, #37	; 0x25
c0d01e9e:	ab05      	add	r3, sp, #20
c0d01ea0:	4630      	mov	r0, r6
c0d01ea2:	f7ff fee1 	bl	c0d01c68 <b58enc>
c0d01ea6:	9805      	ldr	r0, [sp, #20]
c0d01ea8:	1cc4      	adds	r4, r0, #3
c0d01eaa:	42ac      	cmp	r4, r5
c0d01eac:	d301      	bcc.n	c0d01eb2 <compressed_public_key_to_wif+0xc6>
c0d01eae:	2000      	movs	r0, #0
c0d01eb0:	e000      	b.n	c0d01eb4 <compressed_public_key_to_wif+0xc8>
c0d01eb2:	2001      	movs	r0, #1
c0d01eb4:	4908      	ldr	r1, [pc, #32]	; (c0d01ed8 <compressed_public_key_to_wif+0xec>)
c0d01eb6:	4479      	add	r1, pc
c0d01eb8:	f7fe f9d2 	bl	c0d00260 <assert>
c0d01ebc:	4620      	mov	r0, r4
c0d01ebe:	b02d      	add	sp, #180	; 0xb4
c0d01ec0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01ec2:	f000 fec8 	bl	c0d02c56 <os_longjmp>
c0d01ec6:	46c0      	nop			; (mov r8, r8)
c0d01ec8:	0000622f 	.word	0x0000622f
c0d01ecc:	ffffe45b 	.word	0xffffe45b
c0d01ed0:	0000622d 	.word	0x0000622d
c0d01ed4:	00006231 	.word	0x00006231
c0d01ed8:	000061b3 	.word	0x000061b3

c0d01edc <public_key_to_wif>:
c0d01edc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01ede:	b08b      	sub	sp, #44	; 0x2c
c0d01ee0:	9301      	str	r3, [sp, #4]
c0d01ee2:	9200      	str	r2, [sp, #0]
c0d01ee4:	460f      	mov	r7, r1
c0d01ee6:	4606      	mov	r6, r0
c0d01ee8:	1e41      	subs	r1, r0, #1
c0d01eea:	4188      	sbcs	r0, r1
c0d01eec:	4914      	ldr	r1, [pc, #80]	; (c0d01f40 <public_key_to_wif+0x64>)
c0d01eee:	4479      	add	r1, pc
c0d01ef0:	4d14      	ldr	r5, [pc, #80]	; (c0d01f44 <public_key_to_wif+0x68>)
c0d01ef2:	447d      	add	r5, pc
c0d01ef4:	47a8      	blx	r5
c0d01ef6:	2401      	movs	r4, #1
c0d01ef8:	2100      	movs	r1, #0
c0d01efa:	2f20      	cmp	r7, #32
c0d01efc:	4620      	mov	r0, r4
c0d01efe:	d800      	bhi.n	c0d01f02 <public_key_to_wif+0x26>
c0d01f00:	4608      	mov	r0, r1
c0d01f02:	460f      	mov	r7, r1
c0d01f04:	4910      	ldr	r1, [pc, #64]	; (c0d01f48 <public_key_to_wif+0x6c>)
c0d01f06:	4479      	add	r1, pc
c0d01f08:	47a8      	blx	r5
c0d01f0a:	9801      	ldr	r0, [sp, #4]
c0d01f0c:	2827      	cmp	r0, #39	; 0x27
c0d01f0e:	4620      	mov	r0, r4
c0d01f10:	d800      	bhi.n	c0d01f14 <public_key_to_wif+0x38>
c0d01f12:	4638      	mov	r0, r7
c0d01f14:	490d      	ldr	r1, [pc, #52]	; (c0d01f4c <public_key_to_wif+0x70>)
c0d01f16:	4479      	add	r1, pc
c0d01f18:	47a8      	blx	r5
c0d01f1a:	2040      	movs	r0, #64	; 0x40
c0d01f1c:	5c30      	ldrb	r0, [r6, r0]
c0d01f1e:	4020      	ands	r0, r4
c0d01f20:	1c80      	adds	r0, r0, #2
c0d01f22:	af02      	add	r7, sp, #8
c0d01f24:	7038      	strb	r0, [r7, #0]
c0d01f26:	1c78      	adds	r0, r7, #1
c0d01f28:	1c71      	adds	r1, r6, #1
c0d01f2a:	2220      	movs	r2, #32
c0d01f2c:	f005 fb96 	bl	c0d0765c <__aeabi_memcpy>
c0d01f30:	2121      	movs	r1, #33	; 0x21
c0d01f32:	4638      	mov	r0, r7
c0d01f34:	9a00      	ldr	r2, [sp, #0]
c0d01f36:	9b01      	ldr	r3, [sp, #4]
c0d01f38:	f7ff ff58 	bl	c0d01dec <compressed_public_key_to_wif>
c0d01f3c:	b00b      	add	sp, #44	; 0x2c
c0d01f3e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d01f40:	0000618f 	.word	0x0000618f
c0d01f44:	ffffe36b 	.word	0xffffe36b
c0d01f48:	0000618b 	.word	0x0000618b
c0d01f4c:	0000618f 	.word	0x0000618f

c0d01f50 <getNetworkByChainId>:
c0d01f50:	b510      	push	{r4, lr}
c0d01f52:	4604      	mov	r4, r0
c0d01f54:	3920      	subs	r1, #32
c0d01f56:	4248      	negs	r0, r1
c0d01f58:	4148      	adcs	r0, r1
c0d01f5a:	490c      	ldr	r1, [pc, #48]	; (c0d01f8c <getNetworkByChainId+0x3c>)
c0d01f5c:	4479      	add	r1, pc
c0d01f5e:	f7fe f97f 	bl	c0d00260 <assert>
c0d01f62:	490b      	ldr	r1, [pc, #44]	; (c0d01f90 <getNetworkByChainId+0x40>)
c0d01f64:	4479      	add	r1, pc
c0d01f66:	2220      	movs	r2, #32
c0d01f68:	4620      	mov	r0, r4
c0d01f6a:	f005 fb8b 	bl	c0d07684 <memcmp>
c0d01f6e:	2800      	cmp	r0, #0
c0d01f70:	d009      	beq.n	c0d01f86 <getNetworkByChainId+0x36>
c0d01f72:	4908      	ldr	r1, [pc, #32]	; (c0d01f94 <getNetworkByChainId+0x44>)
c0d01f74:	4479      	add	r1, pc
c0d01f76:	2220      	movs	r2, #32
c0d01f78:	4620      	mov	r0, r4
c0d01f7a:	f005 fb83 	bl	c0d07684 <memcmp>
c0d01f7e:	1e41      	subs	r1, r0, #1
c0d01f80:	4188      	sbcs	r0, r1
c0d01f82:	0040      	lsls	r0, r0, #1
c0d01f84:	bd10      	pop	{r4, pc}
c0d01f86:	2001      	movs	r0, #1
c0d01f88:	bd10      	pop	{r4, pc}
c0d01f8a:	46c0      	nop			; (mov r8, r8)
c0d01f8c:	0000615d 	.word	0x0000615d
c0d01f90:	000061c3 	.word	0x000061c3
c0d01f94:	000061d3 	.word	0x000061d3

c0d01f98 <name_to_string>:
c0d01f98:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d01f9a:	b087      	sub	sp, #28
c0d01f9c:	9301      	str	r3, [sp, #4]
c0d01f9e:	9202      	str	r2, [sp, #8]
c0d01fa0:	460e      	mov	r6, r1
c0d01fa2:	4607      	mov	r7, r0
c0d01fa4:	ad03      	add	r5, sp, #12
c0d01fa6:	202e      	movs	r0, #46	; 0x2e
c0d01fa8:	7328      	strb	r0, [r5, #12]
c0d01faa:	4823      	ldr	r0, [pc, #140]	; (c0d02038 <name_to_string+0xa0>)
c0d01fac:	9005      	str	r0, [sp, #20]
c0d01fae:	9004      	str	r0, [sp, #16]
c0d01fb0:	9003      	str	r0, [sp, #12]
c0d01fb2:	350c      	adds	r5, #12
c0d01fb4:	2400      	movs	r4, #0
c0d01fb6:	4620      	mov	r0, r4
c0d01fb8:	300d      	adds	r0, #13
c0d01fba:	d01c      	beq.n	c0d01ff6 <name_to_string+0x5e>
c0d01fbc:	2001      	movs	r0, #1
c0d01fbe:	4920      	ldr	r1, [pc, #128]	; (c0d02040 <name_to_string+0xa8>)
c0d01fc0:	4479      	add	r1, pc
c0d01fc2:	f7fe f94d 	bl	c0d00260 <assert>
c0d01fc6:	201f      	movs	r0, #31
c0d01fc8:	2c00      	cmp	r4, #0
c0d01fca:	d001      	beq.n	c0d01fd0 <name_to_string+0x38>
c0d01fcc:	4601      	mov	r1, r0
c0d01fce:	e000      	b.n	c0d01fd2 <name_to_string+0x3a>
c0d01fd0:	210f      	movs	r1, #15
c0d01fd2:	4039      	ands	r1, r7
c0d01fd4:	4a1b      	ldr	r2, [pc, #108]	; (c0d02044 <name_to_string+0xac>)
c0d01fd6:	447a      	add	r2, pc
c0d01fd8:	5c51      	ldrb	r1, [r2, r1]
c0d01fda:	5529      	strb	r1, [r5, r4]
c0d01fdc:	2c00      	cmp	r4, #0
c0d01fde:	d001      	beq.n	c0d01fe4 <name_to_string+0x4c>
c0d01fe0:	2105      	movs	r1, #5
c0d01fe2:	e000      	b.n	c0d01fe6 <name_to_string+0x4e>
c0d01fe4:	2104      	movs	r1, #4
c0d01fe6:	40cf      	lsrs	r7, r1
c0d01fe8:	4048      	eors	r0, r1
c0d01fea:	0072      	lsls	r2, r6, #1
c0d01fec:	4082      	lsls	r2, r0
c0d01fee:	4317      	orrs	r7, r2
c0d01ff0:	40ce      	lsrs	r6, r1
c0d01ff2:	1e64      	subs	r4, r4, #1
c0d01ff4:	e7df      	b.n	c0d01fb6 <name_to_string+0x1e>
c0d01ff6:	2001      	movs	r0, #1
c0d01ff8:	43c4      	mvns	r4, r0
c0d01ffa:	210e      	movs	r1, #14
c0d01ffc:	460d      	mov	r5, r1
c0d01ffe:	2901      	cmp	r1, #1
c0d02000:	d005      	beq.n	c0d0200e <name_to_string+0x76>
c0d02002:	a903      	add	r1, sp, #12
c0d02004:	1949      	adds	r1, r1, r5
c0d02006:	5d0a      	ldrb	r2, [r1, r4]
c0d02008:	1e69      	subs	r1, r5, #1
c0d0200a:	2a2e      	cmp	r2, #46	; 0x2e
c0d0200c:	d0f6      	beq.n	c0d01ffc <name_to_string+0x64>
c0d0200e:	2600      	movs	r6, #0
c0d02010:	9901      	ldr	r1, [sp, #4]
c0d02012:	428d      	cmp	r5, r1
c0d02014:	d300      	bcc.n	c0d02018 <name_to_string+0x80>
c0d02016:	4630      	mov	r0, r6
c0d02018:	4908      	ldr	r1, [pc, #32]	; (c0d0203c <name_to_string+0xa4>)
c0d0201a:	4479      	add	r1, pc
c0d0201c:	f7fe f920 	bl	c0d00260 <assert>
c0d02020:	1e6a      	subs	r2, r5, #1
c0d02022:	a903      	add	r1, sp, #12
c0d02024:	9f02      	ldr	r7, [sp, #8]
c0d02026:	4638      	mov	r0, r7
c0d02028:	f005 fb18 	bl	c0d0765c <__aeabi_memcpy>
c0d0202c:	1978      	adds	r0, r7, r5
c0d0202e:	1820      	adds	r0, r4, r0
c0d02030:	7046      	strb	r6, [r0, #1]
c0d02032:	b007      	add	sp, #28
c0d02034:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d02036:	46c0      	nop			; (mov r8, r8)
c0d02038:	2e2e2e2e 	.word	0x2e2e2e2e
c0d0203c:	000060c5 	.word	0x000060c5
c0d02040:	00006112 	.word	0x00006112
c0d02044:	00006130 	.word	0x00006130

c0d02048 <uint8array_name_to_string>:
c0d02048:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d0204a:	461c      	mov	r4, r3
c0d0204c:	4615      	mov	r5, r2
c0d0204e:	460e      	mov	r6, r1
c0d02050:	4607      	mov	r7, r0
c0d02052:	3908      	subs	r1, #8
c0d02054:	4248      	negs	r0, r1
c0d02056:	4148      	adcs	r0, r1
c0d02058:	490c      	ldr	r1, [pc, #48]	; (c0d0208c <uint8array_name_to_string+0x44>)
c0d0205a:	4479      	add	r1, pc
c0d0205c:	f7fe f900 	bl	c0d00260 <assert>
c0d02060:	2e09      	cmp	r6, #9
c0d02062:	d301      	bcc.n	c0d02068 <uint8array_name_to_string+0x20>
c0d02064:	2000      	movs	r0, #0
c0d02066:	e000      	b.n	c0d0206a <uint8array_name_to_string+0x22>
c0d02068:	2001      	movs	r0, #1
c0d0206a:	4909      	ldr	r1, [pc, #36]	; (c0d02090 <uint8array_name_to_string+0x48>)
c0d0206c:	4479      	add	r1, pc
c0d0206e:	f7fe f8f7 	bl	c0d00260 <assert>
c0d02072:	4668      	mov	r0, sp
c0d02074:	4639      	mov	r1, r7
c0d02076:	4632      	mov	r2, r6
c0d02078:	f005 faf0 	bl	c0d0765c <__aeabi_memcpy>
c0d0207c:	9901      	ldr	r1, [sp, #4]
c0d0207e:	9800      	ldr	r0, [sp, #0]
c0d02080:	462a      	mov	r2, r5
c0d02082:	4623      	mov	r3, r4
c0d02084:	f7ff ff88 	bl	c0d01f98 <name_to_string>
c0d02088:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d0208a:	46c0      	nop			; (mov r8, r8)
c0d0208c:	00006092 	.word	0x00006092
c0d02090:	0000608d 	.word	0x0000608d

c0d02094 <getPublicKey_handleAPDU>:
c0d02094:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d02096:	4607      	mov	r7, r0
c0d02098:	9808      	ldr	r0, [sp, #32]
c0d0209a:	2800      	cmp	r0, #0
c0d0209c:	d054      	beq.n	c0d02148 <getPublicKey_handleAPDU+0xb4>
c0d0209e:	1e78      	subs	r0, r7, #1
c0d020a0:	2802      	cmp	r0, #2
c0d020a2:	d24e      	bcs.n	c0d02142 <getPublicKey_handleAPDU+0xae>
c0d020a4:	9202      	str	r2, [sp, #8]
c0d020a6:	2900      	cmp	r1, #0
c0d020a8:	d14b      	bne.n	c0d02142 <getPublicKey_handleAPDU+0xae>
c0d020aa:	461d      	mov	r5, r3
c0d020ac:	4c2d      	ldr	r4, [pc, #180]	; (c0d02164 <getPublicKey_handleAPDU+0xd0>)
c0d020ae:	2184      	movs	r1, #132	; 0x84
c0d020b0:	4620      	mov	r0, r4
c0d020b2:	f005 fae3 	bl	c0d0767c <explicit_bzero>
c0d020b6:	2680      	movs	r6, #128	; 0x80
c0d020b8:	2000      	movs	r0, #0
c0d020ba:	9001      	str	r0, [sp, #4]
c0d020bc:	51a0      	str	r0, [r4, r6]
c0d020be:	2014      	movs	r0, #20
c0d020c0:	7020      	strb	r0, [r4, #0]
c0d020c2:	0aa9      	lsrs	r1, r5, #10
c0d020c4:	4248      	negs	r0, r1
c0d020c6:	4148      	adcs	r0, r1
c0d020c8:	4928      	ldr	r1, [pc, #160]	; (c0d0216c <getPublicKey_handleAPDU+0xd8>)
c0d020ca:	4479      	add	r1, pc
c0d020cc:	f7fe f8c8 	bl	c0d00260 <assert>
c0d020d0:	7067      	strb	r7, [r4, #1]
c0d020d2:	1d27      	adds	r7, r4, #4
c0d020d4:	4638      	mov	r0, r7
c0d020d6:	9902      	ldr	r1, [sp, #8]
c0d020d8:	462a      	mov	r2, r5
c0d020da:	f7fe f8c9 	bl	c0d00270 <bip44_parseFromWire>
c0d020de:	42a8      	cmp	r0, r5
c0d020e0:	d136      	bne.n	c0d02150 <getPublicKey_handleAPDU+0xbc>
c0d020e2:	9602      	str	r6, [sp, #8]
c0d020e4:	59a1      	ldr	r1, [r4, r6]
c0d020e6:	4248      	negs	r0, r1
c0d020e8:	4148      	adcs	r0, r1
c0d020ea:	4921      	ldr	r1, [pc, #132]	; (c0d02170 <getPublicKey_handleAPDU+0xdc>)
c0d020ec:	4479      	add	r1, pc
c0d020ee:	f7fe f8b7 	bl	c0d00260 <assert>
c0d020f2:	267c      	movs	r6, #124	; 0x7c
c0d020f4:	9801      	ldr	r0, [sp, #4]
c0d020f6:	53a0      	strh	r0, [r4, r6]
c0d020f8:	7861      	ldrb	r1, [r4, #1]
c0d020fa:	4638      	mov	r0, r7
c0d020fc:	f001 fc24 	bl	c0d03948 <policyForGetPublicKey>
c0d02100:	2801      	cmp	r0, #1
c0d02102:	d029      	beq.n	c0d02158 <getPublicKey_handleAPDU+0xc4>
c0d02104:	4605      	mov	r5, r0
c0d02106:	4621      	mov	r1, r4
c0d02108:	3130      	adds	r1, #48	; 0x30
c0d0210a:	4638      	mov	r0, r7
c0d0210c:	f000 fd40 	bl	c0d02b90 <derivePublicKey>
c0d02110:	4815      	ldr	r0, [pc, #84]	; (c0d02168 <getPublicKey_handleAPDU+0xd4>)
c0d02112:	53a0      	strh	r0, [r4, r6]
c0d02114:	2d02      	cmp	r5, #2
c0d02116:	d008      	beq.n	c0d0212a <getPublicKey_handleAPDU+0x96>
c0d02118:	2d03      	cmp	r5, #3
c0d0211a:	9902      	ldr	r1, [sp, #8]
c0d0211c:	d003      	beq.n	c0d02126 <getPublicKey_handleAPDU+0x92>
c0d0211e:	2d04      	cmp	r5, #4
c0d02120:	d107      	bne.n	c0d02132 <getPublicKey_handleAPDU+0x9e>
c0d02122:	20c8      	movs	r0, #200	; 0xc8
c0d02124:	e003      	b.n	c0d0212e <getPublicKey_handleAPDU+0x9a>
c0d02126:	20ca      	movs	r0, #202	; 0xca
c0d02128:	e001      	b.n	c0d0212e <getPublicKey_handleAPDU+0x9a>
c0d0212a:	20cc      	movs	r0, #204	; 0xcc
c0d0212c:	9902      	ldr	r1, [sp, #8]
c0d0212e:	5060      	str	r0, [r4, r1]
c0d02130:	e004      	b.n	c0d0213c <getPublicKey_handleAPDU+0xa8>
c0d02132:	2000      	movs	r0, #0
c0d02134:	490f      	ldr	r1, [pc, #60]	; (c0d02174 <getPublicKey_handleAPDU+0xe0>)
c0d02136:	4479      	add	r1, pc
c0d02138:	f7fe f892 	bl	c0d00260 <assert>
c0d0213c:	f000 f81c 	bl	c0d02178 <getPublicKey_ui_runStep>
c0d02140:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d02142:	4807      	ldr	r0, [pc, #28]	; (c0d02160 <getPublicKey_handleAPDU+0xcc>)
c0d02144:	f000 fd87 	bl	c0d02c56 <os_longjmp>
c0d02148:	4805      	ldr	r0, [pc, #20]	; (c0d02160 <getPublicKey_handleAPDU+0xcc>)
c0d0214a:	1c40      	adds	r0, r0, #1
c0d0214c:	f000 fd83 	bl	c0d02c56 <os_longjmp>
c0d02150:	4803      	ldr	r0, [pc, #12]	; (c0d02160 <getPublicKey_handleAPDU+0xcc>)
c0d02152:	1c80      	adds	r0, r0, #2
c0d02154:	f000 fd7f 	bl	c0d02c56 <os_longjmp>
c0d02158:	4801      	ldr	r0, [pc, #4]	; (c0d02160 <getPublicKey_handleAPDU+0xcc>)
c0d0215a:	300b      	adds	r0, #11
c0d0215c:	f000 fd7b 	bl	c0d02c56 <os_longjmp>
c0d02160:	00006e05 	.word	0x00006e05
c0d02164:	20000518 	.word	0x20000518
c0d02168:	00005ba0 	.word	0x00005ba0
c0d0216c:	0000609d 	.word	0x0000609d
c0d02170:	00006092 	.word	0x00006092
c0d02174:	0000605e 	.word	0x0000605e

c0d02178 <getPublicKey_ui_runStep>:
c0d02178:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0217a:	2780      	movs	r7, #128	; 0x80
c0d0217c:	4c38      	ldr	r4, [pc, #224]	; (c0d02260 <getPublicKey_ui_runStep+0xe8>)
c0d0217e:	59e0      	ldr	r0, [r4, r7]
c0d02180:	28c8      	cmp	r0, #200	; 0xc8
c0d02182:	d05a      	beq.n	c0d0223a <getPublicKey_ui_runStep+0xc2>
c0d02184:	28c9      	cmp	r0, #201	; 0xc9
c0d02186:	d032      	beq.n	c0d021ee <getPublicKey_ui_runStep+0x76>
c0d02188:	28ca      	cmp	r0, #202	; 0xca
c0d0218a:	d039      	beq.n	c0d02200 <getPublicKey_ui_runStep+0x88>
c0d0218c:	28cb      	cmp	r0, #203	; 0xcb
c0d0218e:	d041      	beq.n	c0d02214 <getPublicKey_ui_runStep+0x9c>
c0d02190:	28cc      	cmp	r0, #204	; 0xcc
c0d02192:	d14b      	bne.n	c0d0222c <getPublicKey_ui_runStep+0xb4>
c0d02194:	207c      	movs	r0, #124	; 0x7c
c0d02196:	9000      	str	r0, [sp, #0]
c0d02198:	5a20      	ldrh	r0, [r4, r0]
c0d0219a:	4932      	ldr	r1, [pc, #200]	; (c0d02264 <getPublicKey_ui_runStep+0xec>)
c0d0219c:	1841      	adds	r1, r0, r1
c0d0219e:	4248      	negs	r0, r1
c0d021a0:	4148      	adcs	r0, r1
c0d021a2:	493e      	ldr	r1, [pc, #248]	; (c0d0229c <getPublicKey_ui_runStep+0x124>)
c0d021a4:	4479      	add	r1, pc
c0d021a6:	f7fe f85b 	bl	c0d00260 <assert>
c0d021aa:	4625      	mov	r5, r4
c0d021ac:	3538      	adds	r5, #56	; 0x38
c0d021ae:	482e      	ldr	r0, [pc, #184]	; (c0d02268 <getPublicKey_ui_runStep+0xf0>)
c0d021b0:	2641      	movs	r6, #65	; 0x41
c0d021b2:	4629      	mov	r1, r5
c0d021b4:	4632      	mov	r2, r6
c0d021b6:	f005 fa51 	bl	c0d0765c <__aeabi_memcpy>
c0d021ba:	4a2b      	ldr	r2, [pc, #172]	; (c0d02268 <getPublicKey_ui_runStep+0xf0>)
c0d021bc:	3241      	adds	r2, #65	; 0x41
c0d021be:	2337      	movs	r3, #55	; 0x37
c0d021c0:	4628      	mov	r0, r5
c0d021c2:	4631      	mov	r1, r6
c0d021c4:	f7ff fe8a 	bl	c0d01edc <public_key_to_wif>
c0d021c8:	4602      	mov	r2, r0
c0d021ca:	3240      	adds	r2, #64	; 0x40
c0d021cc:	2009      	movs	r0, #9
c0d021ce:	0300      	lsls	r0, r0, #12
c0d021d0:	4925      	ldr	r1, [pc, #148]	; (c0d02268 <getPublicKey_ui_runStep+0xf0>)
c0d021d2:	f000 f951 	bl	c0d02478 <io_send_buf>
c0d021d6:	2500      	movs	r5, #0
c0d021d8:	9800      	ldr	r0, [sp, #0]
c0d021da:	5225      	strh	r5, [r4, r0]
c0d021dc:	f003 fd08 	bl	c0d05bf0 <ui_displayBusy>
c0d021e0:	7820      	ldrb	r0, [r4, #0]
c0d021e2:	2814      	cmp	r0, #20
c0d021e4:	d133      	bne.n	c0d0224e <getPublicKey_ui_runStep+0xd6>
c0d021e6:	7025      	strb	r5, [r4, #0]
c0d021e8:	f7fd ff56 	bl	c0d00098 <ui_idle>
c0d021ec:	e034      	b.n	c0d02258 <getPublicKey_ui_runStep+0xe0>
c0d021ee:	1d21      	adds	r1, r4, #4
c0d021f0:	4822      	ldr	r0, [pc, #136]	; (c0d0227c <getPublicKey_ui_runStep+0x104>)
c0d021f2:	4478      	add	r0, pc
c0d021f4:	4a22      	ldr	r2, [pc, #136]	; (c0d02280 <getPublicKey_ui_runStep+0x108>)
c0d021f6:	447a      	add	r2, pc
c0d021f8:	f003 fed8 	bl	c0d05fac <ui_displayPathScreen>
c0d021fc:	20ca      	movs	r0, #202	; 0xca
c0d021fe:	e02c      	b.n	c0d0225a <getPublicKey_ui_runStep+0xe2>
c0d02200:	4621      	mov	r1, r4
c0d02202:	3130      	adds	r1, #48	; 0x30
c0d02204:	481f      	ldr	r0, [pc, #124]	; (c0d02284 <getPublicKey_ui_runStep+0x10c>)
c0d02206:	4478      	add	r0, pc
c0d02208:	4a1f      	ldr	r2, [pc, #124]	; (c0d02288 <getPublicKey_ui_runStep+0x110>)
c0d0220a:	447a      	add	r2, pc
c0d0220c:	f003 fef6 	bl	c0d05ffc <ui_displayPubkeyScreen>
c0d02210:	20cb      	movs	r0, #203	; 0xcb
c0d02212:	e022      	b.n	c0d0225a <getPublicKey_ui_runStep+0xe2>
c0d02214:	481d      	ldr	r0, [pc, #116]	; (c0d0228c <getPublicKey_ui_runStep+0x114>)
c0d02216:	4478      	add	r0, pc
c0d02218:	491d      	ldr	r1, [pc, #116]	; (c0d02290 <getPublicKey_ui_runStep+0x118>)
c0d0221a:	4479      	add	r1, pc
c0d0221c:	4a1d      	ldr	r2, [pc, #116]	; (c0d02294 <getPublicKey_ui_runStep+0x11c>)
c0d0221e:	447a      	add	r2, pc
c0d02220:	4b1d      	ldr	r3, [pc, #116]	; (c0d02298 <getPublicKey_ui_runStep+0x120>)
c0d02222:	447b      	add	r3, pc
c0d02224:	f003 fb2c 	bl	c0d05880 <ui_displayPrompt>
c0d02228:	20cc      	movs	r0, #204	; 0xcc
c0d0222a:	e016      	b.n	c0d0225a <getPublicKey_ui_runStep+0xe2>
c0d0222c:	2000      	movs	r0, #0
c0d0222e:	490f      	ldr	r1, [pc, #60]	; (c0d0226c <getPublicKey_ui_runStep+0xf4>)
c0d02230:	4479      	add	r1, pc
c0d02232:	f7fe f815 	bl	c0d00260 <assert>
c0d02236:	20c8      	movs	r0, #200	; 0xc8
c0d02238:	e00f      	b.n	c0d0225a <getPublicKey_ui_runStep+0xe2>
c0d0223a:	480d      	ldr	r0, [pc, #52]	; (c0d02270 <getPublicKey_ui_runStep+0xf8>)
c0d0223c:	4478      	add	r0, pc
c0d0223e:	490d      	ldr	r1, [pc, #52]	; (c0d02274 <getPublicKey_ui_runStep+0xfc>)
c0d02240:	4479      	add	r1, pc
c0d02242:	4a0d      	ldr	r2, [pc, #52]	; (c0d02278 <getPublicKey_ui_runStep+0x100>)
c0d02244:	447a      	add	r2, pc
c0d02246:	f003 fb77 	bl	c0d05938 <ui_displayPaginatedText>
c0d0224a:	20c9      	movs	r0, #201	; 0xc9
c0d0224c:	e005      	b.n	c0d0225a <getPublicKey_ui_runStep+0xe2>
c0d0224e:	2000      	movs	r0, #0
c0d02250:	4913      	ldr	r1, [pc, #76]	; (c0d022a0 <getPublicKey_ui_runStep+0x128>)
c0d02252:	4479      	add	r1, pc
c0d02254:	f7fe f804 	bl	c0d00260 <assert>
c0d02258:	20cd      	movs	r0, #205	; 0xcd
c0d0225a:	51e0      	str	r0, [r4, r7]
c0d0225c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d0225e:	46c0      	nop			; (mov r8, r8)
c0d02260:	20000518 	.word	0x20000518
c0d02264:	ffffa460 	.word	0xffffa460
c0d02268:	20000398 	.word	0x20000398
c0d0226c:	00005f7b 	.word	0x00005f7b
c0d02270:	00005f85 	.word	0x00005f85
c0d02274:	00005f91 	.word	0x00005f91
c0d02278:	ffffff31 	.word	0xffffff31
c0d0227c:	00005ff1 	.word	0x00005ff1
c0d02280:	ffffff7f 	.word	0xffffff7f
c0d02284:	00005fef 	.word	0x00005fef
c0d02288:	ffffff6b 	.word	0xffffff6b
c0d0228c:	00005fea 	.word	0x00005fea
c0d02290:	00005ff5 	.word	0x00005ff5
c0d02294:	ffffff57 	.word	0xffffff57
c0d02298:	000037db 	.word	0x000037db
c0d0229c:	00006077 	.word	0x00006077
c0d022a0:	00005fdf 	.word	0x00005fdf

c0d022a4 <getSerial_handleAPDU>:
c0d022a4:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d022a6:	2800      	cmp	r0, #0
c0d022a8:	d119      	bne.n	c0d022de <getSerial_handleAPDU+0x3a>
c0d022aa:	2900      	cmp	r1, #0
c0d022ac:	d117      	bne.n	c0d022de <getSerial_handleAPDU+0x3a>
c0d022ae:	2b00      	cmp	r3, #0
c0d022b0:	d115      	bne.n	c0d022de <getSerial_handleAPDU+0x3a>
c0d022b2:	466c      	mov	r4, sp
c0d022b4:	2507      	movs	r5, #7
c0d022b6:	4620      	mov	r0, r4
c0d022b8:	4629      	mov	r1, r5
c0d022ba:	f003 f8db 	bl	c0d05474 <os_serial>
c0d022be:	1fc1      	subs	r1, r0, #7
c0d022c0:	4248      	negs	r0, r1
c0d022c2:	4148      	adcs	r0, r1
c0d022c4:	4908      	ldr	r1, [pc, #32]	; (c0d022e8 <getSerial_handleAPDU+0x44>)
c0d022c6:	4479      	add	r1, pc
c0d022c8:	f7fd ffca 	bl	c0d00260 <assert>
c0d022cc:	2009      	movs	r0, #9
c0d022ce:	0300      	lsls	r0, r0, #12
c0d022d0:	4621      	mov	r1, r4
c0d022d2:	462a      	mov	r2, r5
c0d022d4:	f000 f8d0 	bl	c0d02478 <io_send_buf>
c0d022d8:	f7fd fede 	bl	c0d00098 <ui_idle>
c0d022dc:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d022de:	4801      	ldr	r0, [pc, #4]	; (c0d022e4 <getSerial_handleAPDU+0x40>)
c0d022e0:	f000 fcb9 	bl	c0d02c56 <os_longjmp>
c0d022e4:	00006e05 	.word	0x00006e05
c0d022e8:	00005f81 	.word	0x00005f81

c0d022ec <getVersion_handleAPDU>:
c0d022ec:	b5e0      	push	{r5, r6, r7, lr}
c0d022ee:	2800      	cmp	r0, #0
c0d022f0:	d10e      	bne.n	c0d02310 <getVersion_handleAPDU+0x24>
c0d022f2:	2900      	cmp	r1, #0
c0d022f4:	d10c      	bne.n	c0d02310 <getVersion_handleAPDU+0x24>
c0d022f6:	2b00      	cmp	r3, #0
c0d022f8:	d10d      	bne.n	c0d02316 <getVersion_handleAPDU+0x2a>
c0d022fa:	480a      	ldr	r0, [pc, #40]	; (c0d02324 <getVersion_handleAPDU+0x38>)
c0d022fc:	9001      	str	r0, [sp, #4]
c0d022fe:	2009      	movs	r0, #9
c0d02300:	0300      	lsls	r0, r0, #12
c0d02302:	a901      	add	r1, sp, #4
c0d02304:	2204      	movs	r2, #4
c0d02306:	f000 f8b7 	bl	c0d02478 <io_send_buf>
c0d0230a:	f7fd fec5 	bl	c0d00098 <ui_idle>
c0d0230e:	bd8c      	pop	{r2, r3, r7, pc}
c0d02310:	4803      	ldr	r0, [pc, #12]	; (c0d02320 <getVersion_handleAPDU+0x34>)
c0d02312:	f000 fca0 	bl	c0d02c56 <os_longjmp>
c0d02316:	4802      	ldr	r0, [pc, #8]	; (c0d02320 <getVersion_handleAPDU+0x34>)
c0d02318:	1c80      	adds	r0, r0, #2
c0d0231a:	f000 fc9c 	bl	c0d02c56 <os_longjmp>
c0d0231e:	46c0      	nop			; (mov r8, r8)
c0d02320:	00006e05 	.word	0x00006e05
c0d02324:	00050001 	.word	0x00050001

c0d02328 <lookupHandler>:
c0d02328:	2800      	cmp	r0, #0
c0d0232a:	d00a      	beq.n	c0d02342 <lookupHandler+0x1a>
c0d0232c:	2830      	cmp	r0, #48	; 0x30
c0d0232e:	d00b      	beq.n	c0d02348 <lookupHandler+0x20>
c0d02330:	2810      	cmp	r0, #16
c0d02332:	d00c      	beq.n	c0d0234e <lookupHandler+0x26>
c0d02334:	2820      	cmp	r0, #32
c0d02336:	d00d      	beq.n	c0d02354 <lookupHandler+0x2c>
c0d02338:	2801      	cmp	r0, #1
c0d0233a:	d10e      	bne.n	c0d0235a <lookupHandler+0x32>
c0d0233c:	4809      	ldr	r0, [pc, #36]	; (c0d02364 <lookupHandler+0x3c>)
c0d0233e:	4478      	add	r0, pc
c0d02340:	4770      	bx	lr
c0d02342:	4807      	ldr	r0, [pc, #28]	; (c0d02360 <lookupHandler+0x38>)
c0d02344:	4478      	add	r0, pc
c0d02346:	4770      	bx	lr
c0d02348:	4809      	ldr	r0, [pc, #36]	; (c0d02370 <lookupHandler+0x48>)
c0d0234a:	4478      	add	r0, pc
c0d0234c:	4770      	bx	lr
c0d0234e:	4806      	ldr	r0, [pc, #24]	; (c0d02368 <lookupHandler+0x40>)
c0d02350:	4478      	add	r0, pc
c0d02352:	4770      	bx	lr
c0d02354:	4805      	ldr	r0, [pc, #20]	; (c0d0236c <lookupHandler+0x44>)
c0d02356:	4478      	add	r0, pc
c0d02358:	4770      	bx	lr
c0d0235a:	2000      	movs	r0, #0
c0d0235c:	4770      	bx	lr
c0d0235e:	46c0      	nop			; (mov r8, r8)
c0d02360:	ffffffa5 	.word	0xffffffa5
c0d02364:	ffffff63 	.word	0xffffff63
c0d02368:	fffffd41 	.word	0xfffffd41
c0d0236c:	00002267 	.word	0x00002267
c0d02370:	ffffe243 	.word	0xffffe243

c0d02374 <encode_hex>:
c0d02374:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d02376:	461c      	mov	r4, r3
c0d02378:	9202      	str	r2, [sp, #8]
c0d0237a:	460d      	mov	r5, r1
c0d0237c:	4606      	mov	r6, r0
c0d0237e:	0a89      	lsrs	r1, r1, #10
c0d02380:	4248      	negs	r0, r1
c0d02382:	4148      	adcs	r0, r1
c0d02384:	4918      	ldr	r1, [pc, #96]	; (c0d023e8 <encode_hex+0x74>)
c0d02386:	4479      	add	r1, pc
c0d02388:	4f18      	ldr	r7, [pc, #96]	; (c0d023ec <encode_hex+0x78>)
c0d0238a:	447f      	add	r7, pc
c0d0238c:	47b8      	blx	r7
c0d0238e:	0aa1      	lsrs	r1, r4, #10
c0d02390:	4248      	negs	r0, r1
c0d02392:	4148      	adcs	r0, r1
c0d02394:	4916      	ldr	r1, [pc, #88]	; (c0d023f0 <encode_hex+0x7c>)
c0d02396:	4479      	add	r1, pc
c0d02398:	47b8      	blx	r7
c0d0239a:	0068      	lsls	r0, r5, #1
c0d0239c:	9001      	str	r0, [sp, #4]
c0d0239e:	1c40      	adds	r0, r0, #1
c0d023a0:	42a0      	cmp	r0, r4
c0d023a2:	d901      	bls.n	c0d023a8 <encode_hex+0x34>
c0d023a4:	2000      	movs	r0, #0
c0d023a6:	e000      	b.n	c0d023aa <encode_hex+0x36>
c0d023a8:	2001      	movs	r0, #1
c0d023aa:	4912      	ldr	r1, [pc, #72]	; (c0d023f4 <encode_hex+0x80>)
c0d023ac:	4479      	add	r1, pc
c0d023ae:	47b8      	blx	r7
c0d023b0:	4811      	ldr	r0, [pc, #68]	; (c0d023f8 <encode_hex+0x84>)
c0d023b2:	4478      	add	r0, pc
c0d023b4:	9c02      	ldr	r4, [sp, #8]
c0d023b6:	4621      	mov	r1, r4
c0d023b8:	2d00      	cmp	r5, #0
c0d023ba:	d00c      	beq.n	c0d023d6 <encode_hex+0x62>
c0d023bc:	7832      	ldrb	r2, [r6, #0]
c0d023be:	0912      	lsrs	r2, r2, #4
c0d023c0:	5c82      	ldrb	r2, [r0, r2]
c0d023c2:	700a      	strb	r2, [r1, #0]
c0d023c4:	7832      	ldrb	r2, [r6, #0]
c0d023c6:	230f      	movs	r3, #15
c0d023c8:	4013      	ands	r3, r2
c0d023ca:	5cc2      	ldrb	r2, [r0, r3]
c0d023cc:	704a      	strb	r2, [r1, #1]
c0d023ce:	1c76      	adds	r6, r6, #1
c0d023d0:	1c89      	adds	r1, r1, #2
c0d023d2:	1e6d      	subs	r5, r5, #1
c0d023d4:	e7f0      	b.n	c0d023b8 <encode_hex+0x44>
c0d023d6:	2001      	movs	r0, #1
c0d023d8:	4908      	ldr	r1, [pc, #32]	; (c0d023fc <encode_hex+0x88>)
c0d023da:	4479      	add	r1, pc
c0d023dc:	f7fd ff40 	bl	c0d00260 <assert>
c0d023e0:	2100      	movs	r1, #0
c0d023e2:	9801      	ldr	r0, [sp, #4]
c0d023e4:	5421      	strb	r1, [r4, r0]
c0d023e6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d023e8:	00005f46 	.word	0x00005f46
c0d023ec:	ffffded3 	.word	0xffffded3
c0d023f0:	00005f48 	.word	0x00005f48
c0d023f4:	00005f44 	.word	0x00005f44
c0d023f8:	00005f50 	.word	0x00005f50
c0d023fc:	00005f39 	.word	0x00005f39

c0d02400 <nanos_clear_timer>:
c0d02400:	4801      	ldr	r0, [pc, #4]	; (c0d02408 <nanos_clear_timer+0x8>)
c0d02402:	2100      	movs	r1, #0
c0d02404:	6001      	str	r1, [r0, #0]
c0d02406:	4770      	bx	lr
c0d02408:	20000280 	.word	0x20000280

c0d0240c <CHECK_RESPONSE_SIZE>:
c0d0240c:	b570      	push	{r4, r5, r6, lr}
c0d0240e:	4605      	mov	r5, r0
c0d02410:	0880      	lsrs	r0, r0, #2
c0d02412:	2401      	movs	r4, #1
c0d02414:	2600      	movs	r6, #0
c0d02416:	2841      	cmp	r0, #65	; 0x41
c0d02418:	4620      	mov	r0, r4
c0d0241a:	d300      	bcc.n	c0d0241e <CHECK_RESPONSE_SIZE+0x12>
c0d0241c:	4630      	mov	r0, r6
c0d0241e:	4907      	ldr	r1, [pc, #28]	; (c0d0243c <CHECK_RESPONSE_SIZE+0x30>)
c0d02420:	4479      	add	r1, pc
c0d02422:	f7fd ff1d 	bl	c0d00260 <assert>
c0d02426:	1ca8      	adds	r0, r5, #2
c0d02428:	0880      	lsrs	r0, r0, #2
c0d0242a:	2841      	cmp	r0, #65	; 0x41
c0d0242c:	d300      	bcc.n	c0d02430 <CHECK_RESPONSE_SIZE+0x24>
c0d0242e:	4634      	mov	r4, r6
c0d02430:	4903      	ldr	r1, [pc, #12]	; (c0d02440 <CHECK_RESPONSE_SIZE+0x34>)
c0d02432:	4479      	add	r1, pc
c0d02434:	4620      	mov	r0, r4
c0d02436:	f7fd ff13 	bl	c0d00260 <assert>
c0d0243a:	bd70      	pop	{r4, r5, r6, pc}
c0d0243c:	00005f1f 	.word	0x00005f1f
c0d02440:	00005f1a 	.word	0x00005f1a

c0d02444 <_io_send_G_io_apdu_buffer>:
c0d02444:	b5b0      	push	{r4, r5, r7, lr}
c0d02446:	460c      	mov	r4, r1
c0d02448:	4605      	mov	r5, r0
c0d0244a:	4608      	mov	r0, r1
c0d0244c:	f7ff ffde 	bl	c0d0240c <CHECK_RESPONSE_SIZE>
c0d02450:	0a28      	lsrs	r0, r5, #8
c0d02452:	4907      	ldr	r1, [pc, #28]	; (c0d02470 <_io_send_G_io_apdu_buffer+0x2c>)
c0d02454:	5508      	strb	r0, [r1, r4]
c0d02456:	1c60      	adds	r0, r4, #1
c0d02458:	b280      	uxth	r0, r0
c0d0245a:	540d      	strb	r5, [r1, r0]
c0d0245c:	1ca0      	adds	r0, r4, #2
c0d0245e:	b281      	uxth	r1, r0
c0d02460:	2020      	movs	r0, #32
c0d02462:	f000 fe23 	bl	c0d030ac <io_exchange>
c0d02466:	4803      	ldr	r0, [pc, #12]	; (c0d02474 <_io_send_G_io_apdu_buffer+0x30>)
c0d02468:	212a      	movs	r1, #42	; 0x2a
c0d0246a:	7001      	strb	r1, [r0, #0]
c0d0246c:	bdb0      	pop	{r4, r5, r7, pc}
c0d0246e:	46c0      	nop			; (mov r8, r8)
c0d02470:	20000398 	.word	0x20000398
c0d02474:	20000284 	.word	0x20000284

c0d02478 <io_send_buf>:
c0d02478:	b570      	push	{r4, r5, r6, lr}
c0d0247a:	4614      	mov	r4, r2
c0d0247c:	460d      	mov	r5, r1
c0d0247e:	4606      	mov	r6, r0
c0d02480:	4610      	mov	r0, r2
c0d02482:	f7ff ffc3 	bl	c0d0240c <CHECK_RESPONSE_SIZE>
c0d02486:	4805      	ldr	r0, [pc, #20]	; (c0d0249c <io_send_buf+0x24>)
c0d02488:	4629      	mov	r1, r5
c0d0248a:	4622      	mov	r2, r4
c0d0248c:	f005 f8ea 	bl	c0d07664 <__aeabi_memmove>
c0d02490:	b2a1      	uxth	r1, r4
c0d02492:	4630      	mov	r0, r6
c0d02494:	f7ff ffd6 	bl	c0d02444 <_io_send_G_io_apdu_buffer>
c0d02498:	bd70      	pop	{r4, r5, r6, pc}
c0d0249a:	46c0      	nop			; (mov r8, r8)
c0d0249c:	20000398 	.word	0x20000398

c0d024a0 <io_seproxyhal_display>:
c0d024a0:	b580      	push	{r7, lr}
c0d024a2:	f000 fd5d 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d024a6:	bd80      	pop	{r7, pc}

c0d024a8 <io_event>:
c0d024a8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d024aa:	4dfd      	ldr	r5, [pc, #1012]	; (c0d028a0 <io_event+0x3f8>)
c0d024ac:	7828      	ldrb	r0, [r5, #0]
c0d024ae:	2805      	cmp	r0, #5
c0d024b0:	d010      	beq.n	c0d024d4 <io_event+0x2c>
c0d024b2:	2815      	cmp	r0, #21
c0d024b4:	d035      	beq.n	c0d02522 <io_event+0x7a>
c0d024b6:	280d      	cmp	r0, #13
c0d024b8:	d100      	bne.n	c0d024bc <io_event+0x14>
c0d024ba:	e089      	b.n	c0d025d0 <io_event+0x128>
c0d024bc:	280e      	cmp	r0, #14
c0d024be:	d100      	bne.n	c0d024c2 <io_event+0x1a>
c0d024c0:	e0cd      	b.n	c0d0265e <io_event+0x1b6>
c0d024c2:	280c      	cmp	r0, #12
c0d024c4:	d000      	beq.n	c0d024c8 <io_event+0x20>
c0d024c6:	e11a      	b.n	c0d026fe <io_event+0x256>
c0d024c8:	2000      	movs	r0, #0
c0d024ca:	49f6      	ldr	r1, [pc, #984]	; (c0d028a4 <io_event+0x3fc>)
c0d024cc:	4479      	add	r1, pc
c0d024ce:	f7fd fec7 	bl	c0d00260 <assert>
c0d024d2:	e25b      	b.n	c0d0298c <io_event+0x4e4>
c0d024d4:	4cf4      	ldr	r4, [pc, #976]	; (c0d028a8 <io_event+0x400>)
c0d024d6:	2700      	movs	r7, #0
c0d024d8:	6067      	str	r7, [r4, #4]
c0d024da:	2001      	movs	r0, #1
c0d024dc:	7020      	strb	r0, [r4, #0]
c0d024de:	4620      	mov	r0, r4
c0d024e0:	f002 ffb2 	bl	c0d05448 <os_ux>
c0d024e4:	2004      	movs	r0, #4
c0d024e6:	f003 f81f 	bl	c0d05528 <os_sched_last_status>
c0d024ea:	6060      	str	r0, [r4, #4]
c0d024ec:	2800      	cmp	r0, #0
c0d024ee:	d100      	bne.n	c0d024f2 <io_event+0x4a>
c0d024f0:	e24c      	b.n	c0d0298c <io_event+0x4e4>
c0d024f2:	2897      	cmp	r0, #151	; 0x97
c0d024f4:	d100      	bne.n	c0d024f8 <io_event+0x50>
c0d024f6:	e249      	b.n	c0d0298c <io_event+0x4e4>
c0d024f8:	2869      	cmp	r0, #105	; 0x69
c0d024fa:	d000      	beq.n	c0d024fe <io_event+0x56>
c0d024fc:	e208      	b.n	c0d02910 <io_event+0x468>
c0d024fe:	f000 fcd7 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d02502:	f000 fcd7 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d02506:	25c2      	movs	r5, #194	; 0xc2
c0d02508:	4ee8      	ldr	r6, [pc, #928]	; (c0d028ac <io_event+0x404>)
c0d0250a:	5377      	strh	r7, [r6, r5]
c0d0250c:	2004      	movs	r0, #4
c0d0250e:	f003 f80b 	bl	c0d05528 <os_sched_last_status>
c0d02512:	6060      	str	r0, [r4, #4]
c0d02514:	2800      	cmp	r0, #0
c0d02516:	d100      	bne.n	c0d0251a <io_event+0x72>
c0d02518:	e238      	b.n	c0d0298c <io_event+0x4e4>
c0d0251a:	2897      	cmp	r0, #151	; 0x97
c0d0251c:	d100      	bne.n	c0d02520 <io_event+0x78>
c0d0251e:	e235      	b.n	c0d0298c <io_event+0x4e4>
c0d02520:	e166      	b.n	c0d027f0 <io_event+0x348>
c0d02522:	48e3      	ldr	r0, [pc, #908]	; (c0d028b0 <io_event+0x408>)
c0d02524:	7980      	ldrb	r0, [r0, #6]
c0d02526:	2801      	cmp	r0, #1
c0d02528:	d103      	bne.n	c0d02532 <io_event+0x8a>
c0d0252a:	79a8      	ldrb	r0, [r5, #6]
c0d0252c:	0700      	lsls	r0, r0, #28
c0d0252e:	d400      	bmi.n	c0d02532 <io_event+0x8a>
c0d02530:	e2ae      	b.n	c0d02a90 <io_event+0x5e8>
c0d02532:	4cdd      	ldr	r4, [pc, #884]	; (c0d028a8 <io_event+0x400>)
c0d02534:	2700      	movs	r7, #0
c0d02536:	6067      	str	r7, [r4, #4]
c0d02538:	2001      	movs	r0, #1
c0d0253a:	7020      	strb	r0, [r4, #0]
c0d0253c:	4620      	mov	r0, r4
c0d0253e:	f002 ff83 	bl	c0d05448 <os_ux>
c0d02542:	2004      	movs	r0, #4
c0d02544:	f002 fff0 	bl	c0d05528 <os_sched_last_status>
c0d02548:	6060      	str	r0, [r4, #4]
c0d0254a:	2869      	cmp	r0, #105	; 0x69
c0d0254c:	d000      	beq.n	c0d02550 <io_event+0xa8>
c0d0254e:	e1b1      	b.n	c0d028b4 <io_event+0x40c>
c0d02550:	f000 fcae 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d02554:	f000 fcae 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d02558:	25c2      	movs	r5, #194	; 0xc2
c0d0255a:	4ed4      	ldr	r6, [pc, #848]	; (c0d028ac <io_event+0x404>)
c0d0255c:	5377      	strh	r7, [r6, r5]
c0d0255e:	2004      	movs	r0, #4
c0d02560:	f002 ffe2 	bl	c0d05528 <os_sched_last_status>
c0d02564:	6060      	str	r0, [r4, #4]
c0d02566:	2800      	cmp	r0, #0
c0d02568:	d100      	bne.n	c0d0256c <io_event+0xc4>
c0d0256a:	e20f      	b.n	c0d0298c <io_event+0x4e4>
c0d0256c:	2897      	cmp	r0, #151	; 0x97
c0d0256e:	d12a      	bne.n	c0d025c6 <io_event+0x11e>
c0d02570:	e20c      	b.n	c0d0298c <io_event+0x4e4>
c0d02572:	20c8      	movs	r0, #200	; 0xc8
c0d02574:	5c30      	ldrb	r0, [r6, r0]
c0d02576:	5b71      	ldrh	r1, [r6, r5]
c0d02578:	4281      	cmp	r1, r0
c0d0257a:	d300      	bcc.n	c0d0257e <io_event+0xd6>
c0d0257c:	e206      	b.n	c0d0298c <io_event+0x4e4>
c0d0257e:	f002 ffa7 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02582:	2800      	cmp	r0, #0
c0d02584:	d000      	beq.n	c0d02588 <io_event+0xe0>
c0d02586:	e201      	b.n	c0d0298c <io_event+0x4e4>
c0d02588:	f002 ff2a 	bl	c0d053e0 <os_perso_isonboarded>
c0d0258c:	28aa      	cmp	r0, #170	; 0xaa
c0d0258e:	d104      	bne.n	c0d0259a <io_event+0xf2>
c0d02590:	f002 ff4e 	bl	c0d05430 <os_global_pin_is_validated>
c0d02594:	28aa      	cmp	r0, #170	; 0xaa
c0d02596:	d000      	beq.n	c0d0259a <io_event+0xf2>
c0d02598:	e1f8      	b.n	c0d0298c <io_event+0x4e4>
c0d0259a:	5931      	ldr	r1, [r6, r4]
c0d0259c:	5b72      	ldrh	r2, [r6, r5]
c0d0259e:	0150      	lsls	r0, r2, #5
c0d025a0:	1808      	adds	r0, r1, r0
c0d025a2:	23d0      	movs	r3, #208	; 0xd0
c0d025a4:	58f3      	ldr	r3, [r6, r3]
c0d025a6:	2b00      	cmp	r3, #0
c0d025a8:	d004      	beq.n	c0d025b4 <io_event+0x10c>
c0d025aa:	4798      	blx	r3
c0d025ac:	2800      	cmp	r0, #0
c0d025ae:	d007      	beq.n	c0d025c0 <io_event+0x118>
c0d025b0:	5b72      	ldrh	r2, [r6, r5]
c0d025b2:	5931      	ldr	r1, [r6, r4]
c0d025b4:	2801      	cmp	r0, #1
c0d025b6:	d101      	bne.n	c0d025bc <io_event+0x114>
c0d025b8:	0150      	lsls	r0, r2, #5
c0d025ba:	1808      	adds	r0, r1, r0
c0d025bc:	f000 fcd0 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d025c0:	5b70      	ldrh	r0, [r6, r5]
c0d025c2:	1c40      	adds	r0, r0, #1
c0d025c4:	5370      	strh	r0, [r6, r5]
c0d025c6:	24c4      	movs	r4, #196	; 0xc4
c0d025c8:	5930      	ldr	r0, [r6, r4]
c0d025ca:	2800      	cmp	r0, #0
c0d025cc:	d1d1      	bne.n	c0d02572 <io_event+0xca>
c0d025ce:	e1dd      	b.n	c0d0298c <io_event+0x4e4>
c0d025d0:	4cb5      	ldr	r4, [pc, #724]	; (c0d028a8 <io_event+0x400>)
c0d025d2:	2700      	movs	r7, #0
c0d025d4:	6067      	str	r7, [r4, #4]
c0d025d6:	2001      	movs	r0, #1
c0d025d8:	7020      	strb	r0, [r4, #0]
c0d025da:	4620      	mov	r0, r4
c0d025dc:	f002 ff34 	bl	c0d05448 <os_ux>
c0d025e0:	2004      	movs	r0, #4
c0d025e2:	f002 ffa1 	bl	c0d05528 <os_sched_last_status>
c0d025e6:	6060      	str	r0, [r4, #4]
c0d025e8:	2800      	cmp	r0, #0
c0d025ea:	d100      	bne.n	c0d025ee <io_event+0x146>
c0d025ec:	e1ce      	b.n	c0d0298c <io_event+0x4e4>
c0d025ee:	2869      	cmp	r0, #105	; 0x69
c0d025f0:	d100      	bne.n	c0d025f4 <io_event+0x14c>
c0d025f2:	e1d3      	b.n	c0d0299c <io_event+0x4f4>
c0d025f4:	2897      	cmp	r0, #151	; 0x97
c0d025f6:	d100      	bne.n	c0d025fa <io_event+0x152>
c0d025f8:	e1c8      	b.n	c0d0298c <io_event+0x4e4>
c0d025fa:	4cac      	ldr	r4, [pc, #688]	; (c0d028ac <io_event+0x404>)
c0d025fc:	26c4      	movs	r6, #196	; 0xc4
c0d025fe:	59a0      	ldr	r0, [r4, r6]
c0d02600:	2800      	cmp	r0, #0
c0d02602:	d100      	bne.n	c0d02606 <io_event+0x15e>
c0d02604:	e1ba      	b.n	c0d0297c <io_event+0x4d4>
c0d02606:	20c8      	movs	r0, #200	; 0xc8
c0d02608:	5c20      	ldrb	r0, [r4, r0]
c0d0260a:	25c2      	movs	r5, #194	; 0xc2
c0d0260c:	5b61      	ldrh	r1, [r4, r5]
c0d0260e:	4281      	cmp	r1, r0
c0d02610:	d300      	bcc.n	c0d02614 <io_event+0x16c>
c0d02612:	e1b3      	b.n	c0d0297c <io_event+0x4d4>
c0d02614:	f002 ff5c 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02618:	2800      	cmp	r0, #0
c0d0261a:	d000      	beq.n	c0d0261e <io_event+0x176>
c0d0261c:	e1ae      	b.n	c0d0297c <io_event+0x4d4>
c0d0261e:	f002 fedf 	bl	c0d053e0 <os_perso_isonboarded>
c0d02622:	28aa      	cmp	r0, #170	; 0xaa
c0d02624:	d104      	bne.n	c0d02630 <io_event+0x188>
c0d02626:	f002 ff03 	bl	c0d05430 <os_global_pin_is_validated>
c0d0262a:	28aa      	cmp	r0, #170	; 0xaa
c0d0262c:	d000      	beq.n	c0d02630 <io_event+0x188>
c0d0262e:	e1a5      	b.n	c0d0297c <io_event+0x4d4>
c0d02630:	59a1      	ldr	r1, [r4, r6]
c0d02632:	5b62      	ldrh	r2, [r4, r5]
c0d02634:	0150      	lsls	r0, r2, #5
c0d02636:	1808      	adds	r0, r1, r0
c0d02638:	23d0      	movs	r3, #208	; 0xd0
c0d0263a:	58e3      	ldr	r3, [r4, r3]
c0d0263c:	2b00      	cmp	r3, #0
c0d0263e:	d004      	beq.n	c0d0264a <io_event+0x1a2>
c0d02640:	4798      	blx	r3
c0d02642:	2800      	cmp	r0, #0
c0d02644:	d007      	beq.n	c0d02656 <io_event+0x1ae>
c0d02646:	5b62      	ldrh	r2, [r4, r5]
c0d02648:	59a1      	ldr	r1, [r4, r6]
c0d0264a:	2801      	cmp	r0, #1
c0d0264c:	d101      	bne.n	c0d02652 <io_event+0x1aa>
c0d0264e:	0150      	lsls	r0, r2, #5
c0d02650:	1808      	adds	r0, r1, r0
c0d02652:	f000 fc85 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02656:	5b60      	ldrh	r0, [r4, r5]
c0d02658:	1c40      	adds	r0, r0, #1
c0d0265a:	5360      	strh	r0, [r4, r5]
c0d0265c:	e7ce      	b.n	c0d025fc <io_event+0x154>
c0d0265e:	4d92      	ldr	r5, [pc, #584]	; (c0d028a8 <io_event+0x400>)
c0d02660:	2600      	movs	r6, #0
c0d02662:	606e      	str	r6, [r5, #4]
c0d02664:	2001      	movs	r0, #1
c0d02666:	7028      	strb	r0, [r5, #0]
c0d02668:	4628      	mov	r0, r5
c0d0266a:	f002 feed 	bl	c0d05448 <os_ux>
c0d0266e:	2004      	movs	r0, #4
c0d02670:	f002 ff5a 	bl	c0d05528 <os_sched_last_status>
c0d02674:	6068      	str	r0, [r5, #4]
c0d02676:	2869      	cmp	r0, #105	; 0x69
c0d02678:	d000      	beq.n	c0d0267c <io_event+0x1d4>
c0d0267a:	e0be      	b.n	c0d027fa <io_event+0x352>
c0d0267c:	f000 fc18 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d02680:	f000 fc18 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d02684:	24c2      	movs	r4, #194	; 0xc2
c0d02686:	4e89      	ldr	r6, [pc, #548]	; (c0d028ac <io_event+0x404>)
c0d02688:	2000      	movs	r0, #0
c0d0268a:	5330      	strh	r0, [r6, r4]
c0d0268c:	2004      	movs	r0, #4
c0d0268e:	f002 ff4b 	bl	c0d05528 <os_sched_last_status>
c0d02692:	6068      	str	r0, [r5, #4]
c0d02694:	2800      	cmp	r0, #0
c0d02696:	d100      	bne.n	c0d0269a <io_event+0x1f2>
c0d02698:	e178      	b.n	c0d0298c <io_event+0x4e4>
c0d0269a:	2897      	cmp	r0, #151	; 0x97
c0d0269c:	d12a      	bne.n	c0d026f4 <io_event+0x24c>
c0d0269e:	e175      	b.n	c0d0298c <io_event+0x4e4>
c0d026a0:	20c8      	movs	r0, #200	; 0xc8
c0d026a2:	5c30      	ldrb	r0, [r6, r0]
c0d026a4:	5b31      	ldrh	r1, [r6, r4]
c0d026a6:	4281      	cmp	r1, r0
c0d026a8:	d300      	bcc.n	c0d026ac <io_event+0x204>
c0d026aa:	e16f      	b.n	c0d0298c <io_event+0x4e4>
c0d026ac:	f002 ff10 	bl	c0d054d0 <io_seph_is_status_sent>
c0d026b0:	2800      	cmp	r0, #0
c0d026b2:	d000      	beq.n	c0d026b6 <io_event+0x20e>
c0d026b4:	e16a      	b.n	c0d0298c <io_event+0x4e4>
c0d026b6:	f002 fe93 	bl	c0d053e0 <os_perso_isonboarded>
c0d026ba:	28aa      	cmp	r0, #170	; 0xaa
c0d026bc:	d104      	bne.n	c0d026c8 <io_event+0x220>
c0d026be:	f002 feb7 	bl	c0d05430 <os_global_pin_is_validated>
c0d026c2:	28aa      	cmp	r0, #170	; 0xaa
c0d026c4:	d000      	beq.n	c0d026c8 <io_event+0x220>
c0d026c6:	e161      	b.n	c0d0298c <io_event+0x4e4>
c0d026c8:	5971      	ldr	r1, [r6, r5]
c0d026ca:	5b32      	ldrh	r2, [r6, r4]
c0d026cc:	0150      	lsls	r0, r2, #5
c0d026ce:	1808      	adds	r0, r1, r0
c0d026d0:	23d0      	movs	r3, #208	; 0xd0
c0d026d2:	58f3      	ldr	r3, [r6, r3]
c0d026d4:	2b00      	cmp	r3, #0
c0d026d6:	d004      	beq.n	c0d026e2 <io_event+0x23a>
c0d026d8:	4798      	blx	r3
c0d026da:	2800      	cmp	r0, #0
c0d026dc:	d007      	beq.n	c0d026ee <io_event+0x246>
c0d026de:	5b32      	ldrh	r2, [r6, r4]
c0d026e0:	5971      	ldr	r1, [r6, r5]
c0d026e2:	2801      	cmp	r0, #1
c0d026e4:	d101      	bne.n	c0d026ea <io_event+0x242>
c0d026e6:	0150      	lsls	r0, r2, #5
c0d026e8:	1808      	adds	r0, r1, r0
c0d026ea:	f000 fc39 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d026ee:	5b30      	ldrh	r0, [r6, r4]
c0d026f0:	1c40      	adds	r0, r0, #1
c0d026f2:	5330      	strh	r0, [r6, r4]
c0d026f4:	25c4      	movs	r5, #196	; 0xc4
c0d026f6:	5970      	ldr	r0, [r6, r5]
c0d026f8:	2800      	cmp	r0, #0
c0d026fa:	d1d1      	bne.n	c0d026a0 <io_event+0x1f8>
c0d026fc:	e146      	b.n	c0d0298c <io_event+0x4e4>
c0d026fe:	4ce6      	ldr	r4, [pc, #920]	; (c0d02a98 <io_event+0x5f0>)
c0d02700:	2700      	movs	r7, #0
c0d02702:	6067      	str	r7, [r4, #4]
c0d02704:	2001      	movs	r0, #1
c0d02706:	7020      	strb	r0, [r4, #0]
c0d02708:	4620      	mov	r0, r4
c0d0270a:	f002 fe9d 	bl	c0d05448 <os_ux>
c0d0270e:	2004      	movs	r0, #4
c0d02710:	f002 ff0a 	bl	c0d05528 <os_sched_last_status>
c0d02714:	6060      	str	r0, [r4, #4]
c0d02716:	2869      	cmp	r0, #105	; 0x69
c0d02718:	d000      	beq.n	c0d0271c <io_event+0x274>
c0d0271a:	e08f      	b.n	c0d0283c <io_event+0x394>
c0d0271c:	f000 fbc8 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d02720:	f000 fbc8 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d02724:	25c2      	movs	r5, #194	; 0xc2
c0d02726:	4edd      	ldr	r6, [pc, #884]	; (c0d02a9c <io_event+0x5f4>)
c0d02728:	5377      	strh	r7, [r6, r5]
c0d0272a:	2004      	movs	r0, #4
c0d0272c:	f002 fefc 	bl	c0d05528 <os_sched_last_status>
c0d02730:	6060      	str	r0, [r4, #4]
c0d02732:	2800      	cmp	r0, #0
c0d02734:	d100      	bne.n	c0d02738 <io_event+0x290>
c0d02736:	e129      	b.n	c0d0298c <io_event+0x4e4>
c0d02738:	2897      	cmp	r0, #151	; 0x97
c0d0273a:	d12a      	bne.n	c0d02792 <io_event+0x2ea>
c0d0273c:	e126      	b.n	c0d0298c <io_event+0x4e4>
c0d0273e:	20c8      	movs	r0, #200	; 0xc8
c0d02740:	5c30      	ldrb	r0, [r6, r0]
c0d02742:	5b71      	ldrh	r1, [r6, r5]
c0d02744:	4281      	cmp	r1, r0
c0d02746:	d300      	bcc.n	c0d0274a <io_event+0x2a2>
c0d02748:	e120      	b.n	c0d0298c <io_event+0x4e4>
c0d0274a:	f002 fec1 	bl	c0d054d0 <io_seph_is_status_sent>
c0d0274e:	2800      	cmp	r0, #0
c0d02750:	d000      	beq.n	c0d02754 <io_event+0x2ac>
c0d02752:	e11b      	b.n	c0d0298c <io_event+0x4e4>
c0d02754:	f002 fe44 	bl	c0d053e0 <os_perso_isonboarded>
c0d02758:	28aa      	cmp	r0, #170	; 0xaa
c0d0275a:	d104      	bne.n	c0d02766 <io_event+0x2be>
c0d0275c:	f002 fe68 	bl	c0d05430 <os_global_pin_is_validated>
c0d02760:	28aa      	cmp	r0, #170	; 0xaa
c0d02762:	d000      	beq.n	c0d02766 <io_event+0x2be>
c0d02764:	e112      	b.n	c0d0298c <io_event+0x4e4>
c0d02766:	5931      	ldr	r1, [r6, r4]
c0d02768:	5b72      	ldrh	r2, [r6, r5]
c0d0276a:	0150      	lsls	r0, r2, #5
c0d0276c:	1808      	adds	r0, r1, r0
c0d0276e:	23d0      	movs	r3, #208	; 0xd0
c0d02770:	58f3      	ldr	r3, [r6, r3]
c0d02772:	2b00      	cmp	r3, #0
c0d02774:	d004      	beq.n	c0d02780 <io_event+0x2d8>
c0d02776:	4798      	blx	r3
c0d02778:	2800      	cmp	r0, #0
c0d0277a:	d007      	beq.n	c0d0278c <io_event+0x2e4>
c0d0277c:	5b72      	ldrh	r2, [r6, r5]
c0d0277e:	5931      	ldr	r1, [r6, r4]
c0d02780:	2801      	cmp	r0, #1
c0d02782:	d101      	bne.n	c0d02788 <io_event+0x2e0>
c0d02784:	0150      	lsls	r0, r2, #5
c0d02786:	1808      	adds	r0, r1, r0
c0d02788:	f000 fbea 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d0278c:	5b70      	ldrh	r0, [r6, r5]
c0d0278e:	1c40      	adds	r0, r0, #1
c0d02790:	5370      	strh	r0, [r6, r5]
c0d02792:	24c4      	movs	r4, #196	; 0xc4
c0d02794:	5930      	ldr	r0, [r6, r4]
c0d02796:	2800      	cmp	r0, #0
c0d02798:	d1d1      	bne.n	c0d0273e <io_event+0x296>
c0d0279a:	e0f7      	b.n	c0d0298c <io_event+0x4e4>
c0d0279c:	20c8      	movs	r0, #200	; 0xc8
c0d0279e:	5c30      	ldrb	r0, [r6, r0]
c0d027a0:	5b71      	ldrh	r1, [r6, r5]
c0d027a2:	4281      	cmp	r1, r0
c0d027a4:	d300      	bcc.n	c0d027a8 <io_event+0x300>
c0d027a6:	e0f1      	b.n	c0d0298c <io_event+0x4e4>
c0d027a8:	f002 fe92 	bl	c0d054d0 <io_seph_is_status_sent>
c0d027ac:	2800      	cmp	r0, #0
c0d027ae:	d000      	beq.n	c0d027b2 <io_event+0x30a>
c0d027b0:	e0ec      	b.n	c0d0298c <io_event+0x4e4>
c0d027b2:	f002 fe15 	bl	c0d053e0 <os_perso_isonboarded>
c0d027b6:	28aa      	cmp	r0, #170	; 0xaa
c0d027b8:	d104      	bne.n	c0d027c4 <io_event+0x31c>
c0d027ba:	f002 fe39 	bl	c0d05430 <os_global_pin_is_validated>
c0d027be:	28aa      	cmp	r0, #170	; 0xaa
c0d027c0:	d000      	beq.n	c0d027c4 <io_event+0x31c>
c0d027c2:	e0e3      	b.n	c0d0298c <io_event+0x4e4>
c0d027c4:	5931      	ldr	r1, [r6, r4]
c0d027c6:	5b72      	ldrh	r2, [r6, r5]
c0d027c8:	0150      	lsls	r0, r2, #5
c0d027ca:	1808      	adds	r0, r1, r0
c0d027cc:	23d0      	movs	r3, #208	; 0xd0
c0d027ce:	58f3      	ldr	r3, [r6, r3]
c0d027d0:	2b00      	cmp	r3, #0
c0d027d2:	d004      	beq.n	c0d027de <io_event+0x336>
c0d027d4:	4798      	blx	r3
c0d027d6:	2800      	cmp	r0, #0
c0d027d8:	d007      	beq.n	c0d027ea <io_event+0x342>
c0d027da:	5b72      	ldrh	r2, [r6, r5]
c0d027dc:	5931      	ldr	r1, [r6, r4]
c0d027de:	2801      	cmp	r0, #1
c0d027e0:	d101      	bne.n	c0d027e6 <io_event+0x33e>
c0d027e2:	0150      	lsls	r0, r2, #5
c0d027e4:	1808      	adds	r0, r1, r0
c0d027e6:	f000 fbbb 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d027ea:	5b70      	ldrh	r0, [r6, r5]
c0d027ec:	1c40      	adds	r0, r0, #1
c0d027ee:	5370      	strh	r0, [r6, r5]
c0d027f0:	24c4      	movs	r4, #196	; 0xc4
c0d027f2:	5930      	ldr	r0, [r6, r4]
c0d027f4:	2800      	cmp	r0, #0
c0d027f6:	d1d1      	bne.n	c0d0279c <io_event+0x2f4>
c0d027f8:	e0c8      	b.n	c0d0298c <io_event+0x4e4>
c0d027fa:	4604      	mov	r4, r0
c0d027fc:	1e40      	subs	r0, r0, #1
c0d027fe:	4621      	mov	r1, r4
c0d02800:	4181      	sbcs	r1, r0
c0d02802:	4620      	mov	r0, r4
c0d02804:	3897      	subs	r0, #151	; 0x97
c0d02806:	1e42      	subs	r2, r0, #1
c0d02808:	4190      	sbcs	r0, r2
c0d0280a:	22dc      	movs	r2, #220	; 0xdc
c0d0280c:	4da3      	ldr	r5, [pc, #652]	; (c0d02a9c <io_event+0x5f4>)
c0d0280e:	58ab      	ldr	r3, [r5, r2]
c0d02810:	2b00      	cmp	r3, #0
c0d02812:	d100      	bne.n	c0d02816 <io_event+0x36e>
c0d02814:	e106      	b.n	c0d02a24 <io_event+0x57c>
c0d02816:	461f      	mov	r7, r3
c0d02818:	3f64      	subs	r7, #100	; 0x64
c0d0281a:	d200      	bcs.n	c0d0281e <io_event+0x376>
c0d0281c:	4637      	mov	r7, r6
c0d0281e:	50af      	str	r7, [r5, r2]
c0d02820:	2b64      	cmp	r3, #100	; 0x64
c0d02822:	d900      	bls.n	c0d02826 <io_event+0x37e>
c0d02824:	e0fe      	b.n	c0d02a24 <io_event+0x57c>
c0d02826:	23d8      	movs	r3, #216	; 0xd8
c0d02828:	58eb      	ldr	r3, [r5, r3]
c0d0282a:	2b00      	cmp	r3, #0
c0d0282c:	d100      	bne.n	c0d02830 <io_event+0x388>
c0d0282e:	e0f1      	b.n	c0d02a14 <io_event+0x56c>
c0d02830:	20e0      	movs	r0, #224	; 0xe0
c0d02832:	5828      	ldr	r0, [r5, r0]
c0d02834:	50a8      	str	r0, [r5, r2]
c0d02836:	2000      	movs	r0, #0
c0d02838:	4798      	blx	r3
c0d0283a:	e0f3      	b.n	c0d02a24 <io_event+0x57c>
c0d0283c:	4c97      	ldr	r4, [pc, #604]	; (c0d02a9c <io_event+0x5f4>)
c0d0283e:	26c4      	movs	r6, #196	; 0xc4
c0d02840:	59a0      	ldr	r0, [r4, r6]
c0d02842:	2800      	cmp	r0, #0
c0d02844:	d100      	bne.n	c0d02848 <io_event+0x3a0>
c0d02846:	e099      	b.n	c0d0297c <io_event+0x4d4>
c0d02848:	20c8      	movs	r0, #200	; 0xc8
c0d0284a:	5c20      	ldrb	r0, [r4, r0]
c0d0284c:	25c2      	movs	r5, #194	; 0xc2
c0d0284e:	5b61      	ldrh	r1, [r4, r5]
c0d02850:	4281      	cmp	r1, r0
c0d02852:	d300      	bcc.n	c0d02856 <io_event+0x3ae>
c0d02854:	e092      	b.n	c0d0297c <io_event+0x4d4>
c0d02856:	f002 fe3b 	bl	c0d054d0 <io_seph_is_status_sent>
c0d0285a:	2800      	cmp	r0, #0
c0d0285c:	d000      	beq.n	c0d02860 <io_event+0x3b8>
c0d0285e:	e08d      	b.n	c0d0297c <io_event+0x4d4>
c0d02860:	f002 fdbe 	bl	c0d053e0 <os_perso_isonboarded>
c0d02864:	28aa      	cmp	r0, #170	; 0xaa
c0d02866:	d104      	bne.n	c0d02872 <io_event+0x3ca>
c0d02868:	f002 fde2 	bl	c0d05430 <os_global_pin_is_validated>
c0d0286c:	28aa      	cmp	r0, #170	; 0xaa
c0d0286e:	d000      	beq.n	c0d02872 <io_event+0x3ca>
c0d02870:	e084      	b.n	c0d0297c <io_event+0x4d4>
c0d02872:	59a1      	ldr	r1, [r4, r6]
c0d02874:	5b62      	ldrh	r2, [r4, r5]
c0d02876:	0150      	lsls	r0, r2, #5
c0d02878:	1808      	adds	r0, r1, r0
c0d0287a:	23d0      	movs	r3, #208	; 0xd0
c0d0287c:	58e3      	ldr	r3, [r4, r3]
c0d0287e:	2b00      	cmp	r3, #0
c0d02880:	d004      	beq.n	c0d0288c <io_event+0x3e4>
c0d02882:	4798      	blx	r3
c0d02884:	2800      	cmp	r0, #0
c0d02886:	d007      	beq.n	c0d02898 <io_event+0x3f0>
c0d02888:	5b62      	ldrh	r2, [r4, r5]
c0d0288a:	59a1      	ldr	r1, [r4, r6]
c0d0288c:	2801      	cmp	r0, #1
c0d0288e:	d101      	bne.n	c0d02894 <io_event+0x3ec>
c0d02890:	0150      	lsls	r0, r2, #5
c0d02892:	1808      	adds	r0, r1, r0
c0d02894:	f000 fb64 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02898:	5b60      	ldrh	r0, [r4, r5]
c0d0289a:	1c40      	adds	r0, r0, #1
c0d0289c:	5360      	strh	r0, [r4, r5]
c0d0289e:	e7ce      	b.n	c0d0283e <io_event+0x396>
c0d028a0:	20000200 	.word	0x20000200
c0d028a4:	00005e8d 	.word	0x00005e8d
c0d028a8:	20000390 	.word	0x20000390
c0d028ac:	20000288 	.word	0x20000288
c0d028b0:	2000049c 	.word	0x2000049c
c0d028b4:	4c79      	ldr	r4, [pc, #484]	; (c0d02a9c <io_event+0x5f4>)
c0d028b6:	26c4      	movs	r6, #196	; 0xc4
c0d028b8:	59a0      	ldr	r0, [r4, r6]
c0d028ba:	2800      	cmp	r0, #0
c0d028bc:	d05e      	beq.n	c0d0297c <io_event+0x4d4>
c0d028be:	20c8      	movs	r0, #200	; 0xc8
c0d028c0:	5c20      	ldrb	r0, [r4, r0]
c0d028c2:	25c2      	movs	r5, #194	; 0xc2
c0d028c4:	5b61      	ldrh	r1, [r4, r5]
c0d028c6:	4281      	cmp	r1, r0
c0d028c8:	d258      	bcs.n	c0d0297c <io_event+0x4d4>
c0d028ca:	f002 fe01 	bl	c0d054d0 <io_seph_is_status_sent>
c0d028ce:	2800      	cmp	r0, #0
c0d028d0:	d154      	bne.n	c0d0297c <io_event+0x4d4>
c0d028d2:	f002 fd85 	bl	c0d053e0 <os_perso_isonboarded>
c0d028d6:	28aa      	cmp	r0, #170	; 0xaa
c0d028d8:	d103      	bne.n	c0d028e2 <io_event+0x43a>
c0d028da:	f002 fda9 	bl	c0d05430 <os_global_pin_is_validated>
c0d028de:	28aa      	cmp	r0, #170	; 0xaa
c0d028e0:	d14c      	bne.n	c0d0297c <io_event+0x4d4>
c0d028e2:	59a1      	ldr	r1, [r4, r6]
c0d028e4:	5b62      	ldrh	r2, [r4, r5]
c0d028e6:	0150      	lsls	r0, r2, #5
c0d028e8:	1808      	adds	r0, r1, r0
c0d028ea:	23d0      	movs	r3, #208	; 0xd0
c0d028ec:	58e3      	ldr	r3, [r4, r3]
c0d028ee:	2b00      	cmp	r3, #0
c0d028f0:	d004      	beq.n	c0d028fc <io_event+0x454>
c0d028f2:	4798      	blx	r3
c0d028f4:	2800      	cmp	r0, #0
c0d028f6:	d007      	beq.n	c0d02908 <io_event+0x460>
c0d028f8:	5b62      	ldrh	r2, [r4, r5]
c0d028fa:	59a1      	ldr	r1, [r4, r6]
c0d028fc:	2801      	cmp	r0, #1
c0d028fe:	d101      	bne.n	c0d02904 <io_event+0x45c>
c0d02900:	0150      	lsls	r0, r2, #5
c0d02902:	1808      	adds	r0, r1, r0
c0d02904:	f000 fb2c 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02908:	5b60      	ldrh	r0, [r4, r5]
c0d0290a:	1c40      	adds	r0, r0, #1
c0d0290c:	5360      	strh	r0, [r4, r5]
c0d0290e:	e7d2      	b.n	c0d028b6 <io_event+0x40e>
c0d02910:	20d4      	movs	r0, #212	; 0xd4
c0d02912:	4c62      	ldr	r4, [pc, #392]	; (c0d02a9c <io_event+0x5f4>)
c0d02914:	5820      	ldr	r0, [r4, r0]
c0d02916:	2800      	cmp	r0, #0
c0d02918:	d003      	beq.n	c0d02922 <io_event+0x47a>
c0d0291a:	78e9      	ldrb	r1, [r5, #3]
c0d0291c:	0849      	lsrs	r1, r1, #1
c0d0291e:	f000 fb6b 	bl	c0d02ff8 <io_seproxyhal_button_push>
c0d02922:	26c4      	movs	r6, #196	; 0xc4
c0d02924:	59a0      	ldr	r0, [r4, r6]
c0d02926:	2800      	cmp	r0, #0
c0d02928:	d028      	beq.n	c0d0297c <io_event+0x4d4>
c0d0292a:	20c8      	movs	r0, #200	; 0xc8
c0d0292c:	5c20      	ldrb	r0, [r4, r0]
c0d0292e:	25c2      	movs	r5, #194	; 0xc2
c0d02930:	5b61      	ldrh	r1, [r4, r5]
c0d02932:	4281      	cmp	r1, r0
c0d02934:	d222      	bcs.n	c0d0297c <io_event+0x4d4>
c0d02936:	f002 fdcb 	bl	c0d054d0 <io_seph_is_status_sent>
c0d0293a:	2800      	cmp	r0, #0
c0d0293c:	d11e      	bne.n	c0d0297c <io_event+0x4d4>
c0d0293e:	f002 fd4f 	bl	c0d053e0 <os_perso_isonboarded>
c0d02942:	28aa      	cmp	r0, #170	; 0xaa
c0d02944:	d103      	bne.n	c0d0294e <io_event+0x4a6>
c0d02946:	f002 fd73 	bl	c0d05430 <os_global_pin_is_validated>
c0d0294a:	28aa      	cmp	r0, #170	; 0xaa
c0d0294c:	d116      	bne.n	c0d0297c <io_event+0x4d4>
c0d0294e:	59a1      	ldr	r1, [r4, r6]
c0d02950:	5b62      	ldrh	r2, [r4, r5]
c0d02952:	0150      	lsls	r0, r2, #5
c0d02954:	1808      	adds	r0, r1, r0
c0d02956:	23d0      	movs	r3, #208	; 0xd0
c0d02958:	58e3      	ldr	r3, [r4, r3]
c0d0295a:	2b00      	cmp	r3, #0
c0d0295c:	d004      	beq.n	c0d02968 <io_event+0x4c0>
c0d0295e:	4798      	blx	r3
c0d02960:	2800      	cmp	r0, #0
c0d02962:	d007      	beq.n	c0d02974 <io_event+0x4cc>
c0d02964:	5b62      	ldrh	r2, [r4, r5]
c0d02966:	59a1      	ldr	r1, [r4, r6]
c0d02968:	2801      	cmp	r0, #1
c0d0296a:	d101      	bne.n	c0d02970 <io_event+0x4c8>
c0d0296c:	0150      	lsls	r0, r2, #5
c0d0296e:	1808      	adds	r0, r1, r0
c0d02970:	f000 faf6 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02974:	5b60      	ldrh	r0, [r4, r5]
c0d02976:	1c40      	adds	r0, r0, #1
c0d02978:	5360      	strh	r0, [r4, r5]
c0d0297a:	e7d2      	b.n	c0d02922 <io_event+0x47a>
c0d0297c:	20c8      	movs	r0, #200	; 0xc8
c0d0297e:	5c20      	ldrb	r0, [r4, r0]
c0d02980:	21c2      	movs	r1, #194	; 0xc2
c0d02982:	5a61      	ldrh	r1, [r4, r1]
c0d02984:	4281      	cmp	r1, r0
c0d02986:	d301      	bcc.n	c0d0298c <io_event+0x4e4>
c0d02988:	f002 fda2 	bl	c0d054d0 <io_seph_is_status_sent>
c0d0298c:	f002 fda0 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02990:	2800      	cmp	r0, #0
c0d02992:	d101      	bne.n	c0d02998 <io_event+0x4f0>
c0d02994:	f000 f966 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d02998:	2001      	movs	r0, #1
c0d0299a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d0299c:	f000 fa88 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d029a0:	f000 fa88 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d029a4:	25c2      	movs	r5, #194	; 0xc2
c0d029a6:	4e3d      	ldr	r6, [pc, #244]	; (c0d02a9c <io_event+0x5f4>)
c0d029a8:	5377      	strh	r7, [r6, r5]
c0d029aa:	2004      	movs	r0, #4
c0d029ac:	f002 fdbc 	bl	c0d05528 <os_sched_last_status>
c0d029b0:	6060      	str	r0, [r4, #4]
c0d029b2:	2800      	cmp	r0, #0
c0d029b4:	d0ea      	beq.n	c0d0298c <io_event+0x4e4>
c0d029b6:	2897      	cmp	r0, #151	; 0x97
c0d029b8:	d0e8      	beq.n	c0d0298c <io_event+0x4e4>
c0d029ba:	e026      	b.n	c0d02a0a <io_event+0x562>
c0d029bc:	20c8      	movs	r0, #200	; 0xc8
c0d029be:	5c30      	ldrb	r0, [r6, r0]
c0d029c0:	5b71      	ldrh	r1, [r6, r5]
c0d029c2:	4281      	cmp	r1, r0
c0d029c4:	d2e2      	bcs.n	c0d0298c <io_event+0x4e4>
c0d029c6:	f002 fd83 	bl	c0d054d0 <io_seph_is_status_sent>
c0d029ca:	2800      	cmp	r0, #0
c0d029cc:	d1de      	bne.n	c0d0298c <io_event+0x4e4>
c0d029ce:	f002 fd07 	bl	c0d053e0 <os_perso_isonboarded>
c0d029d2:	28aa      	cmp	r0, #170	; 0xaa
c0d029d4:	d103      	bne.n	c0d029de <io_event+0x536>
c0d029d6:	f002 fd2b 	bl	c0d05430 <os_global_pin_is_validated>
c0d029da:	28aa      	cmp	r0, #170	; 0xaa
c0d029dc:	d1d6      	bne.n	c0d0298c <io_event+0x4e4>
c0d029de:	5931      	ldr	r1, [r6, r4]
c0d029e0:	5b72      	ldrh	r2, [r6, r5]
c0d029e2:	0150      	lsls	r0, r2, #5
c0d029e4:	1808      	adds	r0, r1, r0
c0d029e6:	23d0      	movs	r3, #208	; 0xd0
c0d029e8:	58f3      	ldr	r3, [r6, r3]
c0d029ea:	2b00      	cmp	r3, #0
c0d029ec:	d004      	beq.n	c0d029f8 <io_event+0x550>
c0d029ee:	4798      	blx	r3
c0d029f0:	2800      	cmp	r0, #0
c0d029f2:	d007      	beq.n	c0d02a04 <io_event+0x55c>
c0d029f4:	5b72      	ldrh	r2, [r6, r5]
c0d029f6:	5931      	ldr	r1, [r6, r4]
c0d029f8:	2801      	cmp	r0, #1
c0d029fa:	d101      	bne.n	c0d02a00 <io_event+0x558>
c0d029fc:	0150      	lsls	r0, r2, #5
c0d029fe:	1808      	adds	r0, r1, r0
c0d02a00:	f000 faae 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02a04:	5b70      	ldrh	r0, [r6, r5]
c0d02a06:	1c40      	adds	r0, r0, #1
c0d02a08:	5370      	strh	r0, [r6, r5]
c0d02a0a:	24c4      	movs	r4, #196	; 0xc4
c0d02a0c:	5930      	ldr	r0, [r6, r4]
c0d02a0e:	2800      	cmp	r0, #0
c0d02a10:	d1d4      	bne.n	c0d029bc <io_event+0x514>
c0d02a12:	e7bb      	b.n	c0d0298c <io_event+0x4e4>
c0d02a14:	4b22      	ldr	r3, [pc, #136]	; (c0d02aa0 <io_event+0x5f8>)
c0d02a16:	681a      	ldr	r2, [r3, #0]
c0d02a18:	2a00      	cmp	r2, #0
c0d02a1a:	d003      	beq.n	c0d02a24 <io_event+0x57c>
c0d02a1c:	4008      	ands	r0, r1
c0d02a1e:	2100      	movs	r1, #0
c0d02a20:	6019      	str	r1, [r3, #0]
c0d02a22:	4790      	blx	r2
c0d02a24:	2c00      	cmp	r4, #0
c0d02a26:	d0b1      	beq.n	c0d0298c <io_event+0x4e4>
c0d02a28:	2c97      	cmp	r4, #151	; 0x97
c0d02a2a:	d0af      	beq.n	c0d0298c <io_event+0x4e4>
c0d02a2c:	e027      	b.n	c0d02a7e <io_event+0x5d6>
c0d02a2e:	20c8      	movs	r0, #200	; 0xc8
c0d02a30:	5c28      	ldrb	r0, [r5, r0]
c0d02a32:	24c2      	movs	r4, #194	; 0xc2
c0d02a34:	5b29      	ldrh	r1, [r5, r4]
c0d02a36:	4281      	cmp	r1, r0
c0d02a38:	d225      	bcs.n	c0d02a86 <io_event+0x5de>
c0d02a3a:	f002 fd49 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02a3e:	2800      	cmp	r0, #0
c0d02a40:	d121      	bne.n	c0d02a86 <io_event+0x5de>
c0d02a42:	f002 fccd 	bl	c0d053e0 <os_perso_isonboarded>
c0d02a46:	28aa      	cmp	r0, #170	; 0xaa
c0d02a48:	d103      	bne.n	c0d02a52 <io_event+0x5aa>
c0d02a4a:	f002 fcf1 	bl	c0d05430 <os_global_pin_is_validated>
c0d02a4e:	28aa      	cmp	r0, #170	; 0xaa
c0d02a50:	d119      	bne.n	c0d02a86 <io_event+0x5de>
c0d02a52:	59a9      	ldr	r1, [r5, r6]
c0d02a54:	5b2a      	ldrh	r2, [r5, r4]
c0d02a56:	0150      	lsls	r0, r2, #5
c0d02a58:	1808      	adds	r0, r1, r0
c0d02a5a:	23d0      	movs	r3, #208	; 0xd0
c0d02a5c:	58eb      	ldr	r3, [r5, r3]
c0d02a5e:	2b00      	cmp	r3, #0
c0d02a60:	d004      	beq.n	c0d02a6c <io_event+0x5c4>
c0d02a62:	4798      	blx	r3
c0d02a64:	2800      	cmp	r0, #0
c0d02a66:	d007      	beq.n	c0d02a78 <io_event+0x5d0>
c0d02a68:	5b2a      	ldrh	r2, [r5, r4]
c0d02a6a:	59a9      	ldr	r1, [r5, r6]
c0d02a6c:	2801      	cmp	r0, #1
c0d02a6e:	d101      	bne.n	c0d02a74 <io_event+0x5cc>
c0d02a70:	0150      	lsls	r0, r2, #5
c0d02a72:	1808      	adds	r0, r1, r0
c0d02a74:	f000 fa74 	bl	c0d02f60 <io_seproxyhal_display_default>
c0d02a78:	5b28      	ldrh	r0, [r5, r4]
c0d02a7a:	1c40      	adds	r0, r0, #1
c0d02a7c:	5328      	strh	r0, [r5, r4]
c0d02a7e:	26c4      	movs	r6, #196	; 0xc4
c0d02a80:	59a8      	ldr	r0, [r5, r6]
c0d02a82:	2800      	cmp	r0, #0
c0d02a84:	d1d3      	bne.n	c0d02a2e <io_event+0x586>
c0d02a86:	20c8      	movs	r0, #200	; 0xc8
c0d02a88:	5c28      	ldrb	r0, [r5, r0]
c0d02a8a:	21c2      	movs	r1, #194	; 0xc2
c0d02a8c:	5a69      	ldrh	r1, [r5, r1]
c0d02a8e:	e779      	b.n	c0d02984 <io_event+0x4dc>
c0d02a90:	2005      	movs	r0, #5
c0d02a92:	f000 f8e0 	bl	c0d02c56 <os_longjmp>
c0d02a96:	46c0      	nop			; (mov r8, r8)
c0d02a98:	20000390 	.word	0x20000390
c0d02a9c:	20000288 	.word	0x20000288
c0d02aa0:	20000280 	.word	0x20000280

c0d02aa4 <io_exchange_al>:
c0d02aa4:	b5b0      	push	{r4, r5, r7, lr}
c0d02aa6:	4605      	mov	r5, r0
c0d02aa8:	2007      	movs	r0, #7
c0d02aaa:	4028      	ands	r0, r5
c0d02aac:	2400      	movs	r4, #0
c0d02aae:	2801      	cmp	r0, #1
c0d02ab0:	d012      	beq.n	c0d02ad8 <io_exchange_al+0x34>
c0d02ab2:	2802      	cmp	r0, #2
c0d02ab4:	d112      	bne.n	c0d02adc <io_exchange_al+0x38>
c0d02ab6:	2900      	cmp	r1, #0
c0d02ab8:	d007      	beq.n	c0d02aca <io_exchange_al+0x26>
c0d02aba:	480a      	ldr	r0, [pc, #40]	; (c0d02ae4 <io_exchange_al+0x40>)
c0d02abc:	f002 fcfe 	bl	c0d054bc <io_seph_send>
c0d02ac0:	0628      	lsls	r0, r5, #24
c0d02ac2:	d509      	bpl.n	c0d02ad8 <io_exchange_al+0x34>
c0d02ac4:	f002 fc82 	bl	c0d053cc <halt>
c0d02ac8:	e006      	b.n	c0d02ad8 <io_exchange_al+0x34>
c0d02aca:	2041      	movs	r0, #65	; 0x41
c0d02acc:	0081      	lsls	r1, r0, #2
c0d02ace:	4805      	ldr	r0, [pc, #20]	; (c0d02ae4 <io_exchange_al+0x40>)
c0d02ad0:	2200      	movs	r2, #0
c0d02ad2:	f002 fd07 	bl	c0d054e4 <io_seph_recv>
c0d02ad6:	4604      	mov	r4, r0
c0d02ad8:	4620      	mov	r0, r4
c0d02ada:	bdb0      	pop	{r4, r5, r7, pc}
c0d02adc:	2002      	movs	r0, #2
c0d02ade:	f000 f8ba 	bl	c0d02c56 <os_longjmp>
c0d02ae2:	46c0      	nop			; (mov r8, r8)
c0d02ae4:	20000398 	.word	0x20000398

c0d02ae8 <device_is_unlocked>:
c0d02ae8:	b580      	push	{r7, lr}
c0d02aea:	f002 fca1 	bl	c0d05430 <os_global_pin_is_validated>
c0d02aee:	38aa      	subs	r0, #170	; 0xaa
c0d02af0:	4241      	negs	r1, r0
c0d02af2:	4148      	adcs	r0, r1
c0d02af4:	bd80      	pop	{r7, pc}
	...

c0d02af8 <derivePrivateKey>:
c0d02af8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d02afa:	b095      	sub	sp, #84	; 0x54
c0d02afc:	460c      	mov	r4, r1
c0d02afe:	4605      	mov	r5, r0
c0d02b00:	f000 ff59 	bl	c0d039b6 <policyDerivePrivateKey>
c0d02b04:	2801      	cmp	r0, #1
c0d02b06:	d03c      	beq.n	c0d02b82 <derivePrivateKey+0x8a>
c0d02b08:	6aa8      	ldr	r0, [r5, #40]	; 0x28
c0d02b0a:	280a      	cmp	r0, #10
c0d02b0c:	d301      	bcc.n	c0d02b12 <derivePrivateKey+0x1a>
c0d02b0e:	2000      	movs	r0, #0
c0d02b10:	e000      	b.n	c0d02b14 <derivePrivateKey+0x1c>
c0d02b12:	2001      	movs	r0, #1
c0d02b14:	491d      	ldr	r1, [pc, #116]	; (c0d02b8c <derivePrivateKey+0x94>)
c0d02b16:	4479      	add	r1, pc
c0d02b18:	f7fd fba2 	bl	c0d00260 <assert>
c0d02b1c:	ae01      	add	r6, sp, #4
c0d02b1e:	4630      	mov	r0, r6
c0d02b20:	f004 fed0 	bl	c0d078c4 <setjmp>
c0d02b24:	85b0      	strh	r0, [r6, #44]	; 0x2c
c0d02b26:	0400      	lsls	r0, r0, #16
c0d02b28:	d119      	bne.n	c0d02b5e <derivePrivateKey+0x66>
c0d02b2a:	a801      	add	r0, sp, #4
c0d02b2c:	f002 fcf0 	bl	c0d05510 <try_context_set>
c0d02b30:	900b      	str	r0, [sp, #44]	; 0x2c
c0d02b32:	f000 fbe7 	bl	c0d03304 <io_seproxyhal_io_heartbeat>
c0d02b36:	6aaa      	ldr	r2, [r5, #40]	; 0x28
c0d02b38:	2000      	movs	r0, #0
c0d02b3a:	9000      	str	r0, [sp, #0]
c0d02b3c:	2621      	movs	r6, #33	; 0x21
c0d02b3e:	af0d      	add	r7, sp, #52	; 0x34
c0d02b40:	4630      	mov	r0, r6
c0d02b42:	4629      	mov	r1, r5
c0d02b44:	463b      	mov	r3, r7
c0d02b46:	f002 fc57 	bl	c0d053f8 <os_perso_derive_node_bip32>
c0d02b4a:	f000 fbdb 	bl	c0d03304 <io_seproxyhal_io_heartbeat>
c0d02b4e:	2220      	movs	r2, #32
c0d02b50:	4630      	mov	r0, r6
c0d02b52:	4639      	mov	r1, r7
c0d02b54:	4623      	mov	r3, r4
c0d02b56:	f7fd fcc9 	bl	c0d004ec <cx_ecfp_init_private_key_no_throw>
c0d02b5a:	2800      	cmp	r0, #0
c0d02b5c:	d112      	bne.n	c0d02b84 <derivePrivateKey+0x8c>
c0d02b5e:	f002 fccd 	bl	c0d054fc <try_context_get>
c0d02b62:	a901      	add	r1, sp, #4
c0d02b64:	4288      	cmp	r0, r1
c0d02b66:	d102      	bne.n	c0d02b6e <derivePrivateKey+0x76>
c0d02b68:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d02b6a:	f002 fcd1 	bl	c0d05510 <try_context_set>
c0d02b6e:	a80d      	add	r0, sp, #52	; 0x34
c0d02b70:	2120      	movs	r1, #32
c0d02b72:	f004 fd83 	bl	c0d0767c <explicit_bzero>
c0d02b76:	a801      	add	r0, sp, #4
c0d02b78:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d02b7a:	2800      	cmp	r0, #0
c0d02b7c:	d102      	bne.n	c0d02b84 <derivePrivateKey+0x8c>
c0d02b7e:	b015      	add	sp, #84	; 0x54
c0d02b80:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d02b82:	4801      	ldr	r0, [pc, #4]	; (c0d02b88 <derivePrivateKey+0x90>)
c0d02b84:	f000 f867 	bl	c0d02c56 <os_longjmp>
c0d02b88:	00006e10 	.word	0x00006e10
c0d02b8c:	00005850 	.word	0x00005850

c0d02b90 <derivePublicKey>:
c0d02b90:	b570      	push	{r4, r5, r6, lr}
c0d02b92:	b096      	sub	sp, #88	; 0x58
c0d02b94:	460c      	mov	r4, r1
c0d02b96:	4605      	mov	r5, r0
c0d02b98:	466e      	mov	r6, sp
c0d02b9a:	4630      	mov	r0, r6
c0d02b9c:	f004 fe92 	bl	c0d078c4 <setjmp>
c0d02ba0:	85b0      	strh	r0, [r6, #44]	; 0x2c
c0d02ba2:	0400      	lsls	r0, r0, #16
c0d02ba4:	d11b      	bne.n	c0d02bde <derivePublicKey+0x4e>
c0d02ba6:	4668      	mov	r0, sp
c0d02ba8:	f002 fcb2 	bl	c0d05510 <try_context_set>
c0d02bac:	900a      	str	r0, [sp, #40]	; 0x28
c0d02bae:	a90c      	add	r1, sp, #48	; 0x30
c0d02bb0:	4628      	mov	r0, r5
c0d02bb2:	f7ff ffa1 	bl	c0d02af8 <derivePrivateKey>
c0d02bb6:	f000 fba5 	bl	c0d03304 <io_seproxyhal_io_heartbeat>
c0d02bba:	2021      	movs	r0, #33	; 0x21
c0d02bbc:	2100      	movs	r1, #0
c0d02bbe:	460a      	mov	r2, r1
c0d02bc0:	4623      	mov	r3, r4
c0d02bc2:	f7fd fc99 	bl	c0d004f8 <cx_ecfp_init_public_key_no_throw>
c0d02bc6:	2800      	cmp	r0, #0
c0d02bc8:	d11b      	bne.n	c0d02c02 <derivePublicKey+0x72>
c0d02bca:	2021      	movs	r0, #33	; 0x21
c0d02bcc:	aa0c      	add	r2, sp, #48	; 0x30
c0d02bce:	2301      	movs	r3, #1
c0d02bd0:	4621      	mov	r1, r4
c0d02bd2:	f7fd fc85 	bl	c0d004e0 <cx_ecfp_generate_pair_no_throw>
c0d02bd6:	2800      	cmp	r0, #0
c0d02bd8:	d113      	bne.n	c0d02c02 <derivePublicKey+0x72>
c0d02bda:	f000 fb93 	bl	c0d03304 <io_seproxyhal_io_heartbeat>
c0d02bde:	f002 fc8d 	bl	c0d054fc <try_context_get>
c0d02be2:	4669      	mov	r1, sp
c0d02be4:	4288      	cmp	r0, r1
c0d02be6:	d102      	bne.n	c0d02bee <derivePublicKey+0x5e>
c0d02be8:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d02bea:	f002 fc91 	bl	c0d05510 <try_context_set>
c0d02bee:	a80c      	add	r0, sp, #48	; 0x30
c0d02bf0:	2128      	movs	r1, #40	; 0x28
c0d02bf2:	f004 fd43 	bl	c0d0767c <explicit_bzero>
c0d02bf6:	4668      	mov	r0, sp
c0d02bf8:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d02bfa:	2800      	cmp	r0, #0
c0d02bfc:	d101      	bne.n	c0d02c02 <derivePublicKey+0x72>
c0d02bfe:	b016      	add	sp, #88	; 0x58
c0d02c00:	bd70      	pop	{r4, r5, r6, pc}
c0d02c02:	f000 f828 	bl	c0d02c56 <os_longjmp>

c0d02c06 <app_exit>:
c0d02c06:	b510      	push	{r4, lr}
c0d02c08:	b08c      	sub	sp, #48	; 0x30
c0d02c0a:	466c      	mov	r4, sp
c0d02c0c:	4620      	mov	r0, r4
c0d02c0e:	f004 fe59 	bl	c0d078c4 <setjmp>
c0d02c12:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d02c14:	0400      	lsls	r0, r0, #16
c0d02c16:	d00d      	beq.n	c0d02c34 <app_exit+0x2e>
c0d02c18:	f002 fc70 	bl	c0d054fc <try_context_get>
c0d02c1c:	4669      	mov	r1, sp
c0d02c1e:	4288      	cmp	r0, r1
c0d02c20:	d102      	bne.n	c0d02c28 <app_exit+0x22>
c0d02c22:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d02c24:	f002 fc74 	bl	c0d05510 <try_context_set>
c0d02c28:	4668      	mov	r0, sp
c0d02c2a:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d02c2c:	2800      	cmp	r0, #0
c0d02c2e:	d108      	bne.n	c0d02c42 <app_exit+0x3c>
c0d02c30:	b00c      	add	sp, #48	; 0x30
c0d02c32:	bd10      	pop	{r4, pc}
c0d02c34:	4668      	mov	r0, sp
c0d02c36:	f002 fc6b 	bl	c0d05510 <try_context_set>
c0d02c3a:	900a      	str	r0, [sp, #40]	; 0x28
c0d02c3c:	20ff      	movs	r0, #255	; 0xff
c0d02c3e:	f002 fc31 	bl	c0d054a4 <os_sched_exit>
c0d02c42:	f000 f808 	bl	c0d02c56 <os_longjmp>

c0d02c46 <os_sched_exit_ui_callback>:
c0d02c46:	20aa      	movs	r0, #170	; 0xaa
c0d02c48:	f002 fc2c 	bl	c0d054a4 <os_sched_exit>

c0d02c4c <os_boot>:
c0d02c4c:	b580      	push	{r7, lr}
c0d02c4e:	2000      	movs	r0, #0
c0d02c50:	f002 fc5e 	bl	c0d05510 <try_context_set>
c0d02c54:	bd80      	pop	{r7, pc}

c0d02c56 <os_longjmp>:
c0d02c56:	4604      	mov	r4, r0
c0d02c58:	f002 fc50 	bl	c0d054fc <try_context_get>
c0d02c5c:	4621      	mov	r1, r4
c0d02c5e:	f004 fe3d 	bl	c0d078dc <longjmp>
	...

c0d02c64 <io_seproxyhal_general_status>:
c0d02c64:	b580      	push	{r7, lr}
c0d02c66:	4803      	ldr	r0, [pc, #12]	; (c0d02c74 <io_seproxyhal_general_status+0x10>)
c0d02c68:	4478      	add	r0, pc
c0d02c6a:	2105      	movs	r1, #5
c0d02c6c:	f002 fc26 	bl	c0d054bc <io_seph_send>
c0d02c70:	bd80      	pop	{r7, pc}
c0d02c72:	46c0      	nop			; (mov r8, r8)
c0d02c74:	00005814 	.word	0x00005814

c0d02c78 <io_seproxyhal_handle_usb_event>:
c0d02c78:	b510      	push	{r4, lr}
c0d02c7a:	4815      	ldr	r0, [pc, #84]	; (c0d02cd0 <io_seproxyhal_handle_usb_event+0x58>)
c0d02c7c:	78c0      	ldrb	r0, [r0, #3]
c0d02c7e:	2808      	cmp	r0, #8
c0d02c80:	d01a      	beq.n	c0d02cb8 <io_seproxyhal_handle_usb_event+0x40>
c0d02c82:	2802      	cmp	r0, #2
c0d02c84:	d014      	beq.n	c0d02cb0 <io_seproxyhal_handle_usb_event+0x38>
c0d02c86:	2804      	cmp	r0, #4
c0d02c88:	d01a      	beq.n	c0d02cc0 <io_seproxyhal_handle_usb_event+0x48>
c0d02c8a:	2801      	cmp	r0, #1
c0d02c8c:	d117      	bne.n	c0d02cbe <io_seproxyhal_handle_usb_event+0x46>
c0d02c8e:	4c11      	ldr	r4, [pc, #68]	; (c0d02cd4 <io_seproxyhal_handle_usb_event+0x5c>)
c0d02c90:	2101      	movs	r1, #1
c0d02c92:	4620      	mov	r0, r4
c0d02c94:	f003 fcbe 	bl	c0d06614 <USBD_LL_SetSpeed>
c0d02c98:	4620      	mov	r0, r4
c0d02c9a:	f003 fc9b 	bl	c0d065d4 <USBD_LL_Reset>
c0d02c9e:	480e      	ldr	r0, [pc, #56]	; (c0d02cd8 <io_seproxyhal_handle_usb_event+0x60>)
c0d02ca0:	7981      	ldrb	r1, [r0, #6]
c0d02ca2:	2900      	cmp	r1, #0
c0d02ca4:	d110      	bne.n	c0d02cc8 <io_seproxyhal_handle_usb_event+0x50>
c0d02ca6:	300c      	adds	r0, #12
c0d02ca8:	2112      	movs	r1, #18
c0d02caa:	f004 fcd1 	bl	c0d07650 <__aeabi_memclr>
c0d02cae:	bd10      	pop	{r4, pc}
c0d02cb0:	4808      	ldr	r0, [pc, #32]	; (c0d02cd4 <io_seproxyhal_handle_usb_event+0x5c>)
c0d02cb2:	f003 fcb6 	bl	c0d06622 <USBD_LL_SOF>
c0d02cb6:	bd10      	pop	{r4, pc}
c0d02cb8:	4806      	ldr	r0, [pc, #24]	; (c0d02cd4 <io_seproxyhal_handle_usb_event+0x5c>)
c0d02cba:	f003 fcb0 	bl	c0d0661e <USBD_LL_Resume>
c0d02cbe:	bd10      	pop	{r4, pc}
c0d02cc0:	4804      	ldr	r0, [pc, #16]	; (c0d02cd4 <io_seproxyhal_handle_usb_event+0x5c>)
c0d02cc2:	f003 fcaa 	bl	c0d0661a <USBD_LL_Suspend>
c0d02cc6:	bd10      	pop	{r4, pc}
c0d02cc8:	2005      	movs	r0, #5
c0d02cca:	f7ff ffc4 	bl	c0d02c56 <os_longjmp>
c0d02cce:	46c0      	nop			; (mov r8, r8)
c0d02cd0:	20000200 	.word	0x20000200
c0d02cd4:	20000ac4 	.word	0x20000ac4
c0d02cd8:	2000049c 	.word	0x2000049c

c0d02cdc <io_seproxyhal_get_ep_rx_size>:
c0d02cdc:	217f      	movs	r1, #127	; 0x7f
c0d02cde:	4001      	ands	r1, r0
c0d02ce0:	2905      	cmp	r1, #5
c0d02ce2:	d803      	bhi.n	c0d02cec <io_seproxyhal_get_ep_rx_size+0x10>
c0d02ce4:	4802      	ldr	r0, [pc, #8]	; (c0d02cf0 <io_seproxyhal_get_ep_rx_size+0x14>)
c0d02ce6:	1840      	adds	r0, r0, r1
c0d02ce8:	7b00      	ldrb	r0, [r0, #12]
c0d02cea:	4770      	bx	lr
c0d02cec:	2000      	movs	r0, #0
c0d02cee:	4770      	bx	lr
c0d02cf0:	2000049c 	.word	0x2000049c

c0d02cf4 <io_seproxyhal_handle_usb_ep_xfer_event>:
c0d02cf4:	b580      	push	{r7, lr}
c0d02cf6:	4815      	ldr	r0, [pc, #84]	; (c0d02d4c <io_seproxyhal_handle_usb_ep_xfer_event+0x58>)
c0d02cf8:	78c2      	ldrb	r2, [r0, #3]
c0d02cfa:	217f      	movs	r1, #127	; 0x7f
c0d02cfc:	4011      	ands	r1, r2
c0d02cfe:	7902      	ldrb	r2, [r0, #4]
c0d02d00:	2a04      	cmp	r2, #4
c0d02d02:	d014      	beq.n	c0d02d2e <io_seproxyhal_handle_usb_ep_xfer_event+0x3a>
c0d02d04:	2a02      	cmp	r2, #2
c0d02d06:	d006      	beq.n	c0d02d16 <io_seproxyhal_handle_usb_ep_xfer_event+0x22>
c0d02d08:	2a01      	cmp	r2, #1
c0d02d0a:	d11d      	bne.n	c0d02d48 <io_seproxyhal_handle_usb_ep_xfer_event+0x54>
c0d02d0c:	1d81      	adds	r1, r0, #6
c0d02d0e:	4811      	ldr	r0, [pc, #68]	; (c0d02d54 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d02d10:	f003 fb72 	bl	c0d063f8 <USBD_LL_SetupStage>
c0d02d14:	bd80      	pop	{r7, pc}
c0d02d16:	2905      	cmp	r1, #5
c0d02d18:	d816      	bhi.n	c0d02d48 <io_seproxyhal_handle_usb_ep_xfer_event+0x54>
c0d02d1a:	004a      	lsls	r2, r1, #1
c0d02d1c:	4b0c      	ldr	r3, [pc, #48]	; (c0d02d50 <io_seproxyhal_handle_usb_ep_xfer_event+0x5c>)
c0d02d1e:	189a      	adds	r2, r3, r2
c0d02d20:	2300      	movs	r3, #0
c0d02d22:	8253      	strh	r3, [r2, #18]
c0d02d24:	1d82      	adds	r2, r0, #6
c0d02d26:	480b      	ldr	r0, [pc, #44]	; (c0d02d54 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d02d28:	f003 fbe9 	bl	c0d064fe <USBD_LL_DataInStage>
c0d02d2c:	bd80      	pop	{r7, pc}
c0d02d2e:	2905      	cmp	r1, #5
c0d02d30:	d80a      	bhi.n	c0d02d48 <io_seproxyhal_handle_usb_ep_xfer_event+0x54>
c0d02d32:	4a07      	ldr	r2, [pc, #28]	; (c0d02d50 <io_seproxyhal_handle_usb_ep_xfer_event+0x5c>)
c0d02d34:	1852      	adds	r2, r2, r1
c0d02d36:	7943      	ldrb	r3, [r0, #5]
c0d02d38:	2b7a      	cmp	r3, #122	; 0x7a
c0d02d3a:	d300      	bcc.n	c0d02d3e <io_seproxyhal_handle_usb_ep_xfer_event+0x4a>
c0d02d3c:	237a      	movs	r3, #122	; 0x7a
c0d02d3e:	7313      	strb	r3, [r2, #12]
c0d02d40:	1d82      	adds	r2, r0, #6
c0d02d42:	4804      	ldr	r0, [pc, #16]	; (c0d02d54 <io_seproxyhal_handle_usb_ep_xfer_event+0x60>)
c0d02d44:	f003 fb86 	bl	c0d06454 <USBD_LL_DataOutStage>
c0d02d48:	bd80      	pop	{r7, pc}
c0d02d4a:	46c0      	nop			; (mov r8, r8)
c0d02d4c:	20000200 	.word	0x20000200
c0d02d50:	2000049c 	.word	0x2000049c
c0d02d54:	20000ac4 	.word	0x20000ac4

c0d02d58 <io_usb_send_ep>:
c0d02d58:	b570      	push	{r4, r5, r6, lr}
c0d02d5a:	2aff      	cmp	r2, #255	; 0xff
c0d02d5c:	d81d      	bhi.n	c0d02d9a <io_usb_send_ep+0x42>
c0d02d5e:	4615      	mov	r5, r2
c0d02d60:	460e      	mov	r6, r1
c0d02d62:	4604      	mov	r4, r0
c0d02d64:	480d      	ldr	r0, [pc, #52]	; (c0d02d9c <io_usb_send_ep+0x44>)
c0d02d66:	7142      	strb	r2, [r0, #5]
c0d02d68:	2120      	movs	r1, #32
c0d02d6a:	7101      	strb	r1, [r0, #4]
c0d02d6c:	2150      	movs	r1, #80	; 0x50
c0d02d6e:	7001      	strb	r1, [r0, #0]
c0d02d70:	2180      	movs	r1, #128	; 0x80
c0d02d72:	4321      	orrs	r1, r4
c0d02d74:	70c1      	strb	r1, [r0, #3]
c0d02d76:	1cd1      	adds	r1, r2, #3
c0d02d78:	7081      	strb	r1, [r0, #2]
c0d02d7a:	0a09      	lsrs	r1, r1, #8
c0d02d7c:	7041      	strb	r1, [r0, #1]
c0d02d7e:	2106      	movs	r1, #6
c0d02d80:	f002 fb9c 	bl	c0d054bc <io_seph_send>
c0d02d84:	4630      	mov	r0, r6
c0d02d86:	4629      	mov	r1, r5
c0d02d88:	f002 fb98 	bl	c0d054bc <io_seph_send>
c0d02d8c:	0660      	lsls	r0, r4, #25
c0d02d8e:	0e00      	lsrs	r0, r0, #24
c0d02d90:	4903      	ldr	r1, [pc, #12]	; (c0d02da0 <io_usb_send_ep+0x48>)
c0d02d92:	1808      	adds	r0, r1, r0
c0d02d94:	217d      	movs	r1, #125	; 0x7d
c0d02d96:	0109      	lsls	r1, r1, #4
c0d02d98:	8241      	strh	r1, [r0, #18]
c0d02d9a:	bd70      	pop	{r4, r5, r6, pc}
c0d02d9c:	20000200 	.word	0x20000200
c0d02da0:	2000049c 	.word	0x2000049c

c0d02da4 <io_usb_send_apdu_data>:
c0d02da4:	b580      	push	{r7, lr}
c0d02da6:	460a      	mov	r2, r1
c0d02da8:	4601      	mov	r1, r0
c0d02daa:	2082      	movs	r0, #130	; 0x82
c0d02dac:	2314      	movs	r3, #20
c0d02dae:	f7ff ffd3 	bl	c0d02d58 <io_usb_send_ep>
c0d02db2:	bd80      	pop	{r7, pc}

c0d02db4 <io_usb_send_apdu_data_ep0x83>:
c0d02db4:	b580      	push	{r7, lr}
c0d02db6:	460a      	mov	r2, r1
c0d02db8:	4601      	mov	r1, r0
c0d02dba:	2083      	movs	r0, #131	; 0x83
c0d02dbc:	2314      	movs	r3, #20
c0d02dbe:	f7ff ffcb 	bl	c0d02d58 <io_usb_send_ep>
c0d02dc2:	bd80      	pop	{r7, pc}

c0d02dc4 <io_seproxyhal_handle_capdu_event>:
c0d02dc4:	b580      	push	{r7, lr}
c0d02dc6:	480b      	ldr	r0, [pc, #44]	; (c0d02df4 <io_seproxyhal_handle_capdu_event+0x30>)
c0d02dc8:	7801      	ldrb	r1, [r0, #0]
c0d02dca:	2900      	cmp	r1, #0
c0d02dcc:	d000      	beq.n	c0d02dd0 <io_seproxyhal_handle_capdu_event+0xc>
c0d02dce:	bd80      	pop	{r7, pc}
c0d02dd0:	2106      	movs	r1, #6
c0d02dd2:	7181      	strb	r1, [r0, #6]
c0d02dd4:	210a      	movs	r1, #10
c0d02dd6:	7001      	strb	r1, [r0, #0]
c0d02dd8:	4907      	ldr	r1, [pc, #28]	; (c0d02df8 <io_seproxyhal_handle_capdu_event+0x34>)
c0d02dda:	788a      	ldrb	r2, [r1, #2]
c0d02ddc:	784b      	ldrb	r3, [r1, #1]
c0d02dde:	021b      	lsls	r3, r3, #8
c0d02de0:	189a      	adds	r2, r3, r2
c0d02de2:	2a7d      	cmp	r2, #125	; 0x7d
c0d02de4:	d300      	bcc.n	c0d02de8 <io_seproxyhal_handle_capdu_event+0x24>
c0d02de6:	227d      	movs	r2, #125	; 0x7d
c0d02de8:	8042      	strh	r2, [r0, #2]
c0d02dea:	1cc9      	adds	r1, r1, #3
c0d02dec:	4803      	ldr	r0, [pc, #12]	; (c0d02dfc <io_seproxyhal_handle_capdu_event+0x38>)
c0d02dee:	f004 fc35 	bl	c0d0765c <__aeabi_memcpy>
c0d02df2:	bd80      	pop	{r7, pc}
c0d02df4:	2000049c 	.word	0x2000049c
c0d02df8:	20000200 	.word	0x20000200
c0d02dfc:	20000398 	.word	0x20000398

c0d02e00 <io_seproxyhal_handle_event>:
c0d02e00:	b580      	push	{r7, lr}
c0d02e02:	491d      	ldr	r1, [pc, #116]	; (c0d02e78 <io_seproxyhal_handle_event+0x78>)
c0d02e04:	7808      	ldrb	r0, [r1, #0]
c0d02e06:	280e      	cmp	r0, #14
c0d02e08:	d00e      	beq.n	c0d02e28 <io_seproxyhal_handle_event+0x28>
c0d02e0a:	2816      	cmp	r0, #22
c0d02e0c:	d024      	beq.n	c0d02e58 <io_seproxyhal_handle_event+0x58>
c0d02e0e:	788a      	ldrb	r2, [r1, #2]
c0d02e10:	7849      	ldrb	r1, [r1, #1]
c0d02e12:	0209      	lsls	r1, r1, #8
c0d02e14:	1889      	adds	r1, r1, r2
c0d02e16:	2810      	cmp	r0, #16
c0d02e18:	d021      	beq.n	c0d02e5e <io_seproxyhal_handle_event+0x5e>
c0d02e1a:	280f      	cmp	r0, #15
c0d02e1c:	d118      	bne.n	c0d02e50 <io_seproxyhal_handle_event+0x50>
c0d02e1e:	2901      	cmp	r1, #1
c0d02e20:	d11f      	bne.n	c0d02e62 <io_seproxyhal_handle_event+0x62>
c0d02e22:	f7ff ff29 	bl	c0d02c78 <io_seproxyhal_handle_usb_event>
c0d02e26:	e020      	b.n	c0d02e6a <io_seproxyhal_handle_event+0x6a>
c0d02e28:	4814      	ldr	r0, [pc, #80]	; (c0d02e7c <io_seproxyhal_handle_event+0x7c>)
c0d02e2a:	6881      	ldr	r1, [r0, #8]
c0d02e2c:	3164      	adds	r1, #100	; 0x64
c0d02e2e:	6081      	str	r1, [r0, #8]
c0d02e30:	211c      	movs	r1, #28
c0d02e32:	2910      	cmp	r1, #16
c0d02e34:	d00c      	beq.n	c0d02e50 <io_seproxyhal_handle_event+0x50>
c0d02e36:	5a42      	ldrh	r2, [r0, r1]
c0d02e38:	2a00      	cmp	r2, #0
c0d02e3a:	d007      	beq.n	c0d02e4c <io_seproxyhal_handle_event+0x4c>
c0d02e3c:	2a64      	cmp	r2, #100	; 0x64
c0d02e3e:	4613      	mov	r3, r2
c0d02e40:	d800      	bhi.n	c0d02e44 <io_seproxyhal_handle_event+0x44>
c0d02e42:	2364      	movs	r3, #100	; 0x64
c0d02e44:	3b64      	subs	r3, #100	; 0x64
c0d02e46:	5243      	strh	r3, [r0, r1]
c0d02e48:	2a65      	cmp	r2, #101	; 0x65
c0d02e4a:	d310      	bcc.n	c0d02e6e <io_seproxyhal_handle_event+0x6e>
c0d02e4c:	1e89      	subs	r1, r1, #2
c0d02e4e:	e7f0      	b.n	c0d02e32 <io_seproxyhal_handle_event+0x32>
c0d02e50:	2002      	movs	r0, #2
c0d02e52:	f7ff fb29 	bl	c0d024a8 <io_event>
c0d02e56:	bd80      	pop	{r7, pc}
c0d02e58:	f7ff ffb4 	bl	c0d02dc4 <io_seproxyhal_handle_capdu_event>
c0d02e5c:	e005      	b.n	c0d02e6a <io_seproxyhal_handle_event+0x6a>
c0d02e5e:	2903      	cmp	r1, #3
c0d02e60:	d201      	bcs.n	c0d02e66 <io_seproxyhal_handle_event+0x66>
c0d02e62:	2000      	movs	r0, #0
c0d02e64:	bd80      	pop	{r7, pc}
c0d02e66:	f7ff ff45 	bl	c0d02cf4 <io_seproxyhal_handle_usb_ep_xfer_event>
c0d02e6a:	2001      	movs	r0, #1
c0d02e6c:	bd80      	pop	{r7, pc}
c0d02e6e:	2100      	movs	r1, #0
c0d02e70:	7001      	strb	r1, [r0, #0]
c0d02e72:	2005      	movs	r0, #5
c0d02e74:	f7ff feef 	bl	c0d02c56 <os_longjmp>
c0d02e78:	20000200 	.word	0x20000200
c0d02e7c:	2000049c 	.word	0x2000049c

c0d02e80 <io_seproxyhal_init>:
c0d02e80:	b580      	push	{r7, lr}
c0d02e82:	f002 fa97 	bl	c0d053b4 <get_api_level>
c0d02e86:	280d      	cmp	r0, #13
c0d02e88:	d20a      	bcs.n	c0d02ea0 <io_seproxyhal_init+0x20>
c0d02e8a:	4807      	ldr	r0, [pc, #28]	; (c0d02ea8 <io_seproxyhal_init+0x28>)
c0d02e8c:	2120      	movs	r1, #32
c0d02e8e:	f004 fbdf 	bl	c0d07650 <__aeabi_memclr>
c0d02e92:	f000 faf1 	bl	c0d03478 <io_usb_hid_init>
c0d02e96:	4805      	ldr	r0, [pc, #20]	; (c0d02eac <io_seproxyhal_init+0x2c>)
c0d02e98:	2100      	movs	r1, #0
c0d02e9a:	6001      	str	r1, [r0, #0]
c0d02e9c:	6041      	str	r1, [r0, #4]
c0d02e9e:	bd80      	pop	{r7, pc}
c0d02ea0:	20ff      	movs	r0, #255	; 0xff
c0d02ea2:	f002 faff 	bl	c0d054a4 <os_sched_exit>
c0d02ea6:	46c0      	nop			; (mov r8, r8)
c0d02ea8:	2000049c 	.word	0x2000049c
c0d02eac:	200004bc 	.word	0x200004bc

c0d02eb0 <io_seproxyhal_init_ux>:
c0d02eb0:	4770      	bx	lr
	...

c0d02eb4 <io_seproxyhal_init_button>:
c0d02eb4:	4802      	ldr	r0, [pc, #8]	; (c0d02ec0 <io_seproxyhal_init_button+0xc>)
c0d02eb6:	2100      	movs	r1, #0
c0d02eb8:	6001      	str	r1, [r0, #0]
c0d02eba:	6041      	str	r1, [r0, #4]
c0d02ebc:	4770      	bx	lr
c0d02ebe:	46c0      	nop			; (mov r8, r8)
c0d02ec0:	200004bc 	.word	0x200004bc

c0d02ec4 <io_seproxyhal_display_icon>:
c0d02ec4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d02ec6:	b087      	sub	sp, #28
c0d02ec8:	4605      	mov	r5, r0
c0d02eca:	4608      	mov	r0, r1
c0d02ecc:	f000 fd2e 	bl	c0d0392c <pic>
c0d02ed0:	2800      	cmp	r0, #0
c0d02ed2:	d03f      	beq.n	c0d02f54 <io_seproxyhal_display_icon+0x90>
c0d02ed4:	4604      	mov	r4, r0
c0d02ed6:	6900      	ldr	r0, [r0, #16]
c0d02ed8:	2800      	cmp	r0, #0
c0d02eda:	d03b      	beq.n	c0d02f54 <io_seproxyhal_display_icon+0x90>
c0d02edc:	4628      	mov	r0, r5
c0d02ede:	f000 fd25 	bl	c0d0392c <pic>
c0d02ee2:	4601      	mov	r1, r0
c0d02ee4:	466d      	mov	r5, sp
c0d02ee6:	221c      	movs	r2, #28
c0d02ee8:	4628      	mov	r0, r5
c0d02eea:	f004 fbb7 	bl	c0d0765c <__aeabi_memcpy>
c0d02eee:	6826      	ldr	r6, [r4, #0]
c0d02ef0:	80ee      	strh	r6, [r5, #6]
c0d02ef2:	6867      	ldr	r7, [r4, #4]
c0d02ef4:	812f      	strh	r7, [r5, #8]
c0d02ef6:	f002 faeb 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02efa:	2800      	cmp	r0, #0
c0d02efc:	d12a      	bne.n	c0d02f54 <io_seproxyhal_display_icon+0x90>
c0d02efe:	b2b9      	uxth	r1, r7
c0d02f00:	b2b2      	uxth	r2, r6
c0d02f02:	4815      	ldr	r0, [pc, #84]	; (c0d02f58 <io_seproxyhal_display_icon+0x94>)
c0d02f04:	2365      	movs	r3, #101	; 0x65
c0d02f06:	7003      	strb	r3, [r0, #0]
c0d02f08:	68a3      	ldr	r3, [r4, #8]
c0d02f0a:	435a      	muls	r2, r3
c0d02f0c:	434a      	muls	r2, r1
c0d02f0e:	0751      	lsls	r1, r2, #29
c0d02f10:	08d6      	lsrs	r6, r2, #3
c0d02f12:	2900      	cmp	r1, #0
c0d02f14:	d000      	beq.n	c0d02f18 <io_seproxyhal_display_icon+0x54>
c0d02f16:	1c76      	adds	r6, r6, #1
c0d02f18:	2504      	movs	r5, #4
c0d02f1a:	409d      	lsls	r5, r3
c0d02f1c:	19a9      	adds	r1, r5, r6
c0d02f1e:	311d      	adds	r1, #29
c0d02f20:	7081      	strb	r1, [r0, #2]
c0d02f22:	0a09      	lsrs	r1, r1, #8
c0d02f24:	7041      	strb	r1, [r0, #1]
c0d02f26:	2103      	movs	r1, #3
c0d02f28:	4f0c      	ldr	r7, [pc, #48]	; (c0d02f5c <io_seproxyhal_display_icon+0x98>)
c0d02f2a:	447f      	add	r7, pc
c0d02f2c:	47b8      	blx	r7
c0d02f2e:	4668      	mov	r0, sp
c0d02f30:	211c      	movs	r1, #28
c0d02f32:	47b8      	blx	r7
c0d02f34:	68a1      	ldr	r1, [r4, #8]
c0d02f36:	4808      	ldr	r0, [pc, #32]	; (c0d02f58 <io_seproxyhal_display_icon+0x94>)
c0d02f38:	7001      	strb	r1, [r0, #0]
c0d02f3a:	2101      	movs	r1, #1
c0d02f3c:	47b8      	blx	r7
c0d02f3e:	68e0      	ldr	r0, [r4, #12]
c0d02f40:	f000 fcf4 	bl	c0d0392c <pic>
c0d02f44:	b2a9      	uxth	r1, r5
c0d02f46:	47b8      	blx	r7
c0d02f48:	b2b5      	uxth	r5, r6
c0d02f4a:	6920      	ldr	r0, [r4, #16]
c0d02f4c:	f000 fcee 	bl	c0d0392c <pic>
c0d02f50:	4629      	mov	r1, r5
c0d02f52:	47b8      	blx	r7
c0d02f54:	b007      	add	sp, #28
c0d02f56:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d02f58:	20000200 	.word	0x20000200
c0d02f5c:	0000258f 	.word	0x0000258f

c0d02f60 <io_seproxyhal_display_default>:
c0d02f60:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d02f62:	f000 fce3 	bl	c0d0392c <pic>
c0d02f66:	4604      	mov	r4, r0
c0d02f68:	69c0      	ldr	r0, [r0, #28]
c0d02f6a:	f000 fcdf 	bl	c0d0392c <pic>
c0d02f6e:	4605      	mov	r5, r0
c0d02f70:	7821      	ldrb	r1, [r4, #0]
c0d02f72:	207f      	movs	r0, #127	; 0x7f
c0d02f74:	4008      	ands	r0, r1
c0d02f76:	d00a      	beq.n	c0d02f8e <io_seproxyhal_display_default+0x2e>
c0d02f78:	2d00      	cmp	r5, #0
c0d02f7a:	d009      	beq.n	c0d02f90 <io_seproxyhal_display_default+0x30>
c0d02f7c:	2805      	cmp	r0, #5
c0d02f7e:	d102      	bne.n	c0d02f86 <io_seproxyhal_display_default+0x26>
c0d02f80:	7ea0      	ldrb	r0, [r4, #26]
c0d02f82:	2800      	cmp	r0, #0
c0d02f84:	d02e      	beq.n	c0d02fe4 <io_seproxyhal_display_default+0x84>
c0d02f86:	f002 faa3 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02f8a:	2800      	cmp	r0, #0
c0d02f8c:	d013      	beq.n	c0d02fb6 <io_seproxyhal_display_default+0x56>
c0d02f8e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d02f90:	f002 fa9e 	bl	c0d054d0 <io_seph_is_status_sent>
c0d02f94:	2800      	cmp	r0, #0
c0d02f96:	d1fa      	bne.n	c0d02f8e <io_seproxyhal_display_default+0x2e>
c0d02f98:	4815      	ldr	r0, [pc, #84]	; (c0d02ff0 <io_seproxyhal_display_default+0x90>)
c0d02f9a:	251c      	movs	r5, #28
c0d02f9c:	7085      	strb	r5, [r0, #2]
c0d02f9e:	2100      	movs	r1, #0
c0d02fa0:	7041      	strb	r1, [r0, #1]
c0d02fa2:	2165      	movs	r1, #101	; 0x65
c0d02fa4:	7001      	strb	r1, [r0, #0]
c0d02fa6:	2103      	movs	r1, #3
c0d02fa8:	f002 fa88 	bl	c0d054bc <io_seph_send>
c0d02fac:	4620      	mov	r0, r4
c0d02fae:	4629      	mov	r1, r5
c0d02fb0:	f002 fa84 	bl	c0d054bc <io_seph_send>
c0d02fb4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d02fb6:	4628      	mov	r0, r5
c0d02fb8:	f004 fc9e 	bl	c0d078f8 <strlen>
c0d02fbc:	4606      	mov	r6, r0
c0d02fbe:	480c      	ldr	r0, [pc, #48]	; (c0d02ff0 <io_seproxyhal_display_default+0x90>)
c0d02fc0:	2165      	movs	r1, #101	; 0x65
c0d02fc2:	7001      	strb	r1, [r0, #0]
c0d02fc4:	4631      	mov	r1, r6
c0d02fc6:	311c      	adds	r1, #28
c0d02fc8:	7081      	strb	r1, [r0, #2]
c0d02fca:	0a09      	lsrs	r1, r1, #8
c0d02fcc:	7041      	strb	r1, [r0, #1]
c0d02fce:	2103      	movs	r1, #3
c0d02fd0:	4f08      	ldr	r7, [pc, #32]	; (c0d02ff4 <io_seproxyhal_display_default+0x94>)
c0d02fd2:	447f      	add	r7, pc
c0d02fd4:	47b8      	blx	r7
c0d02fd6:	211c      	movs	r1, #28
c0d02fd8:	4620      	mov	r0, r4
c0d02fda:	47b8      	blx	r7
c0d02fdc:	b2b1      	uxth	r1, r6
c0d02fde:	4628      	mov	r0, r5
c0d02fe0:	47b8      	blx	r7
c0d02fe2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d02fe4:	4620      	mov	r0, r4
c0d02fe6:	4629      	mov	r1, r5
c0d02fe8:	f7ff ff6c 	bl	c0d02ec4 <io_seproxyhal_display_icon>
c0d02fec:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d02fee:	46c0      	nop			; (mov r8, r8)
c0d02ff0:	20000200 	.word	0x20000200
c0d02ff4:	000024e7 	.word	0x000024e7

c0d02ff8 <io_seproxyhal_button_push>:
c0d02ff8:	b570      	push	{r4, r5, r6, lr}
c0d02ffa:	2800      	cmp	r0, #0
c0d02ffc:	d027      	beq.n	c0d0304e <io_seproxyhal_button_push+0x56>
c0d02ffe:	4604      	mov	r4, r0
c0d03000:	4813      	ldr	r0, [pc, #76]	; (c0d03050 <io_seproxyhal_button_push+0x58>)
c0d03002:	c860      	ldmia	r0!, {r5, r6}
c0d03004:	3808      	subs	r0, #8
c0d03006:	428d      	cmp	r5, r1
c0d03008:	d101      	bne.n	c0d0300e <io_seproxyhal_button_push+0x16>
c0d0300a:	1c76      	adds	r6, r6, #1
c0d0300c:	6046      	str	r6, [r0, #4]
c0d0300e:	430d      	orrs	r5, r1
c0d03010:	2900      	cmp	r1, #0
c0d03012:	d002      	beq.n	c0d0301a <io_seproxyhal_button_push+0x22>
c0d03014:	6005      	str	r5, [r0, #0]
c0d03016:	462a      	mov	r2, r5
c0d03018:	e005      	b.n	c0d03026 <io_seproxyhal_button_push+0x2e>
c0d0301a:	2200      	movs	r2, #0
c0d0301c:	6002      	str	r2, [r0, #0]
c0d0301e:	6042      	str	r2, [r0, #4]
c0d03020:	4b0c      	ldr	r3, [pc, #48]	; (c0d03054 <io_seproxyhal_button_push+0x5c>)
c0d03022:	1c5b      	adds	r3, r3, #1
c0d03024:	431d      	orrs	r5, r3
c0d03026:	428a      	cmp	r2, r1
c0d03028:	d001      	beq.n	c0d0302e <io_seproxyhal_button_push+0x36>
c0d0302a:	2100      	movs	r1, #0
c0d0302c:	6041      	str	r1, [r0, #4]
c0d0302e:	2e08      	cmp	r6, #8
c0d03030:	d30a      	bcc.n	c0d03048 <io_seproxyhal_button_push+0x50>
c0d03032:	2103      	movs	r1, #3
c0d03034:	4630      	mov	r0, r6
c0d03036:	f004 f9b5 	bl	c0d073a4 <__aeabi_uidivmod>
c0d0303a:	2001      	movs	r0, #1
c0d0303c:	2900      	cmp	r1, #0
c0d0303e:	d101      	bne.n	c0d03044 <io_seproxyhal_button_push+0x4c>
c0d03040:	0781      	lsls	r1, r0, #30
c0d03042:	430d      	orrs	r5, r1
c0d03044:	07c0      	lsls	r0, r0, #31
c0d03046:	4385      	bics	r5, r0
c0d03048:	4628      	mov	r0, r5
c0d0304a:	4631      	mov	r1, r6
c0d0304c:	47a0      	blx	r4
c0d0304e:	bd70      	pop	{r4, r5, r6, pc}
c0d03050:	200004bc 	.word	0x200004bc
c0d03054:	7fffffff 	.word	0x7fffffff

c0d03058 <io_seproxyhal_se_reset>:
c0d03058:	4802      	ldr	r0, [pc, #8]	; (c0d03064 <io_seproxyhal_se_reset+0xc>)
c0d0305a:	4478      	add	r0, pc
c0d0305c:	2103      	movs	r1, #3
c0d0305e:	f002 fa2d 	bl	c0d054bc <io_seph_send>
c0d03062:	e7fe      	b.n	c0d03062 <io_seproxyhal_se_reset+0xa>
c0d03064:	00005427 	.word	0x00005427

c0d03068 <os_io_seproxyhal_get_app_name_and_version>:
c0d03068:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0306a:	4e0f      	ldr	r6, [pc, #60]	; (c0d030a8 <os_io_seproxyhal_get_app_name_and_version+0x40>)
c0d0306c:	2401      	movs	r4, #1
c0d0306e:	7034      	strb	r4, [r6, #0]
c0d03070:	1cb1      	adds	r1, r6, #2
c0d03072:	27ff      	movs	r7, #255	; 0xff
c0d03074:	3702      	adds	r7, #2
c0d03076:	1c7a      	adds	r2, r7, #1
c0d03078:	4620      	mov	r0, r4
c0d0307a:	f002 fa07 	bl	c0d0548c <os_registry_get_current_app_tag>
c0d0307e:	4605      	mov	r5, r0
c0d03080:	7070      	strb	r0, [r6, #1]
c0d03082:	1a3a      	subs	r2, r7, r0
c0d03084:	1987      	adds	r7, r0, r6
c0d03086:	1cf9      	adds	r1, r7, #3
c0d03088:	2002      	movs	r0, #2
c0d0308a:	f002 f9ff 	bl	c0d0548c <os_registry_get_current_app_tag>
c0d0308e:	70b8      	strb	r0, [r7, #2]
c0d03090:	182d      	adds	r5, r5, r0
c0d03092:	19ae      	adds	r6, r5, r6
c0d03094:	70f4      	strb	r4, [r6, #3]
c0d03096:	f002 f9e3 	bl	c0d05460 <os_flags>
c0d0309a:	2100      	movs	r1, #0
c0d0309c:	71b1      	strb	r1, [r6, #6]
c0d0309e:	2190      	movs	r1, #144	; 0x90
c0d030a0:	7171      	strb	r1, [r6, #5]
c0d030a2:	7130      	strb	r0, [r6, #4]
c0d030a4:	1de8      	adds	r0, r5, #7
c0d030a6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d030a8:	20000398 	.word	0x20000398

c0d030ac <io_exchange>:
c0d030ac:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d030ae:	b087      	sub	sp, #28
c0d030b0:	460a      	mov	r2, r1
c0d030b2:	4605      	mov	r5, r0
c0d030b4:	4c7f      	ldr	r4, [pc, #508]	; (c0d032b4 <io_exchange+0x208>)
c0d030b6:	4881      	ldr	r0, [pc, #516]	; (c0d032bc <io_exchange+0x210>)
c0d030b8:	4478      	add	r0, pc
c0d030ba:	9002      	str	r0, [sp, #8]
c0d030bc:	4e7c      	ldr	r6, [pc, #496]	; (c0d032b0 <io_exchange+0x204>)
c0d030be:	b2e8      	uxtb	r0, r5
c0d030c0:	0769      	lsls	r1, r5, #29
c0d030c2:	d000      	beq.n	c0d030c6 <io_exchange+0x1a>
c0d030c4:	e0df      	b.n	c0d03286 <io_exchange+0x1da>
c0d030c6:	2710      	movs	r7, #16
c0d030c8:	4007      	ands	r7, r0
c0d030ca:	0411      	lsls	r1, r2, #16
c0d030cc:	9506      	str	r5, [sp, #24]
c0d030ce:	d06b      	beq.n	c0d031a8 <io_exchange+0xfc>
c0d030d0:	2f00      	cmp	r7, #0
c0d030d2:	d169      	bne.n	c0d031a8 <io_exchange+0xfc>
c0d030d4:	9204      	str	r2, [sp, #16]
c0d030d6:	9005      	str	r0, [sp, #20]
c0d030d8:	f002 f9fa 	bl	c0d054d0 <io_seph_is_status_sent>
c0d030dc:	2800      	cmp	r0, #0
c0d030de:	d008      	beq.n	c0d030f2 <io_exchange+0x46>
c0d030e0:	2180      	movs	r1, #128	; 0x80
c0d030e2:	2200      	movs	r2, #0
c0d030e4:	4630      	mov	r0, r6
c0d030e6:	f002 f9fd 	bl	c0d054e4 <io_seph_recv>
c0d030ea:	2001      	movs	r0, #1
c0d030ec:	f000 f8ea 	bl	c0d032c4 <os_io_seph_recv_and_process>
c0d030f0:	e7f2      	b.n	c0d030d8 <io_exchange+0x2c>
c0d030f2:	68a0      	ldr	r0, [r4, #8]
c0d030f4:	9003      	str	r0, [sp, #12]
c0d030f6:	7820      	ldrb	r0, [r4, #0]
c0d030f8:	2807      	cmp	r0, #7
c0d030fa:	d00e      	beq.n	c0d0311a <io_exchange+0x6e>
c0d030fc:	280a      	cmp	r0, #10
c0d030fe:	9904      	ldr	r1, [sp, #16]
c0d03100:	d00f      	beq.n	c0d03122 <io_exchange+0x76>
c0d03102:	280b      	cmp	r0, #11
c0d03104:	d024      	beq.n	c0d03150 <io_exchange+0xa4>
c0d03106:	2800      	cmp	r0, #0
c0d03108:	d100      	bne.n	c0d0310c <io_exchange+0x60>
c0d0310a:	e0cb      	b.n	c0d032a4 <io_exchange+0x1f8>
c0d0310c:	b289      	uxth	r1, r1
c0d0310e:	9805      	ldr	r0, [sp, #20]
c0d03110:	f7ff fcc8 	bl	c0d02aa4 <io_exchange_al>
c0d03114:	2800      	cmp	r0, #0
c0d03116:	d020      	beq.n	c0d0315a <io_exchange+0xae>
c0d03118:	e0c4      	b.n	c0d032a4 <io_exchange+0x1f8>
c0d0311a:	9804      	ldr	r0, [sp, #16]
c0d0311c:	b281      	uxth	r1, r0
c0d0311e:	9802      	ldr	r0, [sp, #8]
c0d03120:	e019      	b.n	c0d03156 <io_exchange+0xaa>
c0d03122:	20ff      	movs	r0, #255	; 0xff
c0d03124:	3006      	adds	r0, #6
c0d03126:	b28a      	uxth	r2, r1
c0d03128:	9201      	str	r2, [sp, #4]
c0d0312a:	4282      	cmp	r2, r0
c0d0312c:	d300      	bcc.n	c0d03130 <io_exchange+0x84>
c0d0312e:	e0bc      	b.n	c0d032aa <io_exchange+0x1fe>
c0d03130:	70b1      	strb	r1, [r6, #2]
c0d03132:	2053      	movs	r0, #83	; 0x53
c0d03134:	7030      	strb	r0, [r6, #0]
c0d03136:	0a08      	lsrs	r0, r1, #8
c0d03138:	7070      	strb	r0, [r6, #1]
c0d0313a:	2103      	movs	r1, #3
c0d0313c:	4630      	mov	r0, r6
c0d0313e:	f002 f9bd 	bl	c0d054bc <io_seph_send>
c0d03142:	485d      	ldr	r0, [pc, #372]	; (c0d032b8 <io_exchange+0x20c>)
c0d03144:	9901      	ldr	r1, [sp, #4]
c0d03146:	f002 f9b9 	bl	c0d054bc <io_seph_send>
c0d0314a:	2000      	movs	r0, #0
c0d0314c:	7020      	strb	r0, [r4, #0]
c0d0314e:	e004      	b.n	c0d0315a <io_exchange+0xae>
c0d03150:	b289      	uxth	r1, r1
c0d03152:	485b      	ldr	r0, [pc, #364]	; (c0d032c0 <io_exchange+0x214>)
c0d03154:	4478      	add	r0, pc
c0d03156:	f000 f9f9 	bl	c0d0354c <io_usb_hid_send>
c0d0315a:	207d      	movs	r0, #125	; 0x7d
c0d0315c:	0100      	lsls	r0, r0, #4
c0d0315e:	9903      	ldr	r1, [sp, #12]
c0d03160:	180d      	adds	r5, r1, r0
c0d03162:	7820      	ldrb	r0, [r4, #0]
c0d03164:	2800      	cmp	r0, #0
c0d03166:	d011      	beq.n	c0d0318c <io_exchange+0xe0>
c0d03168:	f7ff fd7c 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d0316c:	2180      	movs	r1, #128	; 0x80
c0d0316e:	2200      	movs	r2, #0
c0d03170:	4630      	mov	r0, r6
c0d03172:	f002 f9b7 	bl	c0d054e4 <io_seph_recv>
c0d03176:	68a0      	ldr	r0, [r4, #8]
c0d03178:	42a8      	cmp	r0, r5
c0d0317a:	d300      	bcc.n	c0d0317e <io_exchange+0xd2>
c0d0317c:	e08c      	b.n	c0d03298 <io_exchange+0x1ec>
c0d0317e:	f7ff fe3f 	bl	c0d02e00 <io_seproxyhal_handle_event>
c0d03182:	f002 f9a5 	bl	c0d054d0 <io_seph_is_status_sent>
c0d03186:	2800      	cmp	r0, #0
c0d03188:	d1f0      	bne.n	c0d0316c <io_exchange+0xc0>
c0d0318a:	e7ea      	b.n	c0d03162 <io_exchange+0xb6>
c0d0318c:	2000      	movs	r0, #0
c0d0318e:	71a0      	strb	r0, [r4, #6]
c0d03190:	7020      	strb	r0, [r4, #0]
c0d03192:	8060      	strh	r0, [r4, #2]
c0d03194:	9906      	ldr	r1, [sp, #24]
c0d03196:	0689      	lsls	r1, r1, #26
c0d03198:	d47b      	bmi.n	c0d03292 <io_exchange+0x1e6>
c0d0319a:	f7ff fd63 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d0319e:	9d06      	ldr	r5, [sp, #24]
c0d031a0:	b268      	sxtb	r0, r5
c0d031a2:	2800      	cmp	r0, #0
c0d031a4:	9805      	ldr	r0, [sp, #20]
c0d031a6:	d47a      	bmi.n	c0d0329e <io_exchange+0x1f2>
c0d031a8:	2f00      	cmp	r7, #0
c0d031aa:	d104      	bne.n	c0d031b6 <io_exchange+0x10a>
c0d031ac:	0640      	lsls	r0, r0, #25
c0d031ae:	d46e      	bmi.n	c0d0328e <io_exchange+0x1e2>
c0d031b0:	2000      	movs	r0, #0
c0d031b2:	71a0      	strb	r0, [r4, #6]
c0d031b4:	7020      	strb	r0, [r4, #0]
c0d031b6:	2000      	movs	r0, #0
c0d031b8:	8060      	strh	r0, [r4, #2]
c0d031ba:	f7ff fd53 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d031be:	2180      	movs	r1, #128	; 0x80
c0d031c0:	2500      	movs	r5, #0
c0d031c2:	4630      	mov	r0, r6
c0d031c4:	462a      	mov	r2, r5
c0d031c6:	f002 f98d 	bl	c0d054e4 <io_seph_recv>
c0d031ca:	2803      	cmp	r0, #3
c0d031cc:	d30f      	bcc.n	c0d031ee <io_exchange+0x142>
c0d031ce:	78b1      	ldrb	r1, [r6, #2]
c0d031d0:	7872      	ldrb	r2, [r6, #1]
c0d031d2:	0212      	lsls	r2, r2, #8
c0d031d4:	1851      	adds	r1, r2, r1
c0d031d6:	1cc9      	adds	r1, r1, #3
c0d031d8:	4281      	cmp	r1, r0
c0d031da:	d108      	bne.n	c0d031ee <io_exchange+0x142>
c0d031dc:	f7ff fe10 	bl	c0d02e00 <io_seproxyhal_handle_event>
c0d031e0:	7820      	ldrb	r0, [r4, #0]
c0d031e2:	2800      	cmp	r0, #0
c0d031e4:	d0e9      	beq.n	c0d031ba <io_exchange+0x10e>
c0d031e6:	8860      	ldrh	r0, [r4, #2]
c0d031e8:	2800      	cmp	r0, #0
c0d031ea:	d0e6      	beq.n	c0d031ba <io_exchange+0x10e>
c0d031ec:	e002      	b.n	c0d031f4 <io_exchange+0x148>
c0d031ee:	8065      	strh	r5, [r4, #2]
c0d031f0:	7025      	strb	r5, [r4, #0]
c0d031f2:	e7e2      	b.n	c0d031ba <io_exchange+0x10e>
c0d031f4:	4a30      	ldr	r2, [pc, #192]	; (c0d032b8 <io_exchange+0x20c>)
c0d031f6:	7811      	ldrb	r1, [r2, #0]
c0d031f8:	29b0      	cmp	r1, #176	; 0xb0
c0d031fa:	d14a      	bne.n	c0d03292 <io_exchange+0x1e6>
c0d031fc:	7851      	ldrb	r1, [r2, #1]
c0d031fe:	29a7      	cmp	r1, #167	; 0xa7
c0d03200:	d00e      	beq.n	c0d03220 <io_exchange+0x174>
c0d03202:	2902      	cmp	r1, #2
c0d03204:	d01c      	beq.n	c0d03240 <io_exchange+0x194>
c0d03206:	2901      	cmp	r1, #1
c0d03208:	d143      	bne.n	c0d03292 <io_exchange+0x1e6>
c0d0320a:	7891      	ldrb	r1, [r2, #2]
c0d0320c:	78d2      	ldrb	r2, [r2, #3]
c0d0320e:	430a      	orrs	r2, r1
c0d03210:	d13f      	bne.n	c0d03292 <io_exchange+0x1e6>
c0d03212:	2007      	movs	r0, #7
c0d03214:	9d06      	ldr	r5, [sp, #24]
c0d03216:	4005      	ands	r5, r0
c0d03218:	f7ff ff26 	bl	c0d03068 <os_io_seproxyhal_get_app_name_and_version>
c0d0321c:	4602      	mov	r2, r0
c0d0321e:	e74e      	b.n	c0d030be <io_exchange+0x12>
c0d03220:	7891      	ldrb	r1, [r2, #2]
c0d03222:	78d2      	ldrb	r2, [r2, #3]
c0d03224:	430a      	orrs	r2, r1
c0d03226:	d134      	bne.n	c0d03292 <io_exchange+0x1e6>
c0d03228:	4923      	ldr	r1, [pc, #140]	; (c0d032b8 <io_exchange+0x20c>)
c0d0322a:	704d      	strb	r5, [r1, #1]
c0d0322c:	2090      	movs	r0, #144	; 0x90
c0d0322e:	7008      	strb	r0, [r1, #0]
c0d03230:	2007      	movs	r0, #7
c0d03232:	9d06      	ldr	r5, [sp, #24]
c0d03234:	4005      	ands	r5, r0
c0d03236:	207f      	movs	r0, #127	; 0x7f
c0d03238:	43c0      	mvns	r0, r0
c0d0323a:	182d      	adds	r5, r5, r0
c0d0323c:	2202      	movs	r2, #2
c0d0323e:	e73e      	b.n	c0d030be <io_exchange+0x12>
c0d03240:	7891      	ldrb	r1, [r2, #2]
c0d03242:	78d2      	ldrb	r2, [r2, #3]
c0d03244:	430a      	orrs	r2, r1
c0d03246:	d124      	bne.n	c0d03292 <io_exchange+0x1e6>
c0d03248:	f002 f8f2 	bl	c0d05430 <os_global_pin_is_validated>
c0d0324c:	28aa      	cmp	r0, #170	; 0xaa
c0d0324e:	d110      	bne.n	c0d03272 <io_exchange+0x1c6>
c0d03250:	2001      	movs	r0, #1
c0d03252:	4f19      	ldr	r7, [pc, #100]	; (c0d032b8 <io_exchange+0x20c>)
c0d03254:	7038      	strb	r0, [r7, #0]
c0d03256:	1cb8      	adds	r0, r7, #2
c0d03258:	2140      	movs	r1, #64	; 0x40
c0d0325a:	f002 f8dd 	bl	c0d05418 <os_perso_seed_cookie>
c0d0325e:	7078      	strb	r0, [r7, #1]
c0d03260:	1c81      	adds	r1, r0, #2
c0d03262:	b289      	uxth	r1, r1
c0d03264:	2290      	movs	r2, #144	; 0x90
c0d03266:	547a      	strb	r2, [r7, r1]
c0d03268:	1cc1      	adds	r1, r0, #3
c0d0326a:	b289      	uxth	r1, r1
c0d0326c:	547d      	strb	r5, [r7, r1]
c0d0326e:	1d02      	adds	r2, r0, #4
c0d03270:	e005      	b.n	c0d0327e <io_exchange+0x1d2>
c0d03272:	2085      	movs	r0, #133	; 0x85
c0d03274:	4910      	ldr	r1, [pc, #64]	; (c0d032b8 <io_exchange+0x20c>)
c0d03276:	7048      	strb	r0, [r1, #1]
c0d03278:	2069      	movs	r0, #105	; 0x69
c0d0327a:	7008      	strb	r0, [r1, #0]
c0d0327c:	2202      	movs	r2, #2
c0d0327e:	2007      	movs	r0, #7
c0d03280:	9d06      	ldr	r5, [sp, #24]
c0d03282:	4005      	ands	r5, r0
c0d03284:	e71b      	b.n	c0d030be <io_exchange+0x12>
c0d03286:	b291      	uxth	r1, r2
c0d03288:	f7ff fc0c 	bl	c0d02aa4 <io_exchange_al>
c0d0328c:	e001      	b.n	c0d03292 <io_exchange+0x1e6>
c0d0328e:	8860      	ldrh	r0, [r4, #2]
c0d03290:	1f40      	subs	r0, r0, #5
c0d03292:	b280      	uxth	r0, r0
c0d03294:	b007      	add	sp, #28
c0d03296:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d03298:	2005      	movs	r0, #5
c0d0329a:	f7ff fcdc 	bl	c0d02c56 <os_longjmp>
c0d0329e:	2005      	movs	r0, #5
c0d032a0:	f002 f900 	bl	c0d054a4 <os_sched_exit>
c0d032a4:	2004      	movs	r0, #4
c0d032a6:	f7ff fcd6 	bl	c0d02c56 <os_longjmp>
c0d032aa:	2002      	movs	r0, #2
c0d032ac:	f7ff fcd3 	bl	c0d02c56 <os_longjmp>
c0d032b0:	20000200 	.word	0x20000200
c0d032b4:	2000049c 	.word	0x2000049c
c0d032b8:	20000398 	.word	0x20000398
c0d032bc:	fffffce9 	.word	0xfffffce9
c0d032c0:	fffffc5d 	.word	0xfffffc5d

c0d032c4 <os_io_seph_recv_and_process>:
c0d032c4:	b5b0      	push	{r4, r5, r7, lr}
c0d032c6:	4604      	mov	r4, r0
c0d032c8:	f7ff fccc 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d032cc:	4d0b      	ldr	r5, [pc, #44]	; (c0d032fc <os_io_seph_recv_and_process+0x38>)
c0d032ce:	2180      	movs	r1, #128	; 0x80
c0d032d0:	2200      	movs	r2, #0
c0d032d2:	4628      	mov	r0, r5
c0d032d4:	f002 f906 	bl	c0d054e4 <io_seph_recv>
c0d032d8:	7828      	ldrb	r0, [r5, #0]
c0d032da:	2815      	cmp	r0, #21
c0d032dc:	d808      	bhi.n	c0d032f0 <os_io_seph_recv_and_process+0x2c>
c0d032de:	2101      	movs	r1, #1
c0d032e0:	4081      	lsls	r1, r0
c0d032e2:	4807      	ldr	r0, [pc, #28]	; (c0d03300 <os_io_seph_recv_and_process+0x3c>)
c0d032e4:	4201      	tst	r1, r0
c0d032e6:	d003      	beq.n	c0d032f0 <os_io_seph_recv_and_process+0x2c>
c0d032e8:	2c00      	cmp	r4, #0
c0d032ea:	d001      	beq.n	c0d032f0 <os_io_seph_recv_and_process+0x2c>
c0d032ec:	2000      	movs	r0, #0
c0d032ee:	bdb0      	pop	{r4, r5, r7, pc}
c0d032f0:	f7ff fd86 	bl	c0d02e00 <io_seproxyhal_handle_event>
c0d032f4:	1e41      	subs	r1, r0, #1
c0d032f6:	4188      	sbcs	r0, r1
c0d032f8:	bdb0      	pop	{r4, r5, r7, pc}
c0d032fa:	46c0      	nop			; (mov r8, r8)
c0d032fc:	20000200 	.word	0x20000200
c0d03300:	00207020 	.word	0x00207020

c0d03304 <io_seproxyhal_io_heartbeat>:
c0d03304:	b510      	push	{r4, lr}
c0d03306:	f7ff fcad 	bl	c0d02c64 <io_seproxyhal_general_status>
c0d0330a:	4c08      	ldr	r4, [pc, #32]	; (c0d0332c <io_seproxyhal_io_heartbeat+0x28>)
c0d0330c:	2180      	movs	r1, #128	; 0x80
c0d0330e:	2200      	movs	r2, #0
c0d03310:	4620      	mov	r0, r4
c0d03312:	f002 f8e7 	bl	c0d054e4 <io_seph_recv>
c0d03316:	7820      	ldrb	r0, [r4, #0]
c0d03318:	280e      	cmp	r0, #14
c0d0331a:	d001      	beq.n	c0d03320 <io_seproxyhal_io_heartbeat+0x1c>
c0d0331c:	f7ff fd70 	bl	c0d02e00 <io_seproxyhal_handle_event>
c0d03320:	f002 f8d6 	bl	c0d054d0 <io_seph_is_status_sent>
c0d03324:	2800      	cmp	r0, #0
c0d03326:	d1f1      	bne.n	c0d0330c <io_seproxyhal_io_heartbeat+0x8>
c0d03328:	bd10      	pop	{r4, pc}
c0d0332a:	46c0      	nop			; (mov r8, r8)
c0d0332c:	20000200 	.word	0x20000200

c0d03330 <io_usb_hid_receive>:
c0d03330:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d03332:	9200      	str	r2, [sp, #0]
c0d03334:	4605      	mov	r5, r0
c0d03336:	4c49      	ldr	r4, [pc, #292]	; (c0d0345c <io_usb_hid_receive+0x12c>)
c0d03338:	42a1      	cmp	r1, r4
c0d0333a:	d00f      	beq.n	c0d0335c <io_usb_hid_receive+0x2c>
c0d0333c:	460f      	mov	r7, r1
c0d0333e:	4c47      	ldr	r4, [pc, #284]	; (c0d0345c <io_usb_hid_receive+0x12c>)
c0d03340:	2640      	movs	r6, #64	; 0x40
c0d03342:	4620      	mov	r0, r4
c0d03344:	4631      	mov	r1, r6
c0d03346:	f004 f983 	bl	c0d07650 <__aeabi_memclr>
c0d0334a:	9a00      	ldr	r2, [sp, #0]
c0d0334c:	2a40      	cmp	r2, #64	; 0x40
c0d0334e:	d300      	bcc.n	c0d03352 <io_usb_hid_receive+0x22>
c0d03350:	4632      	mov	r2, r6
c0d03352:	4620      	mov	r0, r4
c0d03354:	4639      	mov	r1, r7
c0d03356:	f004 f985 	bl	c0d07664 <__aeabi_memmove>
c0d0335a:	4c40      	ldr	r4, [pc, #256]	; (c0d0345c <io_usb_hid_receive+0x12c>)
c0d0335c:	78a0      	ldrb	r0, [r4, #2]
c0d0335e:	2800      	cmp	r0, #0
c0d03360:	d027      	beq.n	c0d033b2 <io_usb_hid_receive+0x82>
c0d03362:	2801      	cmp	r0, #1
c0d03364:	d02e      	beq.n	c0d033c4 <io_usb_hid_receive+0x94>
c0d03366:	2802      	cmp	r0, #2
c0d03368:	d033      	beq.n	c0d033d2 <io_usb_hid_receive+0xa2>
c0d0336a:	2805      	cmp	r0, #5
c0d0336c:	d166      	bne.n	c0d0343c <io_usb_hid_receive+0x10c>
c0d0336e:	7920      	ldrb	r0, [r4, #4]
c0d03370:	78e1      	ldrb	r1, [r4, #3]
c0d03372:	0209      	lsls	r1, r1, #8
c0d03374:	1808      	adds	r0, r1, r0
c0d03376:	4e3a      	ldr	r6, [pc, #232]	; (c0d03460 <io_usb_hid_receive+0x130>)
c0d03378:	6831      	ldr	r1, [r6, #0]
c0d0337a:	2700      	movs	r7, #0
c0d0337c:	4281      	cmp	r1, r0
c0d0337e:	d164      	bne.n	c0d0344a <io_usb_hid_receive+0x11a>
c0d03380:	6830      	ldr	r0, [r6, #0]
c0d03382:	2800      	cmp	r0, #0
c0d03384:	d02a      	beq.n	c0d033dc <io_usb_hid_receive+0xac>
c0d03386:	9800      	ldr	r0, [sp, #0]
c0d03388:	1f40      	subs	r0, r0, #5
c0d0338a:	b282      	uxth	r2, r0
c0d0338c:	4935      	ldr	r1, [pc, #212]	; (c0d03464 <io_usb_hid_receive+0x134>)
c0d0338e:	680b      	ldr	r3, [r1, #0]
c0d03390:	4293      	cmp	r3, r2
c0d03392:	d200      	bcs.n	c0d03396 <io_usb_hid_receive+0x66>
c0d03394:	6808      	ldr	r0, [r1, #0]
c0d03396:	4622      	mov	r2, r4
c0d03398:	b281      	uxth	r1, r0
c0d0339a:	293b      	cmp	r1, #59	; 0x3b
c0d0339c:	d300      	bcc.n	c0d033a0 <io_usb_hid_receive+0x70>
c0d0339e:	203b      	movs	r0, #59	; 0x3b
c0d033a0:	b285      	uxth	r5, r0
c0d033a2:	4c31      	ldr	r4, [pc, #196]	; (c0d03468 <io_usb_hid_receive+0x138>)
c0d033a4:	6820      	ldr	r0, [r4, #0]
c0d033a6:	1d51      	adds	r1, r2, #5
c0d033a8:	462a      	mov	r2, r5
c0d033aa:	f004 f95b 	bl	c0d07664 <__aeabi_memmove>
c0d033ae:	6824      	ldr	r4, [r4, #0]
c0d033b0:	e03a      	b.n	c0d03428 <io_usb_hid_receive+0xf8>
c0d033b2:	2700      	movs	r7, #0
c0d033b4:	71a7      	strb	r7, [r4, #6]
c0d033b6:	7167      	strb	r7, [r4, #5]
c0d033b8:	7127      	strb	r7, [r4, #4]
c0d033ba:	70e7      	strb	r7, [r4, #3]
c0d033bc:	2140      	movs	r1, #64	; 0x40
c0d033be:	4620      	mov	r0, r4
c0d033c0:	47a8      	blx	r5
c0d033c2:	e042      	b.n	c0d0344a <io_usb_hid_receive+0x11a>
c0d033c4:	1ce0      	adds	r0, r4, #3
c0d033c6:	2104      	movs	r1, #4
c0d033c8:	f7fd f8c6 	bl	c0d00558 <cx_rng_no_throw>
c0d033cc:	2140      	movs	r1, #64	; 0x40
c0d033ce:	4620      	mov	r0, r4
c0d033d0:	e001      	b.n	c0d033d6 <io_usb_hid_receive+0xa6>
c0d033d2:	4822      	ldr	r0, [pc, #136]	; (c0d0345c <io_usb_hid_receive+0x12c>)
c0d033d4:	2140      	movs	r1, #64	; 0x40
c0d033d6:	47a8      	blx	r5
c0d033d8:	2700      	movs	r7, #0
c0d033da:	e036      	b.n	c0d0344a <io_usb_hid_receive+0x11a>
c0d033dc:	79a0      	ldrb	r0, [r4, #6]
c0d033de:	7961      	ldrb	r1, [r4, #5]
c0d033e0:	0209      	lsls	r1, r1, #8
c0d033e2:	1809      	adds	r1, r1, r0
c0d033e4:	4821      	ldr	r0, [pc, #132]	; (c0d0346c <io_usb_hid_receive+0x13c>)
c0d033e6:	6001      	str	r1, [r0, #0]
c0d033e8:	6801      	ldr	r1, [r0, #0]
c0d033ea:	2241      	movs	r2, #65	; 0x41
c0d033ec:	0092      	lsls	r2, r2, #2
c0d033ee:	4291      	cmp	r1, r2
c0d033f0:	d82b      	bhi.n	c0d0344a <io_usb_hid_receive+0x11a>
c0d033f2:	6800      	ldr	r0, [r0, #0]
c0d033f4:	491b      	ldr	r1, [pc, #108]	; (c0d03464 <io_usb_hid_receive+0x134>)
c0d033f6:	6008      	str	r0, [r1, #0]
c0d033f8:	7860      	ldrb	r0, [r4, #1]
c0d033fa:	7822      	ldrb	r2, [r4, #0]
c0d033fc:	0212      	lsls	r2, r2, #8
c0d033fe:	1810      	adds	r0, r2, r0
c0d03400:	4a1b      	ldr	r2, [pc, #108]	; (c0d03470 <io_usb_hid_receive+0x140>)
c0d03402:	6010      	str	r0, [r2, #0]
c0d03404:	680a      	ldr	r2, [r1, #0]
c0d03406:	9800      	ldr	r0, [sp, #0]
c0d03408:	1fc0      	subs	r0, r0, #7
c0d0340a:	b283      	uxth	r3, r0
c0d0340c:	429a      	cmp	r2, r3
c0d0340e:	d200      	bcs.n	c0d03412 <io_usb_hid_receive+0xe2>
c0d03410:	6808      	ldr	r0, [r1, #0]
c0d03412:	b281      	uxth	r1, r0
c0d03414:	2939      	cmp	r1, #57	; 0x39
c0d03416:	d300      	bcc.n	c0d0341a <io_usb_hid_receive+0xea>
c0d03418:	2039      	movs	r0, #57	; 0x39
c0d0341a:	b285      	uxth	r5, r0
c0d0341c:	1de1      	adds	r1, r4, #7
c0d0341e:	4c15      	ldr	r4, [pc, #84]	; (c0d03474 <io_usb_hid_receive+0x144>)
c0d03420:	4620      	mov	r0, r4
c0d03422:	462a      	mov	r2, r5
c0d03424:	f004 f91a 	bl	c0d0765c <__aeabi_memcpy>
c0d03428:	480e      	ldr	r0, [pc, #56]	; (c0d03464 <io_usb_hid_receive+0x134>)
c0d0342a:	6801      	ldr	r1, [r0, #0]
c0d0342c:	1b49      	subs	r1, r1, r5
c0d0342e:	6001      	str	r1, [r0, #0]
c0d03430:	1960      	adds	r0, r4, r5
c0d03432:	490d      	ldr	r1, [pc, #52]	; (c0d03468 <io_usb_hid_receive+0x138>)
c0d03434:	6008      	str	r0, [r1, #0]
c0d03436:	6830      	ldr	r0, [r6, #0]
c0d03438:	1c40      	adds	r0, r0, #1
c0d0343a:	6030      	str	r0, [r6, #0]
c0d0343c:	4809      	ldr	r0, [pc, #36]	; (c0d03464 <io_usb_hid_receive+0x134>)
c0d0343e:	6800      	ldr	r0, [r0, #0]
c0d03440:	2800      	cmp	r0, #0
c0d03442:	d001      	beq.n	c0d03448 <io_usb_hid_receive+0x118>
c0d03444:	2701      	movs	r7, #1
c0d03446:	e007      	b.n	c0d03458 <io_usb_hid_receive+0x128>
c0d03448:	2702      	movs	r7, #2
c0d0344a:	4805      	ldr	r0, [pc, #20]	; (c0d03460 <io_usb_hid_receive+0x130>)
c0d0344c:	2100      	movs	r1, #0
c0d0344e:	6001      	str	r1, [r0, #0]
c0d03450:	4805      	ldr	r0, [pc, #20]	; (c0d03468 <io_usb_hid_receive+0x138>)
c0d03452:	6001      	str	r1, [r0, #0]
c0d03454:	4803      	ldr	r0, [pc, #12]	; (c0d03464 <io_usb_hid_receive+0x134>)
c0d03456:	6001      	str	r1, [r0, #0]
c0d03458:	4638      	mov	r0, r7
c0d0345a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d0345c:	200004c4 	.word	0x200004c4
c0d03460:	20000504 	.word	0x20000504
c0d03464:	2000050c 	.word	0x2000050c
c0d03468:	20000510 	.word	0x20000510
c0d0346c:	20000508 	.word	0x20000508
c0d03470:	20000514 	.word	0x20000514
c0d03474:	20000398 	.word	0x20000398

c0d03478 <io_usb_hid_init>:
c0d03478:	4803      	ldr	r0, [pc, #12]	; (c0d03488 <io_usb_hid_init+0x10>)
c0d0347a:	2100      	movs	r1, #0
c0d0347c:	6001      	str	r1, [r0, #0]
c0d0347e:	4803      	ldr	r0, [pc, #12]	; (c0d0348c <io_usb_hid_init+0x14>)
c0d03480:	6001      	str	r1, [r0, #0]
c0d03482:	4803      	ldr	r0, [pc, #12]	; (c0d03490 <io_usb_hid_init+0x18>)
c0d03484:	6001      	str	r1, [r0, #0]
c0d03486:	4770      	bx	lr
c0d03488:	20000504 	.word	0x20000504
c0d0348c:	20000510 	.word	0x20000510
c0d03490:	2000050c 	.word	0x2000050c

c0d03494 <io_usb_hid_sent>:
c0d03494:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d03496:	4a27      	ldr	r2, [pc, #156]	; (c0d03534 <io_usb_hid_sent+0xa0>)
c0d03498:	6815      	ldr	r5, [r2, #0]
c0d0349a:	4b27      	ldr	r3, [pc, #156]	; (c0d03538 <io_usb_hid_sent+0xa4>)
c0d0349c:	6819      	ldr	r1, [r3, #0]
c0d0349e:	2900      	cmp	r1, #0
c0d034a0:	d021      	beq.n	c0d034e6 <io_usb_hid_sent+0x52>
c0d034a2:	2d00      	cmp	r5, #0
c0d034a4:	d01f      	beq.n	c0d034e6 <io_usb_hid_sent+0x52>
c0d034a6:	9000      	str	r0, [sp, #0]
c0d034a8:	4c26      	ldr	r4, [pc, #152]	; (c0d03544 <io_usb_hid_sent+0xb0>)
c0d034aa:	1d67      	adds	r7, r4, #5
c0d034ac:	263b      	movs	r6, #59	; 0x3b
c0d034ae:	4638      	mov	r0, r7
c0d034b0:	4631      	mov	r1, r6
c0d034b2:	f004 f8cd 	bl	c0d07650 <__aeabi_memclr>
c0d034b6:	4a20      	ldr	r2, [pc, #128]	; (c0d03538 <io_usb_hid_sent+0xa4>)
c0d034b8:	2005      	movs	r0, #5
c0d034ba:	70a0      	strb	r0, [r4, #2]
c0d034bc:	4822      	ldr	r0, [pc, #136]	; (c0d03548 <io_usb_hid_sent+0xb4>)
c0d034be:	6801      	ldr	r1, [r0, #0]
c0d034c0:	0a09      	lsrs	r1, r1, #8
c0d034c2:	7021      	strb	r1, [r4, #0]
c0d034c4:	6800      	ldr	r0, [r0, #0]
c0d034c6:	7060      	strb	r0, [r4, #1]
c0d034c8:	491c      	ldr	r1, [pc, #112]	; (c0d0353c <io_usb_hid_sent+0xa8>)
c0d034ca:	6808      	ldr	r0, [r1, #0]
c0d034cc:	0a00      	lsrs	r0, r0, #8
c0d034ce:	70e0      	strb	r0, [r4, #3]
c0d034d0:	6808      	ldr	r0, [r1, #0]
c0d034d2:	7120      	strb	r0, [r4, #4]
c0d034d4:	6809      	ldr	r1, [r1, #0]
c0d034d6:	6810      	ldr	r0, [r2, #0]
c0d034d8:	2900      	cmp	r1, #0
c0d034da:	d00c      	beq.n	c0d034f6 <io_usb_hid_sent+0x62>
c0d034dc:	283b      	cmp	r0, #59	; 0x3b
c0d034de:	d800      	bhi.n	c0d034e2 <io_usb_hid_sent+0x4e>
c0d034e0:	6816      	ldr	r6, [r2, #0]
c0d034e2:	4638      	mov	r0, r7
c0d034e4:	e012      	b.n	c0d0350c <io_usb_hid_sent+0x78>
c0d034e6:	4815      	ldr	r0, [pc, #84]	; (c0d0353c <io_usb_hid_sent+0xa8>)
c0d034e8:	2100      	movs	r1, #0
c0d034ea:	6001      	str	r1, [r0, #0]
c0d034ec:	6011      	str	r1, [r2, #0]
c0d034ee:	4814      	ldr	r0, [pc, #80]	; (c0d03540 <io_usb_hid_sent+0xac>)
c0d034f0:	7001      	strb	r1, [r0, #0]
c0d034f2:	6019      	str	r1, [r3, #0]
c0d034f4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d034f6:	2839      	cmp	r0, #57	; 0x39
c0d034f8:	d901      	bls.n	c0d034fe <io_usb_hid_sent+0x6a>
c0d034fa:	2639      	movs	r6, #57	; 0x39
c0d034fc:	e000      	b.n	c0d03500 <io_usb_hid_sent+0x6c>
c0d034fe:	6816      	ldr	r6, [r2, #0]
c0d03500:	6810      	ldr	r0, [r2, #0]
c0d03502:	0a00      	lsrs	r0, r0, #8
c0d03504:	7160      	strb	r0, [r4, #5]
c0d03506:	6810      	ldr	r0, [r2, #0]
c0d03508:	71a0      	strb	r0, [r4, #6]
c0d0350a:	1de0      	adds	r0, r4, #7
c0d0350c:	4629      	mov	r1, r5
c0d0350e:	4632      	mov	r2, r6
c0d03510:	f004 f8a8 	bl	c0d07664 <__aeabi_memmove>
c0d03514:	4b08      	ldr	r3, [pc, #32]	; (c0d03538 <io_usb_hid_sent+0xa4>)
c0d03516:	9a00      	ldr	r2, [sp, #0]
c0d03518:	4906      	ldr	r1, [pc, #24]	; (c0d03534 <io_usb_hid_sent+0xa0>)
c0d0351a:	6818      	ldr	r0, [r3, #0]
c0d0351c:	1b80      	subs	r0, r0, r6
c0d0351e:	6018      	str	r0, [r3, #0]
c0d03520:	19a8      	adds	r0, r5, r6
c0d03522:	6008      	str	r0, [r1, #0]
c0d03524:	4905      	ldr	r1, [pc, #20]	; (c0d0353c <io_usb_hid_sent+0xa8>)
c0d03526:	6808      	ldr	r0, [r1, #0]
c0d03528:	1c40      	adds	r0, r0, #1
c0d0352a:	6008      	str	r0, [r1, #0]
c0d0352c:	4805      	ldr	r0, [pc, #20]	; (c0d03544 <io_usb_hid_sent+0xb0>)
c0d0352e:	2140      	movs	r1, #64	; 0x40
c0d03530:	4790      	blx	r2
c0d03532:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d03534:	20000510 	.word	0x20000510
c0d03538:	2000050c 	.word	0x2000050c
c0d0353c:	20000504 	.word	0x20000504
c0d03540:	2000049c 	.word	0x2000049c
c0d03544:	200004c4 	.word	0x200004c4
c0d03548:	20000514 	.word	0x20000514

c0d0354c <io_usb_hid_send>:
c0d0354c:	b580      	push	{r7, lr}
c0d0354e:	2900      	cmp	r1, #0
c0d03550:	d00b      	beq.n	c0d0356a <io_usb_hid_send+0x1e>
c0d03552:	4a06      	ldr	r2, [pc, #24]	; (c0d0356c <io_usb_hid_send+0x20>)
c0d03554:	2300      	movs	r3, #0
c0d03556:	6013      	str	r3, [r2, #0]
c0d03558:	4a05      	ldr	r2, [pc, #20]	; (c0d03570 <io_usb_hid_send+0x24>)
c0d0355a:	6011      	str	r1, [r2, #0]
c0d0355c:	4a05      	ldr	r2, [pc, #20]	; (c0d03574 <io_usb_hid_send+0x28>)
c0d0355e:	4b06      	ldr	r3, [pc, #24]	; (c0d03578 <io_usb_hid_send+0x2c>)
c0d03560:	6013      	str	r3, [r2, #0]
c0d03562:	4a06      	ldr	r2, [pc, #24]	; (c0d0357c <io_usb_hid_send+0x30>)
c0d03564:	6011      	str	r1, [r2, #0]
c0d03566:	f7ff ff95 	bl	c0d03494 <io_usb_hid_sent>
c0d0356a:	bd80      	pop	{r7, pc}
c0d0356c:	20000504 	.word	0x20000504
c0d03570:	2000050c 	.word	0x2000050c
c0d03574:	20000510 	.word	0x20000510
c0d03578:	20000398 	.word	0x20000398
c0d0357c:	20000508 	.word	0x20000508

c0d03580 <snprintf>:
c0d03580:	b081      	sub	sp, #4
c0d03582:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d03584:	b08e      	sub	sp, #56	; 0x38
c0d03586:	9313      	str	r3, [sp, #76]	; 0x4c
c0d03588:	2800      	cmp	r0, #0
c0d0358a:	d100      	bne.n	c0d0358e <snprintf+0xe>
c0d0358c:	e1b7      	b.n	c0d038fe <snprintf+0x37e>
c0d0358e:	460d      	mov	r5, r1
c0d03590:	2900      	cmp	r1, #0
c0d03592:	d100      	bne.n	c0d03596 <snprintf+0x16>
c0d03594:	e1b3      	b.n	c0d038fe <snprintf+0x37e>
c0d03596:	4614      	mov	r4, r2
c0d03598:	4629      	mov	r1, r5
c0d0359a:	4606      	mov	r6, r0
c0d0359c:	f004 f858 	bl	c0d07650 <__aeabi_memclr>
c0d035a0:	1e68      	subs	r0, r5, #1
c0d035a2:	9004      	str	r0, [sp, #16]
c0d035a4:	d100      	bne.n	c0d035a8 <snprintf+0x28>
c0d035a6:	e1aa      	b.n	c0d038fe <snprintf+0x37e>
c0d035a8:	4633      	mov	r3, r6
c0d035aa:	a813      	add	r0, sp, #76	; 0x4c
c0d035ac:	9009      	str	r0, [sp, #36]	; 0x24
c0d035ae:	2001      	movs	r0, #1
c0d035b0:	9000      	str	r0, [sp, #0]
c0d035b2:	9e04      	ldr	r6, [sp, #16]
c0d035b4:	7820      	ldrb	r0, [r4, #0]
c0d035b6:	2800      	cmp	r0, #0
c0d035b8:	d100      	bne.n	c0d035bc <snprintf+0x3c>
c0d035ba:	e1a0      	b.n	c0d038fe <snprintf+0x37e>
c0d035bc:	2700      	movs	r7, #0
c0d035be:	2800      	cmp	r0, #0
c0d035c0:	d005      	beq.n	c0d035ce <snprintf+0x4e>
c0d035c2:	2825      	cmp	r0, #37	; 0x25
c0d035c4:	d003      	beq.n	c0d035ce <snprintf+0x4e>
c0d035c6:	19e0      	adds	r0, r4, r7
c0d035c8:	7840      	ldrb	r0, [r0, #1]
c0d035ca:	1c7f      	adds	r7, r7, #1
c0d035cc:	e7f7      	b.n	c0d035be <snprintf+0x3e>
c0d035ce:	42b7      	cmp	r7, r6
c0d035d0:	463d      	mov	r5, r7
c0d035d2:	d300      	bcc.n	c0d035d6 <snprintf+0x56>
c0d035d4:	4635      	mov	r5, r6
c0d035d6:	4618      	mov	r0, r3
c0d035d8:	4621      	mov	r1, r4
c0d035da:	9308      	str	r3, [sp, #32]
c0d035dc:	462a      	mov	r2, r5
c0d035de:	f004 f841 	bl	c0d07664 <__aeabi_memmove>
c0d035e2:	9603      	str	r6, [sp, #12]
c0d035e4:	1b70      	subs	r0, r6, r5
c0d035e6:	9004      	str	r0, [sp, #16]
c0d035e8:	d100      	bne.n	c0d035ec <snprintf+0x6c>
c0d035ea:	e188      	b.n	c0d038fe <snprintf+0x37e>
c0d035ec:	9808      	ldr	r0, [sp, #32]
c0d035ee:	1943      	adds	r3, r0, r5
c0d035f0:	1960      	adds	r0, r4, r5
c0d035f2:	5d61      	ldrb	r1, [r4, r5]
c0d035f4:	2925      	cmp	r1, #37	; 0x25
c0d035f6:	4604      	mov	r4, r0
c0d035f8:	d1db      	bne.n	c0d035b2 <snprintf+0x32>
c0d035fa:	1c44      	adds	r4, r0, #1
c0d035fc:	2000      	movs	r0, #0
c0d035fe:	2120      	movs	r1, #32
c0d03600:	9105      	str	r1, [sp, #20]
c0d03602:	9006      	str	r0, [sp, #24]
c0d03604:	9007      	str	r0, [sp, #28]
c0d03606:	9302      	str	r3, [sp, #8]
c0d03608:	4601      	mov	r1, r0
c0d0360a:	7822      	ldrb	r2, [r4, #0]
c0d0360c:	1c64      	adds	r4, r4, #1
c0d0360e:	2000      	movs	r0, #0
c0d03610:	2a2d      	cmp	r2, #45	; 0x2d
c0d03612:	d0f9      	beq.n	c0d03608 <snprintf+0x88>
c0d03614:	4610      	mov	r0, r2
c0d03616:	3830      	subs	r0, #48	; 0x30
c0d03618:	280a      	cmp	r0, #10
c0d0361a:	d312      	bcc.n	c0d03642 <snprintf+0xc2>
c0d0361c:	2a25      	cmp	r2, #37	; 0x25
c0d0361e:	d043      	beq.n	c0d036a8 <snprintf+0x128>
c0d03620:	2a2a      	cmp	r2, #42	; 0x2a
c0d03622:	d01f      	beq.n	c0d03664 <snprintf+0xe4>
c0d03624:	2a2e      	cmp	r2, #46	; 0x2e
c0d03626:	d127      	bne.n	c0d03678 <snprintf+0xf8>
c0d03628:	7820      	ldrb	r0, [r4, #0]
c0d0362a:	282a      	cmp	r0, #42	; 0x2a
c0d0362c:	d1c1      	bne.n	c0d035b2 <snprintf+0x32>
c0d0362e:	7860      	ldrb	r0, [r4, #1]
c0d03630:	2848      	cmp	r0, #72	; 0x48
c0d03632:	d003      	beq.n	c0d0363c <snprintf+0xbc>
c0d03634:	2873      	cmp	r0, #115	; 0x73
c0d03636:	d001      	beq.n	c0d0363c <snprintf+0xbc>
c0d03638:	2868      	cmp	r0, #104	; 0x68
c0d0363a:	d1ba      	bne.n	c0d035b2 <snprintf+0x32>
c0d0363c:	1c64      	adds	r4, r4, #1
c0d0363e:	2001      	movs	r0, #1
c0d03640:	e014      	b.n	c0d0366c <snprintf+0xec>
c0d03642:	2030      	movs	r0, #48	; 0x30
c0d03644:	4613      	mov	r3, r2
c0d03646:	4043      	eors	r3, r0
c0d03648:	9e07      	ldr	r6, [sp, #28]
c0d0364a:	4333      	orrs	r3, r6
c0d0364c:	d000      	beq.n	c0d03650 <snprintf+0xd0>
c0d0364e:	9805      	ldr	r0, [sp, #20]
c0d03650:	230a      	movs	r3, #10
c0d03652:	9e07      	ldr	r6, [sp, #28]
c0d03654:	4373      	muls	r3, r6
c0d03656:	189a      	adds	r2, r3, r2
c0d03658:	3a30      	subs	r2, #48	; 0x30
c0d0365a:	9207      	str	r2, [sp, #28]
c0d0365c:	9005      	str	r0, [sp, #20]
c0d0365e:	4608      	mov	r0, r1
c0d03660:	9b02      	ldr	r3, [sp, #8]
c0d03662:	e7d1      	b.n	c0d03608 <snprintf+0x88>
c0d03664:	7820      	ldrb	r0, [r4, #0]
c0d03666:	2873      	cmp	r0, #115	; 0x73
c0d03668:	d1a3      	bne.n	c0d035b2 <snprintf+0x32>
c0d0366a:	2002      	movs	r0, #2
c0d0366c:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d0366e:	1d0a      	adds	r2, r1, #4
c0d03670:	9209      	str	r2, [sp, #36]	; 0x24
c0d03672:	6809      	ldr	r1, [r1, #0]
c0d03674:	9106      	str	r1, [sp, #24]
c0d03676:	e7c7      	b.n	c0d03608 <snprintf+0x88>
c0d03678:	2a48      	cmp	r2, #72	; 0x48
c0d0367a:	d017      	beq.n	c0d036ac <snprintf+0x12c>
c0d0367c:	2a58      	cmp	r2, #88	; 0x58
c0d0367e:	d01a      	beq.n	c0d036b6 <snprintf+0x136>
c0d03680:	2a63      	cmp	r2, #99	; 0x63
c0d03682:	d023      	beq.n	c0d036cc <snprintf+0x14c>
c0d03684:	2a64      	cmp	r2, #100	; 0x64
c0d03686:	d02e      	beq.n	c0d036e6 <snprintf+0x166>
c0d03688:	48a0      	ldr	r0, [pc, #640]	; (c0d0390c <snprintf+0x38c>)
c0d0368a:	4478      	add	r0, pc
c0d0368c:	9001      	str	r0, [sp, #4]
c0d0368e:	2a68      	cmp	r2, #104	; 0x68
c0d03690:	d00f      	beq.n	c0d036b2 <snprintf+0x132>
c0d03692:	2a70      	cmp	r2, #112	; 0x70
c0d03694:	d006      	beq.n	c0d036a4 <snprintf+0x124>
c0d03696:	2a73      	cmp	r2, #115	; 0x73
c0d03698:	d033      	beq.n	c0d03702 <snprintf+0x182>
c0d0369a:	2a75      	cmp	r2, #117	; 0x75
c0d0369c:	d100      	bne.n	c0d036a0 <snprintf+0x120>
c0d0369e:	e09d      	b.n	c0d037dc <snprintf+0x25c>
c0d036a0:	2a78      	cmp	r2, #120	; 0x78
c0d036a2:	d186      	bne.n	c0d035b2 <snprintf+0x32>
c0d036a4:	2000      	movs	r0, #0
c0d036a6:	e007      	b.n	c0d036b8 <snprintf+0x138>
c0d036a8:	2025      	movs	r0, #37	; 0x25
c0d036aa:	e013      	b.n	c0d036d4 <snprintf+0x154>
c0d036ac:	4898      	ldr	r0, [pc, #608]	; (c0d03910 <snprintf+0x390>)
c0d036ae:	4478      	add	r0, pc
c0d036b0:	9001      	str	r0, [sp, #4]
c0d036b2:	9e00      	ldr	r6, [sp, #0]
c0d036b4:	e026      	b.n	c0d03704 <snprintf+0x184>
c0d036b6:	2001      	movs	r0, #1
c0d036b8:	9001      	str	r0, [sp, #4]
c0d036ba:	9809      	ldr	r0, [sp, #36]	; 0x24
c0d036bc:	1d01      	adds	r1, r0, #4
c0d036be:	9109      	str	r1, [sp, #36]	; 0x24
c0d036c0:	6800      	ldr	r0, [r0, #0]
c0d036c2:	9008      	str	r0, [sp, #32]
c0d036c4:	2000      	movs	r0, #0
c0d036c6:	9003      	str	r0, [sp, #12]
c0d036c8:	2610      	movs	r6, #16
c0d036ca:	e090      	b.n	c0d037ee <snprintf+0x26e>
c0d036cc:	9809      	ldr	r0, [sp, #36]	; 0x24
c0d036ce:	1d01      	adds	r1, r0, #4
c0d036d0:	9109      	str	r1, [sp, #36]	; 0x24
c0d036d2:	6800      	ldr	r0, [r0, #0]
c0d036d4:	7018      	strb	r0, [r3, #0]
c0d036d6:	9804      	ldr	r0, [sp, #16]
c0d036d8:	1e40      	subs	r0, r0, #1
c0d036da:	1c5b      	adds	r3, r3, #1
c0d036dc:	9004      	str	r0, [sp, #16]
c0d036de:	2800      	cmp	r0, #0
c0d036e0:	d000      	beq.n	c0d036e4 <snprintf+0x164>
c0d036e2:	e766      	b.n	c0d035b2 <snprintf+0x32>
c0d036e4:	e10b      	b.n	c0d038fe <snprintf+0x37e>
c0d036e6:	9809      	ldr	r0, [sp, #36]	; 0x24
c0d036e8:	1d01      	adds	r1, r0, #4
c0d036ea:	9109      	str	r1, [sp, #36]	; 0x24
c0d036ec:	6800      	ldr	r0, [r0, #0]
c0d036ee:	17c1      	asrs	r1, r0, #31
c0d036f0:	1842      	adds	r2, r0, r1
c0d036f2:	404a      	eors	r2, r1
c0d036f4:	9208      	str	r2, [sp, #32]
c0d036f6:	0fc0      	lsrs	r0, r0, #31
c0d036f8:	9003      	str	r0, [sp, #12]
c0d036fa:	2000      	movs	r0, #0
c0d036fc:	9001      	str	r0, [sp, #4]
c0d036fe:	260a      	movs	r6, #10
c0d03700:	e075      	b.n	c0d037ee <snprintf+0x26e>
c0d03702:	2600      	movs	r6, #0
c0d03704:	9a09      	ldr	r2, [sp, #36]	; 0x24
c0d03706:	1d13      	adds	r3, r2, #4
c0d03708:	9309      	str	r3, [sp, #36]	; 0x24
c0d0370a:	b2cb      	uxtb	r3, r1
c0d0370c:	6811      	ldr	r1, [r2, #0]
c0d0370e:	2b02      	cmp	r3, #2
c0d03710:	d100      	bne.n	c0d03714 <snprintf+0x194>
c0d03712:	e0da      	b.n	c0d038ca <snprintf+0x34a>
c0d03714:	2b01      	cmp	r3, #1
c0d03716:	d009      	beq.n	c0d0372c <snprintf+0x1ac>
c0d03718:	2b00      	cmp	r3, #0
c0d0371a:	9506      	str	r5, [sp, #24]
c0d0371c:	d106      	bne.n	c0d0372c <snprintf+0x1ac>
c0d0371e:	2300      	movs	r3, #0
c0d03720:	5cca      	ldrb	r2, [r1, r3]
c0d03722:	1c5b      	adds	r3, r3, #1
c0d03724:	2a00      	cmp	r2, #0
c0d03726:	d1fb      	bne.n	c0d03720 <snprintf+0x1a0>
c0d03728:	1e58      	subs	r0, r3, #1
c0d0372a:	9006      	str	r0, [sp, #24]
c0d0372c:	2e00      	cmp	r6, #0
c0d0372e:	9802      	ldr	r0, [sp, #8]
c0d03730:	d02c      	beq.n	c0d0378c <snprintf+0x20c>
c0d03732:	460a      	mov	r2, r1
c0d03734:	9803      	ldr	r0, [sp, #12]
c0d03736:	42b8      	cmp	r0, r7
c0d03738:	d300      	bcc.n	c0d0373c <snprintf+0x1bc>
c0d0373a:	4638      	mov	r0, r7
c0d0373c:	1c81      	adds	r1, r0, #2
c0d0373e:	2301      	movs	r3, #1
c0d03740:	43d8      	mvns	r0, r3
c0d03742:	9005      	str	r0, [sp, #20]
c0d03744:	9804      	ldr	r0, [sp, #16]
c0d03746:	9e06      	ldr	r6, [sp, #24]
c0d03748:	9b08      	ldr	r3, [sp, #32]
c0d0374a:	185d      	adds	r5, r3, r1
c0d0374c:	2e00      	cmp	r6, #0
c0d0374e:	d100      	bne.n	c0d03752 <snprintf+0x1d2>
c0d03750:	e0d1      	b.n	c0d038f6 <snprintf+0x376>
c0d03752:	9606      	str	r6, [sp, #24]
c0d03754:	2801      	cmp	r0, #1
c0d03756:	d800      	bhi.n	c0d0375a <snprintf+0x1da>
c0d03758:	e0d1      	b.n	c0d038fe <snprintf+0x37e>
c0d0375a:	4607      	mov	r7, r0
c0d0375c:	7816      	ldrb	r6, [r2, #0]
c0d0375e:	0930      	lsrs	r0, r6, #4
c0d03760:	9107      	str	r1, [sp, #28]
c0d03762:	9901      	ldr	r1, [sp, #4]
c0d03764:	5c08      	ldrb	r0, [r1, r0]
c0d03766:	9b05      	ldr	r3, [sp, #20]
c0d03768:	54e8      	strb	r0, [r5, r3]
c0d0376a:	1958      	adds	r0, r3, r5
c0d0376c:	250f      	movs	r5, #15
c0d0376e:	4035      	ands	r5, r6
c0d03770:	5d4d      	ldrb	r5, [r1, r5]
c0d03772:	9907      	ldr	r1, [sp, #28]
c0d03774:	7045      	strb	r5, [r0, #1]
c0d03776:	9803      	ldr	r0, [sp, #12]
c0d03778:	4288      	cmp	r0, r1
c0d0377a:	d100      	bne.n	c0d0377e <snprintf+0x1fe>
c0d0377c:	e0bf      	b.n	c0d038fe <snprintf+0x37e>
c0d0377e:	4638      	mov	r0, r7
c0d03780:	1eb8      	subs	r0, r7, #2
c0d03782:	1c89      	adds	r1, r1, #2
c0d03784:	1c52      	adds	r2, r2, #1
c0d03786:	9e06      	ldr	r6, [sp, #24]
c0d03788:	1e76      	subs	r6, r6, #1
c0d0378a:	e7dd      	b.n	c0d03748 <snprintf+0x1c8>
c0d0378c:	9e04      	ldr	r6, [sp, #16]
c0d0378e:	9f06      	ldr	r7, [sp, #24]
c0d03790:	42b7      	cmp	r7, r6
c0d03792:	463d      	mov	r5, r7
c0d03794:	d301      	bcc.n	c0d0379a <snprintf+0x21a>
c0d03796:	4635      	mov	r5, r6
c0d03798:	4637      	mov	r7, r6
c0d0379a:	462a      	mov	r2, r5
c0d0379c:	f003 ff62 	bl	c0d07664 <__aeabi_memmove>
c0d037a0:	9b02      	ldr	r3, [sp, #8]
c0d037a2:	1b76      	subs	r6, r6, r5
c0d037a4:	9604      	str	r6, [sp, #16]
c0d037a6:	d100      	bne.n	c0d037aa <snprintf+0x22a>
c0d037a8:	e0a9      	b.n	c0d038fe <snprintf+0x37e>
c0d037aa:	19db      	adds	r3, r3, r7
c0d037ac:	9807      	ldr	r0, [sp, #28]
c0d037ae:	42a8      	cmp	r0, r5
c0d037b0:	d800      	bhi.n	c0d037b4 <snprintf+0x234>
c0d037b2:	e6fe      	b.n	c0d035b2 <snprintf+0x32>
c0d037b4:	9807      	ldr	r0, [sp, #28]
c0d037b6:	1b45      	subs	r5, r0, r5
c0d037b8:	9e04      	ldr	r6, [sp, #16]
c0d037ba:	42b5      	cmp	r5, r6
c0d037bc:	d300      	bcc.n	c0d037c0 <snprintf+0x240>
c0d037be:	4635      	mov	r5, r6
c0d037c0:	2220      	movs	r2, #32
c0d037c2:	4618      	mov	r0, r3
c0d037c4:	4629      	mov	r1, r5
c0d037c6:	461f      	mov	r7, r3
c0d037c8:	f003 ff50 	bl	c0d0766c <__aeabi_memset>
c0d037cc:	463b      	mov	r3, r7
c0d037ce:	1b76      	subs	r6, r6, r5
c0d037d0:	197b      	adds	r3, r7, r5
c0d037d2:	9604      	str	r6, [sp, #16]
c0d037d4:	2e00      	cmp	r6, #0
c0d037d6:	d000      	beq.n	c0d037da <snprintf+0x25a>
c0d037d8:	e6eb      	b.n	c0d035b2 <snprintf+0x32>
c0d037da:	e090      	b.n	c0d038fe <snprintf+0x37e>
c0d037dc:	9809      	ldr	r0, [sp, #36]	; 0x24
c0d037de:	1d01      	adds	r1, r0, #4
c0d037e0:	9109      	str	r1, [sp, #36]	; 0x24
c0d037e2:	6800      	ldr	r0, [r0, #0]
c0d037e4:	9008      	str	r0, [sp, #32]
c0d037e6:	2000      	movs	r0, #0
c0d037e8:	260a      	movs	r6, #10
c0d037ea:	9003      	str	r0, [sp, #12]
c0d037ec:	9001      	str	r0, [sp, #4]
c0d037ee:	4849      	ldr	r0, [pc, #292]	; (c0d03914 <snprintf+0x394>)
c0d037f0:	4478      	add	r0, pc
c0d037f2:	9006      	str	r0, [sp, #24]
c0d037f4:	2501      	movs	r5, #1
c0d037f6:	2700      	movs	r7, #0
c0d037f8:	4630      	mov	r0, r6
c0d037fa:	4639      	mov	r1, r7
c0d037fc:	462a      	mov	r2, r5
c0d037fe:	463b      	mov	r3, r7
c0d03800:	f003 fe5c 	bl	c0d074bc <__aeabi_lmul>
c0d03804:	1e4a      	subs	r2, r1, #1
c0d03806:	4191      	sbcs	r1, r2
c0d03808:	9a08      	ldr	r2, [sp, #32]
c0d0380a:	4290      	cmp	r0, r2
c0d0380c:	d806      	bhi.n	c0d0381c <snprintf+0x29c>
c0d0380e:	2900      	cmp	r1, #0
c0d03810:	d104      	bne.n	c0d0381c <snprintf+0x29c>
c0d03812:	9907      	ldr	r1, [sp, #28]
c0d03814:	1e49      	subs	r1, r1, #1
c0d03816:	9107      	str	r1, [sp, #28]
c0d03818:	4605      	mov	r5, r0
c0d0381a:	e7ec      	b.n	c0d037f6 <snprintf+0x276>
c0d0381c:	9803      	ldr	r0, [sp, #12]
c0d0381e:	2800      	cmp	r0, #0
c0d03820:	9b07      	ldr	r3, [sp, #28]
c0d03822:	d101      	bne.n	c0d03828 <snprintf+0x2a8>
c0d03824:	4601      	mov	r1, r0
c0d03826:	e000      	b.n	c0d0382a <snprintf+0x2aa>
c0d03828:	43f9      	mvns	r1, r7
c0d0382a:	2800      	cmp	r0, #0
c0d0382c:	9800      	ldr	r0, [sp, #0]
c0d0382e:	9003      	str	r0, [sp, #12]
c0d03830:	d00b      	beq.n	c0d0384a <snprintf+0x2ca>
c0d03832:	9805      	ldr	r0, [sp, #20]
c0d03834:	b2c0      	uxtb	r0, r0
c0d03836:	2700      	movs	r7, #0
c0d03838:	2830      	cmp	r0, #48	; 0x30
c0d0383a:	9703      	str	r7, [sp, #12]
c0d0383c:	d105      	bne.n	c0d0384a <snprintf+0x2ca>
c0d0383e:	a80a      	add	r0, sp, #40	; 0x28
c0d03840:	222d      	movs	r2, #45	; 0x2d
c0d03842:	7002      	strb	r2, [r0, #0]
c0d03844:	2701      	movs	r7, #1
c0d03846:	9800      	ldr	r0, [sp, #0]
c0d03848:	9003      	str	r0, [sp, #12]
c0d0384a:	18ca      	adds	r2, r1, r3
c0d0384c:	1e92      	subs	r2, r2, #2
c0d0384e:	2a0d      	cmp	r2, #13
c0d03850:	d809      	bhi.n	c0d03866 <snprintf+0x2e6>
c0d03852:	2201      	movs	r2, #1
c0d03854:	1a51      	subs	r1, r2, r1
c0d03856:	428b      	cmp	r3, r1
c0d03858:	d005      	beq.n	c0d03866 <snprintf+0x2e6>
c0d0385a:	aa0a      	add	r2, sp, #40	; 0x28
c0d0385c:	9805      	ldr	r0, [sp, #20]
c0d0385e:	55d0      	strb	r0, [r2, r7]
c0d03860:	1c49      	adds	r1, r1, #1
c0d03862:	1c7f      	adds	r7, r7, #1
c0d03864:	e7f7      	b.n	c0d03856 <snprintf+0x2d6>
c0d03866:	9803      	ldr	r0, [sp, #12]
c0d03868:	2800      	cmp	r0, #0
c0d0386a:	d103      	bne.n	c0d03874 <snprintf+0x2f4>
c0d0386c:	a80a      	add	r0, sp, #40	; 0x28
c0d0386e:	212d      	movs	r1, #45	; 0x2d
c0d03870:	55c1      	strb	r1, [r0, r7]
c0d03872:	1c7f      	adds	r7, r7, #1
c0d03874:	9801      	ldr	r0, [sp, #4]
c0d03876:	2800      	cmp	r0, #0
c0d03878:	d114      	bne.n	c0d038a4 <snprintf+0x324>
c0d0387a:	4827      	ldr	r0, [pc, #156]	; (c0d03918 <snprintf+0x398>)
c0d0387c:	4478      	add	r0, pc
c0d0387e:	9006      	str	r0, [sp, #24]
c0d03880:	e010      	b.n	c0d038a4 <snprintf+0x324>
c0d03882:	9808      	ldr	r0, [sp, #32]
c0d03884:	4629      	mov	r1, r5
c0d03886:	f003 fd51 	bl	c0d0732c <__udivsi3>
c0d0388a:	4631      	mov	r1, r6
c0d0388c:	f003 fd8a 	bl	c0d073a4 <__aeabi_uidivmod>
c0d03890:	9806      	ldr	r0, [sp, #24]
c0d03892:	5c40      	ldrb	r0, [r0, r1]
c0d03894:	a90a      	add	r1, sp, #40	; 0x28
c0d03896:	55c8      	strb	r0, [r1, r7]
c0d03898:	4628      	mov	r0, r5
c0d0389a:	4631      	mov	r1, r6
c0d0389c:	f003 fd46 	bl	c0d0732c <__udivsi3>
c0d038a0:	4605      	mov	r5, r0
c0d038a2:	1c7f      	adds	r7, r7, #1
c0d038a4:	2d00      	cmp	r5, #0
c0d038a6:	d1ec      	bne.n	c0d03882 <snprintf+0x302>
c0d038a8:	9d04      	ldr	r5, [sp, #16]
c0d038aa:	42af      	cmp	r7, r5
c0d038ac:	d300      	bcc.n	c0d038b0 <snprintf+0x330>
c0d038ae:	462f      	mov	r7, r5
c0d038b0:	a90a      	add	r1, sp, #40	; 0x28
c0d038b2:	9e02      	ldr	r6, [sp, #8]
c0d038b4:	4630      	mov	r0, r6
c0d038b6:	463a      	mov	r2, r7
c0d038b8:	f003 fed4 	bl	c0d07664 <__aeabi_memmove>
c0d038bc:	4633      	mov	r3, r6
c0d038be:	1bed      	subs	r5, r5, r7
c0d038c0:	19f3      	adds	r3, r6, r7
c0d038c2:	9504      	str	r5, [sp, #16]
c0d038c4:	2d00      	cmp	r5, #0
c0d038c6:	d01a      	beq.n	c0d038fe <snprintf+0x37e>
c0d038c8:	e673      	b.n	c0d035b2 <snprintf+0x32>
c0d038ca:	7808      	ldrb	r0, [r1, #0]
c0d038cc:	2800      	cmp	r0, #0
c0d038ce:	9b02      	ldr	r3, [sp, #8]
c0d038d0:	d000      	beq.n	c0d038d4 <snprintf+0x354>
c0d038d2:	e66e      	b.n	c0d035b2 <snprintf+0x32>
c0d038d4:	9804      	ldr	r0, [sp, #16]
c0d038d6:	9e06      	ldr	r6, [sp, #24]
c0d038d8:	4286      	cmp	r6, r0
c0d038da:	d300      	bcc.n	c0d038de <snprintf+0x35e>
c0d038dc:	4606      	mov	r6, r0
c0d038de:	2220      	movs	r2, #32
c0d038e0:	4618      	mov	r0, r3
c0d038e2:	4631      	mov	r1, r6
c0d038e4:	f003 fec2 	bl	c0d0766c <__aeabi_memset>
c0d038e8:	9b02      	ldr	r3, [sp, #8]
c0d038ea:	4637      	mov	r7, r6
c0d038ec:	9804      	ldr	r0, [sp, #16]
c0d038ee:	1b80      	subs	r0, r0, r6
c0d038f0:	9004      	str	r0, [sp, #16]
c0d038f2:	d004      	beq.n	c0d038fe <snprintf+0x37e>
c0d038f4:	e759      	b.n	c0d037aa <snprintf+0x22a>
c0d038f6:	9004      	str	r0, [sp, #16]
c0d038f8:	9805      	ldr	r0, [sp, #20]
c0d038fa:	182b      	adds	r3, r5, r0
c0d038fc:	e659      	b.n	c0d035b2 <snprintf+0x32>
c0d038fe:	2000      	movs	r0, #0
c0d03900:	b00e      	add	sp, #56	; 0x38
c0d03902:	bcf0      	pop	{r4, r5, r6, r7}
c0d03904:	bc02      	pop	{r1}
c0d03906:	b001      	add	sp, #4
c0d03908:	4708      	bx	r1
c0d0390a:	46c0      	nop			; (mov r8, r8)
c0d0390c:	00004dfa 	.word	0x00004dfa
c0d03910:	00004de6 	.word	0x00004de6
c0d03914:	00004ca4 	.word	0x00004ca4
c0d03918:	00004c08 	.word	0x00004c08

c0d0391c <pic_internal>:
c0d0391c:	467a      	mov	r2, pc
c0d0391e:	4902      	ldr	r1, [pc, #8]	; (c0d03928 <pic_internal+0xc>)
c0d03920:	1cc9      	adds	r1, r1, #3
c0d03922:	1a89      	subs	r1, r1, r2
c0d03924:	1a40      	subs	r0, r0, r1
c0d03926:	4770      	bx	lr
c0d03928:	c0d0391d 	.word	0xc0d0391d

c0d0392c <pic>:
c0d0392c:	b580      	push	{r7, lr}
c0d0392e:	4904      	ldr	r1, [pc, #16]	; (c0d03940 <pic+0x14>)
c0d03930:	4288      	cmp	r0, r1
c0d03932:	d304      	bcc.n	c0d0393e <pic+0x12>
c0d03934:	4903      	ldr	r1, [pc, #12]	; (c0d03944 <pic+0x18>)
c0d03936:	4288      	cmp	r0, r1
c0d03938:	d201      	bcs.n	c0d0393e <pic+0x12>
c0d0393a:	f7ff ffef 	bl	c0d0391c <pic_internal>
c0d0393e:	bd80      	pop	{r7, pc}
c0d03940:	c0d00000 	.word	0xc0d00000
c0d03944:	c0d09c80 	.word	0xc0d09c80

c0d03948 <policyForGetPublicKey>:
c0d03948:	b570      	push	{r4, r5, r6, lr}
c0d0394a:	460c      	mov	r4, r1
c0d0394c:	4606      	mov	r6, r0
c0d0394e:	f7fc fcb3 	bl	c0d002b8 <bip44_hasValidFIOPrefix>
c0d03952:	2501      	movs	r5, #1
c0d03954:	2800      	cmp	r0, #0
c0d03956:	d014      	beq.n	c0d03982 <policyForGetPublicKey+0x3a>
c0d03958:	4630      	mov	r0, r6
c0d0395a:	f7fc fcc7 	bl	c0d002ec <bip44_containsAddress>
c0d0395e:	2800      	cmp	r0, #0
c0d03960:	d00f      	beq.n	c0d03982 <policyForGetPublicKey+0x3a>
c0d03962:	4630      	mov	r0, r6
c0d03964:	f7fc fcea 	bl	c0d0033c <bip44_containsMoreThanAddress>
c0d03968:	2800      	cmp	r0, #0
c0d0396a:	d10a      	bne.n	c0d03982 <policyForGetPublicKey+0x3a>
c0d0396c:	4630      	mov	r0, r6
c0d0396e:	f7fc fcd5 	bl	c0d0031c <bip44_hasReasonableAddress>
c0d03972:	2800      	cmp	r0, #0
c0d03974:	d004      	beq.n	c0d03980 <policyForGetPublicKey+0x38>
c0d03976:	2c02      	cmp	r4, #2
c0d03978:	d000      	beq.n	c0d0397c <policyForGetPublicKey+0x34>
c0d0397a:	2403      	movs	r4, #3
c0d0397c:	4620      	mov	r0, r4
c0d0397e:	bd70      	pop	{r4, r5, r6, pc}
c0d03980:	2504      	movs	r5, #4
c0d03982:	4628      	mov	r0, r5
c0d03984:	bd70      	pop	{r4, r5, r6, pc}

c0d03986 <policyForSignTxInit>:
c0d03986:	b510      	push	{r4, lr}
c0d03988:	4604      	mov	r4, r0
c0d0398a:	f7fc fc95 	bl	c0d002b8 <bip44_hasValidFIOPrefix>
c0d0398e:	2800      	cmp	r0, #0
c0d03990:	d00b      	beq.n	c0d039aa <policyForSignTxInit+0x24>
c0d03992:	4620      	mov	r0, r4
c0d03994:	f7fc fcaa 	bl	c0d002ec <bip44_containsAddress>
c0d03998:	2800      	cmp	r0, #0
c0d0399a:	d006      	beq.n	c0d039aa <policyForSignTxInit+0x24>
c0d0399c:	4620      	mov	r0, r4
c0d0399e:	f7fc fccd 	bl	c0d0033c <bip44_containsMoreThanAddress>
c0d039a2:	2800      	cmp	r0, #0
c0d039a4:	d101      	bne.n	c0d039aa <policyForSignTxInit+0x24>
c0d039a6:	2005      	movs	r0, #5
c0d039a8:	bd10      	pop	{r4, pc}
c0d039aa:	2001      	movs	r0, #1
c0d039ac:	bd10      	pop	{r4, pc}

c0d039ae <policyForSignTxDHEnd>:
c0d039ae:	2003      	movs	r0, #3
c0d039b0:	4770      	bx	lr

c0d039b2 <policyForSignTxFinish>:
c0d039b2:	2003      	movs	r0, #3
c0d039b4:	4770      	bx	lr

c0d039b6 <policyDerivePrivateKey>:
c0d039b6:	b510      	push	{r4, lr}
c0d039b8:	4604      	mov	r4, r0
c0d039ba:	f7fc fc7d 	bl	c0d002b8 <bip44_hasValidFIOPrefix>
c0d039be:	2800      	cmp	r0, #0
c0d039c0:	d00b      	beq.n	c0d039da <policyDerivePrivateKey+0x24>
c0d039c2:	4620      	mov	r0, r4
c0d039c4:	f7fc fc92 	bl	c0d002ec <bip44_containsAddress>
c0d039c8:	2800      	cmp	r0, #0
c0d039ca:	d006      	beq.n	c0d039da <policyDerivePrivateKey+0x24>
c0d039cc:	4620      	mov	r0, r4
c0d039ce:	f7fc fcb5 	bl	c0d0033c <bip44_containsMoreThanAddress>
c0d039d2:	2800      	cmp	r0, #0
c0d039d4:	d101      	bne.n	c0d039da <policyDerivePrivateKey+0x24>
c0d039d6:	2002      	movs	r0, #2
c0d039d8:	bd10      	pop	{r4, pc}
c0d039da:	2001      	movs	r0, #1
c0d039dc:	bd10      	pop	{r4, pc}

c0d039de <policyForDecodeDHDecode>:
c0d039de:	b510      	push	{r4, lr}
c0d039e0:	4604      	mov	r4, r0
c0d039e2:	f7fc fc69 	bl	c0d002b8 <bip44_hasValidFIOPrefix>
c0d039e6:	2800      	cmp	r0, #0
c0d039e8:	d00b      	beq.n	c0d03a02 <policyForDecodeDHDecode+0x24>
c0d039ea:	4620      	mov	r0, r4
c0d039ec:	f7fc fc7e 	bl	c0d002ec <bip44_containsAddress>
c0d039f0:	2800      	cmp	r0, #0
c0d039f2:	d006      	beq.n	c0d03a02 <policyForDecodeDHDecode+0x24>
c0d039f4:	4620      	mov	r0, r4
c0d039f6:	f7fc fca1 	bl	c0d0033c <bip44_containsMoreThanAddress>
c0d039fa:	2800      	cmp	r0, #0
c0d039fc:	d101      	bne.n	c0d03a02 <policyForDecodeDHDecode+0x24>
c0d039fe:	2002      	movs	r0, #2
c0d03a00:	bd10      	pop	{r4, pc}
c0d03a02:	2001      	movs	r0, #1
c0d03a04:	bd10      	pop	{r4, pc}
	...

c0d03a08 <signTx_handleInitAPDU>:
c0d03a08:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d03a0a:	2800      	cmp	r0, #0
c0d03a0c:	d17b      	bne.n	c0d03b06 <signTx_handleInitAPDU+0xfe>
c0d03a0e:	2a00      	cmp	r2, #0
c0d03a10:	d172      	bne.n	c0d03af8 <signTx_handleInitAPDU+0xf0>
c0d03a12:	9d08      	ldr	r5, [sp, #32]
c0d03a14:	2d1f      	cmp	r5, #31
c0d03a16:	d96f      	bls.n	c0d03af8 <signTx_handleInitAPDU+0xf0>
c0d03a18:	461e      	mov	r6, r3
c0d03a1a:	2420      	movs	r4, #32
c0d03a1c:	4618      	mov	r0, r3
c0d03a1e:	4621      	mov	r1, r4
c0d03a20:	f7fe fa96 	bl	c0d01f50 <getNetworkByChainId>
c0d03a24:	9002      	str	r0, [sp, #8]
c0d03a26:	2802      	cmp	r0, #2
c0d03a28:	d266      	bcs.n	c0d03af8 <signTx_handleInitAPDU+0xf0>
c0d03a2a:	4f3b      	ldr	r7, [pc, #236]	; (c0d03b18 <signTx_handleInitAPDU+0x110>)
c0d03a2c:	1d38      	adds	r0, r7, #4
c0d03a2e:	4631      	mov	r1, r6
c0d03a30:	3120      	adds	r1, #32
c0d03a32:	3d20      	subs	r5, #32
c0d03a34:	9001      	str	r0, [sp, #4]
c0d03a36:	462a      	mov	r2, r5
c0d03a38:	f7fc fc1a 	bl	c0d00270 <bip44_parseFromWire>
c0d03a3c:	42a8      	cmp	r0, r5
c0d03a3e:	d15b      	bne.n	c0d03af8 <signTx_handleInitAPDU+0xf0>
c0d03a40:	20ff      	movs	r0, #255	; 0xff
c0d03a42:	303a      	adds	r0, #58	; 0x3a
c0d03a44:	183d      	adds	r5, r7, r0
c0d03a46:	4628      	mov	r0, r5
c0d03a48:	4631      	mov	r1, r6
c0d03a4a:	4622      	mov	r2, r4
c0d03a4c:	f003 fe06 	bl	c0d0765c <__aeabi_memcpy>
c0d03a50:	2027      	movs	r0, #39	; 0x27
c0d03a52:	00c6      	lsls	r6, r0, #3
c0d03a54:	55bc      	strb	r4, [r7, r6]
c0d03a56:	4831      	ldr	r0, [pc, #196]	; (c0d03b1c <signTx_handleInitAPDU+0x114>)
c0d03a58:	463c      	mov	r4, r7
c0d03a5a:	1838      	adds	r0, r7, r0
c0d03a5c:	4937      	ldr	r1, [pc, #220]	; (c0d03b3c <signTx_handleInitAPDU+0x134>)
c0d03a5e:	4479      	add	r1, pc
c0d03a60:	2206      	movs	r2, #6
c0d03a62:	f003 fdfb 	bl	c0d0765c <__aeabi_memcpy>
c0d03a66:	482e      	ldr	r0, [pc, #184]	; (c0d03b20 <signTx_handleInitAPDU+0x118>)
c0d03a68:	9902      	ldr	r1, [sp, #8]
c0d03a6a:	2900      	cmp	r1, #0
c0d03a6c:	d003      	beq.n	c0d03a76 <signTx_handleInitAPDU+0x6e>
c0d03a6e:	2901      	cmp	r1, #1
c0d03a70:	d146      	bne.n	c0d03b00 <signTx_handleInitAPDU+0xf8>
c0d03a72:	492d      	ldr	r1, [pc, #180]	; (c0d03b28 <signTx_handleInitAPDU+0x120>)
c0d03a74:	e000      	b.n	c0d03a78 <signTx_handleInitAPDU+0x70>
c0d03a76:	492b      	ldr	r1, [pc, #172]	; (c0d03b24 <signTx_handleInitAPDU+0x11c>)
c0d03a78:	4627      	mov	r7, r4
c0d03a7a:	4a2c      	ldr	r2, [pc, #176]	; (c0d03b2c <signTx_handleInitAPDU+0x124>)
c0d03a7c:	54a1      	strb	r1, [r4, r2]
c0d03a7e:	18a2      	adds	r2, r4, r2
c0d03a80:	7110      	strb	r0, [r2, #4]
c0d03a82:	0e0b      	lsrs	r3, r1, #24
c0d03a84:	70d3      	strb	r3, [r2, #3]
c0d03a86:	0c0b      	lsrs	r3, r1, #16
c0d03a88:	7093      	strb	r3, [r2, #2]
c0d03a8a:	0a09      	lsrs	r1, r1, #8
c0d03a8c:	7051      	strb	r1, [r2, #1]
c0d03a8e:	0e01      	lsrs	r1, r0, #24
c0d03a90:	71d1      	strb	r1, [r2, #7]
c0d03a92:	0c01      	lsrs	r1, r0, #16
c0d03a94:	7191      	strb	r1, [r2, #6]
c0d03a96:	0a00      	lsrs	r0, r0, #8
c0d03a98:	7150      	strb	r0, [r2, #5]
c0d03a9a:	4825      	ldr	r0, [pc, #148]	; (c0d03b30 <signTx_handleInitAPDU+0x128>)
c0d03a9c:	5c20      	ldrb	r0, [r4, r0]
c0d03a9e:	2800      	cmp	r0, #0
c0d03aa0:	d134      	bne.n	c0d03b0c <signTx_handleInitAPDU+0x104>
c0d03aa2:	4638      	mov	r0, r7
c0d03aa4:	30c4      	adds	r0, #196	; 0xc4
c0d03aa6:	2120      	movs	r1, #32
c0d03aa8:	f001 f828 	bl	c0d04afc <countedSectionProcess>
c0d03aac:	2800      	cmp	r0, #0
c0d03aae:	d023      	beq.n	c0d03af8 <signTx_handleInitAPDU+0xf0>
c0d03ab0:	8e38      	ldrh	r0, [r7, #48]	; 0x30
c0d03ab2:	4920      	ldr	r1, [pc, #128]	; (c0d03b34 <signTx_handleInitAPDU+0x12c>)
c0d03ab4:	1841      	adds	r1, r0, r1
c0d03ab6:	4248      	negs	r0, r1
c0d03ab8:	4148      	adcs	r0, r1
c0d03aba:	5dbc      	ldrb	r4, [r7, r6]
c0d03abc:	4920      	ldr	r1, [pc, #128]	; (c0d03b40 <signTx_handleInitAPDU+0x138>)
c0d03abe:	4479      	add	r1, pc
c0d03ac0:	f7fc fbce 	bl	c0d00260 <assert>
c0d03ac4:	2600      	movs	r6, #0
c0d03ac6:	9600      	str	r6, [sp, #0]
c0d03ac8:	4630      	mov	r0, r6
c0d03aca:	4629      	mov	r1, r5
c0d03acc:	4622      	mov	r2, r4
c0d03ace:	4633      	mov	r3, r6
c0d03ad0:	f000 fe20 	bl	c0d04714 <cx_hash>
c0d03ad4:	201d      	movs	r0, #29
c0d03ad6:	0140      	lsls	r0, r0, #5
c0d03ad8:	543e      	strb	r6, [r7, r0]
c0d03ada:	9801      	ldr	r0, [sp, #4]
c0d03adc:	f7ff ff53 	bl	c0d03986 <policyForSignTxInit>
c0d03ae0:	4604      	mov	r4, r0
c0d03ae2:	f000 f82f 	bl	c0d03b44 <ENSURE_NOT_DENIED>
c0d03ae6:	2c05      	cmp	r4, #5
c0d03ae8:	d10a      	bne.n	c0d03b00 <signTx_handleInitAPDU+0xf8>
c0d03aea:	20e7      	movs	r0, #231	; 0xe7
c0d03aec:	0080      	lsls	r0, r0, #2
c0d03aee:	2164      	movs	r1, #100	; 0x64
c0d03af0:	5039      	str	r1, [r7, r0]
c0d03af2:	f000 fe27 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03af6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d03af8:	4806      	ldr	r0, [pc, #24]	; (c0d03b14 <signTx_handleInitAPDU+0x10c>)
c0d03afa:	1c80      	adds	r0, r0, #2
c0d03afc:	f7ff f8ab 	bl	c0d02c56 <os_longjmp>
c0d03b00:	480d      	ldr	r0, [pc, #52]	; (c0d03b38 <signTx_handleInitAPDU+0x130>)
c0d03b02:	f7ff f8a8 	bl	c0d02c56 <os_longjmp>
c0d03b06:	4803      	ldr	r0, [pc, #12]	; (c0d03b14 <signTx_handleInitAPDU+0x10c>)
c0d03b08:	f7ff f8a5 	bl	c0d02c56 <os_longjmp>
c0d03b0c:	4801      	ldr	r0, [pc, #4]	; (c0d03b14 <signTx_handleInitAPDU+0x10c>)
c0d03b0e:	1c40      	adds	r0, r0, #1
c0d03b10:	f7ff f8a1 	bl	c0d02c56 <os_longjmp>
c0d03b14:	00006e05 	.word	0x00006e05
c0d03b18:	20000518 	.word	0x20000518
c0d03b1c:	000003a1 	.word	0x000003a1
c0d03b20:	0074656e 	.word	0x0074656e
c0d03b24:	6e69614d 	.word	0x6e69614d
c0d03b28:	74736554 	.word	0x74736554
c0d03b2c:	000003b5 	.word	0x000003b5
c0d03b30:	00000215 	.word	0x00000215
c0d03b34:	ffffcfc7 	.word	0xffffcfc7
c0d03b38:	00004701 	.word	0x00004701
c0d03b3c:	00004a46 	.word	0x00004a46
c0d03b40:	00004b3f 	.word	0x00004b3f

c0d03b44 <ENSURE_NOT_DENIED>:
c0d03b44:	b580      	push	{r7, lr}
c0d03b46:	2801      	cmp	r0, #1
c0d03b48:	d000      	beq.n	c0d03b4c <ENSURE_NOT_DENIED+0x8>
c0d03b4a:	bd80      	pop	{r7, pc}
c0d03b4c:	4801      	ldr	r0, [pc, #4]	; (c0d03b54 <ENSURE_NOT_DENIED+0x10>)
c0d03b4e:	f7ff f882 	bl	c0d02c56 <os_longjmp>
c0d03b52:	46c0      	nop			; (mov r8, r8)
c0d03b54:	00006e10 	.word	0x00006e10

c0d03b58 <signTx_handleAppendConstDataAPDU>:
c0d03b58:	b5b0      	push	{r4, r5, r7, lr}
c0d03b5a:	2800      	cmp	r0, #0
c0d03b5c:	d127      	bne.n	c0d03bae <signTx_handleAppendConstDataAPDU+0x56>
c0d03b5e:	4614      	mov	r4, r2
c0d03b60:	2adc      	cmp	r2, #220	; 0xdc
c0d03b62:	d221      	bcs.n	c0d03ba8 <signTx_handleAppendConstDataAPDU+0x50>
c0d03b64:	9804      	ldr	r0, [sp, #16]
c0d03b66:	2800      	cmp	r0, #0
c0d03b68:	d11e      	bne.n	c0d03ba8 <signTx_handleAppendConstDataAPDU+0x50>
c0d03b6a:	20ff      	movs	r0, #255	; 0xff
c0d03b6c:	303a      	adds	r0, #58	; 0x3a
c0d03b6e:	4d13      	ldr	r5, [pc, #76]	; (c0d03bbc <signTx_handleAppendConstDataAPDU+0x64>)
c0d03b70:	1828      	adds	r0, r5, r0
c0d03b72:	4622      	mov	r2, r4
c0d03b74:	f003 fd72 	bl	c0d0765c <__aeabi_memcpy>
c0d03b78:	4811      	ldr	r0, [pc, #68]	; (c0d03bc0 <signTx_handleAppendConstDataAPDU+0x68>)
c0d03b7a:	2100      	movs	r1, #0
c0d03b7c:	5429      	strb	r1, [r5, r0]
c0d03b7e:	4811      	ldr	r0, [pc, #68]	; (c0d03bc4 <signTx_handleAppendConstDataAPDU+0x6c>)
c0d03b80:	5429      	strb	r1, [r5, r0]
c0d03b82:	2027      	movs	r0, #39	; 0x27
c0d03b84:	00c0      	lsls	r0, r0, #3
c0d03b86:	542c      	strb	r4, [r5, r0]
c0d03b88:	4628      	mov	r0, r5
c0d03b8a:	30c4      	adds	r0, #196	; 0xc4
c0d03b8c:	4621      	mov	r1, r4
c0d03b8e:	f000 ffb5 	bl	c0d04afc <countedSectionProcess>
c0d03b92:	2800      	cmp	r0, #0
c0d03b94:	d008      	beq.n	c0d03ba8 <signTx_handleAppendConstDataAPDU+0x50>
c0d03b96:	f000 fe09 	bl	c0d047ac <processShaAndPosibleDHAndPrepareResponse>
c0d03b9a:	20e7      	movs	r0, #231	; 0xe7
c0d03b9c:	0080      	lsls	r0, r0, #2
c0d03b9e:	2165      	movs	r1, #101	; 0x65
c0d03ba0:	5029      	str	r1, [r5, r0]
c0d03ba2:	f000 fdcf 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03ba6:	bdb0      	pop	{r4, r5, r7, pc}
c0d03ba8:	4803      	ldr	r0, [pc, #12]	; (c0d03bb8 <signTx_handleAppendConstDataAPDU+0x60>)
c0d03baa:	f7ff f854 	bl	c0d02c56 <os_longjmp>
c0d03bae:	4802      	ldr	r0, [pc, #8]	; (c0d03bb8 <signTx_handleAppendConstDataAPDU+0x60>)
c0d03bb0:	1e80      	subs	r0, r0, #2
c0d03bb2:	f7ff f850 	bl	c0d02c56 <os_longjmp>
c0d03bb6:	46c0      	nop			; (mov r8, r8)
c0d03bb8:	00006e07 	.word	0x00006e07
c0d03bbc:	20000518 	.word	0x20000518
c0d03bc0:	000003b5 	.word	0x000003b5
c0d03bc4:	000003a1 	.word	0x000003a1

c0d03bc8 <signTx_handleShowMessageAPDU>:
c0d03bc8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d03bca:	2800      	cmp	r0, #0
c0d03bcc:	d13f      	bne.n	c0d03c4e <signTx_handleShowMessageAPDU+0x86>
c0d03bce:	2a00      	cmp	r2, #0
c0d03bd0:	d03a      	beq.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03bd2:	460f      	mov	r7, r1
c0d03bd4:	780c      	ldrb	r4, [r1, #0]
c0d03bd6:	2c13      	cmp	r4, #19
c0d03bd8:	d236      	bcs.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03bda:	1ca0      	adds	r0, r4, #2
c0d03bdc:	4290      	cmp	r0, r2
c0d03bde:	d833      	bhi.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03be0:	1c7e      	adds	r6, r7, #1
c0d03be2:	5d31      	ldrb	r1, [r6, r4]
c0d03be4:	29db      	cmp	r1, #219	; 0xdb
c0d03be6:	d22f      	bcs.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03be8:	1840      	adds	r0, r0, r1
c0d03bea:	4290      	cmp	r0, r2
c0d03bec:	d12c      	bne.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03bee:	9806      	ldr	r0, [sp, #24]
c0d03bf0:	2800      	cmp	r0, #0
c0d03bf2:	d129      	bne.n	c0d03c48 <signTx_handleShowMessageAPDU+0x80>
c0d03bf4:	1935      	adds	r5, r6, r4
c0d03bf6:	4630      	mov	r0, r6
c0d03bf8:	4621      	mov	r1, r4
c0d03bfa:	f001 fdd5 	bl	c0d057a8 <str_validateTextBuffer>
c0d03bfe:	5d31      	ldrb	r1, [r6, r4]
c0d03c00:	1c68      	adds	r0, r5, #1
c0d03c02:	9000      	str	r0, [sp, #0]
c0d03c04:	f001 fdd0 	bl	c0d057a8 <str_validateTextBuffer>
c0d03c08:	4814      	ldr	r0, [pc, #80]	; (c0d03c5c <signTx_handleShowMessageAPDU+0x94>)
c0d03c0a:	4915      	ldr	r1, [pc, #84]	; (c0d03c60 <signTx_handleShowMessageAPDU+0x98>)
c0d03c0c:	180d      	adds	r5, r1, r0
c0d03c0e:	783a      	ldrb	r2, [r7, #0]
c0d03c10:	4628      	mov	r0, r5
c0d03c12:	4631      	mov	r1, r6
c0d03c14:	f003 fd26 	bl	c0d07664 <__aeabi_memmove>
c0d03c18:	7838      	ldrb	r0, [r7, #0]
c0d03c1a:	2700      	movs	r7, #0
c0d03c1c:	542f      	strb	r7, [r5, r0]
c0d03c1e:	5d32      	ldrb	r2, [r6, r4]
c0d03c20:	4810      	ldr	r0, [pc, #64]	; (c0d03c64 <signTx_handleShowMessageAPDU+0x9c>)
c0d03c22:	490f      	ldr	r1, [pc, #60]	; (c0d03c60 <signTx_handleShowMessageAPDU+0x98>)
c0d03c24:	180d      	adds	r5, r1, r0
c0d03c26:	4628      	mov	r0, r5
c0d03c28:	9900      	ldr	r1, [sp, #0]
c0d03c2a:	f003 fd1b 	bl	c0d07664 <__aeabi_memmove>
c0d03c2e:	201d      	movs	r0, #29
c0d03c30:	0140      	lsls	r0, r0, #5
c0d03c32:	4a0b      	ldr	r2, [pc, #44]	; (c0d03c60 <signTx_handleShowMessageAPDU+0x98>)
c0d03c34:	5417      	strb	r7, [r2, r0]
c0d03c36:	20e7      	movs	r0, #231	; 0xe7
c0d03c38:	0080      	lsls	r0, r0, #2
c0d03c3a:	2164      	movs	r1, #100	; 0x64
c0d03c3c:	5011      	str	r1, [r2, r0]
c0d03c3e:	5d30      	ldrb	r0, [r6, r4]
c0d03c40:	542f      	strb	r7, [r5, r0]
c0d03c42:	f000 fd7f 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03c46:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d03c48:	4803      	ldr	r0, [pc, #12]	; (c0d03c58 <signTx_handleShowMessageAPDU+0x90>)
c0d03c4a:	f7ff f804 	bl	c0d02c56 <os_longjmp>
c0d03c4e:	4802      	ldr	r0, [pc, #8]	; (c0d03c58 <signTx_handleShowMessageAPDU+0x90>)
c0d03c50:	1e80      	subs	r0, r0, #2
c0d03c52:	f7ff f800 	bl	c0d02c56 <os_longjmp>
c0d03c56:	46c0      	nop			; (mov r8, r8)
c0d03c58:	00006e07 	.word	0x00006e07
c0d03c5c:	000003a1 	.word	0x000003a1
c0d03c60:	20000518 	.word	0x20000518
c0d03c64:	000003b5 	.word	0x000003b5

c0d03c68 <signTx_handleAppendDataAPDU>:
c0d03c68:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d03c6a:	b08b      	sub	sp, #44	; 0x2c
c0d03c6c:	9306      	str	r3, [sp, #24]
c0d03c6e:	2800      	cmp	r0, #0
c0d03c70:	d000      	beq.n	c0d03c74 <signTx_handleAppendDataAPDU+0xc>
c0d03c72:	e10c      	b.n	c0d03e8e <signTx_handleAppendDataAPDU+0x226>
c0d03c74:	2a13      	cmp	r2, #19
c0d03c76:	d800      	bhi.n	c0d03c7a <signTx_handleAppendDataAPDU+0x12>
c0d03c78:	e106      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03c7a:	460e      	mov	r6, r1
c0d03c7c:	7cc8      	ldrb	r0, [r1, #19]
c0d03c7e:	2814      	cmp	r0, #20
c0d03c80:	d300      	bcc.n	c0d03c84 <signTx_handleAppendDataAPDU+0x1c>
c0d03c82:	e101      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03c84:	3014      	adds	r0, #20
c0d03c86:	4290      	cmp	r0, r2
c0d03c88:	d000      	beq.n	c0d03c8c <signTx_handleAppendDataAPDU+0x24>
c0d03c8a:	e0fd      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03c8c:	9f10      	ldr	r7, [sp, #64]	; 0x40
c0d03c8e:	2fdd      	cmp	r7, #221	; 0xdd
c0d03c90:	d300      	bcc.n	c0d03c94 <signTx_handleAppendDataAPDU+0x2c>
c0d03c92:	e0f9      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03c94:	7cb0      	ldrb	r0, [r6, #18]
c0d03c96:	0900      	lsrs	r0, r0, #4
c0d03c98:	9705      	str	r7, [sp, #20]
c0d03c9a:	d100      	bne.n	c0d03c9e <signTx_handleAppendDataAPDU+0x36>
c0d03c9c:	e090      	b.n	c0d03dc0 <signTx_handleAppendDataAPDU+0x158>
c0d03c9e:	2804      	cmp	r0, #4
c0d03ca0:	d01a      	beq.n	c0d03cd8 <signTx_handleAppendDataAPDU+0x70>
c0d03ca2:	2802      	cmp	r0, #2
c0d03ca4:	d02b      	beq.n	c0d03cfe <signTx_handleAppendDataAPDU+0x96>
c0d03ca6:	2803      	cmp	r0, #3
c0d03ca8:	d03c      	beq.n	c0d03d24 <signTx_handleAppendDataAPDU+0xbc>
c0d03caa:	2801      	cmp	r0, #1
c0d03cac:	d000      	beq.n	c0d03cb0 <signTx_handleAppendDataAPDU+0x48>
c0d03cae:	e0eb      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03cb0:	20e0      	movs	r0, #224	; 0xe0
c0d03cb2:	4d7a      	ldr	r5, [pc, #488]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03cb4:	5828      	ldr	r0, [r5, r0]
c0d03cb6:	497a      	ldr	r1, [pc, #488]	; (c0d03ea0 <signTx_handleAppendDataAPDU+0x238>)
c0d03cb8:	1a41      	subs	r1, r0, r1
c0d03cba:	4248      	negs	r0, r1
c0d03cbc:	4148      	adcs	r0, r1
c0d03cbe:	497c      	ldr	r1, [pc, #496]	; (c0d03eb0 <signTx_handleAppendDataAPDU+0x248>)
c0d03cc0:	4479      	add	r1, pc
c0d03cc2:	1c4f      	adds	r7, r1, #1
c0d03cc4:	4639      	mov	r1, r7
c0d03cc6:	f7fc facb 	bl	c0d00260 <assert>
c0d03cca:	462c      	mov	r4, r5
c0d03ccc:	34e0      	adds	r4, #224	; 0xe0
c0d03cce:	7920      	ldrb	r0, [r4, #4]
c0d03cd0:	2809      	cmp	r0, #9
c0d03cd2:	d33a      	bcc.n	c0d03d4a <signTx_handleAppendDataAPDU+0xe2>
c0d03cd4:	2000      	movs	r0, #0
c0d03cd6:	e039      	b.n	c0d03d4c <signTx_handleAppendDataAPDU+0xe4>
c0d03cd8:	20e0      	movs	r0, #224	; 0xe0
c0d03cda:	4d70      	ldr	r5, [pc, #448]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03cdc:	5828      	ldr	r0, [r5, r0]
c0d03cde:	4970      	ldr	r1, [pc, #448]	; (c0d03ea0 <signTx_handleAppendDataAPDU+0x238>)
c0d03ce0:	1a41      	subs	r1, r0, r1
c0d03ce2:	4248      	negs	r0, r1
c0d03ce4:	4148      	adcs	r0, r1
c0d03ce6:	4975      	ldr	r1, [pc, #468]	; (c0d03ebc <signTx_handleAppendDataAPDU+0x254>)
c0d03ce8:	4479      	add	r1, pc
c0d03cea:	1c49      	adds	r1, r1, #1
c0d03cec:	f7fc fab8 	bl	c0d00260 <assert>
c0d03cf0:	462c      	mov	r4, r5
c0d03cf2:	34e0      	adds	r4, #224	; 0xe0
c0d03cf4:	7920      	ldrb	r0, [r4, #4]
c0d03cf6:	2809      	cmp	r0, #9
c0d03cf8:	d332      	bcc.n	c0d03d60 <signTx_handleAppendDataAPDU+0xf8>
c0d03cfa:	2000      	movs	r0, #0
c0d03cfc:	e031      	b.n	c0d03d62 <signTx_handleAppendDataAPDU+0xfa>
c0d03cfe:	20e0      	movs	r0, #224	; 0xe0
c0d03d00:	4d66      	ldr	r5, [pc, #408]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03d02:	5828      	ldr	r0, [r5, r0]
c0d03d04:	4966      	ldr	r1, [pc, #408]	; (c0d03ea0 <signTx_handleAppendDataAPDU+0x238>)
c0d03d06:	1a41      	subs	r1, r0, r1
c0d03d08:	4248      	negs	r0, r1
c0d03d0a:	4148      	adcs	r0, r1
c0d03d0c:	4969      	ldr	r1, [pc, #420]	; (c0d03eb4 <signTx_handleAppendDataAPDU+0x24c>)
c0d03d0e:	4479      	add	r1, pc
c0d03d10:	1c4f      	adds	r7, r1, #1
c0d03d12:	4639      	mov	r1, r7
c0d03d14:	f7fc faa4 	bl	c0d00260 <assert>
c0d03d18:	24ed      	movs	r4, #237	; 0xed
c0d03d1a:	5d28      	ldrb	r0, [r5, r4]
c0d03d1c:	2809      	cmp	r0, #9
c0d03d1e:	d335      	bcc.n	c0d03d8c <signTx_handleAppendDataAPDU+0x124>
c0d03d20:	2000      	movs	r0, #0
c0d03d22:	e034      	b.n	c0d03d8e <signTx_handleAppendDataAPDU+0x126>
c0d03d24:	20e0      	movs	r0, #224	; 0xe0
c0d03d26:	4d5d      	ldr	r5, [pc, #372]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03d28:	5828      	ldr	r0, [r5, r0]
c0d03d2a:	495d      	ldr	r1, [pc, #372]	; (c0d03ea0 <signTx_handleAppendDataAPDU+0x238>)
c0d03d2c:	1a41      	subs	r1, r0, r1
c0d03d2e:	4248      	negs	r0, r1
c0d03d30:	4148      	adcs	r0, r1
c0d03d32:	4961      	ldr	r1, [pc, #388]	; (c0d03eb8 <signTx_handleAppendDataAPDU+0x250>)
c0d03d34:	4479      	add	r1, pc
c0d03d36:	1c4f      	adds	r7, r1, #1
c0d03d38:	4639      	mov	r1, r7
c0d03d3a:	f7fc fa91 	bl	c0d00260 <assert>
c0d03d3e:	24f6      	movs	r4, #246	; 0xf6
c0d03d40:	5d28      	ldrb	r0, [r5, r4]
c0d03d42:	2841      	cmp	r0, #65	; 0x41
c0d03d44:	d32c      	bcc.n	c0d03da0 <signTx_handleAppendDataAPDU+0x138>
c0d03d46:	2000      	movs	r0, #0
c0d03d48:	e02b      	b.n	c0d03da2 <signTx_handleAppendDataAPDU+0x13a>
c0d03d4a:	2001      	movs	r0, #1
c0d03d4c:	4639      	mov	r1, r7
c0d03d4e:	f7fc fa87 	bl	c0d00260 <assert>
c0d03d52:	7920      	ldrb	r0, [r4, #4]
c0d03d54:	9f05      	ldr	r7, [sp, #20]
c0d03d56:	42b8      	cmp	r0, r7
c0d03d58:	d000      	beq.n	c0d03d5c <signTx_handleAppendDataAPDU+0xf4>
c0d03d5a:	e095      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03d5c:	35e5      	adds	r5, #229	; 0xe5
c0d03d5e:	e028      	b.n	c0d03db2 <signTx_handleAppendDataAPDU+0x14a>
c0d03d60:	2001      	movs	r0, #1
c0d03d62:	4957      	ldr	r1, [pc, #348]	; (c0d03ec0 <signTx_handleAppendDataAPDU+0x258>)
c0d03d64:	4479      	add	r1, pc
c0d03d66:	1c49      	adds	r1, r1, #1
c0d03d68:	f7fc fa7a 	bl	c0d00260 <assert>
c0d03d6c:	7921      	ldrb	r1, [r4, #4]
c0d03d6e:	35e5      	adds	r5, #229	; 0xe5
c0d03d70:	aa07      	add	r2, sp, #28
c0d03d72:	230e      	movs	r3, #14
c0d03d74:	4628      	mov	r0, r5
c0d03d76:	f7fe f967 	bl	c0d02048 <uint8array_name_to_string>
c0d03d7a:	2f0e      	cmp	r7, #14
c0d03d7c:	d300      	bcc.n	c0d03d80 <signTx_handleAppendDataAPDU+0x118>
c0d03d7e:	e083      	b.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03d80:	a807      	add	r0, sp, #28
c0d03d82:	5dc0      	ldrb	r0, [r0, r7]
c0d03d84:	2800      	cmp	r0, #0
c0d03d86:	d17f      	bne.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03d88:	a807      	add	r0, sp, #28
c0d03d8a:	e013      	b.n	c0d03db4 <signTx_handleAppendDataAPDU+0x14c>
c0d03d8c:	2001      	movs	r0, #1
c0d03d8e:	4639      	mov	r1, r7
c0d03d90:	f7fc fa66 	bl	c0d00260 <assert>
c0d03d94:	5d28      	ldrb	r0, [r5, r4]
c0d03d96:	9f05      	ldr	r7, [sp, #20]
c0d03d98:	42b8      	cmp	r0, r7
c0d03d9a:	d175      	bne.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03d9c:	35ee      	adds	r5, #238	; 0xee
c0d03d9e:	e008      	b.n	c0d03db2 <signTx_handleAppendDataAPDU+0x14a>
c0d03da0:	2001      	movs	r0, #1
c0d03da2:	4639      	mov	r1, r7
c0d03da4:	f7fc fa5c 	bl	c0d00260 <assert>
c0d03da8:	5d28      	ldrb	r0, [r5, r4]
c0d03daa:	9f05      	ldr	r7, [sp, #20]
c0d03dac:	42b8      	cmp	r0, r7
c0d03dae:	d16b      	bne.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03db0:	35f7      	adds	r5, #247	; 0xf7
c0d03db2:	4628      	mov	r0, r5
c0d03db4:	9906      	ldr	r1, [sp, #24]
c0d03db6:	463a      	mov	r2, r7
c0d03db8:	f003 fc64 	bl	c0d07684 <memcmp>
c0d03dbc:	2800      	cmp	r0, #0
c0d03dbe:	d163      	bne.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03dc0:	7cf1      	ldrb	r1, [r6, #19]
c0d03dc2:	4637      	mov	r7, r6
c0d03dc4:	3714      	adds	r7, #20
c0d03dc6:	4638      	mov	r0, r7
c0d03dc8:	f001 fcee 	bl	c0d057a8 <str_validateTextBuffer>
c0d03dcc:	4635      	mov	r5, r6
c0d03dce:	7cf0      	ldrb	r0, [r6, #19]
c0d03dd0:	2101      	movs	r1, #1
c0d03dd2:	2400      	movs	r4, #0
c0d03dd4:	2814      	cmp	r0, #20
c0d03dd6:	9104      	str	r1, [sp, #16]
c0d03dd8:	4608      	mov	r0, r1
c0d03dda:	d300      	bcc.n	c0d03dde <signTx_handleAppendDataAPDU+0x176>
c0d03ddc:	4620      	mov	r0, r4
c0d03dde:	4939      	ldr	r1, [pc, #228]	; (c0d03ec4 <signTx_handleAppendDataAPDU+0x25c>)
c0d03de0:	4479      	add	r1, pc
c0d03de2:	1c49      	adds	r1, r1, #1
c0d03de4:	f7fc fa3c 	bl	c0d00260 <assert>
c0d03de8:	482e      	ldr	r0, [pc, #184]	; (c0d03ea4 <signTx_handleAppendDataAPDU+0x23c>)
c0d03dea:	492c      	ldr	r1, [pc, #176]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03dec:	180e      	adds	r6, r1, r0
c0d03dee:	7cea      	ldrb	r2, [r5, #19]
c0d03df0:	4630      	mov	r0, r6
c0d03df2:	4639      	mov	r1, r7
c0d03df4:	f003 fc32 	bl	c0d0765c <__aeabi_memcpy>
c0d03df8:	7ce8      	ldrb	r0, [r5, #19]
c0d03dfa:	5434      	strb	r4, [r6, r0]
c0d03dfc:	482a      	ldr	r0, [pc, #168]	; (c0d03ea8 <signTx_handleAppendDataAPDU+0x240>)
c0d03dfe:	4f27      	ldr	r7, [pc, #156]	; (c0d03e9c <signTx_handleAppendDataAPDU+0x234>)
c0d03e00:	183b      	adds	r3, r7, r0
c0d03e02:	7828      	ldrb	r0, [r5, #0]
c0d03e04:	7869      	ldrb	r1, [r5, #1]
c0d03e06:	9e05      	ldr	r6, [sp, #20]
c0d03e08:	b2f2      	uxtb	r2, r6
c0d03e0a:	9c06      	ldr	r4, [sp, #24]
c0d03e0c:	9400      	str	r4, [sp, #0]
c0d03e0e:	9201      	str	r2, [sp, #4]
c0d03e10:	9303      	str	r3, [sp, #12]
c0d03e12:	9302      	str	r3, [sp, #8]
c0d03e14:	1caa      	adds	r2, r5, #2
c0d03e16:	462b      	mov	r3, r5
c0d03e18:	330a      	adds	r3, #10
c0d03e1a:	f001 f8a5 	bl	c0d04f68 <parseValueToDisplay>
c0d03e1e:	482a      	ldr	r0, [pc, #168]	; (c0d03ec8 <signTx_handleAppendDataAPDU+0x260>)
c0d03e20:	4478      	add	r0, pc
c0d03e22:	1c41      	adds	r1, r0, #1
c0d03e24:	9804      	ldr	r0, [sp, #16]
c0d03e26:	f7fc fa1b 	bl	c0d00260 <assert>
c0d03e2a:	20ff      	movs	r0, #255	; 0xff
c0d03e2c:	303a      	adds	r0, #58	; 0x3a
c0d03e2e:	1838      	adds	r0, r7, r0
c0d03e30:	4621      	mov	r1, r4
c0d03e32:	4632      	mov	r2, r6
c0d03e34:	f003 fc12 	bl	c0d0765c <__aeabi_memcpy>
c0d03e38:	2027      	movs	r0, #39	; 0x27
c0d03e3a:	00c0      	lsls	r0, r0, #3
c0d03e3c:	543e      	strb	r6, [r7, r0]
c0d03e3e:	7cac      	ldrb	r4, [r5, #18]
c0d03e40:	4638      	mov	r0, r7
c0d03e42:	30c4      	adds	r0, #196	; 0xc4
c0d03e44:	4631      	mov	r1, r6
c0d03e46:	f000 fe59 	bl	c0d04afc <countedSectionProcess>
c0d03e4a:	2800      	cmp	r0, #0
c0d03e4c:	d01c      	beq.n	c0d03e88 <signTx_handleAppendDataAPDU+0x220>
c0d03e4e:	200f      	movs	r0, #15
c0d03e50:	4004      	ands	r4, r0
c0d03e52:	f000 fcab 	bl	c0d047ac <processShaAndPosibleDHAndPrepareResponse>
c0d03e56:	2c02      	cmp	r4, #2
c0d03e58:	d00e      	beq.n	c0d03e78 <signTx_handleAppendDataAPDU+0x210>
c0d03e5a:	2c06      	cmp	r4, #6
c0d03e5c:	d004      	beq.n	c0d03e68 <signTx_handleAppendDataAPDU+0x200>
c0d03e5e:	2c05      	cmp	r4, #5
c0d03e60:	d008      	beq.n	c0d03e74 <signTx_handleAppendDataAPDU+0x20c>
c0d03e62:	4812      	ldr	r0, [pc, #72]	; (c0d03eac <signTx_handleAppendDataAPDU+0x244>)
c0d03e64:	f7fe fef7 	bl	c0d02c56 <os_longjmp>
c0d03e68:	21dc      	movs	r1, #220	; 0xdc
c0d03e6a:	9803      	ldr	r0, [sp, #12]
c0d03e6c:	f003 fd72 	bl	c0d07954 <strnlen>
c0d03e70:	2800      	cmp	r0, #0
c0d03e72:	d001      	beq.n	c0d03e78 <signTx_handleAppendDataAPDU+0x210>
c0d03e74:	2064      	movs	r0, #100	; 0x64
c0d03e76:	e000      	b.n	c0d03e7a <signTx_handleAppendDataAPDU+0x212>
c0d03e78:	2065      	movs	r0, #101	; 0x65
c0d03e7a:	21e7      	movs	r1, #231	; 0xe7
c0d03e7c:	0089      	lsls	r1, r1, #2
c0d03e7e:	5078      	str	r0, [r7, r1]
c0d03e80:	f000 fc60 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03e84:	b00b      	add	sp, #44	; 0x2c
c0d03e86:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d03e88:	4803      	ldr	r0, [pc, #12]	; (c0d03e98 <signTx_handleAppendDataAPDU+0x230>)
c0d03e8a:	f7fe fee4 	bl	c0d02c56 <os_longjmp>
c0d03e8e:	4802      	ldr	r0, [pc, #8]	; (c0d03e98 <signTx_handleAppendDataAPDU+0x230>)
c0d03e90:	1e80      	subs	r0, r0, #2
c0d03e92:	f7fe fee0 	bl	c0d02c56 <os_longjmp>
c0d03e96:	46c0      	nop			; (mov r8, r8)
c0d03e98:	00006e07 	.word	0x00006e07
c0d03e9c:	20000518 	.word	0x20000518
c0d03ea0:	00003039 	.word	0x00003039
c0d03ea4:	000003a1 	.word	0x000003a1
c0d03ea8:	000003b5 	.word	0x000003b5
c0d03eac:	00004701 	.word	0x00004701
c0d03eb0:	000047ea 	.word	0x000047ea
c0d03eb4:	000047b6 	.word	0x000047b6
c0d03eb8:	000047aa 	.word	0x000047aa
c0d03ebc:	00004810 	.word	0x00004810
c0d03ec0:	000047ae 	.word	0x000047ae
c0d03ec4:	0000474c 	.word	0x0000474c
c0d03ec8:	00004726 	.word	0x00004726

c0d03ecc <signTx_handleStartCountedSectionAPDU>:
c0d03ecc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d03ece:	b087      	sub	sp, #28
c0d03ed0:	2800      	cmp	r0, #0
c0d03ed2:	d143      	bne.n	c0d03f5c <signTx_handleStartCountedSectionAPDU+0x90>
c0d03ed4:	2a12      	cmp	r2, #18
c0d03ed6:	d13e      	bne.n	c0d03f56 <signTx_handleStartCountedSectionAPDU+0x8a>
c0d03ed8:	9c0c      	ldr	r4, [sp, #48]	; 0x30
c0d03eda:	2cdd      	cmp	r4, #221	; 0xdd
c0d03edc:	d23b      	bcs.n	c0d03f56 <signTx_handleStartCountedSectionAPDU+0x8a>
c0d03ede:	461d      	mov	r5, r3
c0d03ee0:	460b      	mov	r3, r1
c0d03ee2:	2700      	movs	r7, #0
c0d03ee4:	9705      	str	r7, [sp, #20]
c0d03ee6:	9704      	str	r7, [sp, #16]
c0d03ee8:	7849      	ldrb	r1, [r1, #1]
c0d03eea:	7818      	ldrb	r0, [r3, #0]
c0d03eec:	aa04      	add	r2, sp, #16
c0d03eee:	b2e6      	uxtb	r6, r4
c0d03ef0:	9500      	str	r5, [sp, #0]
c0d03ef2:	9601      	str	r6, [sp, #4]
c0d03ef4:	9202      	str	r2, [sp, #8]
c0d03ef6:	1c9a      	adds	r2, r3, #2
c0d03ef8:	330a      	adds	r3, #10
c0d03efa:	f000 ff81 	bl	c0d04e00 <parseValueToUInt64>
c0d03efe:	9805      	ldr	r0, [sp, #20]
c0d03f00:	2800      	cmp	r0, #0
c0d03f02:	d128      	bne.n	c0d03f56 <signTx_handleStartCountedSectionAPDU+0x8a>
c0d03f04:	9804      	ldr	r0, [sp, #16]
c0d03f06:	9003      	str	r0, [sp, #12]
c0d03f08:	20ff      	movs	r0, #255	; 0xff
c0d03f0a:	303a      	adds	r0, #58	; 0x3a
c0d03f0c:	4e16      	ldr	r6, [pc, #88]	; (c0d03f68 <signTx_handleStartCountedSectionAPDU+0x9c>)
c0d03f0e:	1830      	adds	r0, r6, r0
c0d03f10:	4629      	mov	r1, r5
c0d03f12:	4622      	mov	r2, r4
c0d03f14:	f003 fba2 	bl	c0d0765c <__aeabi_memcpy>
c0d03f18:	2027      	movs	r0, #39	; 0x27
c0d03f1a:	00c0      	lsls	r0, r0, #3
c0d03f1c:	5434      	strb	r4, [r6, r0]
c0d03f1e:	4813      	ldr	r0, [pc, #76]	; (c0d03f6c <signTx_handleStartCountedSectionAPDU+0xa0>)
c0d03f20:	5437      	strb	r7, [r6, r0]
c0d03f22:	4813      	ldr	r0, [pc, #76]	; (c0d03f70 <signTx_handleStartCountedSectionAPDU+0xa4>)
c0d03f24:	5437      	strb	r7, [r6, r0]
c0d03f26:	4635      	mov	r5, r6
c0d03f28:	35c4      	adds	r5, #196	; 0xc4
c0d03f2a:	4628      	mov	r0, r5
c0d03f2c:	4621      	mov	r1, r4
c0d03f2e:	f000 fde5 	bl	c0d04afc <countedSectionProcess>
c0d03f32:	2800      	cmp	r0, #0
c0d03f34:	d00f      	beq.n	c0d03f56 <signTx_handleStartCountedSectionAPDU+0x8a>
c0d03f36:	4628      	mov	r0, r5
c0d03f38:	9903      	ldr	r1, [sp, #12]
c0d03f3a:	f000 fdbf 	bl	c0d04abc <countedSectionBegin>
c0d03f3e:	2800      	cmp	r0, #0
c0d03f40:	d009      	beq.n	c0d03f56 <signTx_handleStartCountedSectionAPDU+0x8a>
c0d03f42:	f000 fc33 	bl	c0d047ac <processShaAndPosibleDHAndPrepareResponse>
c0d03f46:	20e7      	movs	r0, #231	; 0xe7
c0d03f48:	0080      	lsls	r0, r0, #2
c0d03f4a:	2165      	movs	r1, #101	; 0x65
c0d03f4c:	5031      	str	r1, [r6, r0]
c0d03f4e:	f000 fbf9 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03f52:	b007      	add	sp, #28
c0d03f54:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d03f56:	4803      	ldr	r0, [pc, #12]	; (c0d03f64 <signTx_handleStartCountedSectionAPDU+0x98>)
c0d03f58:	f7fe fe7d 	bl	c0d02c56 <os_longjmp>
c0d03f5c:	4801      	ldr	r0, [pc, #4]	; (c0d03f64 <signTx_handleStartCountedSectionAPDU+0x98>)
c0d03f5e:	1e80      	subs	r0, r0, #2
c0d03f60:	f7fe fe79 	bl	c0d02c56 <os_longjmp>
c0d03f64:	00006e07 	.word	0x00006e07
c0d03f68:	20000518 	.word	0x20000518
c0d03f6c:	000003b5 	.word	0x000003b5
c0d03f70:	000003a1 	.word	0x000003a1

c0d03f74 <signTx_handleEndCountedSectionAPDU>:
c0d03f74:	b5b0      	push	{r4, r5, r7, lr}
c0d03f76:	2800      	cmp	r0, #0
c0d03f78:	d128      	bne.n	c0d03fcc <signTx_handleEndCountedSectionAPDU+0x58>
c0d03f7a:	2a00      	cmp	r2, #0
c0d03f7c:	d122      	bne.n	c0d03fc4 <signTx_handleEndCountedSectionAPDU+0x50>
c0d03f7e:	9804      	ldr	r0, [sp, #16]
c0d03f80:	2800      	cmp	r0, #0
c0d03f82:	d11f      	bne.n	c0d03fc4 <signTx_handleEndCountedSectionAPDU+0x50>
c0d03f84:	4816      	ldr	r0, [pc, #88]	; (c0d03fe0 <signTx_handleEndCountedSectionAPDU+0x6c>)
c0d03f86:	4c17      	ldr	r4, [pc, #92]	; (c0d03fe4 <signTx_handleEndCountedSectionAPDU+0x70>)
c0d03f88:	2500      	movs	r5, #0
c0d03f8a:	5425      	strb	r5, [r4, r0]
c0d03f8c:	4816      	ldr	r0, [pc, #88]	; (c0d03fe8 <signTx_handleEndCountedSectionAPDU+0x74>)
c0d03f8e:	5425      	strb	r5, [r4, r0]
c0d03f90:	4816      	ldr	r0, [pc, #88]	; (c0d03fec <signTx_handleEndCountedSectionAPDU+0x78>)
c0d03f92:	5c20      	ldrb	r0, [r4, r0]
c0d03f94:	2800      	cmp	r0, #0
c0d03f96:	d005      	beq.n	c0d03fa4 <signTx_handleEndCountedSectionAPDU+0x30>
c0d03f98:	20dc      	movs	r0, #220	; 0xdc
c0d03f9a:	5c20      	ldrb	r0, [r4, r0]
c0d03f9c:	4914      	ldr	r1, [pc, #80]	; (c0d03ff0 <signTx_handleEndCountedSectionAPDU+0x7c>)
c0d03f9e:	5c61      	ldrb	r1, [r4, r1]
c0d03fa0:	4281      	cmp	r1, r0
c0d03fa2:	d216      	bcs.n	c0d03fd2 <signTx_handleEndCountedSectionAPDU+0x5e>
c0d03fa4:	4620      	mov	r0, r4
c0d03fa6:	30c4      	adds	r0, #196	; 0xc4
c0d03fa8:	f000 fdd8 	bl	c0d04b5c <countedSectionEnd>
c0d03fac:	2800      	cmp	r0, #0
c0d03fae:	d009      	beq.n	c0d03fc4 <signTx_handleEndCountedSectionAPDU+0x50>
c0d03fb0:	20e7      	movs	r0, #231	; 0xe7
c0d03fb2:	0080      	lsls	r0, r0, #2
c0d03fb4:	2165      	movs	r1, #101	; 0x65
c0d03fb6:	5021      	str	r1, [r4, r0]
c0d03fb8:	201d      	movs	r0, #29
c0d03fba:	0140      	lsls	r0, r0, #5
c0d03fbc:	5425      	strb	r5, [r4, r0]
c0d03fbe:	f000 fbc1 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d03fc2:	bdb0      	pop	{r4, r5, r7, pc}
c0d03fc4:	4805      	ldr	r0, [pc, #20]	; (c0d03fdc <signTx_handleEndCountedSectionAPDU+0x68>)
c0d03fc6:	1c80      	adds	r0, r0, #2
c0d03fc8:	f7fe fe45 	bl	c0d02c56 <os_longjmp>
c0d03fcc:	4803      	ldr	r0, [pc, #12]	; (c0d03fdc <signTx_handleEndCountedSectionAPDU+0x68>)
c0d03fce:	f7fe fe42 	bl	c0d02c56 <os_longjmp>
c0d03fd2:	4802      	ldr	r0, [pc, #8]	; (c0d03fdc <signTx_handleEndCountedSectionAPDU+0x68>)
c0d03fd4:	1c40      	adds	r0, r0, #1
c0d03fd6:	f7fe fe3e 	bl	c0d02c56 <os_longjmp>
c0d03fda:	46c0      	nop			; (mov r8, r8)
c0d03fdc:	00006e05 	.word	0x00006e05
c0d03fe0:	000003b5 	.word	0x000003b5
c0d03fe4:	20000518 	.word	0x20000518
c0d03fe8:	000003a1 	.word	0x000003a1
c0d03fec:	00000215 	.word	0x00000215
c0d03ff0:	00000216 	.word	0x00000216

c0d03ff4 <signTx_handleStoreValueAPDU>:
c0d03ff4:	b570      	push	{r4, r5, r6, lr}
c0d03ff6:	1e41      	subs	r1, r0, #1
c0d03ff8:	2903      	cmp	r1, #3
c0d03ffa:	d254      	bcs.n	c0d040a6 <signTx_handleStoreValueAPDU+0xb2>
c0d03ffc:	2a00      	cmp	r2, #0
c0d03ffe:	d14f      	bne.n	c0d040a0 <signTx_handleStoreValueAPDU+0xac>
c0d04000:	461c      	mov	r4, r3
c0d04002:	9d04      	ldr	r5, [sp, #16]
c0d04004:	2803      	cmp	r0, #3
c0d04006:	d015      	beq.n	c0d04034 <signTx_handleStoreValueAPDU+0x40>
c0d04008:	2802      	cmp	r0, #2
c0d0400a:	d025      	beq.n	c0d04058 <signTx_handleStoreValueAPDU+0x64>
c0d0400c:	2801      	cmp	r0, #1
c0d0400e:	d14e      	bne.n	c0d040ae <signTx_handleStoreValueAPDU+0xba>
c0d04010:	20e0      	movs	r0, #224	; 0xe0
c0d04012:	4e29      	ldr	r6, [pc, #164]	; (c0d040b8 <signTx_handleStoreValueAPDU+0xc4>)
c0d04014:	5830      	ldr	r0, [r6, r0]
c0d04016:	4929      	ldr	r1, [pc, #164]	; (c0d040bc <signTx_handleStoreValueAPDU+0xc8>)
c0d04018:	1a41      	subs	r1, r0, r1
c0d0401a:	4248      	negs	r0, r1
c0d0401c:	4148      	adcs	r0, r1
c0d0401e:	492a      	ldr	r1, [pc, #168]	; (c0d040c8 <signTx_handleStoreValueAPDU+0xd4>)
c0d04020:	4479      	add	r1, pc
c0d04022:	1c49      	adds	r1, r1, #1
c0d04024:	f7fc f91c 	bl	c0d00260 <assert>
c0d04028:	2d09      	cmp	r5, #9
c0d0402a:	d239      	bcs.n	c0d040a0 <signTx_handleStoreValueAPDU+0xac>
c0d0402c:	20e4      	movs	r0, #228	; 0xe4
c0d0402e:	5435      	strb	r5, [r6, r0]
c0d04030:	36e5      	adds	r6, #229	; 0xe5
c0d04032:	e022      	b.n	c0d0407a <signTx_handleStoreValueAPDU+0x86>
c0d04034:	20e0      	movs	r0, #224	; 0xe0
c0d04036:	4e20      	ldr	r6, [pc, #128]	; (c0d040b8 <signTx_handleStoreValueAPDU+0xc4>)
c0d04038:	5830      	ldr	r0, [r6, r0]
c0d0403a:	4920      	ldr	r1, [pc, #128]	; (c0d040bc <signTx_handleStoreValueAPDU+0xc8>)
c0d0403c:	1a41      	subs	r1, r0, r1
c0d0403e:	4248      	negs	r0, r1
c0d04040:	4148      	adcs	r0, r1
c0d04042:	4923      	ldr	r1, [pc, #140]	; (c0d040d0 <signTx_handleStoreValueAPDU+0xdc>)
c0d04044:	4479      	add	r1, pc
c0d04046:	1c49      	adds	r1, r1, #1
c0d04048:	f7fc f90a 	bl	c0d00260 <assert>
c0d0404c:	2d41      	cmp	r5, #65	; 0x41
c0d0404e:	d227      	bcs.n	c0d040a0 <signTx_handleStoreValueAPDU+0xac>
c0d04050:	20f6      	movs	r0, #246	; 0xf6
c0d04052:	5435      	strb	r5, [r6, r0]
c0d04054:	36f7      	adds	r6, #247	; 0xf7
c0d04056:	e010      	b.n	c0d0407a <signTx_handleStoreValueAPDU+0x86>
c0d04058:	20e0      	movs	r0, #224	; 0xe0
c0d0405a:	4e17      	ldr	r6, [pc, #92]	; (c0d040b8 <signTx_handleStoreValueAPDU+0xc4>)
c0d0405c:	5830      	ldr	r0, [r6, r0]
c0d0405e:	4917      	ldr	r1, [pc, #92]	; (c0d040bc <signTx_handleStoreValueAPDU+0xc8>)
c0d04060:	1a41      	subs	r1, r0, r1
c0d04062:	4248      	negs	r0, r1
c0d04064:	4148      	adcs	r0, r1
c0d04066:	4919      	ldr	r1, [pc, #100]	; (c0d040cc <signTx_handleStoreValueAPDU+0xd8>)
c0d04068:	4479      	add	r1, pc
c0d0406a:	1c49      	adds	r1, r1, #1
c0d0406c:	f7fc f8f8 	bl	c0d00260 <assert>
c0d04070:	2d09      	cmp	r5, #9
c0d04072:	d215      	bcs.n	c0d040a0 <signTx_handleStoreValueAPDU+0xac>
c0d04074:	20ed      	movs	r0, #237	; 0xed
c0d04076:	5435      	strb	r5, [r6, r0]
c0d04078:	36ee      	adds	r6, #238	; 0xee
c0d0407a:	4630      	mov	r0, r6
c0d0407c:	4621      	mov	r1, r4
c0d0407e:	462a      	mov	r2, r5
c0d04080:	f003 faec 	bl	c0d0765c <__aeabi_memcpy>
c0d04084:	480e      	ldr	r0, [pc, #56]	; (c0d040c0 <signTx_handleStoreValueAPDU+0xcc>)
c0d04086:	490c      	ldr	r1, [pc, #48]	; (c0d040b8 <signTx_handleStoreValueAPDU+0xc4>)
c0d04088:	2200      	movs	r2, #0
c0d0408a:	540a      	strb	r2, [r1, r0]
c0d0408c:	201d      	movs	r0, #29
c0d0408e:	0140      	lsls	r0, r0, #5
c0d04090:	520a      	strh	r2, [r1, r0]
c0d04092:	20e7      	movs	r0, #231	; 0xe7
c0d04094:	0080      	lsls	r0, r0, #2
c0d04096:	2265      	movs	r2, #101	; 0x65
c0d04098:	500a      	str	r2, [r1, r0]
c0d0409a:	f000 fb53 	bl	c0d04744 <signTx_ui_runStep_simple>
c0d0409e:	bd70      	pop	{r4, r5, r6, pc}
c0d040a0:	4804      	ldr	r0, [pc, #16]	; (c0d040b4 <signTx_handleStoreValueAPDU+0xc0>)
c0d040a2:	f7fe fdd8 	bl	c0d02c56 <os_longjmp>
c0d040a6:	4803      	ldr	r0, [pc, #12]	; (c0d040b4 <signTx_handleStoreValueAPDU+0xc0>)
c0d040a8:	1e80      	subs	r0, r0, #2
c0d040aa:	f7fe fdd4 	bl	c0d02c56 <os_longjmp>
c0d040ae:	4805      	ldr	r0, [pc, #20]	; (c0d040c4 <signTx_handleStoreValueAPDU+0xd0>)
c0d040b0:	f7fe fdd1 	bl	c0d02c56 <os_longjmp>
c0d040b4:	00006e07 	.word	0x00006e07
c0d040b8:	20000518 	.word	0x20000518
c0d040bc:	00003039 	.word	0x00003039
c0d040c0:	000003b5 	.word	0x000003b5
c0d040c4:	00004701 	.word	0x00004701
c0d040c8:	00004540 	.word	0x00004540
c0d040cc:	00004512 	.word	0x00004512
c0d040d0:	00004550 	.word	0x00004550

c0d040d4 <signTx_handleStartDHEncodingAPDU>:
c0d040d4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d040d6:	b0a7      	sub	sp, #156	; 0x9c
c0d040d8:	2800      	cmp	r0, #0
c0d040da:	d000      	beq.n	c0d040de <signTx_handleStartDHEncodingAPDU+0xa>
c0d040dc:	e0a3      	b.n	c0d04226 <signTx_handleStartDHEncodingAPDU+0x152>
c0d040de:	2a00      	cmp	r2, #0
c0d040e0:	d000      	beq.n	c0d040e4 <signTx_handleStartDHEncodingAPDU+0x10>
c0d040e2:	e09c      	b.n	c0d0421e <signTx_handleStartDHEncodingAPDU+0x14a>
c0d040e4:	982c      	ldr	r0, [sp, #176]	; 0xb0
c0d040e6:	2841      	cmp	r0, #65	; 0x41
c0d040e8:	d000      	beq.n	c0d040ec <signTx_handleStartDHEncodingAPDU+0x18>
c0d040ea:	e098      	b.n	c0d0421e <signTx_handleStartDHEncodingAPDU+0x14a>
c0d040ec:	2043      	movs	r0, #67	; 0x43
c0d040ee:	00c0      	lsls	r0, r0, #3
c0d040f0:	4d51      	ldr	r5, [pc, #324]	; (c0d04238 <signTx_handleStartDHEncodingAPDU+0x164>)
c0d040f2:	182c      	adds	r4, r5, r0
c0d040f4:	2021      	movs	r0, #33	; 0x21
c0d040f6:	2241      	movs	r2, #65	; 0x41
c0d040f8:	4619      	mov	r1, r3
c0d040fa:	9404      	str	r4, [sp, #16]
c0d040fc:	4623      	mov	r3, r4
c0d040fe:	f7fc f9fb 	bl	c0d004f8 <cx_ecfp_init_public_key_no_throw>
c0d04102:	2800      	cmp	r0, #0
c0d04104:	d000      	beq.n	c0d04108 <signTx_handleStartDHEncodingAPDU+0x34>
c0d04106:	e08a      	b.n	c0d0421e <signTx_handleStartDHEncodingAPDU+0x14a>
c0d04108:	484c      	ldr	r0, [pc, #304]	; (c0d0423c <signTx_handleStartDHEncodingAPDU+0x168>)
c0d0410a:	1828      	adds	r0, r5, r0
c0d0410c:	4951      	ldr	r1, [pc, #324]	; (c0d04254 <signTx_handleStartDHEncodingAPDU+0x180>)
c0d0410e:	4479      	add	r1, pc
c0d04110:	2411      	movs	r4, #17
c0d04112:	4622      	mov	r2, r4
c0d04114:	f003 faa2 	bl	c0d0765c <__aeabi_memcpy>
c0d04118:	4849      	ldr	r0, [pc, #292]	; (c0d04240 <signTx_handleStartDHEncodingAPDU+0x16c>)
c0d0411a:	182f      	adds	r7, r5, r0
c0d0411c:	0160      	lsls	r0, r4, #5
c0d0411e:	1828      	adds	r0, r5, r0
c0d04120:	2141      	movs	r1, #65	; 0x41
c0d04122:	23dc      	movs	r3, #220	; 0xdc
c0d04124:	9103      	str	r1, [sp, #12]
c0d04126:	463a      	mov	r2, r7
c0d04128:	9302      	str	r3, [sp, #8]
c0d0412a:	f7fd fed7 	bl	c0d01edc <public_key_to_wif>
c0d0412e:	4604      	mov	r4, r0
c0d04130:	2600      	movs	r6, #0
c0d04132:	28dc      	cmp	r0, #220	; 0xdc
c0d04134:	d301      	bcc.n	c0d0413a <signTx_handleStartDHEncodingAPDU+0x66>
c0d04136:	4630      	mov	r0, r6
c0d04138:	e000      	b.n	c0d0413c <signTx_handleStartDHEncodingAPDU+0x68>
c0d0413a:	2001      	movs	r0, #1
c0d0413c:	4946      	ldr	r1, [pc, #280]	; (c0d04258 <signTx_handleStartDHEncodingAPDU+0x184>)
c0d0413e:	4479      	add	r1, pc
c0d04140:	1c49      	adds	r1, r1, #1
c0d04142:	f7fc f88d 	bl	c0d00260 <assert>
c0d04146:	553e      	strb	r6, [r7, r4]
c0d04148:	4e3e      	ldr	r6, [pc, #248]	; (c0d04244 <signTx_handleStartDHEncodingAPDU+0x170>)
c0d0414a:	5da8      	ldrb	r0, [r5, r6]
c0d0414c:	2800      	cmp	r0, #0
c0d0414e:	d16d      	bne.n	c0d0422c <signTx_handleStartDHEncodingAPDU+0x158>
c0d04150:	ac09      	add	r4, sp, #36	; 0x24
c0d04152:	4620      	mov	r0, r4
c0d04154:	f003 fbb6 	bl	c0d078c4 <setjmp>
c0d04158:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d0415a:	0400      	lsls	r0, r0, #16
c0d0415c:	d131      	bne.n	c0d041c2 <signTx_handleStartDHEncodingAPDU+0xee>
c0d0415e:	a809      	add	r0, sp, #36	; 0x24
c0d04160:	f001 f9d6 	bl	c0d05510 <try_context_set>
c0d04164:	9013      	str	r0, [sp, #76]	; 0x4c
c0d04166:	1d29      	adds	r1, r5, #4
c0d04168:	ae15      	add	r6, sp, #84	; 0x54
c0d0416a:	4630      	mov	r0, r6
c0d0416c:	9a04      	ldr	r2, [sp, #16]
c0d0416e:	f7fd f855 	bl	c0d0121c <dh_init_aes_key>
c0d04172:	ac05      	add	r4, sp, #20
c0d04174:	2710      	movs	r7, #16
c0d04176:	4620      	mov	r0, r4
c0d04178:	4639      	mov	r1, r7
c0d0417a:	f7fc f9ed 	bl	c0d00558 <cx_rng_no_throw>
c0d0417e:	9802      	ldr	r0, [sp, #8]
c0d04180:	5c28      	ldrb	r0, [r5, r0]
c0d04182:	4931      	ldr	r1, [pc, #196]	; (c0d04248 <signTx_handleStartDHEncodingAPDU+0x174>)
c0d04184:	5468      	strb	r0, [r5, r1]
c0d04186:	9803      	ldr	r0, [sp, #12]
c0d04188:	0080      	lsls	r0, r0, #2
c0d0418a:	9001      	str	r0, [sp, #4]
c0d0418c:	482f      	ldr	r0, [pc, #188]	; (c0d0424c <signTx_handleStartDHEncodingAPDU+0x178>)
c0d0418e:	9000      	str	r0, [sp, #0]
c0d04190:	2099      	movs	r0, #153	; 0x99
c0d04192:	0080      	lsls	r0, r0, #2
c0d04194:	1828      	adds	r0, r5, r0
c0d04196:	4631      	mov	r1, r6
c0d04198:	4e2a      	ldr	r6, [pc, #168]	; (c0d04244 <signTx_handleStartDHEncodingAPDU+0x170>)
c0d0419a:	4622      	mov	r2, r4
c0d0419c:	463b      	mov	r3, r7
c0d0419e:	f7fd f91b 	bl	c0d013d8 <dh_encode_init>
c0d041a2:	211d      	movs	r1, #29
c0d041a4:	014c      	lsls	r4, r1, #5
c0d041a6:	5528      	strb	r0, [r5, r4]
c0d041a8:	b2c1      	uxtb	r1, r0
c0d041aa:	3914      	subs	r1, #20
c0d041ac:	4248      	negs	r0, r1
c0d041ae:	4148      	adcs	r0, r1
c0d041b0:	492a      	ldr	r1, [pc, #168]	; (c0d0425c <signTx_handleStartDHEncodingAPDU+0x188>)
c0d041b2:	4479      	add	r1, pc
c0d041b4:	1c49      	adds	r1, r1, #1
c0d041b6:	f7fc f853 	bl	c0d00260 <assert>
c0d041ba:	5d28      	ldrb	r0, [r5, r4]
c0d041bc:	2173      	movs	r1, #115	; 0x73
c0d041be:	00c9      	lsls	r1, r1, #3
c0d041c0:	5268      	strh	r0, [r5, r1]
c0d041c2:	f001 f99b 	bl	c0d054fc <try_context_get>
c0d041c6:	a909      	add	r1, sp, #36	; 0x24
c0d041c8:	4288      	cmp	r0, r1
c0d041ca:	d102      	bne.n	c0d041d2 <signTx_handleStartDHEncodingAPDU+0xfe>
c0d041cc:	9813      	ldr	r0, [sp, #76]	; 0x4c
c0d041ce:	f001 f99f 	bl	c0d05510 <try_context_set>
c0d041d2:	a815      	add	r0, sp, #84	; 0x54
c0d041d4:	2148      	movs	r1, #72	; 0x48
c0d041d6:	f003 fa51 	bl	c0d0767c <explicit_bzero>
c0d041da:	a809      	add	r0, sp, #36	; 0x24
c0d041dc:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d041de:	2800      	cmp	r0, #0
c0d041e0:	d126      	bne.n	c0d04230 <signTx_handleStartDHEncodingAPDU+0x15c>
c0d041e2:	8e28      	ldrh	r0, [r5, #48]	; 0x30
c0d041e4:	491a      	ldr	r1, [pc, #104]	; (c0d04250 <signTx_handleStartDHEncodingAPDU+0x17c>)
c0d041e6:	1841      	adds	r1, r0, r1
c0d041e8:	4248      	negs	r0, r1
c0d041ea:	4148      	adcs	r0, r1
c0d041ec:	211d      	movs	r1, #29
c0d041ee:	0149      	lsls	r1, r1, #5
c0d041f0:	5c6c      	ldrb	r4, [r5, r1]
c0d041f2:	491b      	ldr	r1, [pc, #108]	; (c0d04260 <signTx_handleStartDHEncodingAPDU+0x18c>)
c0d041f4:	4479      	add	r1, pc
c0d041f6:	f7fc f833 	bl	c0d00260 <assert>
c0d041fa:	2000      	movs	r0, #0
c0d041fc:	9000      	str	r0, [sp, #0]
c0d041fe:	4913      	ldr	r1, [pc, #76]	; (c0d0424c <signTx_handleStartDHEncodingAPDU+0x178>)
c0d04200:	4622      	mov	r2, r4
c0d04202:	4603      	mov	r3, r0
c0d04204:	f000 fa86 	bl	c0d04714 <cx_hash>
c0d04208:	2001      	movs	r0, #1
c0d0420a:	55a8      	strb	r0, [r5, r6]
c0d0420c:	20e7      	movs	r0, #231	; 0xe7
c0d0420e:	0080      	lsls	r0, r0, #2
c0d04210:	2119      	movs	r1, #25
c0d04212:	0149      	lsls	r1, r1, #5
c0d04214:	5029      	str	r1, [r5, r0]
c0d04216:	f000 fb51 	bl	c0d048bc <signTx_handleDHStart_ui_runStep>
c0d0421a:	b027      	add	sp, #156	; 0x9c
c0d0421c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0421e:	4805      	ldr	r0, [pc, #20]	; (c0d04234 <signTx_handleStartDHEncodingAPDU+0x160>)
c0d04220:	1c80      	adds	r0, r0, #2
c0d04222:	f7fe fd18 	bl	c0d02c56 <os_longjmp>
c0d04226:	4803      	ldr	r0, [pc, #12]	; (c0d04234 <signTx_handleStartDHEncodingAPDU+0x160>)
c0d04228:	f7fe fd15 	bl	c0d02c56 <os_longjmp>
c0d0422c:	4801      	ldr	r0, [pc, #4]	; (c0d04234 <signTx_handleStartDHEncodingAPDU+0x160>)
c0d0422e:	1c40      	adds	r0, r0, #1
c0d04230:	f7fe fd11 	bl	c0d02c56 <os_longjmp>
c0d04234:	00006e05 	.word	0x00006e05
c0d04238:	20000518 	.word	0x20000518
c0d0423c:	000003a1 	.word	0x000003a1
c0d04240:	000003b5 	.word	0x000003b5
c0d04244:	00000215 	.word	0x00000215
c0d04248:	00000216 	.word	0x00000216
c0d0424c:	20000398 	.word	0x20000398
c0d04250:	ffffcfc7 	.word	0xffffcfc7
c0d04254:	000045ca 	.word	0x000045ca
c0d04258:	00004470 	.word	0x00004470
c0d0425c:	00004416 	.word	0x00004416
c0d04260:	00004409 	.word	0x00004409

c0d04264 <signTx_handleEndDHEncodingAPDU>:
c0d04264:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d04266:	b09f      	sub	sp, #124	; 0x7c
c0d04268:	2800      	cmp	r0, #0
c0d0426a:	d000      	beq.n	c0d0426e <signTx_handleEndDHEncodingAPDU+0xa>
c0d0426c:	e087      	b.n	c0d0437e <signTx_handleEndDHEncodingAPDU+0x11a>
c0d0426e:	2a00      	cmp	r2, #0
c0d04270:	d000      	beq.n	c0d04274 <signTx_handleEndDHEncodingAPDU+0x10>
c0d04272:	e080      	b.n	c0d04376 <signTx_handleEndDHEncodingAPDU+0x112>
c0d04274:	9824      	ldr	r0, [sp, #144]	; 0x90
c0d04276:	2800      	cmp	r0, #0
c0d04278:	d17d      	bne.n	c0d04376 <signTx_handleEndDHEncodingAPDU+0x112>
c0d0427a:	4847      	ldr	r0, [pc, #284]	; (c0d04398 <signTx_handleEndDHEncodingAPDU+0x134>)
c0d0427c:	4e47      	ldr	r6, [pc, #284]	; (c0d0439c <signTx_handleEndDHEncodingAPDU+0x138>)
c0d0427e:	1830      	adds	r0, r6, r0
c0d04280:	494c      	ldr	r1, [pc, #304]	; (c0d043b4 <signTx_handleEndDHEncodingAPDU+0x150>)
c0d04282:	4479      	add	r1, pc
c0d04284:	220f      	movs	r2, #15
c0d04286:	f003 f9e9 	bl	c0d0765c <__aeabi_memcpy>
c0d0428a:	f000 fb51 	bl	c0d04930 <prepareOurPubkeyForDisplay>
c0d0428e:	4630      	mov	r0, r6
c0d04290:	30a0      	adds	r0, #160	; 0xa0
c0d04292:	f000 fd77 	bl	c0d04d84 <integrityCheckEvaluate>
c0d04296:	2800      	cmp	r0, #0
c0d04298:	d075      	beq.n	c0d04386 <signTx_handleEndDHEncodingAPDU+0x122>
c0d0429a:	4f41      	ldr	r7, [pc, #260]	; (c0d043a0 <signTx_handleEndDHEncodingAPDU+0x13c>)
c0d0429c:	5df0      	ldrb	r0, [r6, r7]
c0d0429e:	2800      	cmp	r0, #0
c0d042a0:	d066      	beq.n	c0d04370 <signTx_handleEndDHEncodingAPDU+0x10c>
c0d042a2:	20dc      	movs	r0, #220	; 0xdc
c0d042a4:	5c30      	ldrb	r0, [r6, r0]
c0d042a6:	493f      	ldr	r1, [pc, #252]	; (c0d043a4 <signTx_handleEndDHEncodingAPDU+0x140>)
c0d042a8:	5c71      	ldrb	r1, [r6, r1]
c0d042aa:	4281      	cmp	r1, r0
c0d042ac:	d160      	bne.n	c0d04370 <signTx_handleEndDHEncodingAPDU+0x10c>
c0d042ae:	ac01      	add	r4, sp, #4
c0d042b0:	4620      	mov	r0, r4
c0d042b2:	f003 fb07 	bl	c0d078c4 <setjmp>
c0d042b6:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d042b8:	0400      	lsls	r0, r0, #16
c0d042ba:	d117      	bne.n	c0d042ec <signTx_handleEndDHEncodingAPDU+0x88>
c0d042bc:	a801      	add	r0, sp, #4
c0d042be:	f001 f927 	bl	c0d05510 <try_context_set>
c0d042c2:	900b      	str	r0, [sp, #44]	; 0x2c
c0d042c4:	2043      	movs	r0, #67	; 0x43
c0d042c6:	00c0      	lsls	r0, r0, #3
c0d042c8:	1832      	adds	r2, r6, r0
c0d042ca:	1d31      	adds	r1, r6, #4
c0d042cc:	ac0d      	add	r4, sp, #52	; 0x34
c0d042ce:	4620      	mov	r0, r4
c0d042d0:	f7fc ffa4 	bl	c0d0121c <dh_init_aes_key>
c0d042d4:	2099      	movs	r0, #153	; 0x99
c0d042d6:	0080      	lsls	r0, r0, #2
c0d042d8:	1830      	adds	r0, r6, r0
c0d042da:	2141      	movs	r1, #65	; 0x41
c0d042dc:	008b      	lsls	r3, r1, #2
c0d042de:	4a32      	ldr	r2, [pc, #200]	; (c0d043a8 <signTx_handleEndDHEncodingAPDU+0x144>)
c0d042e0:	4621      	mov	r1, r4
c0d042e2:	f7fd f9d7 	bl	c0d01694 <dh_encode_finalize>
c0d042e6:	211d      	movs	r1, #29
c0d042e8:	0149      	lsls	r1, r1, #5
c0d042ea:	5470      	strb	r0, [r6, r1]
c0d042ec:	f001 f906 	bl	c0d054fc <try_context_get>
c0d042f0:	a901      	add	r1, sp, #4
c0d042f2:	4288      	cmp	r0, r1
c0d042f4:	d102      	bne.n	c0d042fc <signTx_handleEndDHEncodingAPDU+0x98>
c0d042f6:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d042f8:	f001 f90a 	bl	c0d05510 <try_context_set>
c0d042fc:	a80d      	add	r0, sp, #52	; 0x34
c0d042fe:	2148      	movs	r1, #72	; 0x48
c0d04300:	f003 f9bc 	bl	c0d0767c <explicit_bzero>
c0d04304:	a801      	add	r0, sp, #4
c0d04306:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d04308:	2800      	cmp	r0, #0
c0d0430a:	d132      	bne.n	c0d04372 <signTx_handleEndDHEncodingAPDU+0x10e>
c0d0430c:	201d      	movs	r0, #29
c0d0430e:	0144      	lsls	r4, r0, #5
c0d04310:	5d30      	ldrb	r0, [r6, r4]
c0d04312:	2173      	movs	r1, #115	; 0x73
c0d04314:	00c9      	lsls	r1, r1, #3
c0d04316:	5a72      	ldrh	r2, [r6, r1]
c0d04318:	1810      	adds	r0, r2, r0
c0d0431a:	5270      	strh	r0, [r6, r1]
c0d0431c:	b281      	uxth	r1, r0
c0d0431e:	4630      	mov	r0, r6
c0d04320:	30c4      	adds	r0, #196	; 0xc4
c0d04322:	f000 fbeb 	bl	c0d04afc <countedSectionProcess>
c0d04326:	2800      	cmp	r0, #0
c0d04328:	d022      	beq.n	c0d04370 <signTx_handleEndDHEncodingAPDU+0x10c>
c0d0432a:	8e30      	ldrh	r0, [r6, #48]	; 0x30
c0d0432c:	491f      	ldr	r1, [pc, #124]	; (c0d043ac <signTx_handleEndDHEncodingAPDU+0x148>)
c0d0432e:	1841      	adds	r1, r0, r1
c0d04330:	4248      	negs	r0, r1
c0d04332:	4148      	adcs	r0, r1
c0d04334:	5d34      	ldrb	r4, [r6, r4]
c0d04336:	4920      	ldr	r1, [pc, #128]	; (c0d043b8 <signTx_handleEndDHEncodingAPDU+0x154>)
c0d04338:	4479      	add	r1, pc
c0d0433a:	f7fb ff91 	bl	c0d00260 <assert>
c0d0433e:	2500      	movs	r5, #0
c0d04340:	9500      	str	r5, [sp, #0]
c0d04342:	4919      	ldr	r1, [pc, #100]	; (c0d043a8 <signTx_handleEndDHEncodingAPDU+0x144>)
c0d04344:	4628      	mov	r0, r5
c0d04346:	4622      	mov	r2, r4
c0d04348:	462b      	mov	r3, r5
c0d0434a:	f000 f9e3 	bl	c0d04714 <cx_hash>
c0d0434e:	55f5      	strb	r5, [r6, r7]
c0d04350:	f7ff fb2d 	bl	c0d039ae <policyForSignTxDHEnd>
c0d04354:	4604      	mov	r4, r0
c0d04356:	f7ff fbf5 	bl	c0d03b44 <ENSURE_NOT_DENIED>
c0d0435a:	2c03      	cmp	r4, #3
c0d0435c:	d117      	bne.n	c0d0438e <signTx_handleEndDHEncodingAPDU+0x12a>
c0d0435e:	20e7      	movs	r0, #231	; 0xe7
c0d04360:	0080      	lsls	r0, r0, #2
c0d04362:	21e1      	movs	r1, #225	; 0xe1
c0d04364:	0089      	lsls	r1, r1, #2
c0d04366:	5031      	str	r1, [r6, r0]
c0d04368:	f000 fb0c 	bl	c0d04984 <signTx_handleDHEnd_ui_runStep>
c0d0436c:	b01f      	add	sp, #124	; 0x7c
c0d0436e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d04370:	4808      	ldr	r0, [pc, #32]	; (c0d04394 <signTx_handleEndDHEncodingAPDU+0x130>)
c0d04372:	f7fe fc70 	bl	c0d02c56 <os_longjmp>
c0d04376:	4807      	ldr	r0, [pc, #28]	; (c0d04394 <signTx_handleEndDHEncodingAPDU+0x130>)
c0d04378:	1c40      	adds	r0, r0, #1
c0d0437a:	f7fe fc6c 	bl	c0d02c56 <os_longjmp>
c0d0437e:	4805      	ldr	r0, [pc, #20]	; (c0d04394 <signTx_handleEndDHEncodingAPDU+0x130>)
c0d04380:	1e40      	subs	r0, r0, #1
c0d04382:	f7fe fc68 	bl	c0d02c56 <os_longjmp>
c0d04386:	4803      	ldr	r0, [pc, #12]	; (c0d04394 <signTx_handleEndDHEncodingAPDU+0x130>)
c0d04388:	1c80      	adds	r0, r0, #2
c0d0438a:	f7fe fc64 	bl	c0d02c56 <os_longjmp>
c0d0438e:	4808      	ldr	r0, [pc, #32]	; (c0d043b0 <signTx_handleEndDHEncodingAPDU+0x14c>)
c0d04390:	f7fe fc61 	bl	c0d02c56 <os_longjmp>
c0d04394:	00006e06 	.word	0x00006e06
c0d04398:	000003a1 	.word	0x000003a1
c0d0439c:	20000518 	.word	0x20000518
c0d043a0:	00000215 	.word	0x00000215
c0d043a4:	00000216 	.word	0x00000216
c0d043a8:	20000398 	.word	0x20000398
c0d043ac:	ffffcfc7 	.word	0xffffcfc7
c0d043b0:	00004701 	.word	0x00004701
c0d043b4:	0000446a 	.word	0x0000446a
c0d043b8:	000042c5 	.word	0x000042c5

c0d043bc <signTx_handleFinishAPDU>:
c0d043bc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d043be:	b0bb      	sub	sp, #236	; 0xec
c0d043c0:	2800      	cmp	r0, #0
c0d043c2:	d000      	beq.n	c0d043c6 <signTx_handleFinishAPDU+0xa>
c0d043c4:	e0d6      	b.n	c0d04574 <signTx_handleFinishAPDU+0x1b8>
c0d043c6:	2a00      	cmp	r2, #0
c0d043c8:	d000      	beq.n	c0d043cc <signTx_handleFinishAPDU+0x10>
c0d043ca:	e0cf      	b.n	c0d0456c <signTx_handleFinishAPDU+0x1b0>
c0d043cc:	9840      	ldr	r0, [sp, #256]	; 0x100
c0d043ce:	2800      	cmp	r0, #0
c0d043d0:	d000      	beq.n	c0d043d4 <signTx_handleFinishAPDU+0x18>
c0d043d2:	e0cb      	b.n	c0d0456c <signTx_handleFinishAPDU+0x1b0>
c0d043d4:	486f      	ldr	r0, [pc, #444]	; (c0d04594 <signTx_handleFinishAPDU+0x1d8>)
c0d043d6:	4d70      	ldr	r5, [pc, #448]	; (c0d04598 <signTx_handleFinishAPDU+0x1dc>)
c0d043d8:	1828      	adds	r0, r5, r0
c0d043da:	4975      	ldr	r1, [pc, #468]	; (c0d045b0 <signTx_handleFinishAPDU+0x1f4>)
c0d043dc:	4479      	add	r1, pc
c0d043de:	220a      	movs	r2, #10
c0d043e0:	f003 f93c 	bl	c0d0765c <__aeabi_memcpy>
c0d043e4:	f000 faa4 	bl	c0d04930 <prepareOurPubkeyForDisplay>
c0d043e8:	ae31      	add	r6, sp, #196	; 0xc4
c0d043ea:	2420      	movs	r4, #32
c0d043ec:	4630      	mov	r0, r6
c0d043ee:	4621      	mov	r1, r4
c0d043f0:	f003 f944 	bl	c0d0767c <explicit_bzero>
c0d043f4:	8e28      	ldrh	r0, [r5, #48]	; 0x30
c0d043f6:	4969      	ldr	r1, [pc, #420]	; (c0d0459c <signTx_handleFinishAPDU+0x1e0>)
c0d043f8:	1841      	adds	r1, r0, r1
c0d043fa:	4248      	negs	r0, r1
c0d043fc:	4148      	adcs	r0, r1
c0d043fe:	496d      	ldr	r1, [pc, #436]	; (c0d045b4 <signTx_handleFinishAPDU+0x1f8>)
c0d04400:	4479      	add	r1, pc
c0d04402:	f7fb ff2d 	bl	c0d00260 <assert>
c0d04406:	2701      	movs	r7, #1
c0d04408:	496b      	ldr	r1, [pc, #428]	; (c0d045b8 <signTx_handleFinishAPDU+0x1fc>)
c0d0440a:	4479      	add	r1, pc
c0d0440c:	4638      	mov	r0, r7
c0d0440e:	f7fb ff27 	bl	c0d00260 <assert>
c0d04412:	9400      	str	r4, [sp, #0]
c0d04414:	2100      	movs	r1, #0
c0d04416:	9708      	str	r7, [sp, #32]
c0d04418:	4638      	mov	r0, r7
c0d0441a:	460f      	mov	r7, r1
c0d0441c:	460a      	mov	r2, r1
c0d0441e:	4633      	mov	r3, r6
c0d04420:	f000 f978 	bl	c0d04714 <cx_hash>
c0d04424:	485e      	ldr	r0, [pc, #376]	; (c0d045a0 <signTx_handleFinishAPDU+0x1e4>)
c0d04426:	5c28      	ldrb	r0, [r5, r0]
c0d04428:	2800      	cmp	r0, #0
c0d0442a:	d000      	beq.n	c0d0442e <signTx_handleFinishAPDU+0x72>
c0d0442c:	e0a5      	b.n	c0d0457a <signTx_handleFinishAPDU+0x1be>
c0d0442e:	4628      	mov	r0, r5
c0d04430:	30a0      	adds	r0, #160	; 0xa0
c0d04432:	f000 fca7 	bl	c0d04d84 <integrityCheckEvaluate>
c0d04436:	2800      	cmp	r0, #0
c0d04438:	d100      	bne.n	c0d0443c <signTx_handleFinishAPDU+0x80>
c0d0443a:	e0a2      	b.n	c0d04582 <signTx_handleFinishAPDU+0x1c6>
c0d0443c:	4628      	mov	r0, r5
c0d0443e:	30c4      	adds	r0, #196	; 0xc4
c0d04440:	f000 fbb6 	bl	c0d04bb0 <countedSectionFinalize>
c0d04444:	2800      	cmp	r0, #0
c0d04446:	d100      	bne.n	c0d0444a <signTx_handleFinishAPDU+0x8e>
c0d04448:	e090      	b.n	c0d0456c <signTx_handleFinishAPDU+0x1b0>
c0d0444a:	f7ff fab2 	bl	c0d039b2 <policyForSignTxFinish>
c0d0444e:	4606      	mov	r6, r0
c0d04450:	f7ff fb78 	bl	c0d03b44 <ENSURE_NOT_DENIED>
c0d04454:	2e03      	cmp	r6, #3
c0d04456:	d000      	beq.n	c0d0445a <signTx_handleFinishAPDU+0x9e>
c0d04458:	e097      	b.n	c0d0458a <signTx_handleFinishAPDU+0x1ce>
c0d0445a:	20e7      	movs	r0, #231	; 0xe7
c0d0445c:	0080      	lsls	r0, r0, #2
c0d0445e:	217d      	movs	r1, #125	; 0x7d
c0d04460:	00c9      	lsls	r1, r1, #3
c0d04462:	5029      	str	r1, [r5, r0]
c0d04464:	a827      	add	r0, sp, #156	; 0x9c
c0d04466:	2128      	movs	r1, #40	; 0x28
c0d04468:	f003 f908 	bl	c0d0767c <explicit_bzero>
c0d0446c:	ae1b      	add	r6, sp, #108	; 0x6c
c0d0446e:	4630      	mov	r0, r6
c0d04470:	f003 fa28 	bl	c0d078c4 <setjmp>
c0d04474:	85b0      	strh	r0, [r6, #44]	; 0x2c
c0d04476:	0400      	lsls	r0, r0, #16
c0d04478:	d15e      	bne.n	c0d04538 <signTx_handleFinishAPDU+0x17c>
c0d0447a:	9409      	str	r4, [sp, #36]	; 0x24
c0d0447c:	a81b      	add	r0, sp, #108	; 0x6c
c0d0447e:	f001 f847 	bl	c0d05510 <try_context_set>
c0d04482:	9025      	str	r0, [sp, #148]	; 0x94
c0d04484:	1d28      	adds	r0, r5, #4
c0d04486:	ae27      	add	r6, sp, #156	; 0x9c
c0d04488:	4631      	mov	r1, r6
c0d0448a:	f7fe fb35 	bl	c0d02af8 <derivePrivateKey>
c0d0448e:	2041      	movs	r0, #65	; 0x41
c0d04490:	0081      	lsls	r1, r0, #2
c0d04492:	4845      	ldr	r0, [pc, #276]	; (c0d045a8 <signTx_handleFinishAPDU+0x1ec>)
c0d04494:	f003 f8f2 	bl	c0d0767c <explicit_bzero>
c0d04498:	3608      	adds	r6, #8
c0d0449a:	9607      	str	r6, [sp, #28]
c0d0449c:	4847      	ldr	r0, [pc, #284]	; (c0d045bc <signTx_handleFinishAPDU+0x200>)
c0d0449e:	4478      	add	r0, pc
c0d044a0:	9006      	str	r0, [sp, #24]
c0d044a2:	463c      	mov	r4, r7
c0d044a4:	9405      	str	r4, [sp, #20]
c0d044a6:	2c00      	cmp	r4, #0
c0d044a8:	d00e      	beq.n	c0d044c8 <signTx_handleFinishAPDU+0x10c>
c0d044aa:	a80a      	add	r0, sp, #40	; 0x28
c0d044ac:	9003      	str	r0, [sp, #12]
c0d044ae:	a812      	add	r0, sp, #72	; 0x48
c0d044b0:	9002      	str	r0, [sp, #8]
c0d044b2:	9c09      	ldr	r4, [sp, #36]	; 0x24
c0d044b4:	9401      	str	r4, [sp, #4]
c0d044b6:	9806      	ldr	r0, [sp, #24]
c0d044b8:	9000      	str	r0, [sp, #0]
c0d044ba:	4f3b      	ldr	r7, [pc, #236]	; (c0d045a8 <signTx_handleFinishAPDU+0x1ec>)
c0d044bc:	4638      	mov	r0, r7
c0d044be:	3064      	adds	r0, #100	; 0x64
c0d044c0:	a931      	add	r1, sp, #196	; 0xc4
c0d044c2:	2200      	movs	r2, #0
c0d044c4:	4613      	mov	r3, r2
c0d044c6:	e00d      	b.n	c0d044e4 <signTx_handleFinishAPDU+0x128>
c0d044c8:	9b28      	ldr	r3, [sp, #160]	; 0xa0
c0d044ca:	a80a      	add	r0, sp, #40	; 0x28
c0d044cc:	9003      	str	r0, [sp, #12]
c0d044ce:	a812      	add	r0, sp, #72	; 0x48
c0d044d0:	9002      	str	r0, [sp, #8]
c0d044d2:	9c09      	ldr	r4, [sp, #36]	; 0x24
c0d044d4:	9401      	str	r4, [sp, #4]
c0d044d6:	9806      	ldr	r0, [sp, #24]
c0d044d8:	9000      	str	r0, [sp, #0]
c0d044da:	4f33      	ldr	r7, [pc, #204]	; (c0d045a8 <signTx_handleFinishAPDU+0x1ec>)
c0d044dc:	4638      	mov	r0, r7
c0d044de:	3064      	adds	r0, #100	; 0x64
c0d044e0:	a931      	add	r1, sp, #196	; 0xc4
c0d044e2:	9a07      	ldr	r2, [sp, #28]
c0d044e4:	f7fd fad8 	bl	c0d01a98 <rng_rfc6979>
c0d044e8:	2564      	movs	r5, #100	; 0x64
c0d044ea:	953a      	str	r5, [sp, #232]	; 0xe8
c0d044ec:	a839      	add	r0, sp, #228	; 0xe4
c0d044ee:	9003      	str	r0, [sp, #12]
c0d044f0:	a83a      	add	r0, sp, #232	; 0xe8
c0d044f2:	9002      	str	r0, [sp, #8]
c0d044f4:	463e      	mov	r6, r7
c0d044f6:	3664      	adds	r6, #100	; 0x64
c0d044f8:	9601      	str	r6, [sp, #4]
c0d044fa:	9400      	str	r4, [sp, #0]
c0d044fc:	a827      	add	r0, sp, #156	; 0x9c
c0d044fe:	2203      	movs	r2, #3
c0d04500:	ab31      	add	r3, sp, #196	; 0xc4
c0d04502:	492a      	ldr	r1, [pc, #168]	; (c0d045ac <signTx_handleFinishAPDU+0x1f0>)
c0d04504:	f7fb ffe6 	bl	c0d004d4 <cx_ecdsa_sign_no_throw>
c0d04508:	2800      	cmp	r0, #0
c0d0450a:	d13f      	bne.n	c0d0458c <signTx_handleFinishAPDU+0x1d0>
c0d0450c:	5d78      	ldrb	r0, [r7, r5]
c0d0450e:	9939      	ldr	r1, [sp, #228]	; 0xe4
c0d04510:	07c9      	lsls	r1, r1, #31
c0d04512:	9908      	ldr	r1, [sp, #32]
c0d04514:	d001      	beq.n	c0d0451a <signTx_handleFinishAPDU+0x15e>
c0d04516:	4308      	orrs	r0, r1
c0d04518:	5578      	strb	r0, [r7, r5]
c0d0451a:	4008      	ands	r0, r1
c0d0451c:	301f      	adds	r0, #31
c0d0451e:	7038      	strb	r0, [r7, #0]
c0d04520:	1c7d      	adds	r5, r7, #1
c0d04522:	4630      	mov	r0, r6
c0d04524:	4629      	mov	r1, r5
c0d04526:	f7fd fa7b 	bl	c0d01a20 <ecdsa_der_to_sig>
c0d0452a:	4628      	mov	r0, r5
c0d0452c:	f7fd fa5d 	bl	c0d019ea <check_canonical>
c0d04530:	9905      	ldr	r1, [sp, #20]
c0d04532:	1e4c      	subs	r4, r1, #1
c0d04534:	2800      	cmp	r0, #0
c0d04536:	d0b5      	beq.n	c0d044a4 <signTx_handleFinishAPDU+0xe8>
c0d04538:	f000 ffe0 	bl	c0d054fc <try_context_get>
c0d0453c:	a91b      	add	r1, sp, #108	; 0x6c
c0d0453e:	4288      	cmp	r0, r1
c0d04540:	d102      	bne.n	c0d04548 <signTx_handleFinishAPDU+0x18c>
c0d04542:	9825      	ldr	r0, [sp, #148]	; 0x94
c0d04544:	f000 ffe4 	bl	c0d05510 <try_context_set>
c0d04548:	a827      	add	r0, sp, #156	; 0x9c
c0d0454a:	2128      	movs	r1, #40	; 0x28
c0d0454c:	f003 f880 	bl	c0d07650 <__aeabi_memclr>
c0d04550:	a81b      	add	r0, sp, #108	; 0x6c
c0d04552:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d04554:	2800      	cmp	r0, #0
c0d04556:	d119      	bne.n	c0d0458c <signTx_handleFinishAPDU+0x1d0>
c0d04558:	4813      	ldr	r0, [pc, #76]	; (c0d045a8 <signTx_handleFinishAPDU+0x1ec>)
c0d0455a:	3041      	adds	r0, #65	; 0x41
c0d0455c:	a931      	add	r1, sp, #196	; 0xc4
c0d0455e:	2220      	movs	r2, #32
c0d04560:	f003 f87c 	bl	c0d0765c <__aeabi_memcpy>
c0d04564:	f000 fa4c 	bl	c0d04a00 <signTx_handleFinish_ui_runStep>
c0d04568:	b03b      	add	sp, #236	; 0xec
c0d0456a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0456c:	4808      	ldr	r0, [pc, #32]	; (c0d04590 <signTx_handleFinishAPDU+0x1d4>)
c0d0456e:	1c80      	adds	r0, r0, #2
c0d04570:	f7fe fb71 	bl	c0d02c56 <os_longjmp>
c0d04574:	4806      	ldr	r0, [pc, #24]	; (c0d04590 <signTx_handleFinishAPDU+0x1d4>)
c0d04576:	f7fe fb6e 	bl	c0d02c56 <os_longjmp>
c0d0457a:	4805      	ldr	r0, [pc, #20]	; (c0d04590 <signTx_handleFinishAPDU+0x1d4>)
c0d0457c:	1c40      	adds	r0, r0, #1
c0d0457e:	f7fe fb6a 	bl	c0d02c56 <os_longjmp>
c0d04582:	4803      	ldr	r0, [pc, #12]	; (c0d04590 <signTx_handleFinishAPDU+0x1d4>)
c0d04584:	1cc0      	adds	r0, r0, #3
c0d04586:	f7fe fb66 	bl	c0d02c56 <os_longjmp>
c0d0458a:	4806      	ldr	r0, [pc, #24]	; (c0d045a4 <signTx_handleFinishAPDU+0x1e8>)
c0d0458c:	f7fe fb63 	bl	c0d02c56 <os_longjmp>
c0d04590:	00006e05 	.word	0x00006e05
c0d04594:	000003a1 	.word	0x000003a1
c0d04598:	20000518 	.word	0x20000518
c0d0459c:	ffffcfc7 	.word	0xffffcfc7
c0d045a0:	00000215 	.word	0x00000215
c0d045a4:	00004701 	.word	0x00004701
c0d045a8:	20000398 	.word	0x20000398
c0d045ac:	00000841 	.word	0x00000841
c0d045b0:	00004320 	.word	0x00004320
c0d045b4:	0000428e 	.word	0x0000428e
c0d045b8:	00004292 	.word	0x00004292
c0d045bc:	00004268 	.word	0x00004268

c0d045c0 <signTransaction_handleAPDU>:
c0d045c0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d045c2:	b085      	sub	sp, #20
c0d045c4:	461c      	mov	r4, r3
c0d045c6:	4617      	mov	r7, r2
c0d045c8:	9104      	str	r1, [sp, #16]
c0d045ca:	4605      	mov	r5, r0
c0d045cc:	2601      	movs	r6, #1
c0d045ce:	02b1      	lsls	r1, r6, #10
c0d045d0:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d045d2:	2800      	cmp	r0, #0
c0d045d4:	d024      	beq.n	c0d04620 <signTransaction_handleAPDU+0x60>
c0d045d6:	9103      	str	r1, [sp, #12]
c0d045d8:	9903      	ldr	r1, [sp, #12]
c0d045da:	3194      	adds	r1, #148	; 0x94
c0d045dc:	9702      	str	r7, [sp, #8]
c0d045de:	4f3e      	ldr	r7, [pc, #248]	; (c0d046d8 <signTransaction_handleAPDU+0x118>)
c0d045e0:	4638      	mov	r0, r7
c0d045e2:	f003 f84b 	bl	c0d0767c <explicit_bzero>
c0d045e6:	4638      	mov	r0, r7
c0d045e8:	3034      	adds	r0, #52	; 0x34
c0d045ea:	f7fb ffbb 	bl	c0d00564 <cx_sha256_init_no_throw>
c0d045ee:	483b      	ldr	r0, [pc, #236]	; (c0d046dc <signTransaction_handleAPDU+0x11c>)
c0d045f0:	8638      	strh	r0, [r7, #48]	; 0x30
c0d045f2:	4638      	mov	r0, r7
c0d045f4:	30a0      	adds	r0, #160	; 0xa0
c0d045f6:	f000 faef 	bl	c0d04bd8 <integrityCheckInit>
c0d045fa:	4638      	mov	r0, r7
c0d045fc:	30c4      	adds	r0, #196	; 0xc4
c0d045fe:	f000 fa53 	bl	c0d04aa8 <countedSectionInit>
c0d04602:	4638      	mov	r0, r7
c0d04604:	30e0      	adds	r0, #224	; 0xe0
c0d04606:	2158      	movs	r1, #88	; 0x58
c0d04608:	f003 f838 	bl	c0d0767c <explicit_bzero>
c0d0460c:	4834      	ldr	r0, [pc, #208]	; (c0d046e0 <signTransaction_handleAPDU+0x120>)
c0d0460e:	2100      	movs	r1, #0
c0d04610:	5439      	strb	r1, [r7, r0]
c0d04612:	9903      	ldr	r1, [sp, #12]
c0d04614:	20e0      	movs	r0, #224	; 0xe0
c0d04616:	4a31      	ldr	r2, [pc, #196]	; (c0d046dc <signTransaction_handleAPDU+0x11c>)
c0d04618:	503a      	str	r2, [r7, r0]
c0d0461a:	1c50      	adds	r0, r2, #1
c0d0461c:	8038      	strh	r0, [r7, #0]
c0d0461e:	9f02      	ldr	r7, [sp, #8]
c0d04620:	428c      	cmp	r4, r1
c0d04622:	d300      	bcc.n	c0d04626 <signTransaction_handleAPDU+0x66>
c0d04624:	2600      	movs	r6, #0
c0d04626:	4830      	ldr	r0, [pc, #192]	; (c0d046e8 <signTransaction_handleAPDU+0x128>)
c0d04628:	4478      	add	r0, pc
c0d0462a:	1c81      	adds	r1, r0, #2
c0d0462c:	4630      	mov	r0, r6
c0d0462e:	f7fb fe17 	bl	c0d00260 <assert>
c0d04632:	2c01      	cmp	r4, #1
c0d04634:	d949      	bls.n	c0d046ca <signTransaction_handleAPDU+0x10a>
c0d04636:	7878      	ldrb	r0, [r7, #1]
c0d04638:	783e      	ldrb	r6, [r7, #0]
c0d0463a:	9003      	str	r0, [sp, #12]
c0d0463c:	1830      	adds	r0, r6, r0
c0d0463e:	1c80      	adds	r0, r0, #2
c0d04640:	42a0      	cmp	r0, r4
c0d04642:	d842      	bhi.n	c0d046ca <signTransaction_handleAPDU+0x10a>
c0d04644:	9600      	str	r6, [sp, #0]
c0d04646:	4824      	ldr	r0, [pc, #144]	; (c0d046d8 <signTransaction_handleAPDU+0x118>)
c0d04648:	30a0      	adds	r0, #160	; 0xa0
c0d0464a:	1cbf      	adds	r7, r7, #2
c0d0464c:	4629      	mov	r1, r5
c0d0464e:	9a04      	ldr	r2, [sp, #16]
c0d04650:	463b      	mov	r3, r7
c0d04652:	f000 facb 	bl	c0d04bec <integrityCheckProcessInstruction>
c0d04656:	2d01      	cmp	r5, #1
c0d04658:	d01a      	beq.n	c0d04690 <signTransaction_handleAPDU+0xd0>
c0d0465a:	2d10      	cmp	r5, #16
c0d0465c:	d01b      	beq.n	c0d04696 <signTransaction_handleAPDU+0xd6>
c0d0465e:	2d03      	cmp	r5, #3
c0d04660:	d01c      	beq.n	c0d0469c <signTransaction_handleAPDU+0xdc>
c0d04662:	2d04      	cmp	r5, #4
c0d04664:	d01d      	beq.n	c0d046a2 <signTransaction_handleAPDU+0xe2>
c0d04666:	2d05      	cmp	r5, #5
c0d04668:	d01e      	beq.n	c0d046a8 <signTransaction_handleAPDU+0xe8>
c0d0466a:	2d06      	cmp	r5, #6
c0d0466c:	d00a      	beq.n	c0d04684 <signTransaction_handleAPDU+0xc4>
c0d0466e:	2d07      	cmp	r5, #7
c0d04670:	d01d      	beq.n	c0d046ae <signTransaction_handleAPDU+0xee>
c0d04672:	2d08      	cmp	r5, #8
c0d04674:	d01e      	beq.n	c0d046b4 <signTransaction_handleAPDU+0xf4>
c0d04676:	2d09      	cmp	r5, #9
c0d04678:	d007      	beq.n	c0d0468a <signTransaction_handleAPDU+0xca>
c0d0467a:	2d02      	cmp	r5, #2
c0d0467c:	d129      	bne.n	c0d046d2 <signTransaction_handleAPDU+0x112>
c0d0467e:	4c1c      	ldr	r4, [pc, #112]	; (c0d046f0 <signTransaction_handleAPDU+0x130>)
c0d04680:	447c      	add	r4, pc
c0d04682:	e019      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d04684:	4c1d      	ldr	r4, [pc, #116]	; (c0d046fc <signTransaction_handleAPDU+0x13c>)
c0d04686:	447c      	add	r4, pc
c0d04688:	e016      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d0468a:	4c1f      	ldr	r4, [pc, #124]	; (c0d04708 <signTransaction_handleAPDU+0x148>)
c0d0468c:	447c      	add	r4, pc
c0d0468e:	e013      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d04690:	4c16      	ldr	r4, [pc, #88]	; (c0d046ec <signTransaction_handleAPDU+0x12c>)
c0d04692:	447c      	add	r4, pc
c0d04694:	e010      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d04696:	4c1d      	ldr	r4, [pc, #116]	; (c0d0470c <signTransaction_handleAPDU+0x14c>)
c0d04698:	447c      	add	r4, pc
c0d0469a:	e00d      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d0469c:	4c1c      	ldr	r4, [pc, #112]	; (c0d04710 <signTransaction_handleAPDU+0x150>)
c0d0469e:	447c      	add	r4, pc
c0d046a0:	e00a      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d046a2:	4c14      	ldr	r4, [pc, #80]	; (c0d046f4 <signTransaction_handleAPDU+0x134>)
c0d046a4:	447c      	add	r4, pc
c0d046a6:	e007      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d046a8:	4c13      	ldr	r4, [pc, #76]	; (c0d046f8 <signTransaction_handleAPDU+0x138>)
c0d046aa:	447c      	add	r4, pc
c0d046ac:	e004      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d046ae:	4c14      	ldr	r4, [pc, #80]	; (c0d04700 <signTransaction_handleAPDU+0x140>)
c0d046b0:	447c      	add	r4, pc
c0d046b2:	e001      	b.n	c0d046b8 <signTransaction_handleAPDU+0xf8>
c0d046b4:	4c13      	ldr	r4, [pc, #76]	; (c0d04704 <signTransaction_handleAPDU+0x144>)
c0d046b6:	447c      	add	r4, pc
c0d046b8:	9803      	ldr	r0, [sp, #12]
c0d046ba:	9000      	str	r0, [sp, #0]
c0d046bc:	19bb      	adds	r3, r7, r6
c0d046be:	9804      	ldr	r0, [sp, #16]
c0d046c0:	4639      	mov	r1, r7
c0d046c2:	4632      	mov	r2, r6
c0d046c4:	47a0      	blx	r4
c0d046c6:	b005      	add	sp, #20
c0d046c8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d046ca:	4806      	ldr	r0, [pc, #24]	; (c0d046e4 <signTransaction_handleAPDU+0x124>)
c0d046cc:	1c80      	adds	r0, r0, #2
c0d046ce:	f7fe fac2 	bl	c0d02c56 <os_longjmp>
c0d046d2:	4804      	ldr	r0, [pc, #16]	; (c0d046e4 <signTransaction_handleAPDU+0x124>)
c0d046d4:	f7fe fabf 	bl	c0d02c56 <os_longjmp>
c0d046d8:	20000518 	.word	0x20000518
c0d046dc:	00003039 	.word	0x00003039
c0d046e0:	00000215 	.word	0x00000215
c0d046e4:	00006e05 	.word	0x00006e05
c0d046e8:	00003fba 	.word	0x00003fba
c0d046ec:	fffff373 	.word	0xfffff373
c0d046f0:	fffff4d5 	.word	0xfffff4d5
c0d046f4:	fffff5c1 	.word	0xfffff5c1
c0d046f8:	fffff81f 	.word	0xfffff81f
c0d046fc:	fffff8eb 	.word	0xfffff8eb
c0d04700:	fffff941 	.word	0xfffff941
c0d04704:	fffffa1b 	.word	0xfffffa1b
c0d04708:	fffffbd5 	.word	0xfffffbd5
c0d0470c:	fffffd21 	.word	0xfffffd21
c0d04710:	fffff527 	.word	0xfffff527

c0d04714 <cx_hash>:
c0d04714:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d04716:	4615      	mov	r5, r2
c0d04718:	460a      	mov	r2, r1
c0d0471a:	4601      	mov	r1, r0
c0d0471c:	9806      	ldr	r0, [sp, #24]
c0d0471e:	9300      	str	r3, [sp, #0]
c0d04720:	9001      	str	r0, [sp, #4]
c0d04722:	4c07      	ldr	r4, [pc, #28]	; (c0d04740 <cx_hash+0x2c>)
c0d04724:	3434      	adds	r4, #52	; 0x34
c0d04726:	4620      	mov	r0, r4
c0d04728:	462b      	mov	r3, r5
c0d0472a:	f7fb fef1 	bl	c0d00510 <cx_hash_no_throw>
c0d0472e:	2800      	cmp	r0, #0
c0d04730:	d103      	bne.n	c0d0473a <cx_hash+0x26>
c0d04732:	4620      	mov	r0, r4
c0d04734:	f7fb fee6 	bl	c0d00504 <cx_hash_get_size>
c0d04738:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d0473a:	f7fe fa8c 	bl	c0d02c56 <os_longjmp>
c0d0473e:	46c0      	nop			; (mov r8, r8)
c0d04740:	20000518 	.word	0x20000518

c0d04744 <signTx_ui_runStep_simple>:
c0d04744:	b5b0      	push	{r4, r5, r7, lr}
c0d04746:	20e7      	movs	r0, #231	; 0xe7
c0d04748:	0084      	lsls	r4, r0, #2
c0d0474a:	4d12      	ldr	r5, [pc, #72]	; (c0d04794 <signTx_ui_runStep_simple+0x50>)
c0d0474c:	5928      	ldr	r0, [r5, r4]
c0d0474e:	2864      	cmp	r0, #100	; 0x64
c0d04750:	d00d      	beq.n	c0d0476e <signTx_ui_runStep_simple+0x2a>
c0d04752:	2865      	cmp	r0, #101	; 0x65
c0d04754:	d115      	bne.n	c0d04782 <signTx_ui_runStep_simple+0x3e>
c0d04756:	201d      	movs	r0, #29
c0d04758:	0140      	lsls	r0, r0, #5
c0d0475a:	5c2a      	ldrb	r2, [r5, r0]
c0d0475c:	2009      	movs	r0, #9
c0d0475e:	0300      	lsls	r0, r0, #12
c0d04760:	490d      	ldr	r1, [pc, #52]	; (c0d04798 <signTx_ui_runStep_simple+0x54>)
c0d04762:	f7fd fe89 	bl	c0d02478 <io_send_buf>
c0d04766:	f001 fa43 	bl	c0d05bf0 <ui_displayBusy>
c0d0476a:	2066      	movs	r0, #102	; 0x66
c0d0476c:	e010      	b.n	c0d04790 <signTx_ui_runStep_simple+0x4c>
c0d0476e:	480b      	ldr	r0, [pc, #44]	; (c0d0479c <signTx_ui_runStep_simple+0x58>)
c0d04770:	1828      	adds	r0, r5, r0
c0d04772:	490b      	ldr	r1, [pc, #44]	; (c0d047a0 <signTx_ui_runStep_simple+0x5c>)
c0d04774:	1869      	adds	r1, r5, r1
c0d04776:	4a0c      	ldr	r2, [pc, #48]	; (c0d047a8 <signTx_ui_runStep_simple+0x64>)
c0d04778:	447a      	add	r2, pc
c0d0477a:	f001 f8dd 	bl	c0d05938 <ui_displayPaginatedText>
c0d0477e:	2065      	movs	r0, #101	; 0x65
c0d04780:	e006      	b.n	c0d04790 <signTx_ui_runStep_simple+0x4c>
c0d04782:	4808      	ldr	r0, [pc, #32]	; (c0d047a4 <signTx_ui_runStep_simple+0x60>)
c0d04784:	4478      	add	r0, pc
c0d04786:	1c41      	adds	r1, r0, #1
c0d04788:	2000      	movs	r0, #0
c0d0478a:	f7fb fd69 	bl	c0d00260 <assert>
c0d0478e:	2064      	movs	r0, #100	; 0x64
c0d04790:	5128      	str	r0, [r5, r4]
c0d04792:	bdb0      	pop	{r4, r5, r7, pc}
c0d04794:	20000518 	.word	0x20000518
c0d04798:	20000398 	.word	0x20000398
c0d0479c:	000003a1 	.word	0x000003a1
c0d047a0:	000003b5 	.word	0x000003b5
c0d047a4:	00003e87 	.word	0x00003e87
c0d047a8:	ffffffc9 	.word	0xffffffc9

c0d047ac <processShaAndPosibleDHAndPrepareResponse>:
c0d047ac:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d047ae:	b0a1      	sub	sp, #132	; 0x84
c0d047b0:	483b      	ldr	r0, [pc, #236]	; (c0d048a0 <processShaAndPosibleDHAndPrepareResponse+0xf4>)
c0d047b2:	4e3c      	ldr	r6, [pc, #240]	; (c0d048a4 <processShaAndPosibleDHAndPrepareResponse+0xf8>)
c0d047b4:	5c30      	ldrb	r0, [r6, r0]
c0d047b6:	2800      	cmp	r0, #0
c0d047b8:	d053      	beq.n	c0d04862 <processShaAndPosibleDHAndPrepareResponse+0xb6>
c0d047ba:	ac03      	add	r4, sp, #12
c0d047bc:	4620      	mov	r0, r4
c0d047be:	f003 f881 	bl	c0d078c4 <setjmp>
c0d047c2:	85a0      	strh	r0, [r4, #44]	; 0x2c
c0d047c4:	0400      	lsls	r0, r0, #16
c0d047c6:	d13a      	bne.n	c0d0483e <processShaAndPosibleDHAndPrepareResponse+0x92>
c0d047c8:	a803      	add	r0, sp, #12
c0d047ca:	f000 fea1 	bl	c0d05510 <try_context_set>
c0d047ce:	900d      	str	r0, [sp, #52]	; 0x34
c0d047d0:	2043      	movs	r0, #67	; 0x43
c0d047d2:	00c0      	lsls	r0, r0, #3
c0d047d4:	1832      	adds	r2, r6, r0
c0d047d6:	1d31      	adds	r1, r6, #4
c0d047d8:	ad0f      	add	r5, sp, #60	; 0x3c
c0d047da:	4628      	mov	r0, r5
c0d047dc:	f7fc fd1e 	bl	c0d0121c <dh_init_aes_key>
c0d047e0:	2027      	movs	r0, #39	; 0x27
c0d047e2:	00c7      	lsls	r7, r0, #3
c0d047e4:	5df3      	ldrb	r3, [r6, r7]
c0d047e6:	2041      	movs	r0, #65	; 0x41
c0d047e8:	0080      	lsls	r0, r0, #2
c0d047ea:	9001      	str	r0, [sp, #4]
c0d047ec:	482e      	ldr	r0, [pc, #184]	; (c0d048a8 <processShaAndPosibleDHAndPrepareResponse+0xfc>)
c0d047ee:	9000      	str	r0, [sp, #0]
c0d047f0:	2099      	movs	r0, #153	; 0x99
c0d047f2:	0080      	lsls	r0, r0, #2
c0d047f4:	1830      	adds	r0, r6, r0
c0d047f6:	21ff      	movs	r1, #255	; 0xff
c0d047f8:	313a      	adds	r1, #58	; 0x3a
c0d047fa:	1872      	adds	r2, r6, r1
c0d047fc:	4629      	mov	r1, r5
c0d047fe:	f7fc fe87 	bl	c0d01510 <dh_encode_append>
c0d04802:	4605      	mov	r5, r0
c0d04804:	201d      	movs	r0, #29
c0d04806:	0144      	lsls	r4, r0, #5
c0d04808:	5535      	strb	r5, [r6, r4]
c0d0480a:	8e30      	ldrh	r0, [r6, #48]	; 0x30
c0d0480c:	4927      	ldr	r1, [pc, #156]	; (c0d048ac <processShaAndPosibleDHAndPrepareResponse+0x100>)
c0d0480e:	1a41      	subs	r1, r0, r1
c0d04810:	4248      	negs	r0, r1
c0d04812:	4148      	adcs	r0, r1
c0d04814:	4927      	ldr	r1, [pc, #156]	; (c0d048b4 <processShaAndPosibleDHAndPrepareResponse+0x108>)
c0d04816:	4479      	add	r1, pc
c0d04818:	f7fb fd22 	bl	c0d00260 <assert>
c0d0481c:	2000      	movs	r0, #0
c0d0481e:	9000      	str	r0, [sp, #0]
c0d04820:	b2ea      	uxtb	r2, r5
c0d04822:	4921      	ldr	r1, [pc, #132]	; (c0d048a8 <processShaAndPosibleDHAndPrepareResponse+0xfc>)
c0d04824:	4603      	mov	r3, r0
c0d04826:	f7ff ff75 	bl	c0d04714 <cx_hash>
c0d0482a:	2073      	movs	r0, #115	; 0x73
c0d0482c:	00c0      	lsls	r0, r0, #3
c0d0482e:	5a31      	ldrh	r1, [r6, r0]
c0d04830:	5d32      	ldrb	r2, [r6, r4]
c0d04832:	1851      	adds	r1, r2, r1
c0d04834:	5df2      	ldrb	r2, [r6, r7]
c0d04836:	4291      	cmp	r1, r2
c0d04838:	d32e      	bcc.n	c0d04898 <processShaAndPosibleDHAndPrepareResponse+0xec>
c0d0483a:	1a89      	subs	r1, r1, r2
c0d0483c:	5231      	strh	r1, [r6, r0]
c0d0483e:	f000 fe5d 	bl	c0d054fc <try_context_get>
c0d04842:	a903      	add	r1, sp, #12
c0d04844:	4288      	cmp	r0, r1
c0d04846:	d102      	bne.n	c0d0484e <processShaAndPosibleDHAndPrepareResponse+0xa2>
c0d04848:	980d      	ldr	r0, [sp, #52]	; 0x34
c0d0484a:	f000 fe61 	bl	c0d05510 <try_context_set>
c0d0484e:	a80f      	add	r0, sp, #60	; 0x3c
c0d04850:	2148      	movs	r1, #72	; 0x48
c0d04852:	f002 ff13 	bl	c0d0767c <explicit_bzero>
c0d04856:	a803      	add	r0, sp, #12
c0d04858:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d0485a:	2800      	cmp	r0, #0
c0d0485c:	d01a      	beq.n	c0d04894 <processShaAndPosibleDHAndPrepareResponse+0xe8>
c0d0485e:	f7fe f9fa 	bl	c0d02c56 <os_longjmp>
c0d04862:	8e30      	ldrh	r0, [r6, #48]	; 0x30
c0d04864:	4911      	ldr	r1, [pc, #68]	; (c0d048ac <processShaAndPosibleDHAndPrepareResponse+0x100>)
c0d04866:	1a41      	subs	r1, r0, r1
c0d04868:	4248      	negs	r0, r1
c0d0486a:	4148      	adcs	r0, r1
c0d0486c:	2127      	movs	r1, #39	; 0x27
c0d0486e:	00c9      	lsls	r1, r1, #3
c0d04870:	5c74      	ldrb	r4, [r6, r1]
c0d04872:	4911      	ldr	r1, [pc, #68]	; (c0d048b8 <processShaAndPosibleDHAndPrepareResponse+0x10c>)
c0d04874:	4479      	add	r1, pc
c0d04876:	f7fb fcf3 	bl	c0d00260 <assert>
c0d0487a:	2500      	movs	r5, #0
c0d0487c:	9500      	str	r5, [sp, #0]
c0d0487e:	20ff      	movs	r0, #255	; 0xff
c0d04880:	303a      	adds	r0, #58	; 0x3a
c0d04882:	1831      	adds	r1, r6, r0
c0d04884:	4628      	mov	r0, r5
c0d04886:	4622      	mov	r2, r4
c0d04888:	462b      	mov	r3, r5
c0d0488a:	f7ff ff43 	bl	c0d04714 <cx_hash>
c0d0488e:	201d      	movs	r0, #29
c0d04890:	0140      	lsls	r0, r0, #5
c0d04892:	5435      	strb	r5, [r6, r0]
c0d04894:	b021      	add	sp, #132	; 0x84
c0d04896:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d04898:	4805      	ldr	r0, [pc, #20]	; (c0d048b0 <processShaAndPosibleDHAndPrepareResponse+0x104>)
c0d0489a:	f7fe f9dc 	bl	c0d02c56 <os_longjmp>
c0d0489e:	46c0      	nop			; (mov r8, r8)
c0d048a0:	00000215 	.word	0x00000215
c0d048a4:	20000518 	.word	0x20000518
c0d048a8:	20000398 	.word	0x20000398
c0d048ac:	00003039 	.word	0x00003039
c0d048b0:	00006e06 	.word	0x00006e06
c0d048b4:	00003de7 	.word	0x00003de7
c0d048b8:	00003d89 	.word	0x00003d89

c0d048bc <signTx_handleDHStart_ui_runStep>:
c0d048bc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d048be:	20e7      	movs	r0, #231	; 0xe7
c0d048c0:	0084      	lsls	r4, r0, #2
c0d048c2:	4d14      	ldr	r5, [pc, #80]	; (c0d04914 <signTx_handleDHStart_ui_runStep+0x58>)
c0d048c4:	5928      	ldr	r0, [r5, r4]
c0d048c6:	2619      	movs	r6, #25
c0d048c8:	0177      	lsls	r7, r6, #5
c0d048ca:	42b8      	cmp	r0, r7
c0d048cc:	d00f      	beq.n	c0d048ee <signTx_handleDHStart_ui_runStep+0x32>
c0d048ce:	4912      	ldr	r1, [pc, #72]	; (c0d04918 <signTx_handleDHStart_ui_runStep+0x5c>)
c0d048d0:	4288      	cmp	r0, r1
c0d048d2:	d117      	bne.n	c0d04904 <signTx_handleDHStart_ui_runStep+0x48>
c0d048d4:	201d      	movs	r0, #29
c0d048d6:	0140      	lsls	r0, r0, #5
c0d048d8:	5c2a      	ldrb	r2, [r5, r0]
c0d048da:	2009      	movs	r0, #9
c0d048dc:	0300      	lsls	r0, r0, #12
c0d048de:	490f      	ldr	r1, [pc, #60]	; (c0d0491c <signTx_handleDHStart_ui_runStep+0x60>)
c0d048e0:	f7fd fdca 	bl	c0d02478 <io_send_buf>
c0d048e4:	f001 f984 	bl	c0d05bf0 <ui_displayBusy>
c0d048e8:	0170      	lsls	r0, r6, #5
c0d048ea:	1c87      	adds	r7, r0, #2
c0d048ec:	e010      	b.n	c0d04910 <signTx_handleDHStart_ui_runStep+0x54>
c0d048ee:	480d      	ldr	r0, [pc, #52]	; (c0d04924 <signTx_handleDHStart_ui_runStep+0x68>)
c0d048f0:	4478      	add	r0, pc
c0d048f2:	490d      	ldr	r1, [pc, #52]	; (c0d04928 <signTx_handleDHStart_ui_runStep+0x6c>)
c0d048f4:	4479      	add	r1, pc
c0d048f6:	4a0d      	ldr	r2, [pc, #52]	; (c0d0492c <signTx_handleDHStart_ui_runStep+0x70>)
c0d048f8:	447a      	add	r2, pc
c0d048fa:	f001 f81d 	bl	c0d05938 <ui_displayPaginatedText>
c0d048fe:	0170      	lsls	r0, r6, #5
c0d04900:	1c47      	adds	r7, r0, #1
c0d04902:	e005      	b.n	c0d04910 <signTx_handleDHStart_ui_runStep+0x54>
c0d04904:	4806      	ldr	r0, [pc, #24]	; (c0d04920 <signTx_handleDHStart_ui_runStep+0x64>)
c0d04906:	4478      	add	r0, pc
c0d04908:	1c41      	adds	r1, r0, #1
c0d0490a:	2000      	movs	r0, #0
c0d0490c:	f7fb fca8 	bl	c0d00260 <assert>
c0d04910:	512f      	str	r7, [r5, r4]
c0d04912:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d04914:	20000518 	.word	0x20000518
c0d04918:	00000321 	.word	0x00000321
c0d0491c:	20000398 	.word	0x20000398
c0d04920:	00003d1f 	.word	0x00003d1f
c0d04924:	00003d4f 	.word	0x00003d4f
c0d04928:	000031cc 	.word	0x000031cc
c0d0492c:	ffffffc1 	.word	0xffffffc1

c0d04930 <prepareOurPubkeyForDisplay>:
c0d04930:	b570      	push	{r4, r5, r6, lr}
c0d04932:	b094      	sub	sp, #80	; 0x50
c0d04934:	ad01      	add	r5, sp, #4
c0d04936:	214c      	movs	r1, #76	; 0x4c
c0d04938:	4628      	mov	r0, r5
c0d0493a:	f002 fe9f 	bl	c0d0767c <explicit_bzero>
c0d0493e:	4c0e      	ldr	r4, [pc, #56]	; (c0d04978 <prepareOurPubkeyForDisplay+0x48>)
c0d04940:	1d20      	adds	r0, r4, #4
c0d04942:	4629      	mov	r1, r5
c0d04944:	f7fe f924 	bl	c0d02b90 <derivePublicKey>
c0d04948:	480c      	ldr	r0, [pc, #48]	; (c0d0497c <prepareOurPubkeyForDisplay+0x4c>)
c0d0494a:	1824      	adds	r4, r4, r0
c0d0494c:	3508      	adds	r5, #8
c0d0494e:	2141      	movs	r1, #65	; 0x41
c0d04950:	23dc      	movs	r3, #220	; 0xdc
c0d04952:	4628      	mov	r0, r5
c0d04954:	4622      	mov	r2, r4
c0d04956:	f7fd fac1 	bl	c0d01edc <public_key_to_wif>
c0d0495a:	4605      	mov	r5, r0
c0d0495c:	2600      	movs	r6, #0
c0d0495e:	28dc      	cmp	r0, #220	; 0xdc
c0d04960:	d301      	bcc.n	c0d04966 <prepareOurPubkeyForDisplay+0x36>
c0d04962:	4630      	mov	r0, r6
c0d04964:	e000      	b.n	c0d04968 <prepareOurPubkeyForDisplay+0x38>
c0d04966:	2001      	movs	r0, #1
c0d04968:	4905      	ldr	r1, [pc, #20]	; (c0d04980 <prepareOurPubkeyForDisplay+0x50>)
c0d0496a:	4479      	add	r1, pc
c0d0496c:	f7fb fc78 	bl	c0d00260 <assert>
c0d04970:	5566      	strb	r6, [r4, r5]
c0d04972:	b014      	add	sp, #80	; 0x50
c0d04974:	bd70      	pop	{r4, r5, r6, pc}
c0d04976:	46c0      	nop			; (mov r8, r8)
c0d04978:	20000518 	.word	0x20000518
c0d0497c:	000003b5 	.word	0x000003b5
c0d04980:	00003ce0 	.word	0x00003ce0

c0d04984 <signTx_handleDHEnd_ui_runStep>:
c0d04984:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d04986:	20e7      	movs	r0, #231	; 0xe7
c0d04988:	0084      	lsls	r4, r0, #2
c0d0498a:	4d15      	ldr	r5, [pc, #84]	; (c0d049e0 <signTx_handleDHEnd_ui_runStep+0x5c>)
c0d0498c:	5928      	ldr	r0, [r5, r4]
c0d0498e:	26e1      	movs	r6, #225	; 0xe1
c0d04990:	00b7      	lsls	r7, r6, #2
c0d04992:	42b8      	cmp	r0, r7
c0d04994:	d00f      	beq.n	c0d049b6 <signTx_handleDHEnd_ui_runStep+0x32>
c0d04996:	4913      	ldr	r1, [pc, #76]	; (c0d049e4 <signTx_handleDHEnd_ui_runStep+0x60>)
c0d04998:	4288      	cmp	r0, r1
c0d0499a:	d119      	bne.n	c0d049d0 <signTx_handleDHEnd_ui_runStep+0x4c>
c0d0499c:	201d      	movs	r0, #29
c0d0499e:	0140      	lsls	r0, r0, #5
c0d049a0:	5c2a      	ldrb	r2, [r5, r0]
c0d049a2:	2009      	movs	r0, #9
c0d049a4:	0300      	lsls	r0, r0, #12
c0d049a6:	4910      	ldr	r1, [pc, #64]	; (c0d049e8 <signTx_handleDHEnd_ui_runStep+0x64>)
c0d049a8:	f7fd fd66 	bl	c0d02478 <io_send_buf>
c0d049ac:	f001 f920 	bl	c0d05bf0 <ui_displayBusy>
c0d049b0:	00b0      	lsls	r0, r6, #2
c0d049b2:	1c87      	adds	r7, r0, #2
c0d049b4:	e012      	b.n	c0d049dc <signTx_handleDHEnd_ui_runStep+0x58>
c0d049b6:	480e      	ldr	r0, [pc, #56]	; (c0d049f0 <signTx_handleDHEnd_ui_runStep+0x6c>)
c0d049b8:	4478      	add	r0, pc
c0d049ba:	490e      	ldr	r1, [pc, #56]	; (c0d049f4 <signTx_handleDHEnd_ui_runStep+0x70>)
c0d049bc:	4479      	add	r1, pc
c0d049be:	4a0e      	ldr	r2, [pc, #56]	; (c0d049f8 <signTx_handleDHEnd_ui_runStep+0x74>)
c0d049c0:	447a      	add	r2, pc
c0d049c2:	4b0e      	ldr	r3, [pc, #56]	; (c0d049fc <signTx_handleDHEnd_ui_runStep+0x78>)
c0d049c4:	447b      	add	r3, pc
c0d049c6:	f000 ff5b 	bl	c0d05880 <ui_displayPrompt>
c0d049ca:	00b0      	lsls	r0, r6, #2
c0d049cc:	1c47      	adds	r7, r0, #1
c0d049ce:	e005      	b.n	c0d049dc <signTx_handleDHEnd_ui_runStep+0x58>
c0d049d0:	4806      	ldr	r0, [pc, #24]	; (c0d049ec <signTx_handleDHEnd_ui_runStep+0x68>)
c0d049d2:	4478      	add	r0, pc
c0d049d4:	1c41      	adds	r1, r0, #1
c0d049d6:	2000      	movs	r0, #0
c0d049d8:	f7fb fc42 	bl	c0d00260 <assert>
c0d049dc:	512f      	str	r7, [r5, r4]
c0d049de:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d049e0:	20000518 	.word	0x20000518
c0d049e4:	00000385 	.word	0x00000385
c0d049e8:	20000398 	.word	0x20000398
c0d049ec:	00003c91 	.word	0x00003c91
c0d049f0:	00003cc5 	.word	0x00003cc5
c0d049f4:	00003056 	.word	0x00003056
c0d049f8:	ffffffc1 	.word	0xffffffc1
c0d049fc:	00001039 	.word	0x00001039

c0d04a00 <signTx_handleFinish_ui_runStep>:
c0d04a00:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d04a02:	20e7      	movs	r0, #231	; 0xe7
c0d04a04:	0084      	lsls	r4, r0, #2
c0d04a06:	4d1c      	ldr	r5, [pc, #112]	; (c0d04a78 <signTx_handleFinish_ui_runStep+0x78>)
c0d04a08:	5928      	ldr	r0, [r5, r4]
c0d04a0a:	267d      	movs	r6, #125	; 0x7d
c0d04a0c:	00f7      	lsls	r7, r6, #3
c0d04a0e:	42b8      	cmp	r0, r7
c0d04a10:	d012      	beq.n	c0d04a38 <signTx_handleFinish_ui_runStep+0x38>
c0d04a12:	491a      	ldr	r1, [pc, #104]	; (c0d04a7c <signTx_handleFinish_ui_runStep+0x7c>)
c0d04a14:	4288      	cmp	r0, r1
c0d04a16:	d01a      	beq.n	c0d04a4e <signTx_handleFinish_ui_runStep+0x4e>
c0d04a18:	4919      	ldr	r1, [pc, #100]	; (c0d04a80 <signTx_handleFinish_ui_runStep+0x80>)
c0d04a1a:	4288      	cmp	r0, r1
c0d04a1c:	d124      	bne.n	c0d04a68 <signTx_handleFinish_ui_runStep+0x68>
c0d04a1e:	2009      	movs	r0, #9
c0d04a20:	0300      	lsls	r0, r0, #12
c0d04a22:	4918      	ldr	r1, [pc, #96]	; (c0d04a84 <signTx_handleFinish_ui_runStep+0x84>)
c0d04a24:	2261      	movs	r2, #97	; 0x61
c0d04a26:	f7fd fd27 	bl	c0d02478 <io_send_buf>
c0d04a2a:	f001 f8e1 	bl	c0d05bf0 <ui_displayBusy>
c0d04a2e:	f7fb fb33 	bl	c0d00098 <ui_idle>
c0d04a32:	00f0      	lsls	r0, r6, #3
c0d04a34:	1cc7      	adds	r7, r0, #3
c0d04a36:	e01d      	b.n	c0d04a74 <signTx_handleFinish_ui_runStep+0x74>
c0d04a38:	4813      	ldr	r0, [pc, #76]	; (c0d04a88 <signTx_handleFinish_ui_runStep+0x88>)
c0d04a3a:	1828      	adds	r0, r5, r0
c0d04a3c:	4913      	ldr	r1, [pc, #76]	; (c0d04a8c <signTx_handleFinish_ui_runStep+0x8c>)
c0d04a3e:	1869      	adds	r1, r5, r1
c0d04a40:	4a14      	ldr	r2, [pc, #80]	; (c0d04a94 <signTx_handleFinish_ui_runStep+0x94>)
c0d04a42:	447a      	add	r2, pc
c0d04a44:	f000 ff78 	bl	c0d05938 <ui_displayPaginatedText>
c0d04a48:	00f0      	lsls	r0, r6, #3
c0d04a4a:	1c47      	adds	r7, r0, #1
c0d04a4c:	e012      	b.n	c0d04a74 <signTx_handleFinish_ui_runStep+0x74>
c0d04a4e:	4812      	ldr	r0, [pc, #72]	; (c0d04a98 <signTx_handleFinish_ui_runStep+0x98>)
c0d04a50:	4478      	add	r0, pc
c0d04a52:	4912      	ldr	r1, [pc, #72]	; (c0d04a9c <signTx_handleFinish_ui_runStep+0x9c>)
c0d04a54:	4479      	add	r1, pc
c0d04a56:	4a12      	ldr	r2, [pc, #72]	; (c0d04aa0 <signTx_handleFinish_ui_runStep+0xa0>)
c0d04a58:	447a      	add	r2, pc
c0d04a5a:	4b12      	ldr	r3, [pc, #72]	; (c0d04aa4 <signTx_handleFinish_ui_runStep+0xa4>)
c0d04a5c:	447b      	add	r3, pc
c0d04a5e:	f000 ff0f 	bl	c0d05880 <ui_displayPrompt>
c0d04a62:	00f0      	lsls	r0, r6, #3
c0d04a64:	1c87      	adds	r7, r0, #2
c0d04a66:	e005      	b.n	c0d04a74 <signTx_handleFinish_ui_runStep+0x74>
c0d04a68:	4809      	ldr	r0, [pc, #36]	; (c0d04a90 <signTx_handleFinish_ui_runStep+0x90>)
c0d04a6a:	4478      	add	r0, pc
c0d04a6c:	1c41      	adds	r1, r0, #1
c0d04a6e:	2000      	movs	r0, #0
c0d04a70:	f7fb fbf6 	bl	c0d00260 <assert>
c0d04a74:	512f      	str	r7, [r5, r4]
c0d04a76:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d04a78:	20000518 	.word	0x20000518
c0d04a7c:	000003e9 	.word	0x000003e9
c0d04a80:	000003ea 	.word	0x000003ea
c0d04a84:	20000398 	.word	0x20000398
c0d04a88:	000003a1 	.word	0x000003a1
c0d04a8c:	000003b5 	.word	0x000003b5
c0d04a90:	00003c40 	.word	0x00003c40
c0d04a94:	ffffffbb 	.word	0xffffffbb
c0d04a98:	00003c74 	.word	0x00003c74
c0d04a9c:	00003c75 	.word	0x00003c75
c0d04aa0:	ffffffa5 	.word	0xffffffa5
c0d04aa4:	00000fa1 	.word	0x00000fa1

c0d04aa8 <countedSectionInit>:
c0d04aa8:	b510      	push	{r4, lr}
c0d04aaa:	4604      	mov	r4, r0
c0d04aac:	211c      	movs	r1, #28
c0d04aae:	f002 fde5 	bl	c0d0767c <explicit_bzero>
c0d04ab2:	4801      	ldr	r0, [pc, #4]	; (c0d04ab8 <countedSectionInit+0x10>)
c0d04ab4:	6020      	str	r0, [r4, #0]
c0d04ab6:	bd10      	pop	{r4, pc}
c0d04ab8:	00003039 	.word	0x00003039

c0d04abc <countedSectionBegin>:
c0d04abc:	b5b0      	push	{r4, r5, r7, lr}
c0d04abe:	460c      	mov	r4, r1
c0d04ac0:	4605      	mov	r5, r0
c0d04ac2:	6800      	ldr	r0, [r0, #0]
c0d04ac4:	490b      	ldr	r1, [pc, #44]	; (c0d04af4 <countedSectionBegin+0x38>)
c0d04ac6:	1841      	adds	r1, r0, r1
c0d04ac8:	4248      	negs	r0, r1
c0d04aca:	4148      	adcs	r0, r1
c0d04acc:	490a      	ldr	r1, [pc, #40]	; (c0d04af8 <countedSectionBegin+0x3c>)
c0d04ace:	4479      	add	r1, pc
c0d04ad0:	310e      	adds	r1, #14
c0d04ad2:	f7fb fbc5 	bl	c0d00260 <assert>
c0d04ad6:	7e28      	ldrb	r0, [r5, #24]
c0d04ad8:	2804      	cmp	r0, #4
c0d04ada:	d804      	bhi.n	c0d04ae6 <countedSectionBegin+0x2a>
c0d04adc:	1c41      	adds	r1, r0, #1
c0d04ade:	7629      	strb	r1, [r5, #24]
c0d04ae0:	0081      	lsls	r1, r0, #2
c0d04ae2:	1869      	adds	r1, r5, r1
c0d04ae4:	604c      	str	r4, [r1, #4]
c0d04ae6:	2805      	cmp	r0, #5
c0d04ae8:	d301      	bcc.n	c0d04aee <countedSectionBegin+0x32>
c0d04aea:	2000      	movs	r0, #0
c0d04aec:	bdb0      	pop	{r4, r5, r7, pc}
c0d04aee:	2001      	movs	r0, #1
c0d04af0:	bdb0      	pop	{r4, r5, r7, pc}
c0d04af2:	46c0      	nop			; (mov r8, r8)
c0d04af4:	ffffcfc7 	.word	0xffffcfc7
c0d04af8:	00003c58 	.word	0x00003c58

c0d04afc <countedSectionProcess>:
c0d04afc:	b570      	push	{r4, r5, r6, lr}
c0d04afe:	460c      	mov	r4, r1
c0d04b00:	4605      	mov	r5, r0
c0d04b02:	6800      	ldr	r0, [r0, #0]
c0d04b04:	4912      	ldr	r1, [pc, #72]	; (c0d04b50 <countedSectionProcess+0x54>)
c0d04b06:	1841      	adds	r1, r0, r1
c0d04b08:	4248      	negs	r0, r1
c0d04b0a:	4148      	adcs	r0, r1
c0d04b0c:	4911      	ldr	r1, [pc, #68]	; (c0d04b54 <countedSectionProcess+0x58>)
c0d04b0e:	4479      	add	r1, pc
c0d04b10:	310e      	adds	r1, #14
c0d04b12:	f7fb fba5 	bl	c0d00260 <assert>
c0d04b16:	7e28      	ldrb	r0, [r5, #24]
c0d04b18:	2600      	movs	r6, #0
c0d04b1a:	2806      	cmp	r0, #6
c0d04b1c:	d301      	bcc.n	c0d04b22 <countedSectionProcess+0x26>
c0d04b1e:	4630      	mov	r0, r6
c0d04b20:	e000      	b.n	c0d04b24 <countedSectionProcess+0x28>
c0d04b22:	2001      	movs	r0, #1
c0d04b24:	490c      	ldr	r1, [pc, #48]	; (c0d04b58 <countedSectionProcess+0x5c>)
c0d04b26:	4479      	add	r1, pc
c0d04b28:	310e      	adds	r1, #14
c0d04b2a:	f7fb fb99 	bl	c0d00260 <assert>
c0d04b2e:	1d29      	adds	r1, r5, #4
c0d04b30:	7e28      	ldrb	r0, [r5, #24]
c0d04b32:	42b0      	cmp	r0, r6
c0d04b34:	d006      	beq.n	c0d04b44 <countedSectionProcess+0x48>
c0d04b36:	680a      	ldr	r2, [r1, #0]
c0d04b38:	42a2      	cmp	r2, r4
c0d04b3a:	d303      	bcc.n	c0d04b44 <countedSectionProcess+0x48>
c0d04b3c:	1b12      	subs	r2, r2, r4
c0d04b3e:	c104      	stmia	r1!, {r2}
c0d04b40:	1c76      	adds	r6, r6, #1
c0d04b42:	e7f6      	b.n	c0d04b32 <countedSectionProcess+0x36>
c0d04b44:	4286      	cmp	r6, r0
c0d04b46:	d201      	bcs.n	c0d04b4c <countedSectionProcess+0x50>
c0d04b48:	2000      	movs	r0, #0
c0d04b4a:	bd70      	pop	{r4, r5, r6, pc}
c0d04b4c:	2001      	movs	r0, #1
c0d04b4e:	bd70      	pop	{r4, r5, r6, pc}
c0d04b50:	ffffcfc7 	.word	0xffffcfc7
c0d04b54:	00003c3f 	.word	0x00003c3f
c0d04b58:	00003c4e 	.word	0x00003c4e

c0d04b5c <countedSectionEnd>:
c0d04b5c:	b5b0      	push	{r4, r5, r7, lr}
c0d04b5e:	4604      	mov	r4, r0
c0d04b60:	6800      	ldr	r0, [r0, #0]
c0d04b62:	4910      	ldr	r1, [pc, #64]	; (c0d04ba4 <countedSectionEnd+0x48>)
c0d04b64:	1841      	adds	r1, r0, r1
c0d04b66:	4248      	negs	r0, r1
c0d04b68:	4148      	adcs	r0, r1
c0d04b6a:	490f      	ldr	r1, [pc, #60]	; (c0d04ba8 <countedSectionEnd+0x4c>)
c0d04b6c:	4479      	add	r1, pc
c0d04b6e:	310e      	adds	r1, #14
c0d04b70:	f7fb fb76 	bl	c0d00260 <assert>
c0d04b74:	7e20      	ldrb	r0, [r4, #24]
c0d04b76:	2500      	movs	r5, #0
c0d04b78:	2806      	cmp	r0, #6
c0d04b7a:	d301      	bcc.n	c0d04b80 <countedSectionEnd+0x24>
c0d04b7c:	4628      	mov	r0, r5
c0d04b7e:	e000      	b.n	c0d04b82 <countedSectionEnd+0x26>
c0d04b80:	2001      	movs	r0, #1
c0d04b82:	490a      	ldr	r1, [pc, #40]	; (c0d04bac <countedSectionEnd+0x50>)
c0d04b84:	4479      	add	r1, pc
c0d04b86:	310e      	adds	r1, #14
c0d04b88:	f7fb fb6a 	bl	c0d00260 <assert>
c0d04b8c:	7e20      	ldrb	r0, [r4, #24]
c0d04b8e:	2800      	cmp	r0, #0
c0d04b90:	d006      	beq.n	c0d04ba0 <countedSectionEnd+0x44>
c0d04b92:	0081      	lsls	r1, r0, #2
c0d04b94:	5909      	ldr	r1, [r1, r4]
c0d04b96:	2900      	cmp	r1, #0
c0d04b98:	d102      	bne.n	c0d04ba0 <countedSectionEnd+0x44>
c0d04b9a:	1e40      	subs	r0, r0, #1
c0d04b9c:	7620      	strb	r0, [r4, #24]
c0d04b9e:	2501      	movs	r5, #1
c0d04ba0:	4628      	mov	r0, r5
c0d04ba2:	bdb0      	pop	{r4, r5, r7, pc}
c0d04ba4:	ffffcfc7 	.word	0xffffcfc7
c0d04ba8:	00003c2f 	.word	0x00003c2f
c0d04bac:	00003c3e 	.word	0x00003c3e

c0d04bb0 <countedSectionFinalize>:
c0d04bb0:	b510      	push	{r4, lr}
c0d04bb2:	4604      	mov	r4, r0
c0d04bb4:	6800      	ldr	r0, [r0, #0]
c0d04bb6:	4906      	ldr	r1, [pc, #24]	; (c0d04bd0 <countedSectionFinalize+0x20>)
c0d04bb8:	1841      	adds	r1, r0, r1
c0d04bba:	4248      	negs	r0, r1
c0d04bbc:	4148      	adcs	r0, r1
c0d04bbe:	4905      	ldr	r1, [pc, #20]	; (c0d04bd4 <countedSectionFinalize+0x24>)
c0d04bc0:	4479      	add	r1, pc
c0d04bc2:	310e      	adds	r1, #14
c0d04bc4:	f7fb fb4c 	bl	c0d00260 <assert>
c0d04bc8:	7e21      	ldrb	r1, [r4, #24]
c0d04bca:	4248      	negs	r0, r1
c0d04bcc:	4148      	adcs	r0, r1
c0d04bce:	bd10      	pop	{r4, pc}
c0d04bd0:	ffffcfc7 	.word	0xffffcfc7
c0d04bd4:	00003c29 	.word	0x00003c29

c0d04bd8 <integrityCheckInit>:
c0d04bd8:	b510      	push	{r4, lr}
c0d04bda:	4604      	mov	r4, r0
c0d04bdc:	2122      	movs	r1, #34	; 0x22
c0d04bde:	f002 fd4d 	bl	c0d0767c <explicit_bzero>
c0d04be2:	4801      	ldr	r0, [pc, #4]	; (c0d04be8 <integrityCheckInit+0x10>)
c0d04be4:	8020      	strh	r0, [r4, #0]
c0d04be6:	bd10      	pop	{r4, pc}
c0d04be8:	00003039 	.word	0x00003039

c0d04bec <integrityCheckProcessInstruction>:
c0d04bec:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d04bee:	b0ad      	sub	sp, #180	; 0xb4
c0d04bf0:	9307      	str	r3, [sp, #28]
c0d04bf2:	9008      	str	r0, [sp, #32]
c0d04bf4:	ab2b      	add	r3, sp, #172	; 0xac
c0d04bf6:	9303      	str	r3, [sp, #12]
c0d04bf8:	701a      	strb	r2, [r3, #0]
c0d04bfa:	aa2c      	add	r2, sp, #176	; 0xb0
c0d04bfc:	9202      	str	r2, [sp, #8]
c0d04bfe:	7011      	strb	r1, [r2, #0]
c0d04c00:	a92a      	add	r1, sp, #168	; 0xa8
c0d04c02:	9104      	str	r1, [sp, #16]
c0d04c04:	9a32      	ldr	r2, [sp, #200]	; 0xc8
c0d04c06:	700a      	strb	r2, [r1, #0]
c0d04c08:	8802      	ldrh	r2, [r0, #0]
c0d04c0a:	4943      	ldr	r1, [pc, #268]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04c0c:	1851      	adds	r1, r2, r1
c0d04c0e:	4248      	negs	r0, r1
c0d04c10:	4148      	adcs	r0, r1
c0d04c12:	4943      	ldr	r1, [pc, #268]	; (c0d04d20 <integrityCheckProcessInstruction+0x134>)
c0d04c14:	4479      	add	r1, pc
c0d04c16:	310a      	adds	r1, #10
c0d04c18:	4c42      	ldr	r4, [pc, #264]	; (c0d04d24 <integrityCheckProcessInstruction+0x138>)
c0d04c1a:	447c      	add	r4, pc
c0d04c1c:	47a0      	blx	r4
c0d04c1e:	4627      	mov	r7, r4
c0d04c20:	940a      	str	r4, [sp, #40]	; 0x28
c0d04c22:	ac0e      	add	r4, sp, #56	; 0x38
c0d04c24:	940c      	str	r4, [sp, #48]	; 0x30
c0d04c26:	1d25      	adds	r5, r4, #4
c0d04c28:	4628      	mov	r0, r5
c0d04c2a:	f7fb fc9b 	bl	c0d00564 <cx_sha256_init_no_throw>
c0d04c2e:	483b      	ldr	r0, [pc, #236]	; (c0d04d1c <integrityCheckProcessInstruction+0x130>)
c0d04c30:	8020      	strh	r0, [r4, #0]
c0d04c32:	2001      	movs	r0, #1
c0d04c34:	900d      	str	r0, [sp, #52]	; 0x34
c0d04c36:	4e3c      	ldr	r6, [pc, #240]	; (c0d04d28 <integrityCheckProcessInstruction+0x13c>)
c0d04c38:	447e      	add	r6, pc
c0d04c3a:	4631      	mov	r1, r6
c0d04c3c:	47b8      	blx	r7
c0d04c3e:	2700      	movs	r7, #0
c0d04c40:	9700      	str	r7, [sp, #0]
c0d04c42:	9701      	str	r7, [sp, #4]
c0d04c44:	9808      	ldr	r0, [sp, #32]
c0d04c46:	1c82      	adds	r2, r0, #2
c0d04c48:	9206      	str	r2, [sp, #24]
c0d04c4a:	2320      	movs	r3, #32
c0d04c4c:	9305      	str	r3, [sp, #20]
c0d04c4e:	4c37      	ldr	r4, [pc, #220]	; (c0d04d2c <integrityCheckProcessInstruction+0x140>)
c0d04c50:	447c      	add	r4, pc
c0d04c52:	9408      	str	r4, [sp, #32]
c0d04c54:	950b      	str	r5, [sp, #44]	; 0x2c
c0d04c56:	4628      	mov	r0, r5
c0d04c58:	4639      	mov	r1, r7
c0d04c5a:	47a0      	blx	r4
c0d04c5c:	9c0c      	ldr	r4, [sp, #48]	; 0x30
c0d04c5e:	8820      	ldrh	r0, [r4, #0]
c0d04c60:	492d      	ldr	r1, [pc, #180]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04c62:	1841      	adds	r1, r0, r1
c0d04c64:	4248      	negs	r0, r1
c0d04c66:	4148      	adcs	r0, r1
c0d04c68:	4631      	mov	r1, r6
c0d04c6a:	9609      	str	r6, [sp, #36]	; 0x24
c0d04c6c:	9a0a      	ldr	r2, [sp, #40]	; 0x28
c0d04c6e:	4790      	blx	r2
c0d04c70:	9700      	str	r7, [sp, #0]
c0d04c72:	9701      	str	r7, [sp, #4]
c0d04c74:	4628      	mov	r0, r5
c0d04c76:	4639      	mov	r1, r7
c0d04c78:	9a02      	ldr	r2, [sp, #8]
c0d04c7a:	9b0d      	ldr	r3, [sp, #52]	; 0x34
c0d04c7c:	9d08      	ldr	r5, [sp, #32]
c0d04c7e:	47a8      	blx	r5
c0d04c80:	8820      	ldrh	r0, [r4, #0]
c0d04c82:	4925      	ldr	r1, [pc, #148]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04c84:	1841      	adds	r1, r0, r1
c0d04c86:	4248      	negs	r0, r1
c0d04c88:	4148      	adcs	r0, r1
c0d04c8a:	4631      	mov	r1, r6
c0d04c8c:	9c0a      	ldr	r4, [sp, #40]	; 0x28
c0d04c8e:	47a0      	blx	r4
c0d04c90:	9700      	str	r7, [sp, #0]
c0d04c92:	9701      	str	r7, [sp, #4]
c0d04c94:	9e0b      	ldr	r6, [sp, #44]	; 0x2c
c0d04c96:	4630      	mov	r0, r6
c0d04c98:	4639      	mov	r1, r7
c0d04c9a:	9a03      	ldr	r2, [sp, #12]
c0d04c9c:	9b0d      	ldr	r3, [sp, #52]	; 0x34
c0d04c9e:	47a8      	blx	r5
c0d04ca0:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d04ca2:	8800      	ldrh	r0, [r0, #0]
c0d04ca4:	491c      	ldr	r1, [pc, #112]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04ca6:	1841      	adds	r1, r0, r1
c0d04ca8:	4248      	negs	r0, r1
c0d04caa:	4148      	adcs	r0, r1
c0d04cac:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d04cae:	4625      	mov	r5, r4
c0d04cb0:	47a0      	blx	r4
c0d04cb2:	9700      	str	r7, [sp, #0]
c0d04cb4:	9701      	str	r7, [sp, #4]
c0d04cb6:	4630      	mov	r0, r6
c0d04cb8:	4639      	mov	r1, r7
c0d04cba:	9c04      	ldr	r4, [sp, #16]
c0d04cbc:	4622      	mov	r2, r4
c0d04cbe:	9b0d      	ldr	r3, [sp, #52]	; 0x34
c0d04cc0:	9e08      	ldr	r6, [sp, #32]
c0d04cc2:	47b0      	blx	r6
c0d04cc4:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d04cc6:	8800      	ldrh	r0, [r0, #0]
c0d04cc8:	4913      	ldr	r1, [pc, #76]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04cca:	1841      	adds	r1, r0, r1
c0d04ccc:	4248      	negs	r0, r1
c0d04cce:	4148      	adcs	r0, r1
c0d04cd0:	7824      	ldrb	r4, [r4, #0]
c0d04cd2:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d04cd4:	47a8      	blx	r5
c0d04cd6:	9700      	str	r7, [sp, #0]
c0d04cd8:	9701      	str	r7, [sp, #4]
c0d04cda:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d04cdc:	4639      	mov	r1, r7
c0d04cde:	9a07      	ldr	r2, [sp, #28]
c0d04ce0:	4623      	mov	r3, r4
c0d04ce2:	47b0      	blx	r6
c0d04ce4:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d04ce6:	8800      	ldrh	r0, [r0, #0]
c0d04ce8:	490b      	ldr	r1, [pc, #44]	; (c0d04d18 <integrityCheckProcessInstruction+0x12c>)
c0d04cea:	1841      	adds	r1, r0, r1
c0d04cec:	4248      	negs	r0, r1
c0d04cee:	4148      	adcs	r0, r1
c0d04cf0:	490f      	ldr	r1, [pc, #60]	; (c0d04d30 <integrityCheckProcessInstruction+0x144>)
c0d04cf2:	4479      	add	r1, pc
c0d04cf4:	47a8      	blx	r5
c0d04cf6:	490f      	ldr	r1, [pc, #60]	; (c0d04d34 <integrityCheckProcessInstruction+0x148>)
c0d04cf8:	4479      	add	r1, pc
c0d04cfa:	9c0d      	ldr	r4, [sp, #52]	; 0x34
c0d04cfc:	4620      	mov	r0, r4
c0d04cfe:	47a8      	blx	r5
c0d04d00:	9806      	ldr	r0, [sp, #24]
c0d04d02:	9000      	str	r0, [sp, #0]
c0d04d04:	9805      	ldr	r0, [sp, #20]
c0d04d06:	9001      	str	r0, [sp, #4]
c0d04d08:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d04d0a:	4621      	mov	r1, r4
c0d04d0c:	463a      	mov	r2, r7
c0d04d0e:	463b      	mov	r3, r7
c0d04d10:	47b0      	blx	r6
c0d04d12:	b02d      	add	sp, #180	; 0xb4
c0d04d14:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d04d16:	46c0      	nop			; (mov r8, r8)
c0d04d18:	ffffcfc7 	.word	0xffffcfc7
c0d04d1c:	00003039 	.word	0x00003039
c0d04d20:	00003bfc 	.word	0x00003bfc
c0d04d24:	ffffb643 	.word	0xffffb643
c0d04d28:	000039c5 	.word	0x000039c5
c0d04d2c:	00000145 	.word	0x00000145
c0d04d30:	0000399c 	.word	0x0000399c
c0d04d34:	000039a4 	.word	0x000039a4

c0d04d38 <_integrityCheckEvaluate>:
c0d04d38:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d04d3a:	4614      	mov	r4, r2
c0d04d3c:	460d      	mov	r5, r1
c0d04d3e:	4606      	mov	r6, r0
c0d04d40:	8800      	ldrh	r0, [r0, #0]
c0d04d42:	490e      	ldr	r1, [pc, #56]	; (c0d04d7c <_integrityCheckEvaluate+0x44>)
c0d04d44:	1841      	adds	r1, r0, r1
c0d04d46:	4248      	negs	r0, r1
c0d04d48:	4148      	adcs	r0, r1
c0d04d4a:	490d      	ldr	r1, [pc, #52]	; (c0d04d80 <_integrityCheckEvaluate+0x48>)
c0d04d4c:	4479      	add	r1, pc
c0d04d4e:	310a      	adds	r1, #10
c0d04d50:	f7fb fa86 	bl	c0d00260 <assert>
c0d04d54:	1cb6      	adds	r6, r6, #2
c0d04d56:	2100      	movs	r1, #0
c0d04d58:	460f      	mov	r7, r1
c0d04d5a:	428c      	cmp	r4, r1
c0d04d5c:	d008      	beq.n	c0d04d70 <_integrityCheckEvaluate+0x38>
c0d04d5e:	2220      	movs	r2, #32
c0d04d60:	4630      	mov	r0, r6
c0d04d62:	4629      	mov	r1, r5
c0d04d64:	f002 fc8e 	bl	c0d07684 <memcmp>
c0d04d68:	3520      	adds	r5, #32
c0d04d6a:	1c79      	adds	r1, r7, #1
c0d04d6c:	2800      	cmp	r0, #0
c0d04d6e:	d1f3      	bne.n	c0d04d58 <_integrityCheckEvaluate+0x20>
c0d04d70:	42a7      	cmp	r7, r4
c0d04d72:	d301      	bcc.n	c0d04d78 <_integrityCheckEvaluate+0x40>
c0d04d74:	2000      	movs	r0, #0
c0d04d76:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d04d78:	2001      	movs	r0, #1
c0d04d7a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d04d7c:	ffffcfc7 	.word	0xffffcfc7
c0d04d80:	00003ae7 	.word	0x00003ae7

c0d04d84 <integrityCheckEvaluate>:
c0d04d84:	b580      	push	{r7, lr}
c0d04d86:	4903      	ldr	r1, [pc, #12]	; (c0d04d94 <integrityCheckEvaluate+0x10>)
c0d04d88:	4479      	add	r1, pc
c0d04d8a:	2253      	movs	r2, #83	; 0x53
c0d04d8c:	f7ff ffd4 	bl	c0d04d38 <_integrityCheckEvaluate>
c0d04d90:	bd80      	pop	{r7, pc}
c0d04d92:	46c0      	nop			; (mov r8, r8)
c0d04d94:	00003ace 	.word	0x00003ace

c0d04d98 <cx_hash>:
c0d04d98:	b51c      	push	{r2, r3, r4, lr}
c0d04d9a:	4604      	mov	r4, r0
c0d04d9c:	9805      	ldr	r0, [sp, #20]
c0d04d9e:	9001      	str	r0, [sp, #4]
c0d04da0:	9804      	ldr	r0, [sp, #16]
c0d04da2:	9000      	str	r0, [sp, #0]
c0d04da4:	4620      	mov	r0, r4
c0d04da6:	f7fb fbb3 	bl	c0d00510 <cx_hash_no_throw>
c0d04daa:	2800      	cmp	r0, #0
c0d04dac:	d103      	bne.n	c0d04db6 <cx_hash+0x1e>
c0d04dae:	4620      	mov	r0, r4
c0d04db0:	f7fb fba8 	bl	c0d00504 <cx_hash_get_size>
c0d04db4:	bd1c      	pop	{r2, r3, r4, pc}
c0d04db6:	f7fd ff4e 	bl	c0d02c56 <os_longjmp>
	...

c0d04dbc <bufferValidation>:
c0d04dbc:	b5b0      	push	{r4, r5, r7, lr}
c0d04dbe:	2903      	cmp	r1, #3
c0d04dc0:	d00a      	beq.n	c0d04dd8 <bufferValidation+0x1c>
c0d04dc2:	9805      	ldr	r0, [sp, #20]
c0d04dc4:	9c04      	ldr	r4, [sp, #16]
c0d04dc6:	2902      	cmp	r1, #2
c0d04dc8:	d00b      	beq.n	c0d04de2 <bufferValidation+0x26>
c0d04dca:	2901      	cmp	r1, #1
c0d04dcc:	d113      	bne.n	c0d04df6 <bufferValidation+0x3a>
c0d04dce:	4314      	orrs	r4, r2
c0d04dd0:	4318      	orrs	r0, r3
c0d04dd2:	4320      	orrs	r0, r4
c0d04dd4:	d00e      	beq.n	c0d04df4 <bufferValidation+0x38>
c0d04dd6:	e00e      	b.n	c0d04df6 <bufferValidation+0x3a>
c0d04dd8:	21f0      	movs	r1, #240	; 0xf0
c0d04dda:	4008      	ands	r0, r1
c0d04ddc:	2810      	cmp	r0, #16
c0d04dde:	d009      	beq.n	c0d04df4 <bufferValidation+0x38>
c0d04de0:	e009      	b.n	c0d04df6 <bufferValidation+0x3a>
c0d04de2:	9d07      	ldr	r5, [sp, #28]
c0d04de4:	2100      	movs	r1, #0
c0d04de6:	1aaa      	subs	r2, r5, r2
c0d04de8:	460a      	mov	r2, r1
c0d04dea:	419a      	sbcs	r2, r3
c0d04dec:	d303      	bcc.n	c0d04df6 <bufferValidation+0x3a>
c0d04dee:	1b62      	subs	r2, r4, r5
c0d04df0:	4188      	sbcs	r0, r1
c0d04df2:	d300      	bcc.n	c0d04df6 <bufferValidation+0x3a>
c0d04df4:	bdb0      	pop	{r4, r5, r7, pc}
c0d04df6:	4801      	ldr	r0, [pc, #4]	; (c0d04dfc <bufferValidation+0x40>)
c0d04df8:	f7fd ff2d 	bl	c0d02c56 <os_longjmp>
c0d04dfc:	00006e07 	.word	0x00006e07

c0d04e00 <parseValueToUInt64>:
c0d04e00:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d04e02:	b091      	sub	sp, #68	; 0x44
c0d04e04:	9108      	str	r1, [sp, #32]
c0d04e06:	9010      	str	r0, [sp, #64]	; 0x40
c0d04e08:	7990      	ldrb	r0, [r2, #6]
c0d04e0a:	900f      	str	r0, [sp, #60]	; 0x3c
c0d04e0c:	79d0      	ldrb	r0, [r2, #7]
c0d04e0e:	900e      	str	r0, [sp, #56]	; 0x38
c0d04e10:	7910      	ldrb	r0, [r2, #4]
c0d04e12:	900d      	str	r0, [sp, #52]	; 0x34
c0d04e14:	7950      	ldrb	r0, [r2, #5]
c0d04e16:	900c      	str	r0, [sp, #48]	; 0x30
c0d04e18:	7890      	ldrb	r0, [r2, #2]
c0d04e1a:	900b      	str	r0, [sp, #44]	; 0x2c
c0d04e1c:	78d0      	ldrb	r0, [r2, #3]
c0d04e1e:	900a      	str	r0, [sp, #40]	; 0x28
c0d04e20:	7810      	ldrb	r0, [r2, #0]
c0d04e22:	9009      	str	r0, [sp, #36]	; 0x24
c0d04e24:	7850      	ldrb	r0, [r2, #1]
c0d04e26:	9007      	str	r0, [sp, #28]
c0d04e28:	7898      	ldrb	r0, [r3, #2]
c0d04e2a:	9006      	str	r0, [sp, #24]
c0d04e2c:	78de      	ldrb	r6, [r3, #3]
c0d04e2e:	781d      	ldrb	r5, [r3, #0]
c0d04e30:	785c      	ldrb	r4, [r3, #1]
c0d04e32:	799f      	ldrb	r7, [r3, #6]
c0d04e34:	79da      	ldrb	r2, [r3, #7]
c0d04e36:	7919      	ldrb	r1, [r3, #4]
c0d04e38:	795b      	ldrb	r3, [r3, #5]
c0d04e3a:	9817      	ldr	r0, [sp, #92]	; 0x5c
c0d04e3c:	9005      	str	r0, [sp, #20]
c0d04e3e:	9003      	str	r0, [sp, #12]
c0d04e40:	021b      	lsls	r3, r3, #8
c0d04e42:	1858      	adds	r0, r3, r1
c0d04e44:	0211      	lsls	r1, r2, #8
c0d04e46:	19c9      	adds	r1, r1, r7
c0d04e48:	0409      	lsls	r1, r1, #16
c0d04e4a:	180f      	adds	r7, r1, r0
c0d04e4c:	0220      	lsls	r0, r4, #8
c0d04e4e:	9c08      	ldr	r4, [sp, #32]
c0d04e50:	1940      	adds	r0, r0, r5
c0d04e52:	0231      	lsls	r1, r6, #8
c0d04e54:	9a06      	ldr	r2, [sp, #24]
c0d04e56:	1889      	adds	r1, r1, r2
c0d04e58:	0409      	lsls	r1, r1, #16
c0d04e5a:	1808      	adds	r0, r1, r0
c0d04e5c:	9006      	str	r0, [sp, #24]
c0d04e5e:	9000      	str	r0, [sp, #0]
c0d04e60:	9701      	str	r7, [sp, #4]
c0d04e62:	9807      	ldr	r0, [sp, #28]
c0d04e64:	0200      	lsls	r0, r0, #8
c0d04e66:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d04e68:	1840      	adds	r0, r0, r1
c0d04e6a:	990a      	ldr	r1, [sp, #40]	; 0x28
c0d04e6c:	0209      	lsls	r1, r1, #8
c0d04e6e:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
c0d04e70:	1889      	adds	r1, r1, r2
c0d04e72:	0409      	lsls	r1, r1, #16
c0d04e74:	180a      	adds	r2, r1, r0
c0d04e76:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d04e78:	0200      	lsls	r0, r0, #8
c0d04e7a:	990d      	ldr	r1, [sp, #52]	; 0x34
c0d04e7c:	1840      	adds	r0, r0, r1
c0d04e7e:	990e      	ldr	r1, [sp, #56]	; 0x38
c0d04e80:	0209      	lsls	r1, r1, #8
c0d04e82:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
c0d04e84:	18c9      	adds	r1, r1, r3
c0d04e86:	0409      	lsls	r1, r1, #16
c0d04e88:	180d      	adds	r5, r1, r0
c0d04e8a:	9e10      	ldr	r6, [sp, #64]	; 0x40
c0d04e8c:	4630      	mov	r0, r6
c0d04e8e:	4621      	mov	r1, r4
c0d04e90:	920f      	str	r2, [sp, #60]	; 0x3c
c0d04e92:	462b      	mov	r3, r5
c0d04e94:	f7ff ff92 	bl	c0d04dbc <bufferValidation>
c0d04e98:	4631      	mov	r1, r6
c0d04e9a:	9e18      	ldr	r6, [sp, #96]	; 0x60
c0d04e9c:	9816      	ldr	r0, [sp, #88]	; 0x58
c0d04e9e:	2917      	cmp	r1, #23
c0d04ea0:	d008      	beq.n	c0d04eb4 <parseValueToUInt64+0xb4>
c0d04ea2:	2914      	cmp	r1, #20
c0d04ea4:	d001      	beq.n	c0d04eaa <parseValueToUInt64+0xaa>
c0d04ea6:	2910      	cmp	r1, #16
c0d04ea8:	d115      	bne.n	c0d04ed6 <parseValueToUInt64+0xd6>
c0d04eaa:	9905      	ldr	r1, [sp, #20]
c0d04eac:	4632      	mov	r2, r6
c0d04eae:	f000 f817 	bl	c0d04ee0 <parseUInt64>
c0d04eb2:	e003      	b.n	c0d04ebc <parseValueToUInt64+0xbc>
c0d04eb4:	9905      	ldr	r1, [sp, #20]
c0d04eb6:	4632      	mov	r2, r6
c0d04eb8:	f000 f846 	bl	c0d04f48 <parseVarUInt32>
c0d04ebc:	ce03      	ldmia	r6!, {r0, r1}
c0d04ebe:	9a06      	ldr	r2, [sp, #24]
c0d04ec0:	9200      	str	r2, [sp, #0]
c0d04ec2:	9701      	str	r7, [sp, #4]
c0d04ec4:	9002      	str	r0, [sp, #8]
c0d04ec6:	9103      	str	r1, [sp, #12]
c0d04ec8:	4620      	mov	r0, r4
c0d04eca:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
c0d04ecc:	462b      	mov	r3, r5
c0d04ece:	f000 f827 	bl	c0d04f20 <validateNumber>
c0d04ed2:	b011      	add	sp, #68	; 0x44
c0d04ed4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d04ed6:	4801      	ldr	r0, [pc, #4]	; (c0d04edc <parseValueToUInt64+0xdc>)
c0d04ed8:	f7fd febd 	bl	c0d02c56 <os_longjmp>
c0d04edc:	00006e07 	.word	0x00006e07

c0d04ee0 <parseUInt64>:
c0d04ee0:	b5b0      	push	{r4, r5, r7, lr}
c0d04ee2:	2908      	cmp	r1, #8
c0d04ee4:	d116      	bne.n	c0d04f14 <parseUInt64+0x34>
c0d04ee6:	7801      	ldrb	r1, [r0, #0]
c0d04ee8:	7843      	ldrb	r3, [r0, #1]
c0d04eea:	021b      	lsls	r3, r3, #8
c0d04eec:	1859      	adds	r1, r3, r1
c0d04eee:	7883      	ldrb	r3, [r0, #2]
c0d04ef0:	78c4      	ldrb	r4, [r0, #3]
c0d04ef2:	0224      	lsls	r4, r4, #8
c0d04ef4:	18e3      	adds	r3, r4, r3
c0d04ef6:	041b      	lsls	r3, r3, #16
c0d04ef8:	1859      	adds	r1, r3, r1
c0d04efa:	7983      	ldrb	r3, [r0, #6]
c0d04efc:	79c4      	ldrb	r4, [r0, #7]
c0d04efe:	7905      	ldrb	r5, [r0, #4]
c0d04f00:	7940      	ldrb	r0, [r0, #5]
c0d04f02:	0200      	lsls	r0, r0, #8
c0d04f04:	1940      	adds	r0, r0, r5
c0d04f06:	0224      	lsls	r4, r4, #8
c0d04f08:	18e3      	adds	r3, r4, r3
c0d04f0a:	041b      	lsls	r3, r3, #16
c0d04f0c:	1818      	adds	r0, r3, r0
c0d04f0e:	6011      	str	r1, [r2, #0]
c0d04f10:	6050      	str	r0, [r2, #4]
c0d04f12:	bdb0      	pop	{r4, r5, r7, pc}
c0d04f14:	4801      	ldr	r0, [pc, #4]	; (c0d04f1c <parseUInt64+0x3c>)
c0d04f16:	f7fd fe9e 	bl	c0d02c56 <os_longjmp>
c0d04f1a:	46c0      	nop			; (mov r8, r8)
c0d04f1c:	00006e07 	.word	0x00006e07

c0d04f20 <validateNumber>:
c0d04f20:	b580      	push	{r7, lr}
c0d04f22:	2803      	cmp	r0, #3
c0d04f24:	d10a      	bne.n	c0d04f3c <validateNumber+0x1c>
c0d04f26:	9805      	ldr	r0, [sp, #20]
c0d04f28:	9904      	ldr	r1, [sp, #16]
c0d04f2a:	1a8a      	subs	r2, r1, r2
c0d04f2c:	4602      	mov	r2, r0
c0d04f2e:	419a      	sbcs	r2, r3
c0d04f30:	d305      	bcc.n	c0d04f3e <validateNumber+0x1e>
c0d04f32:	9a03      	ldr	r2, [sp, #12]
c0d04f34:	9b02      	ldr	r3, [sp, #8]
c0d04f36:	1a59      	subs	r1, r3, r1
c0d04f38:	4182      	sbcs	r2, r0
c0d04f3a:	d300      	bcc.n	c0d04f3e <validateNumber+0x1e>
c0d04f3c:	bd80      	pop	{r7, pc}
c0d04f3e:	4801      	ldr	r0, [pc, #4]	; (c0d04f44 <validateNumber+0x24>)
c0d04f40:	f7fd fe89 	bl	c0d02c56 <os_longjmp>
c0d04f44:	00006e07 	.word	0x00006e07

c0d04f48 <parseVarUInt32>:
c0d04f48:	b5b0      	push	{r4, r5, r7, lr}
c0d04f4a:	4614      	mov	r4, r2
c0d04f4c:	460d      	mov	r5, r1
c0d04f4e:	f000 f9f1 	bl	c0d05334 <getNumberFromVarUInt>
c0d04f52:	42a8      	cmp	r0, r5
c0d04f54:	d103      	bne.n	c0d04f5e <parseVarUInt32+0x16>
c0d04f56:	6860      	ldr	r0, [r4, #4]
c0d04f58:	2800      	cmp	r0, #0
c0d04f5a:	d100      	bne.n	c0d04f5e <parseVarUInt32+0x16>
c0d04f5c:	bdb0      	pop	{r4, r5, r7, pc}
c0d04f5e:	4801      	ldr	r0, [pc, #4]	; (c0d04f64 <parseVarUInt32+0x1c>)
c0d04f60:	f7fd fe79 	bl	c0d02c56 <os_longjmp>
c0d04f64:	00006e07 	.word	0x00006e07

c0d04f68 <parseValueToDisplay>:
c0d04f68:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d04f6a:	b095      	sub	sp, #84	; 0x54
c0d04f6c:	9110      	str	r1, [sp, #64]	; 0x40
c0d04f6e:	4607      	mov	r7, r0
c0d04f70:	7990      	ldrb	r0, [r2, #6]
c0d04f72:	900f      	str	r0, [sp, #60]	; 0x3c
c0d04f74:	79d0      	ldrb	r0, [r2, #7]
c0d04f76:	900e      	str	r0, [sp, #56]	; 0x38
c0d04f78:	7910      	ldrb	r0, [r2, #4]
c0d04f7a:	900d      	str	r0, [sp, #52]	; 0x34
c0d04f7c:	7950      	ldrb	r0, [r2, #5]
c0d04f7e:	900c      	str	r0, [sp, #48]	; 0x30
c0d04f80:	7890      	ldrb	r0, [r2, #2]
c0d04f82:	900b      	str	r0, [sp, #44]	; 0x2c
c0d04f84:	78d0      	ldrb	r0, [r2, #3]
c0d04f86:	900a      	str	r0, [sp, #40]	; 0x28
c0d04f88:	7810      	ldrb	r0, [r2, #0]
c0d04f8a:	9009      	str	r0, [sp, #36]	; 0x24
c0d04f8c:	7850      	ldrb	r0, [r2, #1]
c0d04f8e:	9008      	str	r0, [sp, #32]
c0d04f90:	7898      	ldrb	r0, [r3, #2]
c0d04f92:	9007      	str	r0, [sp, #28]
c0d04f94:	78d8      	ldrb	r0, [r3, #3]
c0d04f96:	9006      	str	r0, [sp, #24]
c0d04f98:	781e      	ldrb	r6, [r3, #0]
c0d04f9a:	785c      	ldrb	r4, [r3, #1]
c0d04f9c:	799a      	ldrb	r2, [r3, #6]
c0d04f9e:	79d9      	ldrb	r1, [r3, #7]
c0d04fa0:	7918      	ldrb	r0, [r3, #4]
c0d04fa2:	795b      	ldrb	r3, [r3, #5]
c0d04fa4:	9d1b      	ldr	r5, [sp, #108]	; 0x6c
c0d04fa6:	9511      	str	r5, [sp, #68]	; 0x44
c0d04fa8:	9503      	str	r5, [sp, #12]
c0d04faa:	021b      	lsls	r3, r3, #8
c0d04fac:	1818      	adds	r0, r3, r0
c0d04fae:	0209      	lsls	r1, r1, #8
c0d04fb0:	1889      	adds	r1, r1, r2
c0d04fb2:	0409      	lsls	r1, r1, #16
c0d04fb4:	180a      	adds	r2, r1, r0
c0d04fb6:	0220      	lsls	r0, r4, #8
c0d04fb8:	1980      	adds	r0, r0, r6
c0d04fba:	9906      	ldr	r1, [sp, #24]
c0d04fbc:	0209      	lsls	r1, r1, #8
c0d04fbe:	9b07      	ldr	r3, [sp, #28]
c0d04fc0:	18c9      	adds	r1, r1, r3
c0d04fc2:	0409      	lsls	r1, r1, #16
c0d04fc4:	1808      	adds	r0, r1, r0
c0d04fc6:	9006      	str	r0, [sp, #24]
c0d04fc8:	9000      	str	r0, [sp, #0]
c0d04fca:	9207      	str	r2, [sp, #28]
c0d04fcc:	9201      	str	r2, [sp, #4]
c0d04fce:	9808      	ldr	r0, [sp, #32]
c0d04fd0:	0200      	lsls	r0, r0, #8
c0d04fd2:	9909      	ldr	r1, [sp, #36]	; 0x24
c0d04fd4:	1840      	adds	r0, r0, r1
c0d04fd6:	990a      	ldr	r1, [sp, #40]	; 0x28
c0d04fd8:	0209      	lsls	r1, r1, #8
c0d04fda:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
c0d04fdc:	1889      	adds	r1, r1, r2
c0d04fde:	0409      	lsls	r1, r1, #16
c0d04fe0:	180a      	adds	r2, r1, r0
c0d04fe2:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d04fe4:	0200      	lsls	r0, r0, #8
c0d04fe6:	990d      	ldr	r1, [sp, #52]	; 0x34
c0d04fe8:	1840      	adds	r0, r0, r1
c0d04fea:	990e      	ldr	r1, [sp, #56]	; 0x38
c0d04fec:	0209      	lsls	r1, r1, #8
c0d04fee:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
c0d04ff0:	18c9      	adds	r1, r1, r3
c0d04ff2:	0409      	lsls	r1, r1, #16
c0d04ff4:	180e      	adds	r6, r1, r0
c0d04ff6:	4638      	mov	r0, r7
c0d04ff8:	9910      	ldr	r1, [sp, #64]	; 0x40
c0d04ffa:	460c      	mov	r4, r1
c0d04ffc:	920f      	str	r2, [sp, #60]	; 0x3c
c0d04ffe:	4633      	mov	r3, r6
c0d05000:	f7ff fedc 	bl	c0d04dbc <bufferValidation>
c0d05004:	9a1c      	ldr	r2, [sp, #112]	; 0x70
c0d05006:	9d1a      	ldr	r5, [sp, #104]	; 0x68
c0d05008:	2f21      	cmp	r7, #33	; 0x21
c0d0500a:	d027      	beq.n	c0d0505c <parseValueToDisplay+0xf4>
c0d0500c:	2f02      	cmp	r7, #2
c0d0500e:	d100      	bne.n	c0d05012 <parseValueToDisplay+0xaa>
c0d05010:	e094      	b.n	c0d0513c <parseValueToDisplay+0x1d4>
c0d05012:	2f03      	cmp	r7, #3
c0d05014:	d100      	bne.n	c0d05018 <parseValueToDisplay+0xb0>
c0d05016:	e0a4      	b.n	c0d05162 <parseValueToDisplay+0x1fa>
c0d05018:	2f04      	cmp	r7, #4
c0d0501a:	d100      	bne.n	c0d0501e <parseValueToDisplay+0xb6>
c0d0501c:	e0ab      	b.n	c0d05176 <parseValueToDisplay+0x20e>
c0d0501e:	2f10      	cmp	r7, #16
c0d05020:	d100      	bne.n	c0d05024 <parseValueToDisplay+0xbc>
c0d05022:	e0cc      	b.n	c0d051be <parseValueToDisplay+0x256>
c0d05024:	2f14      	cmp	r7, #20
c0d05026:	d100      	bne.n	c0d0502a <parseValueToDisplay+0xc2>
c0d05028:	e101      	b.n	c0d0522e <parseValueToDisplay+0x2c6>
c0d0502a:	2f17      	cmp	r7, #23
c0d0502c:	d100      	bne.n	c0d05030 <parseValueToDisplay+0xc8>
c0d0502e:	e0e7      	b.n	c0d05200 <parseValueToDisplay+0x298>
c0d05030:	2f20      	cmp	r7, #32
c0d05032:	d100      	bne.n	c0d05036 <parseValueToDisplay+0xce>
c0d05034:	e113      	b.n	c0d0525e <parseValueToDisplay+0x2f6>
c0d05036:	2f01      	cmp	r7, #1
c0d05038:	d000      	beq.n	c0d0503c <parseValueToDisplay+0xd4>
c0d0503a:	e153      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d0503c:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d0503e:	296e      	cmp	r1, #110	; 0x6e
c0d05040:	d300      	bcc.n	c0d05044 <parseValueToDisplay+0xdc>
c0d05042:	e14f      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05044:	23dc      	movs	r3, #220	; 0xdc
c0d05046:	4628      	mov	r0, r5
c0d05048:	4616      	mov	r6, r2
c0d0504a:	f7fd f993 	bl	c0d02374 <encode_hex>
c0d0504e:	4604      	mov	r4, r0
c0d05050:	2500      	movs	r5, #0
c0d05052:	28dc      	cmp	r0, #220	; 0xdc
c0d05054:	d200      	bcs.n	c0d05058 <parseValueToDisplay+0xf0>
c0d05056:	e120      	b.n	c0d0529a <parseValueToDisplay+0x332>
c0d05058:	4628      	mov	r0, r5
c0d0505a:	e11f      	b.n	c0d0529c <parseValueToDisplay+0x334>
c0d0505c:	4611      	mov	r1, r2
c0d0505e:	9a11      	ldr	r2, [sp, #68]	; 0x44
c0d05060:	2a00      	cmp	r2, #0
c0d05062:	d100      	bne.n	c0d05066 <parseValueToDisplay+0xfe>
c0d05064:	e13e      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05066:	782c      	ldrb	r4, [r5, #0]
c0d05068:	1e60      	subs	r0, r4, #1
c0d0506a:	280a      	cmp	r0, #10
c0d0506c:	d300      	bcc.n	c0d05070 <parseValueToDisplay+0x108>
c0d0506e:	e139      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05070:	1ca6      	adds	r6, r4, #2
c0d05072:	4296      	cmp	r6, r2
c0d05074:	d900      	bls.n	c0d05078 <parseValueToDisplay+0x110>
c0d05076:	e135      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05078:	1967      	adds	r7, r4, r5
c0d0507a:	787b      	ldrb	r3, [r7, #1]
c0d0507c:	1e58      	subs	r0, r3, #1
c0d0507e:	280a      	cmp	r0, #10
c0d05080:	d300      	bcc.n	c0d05084 <parseValueToDisplay+0x11c>
c0d05082:	e12f      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05084:	960c      	str	r6, [sp, #48]	; 0x30
c0d05086:	950d      	str	r5, [sp, #52]	; 0x34
c0d05088:	910e      	str	r1, [sp, #56]	; 0x38
c0d0508a:	1919      	adds	r1, r3, r4
c0d0508c:	1cc8      	adds	r0, r1, #3
c0d0508e:	4290      	cmp	r0, r2
c0d05090:	d900      	bls.n	c0d05094 <parseValueToDisplay+0x12c>
c0d05092:	e127      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05094:	2500      	movs	r5, #0
c0d05096:	9513      	str	r5, [sp, #76]	; 0x4c
c0d05098:	9512      	str	r5, [sp, #72]	; 0x48
c0d0509a:	9310      	str	r3, [sp, #64]	; 0x40
c0d0509c:	970b      	str	r7, [sp, #44]	; 0x2c
c0d0509e:	18f8      	adds	r0, r7, r3
c0d050a0:	1c80      	adds	r0, r0, #2
c0d050a2:	1c8e      	adds	r6, r1, #2
c0d050a4:	1b91      	subs	r1, r2, r6
c0d050a6:	b2c9      	uxtb	r1, r1
c0d050a8:	aa12      	add	r2, sp, #72	; 0x48
c0d050aa:	f000 f943 	bl	c0d05334 <getNumberFromVarUInt>
c0d050ae:	9f13      	ldr	r7, [sp, #76]	; 0x4c
c0d050b0:	9a12      	ldr	r2, [sp, #72]	; 0x48
c0d050b2:	1e53      	subs	r3, r2, #1
c0d050b4:	4639      	mov	r1, r7
c0d050b6:	41a9      	sbcs	r1, r5
c0d050b8:	3b80      	subs	r3, #128	; 0x80
c0d050ba:	41a9      	sbcs	r1, r5
c0d050bc:	d300      	bcc.n	c0d050c0 <parseValueToDisplay+0x158>
c0d050be:	e111      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d050c0:	940f      	str	r4, [sp, #60]	; 0x3c
c0d050c2:	1830      	adds	r0, r6, r0
c0d050c4:	900a      	str	r0, [sp, #40]	; 0x28
c0d050c6:	1810      	adds	r0, r2, r0
c0d050c8:	416f      	adcs	r7, r5
c0d050ca:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d050cc:	4048      	eors	r0, r1
c0d050ce:	4338      	orrs	r0, r7
c0d050d0:	d000      	beq.n	c0d050d4 <parseValueToDisplay+0x16c>
c0d050d2:	e107      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d050d4:	9c0d      	ldr	r4, [sp, #52]	; 0x34
c0d050d6:	1c60      	adds	r0, r4, #1
c0d050d8:	4f88      	ldr	r7, [pc, #544]	; (c0d052fc <parseValueToDisplay+0x394>)
c0d050da:	447f      	add	r7, pc
c0d050dc:	9011      	str	r0, [sp, #68]	; 0x44
c0d050de:	990f      	ldr	r1, [sp, #60]	; 0x3c
c0d050e0:	47b8      	blx	r7
c0d050e2:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d050e4:	1c80      	adds	r0, r0, #2
c0d050e6:	900b      	str	r0, [sp, #44]	; 0x2c
c0d050e8:	9e10      	ldr	r6, [sp, #64]	; 0x40
c0d050ea:	4631      	mov	r1, r6
c0d050ec:	47b8      	blx	r7
c0d050ee:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d050f0:	1824      	adds	r4, r4, r0
c0d050f2:	9912      	ldr	r1, [sp, #72]	; 0x48
c0d050f4:	4620      	mov	r0, r4
c0d050f6:	47b8      	blx	r7
c0d050f8:	980c      	ldr	r0, [sp, #48]	; 0x30
c0d050fa:	1980      	adds	r0, r0, r6
c0d050fc:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d050fe:	9a12      	ldr	r2, [sp, #72]	; 0x48
c0d05100:	1810      	adds	r0, r2, r0
c0d05102:	4169      	adcs	r1, r5
c0d05104:	38dc      	subs	r0, #220	; 0xdc
c0d05106:	41a9      	sbcs	r1, r5
c0d05108:	d200      	bcs.n	c0d0510c <parseValueToDisplay+0x1a4>
c0d0510a:	2501      	movs	r5, #1
c0d0510c:	9f0e      	ldr	r7, [sp, #56]	; 0x38
c0d0510e:	487c      	ldr	r0, [pc, #496]	; (c0d05300 <parseValueToDisplay+0x398>)
c0d05110:	4478      	add	r0, pc
c0d05112:	1d81      	adds	r1, r0, #6
c0d05114:	4628      	mov	r0, r5
c0d05116:	f7fb f8a3 	bl	c0d00260 <assert>
c0d0511a:	9812      	ldr	r0, [sp, #72]	; 0x48
c0d0511c:	990b      	ldr	r1, [sp, #44]	; 0x2c
c0d0511e:	9100      	str	r1, [sp, #0]
c0d05120:	990f      	ldr	r1, [sp, #60]	; 0x3c
c0d05122:	9101      	str	r1, [sp, #4]
c0d05124:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d05126:	9102      	str	r1, [sp, #8]
c0d05128:	9003      	str	r0, [sp, #12]
c0d0512a:	9404      	str	r4, [sp, #16]
c0d0512c:	21dc      	movs	r1, #220	; 0xdc
c0d0512e:	4a75      	ldr	r2, [pc, #468]	; (c0d05304 <parseValueToDisplay+0x39c>)
c0d05130:	447a      	add	r2, pc
c0d05132:	4638      	mov	r0, r7
c0d05134:	9b10      	ldr	r3, [sp, #64]	; 0x40
c0d05136:	f7fe fa23 	bl	c0d03580 <snprintf>
c0d0513a:	e0d1      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d0513c:	9c11      	ldr	r4, [sp, #68]	; 0x44
c0d0513e:	08a0      	lsrs	r0, r4, #2
c0d05140:	2837      	cmp	r0, #55	; 0x37
c0d05142:	d300      	bcc.n	c0d05146 <parseValueToDisplay+0x1de>
c0d05144:	e0ce      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05146:	462e      	mov	r6, r5
c0d05148:	4615      	mov	r5, r2
c0d0514a:	4630      	mov	r0, r6
c0d0514c:	4621      	mov	r1, r4
c0d0514e:	f000 fb2b 	bl	c0d057a8 <str_validateTextBuffer>
c0d05152:	4628      	mov	r0, r5
c0d05154:	4631      	mov	r1, r6
c0d05156:	4622      	mov	r2, r4
c0d05158:	f002 fa80 	bl	c0d0765c <__aeabi_memcpy>
c0d0515c:	2000      	movs	r0, #0
c0d0515e:	5528      	strb	r0, [r5, r4]
c0d05160:	e0be      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d05162:	9811      	ldr	r0, [sp, #68]	; 0x44
c0d05164:	2808      	cmp	r0, #8
c0d05166:	d000      	beq.n	c0d0516a <parseValueToDisplay+0x202>
c0d05168:	e0bc      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d0516a:	2108      	movs	r1, #8
c0d0516c:	23dc      	movs	r3, #220	; 0xdc
c0d0516e:	4628      	mov	r0, r5
c0d05170:	f7fc ff6a 	bl	c0d02048 <uint8array_name_to_string>
c0d05174:	e0b4      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d05176:	4617      	mov	r7, r2
c0d05178:	2600      	movs	r6, #0
c0d0517a:	9613      	str	r6, [sp, #76]	; 0x4c
c0d0517c:	9612      	str	r6, [sp, #72]	; 0x48
c0d0517e:	aa12      	add	r2, sp, #72	; 0x48
c0d05180:	4628      	mov	r0, r5
c0d05182:	9c11      	ldr	r4, [sp, #68]	; 0x44
c0d05184:	4621      	mov	r1, r4
c0d05186:	f000 f8d5 	bl	c0d05334 <getNumberFromVarUInt>
c0d0518a:	9a13      	ldr	r2, [sp, #76]	; 0x4c
c0d0518c:	9912      	ldr	r1, [sp, #72]	; 0x48
c0d0518e:	460b      	mov	r3, r1
c0d05190:	3bdc      	subs	r3, #220	; 0xdc
c0d05192:	4613      	mov	r3, r2
c0d05194:	41b3      	sbcs	r3, r6
c0d05196:	d300      	bcc.n	c0d0519a <parseValueToDisplay+0x232>
c0d05198:	e0a4      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d0519a:	180b      	adds	r3, r1, r0
c0d0519c:	4172      	adcs	r2, r6
c0d0519e:	4063      	eors	r3, r4
c0d051a0:	4313      	orrs	r3, r2
c0d051a2:	d000      	beq.n	c0d051a6 <parseValueToDisplay+0x23e>
c0d051a4:	e09e      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d051a6:	182c      	adds	r4, r5, r0
c0d051a8:	4620      	mov	r0, r4
c0d051aa:	f000 fafd 	bl	c0d057a8 <str_validateTextBuffer>
c0d051ae:	9d12      	ldr	r5, [sp, #72]	; 0x48
c0d051b0:	4638      	mov	r0, r7
c0d051b2:	4621      	mov	r1, r4
c0d051b4:	462a      	mov	r2, r5
c0d051b6:	f002 fa51 	bl	c0d0765c <__aeabi_memcpy>
c0d051ba:	557e      	strb	r6, [r7, r5]
c0d051bc:	e090      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d051be:	4617      	mov	r7, r2
c0d051c0:	aa12      	add	r2, sp, #72	; 0x48
c0d051c2:	4628      	mov	r0, r5
c0d051c4:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d051c6:	f7ff fe8b 	bl	c0d04ee0 <parseUInt64>
c0d051ca:	9d12      	ldr	r5, [sp, #72]	; 0x48
c0d051cc:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d051ce:	9111      	str	r1, [sp, #68]	; 0x44
c0d051d0:	9806      	ldr	r0, [sp, #24]
c0d051d2:	9000      	str	r0, [sp, #0]
c0d051d4:	9807      	ldr	r0, [sp, #28]
c0d051d6:	9001      	str	r0, [sp, #4]
c0d051d8:	9502      	str	r5, [sp, #8]
c0d051da:	9103      	str	r1, [sp, #12]
c0d051dc:	4620      	mov	r0, r4
c0d051de:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
c0d051e0:	4633      	mov	r3, r6
c0d051e2:	f7ff fe9d 	bl	c0d04f20 <validateNumber>
c0d051e6:	23dc      	movs	r3, #220	; 0xdc
c0d051e8:	4628      	mov	r0, r5
c0d051ea:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d051ec:	463e      	mov	r6, r7
c0d051ee:	463a      	mov	r2, r7
c0d051f0:	f000 f9a8 	bl	c0d05544 <str_formatFIOAmount>
c0d051f4:	4604      	mov	r4, r0
c0d051f6:	2500      	movs	r5, #0
c0d051f8:	28dc      	cmp	r0, #220	; 0xdc
c0d051fa:	d349      	bcc.n	c0d05290 <parseValueToDisplay+0x328>
c0d051fc:	4628      	mov	r0, r5
c0d051fe:	e048      	b.n	c0d05292 <parseValueToDisplay+0x32a>
c0d05200:	4617      	mov	r7, r2
c0d05202:	aa12      	add	r2, sp, #72	; 0x48
c0d05204:	4628      	mov	r0, r5
c0d05206:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d05208:	f7ff fe9e 	bl	c0d04f48 <parseVarUInt32>
c0d0520c:	9812      	ldr	r0, [sp, #72]	; 0x48
c0d0520e:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d05210:	9a06      	ldr	r2, [sp, #24]
c0d05212:	9200      	str	r2, [sp, #0]
c0d05214:	9a07      	ldr	r2, [sp, #28]
c0d05216:	9201      	str	r2, [sp, #4]
c0d05218:	9002      	str	r0, [sp, #8]
c0d0521a:	9103      	str	r1, [sp, #12]
c0d0521c:	4620      	mov	r0, r4
c0d0521e:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
c0d05220:	4633      	mov	r3, r6
c0d05222:	f7ff fe7d 	bl	c0d04f20 <validateNumber>
c0d05226:	9913      	ldr	r1, [sp, #76]	; 0x4c
c0d05228:	9812      	ldr	r0, [sp, #72]	; 0x48
c0d0522a:	463a      	mov	r2, r7
c0d0522c:	e014      	b.n	c0d05258 <parseValueToDisplay+0x2f0>
c0d0522e:	920e      	str	r2, [sp, #56]	; 0x38
c0d05230:	aa12      	add	r2, sp, #72	; 0x48
c0d05232:	4628      	mov	r0, r5
c0d05234:	9911      	ldr	r1, [sp, #68]	; 0x44
c0d05236:	f7ff fe53 	bl	c0d04ee0 <parseUInt64>
c0d0523a:	9d12      	ldr	r5, [sp, #72]	; 0x48
c0d0523c:	9f13      	ldr	r7, [sp, #76]	; 0x4c
c0d0523e:	9806      	ldr	r0, [sp, #24]
c0d05240:	9000      	str	r0, [sp, #0]
c0d05242:	9807      	ldr	r0, [sp, #28]
c0d05244:	a901      	add	r1, sp, #4
c0d05246:	c1a1      	stmia	r1!, {r0, r5, r7}
c0d05248:	4620      	mov	r0, r4
c0d0524a:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
c0d0524c:	4633      	mov	r3, r6
c0d0524e:	f7ff fe67 	bl	c0d04f20 <validateNumber>
c0d05252:	4628      	mov	r0, r5
c0d05254:	4639      	mov	r1, r7
c0d05256:	9a0e      	ldr	r2, [sp, #56]	; 0x38
c0d05258:	f000 f856 	bl	c0d05308 <displayNumber>
c0d0525c:	e040      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d0525e:	9b11      	ldr	r3, [sp, #68]	; 0x44
c0d05260:	2b00      	cmp	r3, #0
c0d05262:	d03f      	beq.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05264:	7828      	ldrb	r0, [r5, #0]
c0d05266:	2800      	cmp	r0, #0
c0d05268:	d01f      	beq.n	c0d052aa <parseValueToDisplay+0x342>
c0d0526a:	2801      	cmp	r0, #1
c0d0526c:	d13a      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d0526e:	2b01      	cmp	r3, #1
c0d05270:	d938      	bls.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05272:	786c      	ldrb	r4, [r5, #1]
c0d05274:	2c7f      	cmp	r4, #127	; 0x7f
c0d05276:	d235      	bcs.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05278:	1d21      	adds	r1, r4, #4
c0d0527a:	4299      	cmp	r1, r3
c0d0527c:	d132      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d0527e:	4610      	mov	r0, r2
c0d05280:	1962      	adds	r2, r4, r5
c0d05282:	7891      	ldrb	r1, [r2, #2]
c0d05284:	2900      	cmp	r1, #0
c0d05286:	d12d      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05288:	78d1      	ldrb	r1, [r2, #3]
c0d0528a:	2900      	cmp	r1, #0
c0d0528c:	d023      	beq.n	c0d052d6 <parseValueToDisplay+0x36e>
c0d0528e:	e029      	b.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d05290:	2001      	movs	r0, #1
c0d05292:	4918      	ldr	r1, [pc, #96]	; (c0d052f4 <parseValueToDisplay+0x38c>)
c0d05294:	4479      	add	r1, pc
c0d05296:	1d89      	adds	r1, r1, #6
c0d05298:	e003      	b.n	c0d052a2 <parseValueToDisplay+0x33a>
c0d0529a:	2001      	movs	r0, #1
c0d0529c:	4914      	ldr	r1, [pc, #80]	; (c0d052f0 <parseValueToDisplay+0x388>)
c0d0529e:	4479      	add	r1, pc
c0d052a0:	1d49      	adds	r1, r1, #5
c0d052a2:	f7fa ffdd 	bl	c0d00260 <assert>
c0d052a6:	5535      	strb	r5, [r6, r4]
c0d052a8:	e01a      	b.n	c0d052e0 <parseValueToDisplay+0x378>
c0d052aa:	2b02      	cmp	r3, #2
c0d052ac:	d91a      	bls.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052ae:	7868      	ldrb	r0, [r5, #1]
c0d052b0:	2801      	cmp	r0, #1
c0d052b2:	d117      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052b4:	78a9      	ldrb	r1, [r5, #2]
c0d052b6:	297f      	cmp	r1, #127	; 0x7f
c0d052b8:	d214      	bcs.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052ba:	1d4c      	adds	r4, r1, #5
c0d052bc:	429c      	cmp	r4, r3
c0d052be:	d811      	bhi.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052c0:	4610      	mov	r0, r2
c0d052c2:	1949      	adds	r1, r1, r5
c0d052c4:	78ca      	ldrb	r2, [r1, #3]
c0d052c6:	2a01      	cmp	r2, #1
c0d052c8:	d10c      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052ca:	7909      	ldrb	r1, [r1, #4]
c0d052cc:	297f      	cmp	r1, #127	; 0x7f
c0d052ce:	d209      	bcs.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052d0:	1861      	adds	r1, r4, r1
c0d052d2:	4299      	cmp	r1, r3
c0d052d4:	d106      	bne.n	c0d052e4 <parseValueToDisplay+0x37c>
c0d052d6:	4908      	ldr	r1, [pc, #32]	; (c0d052f8 <parseValueToDisplay+0x390>)
c0d052d8:	4479      	add	r1, pc
c0d052da:	2210      	movs	r2, #16
c0d052dc:	f002 f9be 	bl	c0d0765c <__aeabi_memcpy>
c0d052e0:	b015      	add	sp, #84	; 0x54
c0d052e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d052e4:	4801      	ldr	r0, [pc, #4]	; (c0d052ec <parseValueToDisplay+0x384>)
c0d052e6:	f7fd fcb6 	bl	c0d02c56 <os_longjmp>
c0d052ea:	46c0      	nop			; (mov r8, r8)
c0d052ec:	00006e07 	.word	0x00006e07
c0d052f0:	00004036 	.word	0x00004036
c0d052f4:	0000405e 	.word	0x0000405e
c0d052f8:	00004088 	.word	0x00004088
c0d052fc:	000006cb 	.word	0x000006cb
c0d05300:	00004220 	.word	0x00004220
c0d05304:	0000421f 	.word	0x0000421f

c0d05308 <displayNumber>:
c0d05308:	b570      	push	{r4, r5, r6, lr}
c0d0530a:	4614      	mov	r4, r2
c0d0530c:	23dc      	movs	r3, #220	; 0xdc
c0d0530e:	f000 f9e3 	bl	c0d056d8 <str_formatUint64>
c0d05312:	4605      	mov	r5, r0
c0d05314:	2600      	movs	r6, #0
c0d05316:	28dc      	cmp	r0, #220	; 0xdc
c0d05318:	d301      	bcc.n	c0d0531e <displayNumber+0x16>
c0d0531a:	4630      	mov	r0, r6
c0d0531c:	e000      	b.n	c0d05320 <displayNumber+0x18>
c0d0531e:	2001      	movs	r0, #1
c0d05320:	4903      	ldr	r1, [pc, #12]	; (c0d05330 <displayNumber+0x28>)
c0d05322:	4479      	add	r1, pc
c0d05324:	1d89      	adds	r1, r1, #6
c0d05326:	f7fa ff9b 	bl	c0d00260 <assert>
c0d0532a:	5566      	strb	r6, [r4, r5]
c0d0532c:	bd70      	pop	{r4, r5, r6, pc}
c0d0532e:	46c0      	nop			; (mov r8, r8)
c0d05330:	00003fef 	.word	0x00003fef

c0d05334 <getNumberFromVarUInt>:
c0d05334:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05336:	b085      	sub	sp, #20
c0d05338:	4615      	mov	r5, r2
c0d0533a:	9103      	str	r1, [sp, #12]
c0d0533c:	9001      	str	r0, [sp, #4]
c0d0533e:	1e51      	subs	r1, r2, #1
c0d05340:	4610      	mov	r0, r2
c0d05342:	4188      	sbcs	r0, r1
c0d05344:	4916      	ldr	r1, [pc, #88]	; (c0d053a0 <getNumberFromVarUInt+0x6c>)
c0d05346:	4479      	add	r1, pc
c0d05348:	1d49      	adds	r1, r1, #5
c0d0534a:	f7fa ff89 	bl	c0d00260 <assert>
c0d0534e:	2400      	movs	r4, #0
c0d05350:	602c      	str	r4, [r5, #0]
c0d05352:	9502      	str	r5, [sp, #8]
c0d05354:	606c      	str	r4, [r5, #4]
c0d05356:	4626      	mov	r6, r4
c0d05358:	4625      	mov	r5, r4
c0d0535a:	4621      	mov	r1, r4
c0d0535c:	9803      	ldr	r0, [sp, #12]
c0d0535e:	42a8      	cmp	r0, r5
c0d05360:	d014      	beq.n	c0d0538c <getNumberFromVarUInt+0x58>
c0d05362:	9801      	ldr	r0, [sp, #4]
c0d05364:	5d42      	ldrb	r2, [r0, r5]
c0d05366:	9204      	str	r2, [sp, #16]
c0d05368:	207f      	movs	r0, #127	; 0x7f
c0d0536a:	4010      	ands	r0, r2
c0d0536c:	b2cf      	uxtb	r7, r1
c0d0536e:	2100      	movs	r1, #0
c0d05370:	463a      	mov	r2, r7
c0d05372:	f002 f877 	bl	c0d07464 <__aeabi_llsl>
c0d05376:	430e      	orrs	r6, r1
c0d05378:	4304      	orrs	r4, r0
c0d0537a:	9802      	ldr	r0, [sp, #8]
c0d0537c:	c050      	stmia	r0!, {r4, r6}
c0d0537e:	9804      	ldr	r0, [sp, #16]
c0d05380:	0600      	lsls	r0, r0, #24
c0d05382:	d506      	bpl.n	c0d05392 <getNumberFromVarUInt+0x5e>
c0d05384:	1c6d      	adds	r5, r5, #1
c0d05386:	1df9      	adds	r1, r7, #7
c0d05388:	2d09      	cmp	r5, #9
c0d0538a:	d1e7      	bne.n	c0d0535c <getNumberFromVarUInt+0x28>
c0d0538c:	4803      	ldr	r0, [pc, #12]	; (c0d0539c <getNumberFromVarUInt+0x68>)
c0d0538e:	f7fd fc62 	bl	c0d02c56 <os_longjmp>
c0d05392:	1c68      	adds	r0, r5, #1
c0d05394:	b2c0      	uxtb	r0, r0
c0d05396:	b005      	add	sp, #20
c0d05398:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0539a:	46c0      	nop			; (mov r8, r8)
c0d0539c:	00006e07 	.word	0x00006e07
c0d053a0:	00003f70 	.word	0x00003f70

c0d053a4 <SVC_Call>:
c0d053a4:	df01      	svc	1
c0d053a6:	2900      	cmp	r1, #0
c0d053a8:	d100      	bne.n	c0d053ac <exception>
c0d053aa:	4770      	bx	lr

c0d053ac <exception>:
c0d053ac:	4608      	mov	r0, r1
c0d053ae:	f7fd fc52 	bl	c0d02c56 <os_longjmp>
	...

c0d053b4 <get_api_level>:
c0d053b4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d053b6:	2000      	movs	r0, #0
c0d053b8:	9002      	str	r0, [sp, #8]
c0d053ba:	9001      	str	r0, [sp, #4]
c0d053bc:	4802      	ldr	r0, [pc, #8]	; (c0d053c8 <get_api_level+0x14>)
c0d053be:	a901      	add	r1, sp, #4
c0d053c0:	f7ff fff0 	bl	c0d053a4 <SVC_Call>
c0d053c4:	b004      	add	sp, #16
c0d053c6:	bd80      	pop	{r7, pc}
c0d053c8:	60000138 	.word	0x60000138

c0d053cc <halt>:
c0d053cc:	b5e0      	push	{r5, r6, r7, lr}
c0d053ce:	2000      	movs	r0, #0
c0d053d0:	9001      	str	r0, [sp, #4]
c0d053d2:	4802      	ldr	r0, [pc, #8]	; (c0d053dc <halt+0x10>)
c0d053d4:	4669      	mov	r1, sp
c0d053d6:	f7ff ffe5 	bl	c0d053a4 <SVC_Call>
c0d053da:	bd8c      	pop	{r2, r3, r7, pc}
c0d053dc:	6000023c 	.word	0x6000023c

c0d053e0 <os_perso_isonboarded>:
c0d053e0:	b5e0      	push	{r5, r6, r7, lr}
c0d053e2:	2000      	movs	r0, #0
c0d053e4:	9001      	str	r0, [sp, #4]
c0d053e6:	4803      	ldr	r0, [pc, #12]	; (c0d053f4 <os_perso_isonboarded+0x14>)
c0d053e8:	4669      	mov	r1, sp
c0d053ea:	f7ff ffdb 	bl	c0d053a4 <SVC_Call>
c0d053ee:	b2c0      	uxtb	r0, r0
c0d053f0:	bd8c      	pop	{r2, r3, r7, pc}
c0d053f2:	46c0      	nop			; (mov r8, r8)
c0d053f4:	60009f4f 	.word	0x60009f4f

c0d053f8 <os_perso_derive_node_bip32>:
c0d053f8:	b510      	push	{r4, lr}
c0d053fa:	b088      	sub	sp, #32
c0d053fc:	9c0a      	ldr	r4, [sp, #40]	; 0x28
c0d053fe:	9405      	str	r4, [sp, #20]
c0d05400:	9304      	str	r3, [sp, #16]
c0d05402:	9203      	str	r2, [sp, #12]
c0d05404:	9102      	str	r1, [sp, #8]
c0d05406:	9001      	str	r0, [sp, #4]
c0d05408:	4802      	ldr	r0, [pc, #8]	; (c0d05414 <os_perso_derive_node_bip32+0x1c>)
c0d0540a:	a901      	add	r1, sp, #4
c0d0540c:	f7ff ffca 	bl	c0d053a4 <SVC_Call>
c0d05410:	b008      	add	sp, #32
c0d05412:	bd10      	pop	{r4, pc}
c0d05414:	600053ba 	.word	0x600053ba

c0d05418 <os_perso_seed_cookie>:
c0d05418:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0541a:	9101      	str	r1, [sp, #4]
c0d0541c:	9000      	str	r0, [sp, #0]
c0d0541e:	4803      	ldr	r0, [pc, #12]	; (c0d0542c <os_perso_seed_cookie+0x14>)
c0d05420:	4669      	mov	r1, sp
c0d05422:	f7ff ffbf 	bl	c0d053a4 <SVC_Call>
c0d05426:	b004      	add	sp, #16
c0d05428:	bd80      	pop	{r7, pc}
c0d0542a:	46c0      	nop			; (mov r8, r8)
c0d0542c:	6000a8fc 	.word	0x6000a8fc

c0d05430 <os_global_pin_is_validated>:
c0d05430:	b5e0      	push	{r5, r6, r7, lr}
c0d05432:	2000      	movs	r0, #0
c0d05434:	9001      	str	r0, [sp, #4]
c0d05436:	4803      	ldr	r0, [pc, #12]	; (c0d05444 <os_global_pin_is_validated+0x14>)
c0d05438:	4669      	mov	r1, sp
c0d0543a:	f7ff ffb3 	bl	c0d053a4 <SVC_Call>
c0d0543e:	b2c0      	uxtb	r0, r0
c0d05440:	bd8c      	pop	{r2, r3, r7, pc}
c0d05442:	46c0      	nop			; (mov r8, r8)
c0d05444:	6000a03c 	.word	0x6000a03c

c0d05448 <os_ux>:
c0d05448:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0544a:	2100      	movs	r1, #0
c0d0544c:	9102      	str	r1, [sp, #8]
c0d0544e:	9001      	str	r0, [sp, #4]
c0d05450:	4802      	ldr	r0, [pc, #8]	; (c0d0545c <os_ux+0x14>)
c0d05452:	a901      	add	r1, sp, #4
c0d05454:	f7ff ffa6 	bl	c0d053a4 <SVC_Call>
c0d05458:	b004      	add	sp, #16
c0d0545a:	bd80      	pop	{r7, pc}
c0d0545c:	60006458 	.word	0x60006458

c0d05460 <os_flags>:
c0d05460:	b5e0      	push	{r5, r6, r7, lr}
c0d05462:	2000      	movs	r0, #0
c0d05464:	9001      	str	r0, [sp, #4]
c0d05466:	4802      	ldr	r0, [pc, #8]	; (c0d05470 <os_flags+0x10>)
c0d05468:	4669      	mov	r1, sp
c0d0546a:	f7ff ff9b 	bl	c0d053a4 <SVC_Call>
c0d0546e:	bd8c      	pop	{r2, r3, r7, pc}
c0d05470:	60006a6e 	.word	0x60006a6e

c0d05474 <os_serial>:
c0d05474:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d05476:	9101      	str	r1, [sp, #4]
c0d05478:	9000      	str	r0, [sp, #0]
c0d0547a:	4803      	ldr	r0, [pc, #12]	; (c0d05488 <os_serial+0x14>)
c0d0547c:	4669      	mov	r1, sp
c0d0547e:	f7ff ff91 	bl	c0d053a4 <SVC_Call>
c0d05482:	b004      	add	sp, #16
c0d05484:	bd80      	pop	{r7, pc}
c0d05486:	46c0      	nop			; (mov r8, r8)
c0d05488:	60006cb3 	.word	0x60006cb3

c0d0548c <os_registry_get_current_app_tag>:
c0d0548c:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d0548e:	ab01      	add	r3, sp, #4
c0d05490:	c307      	stmia	r3!, {r0, r1, r2}
c0d05492:	4803      	ldr	r0, [pc, #12]	; (c0d054a0 <os_registry_get_current_app_tag+0x14>)
c0d05494:	a901      	add	r1, sp, #4
c0d05496:	f7ff ff85 	bl	c0d053a4 <SVC_Call>
c0d0549a:	b006      	add	sp, #24
c0d0549c:	bd80      	pop	{r7, pc}
c0d0549e:	46c0      	nop			; (mov r8, r8)
c0d054a0:	600074d4 	.word	0x600074d4

c0d054a4 <os_sched_exit>:
c0d054a4:	b084      	sub	sp, #16
c0d054a6:	2100      	movs	r1, #0
c0d054a8:	9102      	str	r1, [sp, #8]
c0d054aa:	9001      	str	r0, [sp, #4]
c0d054ac:	4802      	ldr	r0, [pc, #8]	; (c0d054b8 <os_sched_exit+0x14>)
c0d054ae:	a901      	add	r1, sp, #4
c0d054b0:	f7ff ff78 	bl	c0d053a4 <SVC_Call>
c0d054b4:	deff      	udf	#255	; 0xff
c0d054b6:	46c0      	nop			; (mov r8, r8)
c0d054b8:	60009abe 	.word	0x60009abe

c0d054bc <io_seph_send>:
c0d054bc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d054be:	9101      	str	r1, [sp, #4]
c0d054c0:	9000      	str	r0, [sp, #0]
c0d054c2:	4802      	ldr	r0, [pc, #8]	; (c0d054cc <io_seph_send+0x10>)
c0d054c4:	4669      	mov	r1, sp
c0d054c6:	f7ff ff6d 	bl	c0d053a4 <SVC_Call>
c0d054ca:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0d054cc:	60008381 	.word	0x60008381

c0d054d0 <io_seph_is_status_sent>:
c0d054d0:	b5e0      	push	{r5, r6, r7, lr}
c0d054d2:	2000      	movs	r0, #0
c0d054d4:	9001      	str	r0, [sp, #4]
c0d054d6:	4802      	ldr	r0, [pc, #8]	; (c0d054e0 <io_seph_is_status_sent+0x10>)
c0d054d8:	4669      	mov	r1, sp
c0d054da:	f7ff ff63 	bl	c0d053a4 <SVC_Call>
c0d054de:	bd8c      	pop	{r2, r3, r7, pc}
c0d054e0:	600084bb 	.word	0x600084bb

c0d054e4 <io_seph_recv>:
c0d054e4:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d054e6:	ab01      	add	r3, sp, #4
c0d054e8:	c307      	stmia	r3!, {r0, r1, r2}
c0d054ea:	4803      	ldr	r0, [pc, #12]	; (c0d054f8 <io_seph_recv+0x14>)
c0d054ec:	a901      	add	r1, sp, #4
c0d054ee:	f7ff ff59 	bl	c0d053a4 <SVC_Call>
c0d054f2:	b280      	uxth	r0, r0
c0d054f4:	b006      	add	sp, #24
c0d054f6:	bd80      	pop	{r7, pc}
c0d054f8:	600085e4 	.word	0x600085e4

c0d054fc <try_context_get>:
c0d054fc:	b5e0      	push	{r5, r6, r7, lr}
c0d054fe:	2000      	movs	r0, #0
c0d05500:	9001      	str	r0, [sp, #4]
c0d05502:	4802      	ldr	r0, [pc, #8]	; (c0d0550c <try_context_get+0x10>)
c0d05504:	4669      	mov	r1, sp
c0d05506:	f7ff ff4d 	bl	c0d053a4 <SVC_Call>
c0d0550a:	bd8c      	pop	{r2, r3, r7, pc}
c0d0550c:	600087b1 	.word	0x600087b1

c0d05510 <try_context_set>:
c0d05510:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d05512:	2100      	movs	r1, #0
c0d05514:	9102      	str	r1, [sp, #8]
c0d05516:	9001      	str	r0, [sp, #4]
c0d05518:	4802      	ldr	r0, [pc, #8]	; (c0d05524 <try_context_set+0x14>)
c0d0551a:	a901      	add	r1, sp, #4
c0d0551c:	f7ff ff42 	bl	c0d053a4 <SVC_Call>
c0d05520:	b004      	add	sp, #16
c0d05522:	bd80      	pop	{r7, pc}
c0d05524:	60010b06 	.word	0x60010b06

c0d05528 <os_sched_last_status>:
c0d05528:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d0552a:	2100      	movs	r1, #0
c0d0552c:	9102      	str	r1, [sp, #8]
c0d0552e:	9001      	str	r0, [sp, #4]
c0d05530:	4803      	ldr	r0, [pc, #12]	; (c0d05540 <os_sched_last_status+0x18>)
c0d05532:	a901      	add	r1, sp, #4
c0d05534:	f7ff ff36 	bl	c0d053a4 <SVC_Call>
c0d05538:	b2c0      	uxtb	r0, r0
c0d0553a:	b004      	add	sp, #16
c0d0553c:	bd80      	pop	{r7, pc}
c0d0553e:	46c0      	nop			; (mov r8, r8)
c0d05540:	60009c8b 	.word	0x60009c8b

c0d05544 <str_formatFIOAmount>:
c0d05544:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05546:	b091      	sub	sp, #68	; 0x44
c0d05548:	9201      	str	r2, [sp, #4]
c0d0554a:	9108      	str	r1, [sp, #32]
c0d0554c:	4604      	mov	r4, r0
c0d0554e:	9300      	str	r3, [sp, #0]
c0d05550:	0a99      	lsrs	r1, r3, #10
c0d05552:	4248      	negs	r0, r1
c0d05554:	4148      	adcs	r0, r1
c0d05556:	4958      	ldr	r1, [pc, #352]	; (c0d056b8 <str_formatFIOAmount+0x174>)
c0d05558:	4479      	add	r1, pc
c0d0555a:	f7fa fe81 	bl	c0d00260 <assert>
c0d0555e:	a809      	add	r0, sp, #36	; 0x24
c0d05560:	301e      	adds	r0, #30
c0d05562:	9007      	str	r0, [sp, #28]
c0d05564:	2500      	movs	r5, #0
c0d05566:	9505      	str	r5, [sp, #20]
c0d05568:	a809      	add	r0, sp, #36	; 0x24
c0d0556a:	1940      	adds	r0, r0, r5
c0d0556c:	1c40      	adds	r0, r0, #1
c0d0556e:	9907      	ldr	r1, [sp, #28]
c0d05570:	4288      	cmp	r0, r1
c0d05572:	d901      	bls.n	c0d05578 <str_formatFIOAmount+0x34>
c0d05574:	9805      	ldr	r0, [sp, #20]
c0d05576:	e000      	b.n	c0d0557a <str_formatFIOAmount+0x36>
c0d05578:	2001      	movs	r0, #1
c0d0557a:	2d09      	cmp	r5, #9
c0d0557c:	d01b      	beq.n	c0d055b6 <str_formatFIOAmount+0x72>
c0d0557e:	4952      	ldr	r1, [pc, #328]	; (c0d056c8 <str_formatFIOAmount+0x184>)
c0d05580:	4479      	add	r1, pc
c0d05582:	f7fa fe6d 	bl	c0d00260 <assert>
c0d05586:	9506      	str	r5, [sp, #24]
c0d05588:	250a      	movs	r5, #10
c0d0558a:	2600      	movs	r6, #0
c0d0558c:	4620      	mov	r0, r4
c0d0558e:	9908      	ldr	r1, [sp, #32]
c0d05590:	462a      	mov	r2, r5
c0d05592:	4633      	mov	r3, r6
c0d05594:	f001 ff72 	bl	c0d0747c <__aeabi_uldivmod>
c0d05598:	4627      	mov	r7, r4
c0d0559a:	4604      	mov	r4, r0
c0d0559c:	9108      	str	r1, [sp, #32]
c0d0559e:	462a      	mov	r2, r5
c0d055a0:	9d06      	ldr	r5, [sp, #24]
c0d055a2:	4633      	mov	r3, r6
c0d055a4:	f001 ff8a 	bl	c0d074bc <__aeabi_lmul>
c0d055a8:	1a38      	subs	r0, r7, r0
c0d055aa:	2130      	movs	r1, #48	; 0x30
c0d055ac:	4301      	orrs	r1, r0
c0d055ae:	a809      	add	r0, sp, #36	; 0x24
c0d055b0:	5541      	strb	r1, [r0, r5]
c0d055b2:	1c6d      	adds	r5, r5, #1
c0d055b4:	e7d8      	b.n	c0d05568 <str_formatFIOAmount+0x24>
c0d055b6:	4941      	ldr	r1, [pc, #260]	; (c0d056bc <str_formatFIOAmount+0x178>)
c0d055b8:	4479      	add	r1, pc
c0d055ba:	f7fa fe51 	bl	c0d00260 <assert>
c0d055be:	a809      	add	r0, sp, #36	; 0x24
c0d055c0:	212e      	movs	r1, #46	; 0x2e
c0d055c2:	5541      	strb	r1, [r0, r5]
c0d055c4:	1940      	adds	r0, r0, r5
c0d055c6:	1c47      	adds	r7, r0, #1
c0d055c8:	2500      	movs	r5, #0
c0d055ca:	4628      	mov	r0, r5
c0d055cc:	9908      	ldr	r1, [sp, #32]
c0d055ce:	9108      	str	r1, [sp, #32]
c0d055d0:	4626      	mov	r6, r4
c0d055d2:	2403      	movs	r4, #3
c0d055d4:	9004      	str	r0, [sp, #16]
c0d055d6:	4621      	mov	r1, r4
c0d055d8:	f001 fea8 	bl	c0d0732c <__udivsi3>
c0d055dc:	2d00      	cmp	r5, #0
c0d055de:	d008      	beq.n	c0d055f2 <str_formatFIOAmount+0xae>
c0d055e0:	4344      	muls	r4, r0
c0d055e2:	1928      	adds	r0, r5, r4
c0d055e4:	d105      	bne.n	c0d055f2 <str_formatFIOAmount+0xae>
c0d055e6:	1c7c      	adds	r4, r7, #1
c0d055e8:	9807      	ldr	r0, [sp, #28]
c0d055ea:	4284      	cmp	r4, r0
c0d055ec:	d903      	bls.n	c0d055f6 <str_formatFIOAmount+0xb2>
c0d055ee:	2000      	movs	r0, #0
c0d055f0:	e002      	b.n	c0d055f8 <str_formatFIOAmount+0xb4>
c0d055f2:	463c      	mov	r4, r7
c0d055f4:	e006      	b.n	c0d05604 <str_formatFIOAmount+0xc0>
c0d055f6:	2001      	movs	r0, #1
c0d055f8:	4931      	ldr	r1, [pc, #196]	; (c0d056c0 <str_formatFIOAmount+0x17c>)
c0d055fa:	4479      	add	r1, pc
c0d055fc:	f7fa fe30 	bl	c0d00260 <assert>
c0d05600:	202c      	movs	r0, #44	; 0x2c
c0d05602:	7038      	strb	r0, [r7, #0]
c0d05604:	9403      	str	r4, [sp, #12]
c0d05606:	1c61      	adds	r1, r4, #1
c0d05608:	2400      	movs	r4, #0
c0d0560a:	9807      	ldr	r0, [sp, #28]
c0d0560c:	4281      	cmp	r1, r0
c0d0560e:	9106      	str	r1, [sp, #24]
c0d05610:	9505      	str	r5, [sp, #20]
c0d05612:	d901      	bls.n	c0d05618 <str_formatFIOAmount+0xd4>
c0d05614:	4620      	mov	r0, r4
c0d05616:	e000      	b.n	c0d0561a <str_formatFIOAmount+0xd6>
c0d05618:	2001      	movs	r0, #1
c0d0561a:	492a      	ldr	r1, [pc, #168]	; (c0d056c4 <str_formatFIOAmount+0x180>)
c0d0561c:	4479      	add	r1, pc
c0d0561e:	f7fa fe1f 	bl	c0d00260 <assert>
c0d05622:	250a      	movs	r5, #10
c0d05624:	4630      	mov	r0, r6
c0d05626:	9908      	ldr	r1, [sp, #32]
c0d05628:	462a      	mov	r2, r5
c0d0562a:	4623      	mov	r3, r4
c0d0562c:	f001 ff26 	bl	c0d0747c <__aeabi_uldivmod>
c0d05630:	9102      	str	r1, [sp, #8]
c0d05632:	4607      	mov	r7, r0
c0d05634:	462a      	mov	r2, r5
c0d05636:	4623      	mov	r3, r4
c0d05638:	f001 ff40 	bl	c0d074bc <__aeabi_lmul>
c0d0563c:	1a30      	subs	r0, r6, r0
c0d0563e:	2130      	movs	r1, #48	; 0x30
c0d05640:	4301      	orrs	r1, r0
c0d05642:	9803      	ldr	r0, [sp, #12]
c0d05644:	7001      	strb	r1, [r0, #0]
c0d05646:	9d05      	ldr	r5, [sp, #20]
c0d05648:	1e6d      	subs	r5, r5, #1
c0d0564a:	9804      	ldr	r0, [sp, #16]
c0d0564c:	1c40      	adds	r0, r0, #1
c0d0564e:	2109      	movs	r1, #9
c0d05650:	1b89      	subs	r1, r1, r6
c0d05652:	9908      	ldr	r1, [sp, #32]
c0d05654:	418c      	sbcs	r4, r1
c0d05656:	463c      	mov	r4, r7
c0d05658:	9902      	ldr	r1, [sp, #8]
c0d0565a:	9f06      	ldr	r7, [sp, #24]
c0d0565c:	d3b7      	bcc.n	c0d055ce <str_formatFIOAmount+0x8a>
c0d0565e:	a809      	add	r0, sp, #36	; 0x24
c0d05660:	1a39      	subs	r1, r7, r0
c0d05662:	1d48      	adds	r0, r1, #5
c0d05664:	9e00      	ldr	r6, [sp, #0]
c0d05666:	42b0      	cmp	r0, r6
c0d05668:	9d01      	ldr	r5, [sp, #4]
c0d0566a:	d820      	bhi.n	c0d056ae <str_formatFIOAmount+0x16a>
c0d0566c:	1d0c      	adds	r4, r1, #4
c0d0566e:	1e78      	subs	r0, r7, #1
c0d05670:	2200      	movs	r2, #0
c0d05672:	4291      	cmp	r1, r2
c0d05674:	d004      	beq.n	c0d05680 <str_formatFIOAmount+0x13c>
c0d05676:	7803      	ldrb	r3, [r0, #0]
c0d05678:	54ab      	strb	r3, [r5, r2]
c0d0567a:	1e40      	subs	r0, r0, #1
c0d0567c:	1c52      	adds	r2, r2, #1
c0d0567e:	e7f8      	b.n	c0d05672 <str_formatFIOAmount+0x12e>
c0d05680:	2000      	movs	r0, #0
c0d05682:	5468      	strb	r0, [r5, r1]
c0d05684:	1868      	adds	r0, r5, r1
c0d05686:	1a71      	subs	r1, r6, r1
c0d05688:	4a10      	ldr	r2, [pc, #64]	; (c0d056cc <str_formatFIOAmount+0x188>)
c0d0568a:	447a      	add	r2, pc
c0d0568c:	4b10      	ldr	r3, [pc, #64]	; (c0d056d0 <str_formatFIOAmount+0x18c>)
c0d0568e:	447b      	add	r3, pc
c0d05690:	f7fd ff76 	bl	c0d03580 <snprintf>
c0d05694:	4628      	mov	r0, r5
c0d05696:	f002 f92f 	bl	c0d078f8 <strlen>
c0d0569a:	1b01      	subs	r1, r0, r4
c0d0569c:	4248      	negs	r0, r1
c0d0569e:	4148      	adcs	r0, r1
c0d056a0:	490c      	ldr	r1, [pc, #48]	; (c0d056d4 <str_formatFIOAmount+0x190>)
c0d056a2:	4479      	add	r1, pc
c0d056a4:	f7fa fddc 	bl	c0d00260 <assert>
c0d056a8:	4620      	mov	r0, r4
c0d056aa:	b011      	add	sp, #68	; 0x44
c0d056ac:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d056ae:	4801      	ldr	r0, [pc, #4]	; (c0d056b4 <str_formatFIOAmount+0x170>)
c0d056b0:	f7fd fad1 	bl	c0d02c56 <os_longjmp>
c0d056b4:	00004711 	.word	0x00004711
c0d056b8:	00003e18 	.word	0x00003e18
c0d056bc:	00003dde 	.word	0x00003dde
c0d056c0:	00003daf 	.word	0x00003daf
c0d056c4:	00003da0 	.word	0x00003da0
c0d056c8:	00003e03 	.word	0x00003e03
c0d056cc:	00003d4a 	.word	0x00003d4a
c0d056d0:	00003d41 	.word	0x00003d41
c0d056d4:	00003d35 	.word	0x00003d35

c0d056d8 <str_formatUint64>:
c0d056d8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d056da:	b08f      	sub	sp, #60	; 0x3c
c0d056dc:	9201      	str	r2, [sp, #4]
c0d056de:	460f      	mov	r7, r1
c0d056e0:	4606      	mov	r6, r0
c0d056e2:	9300      	str	r3, [sp, #0]
c0d056e4:	0a99      	lsrs	r1, r3, #10
c0d056e6:	4248      	negs	r0, r1
c0d056e8:	4148      	adcs	r0, r1
c0d056ea:	492c      	ldr	r1, [pc, #176]	; (c0d0579c <str_formatUint64+0xc4>)
c0d056ec:	4479      	add	r1, pc
c0d056ee:	f7fa fdb7 	bl	c0d00260 <assert>
c0d056f2:	a807      	add	r0, sp, #28
c0d056f4:	301e      	adds	r0, #30
c0d056f6:	9002      	str	r0, [sp, #8]
c0d056f8:	2500      	movs	r5, #0
c0d056fa:	462c      	mov	r4, r5
c0d056fc:	aa07      	add	r2, sp, #28
c0d056fe:	1910      	adds	r0, r2, r4
c0d05700:	1c40      	adds	r0, r0, #1
c0d05702:	9902      	ldr	r1, [sp, #8]
c0d05704:	4288      	cmp	r0, r1
c0d05706:	9406      	str	r4, [sp, #24]
c0d05708:	9205      	str	r2, [sp, #20]
c0d0570a:	d901      	bls.n	c0d05710 <str_formatUint64+0x38>
c0d0570c:	4628      	mov	r0, r5
c0d0570e:	e000      	b.n	c0d05712 <str_formatUint64+0x3a>
c0d05710:	2001      	movs	r0, #1
c0d05712:	4923      	ldr	r1, [pc, #140]	; (c0d057a0 <str_formatUint64+0xc8>)
c0d05714:	4479      	add	r1, pc
c0d05716:	f7fa fda3 	bl	c0d00260 <assert>
c0d0571a:	240a      	movs	r4, #10
c0d0571c:	4630      	mov	r0, r6
c0d0571e:	4639      	mov	r1, r7
c0d05720:	4622      	mov	r2, r4
c0d05722:	462b      	mov	r3, r5
c0d05724:	f001 feaa 	bl	c0d0747c <__aeabi_uldivmod>
c0d05728:	9003      	str	r0, [sp, #12]
c0d0572a:	9704      	str	r7, [sp, #16]
c0d0572c:	460f      	mov	r7, r1
c0d0572e:	4622      	mov	r2, r4
c0d05730:	462b      	mov	r3, r5
c0d05732:	f001 fec3 	bl	c0d074bc <__aeabi_lmul>
c0d05736:	1a30      	subs	r0, r6, r0
c0d05738:	2130      	movs	r1, #48	; 0x30
c0d0573a:	4301      	orrs	r1, r0
c0d0573c:	9c06      	ldr	r4, [sp, #24]
c0d0573e:	9805      	ldr	r0, [sp, #20]
c0d05740:	5501      	strb	r1, [r0, r4]
c0d05742:	1c64      	adds	r4, r4, #1
c0d05744:	2009      	movs	r0, #9
c0d05746:	1b80      	subs	r0, r0, r6
c0d05748:	4628      	mov	r0, r5
c0d0574a:	9904      	ldr	r1, [sp, #16]
c0d0574c:	4188      	sbcs	r0, r1
c0d0574e:	9e03      	ldr	r6, [sp, #12]
c0d05750:	d3d4      	bcc.n	c0d056fc <str_formatUint64+0x24>
c0d05752:	1c60      	adds	r0, r4, #1
c0d05754:	9900      	ldr	r1, [sp, #0]
c0d05756:	4288      	cmp	r0, r1
c0d05758:	d81b      	bhi.n	c0d05792 <str_formatUint64+0xba>
c0d0575a:	9901      	ldr	r1, [sp, #4]
c0d0575c:	4622      	mov	r2, r4
c0d0575e:	2a00      	cmp	r2, #0
c0d05760:	d008      	beq.n	c0d05774 <str_formatUint64+0x9c>
c0d05762:	ab07      	add	r3, sp, #28
c0d05764:	181b      	adds	r3, r3, r0
c0d05766:	1e9b      	subs	r3, r3, #2
c0d05768:	781b      	ldrb	r3, [r3, #0]
c0d0576a:	700b      	strb	r3, [r1, #0]
c0d0576c:	1c49      	adds	r1, r1, #1
c0d0576e:	1e40      	subs	r0, r0, #1
c0d05770:	1e52      	subs	r2, r2, #1
c0d05772:	e7f4      	b.n	c0d0575e <str_formatUint64+0x86>
c0d05774:	2100      	movs	r1, #0
c0d05776:	9801      	ldr	r0, [sp, #4]
c0d05778:	5501      	strb	r1, [r0, r4]
c0d0577a:	f002 f8bd 	bl	c0d078f8 <strlen>
c0d0577e:	1b01      	subs	r1, r0, r4
c0d05780:	4248      	negs	r0, r1
c0d05782:	4148      	adcs	r0, r1
c0d05784:	4907      	ldr	r1, [pc, #28]	; (c0d057a4 <str_formatUint64+0xcc>)
c0d05786:	4479      	add	r1, pc
c0d05788:	f7fa fd6a 	bl	c0d00260 <assert>
c0d0578c:	4620      	mov	r0, r4
c0d0578e:	b00f      	add	sp, #60	; 0x3c
c0d05790:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d05792:	4801      	ldr	r0, [pc, #4]	; (c0d05798 <str_formatUint64+0xc0>)
c0d05794:	f7fd fa5f 	bl	c0d02c56 <os_longjmp>
c0d05798:	00004711 	.word	0x00004711
c0d0579c:	00003cfe 	.word	0x00003cfe
c0d057a0:	00003ce9 	.word	0x00003ce9
c0d057a4:	00003c8a 	.word	0x00003c8a

c0d057a8 <str_validateTextBuffer>:
c0d057a8:	b5b0      	push	{r4, r5, r7, lr}
c0d057aa:	460c      	mov	r4, r1
c0d057ac:	4605      	mov	r5, r0
c0d057ae:	0a89      	lsrs	r1, r1, #10
c0d057b0:	4248      	negs	r0, r1
c0d057b2:	4148      	adcs	r0, r1
c0d057b4:	4909      	ldr	r1, [pc, #36]	; (c0d057dc <str_validateTextBuffer+0x34>)
c0d057b6:	4479      	add	r1, pc
c0d057b8:	f7fa fd52 	bl	c0d00260 <assert>
c0d057bc:	2c00      	cmp	r4, #0
c0d057be:	d009      	beq.n	c0d057d4 <str_validateTextBuffer+0x2c>
c0d057c0:	7828      	ldrb	r0, [r5, #0]
c0d057c2:	287f      	cmp	r0, #127	; 0x7f
c0d057c4:	d203      	bcs.n	c0d057ce <str_validateTextBuffer+0x26>
c0d057c6:	1c6d      	adds	r5, r5, #1
c0d057c8:	1e64      	subs	r4, r4, #1
c0d057ca:	281f      	cmp	r0, #31
c0d057cc:	d8f6      	bhi.n	c0d057bc <str_validateTextBuffer+0x14>
c0d057ce:	4802      	ldr	r0, [pc, #8]	; (c0d057d8 <str_validateTextBuffer+0x30>)
c0d057d0:	f7fd fa41 	bl	c0d02c56 <os_longjmp>
c0d057d4:	bdb0      	pop	{r4, r5, r7, pc}
c0d057d6:	46c0      	nop			; (mov r8, r8)
c0d057d8:	00006e07 	.word	0x00006e07
c0d057dc:	00003c6d 	.word	0x00003c6d

c0d057e0 <assert_uiPaginatedText_magic>:
c0d057e0:	b580      	push	{r7, lr}
c0d057e2:	4805      	ldr	r0, [pc, #20]	; (c0d057f8 <assert_uiPaginatedText_magic+0x18>)
c0d057e4:	8800      	ldrh	r0, [r0, #0]
c0d057e6:	4905      	ldr	r1, [pc, #20]	; (c0d057fc <assert_uiPaginatedText_magic+0x1c>)
c0d057e8:	1841      	adds	r1, r0, r1
c0d057ea:	4248      	negs	r0, r1
c0d057ec:	4148      	adcs	r0, r1
c0d057ee:	4904      	ldr	r1, [pc, #16]	; (c0d05800 <assert_uiPaginatedText_magic+0x20>)
c0d057f0:	4479      	add	r1, pc
c0d057f2:	f7fa fd35 	bl	c0d00260 <assert>
c0d057f6:	bd80      	pop	{r7, pc}
c0d057f8:	200009b0 	.word	0x200009b0
c0d057fc:	fffff6d7 	.word	0xfffff6d7
c0d05800:	00003c46 	.word	0x00003c46

c0d05804 <assert_uiPrompt_magic>:
c0d05804:	b580      	push	{r7, lr}
c0d05806:	4805      	ldr	r0, [pc, #20]	; (c0d0581c <assert_uiPrompt_magic+0x18>)
c0d05808:	8800      	ldrh	r0, [r0, #0]
c0d0580a:	4905      	ldr	r1, [pc, #20]	; (c0d05820 <assert_uiPrompt_magic+0x1c>)
c0d0580c:	1841      	adds	r1, r0, r1
c0d0580e:	4248      	negs	r0, r1
c0d05810:	4148      	adcs	r0, r1
c0d05812:	4904      	ldr	r1, [pc, #16]	; (c0d05824 <assert_uiPrompt_magic+0x20>)
c0d05814:	4479      	add	r1, pc
c0d05816:	f7fa fd23 	bl	c0d00260 <assert>
c0d0581a:	bd80      	pop	{r7, pc}
c0d0581c:	200009b0 	.word	0x200009b0
c0d05820:	ffffeac8 	.word	0xffffeac8
c0d05824:	00003c35 	.word	0x00003c35

c0d05828 <uiCallback_confirm>:
c0d05828:	b580      	push	{r7, lr}
c0d0582a:	6841      	ldr	r1, [r0, #4]
c0d0582c:	2900      	cmp	r1, #0
c0d0582e:	d00d      	beq.n	c0d0584c <uiCallback_confirm+0x24>
c0d05830:	7802      	ldrb	r2, [r0, #0]
c0d05832:	2a01      	cmp	r2, #1
c0d05834:	d00a      	beq.n	c0d0584c <uiCallback_confirm+0x24>
c0d05836:	2a00      	cmp	r2, #0
c0d05838:	d103      	bne.n	c0d05842 <uiCallback_confirm+0x1a>
c0d0583a:	2201      	movs	r2, #1
c0d0583c:	7002      	strb	r2, [r0, #0]
c0d0583e:	4788      	blx	r1
c0d05840:	bd80      	pop	{r7, pc}
c0d05842:	2000      	movs	r0, #0
c0d05844:	4902      	ldr	r1, [pc, #8]	; (c0d05850 <uiCallback_confirm+0x28>)
c0d05846:	4479      	add	r1, pc
c0d05848:	f7fa fd0a 	bl	c0d00260 <assert>
c0d0584c:	bd80      	pop	{r7, pc}
c0d0584e:	46c0      	nop			; (mov r8, r8)
c0d05850:	00003c16 	.word	0x00003c16

c0d05854 <uiCallback_reject>:
c0d05854:	b580      	push	{r7, lr}
c0d05856:	6881      	ldr	r1, [r0, #8]
c0d05858:	2900      	cmp	r1, #0
c0d0585a:	d00d      	beq.n	c0d05878 <uiCallback_reject+0x24>
c0d0585c:	7802      	ldrb	r2, [r0, #0]
c0d0585e:	2a01      	cmp	r2, #1
c0d05860:	d00a      	beq.n	c0d05878 <uiCallback_reject+0x24>
c0d05862:	2a00      	cmp	r2, #0
c0d05864:	d103      	bne.n	c0d0586e <uiCallback_reject+0x1a>
c0d05866:	2201      	movs	r2, #1
c0d05868:	7002      	strb	r2, [r0, #0]
c0d0586a:	4788      	blx	r1
c0d0586c:	bd80      	pop	{r7, pc}
c0d0586e:	2000      	movs	r0, #0
c0d05870:	4902      	ldr	r1, [pc, #8]	; (c0d0587c <uiCallback_reject+0x28>)
c0d05872:	4479      	add	r1, pc
c0d05874:	f7fa fcf4 	bl	c0d00260 <assert>
c0d05878:	bd80      	pop	{r7, pc}
c0d0587a:	46c0      	nop			; (mov r8, r8)
c0d0587c:	00003bfd 	.word	0x00003bfd

c0d05880 <ui_displayPrompt>:
c0d05880:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05882:	b087      	sub	sp, #28
c0d05884:	9305      	str	r3, [sp, #20]
c0d05886:	9204      	str	r2, [sp, #16]
c0d05888:	460c      	mov	r4, r1
c0d0588a:	9002      	str	r0, [sp, #8]
c0d0588c:	f002 f834 	bl	c0d078f8 <strlen>
c0d05890:	4601      	mov	r1, r0
c0d05892:	2701      	movs	r7, #1
c0d05894:	2000      	movs	r0, #0
c0d05896:	9006      	str	r0, [sp, #24]
c0d05898:	9101      	str	r1, [sp, #4]
c0d0589a:	291e      	cmp	r1, #30
c0d0589c:	463e      	mov	r6, r7
c0d0589e:	d300      	bcc.n	c0d058a2 <ui_displayPrompt+0x22>
c0d058a0:	9e06      	ldr	r6, [sp, #24]
c0d058a2:	9403      	str	r4, [sp, #12]
c0d058a4:	4620      	mov	r0, r4
c0d058a6:	f002 f827 	bl	c0d078f8 <strlen>
c0d058aa:	4605      	mov	r5, r0
c0d058ac:	491e      	ldr	r1, [pc, #120]	; (c0d05928 <ui_displayPrompt+0xa8>)
c0d058ae:	4479      	add	r1, pc
c0d058b0:	4c1e      	ldr	r4, [pc, #120]	; (c0d0592c <ui_displayPrompt+0xac>)
c0d058b2:	447c      	add	r4, pc
c0d058b4:	4630      	mov	r0, r6
c0d058b6:	47a0      	blx	r4
c0d058b8:	2d1e      	cmp	r5, #30
c0d058ba:	d300      	bcc.n	c0d058be <ui_displayPrompt+0x3e>
c0d058bc:	9f06      	ldr	r7, [sp, #24]
c0d058be:	491c      	ldr	r1, [pc, #112]	; (c0d05930 <ui_displayPrompt+0xb0>)
c0d058c0:	4479      	add	r1, pc
c0d058c2:	4638      	mov	r0, r7
c0d058c4:	47a0      	blx	r4
c0d058c6:	2043      	movs	r0, #67	; 0x43
c0d058c8:	0081      	lsls	r1, r0, #2
c0d058ca:	4e14      	ldr	r6, [pc, #80]	; (c0d0591c <ui_displayPrompt+0x9c>)
c0d058cc:	4630      	mov	r0, r6
c0d058ce:	f001 fed5 	bl	c0d0767c <explicit_bzero>
c0d058d2:	1cb0      	adds	r0, r6, #2
c0d058d4:	9901      	ldr	r1, [sp, #4]
c0d058d6:	1c4a      	adds	r2, r1, #1
c0d058d8:	9902      	ldr	r1, [sp, #8]
c0d058da:	f001 fec3 	bl	c0d07664 <__aeabi_memmove>
c0d058de:	4630      	mov	r0, r6
c0d058e0:	3020      	adds	r0, #32
c0d058e2:	1c6a      	adds	r2, r5, #1
c0d058e4:	9903      	ldr	r1, [sp, #12]
c0d058e6:	f001 febd 	bl	c0d07664 <__aeabi_memmove>
c0d058ea:	2040      	movs	r0, #64	; 0x40
c0d058ec:	9906      	ldr	r1, [sp, #24]
c0d058ee:	5431      	strb	r1, [r6, r0]
c0d058f0:	9804      	ldr	r0, [sp, #16]
c0d058f2:	6470      	str	r0, [r6, #68]	; 0x44
c0d058f4:	9805      	ldr	r0, [sp, #20]
c0d058f6:	64b0      	str	r0, [r6, #72]	; 0x48
c0d058f8:	4809      	ldr	r0, [pc, #36]	; (c0d05920 <ui_displayPrompt+0xa0>)
c0d058fa:	8030      	strh	r0, [r6, #0]
c0d058fc:	4d09      	ldr	r5, [pc, #36]	; (c0d05924 <ui_displayPrompt+0xa4>)
c0d058fe:	7829      	ldrb	r1, [r5, #0]
c0d05900:	392f      	subs	r1, #47	; 0x2f
c0d05902:	2002      	movs	r0, #2
c0d05904:	4381      	bics	r1, r0
c0d05906:	4248      	negs	r0, r1
c0d05908:	4148      	adcs	r0, r1
c0d0590a:	490a      	ldr	r1, [pc, #40]	; (c0d05934 <ui_displayPrompt+0xb4>)
c0d0590c:	4479      	add	r1, pc
c0d0590e:	47a0      	blx	r4
c0d05910:	202f      	movs	r0, #47	; 0x2f
c0d05912:	7028      	strb	r0, [r5, #0]
c0d05914:	f000 f9d2 	bl	c0d05cbc <ui_displayPrompt_run>
c0d05918:	b007      	add	sp, #28
c0d0591a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0591c:	200009b0 	.word	0x200009b0
c0d05920:	00001538 	.word	0x00001538
c0d05924:	20000284 	.word	0x20000284
c0d05928:	00003bd4 	.word	0x00003bd4
c0d0592c:	ffffa9ab 	.word	0xffffa9ab
c0d05930:	00003bd6 	.word	0x00003bd6
c0d05934:	00003b9e 	.word	0x00003b9e

c0d05938 <ui_displayPaginatedText>:
c0d05938:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0593a:	b085      	sub	sp, #20
c0d0593c:	9203      	str	r2, [sp, #12]
c0d0593e:	460c      	mov	r4, r1
c0d05940:	9000      	str	r0, [sp, #0]
c0d05942:	f001 ffd9 	bl	c0d078f8 <strlen>
c0d05946:	4606      	mov	r6, r0
c0d05948:	2501      	movs	r5, #1
c0d0594a:	2700      	movs	r7, #0
c0d0594c:	281e      	cmp	r0, #30
c0d0594e:	9504      	str	r5, [sp, #16]
c0d05950:	d300      	bcc.n	c0d05954 <ui_displayPaginatedText+0x1c>
c0d05952:	463d      	mov	r5, r7
c0d05954:	9402      	str	r4, [sp, #8]
c0d05956:	4620      	mov	r0, r4
c0d05958:	f001 ffce 	bl	c0d078f8 <strlen>
c0d0595c:	4604      	mov	r4, r0
c0d0595e:	4924      	ldr	r1, [pc, #144]	; (c0d059f0 <ui_displayPaginatedText+0xb8>)
c0d05960:	4479      	add	r1, pc
c0d05962:	4a24      	ldr	r2, [pc, #144]	; (c0d059f4 <ui_displayPaginatedText+0xbc>)
c0d05964:	447a      	add	r2, pc
c0d05966:	4628      	mov	r0, r5
c0d05968:	4615      	mov	r5, r2
c0d0596a:	4790      	blx	r2
c0d0596c:	2cc8      	cmp	r4, #200	; 0xc8
c0d0596e:	9804      	ldr	r0, [sp, #16]
c0d05970:	d300      	bcc.n	c0d05974 <ui_displayPaginatedText+0x3c>
c0d05972:	4638      	mov	r0, r7
c0d05974:	4920      	ldr	r1, [pc, #128]	; (c0d059f8 <ui_displayPaginatedText+0xc0>)
c0d05976:	4479      	add	r1, pc
c0d05978:	9501      	str	r5, [sp, #4]
c0d0597a:	47a8      	blx	r5
c0d0597c:	2043      	movs	r0, #67	; 0x43
c0d0597e:	0081      	lsls	r1, r0, #2
c0d05980:	4d18      	ldr	r5, [pc, #96]	; (c0d059e4 <ui_displayPaginatedText+0xac>)
c0d05982:	4628      	mov	r0, r5
c0d05984:	f001 fe7a 	bl	c0d0767c <explicit_bzero>
c0d05988:	1ca8      	adds	r0, r5, #2
c0d0598a:	9900      	ldr	r1, [sp, #0]
c0d0598c:	4632      	mov	r2, r6
c0d0598e:	f001 fe69 	bl	c0d07664 <__aeabi_memmove>
c0d05992:	462e      	mov	r6, r5
c0d05994:	3632      	adds	r6, #50	; 0x32
c0d05996:	4630      	mov	r0, r6
c0d05998:	9902      	ldr	r1, [sp, #8]
c0d0599a:	4622      	mov	r2, r4
c0d0599c:	f001 fe62 	bl	c0d07664 <__aeabi_memmove>
c0d059a0:	20fc      	movs	r0, #252	; 0xfc
c0d059a2:	502f      	str	r7, [r5, r0]
c0d059a4:	4628      	mov	r0, r5
c0d059a6:	3020      	adds	r0, #32
c0d059a8:	2211      	movs	r2, #17
c0d059aa:	4631      	mov	r1, r6
c0d059ac:	f001 fe56 	bl	c0d0765c <__aeabi_memcpy>
c0d059b0:	9804      	ldr	r0, [sp, #16]
c0d059b2:	0200      	lsls	r0, r0, #8
c0d059b4:	542f      	strb	r7, [r5, r0]
c0d059b6:	1828      	adds	r0, r5, r0
c0d059b8:	9903      	ldr	r1, [sp, #12]
c0d059ba:	6041      	str	r1, [r0, #4]
c0d059bc:	6087      	str	r7, [r0, #8]
c0d059be:	480a      	ldr	r0, [pc, #40]	; (c0d059e8 <ui_displayPaginatedText+0xb0>)
c0d059c0:	8028      	strh	r0, [r5, #0]
c0d059c2:	4c0a      	ldr	r4, [pc, #40]	; (c0d059ec <ui_displayPaginatedText+0xb4>)
c0d059c4:	7821      	ldrb	r1, [r4, #0]
c0d059c6:	392f      	subs	r1, #47	; 0x2f
c0d059c8:	2002      	movs	r0, #2
c0d059ca:	4381      	bics	r1, r0
c0d059cc:	4248      	negs	r0, r1
c0d059ce:	4148      	adcs	r0, r1
c0d059d0:	490a      	ldr	r1, [pc, #40]	; (c0d059fc <ui_displayPaginatedText+0xc4>)
c0d059d2:	4479      	add	r1, pc
c0d059d4:	9a01      	ldr	r2, [sp, #4]
c0d059d6:	4790      	blx	r2
c0d059d8:	202f      	movs	r0, #47	; 0x2f
c0d059da:	7020      	strb	r0, [r4, #0]
c0d059dc:	f000 f9ec 	bl	c0d05db8 <ui_displayPaginatedText_run>
c0d059e0:	b005      	add	sp, #20
c0d059e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d059e4:	200009b0 	.word	0x200009b0
c0d059e8:	00000929 	.word	0x00000929
c0d059ec:	20000284 	.word	0x20000284
c0d059f0:	00003b5e 	.word	0x00003b5e
c0d059f4:	ffffa8f9 	.word	0xffffa8f9
c0d059f8:	00003b5c 	.word	0x00003b5c
c0d059fc:	00003b14 	.word	0x00003b14

c0d05a00 <respond_with_user_reject>:
c0d05a00:	b580      	push	{r7, lr}
c0d05a02:	2041      	movs	r0, #65	; 0x41
c0d05a04:	0081      	lsls	r1, r0, #2
c0d05a06:	4805      	ldr	r0, [pc, #20]	; (c0d05a1c <respond_with_user_reject+0x1c>)
c0d05a08:	f001 fe38 	bl	c0d0767c <explicit_bzero>
c0d05a0c:	4804      	ldr	r0, [pc, #16]	; (c0d05a20 <respond_with_user_reject+0x20>)
c0d05a0e:	2100      	movs	r1, #0
c0d05a10:	460a      	mov	r2, r1
c0d05a12:	f7fc fd31 	bl	c0d02478 <io_send_buf>
c0d05a16:	f7fa fb3f 	bl	c0d00098 <ui_idle>
c0d05a1a:	bd80      	pop	{r7, pc}
c0d05a1c:	20000398 	.word	0x20000398
c0d05a20:	00006e09 	.word	0x00006e09

c0d05a24 <ui_paginatedText_button>:
c0d05a24:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05a26:	b08d      	sub	sp, #52	; 0x34
c0d05a28:	4604      	mov	r4, r0
c0d05a2a:	ad01      	add	r5, sp, #4
c0d05a2c:	4628      	mov	r0, r5
c0d05a2e:	f001 ff49 	bl	c0d078c4 <setjmp>
c0d05a32:	85a8      	strh	r0, [r5, #44]	; 0x2c
c0d05a34:	b280      	uxth	r0, r0
c0d05a36:	2800      	cmp	r0, #0
c0d05a38:	d00a      	beq.n	c0d05a50 <ui_paginatedText_button+0x2c>
c0d05a3a:	2805      	cmp	r0, #5
c0d05a3c:	d05e      	beq.n	c0d05afc <ui_paginatedText_button+0xd8>
c0d05a3e:	a801      	add	r0, sp, #4
c0d05a40:	2100      	movs	r1, #0
c0d05a42:	8581      	strh	r1, [r0, #44]	; 0x2c
c0d05a44:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d05a46:	f7ff fd63 	bl	c0d05510 <try_context_set>
c0d05a4a:	f7fd fb05 	bl	c0d03058 <io_seproxyhal_se_reset>
c0d05a4e:	e044      	b.n	c0d05ada <ui_paginatedText_button+0xb6>
c0d05a50:	a801      	add	r0, sp, #4
c0d05a52:	f7ff fd5d 	bl	c0d05510 <try_context_set>
c0d05a56:	900b      	str	r0, [sp, #44]	; 0x2c
c0d05a58:	f7ff fec2 	bl	c0d057e0 <assert_uiPaginatedText_magic>
c0d05a5c:	482c      	ldr	r0, [pc, #176]	; (c0d05b10 <ui_paginatedText_button+0xec>)
c0d05a5e:	7801      	ldrb	r1, [r0, #0]
c0d05a60:	392f      	subs	r1, #47	; 0x2f
c0d05a62:	4248      	negs	r0, r1
c0d05a64:	4148      	adcs	r0, r1
c0d05a66:	492f      	ldr	r1, [pc, #188]	; (c0d05b24 <ui_paginatedText_button+0x100>)
c0d05a68:	4479      	add	r1, pc
c0d05a6a:	f7fa fbf9 	bl	c0d00260 <assert>
c0d05a6e:	f7fd f83b 	bl	c0d02ae8 <device_is_unlocked>
c0d05a72:	492d      	ldr	r1, [pc, #180]	; (c0d05b28 <ui_paginatedText_button+0x104>)
c0d05a74:	4479      	add	r1, pc
c0d05a76:	f7fa fbf3 	bl	c0d00260 <assert>
c0d05a7a:	4826      	ldr	r0, [pc, #152]	; (c0d05b14 <ui_paginatedText_button+0xf0>)
c0d05a7c:	4284      	cmp	r4, r0
c0d05a7e:	d026      	beq.n	c0d05ace <ui_paginatedText_button+0xaa>
c0d05a80:	2c01      	cmp	r4, #1
c0d05a82:	d007      	beq.n	c0d05a94 <ui_paginatedText_button+0x70>
c0d05a84:	2c02      	cmp	r4, #2
c0d05a86:	d00f      	beq.n	c0d05aa8 <ui_paginatedText_button+0x84>
c0d05a88:	4823      	ldr	r0, [pc, #140]	; (c0d05b18 <ui_paginatedText_button+0xf4>)
c0d05a8a:	4284      	cmp	r4, r0
c0d05a8c:	d00c      	beq.n	c0d05aa8 <ui_paginatedText_button+0x84>
c0d05a8e:	4823      	ldr	r0, [pc, #140]	; (c0d05b1c <ui_paginatedText_button+0xf8>)
c0d05a90:	4284      	cmp	r4, r0
c0d05a92:	d122      	bne.n	c0d05ada <ui_paginatedText_button+0xb6>
c0d05a94:	f7ff fea4 	bl	c0d057e0 <assert_uiPaginatedText_magic>
c0d05a98:	20fc      	movs	r0, #252	; 0xfc
c0d05a9a:	4921      	ldr	r1, [pc, #132]	; (c0d05b20 <ui_paginatedText_button+0xfc>)
c0d05a9c:	580a      	ldr	r2, [r1, r0]
c0d05a9e:	2a00      	cmp	r2, #0
c0d05aa0:	d01b      	beq.n	c0d05ada <ui_paginatedText_button+0xb6>
c0d05aa2:	1e52      	subs	r2, r2, #1
c0d05aa4:	500a      	str	r2, [r1, r0]
c0d05aa6:	e00f      	b.n	c0d05ac8 <ui_paginatedText_button+0xa4>
c0d05aa8:	f7ff fe9a 	bl	c0d057e0 <assert_uiPaginatedText_magic>
c0d05aac:	24fc      	movs	r4, #252	; 0xfc
c0d05aae:	4d1c      	ldr	r5, [pc, #112]	; (c0d05b20 <ui_paginatedText_button+0xfc>)
c0d05ab0:	592e      	ldr	r6, [r5, r4]
c0d05ab2:	4637      	mov	r7, r6
c0d05ab4:	3712      	adds	r7, #18
c0d05ab6:	4628      	mov	r0, r5
c0d05ab8:	3032      	adds	r0, #50	; 0x32
c0d05aba:	f001 ff1d 	bl	c0d078f8 <strlen>
c0d05abe:	1c40      	adds	r0, r0, #1
c0d05ac0:	4287      	cmp	r7, r0
c0d05ac2:	d20a      	bcs.n	c0d05ada <ui_paginatedText_button+0xb6>
c0d05ac4:	1c70      	adds	r0, r6, #1
c0d05ac6:	5128      	str	r0, [r5, r4]
c0d05ac8:	f000 fa08 	bl	c0d05edc <scroll_update_display_content>
c0d05acc:	e005      	b.n	c0d05ada <ui_paginatedText_button+0xb6>
c0d05ace:	2001      	movs	r0, #1
c0d05ad0:	0200      	lsls	r0, r0, #8
c0d05ad2:	4913      	ldr	r1, [pc, #76]	; (c0d05b20 <ui_paginatedText_button+0xfc>)
c0d05ad4:	1808      	adds	r0, r1, r0
c0d05ad6:	f7ff fea7 	bl	c0d05828 <uiCallback_confirm>
c0d05ada:	f7ff fd0f 	bl	c0d054fc <try_context_get>
c0d05ade:	a901      	add	r1, sp, #4
c0d05ae0:	4288      	cmp	r0, r1
c0d05ae2:	d102      	bne.n	c0d05aea <ui_paginatedText_button+0xc6>
c0d05ae4:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d05ae6:	f7ff fd13 	bl	c0d05510 <try_context_set>
c0d05aea:	a801      	add	r0, sp, #4
c0d05aec:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d05aee:	2800      	cmp	r0, #0
c0d05af0:	d102      	bne.n	c0d05af8 <ui_paginatedText_button+0xd4>
c0d05af2:	2000      	movs	r0, #0
c0d05af4:	b00d      	add	sp, #52	; 0x34
c0d05af6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d05af8:	f7fd f8ad 	bl	c0d02c56 <os_longjmp>
c0d05afc:	a801      	add	r0, sp, #4
c0d05afe:	2100      	movs	r1, #0
c0d05b00:	8581      	strh	r1, [r0, #44]	; 0x2c
c0d05b02:	980b      	ldr	r0, [sp, #44]	; 0x2c
c0d05b04:	f7ff fd04 	bl	c0d05510 <try_context_set>
c0d05b08:	2005      	movs	r0, #5
c0d05b0a:	f7fd f8a4 	bl	c0d02c56 <os_longjmp>
c0d05b0e:	46c0      	nop			; (mov r8, r8)
c0d05b10:	20000284 	.word	0x20000284
c0d05b14:	80000003 	.word	0x80000003
c0d05b18:	40000002 	.word	0x40000002
c0d05b1c:	40000001 	.word	0x40000001
c0d05b20:	200009b0 	.word	0x200009b0
c0d05b24:	00003a92 	.word	0x00003a92
c0d05b28:	00003a9f 	.word	0x00003a9f

c0d05b2c <ui_prompt_button>:
c0d05b2c:	b5b0      	push	{r4, r5, r7, lr}
c0d05b2e:	b08c      	sub	sp, #48	; 0x30
c0d05b30:	4604      	mov	r4, r0
c0d05b32:	466d      	mov	r5, sp
c0d05b34:	4628      	mov	r0, r5
c0d05b36:	f001 fec5 	bl	c0d078c4 <setjmp>
c0d05b3a:	85a8      	strh	r0, [r5, #44]	; 0x2c
c0d05b3c:	b280      	uxth	r0, r0
c0d05b3e:	2800      	cmp	r0, #0
c0d05b40:	d00a      	beq.n	c0d05b58 <ui_prompt_button+0x2c>
c0d05b42:	2805      	cmp	r0, #5
c0d05b44:	d03f      	beq.n	c0d05bc6 <ui_prompt_button+0x9a>
c0d05b46:	4668      	mov	r0, sp
c0d05b48:	2100      	movs	r1, #0
c0d05b4a:	8581      	strh	r1, [r0, #44]	; 0x2c
c0d05b4c:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d05b4e:	f7ff fcdf 	bl	c0d05510 <try_context_set>
c0d05b52:	f7fd fa81 	bl	c0d03058 <io_seproxyhal_se_reset>
c0d05b56:	e025      	b.n	c0d05ba4 <ui_prompt_button+0x78>
c0d05b58:	4668      	mov	r0, sp
c0d05b5a:	f7ff fcd9 	bl	c0d05510 <try_context_set>
c0d05b5e:	900a      	str	r0, [sp, #40]	; 0x28
c0d05b60:	f7ff fe50 	bl	c0d05804 <assert_uiPrompt_magic>
c0d05b64:	481c      	ldr	r0, [pc, #112]	; (c0d05bd8 <ui_prompt_button+0xac>)
c0d05b66:	7801      	ldrb	r1, [r0, #0]
c0d05b68:	392f      	subs	r1, #47	; 0x2f
c0d05b6a:	4248      	negs	r0, r1
c0d05b6c:	4148      	adcs	r0, r1
c0d05b6e:	491e      	ldr	r1, [pc, #120]	; (c0d05be8 <ui_prompt_button+0xbc>)
c0d05b70:	4479      	add	r1, pc
c0d05b72:	1c49      	adds	r1, r1, #1
c0d05b74:	f7fa fb74 	bl	c0d00260 <assert>
c0d05b78:	f7fc ffb6 	bl	c0d02ae8 <device_is_unlocked>
c0d05b7c:	491b      	ldr	r1, [pc, #108]	; (c0d05bec <ui_prompt_button+0xc0>)
c0d05b7e:	4479      	add	r1, pc
c0d05b80:	1c49      	adds	r1, r1, #1
c0d05b82:	f7fa fb6d 	bl	c0d00260 <assert>
c0d05b86:	4815      	ldr	r0, [pc, #84]	; (c0d05bdc <ui_prompt_button+0xb0>)
c0d05b88:	4284      	cmp	r4, r0
c0d05b8a:	d007      	beq.n	c0d05b9c <ui_prompt_button+0x70>
c0d05b8c:	4814      	ldr	r0, [pc, #80]	; (c0d05be0 <ui_prompt_button+0xb4>)
c0d05b8e:	4284      	cmp	r4, r0
c0d05b90:	d108      	bne.n	c0d05ba4 <ui_prompt_button+0x78>
c0d05b92:	4814      	ldr	r0, [pc, #80]	; (c0d05be4 <ui_prompt_button+0xb8>)
c0d05b94:	3040      	adds	r0, #64	; 0x40
c0d05b96:	f7ff fe5d 	bl	c0d05854 <uiCallback_reject>
c0d05b9a:	e003      	b.n	c0d05ba4 <ui_prompt_button+0x78>
c0d05b9c:	4811      	ldr	r0, [pc, #68]	; (c0d05be4 <ui_prompt_button+0xb8>)
c0d05b9e:	3040      	adds	r0, #64	; 0x40
c0d05ba0:	f7ff fe42 	bl	c0d05828 <uiCallback_confirm>
c0d05ba4:	f7ff fcaa 	bl	c0d054fc <try_context_get>
c0d05ba8:	4669      	mov	r1, sp
c0d05baa:	4288      	cmp	r0, r1
c0d05bac:	d102      	bne.n	c0d05bb4 <ui_prompt_button+0x88>
c0d05bae:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d05bb0:	f7ff fcae 	bl	c0d05510 <try_context_set>
c0d05bb4:	4668      	mov	r0, sp
c0d05bb6:	8d80      	ldrh	r0, [r0, #44]	; 0x2c
c0d05bb8:	2800      	cmp	r0, #0
c0d05bba:	d102      	bne.n	c0d05bc2 <ui_prompt_button+0x96>
c0d05bbc:	2000      	movs	r0, #0
c0d05bbe:	b00c      	add	sp, #48	; 0x30
c0d05bc0:	bdb0      	pop	{r4, r5, r7, pc}
c0d05bc2:	f7fd f848 	bl	c0d02c56 <os_longjmp>
c0d05bc6:	4668      	mov	r0, sp
c0d05bc8:	2100      	movs	r1, #0
c0d05bca:	8581      	strh	r1, [r0, #44]	; 0x2c
c0d05bcc:	980a      	ldr	r0, [sp, #40]	; 0x28
c0d05bce:	f7ff fc9f 	bl	c0d05510 <try_context_set>
c0d05bd2:	2005      	movs	r0, #5
c0d05bd4:	f7fd f83f 	bl	c0d02c56 <os_longjmp>
c0d05bd8:	20000284 	.word	0x20000284
c0d05bdc:	80000002 	.word	0x80000002
c0d05be0:	80000001 	.word	0x80000001
c0d05be4:	200009b0 	.word	0x200009b0
c0d05be8:	000039bc 	.word	0x000039bc
c0d05bec:	000039c8 	.word	0x000039c8

c0d05bf0 <ui_displayBusy>:
c0d05bf0:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d05bf2:	20d4      	movs	r0, #212	; 0xd4
c0d05bf4:	4e2c      	ldr	r6, [pc, #176]	; (c0d05ca8 <ui_displayBusy+0xb8>)
c0d05bf6:	492e      	ldr	r1, [pc, #184]	; (c0d05cb0 <ui_displayBusy+0xc0>)
c0d05bf8:	4479      	add	r1, pc
c0d05bfa:	5031      	str	r1, [r6, r0]
c0d05bfc:	21c8      	movs	r1, #200	; 0xc8
c0d05bfe:	9101      	str	r1, [sp, #4]
c0d05c00:	2002      	movs	r0, #2
c0d05c02:	5470      	strb	r0, [r6, r1]
c0d05c04:	21c4      	movs	r1, #196	; 0xc4
c0d05c06:	9100      	str	r1, [sp, #0]
c0d05c08:	482a      	ldr	r0, [pc, #168]	; (c0d05cb4 <ui_displayBusy+0xc4>)
c0d05c0a:	4478      	add	r0, pc
c0d05c0c:	5070      	str	r0, [r6, r1]
c0d05c0e:	20d0      	movs	r0, #208	; 0xd0
c0d05c10:	2700      	movs	r7, #0
c0d05c12:	9002      	str	r0, [sp, #8]
c0d05c14:	5037      	str	r7, [r6, r0]
c0d05c16:	4825      	ldr	r0, [pc, #148]	; (c0d05cac <ui_displayBusy+0xbc>)
c0d05c18:	6047      	str	r7, [r0, #4]
c0d05c1a:	2103      	movs	r1, #3
c0d05c1c:	7001      	strb	r1, [r0, #0]
c0d05c1e:	4604      	mov	r4, r0
c0d05c20:	f7ff fc12 	bl	c0d05448 <os_ux>
c0d05c24:	2504      	movs	r5, #4
c0d05c26:	4628      	mov	r0, r5
c0d05c28:	f7ff fc7e 	bl	c0d05528 <os_sched_last_status>
c0d05c2c:	6060      	str	r0, [r4, #4]
c0d05c2e:	f7fd f93f 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d05c32:	f7fd f93f 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d05c36:	24c2      	movs	r4, #194	; 0xc2
c0d05c38:	5337      	strh	r7, [r6, r4]
c0d05c3a:	9f00      	ldr	r7, [sp, #0]
c0d05c3c:	4628      	mov	r0, r5
c0d05c3e:	9d01      	ldr	r5, [sp, #4]
c0d05c40:	f7ff fc72 	bl	c0d05528 <os_sched_last_status>
c0d05c44:	4919      	ldr	r1, [pc, #100]	; (c0d05cac <ui_displayBusy+0xbc>)
c0d05c46:	6048      	str	r0, [r1, #4]
c0d05c48:	2800      	cmp	r0, #0
c0d05c4a:	d02b      	beq.n	c0d05ca4 <ui_displayBusy+0xb4>
c0d05c4c:	2897      	cmp	r0, #151	; 0x97
c0d05c4e:	d029      	beq.n	c0d05ca4 <ui_displayBusy+0xb4>
c0d05c50:	e025      	b.n	c0d05c9e <ui_displayBusy+0xae>
c0d05c52:	5d70      	ldrb	r0, [r6, r5]
c0d05c54:	5b31      	ldrh	r1, [r6, r4]
c0d05c56:	4281      	cmp	r1, r0
c0d05c58:	d224      	bcs.n	c0d05ca4 <ui_displayBusy+0xb4>
c0d05c5a:	f7ff fc39 	bl	c0d054d0 <io_seph_is_status_sent>
c0d05c5e:	2800      	cmp	r0, #0
c0d05c60:	d120      	bne.n	c0d05ca4 <ui_displayBusy+0xb4>
c0d05c62:	f7ff fbbd 	bl	c0d053e0 <os_perso_isonboarded>
c0d05c66:	28aa      	cmp	r0, #170	; 0xaa
c0d05c68:	d103      	bne.n	c0d05c72 <ui_displayBusy+0x82>
c0d05c6a:	f7ff fbe1 	bl	c0d05430 <os_global_pin_is_validated>
c0d05c6e:	28aa      	cmp	r0, #170	; 0xaa
c0d05c70:	d118      	bne.n	c0d05ca4 <ui_displayBusy+0xb4>
c0d05c72:	59f1      	ldr	r1, [r6, r7]
c0d05c74:	5b32      	ldrh	r2, [r6, r4]
c0d05c76:	0150      	lsls	r0, r2, #5
c0d05c78:	1808      	adds	r0, r1, r0
c0d05c7a:	9b02      	ldr	r3, [sp, #8]
c0d05c7c:	58f3      	ldr	r3, [r6, r3]
c0d05c7e:	2b00      	cmp	r3, #0
c0d05c80:	d004      	beq.n	c0d05c8c <ui_displayBusy+0x9c>
c0d05c82:	4798      	blx	r3
c0d05c84:	2800      	cmp	r0, #0
c0d05c86:	d007      	beq.n	c0d05c98 <ui_displayBusy+0xa8>
c0d05c88:	5b32      	ldrh	r2, [r6, r4]
c0d05c8a:	59f1      	ldr	r1, [r6, r7]
c0d05c8c:	2801      	cmp	r0, #1
c0d05c8e:	d101      	bne.n	c0d05c94 <ui_displayBusy+0xa4>
c0d05c90:	0150      	lsls	r0, r2, #5
c0d05c92:	1808      	adds	r0, r1, r0
c0d05c94:	f7fc fc04 	bl	c0d024a0 <io_seproxyhal_display>
c0d05c98:	5b30      	ldrh	r0, [r6, r4]
c0d05c9a:	1c40      	adds	r0, r0, #1
c0d05c9c:	5330      	strh	r0, [r6, r4]
c0d05c9e:	59f0      	ldr	r0, [r6, r7]
c0d05ca0:	2800      	cmp	r0, #0
c0d05ca2:	d1d6      	bne.n	c0d05c52 <ui_displayBusy+0x62>
c0d05ca4:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d05ca6:	46c0      	nop			; (mov r8, r8)
c0d05ca8:	20000288 	.word	0x20000288
c0d05cac:	20000390 	.word	0x20000390
c0d05cb0:	000000bd 	.word	0x000000bd
c0d05cb4:	0000398a 	.word	0x0000398a

c0d05cb8 <ui_busy_button>:
c0d05cb8:	2000      	movs	r0, #0
c0d05cba:	4770      	bx	lr

c0d05cbc <ui_displayPrompt_run>:
c0d05cbc:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d05cbe:	20d4      	movs	r0, #212	; 0xd4
c0d05cc0:	4e2d      	ldr	r6, [pc, #180]	; (c0d05d78 <ui_displayPrompt_run+0xbc>)
c0d05cc2:	492f      	ldr	r1, [pc, #188]	; (c0d05d80 <ui_displayPrompt_run+0xc4>)
c0d05cc4:	4479      	add	r1, pc
c0d05cc6:	5031      	str	r1, [r6, r0]
c0d05cc8:	21c8      	movs	r1, #200	; 0xc8
c0d05cca:	9101      	str	r1, [sp, #4]
c0d05ccc:	2005      	movs	r0, #5
c0d05cce:	5470      	strb	r0, [r6, r1]
c0d05cd0:	21c4      	movs	r1, #196	; 0xc4
c0d05cd2:	9100      	str	r1, [sp, #0]
c0d05cd4:	482b      	ldr	r0, [pc, #172]	; (c0d05d84 <ui_displayPrompt_run+0xc8>)
c0d05cd6:	4478      	add	r0, pc
c0d05cd8:	5070      	str	r0, [r6, r1]
c0d05cda:	21d0      	movs	r1, #208	; 0xd0
c0d05cdc:	482a      	ldr	r0, [pc, #168]	; (c0d05d88 <ui_displayPrompt_run+0xcc>)
c0d05cde:	4478      	add	r0, pc
c0d05ce0:	9102      	str	r1, [sp, #8]
c0d05ce2:	5070      	str	r0, [r6, r1]
c0d05ce4:	4825      	ldr	r0, [pc, #148]	; (c0d05d7c <ui_displayPrompt_run+0xc0>)
c0d05ce6:	2700      	movs	r7, #0
c0d05ce8:	6047      	str	r7, [r0, #4]
c0d05cea:	2103      	movs	r1, #3
c0d05cec:	7001      	strb	r1, [r0, #0]
c0d05cee:	4604      	mov	r4, r0
c0d05cf0:	f7ff fbaa 	bl	c0d05448 <os_ux>
c0d05cf4:	2504      	movs	r5, #4
c0d05cf6:	4628      	mov	r0, r5
c0d05cf8:	f7ff fc16 	bl	c0d05528 <os_sched_last_status>
c0d05cfc:	6060      	str	r0, [r4, #4]
c0d05cfe:	f7fd f8d7 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d05d02:	f7fd f8d7 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d05d06:	24c2      	movs	r4, #194	; 0xc2
c0d05d08:	5337      	strh	r7, [r6, r4]
c0d05d0a:	9f00      	ldr	r7, [sp, #0]
c0d05d0c:	4628      	mov	r0, r5
c0d05d0e:	9d01      	ldr	r5, [sp, #4]
c0d05d10:	f7ff fc0a 	bl	c0d05528 <os_sched_last_status>
c0d05d14:	4919      	ldr	r1, [pc, #100]	; (c0d05d7c <ui_displayPrompt_run+0xc0>)
c0d05d16:	6048      	str	r0, [r1, #4]
c0d05d18:	2800      	cmp	r0, #0
c0d05d1a:	d02b      	beq.n	c0d05d74 <ui_displayPrompt_run+0xb8>
c0d05d1c:	2897      	cmp	r0, #151	; 0x97
c0d05d1e:	d029      	beq.n	c0d05d74 <ui_displayPrompt_run+0xb8>
c0d05d20:	e025      	b.n	c0d05d6e <ui_displayPrompt_run+0xb2>
c0d05d22:	5d70      	ldrb	r0, [r6, r5]
c0d05d24:	5b31      	ldrh	r1, [r6, r4]
c0d05d26:	4281      	cmp	r1, r0
c0d05d28:	d224      	bcs.n	c0d05d74 <ui_displayPrompt_run+0xb8>
c0d05d2a:	f7ff fbd1 	bl	c0d054d0 <io_seph_is_status_sent>
c0d05d2e:	2800      	cmp	r0, #0
c0d05d30:	d120      	bne.n	c0d05d74 <ui_displayPrompt_run+0xb8>
c0d05d32:	f7ff fb55 	bl	c0d053e0 <os_perso_isonboarded>
c0d05d36:	28aa      	cmp	r0, #170	; 0xaa
c0d05d38:	d103      	bne.n	c0d05d42 <ui_displayPrompt_run+0x86>
c0d05d3a:	f7ff fb79 	bl	c0d05430 <os_global_pin_is_validated>
c0d05d3e:	28aa      	cmp	r0, #170	; 0xaa
c0d05d40:	d118      	bne.n	c0d05d74 <ui_displayPrompt_run+0xb8>
c0d05d42:	59f1      	ldr	r1, [r6, r7]
c0d05d44:	5b32      	ldrh	r2, [r6, r4]
c0d05d46:	0150      	lsls	r0, r2, #5
c0d05d48:	1808      	adds	r0, r1, r0
c0d05d4a:	9b02      	ldr	r3, [sp, #8]
c0d05d4c:	58f3      	ldr	r3, [r6, r3]
c0d05d4e:	2b00      	cmp	r3, #0
c0d05d50:	d004      	beq.n	c0d05d5c <ui_displayPrompt_run+0xa0>
c0d05d52:	4798      	blx	r3
c0d05d54:	2800      	cmp	r0, #0
c0d05d56:	d007      	beq.n	c0d05d68 <ui_displayPrompt_run+0xac>
c0d05d58:	5b32      	ldrh	r2, [r6, r4]
c0d05d5a:	59f1      	ldr	r1, [r6, r7]
c0d05d5c:	2801      	cmp	r0, #1
c0d05d5e:	d101      	bne.n	c0d05d64 <ui_displayPrompt_run+0xa8>
c0d05d60:	0150      	lsls	r0, r2, #5
c0d05d62:	1808      	adds	r0, r1, r0
c0d05d64:	f7fc fb9c 	bl	c0d024a0 <io_seproxyhal_display>
c0d05d68:	5b30      	ldrh	r0, [r6, r4]
c0d05d6a:	1c40      	adds	r0, r0, #1
c0d05d6c:	5330      	strh	r0, [r6, r4]
c0d05d6e:	59f0      	ldr	r0, [r6, r7]
c0d05d70:	2800      	cmp	r0, #0
c0d05d72:	d1d6      	bne.n	c0d05d22 <ui_displayPrompt_run+0x66>
c0d05d74:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d05d76:	46c0      	nop			; (mov r8, r8)
c0d05d78:	20000288 	.word	0x20000288
c0d05d7c:	20000390 	.word	0x20000390
c0d05d80:	fffffe65 	.word	0xfffffe65
c0d05d84:	000038fe 	.word	0x000038fe
c0d05d88:	000000ab 	.word	0x000000ab

c0d05d8c <ui_prepro_prompt>:
c0d05d8c:	b510      	push	{r4, lr}
c0d05d8e:	4604      	mov	r4, r0
c0d05d90:	f7ff fd38 	bl	c0d05804 <assert_uiPrompt_magic>
c0d05d94:	7860      	ldrb	r0, [r4, #1]
c0d05d96:	2803      	cmp	r0, #3
c0d05d98:	d004      	beq.n	c0d05da4 <ui_prepro_prompt+0x18>
c0d05d9a:	2804      	cmp	r0, #4
c0d05d9c:	d107      	bne.n	c0d05dae <ui_prepro_prompt+0x22>
c0d05d9e:	4805      	ldr	r0, [pc, #20]	; (c0d05db4 <ui_prepro_prompt+0x28>)
c0d05da0:	6c80      	ldr	r0, [r0, #72]	; 0x48
c0d05da2:	e001      	b.n	c0d05da8 <ui_prepro_prompt+0x1c>
c0d05da4:	4803      	ldr	r0, [pc, #12]	; (c0d05db4 <ui_prepro_prompt+0x28>)
c0d05da6:	6c40      	ldr	r0, [r0, #68]	; 0x44
c0d05da8:	2800      	cmp	r0, #0
c0d05daa:	d100      	bne.n	c0d05dae <ui_prepro_prompt+0x22>
c0d05dac:	4604      	mov	r4, r0
c0d05dae:	4620      	mov	r0, r4
c0d05db0:	bd10      	pop	{r4, pc}
c0d05db2:	46c0      	nop			; (mov r8, r8)
c0d05db4:	200009b0 	.word	0x200009b0

c0d05db8 <ui_displayPaginatedText_run>:
c0d05db8:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d05dba:	20d4      	movs	r0, #212	; 0xd4
c0d05dbc:	4e2d      	ldr	r6, [pc, #180]	; (c0d05e74 <ui_displayPaginatedText_run+0xbc>)
c0d05dbe:	492f      	ldr	r1, [pc, #188]	; (c0d05e7c <ui_displayPaginatedText_run+0xc4>)
c0d05dc0:	4479      	add	r1, pc
c0d05dc2:	5031      	str	r1, [r6, r0]
c0d05dc4:	21c8      	movs	r1, #200	; 0xc8
c0d05dc6:	9101      	str	r1, [sp, #4]
c0d05dc8:	2005      	movs	r0, #5
c0d05dca:	5470      	strb	r0, [r6, r1]
c0d05dcc:	21c4      	movs	r1, #196	; 0xc4
c0d05dce:	9100      	str	r1, [sp, #0]
c0d05dd0:	482b      	ldr	r0, [pc, #172]	; (c0d05e80 <ui_displayPaginatedText_run+0xc8>)
c0d05dd2:	4478      	add	r0, pc
c0d05dd4:	5070      	str	r0, [r6, r1]
c0d05dd6:	21d0      	movs	r1, #208	; 0xd0
c0d05dd8:	482a      	ldr	r0, [pc, #168]	; (c0d05e84 <ui_displayPaginatedText_run+0xcc>)
c0d05dda:	4478      	add	r0, pc
c0d05ddc:	9102      	str	r1, [sp, #8]
c0d05dde:	5070      	str	r0, [r6, r1]
c0d05de0:	4825      	ldr	r0, [pc, #148]	; (c0d05e78 <ui_displayPaginatedText_run+0xc0>)
c0d05de2:	2700      	movs	r7, #0
c0d05de4:	6047      	str	r7, [r0, #4]
c0d05de6:	2103      	movs	r1, #3
c0d05de8:	7001      	strb	r1, [r0, #0]
c0d05dea:	4604      	mov	r4, r0
c0d05dec:	f7ff fb2c 	bl	c0d05448 <os_ux>
c0d05df0:	2504      	movs	r5, #4
c0d05df2:	4628      	mov	r0, r5
c0d05df4:	f7ff fb98 	bl	c0d05528 <os_sched_last_status>
c0d05df8:	6060      	str	r0, [r4, #4]
c0d05dfa:	f7fd f859 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d05dfe:	f7fd f859 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d05e02:	24c2      	movs	r4, #194	; 0xc2
c0d05e04:	5337      	strh	r7, [r6, r4]
c0d05e06:	9f00      	ldr	r7, [sp, #0]
c0d05e08:	4628      	mov	r0, r5
c0d05e0a:	9d01      	ldr	r5, [sp, #4]
c0d05e0c:	f7ff fb8c 	bl	c0d05528 <os_sched_last_status>
c0d05e10:	4919      	ldr	r1, [pc, #100]	; (c0d05e78 <ui_displayPaginatedText_run+0xc0>)
c0d05e12:	6048      	str	r0, [r1, #4]
c0d05e14:	2800      	cmp	r0, #0
c0d05e16:	d02b      	beq.n	c0d05e70 <ui_displayPaginatedText_run+0xb8>
c0d05e18:	2897      	cmp	r0, #151	; 0x97
c0d05e1a:	d029      	beq.n	c0d05e70 <ui_displayPaginatedText_run+0xb8>
c0d05e1c:	e025      	b.n	c0d05e6a <ui_displayPaginatedText_run+0xb2>
c0d05e1e:	5d70      	ldrb	r0, [r6, r5]
c0d05e20:	5b31      	ldrh	r1, [r6, r4]
c0d05e22:	4281      	cmp	r1, r0
c0d05e24:	d224      	bcs.n	c0d05e70 <ui_displayPaginatedText_run+0xb8>
c0d05e26:	f7ff fb53 	bl	c0d054d0 <io_seph_is_status_sent>
c0d05e2a:	2800      	cmp	r0, #0
c0d05e2c:	d120      	bne.n	c0d05e70 <ui_displayPaginatedText_run+0xb8>
c0d05e2e:	f7ff fad7 	bl	c0d053e0 <os_perso_isonboarded>
c0d05e32:	28aa      	cmp	r0, #170	; 0xaa
c0d05e34:	d103      	bne.n	c0d05e3e <ui_displayPaginatedText_run+0x86>
c0d05e36:	f7ff fafb 	bl	c0d05430 <os_global_pin_is_validated>
c0d05e3a:	28aa      	cmp	r0, #170	; 0xaa
c0d05e3c:	d118      	bne.n	c0d05e70 <ui_displayPaginatedText_run+0xb8>
c0d05e3e:	59f1      	ldr	r1, [r6, r7]
c0d05e40:	5b32      	ldrh	r2, [r6, r4]
c0d05e42:	0150      	lsls	r0, r2, #5
c0d05e44:	1808      	adds	r0, r1, r0
c0d05e46:	9b02      	ldr	r3, [sp, #8]
c0d05e48:	58f3      	ldr	r3, [r6, r3]
c0d05e4a:	2b00      	cmp	r3, #0
c0d05e4c:	d004      	beq.n	c0d05e58 <ui_displayPaginatedText_run+0xa0>
c0d05e4e:	4798      	blx	r3
c0d05e50:	2800      	cmp	r0, #0
c0d05e52:	d007      	beq.n	c0d05e64 <ui_displayPaginatedText_run+0xac>
c0d05e54:	5b32      	ldrh	r2, [r6, r4]
c0d05e56:	59f1      	ldr	r1, [r6, r7]
c0d05e58:	2801      	cmp	r0, #1
c0d05e5a:	d101      	bne.n	c0d05e60 <ui_displayPaginatedText_run+0xa8>
c0d05e5c:	0150      	lsls	r0, r2, #5
c0d05e5e:	1808      	adds	r0, r1, r0
c0d05e60:	f7fc fb1e 	bl	c0d024a0 <io_seproxyhal_display>
c0d05e64:	5b30      	ldrh	r0, [r6, r4]
c0d05e66:	1c40      	adds	r0, r0, #1
c0d05e68:	5330      	strh	r0, [r6, r4]
c0d05e6a:	59f0      	ldr	r0, [r6, r7]
c0d05e6c:	2800      	cmp	r0, #0
c0d05e6e:	d1d6      	bne.n	c0d05e1e <ui_displayPaginatedText_run+0x66>
c0d05e70:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d05e72:	46c0      	nop			; (mov r8, r8)
c0d05e74:	20000288 	.word	0x20000288
c0d05e78:	20000390 	.word	0x20000390
c0d05e7c:	fffffc61 	.word	0xfffffc61
c0d05e80:	000038a2 	.word	0x000038a2
c0d05e84:	000000ab 	.word	0x000000ab

c0d05e88 <ui_prepro_paginatedText>:
c0d05e88:	b570      	push	{r4, r5, r6, lr}
c0d05e8a:	4604      	mov	r4, r0
c0d05e8c:	f7ff fca8 	bl	c0d057e0 <assert_uiPaginatedText_magic>
c0d05e90:	4e11      	ldr	r6, [pc, #68]	; (c0d05ed8 <ui_prepro_paginatedText+0x50>)
c0d05e92:	4630      	mov	r0, r6
c0d05e94:	3020      	adds	r0, #32
c0d05e96:	f001 fd2f 	bl	c0d078f8 <strlen>
c0d05e9a:	4605      	mov	r5, r0
c0d05e9c:	4630      	mov	r0, r6
c0d05e9e:	3032      	adds	r0, #50	; 0x32
c0d05ea0:	f001 fd2a 	bl	c0d078f8 <strlen>
c0d05ea4:	7861      	ldrb	r1, [r4, #1]
c0d05ea6:	2902      	cmp	r1, #2
c0d05ea8:	d008      	beq.n	c0d05ebc <ui_prepro_paginatedText+0x34>
c0d05eaa:	2901      	cmp	r1, #1
c0d05eac:	d111      	bne.n	c0d05ed2 <ui_prepro_paginatedText+0x4a>
c0d05eae:	21fc      	movs	r1, #252	; 0xfc
c0d05eb0:	5872      	ldr	r2, [r6, r1]
c0d05eb2:	2a00      	cmp	r2, #0
c0d05eb4:	4621      	mov	r1, r4
c0d05eb6:	d10a      	bne.n	c0d05ece <ui_prepro_paginatedText+0x46>
c0d05eb8:	4611      	mov	r1, r2
c0d05eba:	e008      	b.n	c0d05ece <ui_prepro_paginatedText+0x46>
c0d05ebc:	21fc      	movs	r1, #252	; 0xfc
c0d05ebe:	5871      	ldr	r1, [r6, r1]
c0d05ec0:	3112      	adds	r1, #18
c0d05ec2:	1c42      	adds	r2, r0, #1
c0d05ec4:	4291      	cmp	r1, r2
c0d05ec6:	d201      	bcs.n	c0d05ecc <ui_prepro_paginatedText+0x44>
c0d05ec8:	4621      	mov	r1, r4
c0d05eca:	e000      	b.n	c0d05ece <ui_prepro_paginatedText+0x46>
c0d05ecc:	2100      	movs	r1, #0
c0d05ece:	4285      	cmp	r5, r0
c0d05ed0:	d300      	bcc.n	c0d05ed4 <ui_prepro_paginatedText+0x4c>
c0d05ed2:	4621      	mov	r1, r4
c0d05ed4:	4608      	mov	r0, r1
c0d05ed6:	bd70      	pop	{r4, r5, r6, pc}
c0d05ed8:	200009b0 	.word	0x200009b0

c0d05edc <scroll_update_display_content>:
c0d05edc:	b570      	push	{r4, r5, r6, lr}
c0d05ede:	f7ff fc7f 	bl	c0d057e0 <assert_uiPaginatedText_magic>
c0d05ee2:	2031      	movs	r0, #49	; 0x31
c0d05ee4:	4c2c      	ldr	r4, [pc, #176]	; (c0d05f98 <scroll_update_display_content+0xbc>)
c0d05ee6:	5c21      	ldrb	r1, [r4, r0]
c0d05ee8:	4248      	negs	r0, r1
c0d05eea:	4148      	adcs	r0, r1
c0d05eec:	492d      	ldr	r1, [pc, #180]	; (c0d05fa4 <scroll_update_display_content+0xc8>)
c0d05eee:	4479      	add	r1, pc
c0d05ef0:	f7fa f9b6 	bl	c0d00260 <assert>
c0d05ef4:	25fc      	movs	r5, #252	; 0xfc
c0d05ef6:	5960      	ldr	r0, [r4, r5]
c0d05ef8:	3012      	adds	r0, #18
c0d05efa:	2600      	movs	r6, #0
c0d05efc:	28c9      	cmp	r0, #201	; 0xc9
c0d05efe:	d301      	bcc.n	c0d05f04 <scroll_update_display_content+0x28>
c0d05f00:	4630      	mov	r0, r6
c0d05f02:	e000      	b.n	c0d05f06 <scroll_update_display_content+0x2a>
c0d05f04:	2001      	movs	r0, #1
c0d05f06:	4928      	ldr	r1, [pc, #160]	; (c0d05fa8 <scroll_update_display_content+0xcc>)
c0d05f08:	4479      	add	r1, pc
c0d05f0a:	f7fa f9a9 	bl	c0d00260 <assert>
c0d05f0e:	5960      	ldr	r0, [r4, r5]
c0d05f10:	1821      	adds	r1, r4, r0
c0d05f12:	3132      	adds	r1, #50	; 0x32
c0d05f14:	3420      	adds	r4, #32
c0d05f16:	2211      	movs	r2, #17
c0d05f18:	4620      	mov	r0, r4
c0d05f1a:	f001 fba3 	bl	c0d07664 <__aeabi_memmove>
c0d05f1e:	f7fc ffc7 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d05f22:	f7fc ffc7 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d05f26:	24c2      	movs	r4, #194	; 0xc2
c0d05f28:	4d1c      	ldr	r5, [pc, #112]	; (c0d05f9c <scroll_update_display_content+0xc0>)
c0d05f2a:	532e      	strh	r6, [r5, r4]
c0d05f2c:	2004      	movs	r0, #4
c0d05f2e:	f7ff fafb 	bl	c0d05528 <os_sched_last_status>
c0d05f32:	491b      	ldr	r1, [pc, #108]	; (c0d05fa0 <scroll_update_display_content+0xc4>)
c0d05f34:	6048      	str	r0, [r1, #4]
c0d05f36:	2800      	cmp	r0, #0
c0d05f38:	d001      	beq.n	c0d05f3e <scroll_update_display_content+0x62>
c0d05f3a:	2897      	cmp	r0, #151	; 0x97
c0d05f3c:	d127      	bne.n	c0d05f8e <scroll_update_display_content+0xb2>
c0d05f3e:	bd70      	pop	{r4, r5, r6, pc}
c0d05f40:	20c8      	movs	r0, #200	; 0xc8
c0d05f42:	5c28      	ldrb	r0, [r5, r0]
c0d05f44:	5b29      	ldrh	r1, [r5, r4]
c0d05f46:	4281      	cmp	r1, r0
c0d05f48:	d2f9      	bcs.n	c0d05f3e <scroll_update_display_content+0x62>
c0d05f4a:	f7ff fac1 	bl	c0d054d0 <io_seph_is_status_sent>
c0d05f4e:	2800      	cmp	r0, #0
c0d05f50:	d1f5      	bne.n	c0d05f3e <scroll_update_display_content+0x62>
c0d05f52:	f7ff fa45 	bl	c0d053e0 <os_perso_isonboarded>
c0d05f56:	28aa      	cmp	r0, #170	; 0xaa
c0d05f58:	d103      	bne.n	c0d05f62 <scroll_update_display_content+0x86>
c0d05f5a:	f7ff fa69 	bl	c0d05430 <os_global_pin_is_validated>
c0d05f5e:	28aa      	cmp	r0, #170	; 0xaa
c0d05f60:	d1ed      	bne.n	c0d05f3e <scroll_update_display_content+0x62>
c0d05f62:	59a9      	ldr	r1, [r5, r6]
c0d05f64:	5b2a      	ldrh	r2, [r5, r4]
c0d05f66:	0150      	lsls	r0, r2, #5
c0d05f68:	1808      	adds	r0, r1, r0
c0d05f6a:	23d0      	movs	r3, #208	; 0xd0
c0d05f6c:	58eb      	ldr	r3, [r5, r3]
c0d05f6e:	2b00      	cmp	r3, #0
c0d05f70:	d004      	beq.n	c0d05f7c <scroll_update_display_content+0xa0>
c0d05f72:	4798      	blx	r3
c0d05f74:	2800      	cmp	r0, #0
c0d05f76:	d007      	beq.n	c0d05f88 <scroll_update_display_content+0xac>
c0d05f78:	5b2a      	ldrh	r2, [r5, r4]
c0d05f7a:	59a9      	ldr	r1, [r5, r6]
c0d05f7c:	2801      	cmp	r0, #1
c0d05f7e:	d101      	bne.n	c0d05f84 <scroll_update_display_content+0xa8>
c0d05f80:	0150      	lsls	r0, r2, #5
c0d05f82:	1808      	adds	r0, r1, r0
c0d05f84:	f7fc fa8c 	bl	c0d024a0 <io_seproxyhal_display>
c0d05f88:	5b28      	ldrh	r0, [r5, r4]
c0d05f8a:	1c40      	adds	r0, r0, #1
c0d05f8c:	5328      	strh	r0, [r5, r4]
c0d05f8e:	26c4      	movs	r6, #196	; 0xc4
c0d05f90:	59a8      	ldr	r0, [r5, r6]
c0d05f92:	2800      	cmp	r0, #0
c0d05f94:	d1d4      	bne.n	c0d05f40 <scroll_update_display_content+0x64>
c0d05f96:	e7d2      	b.n	c0d05f3e <scroll_update_display_content+0x62>
c0d05f98:	200009b0 	.word	0x200009b0
c0d05f9c:	20000288 	.word	0x20000288
c0d05fa0:	20000390 	.word	0x20000390
c0d05fa4:	00003672 	.word	0x00003672
c0d05fa8:	00003671 	.word	0x00003671

c0d05fac <ui_displayPathScreen>:
c0d05fac:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05fae:	b09f      	sub	sp, #124	; 0x7c
c0d05fb0:	4614      	mov	r4, r2
c0d05fb2:	460e      	mov	r6, r1
c0d05fb4:	4605      	mov	r5, r0
c0d05fb6:	7800      	ldrb	r0, [r0, #0]
c0d05fb8:	1e41      	subs	r1, r0, #1
c0d05fba:	4188      	sbcs	r0, r1
c0d05fbc:	490d      	ldr	r1, [pc, #52]	; (c0d05ff4 <ui_displayPathScreen+0x48>)
c0d05fbe:	4479      	add	r1, pc
c0d05fc0:	f7fa f94e 	bl	c0d00260 <assert>
c0d05fc4:	4628      	mov	r0, r5
c0d05fc6:	f001 fc97 	bl	c0d078f8 <strlen>
c0d05fca:	0a81      	lsrs	r1, r0, #10
c0d05fcc:	4248      	negs	r0, r1
c0d05fce:	4148      	adcs	r0, r1
c0d05fd0:	4909      	ldr	r1, [pc, #36]	; (c0d05ff8 <ui_displayPathScreen+0x4c>)
c0d05fd2:	4479      	add	r1, pc
c0d05fd4:	f7fa f944 	bl	c0d00260 <assert>
c0d05fd8:	466f      	mov	r7, sp
c0d05fda:	227a      	movs	r2, #122	; 0x7a
c0d05fdc:	4630      	mov	r0, r6
c0d05fde:	4639      	mov	r1, r7
c0d05fe0:	f7fa f9b4 	bl	c0d0034c <bip44_printToStr>
c0d05fe4:	4628      	mov	r0, r5
c0d05fe6:	4639      	mov	r1, r7
c0d05fe8:	4622      	mov	r2, r4
c0d05fea:	f7ff fca5 	bl	c0d05938 <ui_displayPaginatedText>
c0d05fee:	b01f      	add	sp, #124	; 0x7c
c0d05ff0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d05ff2:	46c0      	nop			; (mov r8, r8)
c0d05ff4:	00003756 	.word	0x00003756
c0d05ff8:	00003755 	.word	0x00003755

c0d05ffc <ui_displayPubkeyScreen>:
c0d05ffc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d05ffe:	b091      	sub	sp, #68	; 0x44
c0d06000:	9202      	str	r2, [sp, #8]
c0d06002:	460e      	mov	r6, r1
c0d06004:	4605      	mov	r5, r0
c0d06006:	7800      	ldrb	r0, [r0, #0]
c0d06008:	1e41      	subs	r1, r0, #1
c0d0600a:	4188      	sbcs	r0, r1
c0d0600c:	4914      	ldr	r1, [pc, #80]	; (c0d06060 <ui_displayPubkeyScreen+0x64>)
c0d0600e:	4479      	add	r1, pc
c0d06010:	4c14      	ldr	r4, [pc, #80]	; (c0d06064 <ui_displayPubkeyScreen+0x68>)
c0d06012:	447c      	add	r4, pc
c0d06014:	47a0      	blx	r4
c0d06016:	9501      	str	r5, [sp, #4]
c0d06018:	4628      	mov	r0, r5
c0d0601a:	f001 fc6d 	bl	c0d078f8 <strlen>
c0d0601e:	0a81      	lsrs	r1, r0, #10
c0d06020:	4248      	negs	r0, r1
c0d06022:	4148      	adcs	r0, r1
c0d06024:	4910      	ldr	r1, [pc, #64]	; (c0d06068 <ui_displayPubkeyScreen+0x6c>)
c0d06026:	4479      	add	r1, pc
c0d06028:	47a0      	blx	r4
c0d0602a:	3608      	adds	r6, #8
c0d0602c:	2141      	movs	r1, #65	; 0x41
c0d0602e:	af03      	add	r7, sp, #12
c0d06030:	2338      	movs	r3, #56	; 0x38
c0d06032:	4630      	mov	r0, r6
c0d06034:	463a      	mov	r2, r7
c0d06036:	f7fb ff51 	bl	c0d01edc <public_key_to_wif>
c0d0603a:	4606      	mov	r6, r0
c0d0603c:	2500      	movs	r5, #0
c0d0603e:	2838      	cmp	r0, #56	; 0x38
c0d06040:	d301      	bcc.n	c0d06046 <ui_displayPubkeyScreen+0x4a>
c0d06042:	4628      	mov	r0, r5
c0d06044:	e000      	b.n	c0d06048 <ui_displayPubkeyScreen+0x4c>
c0d06046:	2001      	movs	r0, #1
c0d06048:	4908      	ldr	r1, [pc, #32]	; (c0d0606c <ui_displayPubkeyScreen+0x70>)
c0d0604a:	4479      	add	r1, pc
c0d0604c:	47a0      	blx	r4
c0d0604e:	55bd      	strb	r5, [r7, r6]
c0d06050:	9801      	ldr	r0, [sp, #4]
c0d06052:	4639      	mov	r1, r7
c0d06054:	9a02      	ldr	r2, [sp, #8]
c0d06056:	f7ff fc6f 	bl	c0d05938 <ui_displayPaginatedText>
c0d0605a:	b011      	add	sp, #68	; 0x44
c0d0605c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0605e:	46c0      	nop			; (mov r8, r8)
c0d06060:	0000379e 	.word	0x0000379e
c0d06064:	ffffa24b 	.word	0xffffa24b
c0d06068:	00003799 	.word	0x00003799
c0d0606c:	00003788 	.word	0x00003788

c0d06070 <ui_displayAsciiBufferScreen>:
c0d06070:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d06072:	b0b5      	sub	sp, #212	; 0xd4
c0d06074:	9302      	str	r3, [sp, #8]
c0d06076:	4616      	mov	r6, r2
c0d06078:	4605      	mov	r5, r0
c0d0607a:	9101      	str	r1, [sp, #4]
c0d0607c:	4608      	mov	r0, r1
c0d0607e:	4611      	mov	r1, r2
c0d06080:	f7ff fb92 	bl	c0d057a8 <str_validateTextBuffer>
c0d06084:	7828      	ldrb	r0, [r5, #0]
c0d06086:	1e41      	subs	r1, r0, #1
c0d06088:	4188      	sbcs	r0, r1
c0d0608a:	4917      	ldr	r1, [pc, #92]	; (c0d060e8 <ui_displayAsciiBufferScreen+0x78>)
c0d0608c:	4479      	add	r1, pc
c0d0608e:	4c17      	ldr	r4, [pc, #92]	; (c0d060ec <ui_displayAsciiBufferScreen+0x7c>)
c0d06090:	447c      	add	r4, pc
c0d06092:	47a0      	blx	r4
c0d06094:	4628      	mov	r0, r5
c0d06096:	f001 fc2f 	bl	c0d078f8 <strlen>
c0d0609a:	0a81      	lsrs	r1, r0, #10
c0d0609c:	4248      	negs	r0, r1
c0d0609e:	4148      	adcs	r0, r1
c0d060a0:	4913      	ldr	r1, [pc, #76]	; (c0d060f0 <ui_displayAsciiBufferScreen+0x80>)
c0d060a2:	4479      	add	r1, pc
c0d060a4:	47a0      	blx	r4
c0d060a6:	1e71      	subs	r1, r6, #1
c0d060a8:	4630      	mov	r0, r6
c0d060aa:	4188      	sbcs	r0, r1
c0d060ac:	4911      	ldr	r1, [pc, #68]	; (c0d060f4 <ui_displayAsciiBufferScreen+0x84>)
c0d060ae:	4479      	add	r1, pc
c0d060b0:	47a0      	blx	r4
c0d060b2:	2700      	movs	r7, #0
c0d060b4:	2ec8      	cmp	r6, #200	; 0xc8
c0d060b6:	d301      	bcc.n	c0d060bc <ui_displayAsciiBufferScreen+0x4c>
c0d060b8:	4638      	mov	r0, r7
c0d060ba:	e000      	b.n	c0d060be <ui_displayAsciiBufferScreen+0x4e>
c0d060bc:	2001      	movs	r0, #1
c0d060be:	490e      	ldr	r1, [pc, #56]	; (c0d060f8 <ui_displayAsciiBufferScreen+0x88>)
c0d060c0:	4479      	add	r1, pc
c0d060c2:	47a0      	blx	r4
c0d060c4:	ac03      	add	r4, sp, #12
c0d060c6:	21c8      	movs	r1, #200	; 0xc8
c0d060c8:	4620      	mov	r0, r4
c0d060ca:	f001 fad7 	bl	c0d0767c <explicit_bzero>
c0d060ce:	4620      	mov	r0, r4
c0d060d0:	9901      	ldr	r1, [sp, #4]
c0d060d2:	4632      	mov	r2, r6
c0d060d4:	f001 fac2 	bl	c0d0765c <__aeabi_memcpy>
c0d060d8:	55a7      	strb	r7, [r4, r6]
c0d060da:	4628      	mov	r0, r5
c0d060dc:	4621      	mov	r1, r4
c0d060de:	9a02      	ldr	r2, [sp, #8]
c0d060e0:	f7ff fc2a 	bl	c0d05938 <ui_displayPaginatedText>
c0d060e4:	b035      	add	sp, #212	; 0xd4
c0d060e6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d060e8:	00003759 	.word	0x00003759
c0d060ec:	ffffa1cd 	.word	0xffffa1cd
c0d060f0:	00003756 	.word	0x00003756
c0d060f4:	0000375d 	.word	0x0000375d
c0d060f8:	0000375e 	.word	0x0000375e

c0d060fc <USBD_LL_Init>:
c0d060fc:	4902      	ldr	r1, [pc, #8]	; (c0d06108 <USBD_LL_Init+0xc>)
c0d060fe:	2000      	movs	r0, #0
c0d06100:	6008      	str	r0, [r1, #0]
c0d06102:	4902      	ldr	r1, [pc, #8]	; (c0d0610c <USBD_LL_Init+0x10>)
c0d06104:	6008      	str	r0, [r1, #0]
c0d06106:	4770      	bx	lr
c0d06108:	20000ac0 	.word	0x20000ac0
c0d0610c:	20000abc 	.word	0x20000abc

c0d06110 <USBD_LL_DeInit>:
c0d06110:	b510      	push	{r4, lr}
c0d06112:	4807      	ldr	r0, [pc, #28]	; (c0d06130 <USBD_LL_DeInit+0x20>)
c0d06114:	2102      	movs	r1, #2
c0d06116:	70c1      	strb	r1, [r0, #3]
c0d06118:	2101      	movs	r1, #1
c0d0611a:	7081      	strb	r1, [r0, #2]
c0d0611c:	2400      	movs	r4, #0
c0d0611e:	7044      	strb	r4, [r0, #1]
c0d06120:	214f      	movs	r1, #79	; 0x4f
c0d06122:	7001      	strb	r1, [r0, #0]
c0d06124:	2104      	movs	r1, #4
c0d06126:	f7ff f9c9 	bl	c0d054bc <io_seph_send>
c0d0612a:	4620      	mov	r0, r4
c0d0612c:	bd10      	pop	{r4, pc}
c0d0612e:	46c0      	nop			; (mov r8, r8)
c0d06130:	20000200 	.word	0x20000200

c0d06134 <USBD_LL_Start>:
c0d06134:	b57c      	push	{r2, r3, r4, r5, r6, lr}
c0d06136:	466d      	mov	r5, sp
c0d06138:	2400      	movs	r4, #0
c0d0613a:	712c      	strb	r4, [r5, #4]
c0d0613c:	2003      	movs	r0, #3
c0d0613e:	70e8      	strb	r0, [r5, #3]
c0d06140:	2002      	movs	r0, #2
c0d06142:	70a8      	strb	r0, [r5, #2]
c0d06144:	706c      	strb	r4, [r5, #1]
c0d06146:	264f      	movs	r6, #79	; 0x4f
c0d06148:	702e      	strb	r6, [r5, #0]
c0d0614a:	2105      	movs	r1, #5
c0d0614c:	4628      	mov	r0, r5
c0d0614e:	f7ff f9b5 	bl	c0d054bc <io_seph_send>
c0d06152:	2001      	movs	r0, #1
c0d06154:	70e8      	strb	r0, [r5, #3]
c0d06156:	70a8      	strb	r0, [r5, #2]
c0d06158:	706c      	strb	r4, [r5, #1]
c0d0615a:	702e      	strb	r6, [r5, #0]
c0d0615c:	2104      	movs	r1, #4
c0d0615e:	4628      	mov	r0, r5
c0d06160:	f7ff f9ac 	bl	c0d054bc <io_seph_send>
c0d06164:	4620      	mov	r0, r4
c0d06166:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}

c0d06168 <USBD_LL_Stop>:
c0d06168:	b51c      	push	{r2, r3, r4, lr}
c0d0616a:	a801      	add	r0, sp, #4
c0d0616c:	2102      	movs	r1, #2
c0d0616e:	70c1      	strb	r1, [r0, #3]
c0d06170:	2101      	movs	r1, #1
c0d06172:	7081      	strb	r1, [r0, #2]
c0d06174:	2400      	movs	r4, #0
c0d06176:	7044      	strb	r4, [r0, #1]
c0d06178:	214f      	movs	r1, #79	; 0x4f
c0d0617a:	7001      	strb	r1, [r0, #0]
c0d0617c:	2104      	movs	r1, #4
c0d0617e:	f7ff f99d 	bl	c0d054bc <io_seph_send>
c0d06182:	4620      	mov	r0, r4
c0d06184:	bd1c      	pop	{r2, r3, r4, pc}
	...

c0d06188 <USBD_LL_OpenEP>:
c0d06188:	b57c      	push	{r2, r3, r4, r5, r6, lr}
c0d0618a:	4813      	ldr	r0, [pc, #76]	; (c0d061d8 <USBD_LL_OpenEP+0x50>)
c0d0618c:	2400      	movs	r4, #0
c0d0618e:	6004      	str	r4, [r0, #0]
c0d06190:	4812      	ldr	r0, [pc, #72]	; (c0d061dc <USBD_LL_OpenEP+0x54>)
c0d06192:	6004      	str	r4, [r0, #0]
c0d06194:	466d      	mov	r5, sp
c0d06196:	71ac      	strb	r4, [r5, #6]
c0d06198:	7169      	strb	r1, [r5, #5]
c0d0619a:	2101      	movs	r1, #1
c0d0619c:	7129      	strb	r1, [r5, #4]
c0d0619e:	2004      	movs	r0, #4
c0d061a0:	70e8      	strb	r0, [r5, #3]
c0d061a2:	2605      	movs	r6, #5
c0d061a4:	70ae      	strb	r6, [r5, #2]
c0d061a6:	706c      	strb	r4, [r5, #1]
c0d061a8:	244f      	movs	r4, #79	; 0x4f
c0d061aa:	702c      	strb	r4, [r5, #0]
c0d061ac:	2a00      	cmp	r2, #0
c0d061ae:	d00a      	beq.n	c0d061c6 <USBD_LL_OpenEP+0x3e>
c0d061b0:	2a03      	cmp	r2, #3
c0d061b2:	d005      	beq.n	c0d061c0 <USBD_LL_OpenEP+0x38>
c0d061b4:	2a02      	cmp	r2, #2
c0d061b6:	d005      	beq.n	c0d061c4 <USBD_LL_OpenEP+0x3c>
c0d061b8:	2a01      	cmp	r2, #1
c0d061ba:	d106      	bne.n	c0d061ca <USBD_LL_OpenEP+0x42>
c0d061bc:	4601      	mov	r1, r0
c0d061be:	e002      	b.n	c0d061c6 <USBD_LL_OpenEP+0x3e>
c0d061c0:	2102      	movs	r1, #2
c0d061c2:	e000      	b.n	c0d061c6 <USBD_LL_OpenEP+0x3e>
c0d061c4:	2103      	movs	r1, #3
c0d061c6:	4668      	mov	r0, sp
c0d061c8:	7181      	strb	r1, [r0, #6]
c0d061ca:	4668      	mov	r0, sp
c0d061cc:	71c3      	strb	r3, [r0, #7]
c0d061ce:	2108      	movs	r1, #8
c0d061d0:	f7ff f974 	bl	c0d054bc <io_seph_send>
c0d061d4:	2000      	movs	r0, #0
c0d061d6:	bd7c      	pop	{r2, r3, r4, r5, r6, pc}
c0d061d8:	20000abc 	.word	0x20000abc
c0d061dc:	20000ac0 	.word	0x20000ac0

c0d061e0 <USBD_LL_StallEP>:
c0d061e0:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d061e2:	460d      	mov	r5, r1
c0d061e4:	4668      	mov	r0, sp
c0d061e6:	2400      	movs	r4, #0
c0d061e8:	7144      	strb	r4, [r0, #5]
c0d061ea:	2140      	movs	r1, #64	; 0x40
c0d061ec:	7101      	strb	r1, [r0, #4]
c0d061ee:	70c5      	strb	r5, [r0, #3]
c0d061f0:	2103      	movs	r1, #3
c0d061f2:	7081      	strb	r1, [r0, #2]
c0d061f4:	7044      	strb	r4, [r0, #1]
c0d061f6:	2150      	movs	r1, #80	; 0x50
c0d061f8:	7001      	strb	r1, [r0, #0]
c0d061fa:	2106      	movs	r1, #6
c0d061fc:	f7ff f95e 	bl	c0d054bc <io_seph_send>
c0d06200:	0628      	lsls	r0, r5, #24
c0d06202:	d501      	bpl.n	c0d06208 <USBD_LL_StallEP+0x28>
c0d06204:	4806      	ldr	r0, [pc, #24]	; (c0d06220 <USBD_LL_StallEP+0x40>)
c0d06206:	e000      	b.n	c0d0620a <USBD_LL_StallEP+0x2a>
c0d06208:	4804      	ldr	r0, [pc, #16]	; (c0d0621c <USBD_LL_StallEP+0x3c>)
c0d0620a:	6801      	ldr	r1, [r0, #0]
c0d0620c:	227f      	movs	r2, #127	; 0x7f
c0d0620e:	4015      	ands	r5, r2
c0d06210:	2201      	movs	r2, #1
c0d06212:	40aa      	lsls	r2, r5
c0d06214:	430a      	orrs	r2, r1
c0d06216:	6002      	str	r2, [r0, #0]
c0d06218:	4620      	mov	r0, r4
c0d0621a:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d0621c:	20000ac0 	.word	0x20000ac0
c0d06220:	20000abc 	.word	0x20000abc

c0d06224 <USBD_LL_ClearStallEP>:
c0d06224:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d06226:	460d      	mov	r5, r1
c0d06228:	4668      	mov	r0, sp
c0d0622a:	2400      	movs	r4, #0
c0d0622c:	7144      	strb	r4, [r0, #5]
c0d0622e:	2180      	movs	r1, #128	; 0x80
c0d06230:	7101      	strb	r1, [r0, #4]
c0d06232:	70c5      	strb	r5, [r0, #3]
c0d06234:	2103      	movs	r1, #3
c0d06236:	7081      	strb	r1, [r0, #2]
c0d06238:	7044      	strb	r4, [r0, #1]
c0d0623a:	2150      	movs	r1, #80	; 0x50
c0d0623c:	7001      	strb	r1, [r0, #0]
c0d0623e:	2106      	movs	r1, #6
c0d06240:	f7ff f93c 	bl	c0d054bc <io_seph_send>
c0d06244:	0628      	lsls	r0, r5, #24
c0d06246:	d501      	bpl.n	c0d0624c <USBD_LL_ClearStallEP+0x28>
c0d06248:	4806      	ldr	r0, [pc, #24]	; (c0d06264 <USBD_LL_ClearStallEP+0x40>)
c0d0624a:	e000      	b.n	c0d0624e <USBD_LL_ClearStallEP+0x2a>
c0d0624c:	4804      	ldr	r0, [pc, #16]	; (c0d06260 <USBD_LL_ClearStallEP+0x3c>)
c0d0624e:	6801      	ldr	r1, [r0, #0]
c0d06250:	227f      	movs	r2, #127	; 0x7f
c0d06252:	4015      	ands	r5, r2
c0d06254:	2201      	movs	r2, #1
c0d06256:	40aa      	lsls	r2, r5
c0d06258:	4391      	bics	r1, r2
c0d0625a:	6001      	str	r1, [r0, #0]
c0d0625c:	4620      	mov	r0, r4
c0d0625e:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d06260:	20000ac0 	.word	0x20000ac0
c0d06264:	20000abc 	.word	0x20000abc

c0d06268 <USBD_LL_IsStallEP>:
c0d06268:	0608      	lsls	r0, r1, #24
c0d0626a:	d501      	bpl.n	c0d06270 <USBD_LL_IsStallEP+0x8>
c0d0626c:	4805      	ldr	r0, [pc, #20]	; (c0d06284 <USBD_LL_IsStallEP+0x1c>)
c0d0626e:	e000      	b.n	c0d06272 <USBD_LL_IsStallEP+0xa>
c0d06270:	4803      	ldr	r0, [pc, #12]	; (c0d06280 <USBD_LL_IsStallEP+0x18>)
c0d06272:	7802      	ldrb	r2, [r0, #0]
c0d06274:	207f      	movs	r0, #127	; 0x7f
c0d06276:	4001      	ands	r1, r0
c0d06278:	2001      	movs	r0, #1
c0d0627a:	4088      	lsls	r0, r1
c0d0627c:	4010      	ands	r0, r2
c0d0627e:	4770      	bx	lr
c0d06280:	20000ac0 	.word	0x20000ac0
c0d06284:	20000abc 	.word	0x20000abc

c0d06288 <USBD_LL_SetUSBAddress>:
c0d06288:	b51c      	push	{r2, r3, r4, lr}
c0d0628a:	4668      	mov	r0, sp
c0d0628c:	7101      	strb	r1, [r0, #4]
c0d0628e:	2103      	movs	r1, #3
c0d06290:	70c1      	strb	r1, [r0, #3]
c0d06292:	2102      	movs	r1, #2
c0d06294:	7081      	strb	r1, [r0, #2]
c0d06296:	2400      	movs	r4, #0
c0d06298:	7044      	strb	r4, [r0, #1]
c0d0629a:	214f      	movs	r1, #79	; 0x4f
c0d0629c:	7001      	strb	r1, [r0, #0]
c0d0629e:	2105      	movs	r1, #5
c0d062a0:	f7ff f90c 	bl	c0d054bc <io_seph_send>
c0d062a4:	4620      	mov	r0, r4
c0d062a6:	bd1c      	pop	{r2, r3, r4, pc}

c0d062a8 <USBD_LL_Transmit>:
c0d062a8:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d062aa:	461c      	mov	r4, r3
c0d062ac:	4615      	mov	r5, r2
c0d062ae:	4668      	mov	r0, sp
c0d062b0:	7143      	strb	r3, [r0, #5]
c0d062b2:	2220      	movs	r2, #32
c0d062b4:	7102      	strb	r2, [r0, #4]
c0d062b6:	70c1      	strb	r1, [r0, #3]
c0d062b8:	2150      	movs	r1, #80	; 0x50
c0d062ba:	7001      	strb	r1, [r0, #0]
c0d062bc:	1cd9      	adds	r1, r3, #3
c0d062be:	7081      	strb	r1, [r0, #2]
c0d062c0:	0a09      	lsrs	r1, r1, #8
c0d062c2:	7041      	strb	r1, [r0, #1]
c0d062c4:	2106      	movs	r1, #6
c0d062c6:	f7ff f8f9 	bl	c0d054bc <io_seph_send>
c0d062ca:	4628      	mov	r0, r5
c0d062cc:	4621      	mov	r1, r4
c0d062ce:	f7ff f8f5 	bl	c0d054bc <io_seph_send>
c0d062d2:	2000      	movs	r0, #0
c0d062d4:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0d062d6 <USBD_LL_PrepareReceive>:
c0d062d6:	b51c      	push	{r2, r3, r4, lr}
c0d062d8:	4668      	mov	r0, sp
c0d062da:	7142      	strb	r2, [r0, #5]
c0d062dc:	2230      	movs	r2, #48	; 0x30
c0d062de:	7102      	strb	r2, [r0, #4]
c0d062e0:	70c1      	strb	r1, [r0, #3]
c0d062e2:	2103      	movs	r1, #3
c0d062e4:	7081      	strb	r1, [r0, #2]
c0d062e6:	2400      	movs	r4, #0
c0d062e8:	7044      	strb	r4, [r0, #1]
c0d062ea:	2150      	movs	r1, #80	; 0x50
c0d062ec:	7001      	strb	r1, [r0, #0]
c0d062ee:	2106      	movs	r1, #6
c0d062f0:	f7ff f8e4 	bl	c0d054bc <io_seph_send>
c0d062f4:	4620      	mov	r0, r4
c0d062f6:	bd1c      	pop	{r2, r3, r4, pc}

c0d062f8 <USBD_Init>:
c0d062f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d062fa:	2800      	cmp	r0, #0
c0d062fc:	d014      	beq.n	c0d06328 <USBD_Init+0x30>
c0d062fe:	4615      	mov	r5, r2
c0d06300:	460e      	mov	r6, r1
c0d06302:	4604      	mov	r4, r0
c0d06304:	4607      	mov	r7, r0
c0d06306:	37dc      	adds	r7, #220	; 0xdc
c0d06308:	2045      	movs	r0, #69	; 0x45
c0d0630a:	0081      	lsls	r1, r0, #2
c0d0630c:	4620      	mov	r0, r4
c0d0630e:	f001 f99f 	bl	c0d07650 <__aeabi_memclr>
c0d06312:	2e00      	cmp	r6, #0
c0d06314:	d000      	beq.n	c0d06318 <USBD_Init+0x20>
c0d06316:	617e      	str	r6, [r7, #20]
c0d06318:	7025      	strb	r5, [r4, #0]
c0d0631a:	2001      	movs	r0, #1
c0d0631c:	7038      	strb	r0, [r7, #0]
c0d0631e:	4620      	mov	r0, r4
c0d06320:	f7ff feec 	bl	c0d060fc <USBD_LL_Init>
c0d06324:	2000      	movs	r0, #0
c0d06326:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d06328:	2002      	movs	r0, #2
c0d0632a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d0632c <USBD_DeInit>:
c0d0632c:	b5b0      	push	{r4, r5, r7, lr}
c0d0632e:	4604      	mov	r4, r0
c0d06330:	20dc      	movs	r0, #220	; 0xdc
c0d06332:	2101      	movs	r1, #1
c0d06334:	5421      	strb	r1, [r4, r0]
c0d06336:	2017      	movs	r0, #23
c0d06338:	43c5      	mvns	r5, r0
c0d0633a:	2d00      	cmp	r5, #0
c0d0633c:	d00e      	beq.n	c0d0635c <USBD_DeInit+0x30>
c0d0633e:	1960      	adds	r0, r4, r5
c0d06340:	2143      	movs	r1, #67	; 0x43
c0d06342:	0089      	lsls	r1, r1, #2
c0d06344:	5840      	ldr	r0, [r0, r1]
c0d06346:	2800      	cmp	r0, #0
c0d06348:	d006      	beq.n	c0d06358 <USBD_DeInit+0x2c>
c0d0634a:	6840      	ldr	r0, [r0, #4]
c0d0634c:	f7fd faee 	bl	c0d0392c <pic>
c0d06350:	4602      	mov	r2, r0
c0d06352:	7921      	ldrb	r1, [r4, #4]
c0d06354:	4620      	mov	r0, r4
c0d06356:	4790      	blx	r2
c0d06358:	3508      	adds	r5, #8
c0d0635a:	e7ee      	b.n	c0d0633a <USBD_DeInit+0xe>
c0d0635c:	4620      	mov	r0, r4
c0d0635e:	f7ff ff03 	bl	c0d06168 <USBD_LL_Stop>
c0d06362:	4620      	mov	r0, r4
c0d06364:	f7ff fed4 	bl	c0d06110 <USBD_LL_DeInit>
c0d06368:	2000      	movs	r0, #0
c0d0636a:	bdb0      	pop	{r4, r5, r7, pc}

c0d0636c <USBD_RegisterClassForInterface>:
c0d0636c:	2a00      	cmp	r2, #0
c0d0636e:	d008      	beq.n	c0d06382 <USBD_RegisterClassForInterface+0x16>
c0d06370:	4603      	mov	r3, r0
c0d06372:	2000      	movs	r0, #0
c0d06374:	2b02      	cmp	r3, #2
c0d06376:	d803      	bhi.n	c0d06380 <USBD_RegisterClassForInterface+0x14>
c0d06378:	00db      	lsls	r3, r3, #3
c0d0637a:	18c9      	adds	r1, r1, r3
c0d0637c:	23f4      	movs	r3, #244	; 0xf4
c0d0637e:	50ca      	str	r2, [r1, r3]
c0d06380:	4770      	bx	lr
c0d06382:	2002      	movs	r0, #2
c0d06384:	4770      	bx	lr

c0d06386 <USBD_Start>:
c0d06386:	b580      	push	{r7, lr}
c0d06388:	f7ff fed4 	bl	c0d06134 <USBD_LL_Start>
c0d0638c:	2000      	movs	r0, #0
c0d0638e:	bd80      	pop	{r7, pc}

c0d06390 <USBD_SetClassConfig>:
c0d06390:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d06392:	460c      	mov	r4, r1
c0d06394:	4605      	mov	r5, r0
c0d06396:	2600      	movs	r6, #0
c0d06398:	27f4      	movs	r7, #244	; 0xf4
c0d0639a:	2e03      	cmp	r6, #3
c0d0639c:	d010      	beq.n	c0d063c0 <USBD_SetClassConfig+0x30>
c0d0639e:	4628      	mov	r0, r5
c0d063a0:	4631      	mov	r1, r6
c0d063a2:	f000 f95c 	bl	c0d0665e <usbd_is_valid_intf>
c0d063a6:	2800      	cmp	r0, #0
c0d063a8:	d007      	beq.n	c0d063ba <USBD_SetClassConfig+0x2a>
c0d063aa:	59e8      	ldr	r0, [r5, r7]
c0d063ac:	6800      	ldr	r0, [r0, #0]
c0d063ae:	f7fd fabd 	bl	c0d0392c <pic>
c0d063b2:	4602      	mov	r2, r0
c0d063b4:	4628      	mov	r0, r5
c0d063b6:	4621      	mov	r1, r4
c0d063b8:	4790      	blx	r2
c0d063ba:	3708      	adds	r7, #8
c0d063bc:	1c76      	adds	r6, r6, #1
c0d063be:	e7ec      	b.n	c0d0639a <USBD_SetClassConfig+0xa>
c0d063c0:	2000      	movs	r0, #0
c0d063c2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d063c4 <USBD_ClrClassConfig>:
c0d063c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d063c6:	460c      	mov	r4, r1
c0d063c8:	4605      	mov	r5, r0
c0d063ca:	2600      	movs	r6, #0
c0d063cc:	27f4      	movs	r7, #244	; 0xf4
c0d063ce:	2e03      	cmp	r6, #3
c0d063d0:	d010      	beq.n	c0d063f4 <USBD_ClrClassConfig+0x30>
c0d063d2:	4628      	mov	r0, r5
c0d063d4:	4631      	mov	r1, r6
c0d063d6:	f000 f942 	bl	c0d0665e <usbd_is_valid_intf>
c0d063da:	2800      	cmp	r0, #0
c0d063dc:	d007      	beq.n	c0d063ee <USBD_ClrClassConfig+0x2a>
c0d063de:	59e8      	ldr	r0, [r5, r7]
c0d063e0:	6840      	ldr	r0, [r0, #4]
c0d063e2:	f7fd faa3 	bl	c0d0392c <pic>
c0d063e6:	4602      	mov	r2, r0
c0d063e8:	4628      	mov	r0, r5
c0d063ea:	4621      	mov	r1, r4
c0d063ec:	4790      	blx	r2
c0d063ee:	3708      	adds	r7, #8
c0d063f0:	1c76      	adds	r6, r6, #1
c0d063f2:	e7ec      	b.n	c0d063ce <USBD_ClrClassConfig+0xa>
c0d063f4:	2000      	movs	r0, #0
c0d063f6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d063f8 <USBD_LL_SetupStage>:
c0d063f8:	b570      	push	{r4, r5, r6, lr}
c0d063fa:	4604      	mov	r4, r0
c0d063fc:	4606      	mov	r6, r0
c0d063fe:	36d4      	adds	r6, #212	; 0xd4
c0d06400:	4635      	mov	r5, r6
c0d06402:	3514      	adds	r5, #20
c0d06404:	4628      	mov	r0, r5
c0d06406:	f000 fb55 	bl	c0d06ab4 <USBD_ParseSetupRequest>
c0d0640a:	20d4      	movs	r0, #212	; 0xd4
c0d0640c:	2101      	movs	r1, #1
c0d0640e:	5021      	str	r1, [r4, r0]
c0d06410:	20ee      	movs	r0, #238	; 0xee
c0d06412:	5a20      	ldrh	r0, [r4, r0]
c0d06414:	6070      	str	r0, [r6, #4]
c0d06416:	7d31      	ldrb	r1, [r6, #20]
c0d06418:	201f      	movs	r0, #31
c0d0641a:	4008      	ands	r0, r1
c0d0641c:	2802      	cmp	r0, #2
c0d0641e:	d008      	beq.n	c0d06432 <USBD_LL_SetupStage+0x3a>
c0d06420:	2801      	cmp	r0, #1
c0d06422:	d00b      	beq.n	c0d0643c <USBD_LL_SetupStage+0x44>
c0d06424:	2800      	cmp	r0, #0
c0d06426:	d10e      	bne.n	c0d06446 <USBD_LL_SetupStage+0x4e>
c0d06428:	4620      	mov	r0, r4
c0d0642a:	4629      	mov	r1, r5
c0d0642c:	f000 f922 	bl	c0d06674 <USBD_StdDevReq>
c0d06430:	e00e      	b.n	c0d06450 <USBD_LL_SetupStage+0x58>
c0d06432:	4620      	mov	r0, r4
c0d06434:	4629      	mov	r1, r5
c0d06436:	f000 fabc 	bl	c0d069b2 <USBD_StdEPReq>
c0d0643a:	e009      	b.n	c0d06450 <USBD_LL_SetupStage+0x58>
c0d0643c:	4620      	mov	r0, r4
c0d0643e:	4629      	mov	r1, r5
c0d06440:	f000 fa93 	bl	c0d0696a <USBD_StdItfReq>
c0d06444:	e004      	b.n	c0d06450 <USBD_LL_SetupStage+0x58>
c0d06446:	2080      	movs	r0, #128	; 0x80
c0d06448:	4001      	ands	r1, r0
c0d0644a:	4620      	mov	r0, r4
c0d0644c:	f7ff fec8 	bl	c0d061e0 <USBD_LL_StallEP>
c0d06450:	2000      	movs	r0, #0
c0d06452:	bd70      	pop	{r4, r5, r6, pc}

c0d06454 <USBD_LL_DataOutStage>:
c0d06454:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d06456:	9202      	str	r2, [sp, #8]
c0d06458:	4604      	mov	r4, r0
c0d0645a:	4606      	mov	r6, r0
c0d0645c:	36dc      	adds	r6, #220	; 0xdc
c0d0645e:	9101      	str	r1, [sp, #4]
c0d06460:	2900      	cmp	r1, #0
c0d06462:	d01a      	beq.n	c0d0649a <USBD_LL_DataOutStage+0x46>
c0d06464:	2700      	movs	r7, #0
c0d06466:	25f4      	movs	r5, #244	; 0xf4
c0d06468:	2f03      	cmp	r7, #3
c0d0646a:	d046      	beq.n	c0d064fa <USBD_LL_DataOutStage+0xa6>
c0d0646c:	4620      	mov	r0, r4
c0d0646e:	4639      	mov	r1, r7
c0d06470:	f000 f8f5 	bl	c0d0665e <usbd_is_valid_intf>
c0d06474:	2800      	cmp	r0, #0
c0d06476:	d00d      	beq.n	c0d06494 <USBD_LL_DataOutStage+0x40>
c0d06478:	5960      	ldr	r0, [r4, r5]
c0d0647a:	6980      	ldr	r0, [r0, #24]
c0d0647c:	2800      	cmp	r0, #0
c0d0647e:	d009      	beq.n	c0d06494 <USBD_LL_DataOutStage+0x40>
c0d06480:	7831      	ldrb	r1, [r6, #0]
c0d06482:	2903      	cmp	r1, #3
c0d06484:	d106      	bne.n	c0d06494 <USBD_LL_DataOutStage+0x40>
c0d06486:	f7fd fa51 	bl	c0d0392c <pic>
c0d0648a:	4603      	mov	r3, r0
c0d0648c:	4620      	mov	r0, r4
c0d0648e:	9901      	ldr	r1, [sp, #4]
c0d06490:	9a02      	ldr	r2, [sp, #8]
c0d06492:	4798      	blx	r3
c0d06494:	3508      	adds	r5, #8
c0d06496:	1c7f      	adds	r7, r7, #1
c0d06498:	e7e6      	b.n	c0d06468 <USBD_LL_DataOutStage+0x14>
c0d0649a:	4620      	mov	r0, r4
c0d0649c:	3080      	adds	r0, #128	; 0x80
c0d0649e:	6d41      	ldr	r1, [r0, #84]	; 0x54
c0d064a0:	2903      	cmp	r1, #3
c0d064a2:	d12a      	bne.n	c0d064fa <USBD_LL_DataOutStage+0xa6>
c0d064a4:	6800      	ldr	r0, [r0, #0]
c0d064a6:	6fe1      	ldr	r1, [r4, #124]	; 0x7c
c0d064a8:	4281      	cmp	r1, r0
c0d064aa:	d90a      	bls.n	c0d064c2 <USBD_LL_DataOutStage+0x6e>
c0d064ac:	1a09      	subs	r1, r1, r0
c0d064ae:	67e1      	str	r1, [r4, #124]	; 0x7c
c0d064b0:	4281      	cmp	r1, r0
c0d064b2:	d300      	bcc.n	c0d064b6 <USBD_LL_DataOutStage+0x62>
c0d064b4:	4601      	mov	r1, r0
c0d064b6:	b28a      	uxth	r2, r1
c0d064b8:	4620      	mov	r0, r4
c0d064ba:	9902      	ldr	r1, [sp, #8]
c0d064bc:	f000 fd10 	bl	c0d06ee0 <USBD_CtlContinueRx>
c0d064c0:	e01b      	b.n	c0d064fa <USBD_LL_DataOutStage+0xa6>
c0d064c2:	2500      	movs	r5, #0
c0d064c4:	27f4      	movs	r7, #244	; 0xf4
c0d064c6:	2d03      	cmp	r5, #3
c0d064c8:	d014      	beq.n	c0d064f4 <USBD_LL_DataOutStage+0xa0>
c0d064ca:	4620      	mov	r0, r4
c0d064cc:	4629      	mov	r1, r5
c0d064ce:	f000 f8c6 	bl	c0d0665e <usbd_is_valid_intf>
c0d064d2:	2800      	cmp	r0, #0
c0d064d4:	d00b      	beq.n	c0d064ee <USBD_LL_DataOutStage+0x9a>
c0d064d6:	59e0      	ldr	r0, [r4, r7]
c0d064d8:	6900      	ldr	r0, [r0, #16]
c0d064da:	2800      	cmp	r0, #0
c0d064dc:	d007      	beq.n	c0d064ee <USBD_LL_DataOutStage+0x9a>
c0d064de:	7831      	ldrb	r1, [r6, #0]
c0d064e0:	2903      	cmp	r1, #3
c0d064e2:	d104      	bne.n	c0d064ee <USBD_LL_DataOutStage+0x9a>
c0d064e4:	f7fd fa22 	bl	c0d0392c <pic>
c0d064e8:	4601      	mov	r1, r0
c0d064ea:	4620      	mov	r0, r4
c0d064ec:	4788      	blx	r1
c0d064ee:	3708      	adds	r7, #8
c0d064f0:	1c6d      	adds	r5, r5, #1
c0d064f2:	e7e8      	b.n	c0d064c6 <USBD_LL_DataOutStage+0x72>
c0d064f4:	4620      	mov	r0, r4
c0d064f6:	f000 fcfa 	bl	c0d06eee <USBD_CtlSendStatus>
c0d064fa:	2000      	movs	r0, #0
c0d064fc:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}

c0d064fe <USBD_LL_DataInStage>:
c0d064fe:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d06500:	4604      	mov	r4, r0
c0d06502:	4607      	mov	r7, r0
c0d06504:	37d4      	adds	r7, #212	; 0xd4
c0d06506:	9100      	str	r1, [sp, #0]
c0d06508:	2900      	cmp	r1, #0
c0d0650a:	d01a      	beq.n	c0d06542 <USBD_LL_DataInStage+0x44>
c0d0650c:	463d      	mov	r5, r7
c0d0650e:	2600      	movs	r6, #0
c0d06510:	27f4      	movs	r7, #244	; 0xf4
c0d06512:	2e03      	cmp	r6, #3
c0d06514:	d05c      	beq.n	c0d065d0 <USBD_LL_DataInStage+0xd2>
c0d06516:	4620      	mov	r0, r4
c0d06518:	4631      	mov	r1, r6
c0d0651a:	f000 f8a0 	bl	c0d0665e <usbd_is_valid_intf>
c0d0651e:	2800      	cmp	r0, #0
c0d06520:	d00c      	beq.n	c0d0653c <USBD_LL_DataInStage+0x3e>
c0d06522:	59e0      	ldr	r0, [r4, r7]
c0d06524:	6940      	ldr	r0, [r0, #20]
c0d06526:	2800      	cmp	r0, #0
c0d06528:	d008      	beq.n	c0d0653c <USBD_LL_DataInStage+0x3e>
c0d0652a:	7a29      	ldrb	r1, [r5, #8]
c0d0652c:	2903      	cmp	r1, #3
c0d0652e:	d105      	bne.n	c0d0653c <USBD_LL_DataInStage+0x3e>
c0d06530:	f7fd f9fc 	bl	c0d0392c <pic>
c0d06534:	4602      	mov	r2, r0
c0d06536:	4620      	mov	r0, r4
c0d06538:	9900      	ldr	r1, [sp, #0]
c0d0653a:	4790      	blx	r2
c0d0653c:	3708      	adds	r7, #8
c0d0653e:	1c76      	adds	r6, r6, #1
c0d06540:	e7e7      	b.n	c0d06512 <USBD_LL_DataInStage+0x14>
c0d06542:	6838      	ldr	r0, [r7, #0]
c0d06544:	2802      	cmp	r0, #2
c0d06546:	d13d      	bne.n	c0d065c4 <USBD_LL_DataInStage+0xc6>
c0d06548:	69e0      	ldr	r0, [r4, #28]
c0d0654a:	6a25      	ldr	r5, [r4, #32]
c0d0654c:	42a8      	cmp	r0, r5
c0d0654e:	d909      	bls.n	c0d06564 <USBD_LL_DataInStage+0x66>
c0d06550:	1b40      	subs	r0, r0, r5
c0d06552:	61e0      	str	r0, [r4, #28]
c0d06554:	6bf9      	ldr	r1, [r7, #60]	; 0x3c
c0d06556:	1949      	adds	r1, r1, r5
c0d06558:	63f9      	str	r1, [r7, #60]	; 0x3c
c0d0655a:	b282      	uxth	r2, r0
c0d0655c:	4620      	mov	r0, r4
c0d0655e:	f000 fcb1 	bl	c0d06ec4 <USBD_CtlContinueSendData>
c0d06562:	e02f      	b.n	c0d065c4 <USBD_LL_DataInStage+0xc6>
c0d06564:	69a6      	ldr	r6, [r4, #24]
c0d06566:	4630      	mov	r0, r6
c0d06568:	4629      	mov	r1, r5
c0d0656a:	f000 ff1b 	bl	c0d073a4 <__aeabi_uidivmod>
c0d0656e:	2900      	cmp	r1, #0
c0d06570:	d10c      	bne.n	c0d0658c <USBD_LL_DataInStage+0x8e>
c0d06572:	42ae      	cmp	r6, r5
c0d06574:	d30a      	bcc.n	c0d0658c <USBD_LL_DataInStage+0x8e>
c0d06576:	6878      	ldr	r0, [r7, #4]
c0d06578:	4286      	cmp	r6, r0
c0d0657a:	d207      	bcs.n	c0d0658c <USBD_LL_DataInStage+0x8e>
c0d0657c:	2500      	movs	r5, #0
c0d0657e:	4620      	mov	r0, r4
c0d06580:	4629      	mov	r1, r5
c0d06582:	462a      	mov	r2, r5
c0d06584:	f000 fc9e 	bl	c0d06ec4 <USBD_CtlContinueSendData>
c0d06588:	607d      	str	r5, [r7, #4]
c0d0658a:	e01b      	b.n	c0d065c4 <USBD_LL_DataInStage+0xc6>
c0d0658c:	2500      	movs	r5, #0
c0d0658e:	26f4      	movs	r6, #244	; 0xf4
c0d06590:	2d03      	cmp	r5, #3
c0d06592:	d014      	beq.n	c0d065be <USBD_LL_DataInStage+0xc0>
c0d06594:	4620      	mov	r0, r4
c0d06596:	4629      	mov	r1, r5
c0d06598:	f000 f861 	bl	c0d0665e <usbd_is_valid_intf>
c0d0659c:	2800      	cmp	r0, #0
c0d0659e:	d00b      	beq.n	c0d065b8 <USBD_LL_DataInStage+0xba>
c0d065a0:	59a0      	ldr	r0, [r4, r6]
c0d065a2:	68c0      	ldr	r0, [r0, #12]
c0d065a4:	2800      	cmp	r0, #0
c0d065a6:	d007      	beq.n	c0d065b8 <USBD_LL_DataInStage+0xba>
c0d065a8:	7a39      	ldrb	r1, [r7, #8]
c0d065aa:	2903      	cmp	r1, #3
c0d065ac:	d104      	bne.n	c0d065b8 <USBD_LL_DataInStage+0xba>
c0d065ae:	f7fd f9bd 	bl	c0d0392c <pic>
c0d065b2:	4601      	mov	r1, r0
c0d065b4:	4620      	mov	r0, r4
c0d065b6:	4788      	blx	r1
c0d065b8:	3608      	adds	r6, #8
c0d065ba:	1c6d      	adds	r5, r5, #1
c0d065bc:	e7e8      	b.n	c0d06590 <USBD_LL_DataInStage+0x92>
c0d065be:	4620      	mov	r0, r4
c0d065c0:	f000 fca1 	bl	c0d06f06 <USBD_CtlReceiveStatus>
c0d065c4:	7b38      	ldrb	r0, [r7, #12]
c0d065c6:	2801      	cmp	r0, #1
c0d065c8:	d102      	bne.n	c0d065d0 <USBD_LL_DataInStage+0xd2>
c0d065ca:	4639      	mov	r1, r7
c0d065cc:	2000      	movs	r0, #0
c0d065ce:	7338      	strb	r0, [r7, #12]
c0d065d0:	2000      	movs	r0, #0
c0d065d2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d065d4 <USBD_LL_Reset>:
c0d065d4:	b570      	push	{r4, r5, r6, lr}
c0d065d6:	4604      	mov	r4, r0
c0d065d8:	20dc      	movs	r0, #220	; 0xdc
c0d065da:	2101      	movs	r1, #1
c0d065dc:	5421      	strb	r1, [r4, r0]
c0d065de:	2080      	movs	r0, #128	; 0x80
c0d065e0:	2140      	movs	r1, #64	; 0x40
c0d065e2:	5021      	str	r1, [r4, r0]
c0d065e4:	6221      	str	r1, [r4, #32]
c0d065e6:	2500      	movs	r5, #0
c0d065e8:	26f4      	movs	r6, #244	; 0xf4
c0d065ea:	2d03      	cmp	r5, #3
c0d065ec:	d010      	beq.n	c0d06610 <USBD_LL_Reset+0x3c>
c0d065ee:	4620      	mov	r0, r4
c0d065f0:	4629      	mov	r1, r5
c0d065f2:	f000 f834 	bl	c0d0665e <usbd_is_valid_intf>
c0d065f6:	2800      	cmp	r0, #0
c0d065f8:	d007      	beq.n	c0d0660a <USBD_LL_Reset+0x36>
c0d065fa:	59a0      	ldr	r0, [r4, r6]
c0d065fc:	6840      	ldr	r0, [r0, #4]
c0d065fe:	f7fd f995 	bl	c0d0392c <pic>
c0d06602:	4602      	mov	r2, r0
c0d06604:	7921      	ldrb	r1, [r4, #4]
c0d06606:	4620      	mov	r0, r4
c0d06608:	4790      	blx	r2
c0d0660a:	3608      	adds	r6, #8
c0d0660c:	1c6d      	adds	r5, r5, #1
c0d0660e:	e7ec      	b.n	c0d065ea <USBD_LL_Reset+0x16>
c0d06610:	2000      	movs	r0, #0
c0d06612:	bd70      	pop	{r4, r5, r6, pc}

c0d06614 <USBD_LL_SetSpeed>:
c0d06614:	7401      	strb	r1, [r0, #16]
c0d06616:	2000      	movs	r0, #0
c0d06618:	4770      	bx	lr

c0d0661a <USBD_LL_Suspend>:
c0d0661a:	2000      	movs	r0, #0
c0d0661c:	4770      	bx	lr

c0d0661e <USBD_LL_Resume>:
c0d0661e:	2000      	movs	r0, #0
c0d06620:	4770      	bx	lr

c0d06622 <USBD_LL_SOF>:
c0d06622:	b570      	push	{r4, r5, r6, lr}
c0d06624:	4604      	mov	r4, r0
c0d06626:	20dc      	movs	r0, #220	; 0xdc
c0d06628:	5c20      	ldrb	r0, [r4, r0]
c0d0662a:	2803      	cmp	r0, #3
c0d0662c:	d115      	bne.n	c0d0665a <USBD_LL_SOF+0x38>
c0d0662e:	2500      	movs	r5, #0
c0d06630:	26f4      	movs	r6, #244	; 0xf4
c0d06632:	2d03      	cmp	r5, #3
c0d06634:	d011      	beq.n	c0d0665a <USBD_LL_SOF+0x38>
c0d06636:	4620      	mov	r0, r4
c0d06638:	4629      	mov	r1, r5
c0d0663a:	f000 f810 	bl	c0d0665e <usbd_is_valid_intf>
c0d0663e:	2800      	cmp	r0, #0
c0d06640:	d008      	beq.n	c0d06654 <USBD_LL_SOF+0x32>
c0d06642:	59a0      	ldr	r0, [r4, r6]
c0d06644:	69c0      	ldr	r0, [r0, #28]
c0d06646:	2800      	cmp	r0, #0
c0d06648:	d004      	beq.n	c0d06654 <USBD_LL_SOF+0x32>
c0d0664a:	f7fd f96f 	bl	c0d0392c <pic>
c0d0664e:	4601      	mov	r1, r0
c0d06650:	4620      	mov	r0, r4
c0d06652:	4788      	blx	r1
c0d06654:	3608      	adds	r6, #8
c0d06656:	1c6d      	adds	r5, r5, #1
c0d06658:	e7eb      	b.n	c0d06632 <USBD_LL_SOF+0x10>
c0d0665a:	2000      	movs	r0, #0
c0d0665c:	bd70      	pop	{r4, r5, r6, pc}

c0d0665e <usbd_is_valid_intf>:
c0d0665e:	2902      	cmp	r1, #2
c0d06660:	d806      	bhi.n	c0d06670 <usbd_is_valid_intf+0x12>
c0d06662:	00c9      	lsls	r1, r1, #3
c0d06664:	1840      	adds	r0, r0, r1
c0d06666:	21f4      	movs	r1, #244	; 0xf4
c0d06668:	5840      	ldr	r0, [r0, r1]
c0d0666a:	1e41      	subs	r1, r0, #1
c0d0666c:	4188      	sbcs	r0, r1
c0d0666e:	4770      	bx	lr
c0d06670:	2000      	movs	r0, #0
c0d06672:	4770      	bx	lr

c0d06674 <USBD_StdDevReq>:
c0d06674:	b580      	push	{r7, lr}
c0d06676:	784a      	ldrb	r2, [r1, #1]
c0d06678:	2a00      	cmp	r2, #0
c0d0667a:	d00e      	beq.n	c0d0669a <USBD_StdDevReq+0x26>
c0d0667c:	2a01      	cmp	r2, #1
c0d0667e:	d00f      	beq.n	c0d066a0 <USBD_StdDevReq+0x2c>
c0d06680:	2a03      	cmp	r2, #3
c0d06682:	d010      	beq.n	c0d066a6 <USBD_StdDevReq+0x32>
c0d06684:	2a05      	cmp	r2, #5
c0d06686:	d011      	beq.n	c0d066ac <USBD_StdDevReq+0x38>
c0d06688:	2a09      	cmp	r2, #9
c0d0668a:	d012      	beq.n	c0d066b2 <USBD_StdDevReq+0x3e>
c0d0668c:	2a08      	cmp	r2, #8
c0d0668e:	d013      	beq.n	c0d066b8 <USBD_StdDevReq+0x44>
c0d06690:	2a06      	cmp	r2, #6
c0d06692:	d114      	bne.n	c0d066be <USBD_StdDevReq+0x4a>
c0d06694:	f000 f817 	bl	c0d066c6 <USBD_GetDescriptor>
c0d06698:	e013      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d0669a:	f000 f8fc 	bl	c0d06896 <USBD_GetStatus>
c0d0669e:	e010      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066a0:	f000 f93a 	bl	c0d06918 <USBD_ClrFeature>
c0d066a4:	e00d      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066a6:	f000 f91a 	bl	c0d068de <USBD_SetFeature>
c0d066aa:	e00a      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066ac:	f000 f882 	bl	c0d067b4 <USBD_SetAddress>
c0d066b0:	e007      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066b2:	f000 f8a2 	bl	c0d067fa <USBD_SetConfig>
c0d066b6:	e004      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066b8:	f000 f8d6 	bl	c0d06868 <USBD_GetConfig>
c0d066bc:	e001      	b.n	c0d066c2 <USBD_StdDevReq+0x4e>
c0d066be:	f000 fb5f 	bl	c0d06d80 <USBD_CtlError>
c0d066c2:	2000      	movs	r0, #0
c0d066c4:	bd80      	pop	{r7, pc}

c0d066c6 <USBD_GetDescriptor>:
c0d066c6:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d066c8:	460d      	mov	r5, r1
c0d066ca:	4604      	mov	r4, r0
c0d066cc:	a801      	add	r0, sp, #4
c0d066ce:	2100      	movs	r1, #0
c0d066d0:	8001      	strh	r1, [r0, #0]
c0d066d2:	4620      	mov	r0, r4
c0d066d4:	30f0      	adds	r0, #240	; 0xf0
c0d066d6:	886b      	ldrh	r3, [r5, #2]
c0d066d8:	0a1a      	lsrs	r2, r3, #8
c0d066da:	2a01      	cmp	r2, #1
c0d066dc:	d026      	beq.n	c0d0672c <USBD_GetDescriptor+0x66>
c0d066de:	2a02      	cmp	r2, #2
c0d066e0:	d02d      	beq.n	c0d0673e <USBD_GetDescriptor+0x78>
c0d066e2:	2a03      	cmp	r2, #3
c0d066e4:	d00a      	beq.n	c0d066fc <USBD_GetDescriptor+0x36>
c0d066e6:	2a06      	cmp	r2, #6
c0d066e8:	d031      	beq.n	c0d0674e <USBD_GetDescriptor+0x88>
c0d066ea:	2a07      	cmp	r2, #7
c0d066ec:	d016      	beq.n	c0d0671c <USBD_GetDescriptor+0x56>
c0d066ee:	2a0f      	cmp	r2, #15
c0d066f0:	d130      	bne.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d066f2:	6800      	ldr	r0, [r0, #0]
c0d066f4:	69c0      	ldr	r0, [r0, #28]
c0d066f6:	2800      	cmp	r0, #0
c0d066f8:	d11a      	bne.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d066fa:	e02b      	b.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d066fc:	b2d9      	uxtb	r1, r3
c0d066fe:	2905      	cmp	r1, #5
c0d06700:	d049      	beq.n	c0d06796 <USBD_GetDescriptor+0xd0>
c0d06702:	2901      	cmp	r1, #1
c0d06704:	d04a      	beq.n	c0d0679c <USBD_GetDescriptor+0xd6>
c0d06706:	2902      	cmp	r1, #2
c0d06708:	d04b      	beq.n	c0d067a2 <USBD_GetDescriptor+0xdc>
c0d0670a:	2903      	cmp	r1, #3
c0d0670c:	d04c      	beq.n	c0d067a8 <USBD_GetDescriptor+0xe2>
c0d0670e:	2904      	cmp	r1, #4
c0d06710:	d04d      	beq.n	c0d067ae <USBD_GetDescriptor+0xe8>
c0d06712:	2900      	cmp	r1, #0
c0d06714:	d11e      	bne.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d06716:	6800      	ldr	r0, [r0, #0]
c0d06718:	6840      	ldr	r0, [r0, #4]
c0d0671a:	e009      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d0671c:	7c21      	ldrb	r1, [r4, #16]
c0d0671e:	2900      	cmp	r1, #0
c0d06720:	d118      	bne.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d06722:	6840      	ldr	r0, [r0, #4]
c0d06724:	2800      	cmp	r0, #0
c0d06726:	d015      	beq.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d06728:	6b00      	ldr	r0, [r0, #48]	; 0x30
c0d0672a:	e01e      	b.n	c0d0676a <USBD_GetDescriptor+0xa4>
c0d0672c:	6800      	ldr	r0, [r0, #0]
c0d0672e:	6800      	ldr	r0, [r0, #0]
c0d06730:	f7fd f8fc 	bl	c0d0392c <pic>
c0d06734:	4602      	mov	r2, r0
c0d06736:	7c20      	ldrb	r0, [r4, #16]
c0d06738:	a901      	add	r1, sp, #4
c0d0673a:	4790      	blx	r2
c0d0673c:	e01a      	b.n	c0d06774 <USBD_GetDescriptor+0xae>
c0d0673e:	6840      	ldr	r0, [r0, #4]
c0d06740:	2800      	cmp	r0, #0
c0d06742:	d018      	beq.n	c0d06776 <USBD_GetDescriptor+0xb0>
c0d06744:	7c21      	ldrb	r1, [r4, #16]
c0d06746:	2900      	cmp	r1, #0
c0d06748:	d00e      	beq.n	c0d06768 <USBD_GetDescriptor+0xa2>
c0d0674a:	6ac0      	ldr	r0, [r0, #44]	; 0x2c
c0d0674c:	e00d      	b.n	c0d0676a <USBD_GetDescriptor+0xa4>
c0d0674e:	7c21      	ldrb	r1, [r4, #16]
c0d06750:	2900      	cmp	r1, #0
c0d06752:	d004      	beq.n	c0d0675e <USBD_GetDescriptor+0x98>
c0d06754:	4620      	mov	r0, r4
c0d06756:	4629      	mov	r1, r5
c0d06758:	f000 fb12 	bl	c0d06d80 <USBD_CtlError>
c0d0675c:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d0675e:	6840      	ldr	r0, [r0, #4]
c0d06760:	2800      	cmp	r0, #0
c0d06762:	d0f7      	beq.n	c0d06754 <USBD_GetDescriptor+0x8e>
c0d06764:	6b40      	ldr	r0, [r0, #52]	; 0x34
c0d06766:	e000      	b.n	c0d0676a <USBD_GetDescriptor+0xa4>
c0d06768:	6a80      	ldr	r0, [r0, #40]	; 0x28
c0d0676a:	f7fd f8df 	bl	c0d0392c <pic>
c0d0676e:	4601      	mov	r1, r0
c0d06770:	a801      	add	r0, sp, #4
c0d06772:	4788      	blx	r1
c0d06774:	4601      	mov	r1, r0
c0d06776:	a801      	add	r0, sp, #4
c0d06778:	8802      	ldrh	r2, [r0, #0]
c0d0677a:	2a00      	cmp	r2, #0
c0d0677c:	d0ee      	beq.n	c0d0675c <USBD_GetDescriptor+0x96>
c0d0677e:	88e8      	ldrh	r0, [r5, #6]
c0d06780:	2800      	cmp	r0, #0
c0d06782:	d0eb      	beq.n	c0d0675c <USBD_GetDescriptor+0x96>
c0d06784:	4282      	cmp	r2, r0
c0d06786:	d300      	bcc.n	c0d0678a <USBD_GetDescriptor+0xc4>
c0d06788:	4602      	mov	r2, r0
c0d0678a:	a801      	add	r0, sp, #4
c0d0678c:	8002      	strh	r2, [r0, #0]
c0d0678e:	4620      	mov	r0, r4
c0d06790:	f000 fb82 	bl	c0d06e98 <USBD_CtlSendData>
c0d06794:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0d06796:	6800      	ldr	r0, [r0, #0]
c0d06798:	6980      	ldr	r0, [r0, #24]
c0d0679a:	e7c9      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d0679c:	6800      	ldr	r0, [r0, #0]
c0d0679e:	6880      	ldr	r0, [r0, #8]
c0d067a0:	e7c6      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d067a2:	6800      	ldr	r0, [r0, #0]
c0d067a4:	68c0      	ldr	r0, [r0, #12]
c0d067a6:	e7c3      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d067a8:	6800      	ldr	r0, [r0, #0]
c0d067aa:	6900      	ldr	r0, [r0, #16]
c0d067ac:	e7c0      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>
c0d067ae:	6800      	ldr	r0, [r0, #0]
c0d067b0:	6940      	ldr	r0, [r0, #20]
c0d067b2:	e7bd      	b.n	c0d06730 <USBD_GetDescriptor+0x6a>

c0d067b4 <USBD_SetAddress>:
c0d067b4:	b570      	push	{r4, r5, r6, lr}
c0d067b6:	4604      	mov	r4, r0
c0d067b8:	8888      	ldrh	r0, [r1, #4]
c0d067ba:	2800      	cmp	r0, #0
c0d067bc:	d107      	bne.n	c0d067ce <USBD_SetAddress+0x1a>
c0d067be:	88c8      	ldrh	r0, [r1, #6]
c0d067c0:	2800      	cmp	r0, #0
c0d067c2:	d104      	bne.n	c0d067ce <USBD_SetAddress+0x1a>
c0d067c4:	4626      	mov	r6, r4
c0d067c6:	36dc      	adds	r6, #220	; 0xdc
c0d067c8:	7830      	ldrb	r0, [r6, #0]
c0d067ca:	2803      	cmp	r0, #3
c0d067cc:	d103      	bne.n	c0d067d6 <USBD_SetAddress+0x22>
c0d067ce:	4620      	mov	r0, r4
c0d067d0:	f000 fad6 	bl	c0d06d80 <USBD_CtlError>
c0d067d4:	bd70      	pop	{r4, r5, r6, pc}
c0d067d6:	7888      	ldrb	r0, [r1, #2]
c0d067d8:	257f      	movs	r5, #127	; 0x7f
c0d067da:	4005      	ands	r5, r0
c0d067dc:	70b5      	strb	r5, [r6, #2]
c0d067de:	4620      	mov	r0, r4
c0d067e0:	4629      	mov	r1, r5
c0d067e2:	f7ff fd51 	bl	c0d06288 <USBD_LL_SetUSBAddress>
c0d067e6:	4620      	mov	r0, r4
c0d067e8:	f000 fb81 	bl	c0d06eee <USBD_CtlSendStatus>
c0d067ec:	2d00      	cmp	r5, #0
c0d067ee:	d001      	beq.n	c0d067f4 <USBD_SetAddress+0x40>
c0d067f0:	2002      	movs	r0, #2
c0d067f2:	e000      	b.n	c0d067f6 <USBD_SetAddress+0x42>
c0d067f4:	2001      	movs	r0, #1
c0d067f6:	7030      	strb	r0, [r6, #0]
c0d067f8:	bd70      	pop	{r4, r5, r6, pc}

c0d067fa <USBD_SetConfig>:
c0d067fa:	b570      	push	{r4, r5, r6, lr}
c0d067fc:	460d      	mov	r5, r1
c0d067fe:	4604      	mov	r4, r0
c0d06800:	788e      	ldrb	r6, [r1, #2]
c0d06802:	2e02      	cmp	r6, #2
c0d06804:	d21c      	bcs.n	c0d06840 <USBD_SetConfig+0x46>
c0d06806:	20dc      	movs	r0, #220	; 0xdc
c0d06808:	5c21      	ldrb	r1, [r4, r0]
c0d0680a:	4620      	mov	r0, r4
c0d0680c:	30dc      	adds	r0, #220	; 0xdc
c0d0680e:	2903      	cmp	r1, #3
c0d06810:	d006      	beq.n	c0d06820 <USBD_SetConfig+0x26>
c0d06812:	2902      	cmp	r1, #2
c0d06814:	d114      	bne.n	c0d06840 <USBD_SetConfig+0x46>
c0d06816:	2e00      	cmp	r6, #0
c0d06818:	d022      	beq.n	c0d06860 <USBD_SetConfig+0x66>
c0d0681a:	2103      	movs	r1, #3
c0d0681c:	7001      	strb	r1, [r0, #0]
c0d0681e:	e008      	b.n	c0d06832 <USBD_SetConfig+0x38>
c0d06820:	2e00      	cmp	r6, #0
c0d06822:	d012      	beq.n	c0d0684a <USBD_SetConfig+0x50>
c0d06824:	6860      	ldr	r0, [r4, #4]
c0d06826:	42b0      	cmp	r0, r6
c0d06828:	d01a      	beq.n	c0d06860 <USBD_SetConfig+0x66>
c0d0682a:	b2c1      	uxtb	r1, r0
c0d0682c:	4620      	mov	r0, r4
c0d0682e:	f7ff fdc9 	bl	c0d063c4 <USBD_ClrClassConfig>
c0d06832:	6066      	str	r6, [r4, #4]
c0d06834:	4620      	mov	r0, r4
c0d06836:	4631      	mov	r1, r6
c0d06838:	f7ff fdaa 	bl	c0d06390 <USBD_SetClassConfig>
c0d0683c:	2802      	cmp	r0, #2
c0d0683e:	d10f      	bne.n	c0d06860 <USBD_SetConfig+0x66>
c0d06840:	4620      	mov	r0, r4
c0d06842:	4629      	mov	r1, r5
c0d06844:	f000 fa9c 	bl	c0d06d80 <USBD_CtlError>
c0d06848:	bd70      	pop	{r4, r5, r6, pc}
c0d0684a:	2100      	movs	r1, #0
c0d0684c:	6061      	str	r1, [r4, #4]
c0d0684e:	2102      	movs	r1, #2
c0d06850:	7001      	strb	r1, [r0, #0]
c0d06852:	4620      	mov	r0, r4
c0d06854:	4631      	mov	r1, r6
c0d06856:	f7ff fdb5 	bl	c0d063c4 <USBD_ClrClassConfig>
c0d0685a:	4620      	mov	r0, r4
c0d0685c:	f000 fb47 	bl	c0d06eee <USBD_CtlSendStatus>
c0d06860:	4620      	mov	r0, r4
c0d06862:	f000 fb44 	bl	c0d06eee <USBD_CtlSendStatus>
c0d06866:	bd70      	pop	{r4, r5, r6, pc}

c0d06868 <USBD_GetConfig>:
c0d06868:	b580      	push	{r7, lr}
c0d0686a:	88ca      	ldrh	r2, [r1, #6]
c0d0686c:	2a01      	cmp	r2, #1
c0d0686e:	d10a      	bne.n	c0d06886 <USBD_GetConfig+0x1e>
c0d06870:	22dc      	movs	r2, #220	; 0xdc
c0d06872:	5c82      	ldrb	r2, [r0, r2]
c0d06874:	2a03      	cmp	r2, #3
c0d06876:	d009      	beq.n	c0d0688c <USBD_GetConfig+0x24>
c0d06878:	2a02      	cmp	r2, #2
c0d0687a:	d104      	bne.n	c0d06886 <USBD_GetConfig+0x1e>
c0d0687c:	2100      	movs	r1, #0
c0d0687e:	6081      	str	r1, [r0, #8]
c0d06880:	4601      	mov	r1, r0
c0d06882:	3108      	adds	r1, #8
c0d06884:	e003      	b.n	c0d0688e <USBD_GetConfig+0x26>
c0d06886:	f000 fa7b 	bl	c0d06d80 <USBD_CtlError>
c0d0688a:	bd80      	pop	{r7, pc}
c0d0688c:	1d01      	adds	r1, r0, #4
c0d0688e:	2201      	movs	r2, #1
c0d06890:	f000 fb02 	bl	c0d06e98 <USBD_CtlSendData>
c0d06894:	bd80      	pop	{r7, pc}

c0d06896 <USBD_GetStatus>:
c0d06896:	b5b0      	push	{r4, r5, r7, lr}
c0d06898:	4604      	mov	r4, r0
c0d0689a:	20dc      	movs	r0, #220	; 0xdc
c0d0689c:	5c20      	ldrb	r0, [r4, r0]
c0d0689e:	22fe      	movs	r2, #254	; 0xfe
c0d068a0:	4002      	ands	r2, r0
c0d068a2:	2a02      	cmp	r2, #2
c0d068a4:	d10f      	bne.n	c0d068c6 <USBD_GetStatus+0x30>
c0d068a6:	4620      	mov	r0, r4
c0d068a8:	30dc      	adds	r0, #220	; 0xdc
c0d068aa:	2101      	movs	r1, #1
c0d068ac:	60e1      	str	r1, [r4, #12]
c0d068ae:	4625      	mov	r5, r4
c0d068b0:	350c      	adds	r5, #12
c0d068b2:	6880      	ldr	r0, [r0, #8]
c0d068b4:	2800      	cmp	r0, #0
c0d068b6:	d00a      	beq.n	c0d068ce <USBD_GetStatus+0x38>
c0d068b8:	4620      	mov	r0, r4
c0d068ba:	f000 fb24 	bl	c0d06f06 <USBD_CtlReceiveStatus>
c0d068be:	68e1      	ldr	r1, [r4, #12]
c0d068c0:	2002      	movs	r0, #2
c0d068c2:	4308      	orrs	r0, r1
c0d068c4:	e004      	b.n	c0d068d0 <USBD_GetStatus+0x3a>
c0d068c6:	4620      	mov	r0, r4
c0d068c8:	f000 fa5a 	bl	c0d06d80 <USBD_CtlError>
c0d068cc:	bdb0      	pop	{r4, r5, r7, pc}
c0d068ce:	2003      	movs	r0, #3
c0d068d0:	60e0      	str	r0, [r4, #12]
c0d068d2:	2202      	movs	r2, #2
c0d068d4:	4620      	mov	r0, r4
c0d068d6:	4629      	mov	r1, r5
c0d068d8:	f000 fade 	bl	c0d06e98 <USBD_CtlSendData>
c0d068dc:	bdb0      	pop	{r4, r5, r7, pc}

c0d068de <USBD_SetFeature>:
c0d068de:	b5b0      	push	{r4, r5, r7, lr}
c0d068e0:	4604      	mov	r4, r0
c0d068e2:	8848      	ldrh	r0, [r1, #2]
c0d068e4:	2801      	cmp	r0, #1
c0d068e6:	d116      	bne.n	c0d06916 <USBD_SetFeature+0x38>
c0d068e8:	460d      	mov	r5, r1
c0d068ea:	20e4      	movs	r0, #228	; 0xe4
c0d068ec:	2101      	movs	r1, #1
c0d068ee:	5021      	str	r1, [r4, r0]
c0d068f0:	7928      	ldrb	r0, [r5, #4]
c0d068f2:	2802      	cmp	r0, #2
c0d068f4:	d80c      	bhi.n	c0d06910 <USBD_SetFeature+0x32>
c0d068f6:	00c0      	lsls	r0, r0, #3
c0d068f8:	1820      	adds	r0, r4, r0
c0d068fa:	21f4      	movs	r1, #244	; 0xf4
c0d068fc:	5840      	ldr	r0, [r0, r1]
c0d068fe:	2800      	cmp	r0, #0
c0d06900:	d006      	beq.n	c0d06910 <USBD_SetFeature+0x32>
c0d06902:	6880      	ldr	r0, [r0, #8]
c0d06904:	f7fd f812 	bl	c0d0392c <pic>
c0d06908:	4602      	mov	r2, r0
c0d0690a:	4620      	mov	r0, r4
c0d0690c:	4629      	mov	r1, r5
c0d0690e:	4790      	blx	r2
c0d06910:	4620      	mov	r0, r4
c0d06912:	f000 faec 	bl	c0d06eee <USBD_CtlSendStatus>
c0d06916:	bdb0      	pop	{r4, r5, r7, pc}

c0d06918 <USBD_ClrFeature>:
c0d06918:	b5b0      	push	{r4, r5, r7, lr}
c0d0691a:	460d      	mov	r5, r1
c0d0691c:	4604      	mov	r4, r0
c0d0691e:	20dc      	movs	r0, #220	; 0xdc
c0d06920:	5c20      	ldrb	r0, [r4, r0]
c0d06922:	21fe      	movs	r1, #254	; 0xfe
c0d06924:	4001      	ands	r1, r0
c0d06926:	2902      	cmp	r1, #2
c0d06928:	d11a      	bne.n	c0d06960 <USBD_ClrFeature+0x48>
c0d0692a:	8868      	ldrh	r0, [r5, #2]
c0d0692c:	2801      	cmp	r0, #1
c0d0692e:	d11b      	bne.n	c0d06968 <USBD_ClrFeature+0x50>
c0d06930:	4620      	mov	r0, r4
c0d06932:	30dc      	adds	r0, #220	; 0xdc
c0d06934:	2100      	movs	r1, #0
c0d06936:	6081      	str	r1, [r0, #8]
c0d06938:	7928      	ldrb	r0, [r5, #4]
c0d0693a:	2802      	cmp	r0, #2
c0d0693c:	d80c      	bhi.n	c0d06958 <USBD_ClrFeature+0x40>
c0d0693e:	00c0      	lsls	r0, r0, #3
c0d06940:	1820      	adds	r0, r4, r0
c0d06942:	21f4      	movs	r1, #244	; 0xf4
c0d06944:	5840      	ldr	r0, [r0, r1]
c0d06946:	2800      	cmp	r0, #0
c0d06948:	d006      	beq.n	c0d06958 <USBD_ClrFeature+0x40>
c0d0694a:	6880      	ldr	r0, [r0, #8]
c0d0694c:	f7fc ffee 	bl	c0d0392c <pic>
c0d06950:	4602      	mov	r2, r0
c0d06952:	4620      	mov	r0, r4
c0d06954:	4629      	mov	r1, r5
c0d06956:	4790      	blx	r2
c0d06958:	4620      	mov	r0, r4
c0d0695a:	f000 fac8 	bl	c0d06eee <USBD_CtlSendStatus>
c0d0695e:	bdb0      	pop	{r4, r5, r7, pc}
c0d06960:	4620      	mov	r0, r4
c0d06962:	4629      	mov	r1, r5
c0d06964:	f000 fa0c 	bl	c0d06d80 <USBD_CtlError>
c0d06968:	bdb0      	pop	{r4, r5, r7, pc}

c0d0696a <USBD_StdItfReq>:
c0d0696a:	b5b0      	push	{r4, r5, r7, lr}
c0d0696c:	460d      	mov	r5, r1
c0d0696e:	4604      	mov	r4, r0
c0d06970:	20dc      	movs	r0, #220	; 0xdc
c0d06972:	5c20      	ldrb	r0, [r4, r0]
c0d06974:	2803      	cmp	r0, #3
c0d06976:	d116      	bne.n	c0d069a6 <USBD_StdItfReq+0x3c>
c0d06978:	7928      	ldrb	r0, [r5, #4]
c0d0697a:	2802      	cmp	r0, #2
c0d0697c:	d813      	bhi.n	c0d069a6 <USBD_StdItfReq+0x3c>
c0d0697e:	00c0      	lsls	r0, r0, #3
c0d06980:	1820      	adds	r0, r4, r0
c0d06982:	21f4      	movs	r1, #244	; 0xf4
c0d06984:	5840      	ldr	r0, [r0, r1]
c0d06986:	2800      	cmp	r0, #0
c0d06988:	d00d      	beq.n	c0d069a6 <USBD_StdItfReq+0x3c>
c0d0698a:	6880      	ldr	r0, [r0, #8]
c0d0698c:	f7fc ffce 	bl	c0d0392c <pic>
c0d06990:	4602      	mov	r2, r0
c0d06992:	4620      	mov	r0, r4
c0d06994:	4629      	mov	r1, r5
c0d06996:	4790      	blx	r2
c0d06998:	88e8      	ldrh	r0, [r5, #6]
c0d0699a:	2800      	cmp	r0, #0
c0d0699c:	d107      	bne.n	c0d069ae <USBD_StdItfReq+0x44>
c0d0699e:	4620      	mov	r0, r4
c0d069a0:	f000 faa5 	bl	c0d06eee <USBD_CtlSendStatus>
c0d069a4:	e003      	b.n	c0d069ae <USBD_StdItfReq+0x44>
c0d069a6:	4620      	mov	r0, r4
c0d069a8:	4629      	mov	r1, r5
c0d069aa:	f000 f9e9 	bl	c0d06d80 <USBD_CtlError>
c0d069ae:	2000      	movs	r0, #0
c0d069b0:	bdb0      	pop	{r4, r5, r7, pc}

c0d069b2 <USBD_StdEPReq>:
c0d069b2:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0d069b4:	460d      	mov	r5, r1
c0d069b6:	4604      	mov	r4, r0
c0d069b8:	7909      	ldrb	r1, [r1, #4]
c0d069ba:	207f      	movs	r0, #127	; 0x7f
c0d069bc:	4008      	ands	r0, r1
c0d069be:	2807      	cmp	r0, #7
c0d069c0:	d304      	bcc.n	c0d069cc <USBD_StdEPReq+0x1a>
c0d069c2:	4620      	mov	r0, r4
c0d069c4:	4629      	mov	r1, r5
c0d069c6:	f000 f9db 	bl	c0d06d80 <USBD_CtlError>
c0d069ca:	e071      	b.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d069cc:	2902      	cmp	r1, #2
c0d069ce:	d812      	bhi.n	c0d069f6 <USBD_StdEPReq+0x44>
c0d069d0:	782a      	ldrb	r2, [r5, #0]
c0d069d2:	2360      	movs	r3, #96	; 0x60
c0d069d4:	4013      	ands	r3, r2
c0d069d6:	2b20      	cmp	r3, #32
c0d069d8:	d10d      	bne.n	c0d069f6 <USBD_StdEPReq+0x44>
c0d069da:	00ca      	lsls	r2, r1, #3
c0d069dc:	18a2      	adds	r2, r4, r2
c0d069de:	23f4      	movs	r3, #244	; 0xf4
c0d069e0:	58d2      	ldr	r2, [r2, r3]
c0d069e2:	2a00      	cmp	r2, #0
c0d069e4:	d007      	beq.n	c0d069f6 <USBD_StdEPReq+0x44>
c0d069e6:	6890      	ldr	r0, [r2, #8]
c0d069e8:	f7fc ffa0 	bl	c0d0392c <pic>
c0d069ec:	4602      	mov	r2, r0
c0d069ee:	4620      	mov	r0, r4
c0d069f0:	4629      	mov	r1, r5
c0d069f2:	4790      	blx	r2
c0d069f4:	e05c      	b.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d069f6:	786a      	ldrb	r2, [r5, #1]
c0d069f8:	2a00      	cmp	r2, #0
c0d069fa:	d00a      	beq.n	c0d06a12 <USBD_StdEPReq+0x60>
c0d069fc:	2a01      	cmp	r2, #1
c0d069fe:	d011      	beq.n	c0d06a24 <USBD_StdEPReq+0x72>
c0d06a00:	2a03      	cmp	r2, #3
c0d06a02:	d155      	bne.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a04:	20dc      	movs	r0, #220	; 0xdc
c0d06a06:	5c20      	ldrb	r0, [r4, r0]
c0d06a08:	2803      	cmp	r0, #3
c0d06a0a:	d01a      	beq.n	c0d06a42 <USBD_StdEPReq+0x90>
c0d06a0c:	2802      	cmp	r0, #2
c0d06a0e:	d00f      	beq.n	c0d06a30 <USBD_StdEPReq+0x7e>
c0d06a10:	e7d7      	b.n	c0d069c2 <USBD_StdEPReq+0x10>
c0d06a12:	22dc      	movs	r2, #220	; 0xdc
c0d06a14:	5ca2      	ldrb	r2, [r4, r2]
c0d06a16:	2a03      	cmp	r2, #3
c0d06a18:	d02e      	beq.n	c0d06a78 <USBD_StdEPReq+0xc6>
c0d06a1a:	2a02      	cmp	r2, #2
c0d06a1c:	d1d1      	bne.n	c0d069c2 <USBD_StdEPReq+0x10>
c0d06a1e:	2800      	cmp	r0, #0
c0d06a20:	d10b      	bne.n	c0d06a3a <USBD_StdEPReq+0x88>
c0d06a22:	e045      	b.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a24:	22dc      	movs	r2, #220	; 0xdc
c0d06a26:	5ca2      	ldrb	r2, [r4, r2]
c0d06a28:	2a03      	cmp	r2, #3
c0d06a2a:	d031      	beq.n	c0d06a90 <USBD_StdEPReq+0xde>
c0d06a2c:	2a02      	cmp	r2, #2
c0d06a2e:	d1c8      	bne.n	c0d069c2 <USBD_StdEPReq+0x10>
c0d06a30:	2080      	movs	r0, #128	; 0x80
c0d06a32:	460a      	mov	r2, r1
c0d06a34:	4302      	orrs	r2, r0
c0d06a36:	2a80      	cmp	r2, #128	; 0x80
c0d06a38:	d03a      	beq.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a3a:	4620      	mov	r0, r4
c0d06a3c:	f7ff fbd0 	bl	c0d061e0 <USBD_LL_StallEP>
c0d06a40:	e036      	b.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a42:	8868      	ldrh	r0, [r5, #2]
c0d06a44:	2800      	cmp	r0, #0
c0d06a46:	d107      	bne.n	c0d06a58 <USBD_StdEPReq+0xa6>
c0d06a48:	2080      	movs	r0, #128	; 0x80
c0d06a4a:	4308      	orrs	r0, r1
c0d06a4c:	2880      	cmp	r0, #128	; 0x80
c0d06a4e:	d003      	beq.n	c0d06a58 <USBD_StdEPReq+0xa6>
c0d06a50:	4620      	mov	r0, r4
c0d06a52:	f7ff fbc5 	bl	c0d061e0 <USBD_LL_StallEP>
c0d06a56:	7929      	ldrb	r1, [r5, #4]
c0d06a58:	2902      	cmp	r1, #2
c0d06a5a:	d826      	bhi.n	c0d06aaa <USBD_StdEPReq+0xf8>
c0d06a5c:	00c8      	lsls	r0, r1, #3
c0d06a5e:	1820      	adds	r0, r4, r0
c0d06a60:	21f4      	movs	r1, #244	; 0xf4
c0d06a62:	5840      	ldr	r0, [r0, r1]
c0d06a64:	2800      	cmp	r0, #0
c0d06a66:	d020      	beq.n	c0d06aaa <USBD_StdEPReq+0xf8>
c0d06a68:	6880      	ldr	r0, [r0, #8]
c0d06a6a:	f7fc ff5f 	bl	c0d0392c <pic>
c0d06a6e:	4602      	mov	r2, r0
c0d06a70:	4620      	mov	r0, r4
c0d06a72:	4629      	mov	r1, r5
c0d06a74:	4790      	blx	r2
c0d06a76:	e018      	b.n	c0d06aaa <USBD_StdEPReq+0xf8>
c0d06a78:	4620      	mov	r0, r4
c0d06a7a:	f7ff fbf5 	bl	c0d06268 <USBD_LL_IsStallEP>
c0d06a7e:	1e41      	subs	r1, r0, #1
c0d06a80:	4188      	sbcs	r0, r1
c0d06a82:	a901      	add	r1, sp, #4
c0d06a84:	8008      	strh	r0, [r1, #0]
c0d06a86:	2202      	movs	r2, #2
c0d06a88:	4620      	mov	r0, r4
c0d06a8a:	f000 fa05 	bl	c0d06e98 <USBD_CtlSendData>
c0d06a8e:	e00f      	b.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a90:	886a      	ldrh	r2, [r5, #2]
c0d06a92:	2a00      	cmp	r2, #0
c0d06a94:	d10c      	bne.n	c0d06ab0 <USBD_StdEPReq+0xfe>
c0d06a96:	2800      	cmp	r0, #0
c0d06a98:	d007      	beq.n	c0d06aaa <USBD_StdEPReq+0xf8>
c0d06a9a:	4620      	mov	r0, r4
c0d06a9c:	f7ff fbc2 	bl	c0d06224 <USBD_LL_ClearStallEP>
c0d06aa0:	7928      	ldrb	r0, [r5, #4]
c0d06aa2:	2802      	cmp	r0, #2
c0d06aa4:	d801      	bhi.n	c0d06aaa <USBD_StdEPReq+0xf8>
c0d06aa6:	00c0      	lsls	r0, r0, #3
c0d06aa8:	e7d9      	b.n	c0d06a5e <USBD_StdEPReq+0xac>
c0d06aaa:	4620      	mov	r0, r4
c0d06aac:	f000 fa1f 	bl	c0d06eee <USBD_CtlSendStatus>
c0d06ab0:	2000      	movs	r0, #0
c0d06ab2:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0d06ab4 <USBD_ParseSetupRequest>:
c0d06ab4:	780a      	ldrb	r2, [r1, #0]
c0d06ab6:	7002      	strb	r2, [r0, #0]
c0d06ab8:	784a      	ldrb	r2, [r1, #1]
c0d06aba:	7042      	strb	r2, [r0, #1]
c0d06abc:	788a      	ldrb	r2, [r1, #2]
c0d06abe:	78cb      	ldrb	r3, [r1, #3]
c0d06ac0:	021b      	lsls	r3, r3, #8
c0d06ac2:	189a      	adds	r2, r3, r2
c0d06ac4:	8042      	strh	r2, [r0, #2]
c0d06ac6:	790a      	ldrb	r2, [r1, #4]
c0d06ac8:	794b      	ldrb	r3, [r1, #5]
c0d06aca:	021b      	lsls	r3, r3, #8
c0d06acc:	189a      	adds	r2, r3, r2
c0d06ace:	8082      	strh	r2, [r0, #4]
c0d06ad0:	798a      	ldrb	r2, [r1, #6]
c0d06ad2:	79c9      	ldrb	r1, [r1, #7]
c0d06ad4:	0209      	lsls	r1, r1, #8
c0d06ad6:	1889      	adds	r1, r1, r2
c0d06ad8:	80c1      	strh	r1, [r0, #6]
c0d06ada:	4770      	bx	lr

c0d06adc <USBD_CtlStall>:
c0d06adc:	b510      	push	{r4, lr}
c0d06ade:	4604      	mov	r4, r0
c0d06ae0:	2180      	movs	r1, #128	; 0x80
c0d06ae2:	f7ff fb7d 	bl	c0d061e0 <USBD_LL_StallEP>
c0d06ae6:	2100      	movs	r1, #0
c0d06ae8:	4620      	mov	r0, r4
c0d06aea:	f7ff fb79 	bl	c0d061e0 <USBD_LL_StallEP>
c0d06aee:	bd10      	pop	{r4, pc}

c0d06af0 <USBD_HID_Setup>:
c0d06af0:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d06af2:	460e      	mov	r6, r1
c0d06af4:	4605      	mov	r5, r0
c0d06af6:	a802      	add	r0, sp, #8
c0d06af8:	2400      	movs	r4, #0
c0d06afa:	8004      	strh	r4, [r0, #0]
c0d06afc:	a801      	add	r0, sp, #4
c0d06afe:	7004      	strb	r4, [r0, #0]
c0d06b00:	7809      	ldrb	r1, [r1, #0]
c0d06b02:	2060      	movs	r0, #96	; 0x60
c0d06b04:	4008      	ands	r0, r1
c0d06b06:	d010      	beq.n	c0d06b2a <USBD_HID_Setup+0x3a>
c0d06b08:	2820      	cmp	r0, #32
c0d06b0a:	d137      	bne.n	c0d06b7c <USBD_HID_Setup+0x8c>
c0d06b0c:	7870      	ldrb	r0, [r6, #1]
c0d06b0e:	4601      	mov	r1, r0
c0d06b10:	390a      	subs	r1, #10
c0d06b12:	2902      	cmp	r1, #2
c0d06b14:	d332      	bcc.n	c0d06b7c <USBD_HID_Setup+0x8c>
c0d06b16:	2802      	cmp	r0, #2
c0d06b18:	d01b      	beq.n	c0d06b52 <USBD_HID_Setup+0x62>
c0d06b1a:	2803      	cmp	r0, #3
c0d06b1c:	d019      	beq.n	c0d06b52 <USBD_HID_Setup+0x62>
c0d06b1e:	4628      	mov	r0, r5
c0d06b20:	4631      	mov	r1, r6
c0d06b22:	f000 f92d 	bl	c0d06d80 <USBD_CtlError>
c0d06b26:	2402      	movs	r4, #2
c0d06b28:	e028      	b.n	c0d06b7c <USBD_HID_Setup+0x8c>
c0d06b2a:	7870      	ldrb	r0, [r6, #1]
c0d06b2c:	280b      	cmp	r0, #11
c0d06b2e:	d013      	beq.n	c0d06b58 <USBD_HID_Setup+0x68>
c0d06b30:	280a      	cmp	r0, #10
c0d06b32:	d00e      	beq.n	c0d06b52 <USBD_HID_Setup+0x62>
c0d06b34:	2806      	cmp	r0, #6
c0d06b36:	d121      	bne.n	c0d06b7c <USBD_HID_Setup+0x8c>
c0d06b38:	78f0      	ldrb	r0, [r6, #3]
c0d06b3a:	2400      	movs	r4, #0
c0d06b3c:	2821      	cmp	r0, #33	; 0x21
c0d06b3e:	d00f      	beq.n	c0d06b60 <USBD_HID_Setup+0x70>
c0d06b40:	2822      	cmp	r0, #34	; 0x22
c0d06b42:	4622      	mov	r2, r4
c0d06b44:	4621      	mov	r1, r4
c0d06b46:	d116      	bne.n	c0d06b76 <USBD_HID_Setup+0x86>
c0d06b48:	af02      	add	r7, sp, #8
c0d06b4a:	4638      	mov	r0, r7
c0d06b4c:	f000 f846 	bl	c0d06bdc <USBD_HID_GetReportDescriptor_impl>
c0d06b50:	e00a      	b.n	c0d06b68 <USBD_HID_Setup+0x78>
c0d06b52:	a901      	add	r1, sp, #4
c0d06b54:	2201      	movs	r2, #1
c0d06b56:	e00e      	b.n	c0d06b76 <USBD_HID_Setup+0x86>
c0d06b58:	4628      	mov	r0, r5
c0d06b5a:	f000 f9c8 	bl	c0d06eee <USBD_CtlSendStatus>
c0d06b5e:	e00d      	b.n	c0d06b7c <USBD_HID_Setup+0x8c>
c0d06b60:	af02      	add	r7, sp, #8
c0d06b62:	4638      	mov	r0, r7
c0d06b64:	f000 f826 	bl	c0d06bb4 <USBD_HID_GetHidDescriptor_impl>
c0d06b68:	4601      	mov	r1, r0
c0d06b6a:	883a      	ldrh	r2, [r7, #0]
c0d06b6c:	88f0      	ldrh	r0, [r6, #6]
c0d06b6e:	4282      	cmp	r2, r0
c0d06b70:	d300      	bcc.n	c0d06b74 <USBD_HID_Setup+0x84>
c0d06b72:	4602      	mov	r2, r0
c0d06b74:	803a      	strh	r2, [r7, #0]
c0d06b76:	4628      	mov	r0, r5
c0d06b78:	f000 f98e 	bl	c0d06e98 <USBD_CtlSendData>
c0d06b7c:	4620      	mov	r0, r4
c0d06b7e:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}

c0d06b80 <USBD_HID_Init>:
c0d06b80:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d06b82:	4604      	mov	r4, r0
c0d06b84:	2182      	movs	r1, #130	; 0x82
c0d06b86:	2603      	movs	r6, #3
c0d06b88:	2540      	movs	r5, #64	; 0x40
c0d06b8a:	4632      	mov	r2, r6
c0d06b8c:	462b      	mov	r3, r5
c0d06b8e:	f7ff fafb 	bl	c0d06188 <USBD_LL_OpenEP>
c0d06b92:	2702      	movs	r7, #2
c0d06b94:	4620      	mov	r0, r4
c0d06b96:	4639      	mov	r1, r7
c0d06b98:	4632      	mov	r2, r6
c0d06b9a:	462b      	mov	r3, r5
c0d06b9c:	f7ff faf4 	bl	c0d06188 <USBD_LL_OpenEP>
c0d06ba0:	4620      	mov	r0, r4
c0d06ba2:	4639      	mov	r1, r7
c0d06ba4:	462a      	mov	r2, r5
c0d06ba6:	f7ff fb96 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06baa:	2000      	movs	r0, #0
c0d06bac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0d06bae <USBD_HID_DeInit>:
c0d06bae:	2000      	movs	r0, #0
c0d06bb0:	4770      	bx	lr
	...

c0d06bb4 <USBD_HID_GetHidDescriptor_impl>:
c0d06bb4:	4601      	mov	r1, r0
c0d06bb6:	20ec      	movs	r0, #236	; 0xec
c0d06bb8:	4a06      	ldr	r2, [pc, #24]	; (c0d06bd4 <USBD_HID_GetHidDescriptor_impl+0x20>)
c0d06bba:	5c12      	ldrb	r2, [r2, r0]
c0d06bbc:	2000      	movs	r0, #0
c0d06bbe:	2a00      	cmp	r2, #0
c0d06bc0:	d001      	beq.n	c0d06bc6 <USBD_HID_GetHidDescriptor_impl+0x12>
c0d06bc2:	4603      	mov	r3, r0
c0d06bc4:	e000      	b.n	c0d06bc8 <USBD_HID_GetHidDescriptor_impl+0x14>
c0d06bc6:	2309      	movs	r3, #9
c0d06bc8:	800b      	strh	r3, [r1, #0]
c0d06bca:	2a00      	cmp	r2, #0
c0d06bcc:	d101      	bne.n	c0d06bd2 <USBD_HID_GetHidDescriptor_impl+0x1e>
c0d06bce:	4802      	ldr	r0, [pc, #8]	; (c0d06bd8 <USBD_HID_GetHidDescriptor_impl+0x24>)
c0d06bd0:	4478      	add	r0, pc
c0d06bd2:	4770      	bx	lr
c0d06bd4:	20000ac4 	.word	0x20000ac4
c0d06bd8:	00002c64 	.word	0x00002c64

c0d06bdc <USBD_HID_GetReportDescriptor_impl>:
c0d06bdc:	4601      	mov	r1, r0
c0d06bde:	20ec      	movs	r0, #236	; 0xec
c0d06be0:	4a06      	ldr	r2, [pc, #24]	; (c0d06bfc <USBD_HID_GetReportDescriptor_impl+0x20>)
c0d06be2:	5c12      	ldrb	r2, [r2, r0]
c0d06be4:	2000      	movs	r0, #0
c0d06be6:	2a00      	cmp	r2, #0
c0d06be8:	d001      	beq.n	c0d06bee <USBD_HID_GetReportDescriptor_impl+0x12>
c0d06bea:	4603      	mov	r3, r0
c0d06bec:	e000      	b.n	c0d06bf0 <USBD_HID_GetReportDescriptor_impl+0x14>
c0d06bee:	2322      	movs	r3, #34	; 0x22
c0d06bf0:	800b      	strh	r3, [r1, #0]
c0d06bf2:	2a00      	cmp	r2, #0
c0d06bf4:	d101      	bne.n	c0d06bfa <USBD_HID_GetReportDescriptor_impl+0x1e>
c0d06bf6:	4802      	ldr	r0, [pc, #8]	; (c0d06c00 <USBD_HID_GetReportDescriptor_impl+0x24>)
c0d06bf8:	4478      	add	r0, pc
c0d06bfa:	4770      	bx	lr
c0d06bfc:	20000ac4 	.word	0x20000ac4
c0d06c00:	00002c45 	.word	0x00002c45

c0d06c04 <USBD_HID_DataIn_impl>:
c0d06c04:	b580      	push	{r7, lr}
c0d06c06:	2902      	cmp	r1, #2
c0d06c08:	d103      	bne.n	c0d06c12 <USBD_HID_DataIn_impl+0xe>
c0d06c0a:	4803      	ldr	r0, [pc, #12]	; (c0d06c18 <USBD_HID_DataIn_impl+0x14>)
c0d06c0c:	4478      	add	r0, pc
c0d06c0e:	f7fc fc41 	bl	c0d03494 <io_usb_hid_sent>
c0d06c12:	2000      	movs	r0, #0
c0d06c14:	bd80      	pop	{r7, pc}
c0d06c16:	46c0      	nop			; (mov r8, r8)
c0d06c18:	ffffc195 	.word	0xffffc195

c0d06c1c <USBD_HID_DataOut_impl>:
c0d06c1c:	b5b0      	push	{r4, r5, r7, lr}
c0d06c1e:	2902      	cmp	r1, #2
c0d06c20:	d11a      	bne.n	c0d06c58 <USBD_HID_DataOut_impl+0x3c>
c0d06c22:	4614      	mov	r4, r2
c0d06c24:	2102      	movs	r1, #2
c0d06c26:	2240      	movs	r2, #64	; 0x40
c0d06c28:	f7ff fb55 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06c2c:	4d0b      	ldr	r5, [pc, #44]	; (c0d06c5c <USBD_HID_DataOut_impl+0x40>)
c0d06c2e:	79a8      	ldrb	r0, [r5, #6]
c0d06c30:	2800      	cmp	r0, #0
c0d06c32:	d111      	bne.n	c0d06c58 <USBD_HID_DataOut_impl+0x3c>
c0d06c34:	2002      	movs	r0, #2
c0d06c36:	f7fc f851 	bl	c0d02cdc <io_seproxyhal_get_ep_rx_size>
c0d06c3a:	4602      	mov	r2, r0
c0d06c3c:	4809      	ldr	r0, [pc, #36]	; (c0d06c64 <USBD_HID_DataOut_impl+0x48>)
c0d06c3e:	4478      	add	r0, pc
c0d06c40:	4621      	mov	r1, r4
c0d06c42:	f7fc fb75 	bl	c0d03330 <io_usb_hid_receive>
c0d06c46:	2802      	cmp	r0, #2
c0d06c48:	d106      	bne.n	c0d06c58 <USBD_HID_DataOut_impl+0x3c>
c0d06c4a:	2007      	movs	r0, #7
c0d06c4c:	7028      	strb	r0, [r5, #0]
c0d06c4e:	2001      	movs	r0, #1
c0d06c50:	71a8      	strb	r0, [r5, #6]
c0d06c52:	4803      	ldr	r0, [pc, #12]	; (c0d06c60 <USBD_HID_DataOut_impl+0x44>)
c0d06c54:	6800      	ldr	r0, [r0, #0]
c0d06c56:	8068      	strh	r0, [r5, #2]
c0d06c58:	2000      	movs	r0, #0
c0d06c5a:	bdb0      	pop	{r4, r5, r7, pc}
c0d06c5c:	2000049c 	.word	0x2000049c
c0d06c60:	20000508 	.word	0x20000508
c0d06c64:	ffffc163 	.word	0xffffc163

c0d06c68 <USBD_WEBUSB_Init>:
c0d06c68:	b570      	push	{r4, r5, r6, lr}
c0d06c6a:	4604      	mov	r4, r0
c0d06c6c:	2183      	movs	r1, #131	; 0x83
c0d06c6e:	2503      	movs	r5, #3
c0d06c70:	2640      	movs	r6, #64	; 0x40
c0d06c72:	462a      	mov	r2, r5
c0d06c74:	4633      	mov	r3, r6
c0d06c76:	f7ff fa87 	bl	c0d06188 <USBD_LL_OpenEP>
c0d06c7a:	4620      	mov	r0, r4
c0d06c7c:	4629      	mov	r1, r5
c0d06c7e:	462a      	mov	r2, r5
c0d06c80:	4633      	mov	r3, r6
c0d06c82:	f7ff fa81 	bl	c0d06188 <USBD_LL_OpenEP>
c0d06c86:	4620      	mov	r0, r4
c0d06c88:	4629      	mov	r1, r5
c0d06c8a:	4632      	mov	r2, r6
c0d06c8c:	f7ff fb23 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06c90:	2000      	movs	r0, #0
c0d06c92:	bd70      	pop	{r4, r5, r6, pc}

c0d06c94 <USBD_WEBUSB_DeInit>:
c0d06c94:	2000      	movs	r0, #0
c0d06c96:	4770      	bx	lr

c0d06c98 <USBD_WEBUSB_Setup>:
c0d06c98:	2000      	movs	r0, #0
c0d06c9a:	4770      	bx	lr

c0d06c9c <USBD_WEBUSB_DataIn>:
c0d06c9c:	b580      	push	{r7, lr}
c0d06c9e:	2903      	cmp	r1, #3
c0d06ca0:	d103      	bne.n	c0d06caa <USBD_WEBUSB_DataIn+0xe>
c0d06ca2:	4803      	ldr	r0, [pc, #12]	; (c0d06cb0 <USBD_WEBUSB_DataIn+0x14>)
c0d06ca4:	4478      	add	r0, pc
c0d06ca6:	f7fc fbf5 	bl	c0d03494 <io_usb_hid_sent>
c0d06caa:	2000      	movs	r0, #0
c0d06cac:	bd80      	pop	{r7, pc}
c0d06cae:	46c0      	nop			; (mov r8, r8)
c0d06cb0:	ffffc10d 	.word	0xffffc10d

c0d06cb4 <USBD_WEBUSB_DataOut>:
c0d06cb4:	b5b0      	push	{r4, r5, r7, lr}
c0d06cb6:	2903      	cmp	r1, #3
c0d06cb8:	d11a      	bne.n	c0d06cf0 <USBD_WEBUSB_DataOut+0x3c>
c0d06cba:	4614      	mov	r4, r2
c0d06cbc:	2103      	movs	r1, #3
c0d06cbe:	2240      	movs	r2, #64	; 0x40
c0d06cc0:	f7ff fb09 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06cc4:	4d0b      	ldr	r5, [pc, #44]	; (c0d06cf4 <USBD_WEBUSB_DataOut+0x40>)
c0d06cc6:	79a8      	ldrb	r0, [r5, #6]
c0d06cc8:	2800      	cmp	r0, #0
c0d06cca:	d111      	bne.n	c0d06cf0 <USBD_WEBUSB_DataOut+0x3c>
c0d06ccc:	2003      	movs	r0, #3
c0d06cce:	f7fc f805 	bl	c0d02cdc <io_seproxyhal_get_ep_rx_size>
c0d06cd2:	4602      	mov	r2, r0
c0d06cd4:	4809      	ldr	r0, [pc, #36]	; (c0d06cfc <USBD_WEBUSB_DataOut+0x48>)
c0d06cd6:	4478      	add	r0, pc
c0d06cd8:	4621      	mov	r1, r4
c0d06cda:	f7fc fb29 	bl	c0d03330 <io_usb_hid_receive>
c0d06cde:	2802      	cmp	r0, #2
c0d06ce0:	d106      	bne.n	c0d06cf0 <USBD_WEBUSB_DataOut+0x3c>
c0d06ce2:	200b      	movs	r0, #11
c0d06ce4:	7028      	strb	r0, [r5, #0]
c0d06ce6:	2005      	movs	r0, #5
c0d06ce8:	71a8      	strb	r0, [r5, #6]
c0d06cea:	4803      	ldr	r0, [pc, #12]	; (c0d06cf8 <USBD_WEBUSB_DataOut+0x44>)
c0d06cec:	6800      	ldr	r0, [r0, #0]
c0d06cee:	8068      	strh	r0, [r5, #2]
c0d06cf0:	2000      	movs	r0, #0
c0d06cf2:	bdb0      	pop	{r4, r5, r7, pc}
c0d06cf4:	2000049c 	.word	0x2000049c
c0d06cf8:	20000508 	.word	0x20000508
c0d06cfc:	ffffc0db 	.word	0xffffc0db

c0d06d00 <USBD_DeviceDescriptor>:
c0d06d00:	2012      	movs	r0, #18
c0d06d02:	8008      	strh	r0, [r1, #0]
c0d06d04:	4801      	ldr	r0, [pc, #4]	; (c0d06d0c <USBD_DeviceDescriptor+0xc>)
c0d06d06:	4478      	add	r0, pc
c0d06d08:	4770      	bx	lr
c0d06d0a:	46c0      	nop			; (mov r8, r8)
c0d06d0c:	00002d7a 	.word	0x00002d7a

c0d06d10 <USBD_LangIDStrDescriptor>:
c0d06d10:	2004      	movs	r0, #4
c0d06d12:	8008      	strh	r0, [r1, #0]
c0d06d14:	4801      	ldr	r0, [pc, #4]	; (c0d06d1c <USBD_LangIDStrDescriptor+0xc>)
c0d06d16:	4478      	add	r0, pc
c0d06d18:	4770      	bx	lr
c0d06d1a:	46c0      	nop			; (mov r8, r8)
c0d06d1c:	00002d7c 	.word	0x00002d7c

c0d06d20 <USBD_ManufacturerStrDescriptor>:
c0d06d20:	200e      	movs	r0, #14
c0d06d22:	8008      	strh	r0, [r1, #0]
c0d06d24:	4801      	ldr	r0, [pc, #4]	; (c0d06d2c <USBD_ManufacturerStrDescriptor+0xc>)
c0d06d26:	4478      	add	r0, pc
c0d06d28:	4770      	bx	lr
c0d06d2a:	46c0      	nop			; (mov r8, r8)
c0d06d2c:	00002d70 	.word	0x00002d70

c0d06d30 <USBD_ProductStrDescriptor>:
c0d06d30:	200e      	movs	r0, #14
c0d06d32:	8008      	strh	r0, [r1, #0]
c0d06d34:	4801      	ldr	r0, [pc, #4]	; (c0d06d3c <USBD_ProductStrDescriptor+0xc>)
c0d06d36:	4478      	add	r0, pc
c0d06d38:	4770      	bx	lr
c0d06d3a:	46c0      	nop			; (mov r8, r8)
c0d06d3c:	00002d6e 	.word	0x00002d6e

c0d06d40 <USBD_SerialStrDescriptor>:
c0d06d40:	200a      	movs	r0, #10
c0d06d42:	8008      	strh	r0, [r1, #0]
c0d06d44:	4801      	ldr	r0, [pc, #4]	; (c0d06d4c <USBD_SerialStrDescriptor+0xc>)
c0d06d46:	4478      	add	r0, pc
c0d06d48:	4770      	bx	lr
c0d06d4a:	46c0      	nop			; (mov r8, r8)
c0d06d4c:	00002d6c 	.word	0x00002d6c

c0d06d50 <USBD_ConfigStrDescriptor>:
c0d06d50:	200e      	movs	r0, #14
c0d06d52:	8008      	strh	r0, [r1, #0]
c0d06d54:	4801      	ldr	r0, [pc, #4]	; (c0d06d5c <USBD_ConfigStrDescriptor+0xc>)
c0d06d56:	4478      	add	r0, pc
c0d06d58:	4770      	bx	lr
c0d06d5a:	46c0      	nop			; (mov r8, r8)
c0d06d5c:	00002d4e 	.word	0x00002d4e

c0d06d60 <USBD_InterfaceStrDescriptor>:
c0d06d60:	200e      	movs	r0, #14
c0d06d62:	8008      	strh	r0, [r1, #0]
c0d06d64:	4801      	ldr	r0, [pc, #4]	; (c0d06d6c <USBD_InterfaceStrDescriptor+0xc>)
c0d06d66:	4478      	add	r0, pc
c0d06d68:	4770      	bx	lr
c0d06d6a:	46c0      	nop			; (mov r8, r8)
c0d06d6c:	00002d3e 	.word	0x00002d3e

c0d06d70 <USBD_BOSDescriptor>:
c0d06d70:	2039      	movs	r0, #57	; 0x39
c0d06d72:	8008      	strh	r0, [r1, #0]
c0d06d74:	4801      	ldr	r0, [pc, #4]	; (c0d06d7c <USBD_BOSDescriptor+0xc>)
c0d06d76:	4478      	add	r0, pc
c0d06d78:	4770      	bx	lr
c0d06d7a:	46c0      	nop			; (mov r8, r8)
c0d06d7c:	00002ae9 	.word	0x00002ae9

c0d06d80 <USBD_CtlError>:
c0d06d80:	b580      	push	{r7, lr}
c0d06d82:	780a      	ldrb	r2, [r1, #0]
c0d06d84:	b252      	sxtb	r2, r2
c0d06d86:	2a00      	cmp	r2, #0
c0d06d88:	d402      	bmi.n	c0d06d90 <USBD_CtlError+0x10>
c0d06d8a:	f7ff fea7 	bl	c0d06adc <USBD_CtlStall>
c0d06d8e:	bd80      	pop	{r7, pc}
c0d06d90:	784a      	ldrb	r2, [r1, #1]
c0d06d92:	2a77      	cmp	r2, #119	; 0x77
c0d06d94:	d00c      	beq.n	c0d06db0 <USBD_CtlError+0x30>
c0d06d96:	2a06      	cmp	r2, #6
c0d06d98:	d1f7      	bne.n	c0d06d8a <USBD_CtlError+0xa>
c0d06d9a:	884a      	ldrh	r2, [r1, #2]
c0d06d9c:	4b14      	ldr	r3, [pc, #80]	; (c0d06df0 <USBD_CtlError+0x70>)
c0d06d9e:	429a      	cmp	r2, r3
c0d06da0:	d1f3      	bne.n	c0d06d8a <USBD_CtlError+0xa>
c0d06da2:	88ca      	ldrh	r2, [r1, #6]
c0d06da4:	2a12      	cmp	r2, #18
c0d06da6:	d300      	bcc.n	c0d06daa <USBD_CtlError+0x2a>
c0d06da8:	2212      	movs	r2, #18
c0d06daa:	4912      	ldr	r1, [pc, #72]	; (c0d06df4 <USBD_CtlError+0x74>)
c0d06dac:	4479      	add	r1, pc
c0d06dae:	e01c      	b.n	c0d06dea <USBD_CtlError+0x6a>
c0d06db0:	888a      	ldrh	r2, [r1, #4]
c0d06db2:	2a04      	cmp	r2, #4
c0d06db4:	d106      	bne.n	c0d06dc4 <USBD_CtlError+0x44>
c0d06db6:	88ca      	ldrh	r2, [r1, #6]
c0d06db8:	2a28      	cmp	r2, #40	; 0x28
c0d06dba:	d300      	bcc.n	c0d06dbe <USBD_CtlError+0x3e>
c0d06dbc:	2228      	movs	r2, #40	; 0x28
c0d06dbe:	490e      	ldr	r1, [pc, #56]	; (c0d06df8 <USBD_CtlError+0x78>)
c0d06dc0:	4479      	add	r1, pc
c0d06dc2:	e012      	b.n	c0d06dea <USBD_CtlError+0x6a>
c0d06dc4:	888a      	ldrh	r2, [r1, #4]
c0d06dc6:	2a05      	cmp	r2, #5
c0d06dc8:	d106      	bne.n	c0d06dd8 <USBD_CtlError+0x58>
c0d06dca:	88ca      	ldrh	r2, [r1, #6]
c0d06dcc:	2a92      	cmp	r2, #146	; 0x92
c0d06dce:	d300      	bcc.n	c0d06dd2 <USBD_CtlError+0x52>
c0d06dd0:	2292      	movs	r2, #146	; 0x92
c0d06dd2:	490a      	ldr	r1, [pc, #40]	; (c0d06dfc <USBD_CtlError+0x7c>)
c0d06dd4:	4479      	add	r1, pc
c0d06dd6:	e008      	b.n	c0d06dea <USBD_CtlError+0x6a>
c0d06dd8:	888a      	ldrh	r2, [r1, #4]
c0d06dda:	2a07      	cmp	r2, #7
c0d06ddc:	d1d5      	bne.n	c0d06d8a <USBD_CtlError+0xa>
c0d06dde:	88ca      	ldrh	r2, [r1, #6]
c0d06de0:	2ab2      	cmp	r2, #178	; 0xb2
c0d06de2:	d300      	bcc.n	c0d06de6 <USBD_CtlError+0x66>
c0d06de4:	22b2      	movs	r2, #178	; 0xb2
c0d06de6:	4906      	ldr	r1, [pc, #24]	; (c0d06e00 <USBD_CtlError+0x80>)
c0d06de8:	4479      	add	r1, pc
c0d06dea:	f000 f855 	bl	c0d06e98 <USBD_CtlSendData>
c0d06dee:	bd80      	pop	{r7, pc}
c0d06df0:	000003ee 	.word	0x000003ee
c0d06df4:	00002b0c 	.word	0x00002b0c
c0d06df8:	00002cfc 	.word	0x00002cfc
c0d06dfc:	00002af6 	.word	0x00002af6
c0d06e00:	00002b74 	.word	0x00002b74

c0d06e04 <USB_power>:
c0d06e04:	b5b0      	push	{r4, r5, r7, lr}
c0d06e06:	4604      	mov	r4, r0
c0d06e08:	2045      	movs	r0, #69	; 0x45
c0d06e0a:	0085      	lsls	r5, r0, #2
c0d06e0c:	4815      	ldr	r0, [pc, #84]	; (c0d06e64 <USB_power+0x60>)
c0d06e0e:	4629      	mov	r1, r5
c0d06e10:	f000 fc1e 	bl	c0d07650 <__aeabi_memclr>
c0d06e14:	4814      	ldr	r0, [pc, #80]	; (c0d06e68 <USB_power+0x64>)
c0d06e16:	300c      	adds	r0, #12
c0d06e18:	2112      	movs	r1, #18
c0d06e1a:	f000 fc19 	bl	c0d07650 <__aeabi_memclr>
c0d06e1e:	2c00      	cmp	r4, #0
c0d06e20:	d01b      	beq.n	c0d06e5a <USB_power+0x56>
c0d06e22:	4c10      	ldr	r4, [pc, #64]	; (c0d06e64 <USB_power+0x60>)
c0d06e24:	4620      	mov	r0, r4
c0d06e26:	4629      	mov	r1, r5
c0d06e28:	f000 fc12 	bl	c0d07650 <__aeabi_memclr>
c0d06e2c:	490f      	ldr	r1, [pc, #60]	; (c0d06e6c <USB_power+0x68>)
c0d06e2e:	4479      	add	r1, pc
c0d06e30:	2500      	movs	r5, #0
c0d06e32:	4620      	mov	r0, r4
c0d06e34:	462a      	mov	r2, r5
c0d06e36:	f7ff fa5f 	bl	c0d062f8 <USBD_Init>
c0d06e3a:	4a0d      	ldr	r2, [pc, #52]	; (c0d06e70 <USB_power+0x6c>)
c0d06e3c:	447a      	add	r2, pc
c0d06e3e:	4628      	mov	r0, r5
c0d06e40:	4621      	mov	r1, r4
c0d06e42:	f7ff fa93 	bl	c0d0636c <USBD_RegisterClassForInterface>
c0d06e46:	2001      	movs	r0, #1
c0d06e48:	4a0a      	ldr	r2, [pc, #40]	; (c0d06e74 <USB_power+0x70>)
c0d06e4a:	447a      	add	r2, pc
c0d06e4c:	4621      	mov	r1, r4
c0d06e4e:	f7ff fa8d 	bl	c0d0636c <USBD_RegisterClassForInterface>
c0d06e52:	4620      	mov	r0, r4
c0d06e54:	f7ff fa97 	bl	c0d06386 <USBD_Start>
c0d06e58:	bdb0      	pop	{r4, r5, r7, pc}
c0d06e5a:	4802      	ldr	r0, [pc, #8]	; (c0d06e64 <USB_power+0x60>)
c0d06e5c:	f7ff fa66 	bl	c0d0632c <USBD_DeInit>
c0d06e60:	bdb0      	pop	{r4, r5, r7, pc}
c0d06e62:	46c0      	nop			; (mov r8, r8)
c0d06e64:	20000ac4 	.word	0x20000ac4
c0d06e68:	2000049c 	.word	0x2000049c
c0d06e6c:	00002a6a 	.word	0x00002a6a
c0d06e70:	00002bd4 	.word	0x00002bd4
c0d06e74:	00002bfe 	.word	0x00002bfe

c0d06e78 <USBD_GetCfgDesc_impl>:
c0d06e78:	2140      	movs	r1, #64	; 0x40
c0d06e7a:	8001      	strh	r1, [r0, #0]
c0d06e7c:	4801      	ldr	r0, [pc, #4]	; (c0d06e84 <USBD_GetCfgDesc_impl+0xc>)
c0d06e7e:	4478      	add	r0, pc
c0d06e80:	4770      	bx	lr
c0d06e82:	46c0      	nop			; (mov r8, r8)
c0d06e84:	00002c66 	.word	0x00002c66

c0d06e88 <USBD_GetDeviceQualifierDesc_impl>:
c0d06e88:	210a      	movs	r1, #10
c0d06e8a:	8001      	strh	r1, [r0, #0]
c0d06e8c:	4801      	ldr	r0, [pc, #4]	; (c0d06e94 <USBD_GetDeviceQualifierDesc_impl+0xc>)
c0d06e8e:	4478      	add	r0, pc
c0d06e90:	4770      	bx	lr
c0d06e92:	46c0      	nop			; (mov r8, r8)
c0d06e94:	00002c96 	.word	0x00002c96

c0d06e98 <USBD_CtlSendData>:
c0d06e98:	b5b0      	push	{r4, r5, r7, lr}
c0d06e9a:	460c      	mov	r4, r1
c0d06e9c:	21d4      	movs	r1, #212	; 0xd4
c0d06e9e:	2302      	movs	r3, #2
c0d06ea0:	5043      	str	r3, [r0, r1]
c0d06ea2:	6182      	str	r2, [r0, #24]
c0d06ea4:	61c2      	str	r2, [r0, #28]
c0d06ea6:	4601      	mov	r1, r0
c0d06ea8:	31d4      	adds	r1, #212	; 0xd4
c0d06eaa:	63cc      	str	r4, [r1, #60]	; 0x3c
c0d06eac:	6a01      	ldr	r1, [r0, #32]
c0d06eae:	4291      	cmp	r1, r2
c0d06eb0:	d800      	bhi.n	c0d06eb4 <USBD_CtlSendData+0x1c>
c0d06eb2:	460a      	mov	r2, r1
c0d06eb4:	b293      	uxth	r3, r2
c0d06eb6:	2500      	movs	r5, #0
c0d06eb8:	4629      	mov	r1, r5
c0d06eba:	4622      	mov	r2, r4
c0d06ebc:	f7ff f9f4 	bl	c0d062a8 <USBD_LL_Transmit>
c0d06ec0:	4628      	mov	r0, r5
c0d06ec2:	bdb0      	pop	{r4, r5, r7, pc}

c0d06ec4 <USBD_CtlContinueSendData>:
c0d06ec4:	b5b0      	push	{r4, r5, r7, lr}
c0d06ec6:	460c      	mov	r4, r1
c0d06ec8:	6a01      	ldr	r1, [r0, #32]
c0d06eca:	4291      	cmp	r1, r2
c0d06ecc:	d800      	bhi.n	c0d06ed0 <USBD_CtlContinueSendData+0xc>
c0d06ece:	460a      	mov	r2, r1
c0d06ed0:	b293      	uxth	r3, r2
c0d06ed2:	2500      	movs	r5, #0
c0d06ed4:	4629      	mov	r1, r5
c0d06ed6:	4622      	mov	r2, r4
c0d06ed8:	f7ff f9e6 	bl	c0d062a8 <USBD_LL_Transmit>
c0d06edc:	4628      	mov	r0, r5
c0d06ede:	bdb0      	pop	{r4, r5, r7, pc}

c0d06ee0 <USBD_CtlContinueRx>:
c0d06ee0:	b510      	push	{r4, lr}
c0d06ee2:	2400      	movs	r4, #0
c0d06ee4:	4621      	mov	r1, r4
c0d06ee6:	f7ff f9f6 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06eea:	4620      	mov	r0, r4
c0d06eec:	bd10      	pop	{r4, pc}

c0d06eee <USBD_CtlSendStatus>:
c0d06eee:	b510      	push	{r4, lr}
c0d06ef0:	21d4      	movs	r1, #212	; 0xd4
c0d06ef2:	2204      	movs	r2, #4
c0d06ef4:	5042      	str	r2, [r0, r1]
c0d06ef6:	2400      	movs	r4, #0
c0d06ef8:	4621      	mov	r1, r4
c0d06efa:	4622      	mov	r2, r4
c0d06efc:	4623      	mov	r3, r4
c0d06efe:	f7ff f9d3 	bl	c0d062a8 <USBD_LL_Transmit>
c0d06f02:	4620      	mov	r0, r4
c0d06f04:	bd10      	pop	{r4, pc}

c0d06f06 <USBD_CtlReceiveStatus>:
c0d06f06:	b510      	push	{r4, lr}
c0d06f08:	21d4      	movs	r1, #212	; 0xd4
c0d06f0a:	2205      	movs	r2, #5
c0d06f0c:	5042      	str	r2, [r0, r1]
c0d06f0e:	2400      	movs	r4, #0
c0d06f10:	4621      	mov	r1, r4
c0d06f12:	4622      	mov	r2, r4
c0d06f14:	f7ff f9df 	bl	c0d062d6 <USBD_LL_PrepareReceive>
c0d06f18:	4620      	mov	r0, r4
c0d06f1a:	bd10      	pop	{r4, pc}

c0d06f1c <ux_menu_element_preprocessor>:
c0d06f1c:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d06f1e:	4607      	mov	r7, r0
c0d06f20:	4d6f      	ldr	r5, [pc, #444]	; (c0d070e0 <ux_menu_element_preprocessor+0x1c4>)
c0d06f22:	35a0      	adds	r5, #160	; 0xa0
c0d06f24:	2220      	movs	r2, #32
c0d06f26:	4628      	mov	r0, r5
c0d06f28:	4639      	mov	r1, r7
c0d06f2a:	f000 fb9b 	bl	c0d07664 <__aeabi_memmove>
c0d06f2e:	4a6d      	ldr	r2, [pc, #436]	; (c0d070e4 <ux_menu_element_preprocessor+0x1c8>)
c0d06f30:	6911      	ldr	r1, [r2, #16]
c0d06f32:	6890      	ldr	r0, [r2, #8]
c0d06f34:	2900      	cmp	r1, #0
c0d06f36:	d002      	beq.n	c0d06f3e <ux_menu_element_preprocessor+0x22>
c0d06f38:	4614      	mov	r4, r2
c0d06f3a:	4788      	blx	r1
c0d06f3c:	e004      	b.n	c0d06f48 <ux_menu_element_preprocessor+0x2c>
c0d06f3e:	211c      	movs	r1, #28
c0d06f40:	4341      	muls	r1, r0
c0d06f42:	4614      	mov	r4, r2
c0d06f44:	6810      	ldr	r0, [r2, #0]
c0d06f46:	1840      	adds	r0, r0, r1
c0d06f48:	f7fc fcf0 	bl	c0d0392c <pic>
c0d06f4c:	2800      	cmp	r0, #0
c0d06f4e:	d100      	bne.n	c0d06f52 <ux_menu_element_preprocessor+0x36>
c0d06f50:	e0ba      	b.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d06f52:	4606      	mov	r6, r0
c0d06f54:	68c0      	ldr	r0, [r0, #12]
c0d06f56:	f7fc fce9 	bl	c0d0392c <pic>
c0d06f5a:	9001      	str	r0, [sp, #4]
c0d06f5c:	4623      	mov	r3, r4
c0d06f5e:	68a0      	ldr	r0, [r4, #8]
c0d06f60:	2200      	movs	r2, #0
c0d06f62:	2800      	cmp	r0, #0
c0d06f64:	d009      	beq.n	c0d06f7a <ux_menu_element_preprocessor+0x5e>
c0d06f66:	9502      	str	r5, [sp, #8]
c0d06f68:	4635      	mov	r5, r6
c0d06f6a:	4616      	mov	r6, r2
c0d06f6c:	6919      	ldr	r1, [r3, #16]
c0d06f6e:	1e40      	subs	r0, r0, #1
c0d06f70:	2900      	cmp	r1, #0
c0d06f72:	d005      	beq.n	c0d06f80 <ux_menu_element_preprocessor+0x64>
c0d06f74:	461c      	mov	r4, r3
c0d06f76:	4788      	blx	r1
c0d06f78:	e007      	b.n	c0d06f8a <ux_menu_element_preprocessor+0x6e>
c0d06f7a:	4610      	mov	r0, r2
c0d06f7c:	9200      	str	r2, [sp, #0]
c0d06f7e:	e00c      	b.n	c0d06f9a <ux_menu_element_preprocessor+0x7e>
c0d06f80:	211c      	movs	r1, #28
c0d06f82:	4341      	muls	r1, r0
c0d06f84:	6818      	ldr	r0, [r3, #0]
c0d06f86:	1840      	adds	r0, r0, r1
c0d06f88:	461c      	mov	r4, r3
c0d06f8a:	f7fc fccf 	bl	c0d0392c <pic>
c0d06f8e:	9000      	str	r0, [sp, #0]
c0d06f90:	68a0      	ldr	r0, [r4, #8]
c0d06f92:	4623      	mov	r3, r4
c0d06f94:	4632      	mov	r2, r6
c0d06f96:	462e      	mov	r6, r5
c0d06f98:	9d02      	ldr	r5, [sp, #8]
c0d06f9a:	6859      	ldr	r1, [r3, #4]
c0d06f9c:	1e49      	subs	r1, r1, #1
c0d06f9e:	4288      	cmp	r0, r1
c0d06fa0:	d20f      	bcs.n	c0d06fc2 <ux_menu_element_preprocessor+0xa6>
c0d06fa2:	6919      	ldr	r1, [r3, #16]
c0d06fa4:	1c40      	adds	r0, r0, #1
c0d06fa6:	2900      	cmp	r1, #0
c0d06fa8:	d002      	beq.n	c0d06fb0 <ux_menu_element_preprocessor+0x94>
c0d06faa:	461c      	mov	r4, r3
c0d06fac:	4788      	blx	r1
c0d06fae:	e004      	b.n	c0d06fba <ux_menu_element_preprocessor+0x9e>
c0d06fb0:	211c      	movs	r1, #28
c0d06fb2:	4341      	muls	r1, r0
c0d06fb4:	461c      	mov	r4, r3
c0d06fb6:	6818      	ldr	r0, [r3, #0]
c0d06fb8:	1840      	adds	r0, r0, r1
c0d06fba:	f7fc fcb7 	bl	c0d0392c <pic>
c0d06fbe:	4602      	mov	r2, r0
c0d06fc0:	4623      	mov	r3, r4
c0d06fc2:	7878      	ldrb	r0, [r7, #1]
c0d06fc4:	2810      	cmp	r0, #16
c0d06fc6:	d012      	beq.n	c0d06fee <ux_menu_element_preprocessor+0xd2>
c0d06fc8:	2820      	cmp	r0, #32
c0d06fca:	d01a      	beq.n	c0d07002 <ux_menu_element_preprocessor+0xe6>
c0d06fcc:	2821      	cmp	r0, #33	; 0x21
c0d06fce:	d01c      	beq.n	c0d0700a <ux_menu_element_preprocessor+0xee>
c0d06fd0:	2822      	cmp	r0, #34	; 0x22
c0d06fd2:	4f43      	ldr	r7, [pc, #268]	; (c0d070e0 <ux_menu_element_preprocessor+0x1c4>)
c0d06fd4:	d01f      	beq.n	c0d07016 <ux_menu_element_preprocessor+0xfa>
c0d06fd6:	2841      	cmp	r0, #65	; 0x41
c0d06fd8:	d038      	beq.n	c0d0704c <ux_menu_element_preprocessor+0x130>
c0d06fda:	2842      	cmp	r0, #66	; 0x42
c0d06fdc:	d050      	beq.n	c0d07080 <ux_menu_element_preprocessor+0x164>
c0d06fde:	2882      	cmp	r0, #130	; 0x82
c0d06fe0:	d06d      	beq.n	c0d070be <ux_menu_element_preprocessor+0x1a2>
c0d06fe2:	2881      	cmp	r0, #129	; 0x81
c0d06fe4:	d172      	bne.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d06fe6:	6898      	ldr	r0, [r3, #8]
c0d06fe8:	2800      	cmp	r0, #0
c0d06fea:	d16f      	bne.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d06fec:	e06c      	b.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d06fee:	68f0      	ldr	r0, [r6, #12]
c0d06ff0:	2800      	cmp	r0, #0
c0d06ff2:	d069      	beq.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d06ff4:	21bc      	movs	r1, #188	; 0xbc
c0d06ff6:	4f3a      	ldr	r7, [pc, #232]	; (c0d070e0 <ux_menu_element_preprocessor+0x1c4>)
c0d06ff8:	5078      	str	r0, [r7, r1]
c0d06ffa:	7e70      	ldrb	r0, [r6, #25]
c0d06ffc:	2800      	cmp	r0, #0
c0d06ffe:	d122      	bne.n	c0d07046 <ux_menu_element_preprocessor+0x12a>
c0d07000:	e064      	b.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d07002:	6970      	ldr	r0, [r6, #20]
c0d07004:	2800      	cmp	r0, #0
c0d07006:	d15f      	bne.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d07008:	e002      	b.n	c0d07010 <ux_menu_element_preprocessor+0xf4>
c0d0700a:	6970      	ldr	r0, [r6, #20]
c0d0700c:	2800      	cmp	r0, #0
c0d0700e:	d05b      	beq.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d07010:	6930      	ldr	r0, [r6, #16]
c0d07012:	4f33      	ldr	r7, [pc, #204]	; (c0d070e0 <ux_menu_element_preprocessor+0x1c4>)
c0d07014:	e002      	b.n	c0d0701c <ux_menu_element_preprocessor+0x100>
c0d07016:	6970      	ldr	r0, [r6, #20]
c0d07018:	2800      	cmp	r0, #0
c0d0701a:	d055      	beq.n	c0d070c8 <ux_menu_element_preprocessor+0x1ac>
c0d0701c:	21bc      	movs	r1, #188	; 0xbc
c0d0701e:	5078      	str	r0, [r7, r1]
c0d07020:	9801      	ldr	r0, [sp, #4]
c0d07022:	2800      	cmp	r0, #0
c0d07024:	d009      	beq.n	c0d0703a <ux_menu_element_preprocessor+0x11e>
c0d07026:	4602      	mov	r2, r0
c0d07028:	20a2      	movs	r0, #162	; 0xa2
c0d0702a:	5a39      	ldrh	r1, [r7, r0]
c0d0702c:	8812      	ldrh	r2, [r2, #0]
c0d0702e:	1889      	adds	r1, r1, r2
c0d07030:	5239      	strh	r1, [r7, r0]
c0d07032:	20a6      	movs	r0, #166	; 0xa6
c0d07034:	5a39      	ldrh	r1, [r7, r0]
c0d07036:	1a89      	subs	r1, r1, r2
c0d07038:	5239      	strh	r1, [r7, r0]
c0d0703a:	7e30      	ldrb	r0, [r6, #24]
c0d0703c:	2800      	cmp	r0, #0
c0d0703e:	d045      	beq.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d07040:	21b8      	movs	r1, #184	; 0xb8
c0d07042:	2208      	movs	r2, #8
c0d07044:	527a      	strh	r2, [r7, r1]
c0d07046:	21a2      	movs	r1, #162	; 0xa2
c0d07048:	5278      	strh	r0, [r7, r1]
c0d0704a:	e03f      	b.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d0704c:	6971      	ldr	r1, [r6, #20]
c0d0704e:	2000      	movs	r0, #0
c0d07050:	2900      	cmp	r1, #0
c0d07052:	d143      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07054:	68f1      	ldr	r1, [r6, #12]
c0d07056:	2900      	cmp	r1, #0
c0d07058:	d140      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d0705a:	6899      	ldr	r1, [r3, #8]
c0d0705c:	2900      	cmp	r1, #0
c0d0705e:	d03d      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07060:	9a00      	ldr	r2, [sp, #0]
c0d07062:	2a00      	cmp	r2, #0
c0d07064:	d03a      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07066:	6859      	ldr	r1, [r3, #4]
c0d07068:	2901      	cmp	r1, #1
c0d0706a:	d037      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d0706c:	68d1      	ldr	r1, [r2, #12]
c0d0706e:	2900      	cmp	r1, #0
c0d07070:	d134      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07072:	6951      	ldr	r1, [r2, #20]
c0d07074:	2900      	cmp	r1, #0
c0d07076:	d131      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07078:	6910      	ldr	r0, [r2, #16]
c0d0707a:	21bc      	movs	r1, #188	; 0xbc
c0d0707c:	5078      	str	r0, [r7, r1]
c0d0707e:	e025      	b.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d07080:	6971      	ldr	r1, [r6, #20]
c0d07082:	2000      	movs	r0, #0
c0d07084:	2900      	cmp	r1, #0
c0d07086:	d129      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d07088:	68f1      	ldr	r1, [r6, #12]
c0d0708a:	2900      	cmp	r1, #0
c0d0708c:	d126      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d0708e:	9502      	str	r5, [sp, #8]
c0d07090:	4635      	mov	r5, r6
c0d07092:	4616      	mov	r6, r2
c0d07094:	6859      	ldr	r1, [r3, #4]
c0d07096:	461c      	mov	r4, r3
c0d07098:	689a      	ldr	r2, [r3, #8]
c0d0709a:	1e4b      	subs	r3, r1, #1
c0d0709c:	429a      	cmp	r2, r3
c0d0709e:	d01d      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d070a0:	2e00      	cmp	r6, #0
c0d070a2:	d01b      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d070a4:	2901      	cmp	r1, #1
c0d070a6:	d019      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d070a8:	4632      	mov	r2, r6
c0d070aa:	68f1      	ldr	r1, [r6, #12]
c0d070ac:	2900      	cmp	r1, #0
c0d070ae:	d115      	bne.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d070b0:	462e      	mov	r6, r5
c0d070b2:	6910      	ldr	r0, [r2, #16]
c0d070b4:	21bc      	movs	r1, #188	; 0xbc
c0d070b6:	5078      	str	r0, [r7, r1]
c0d070b8:	4623      	mov	r3, r4
c0d070ba:	9d02      	ldr	r5, [sp, #8]
c0d070bc:	e006      	b.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d070be:	6858      	ldr	r0, [r3, #4]
c0d070c0:	6899      	ldr	r1, [r3, #8]
c0d070c2:	1e40      	subs	r0, r0, #1
c0d070c4:	4281      	cmp	r1, r0
c0d070c6:	d101      	bne.n	c0d070cc <ux_menu_element_preprocessor+0x1b0>
c0d070c8:	2000      	movs	r0, #0
c0d070ca:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d070cc:	68da      	ldr	r2, [r3, #12]
c0d070ce:	2a00      	cmp	r2, #0
c0d070d0:	4628      	mov	r0, r5
c0d070d2:	d003      	beq.n	c0d070dc <ux_menu_element_preprocessor+0x1c0>
c0d070d4:	37a0      	adds	r7, #160	; 0xa0
c0d070d6:	4630      	mov	r0, r6
c0d070d8:	4639      	mov	r1, r7
c0d070da:	4790      	blx	r2
c0d070dc:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d070de:	46c0      	nop			; (mov r8, r8)
c0d070e0:	20000288 	.word	0x20000288
c0d070e4:	20000bd8 	.word	0x20000bd8

c0d070e8 <ux_menu_elements_button>:
c0d070e8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0d070ea:	4605      	mov	r5, r0
c0d070ec:	4f40      	ldr	r7, [pc, #256]	; (c0d071f0 <ux_menu_elements_button+0x108>)
c0d070ee:	6939      	ldr	r1, [r7, #16]
c0d070f0:	68b8      	ldr	r0, [r7, #8]
c0d070f2:	2900      	cmp	r1, #0
c0d070f4:	d001      	beq.n	c0d070fa <ux_menu_elements_button+0x12>
c0d070f6:	4788      	blx	r1
c0d070f8:	e003      	b.n	c0d07102 <ux_menu_elements_button+0x1a>
c0d070fa:	211c      	movs	r1, #28
c0d070fc:	4341      	muls	r1, r0
c0d070fe:	6838      	ldr	r0, [r7, #0]
c0d07100:	1840      	adds	r0, r0, r1
c0d07102:	f7fc fc13 	bl	c0d0392c <pic>
c0d07106:	2401      	movs	r4, #1
c0d07108:	2800      	cmp	r0, #0
c0d0710a:	d06e      	beq.n	c0d071ea <ux_menu_elements_button+0x102>
c0d0710c:	4606      	mov	r6, r0
c0d0710e:	4839      	ldr	r0, [pc, #228]	; (c0d071f4 <ux_menu_elements_button+0x10c>)
c0d07110:	4285      	cmp	r5, r0
c0d07112:	d01e      	beq.n	c0d07152 <ux_menu_elements_button+0x6a>
c0d07114:	4838      	ldr	r0, [pc, #224]	; (c0d071f8 <ux_menu_elements_button+0x110>)
c0d07116:	4285      	cmp	r5, r0
c0d07118:	d014      	beq.n	c0d07144 <ux_menu_elements_button+0x5c>
c0d0711a:	4838      	ldr	r0, [pc, #224]	; (c0d071fc <ux_menu_elements_button+0x114>)
c0d0711c:	4285      	cmp	r5, r0
c0d0711e:	d011      	beq.n	c0d07144 <ux_menu_elements_button+0x5c>
c0d07120:	4837      	ldr	r0, [pc, #220]	; (c0d07200 <ux_menu_elements_button+0x118>)
c0d07122:	4285      	cmp	r5, r0
c0d07124:	d015      	beq.n	c0d07152 <ux_menu_elements_button+0x6a>
c0d07126:	4837      	ldr	r0, [pc, #220]	; (c0d07204 <ux_menu_elements_button+0x11c>)
c0d07128:	4285      	cmp	r5, r0
c0d0712a:	d15e      	bne.n	c0d071ea <ux_menu_elements_button+0x102>
c0d0712c:	6830      	ldr	r0, [r6, #0]
c0d0712e:	2800      	cmp	r0, #0
c0d07130:	d052      	beq.n	c0d071d8 <ux_menu_elements_button+0xf0>
c0d07132:	68b4      	ldr	r4, [r6, #8]
c0d07134:	f7fc fbfa 	bl	c0d0392c <pic>
c0d07138:	4601      	mov	r1, r0
c0d0713a:	68fa      	ldr	r2, [r7, #12]
c0d0713c:	4620      	mov	r0, r4
c0d0713e:	f000 f867 	bl	c0d07210 <ux_menu_display>
c0d07142:	e051      	b.n	c0d071e8 <ux_menu_elements_button+0x100>
c0d07144:	6879      	ldr	r1, [r7, #4]
c0d07146:	68b8      	ldr	r0, [r7, #8]
c0d07148:	1e49      	subs	r1, r1, #1
c0d0714a:	4288      	cmp	r0, r1
c0d0714c:	d24c      	bcs.n	c0d071e8 <ux_menu_elements_button+0x100>
c0d0714e:	1c40      	adds	r0, r0, #1
c0d07150:	e003      	b.n	c0d0715a <ux_menu_elements_button+0x72>
c0d07152:	68b8      	ldr	r0, [r7, #8]
c0d07154:	2800      	cmp	r0, #0
c0d07156:	d047      	beq.n	c0d071e8 <ux_menu_elements_button+0x100>
c0d07158:	1e40      	subs	r0, r0, #1
c0d0715a:	60b8      	str	r0, [r7, #8]
c0d0715c:	f7fb fea8 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d07160:	f7fb fea8 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d07164:	25c2      	movs	r5, #194	; 0xc2
c0d07166:	4e28      	ldr	r6, [pc, #160]	; (c0d07208 <ux_menu_elements_button+0x120>)
c0d07168:	2400      	movs	r4, #0
c0d0716a:	5374      	strh	r4, [r6, r5]
c0d0716c:	2004      	movs	r0, #4
c0d0716e:	f7fe f9db 	bl	c0d05528 <os_sched_last_status>
c0d07172:	4926      	ldr	r1, [pc, #152]	; (c0d0720c <ux_menu_elements_button+0x124>)
c0d07174:	6048      	str	r0, [r1, #4]
c0d07176:	2800      	cmp	r0, #0
c0d07178:	d037      	beq.n	c0d071ea <ux_menu_elements_button+0x102>
c0d0717a:	2897      	cmp	r0, #151	; 0x97
c0d0717c:	d035      	beq.n	c0d071ea <ux_menu_elements_button+0x102>
c0d0717e:	e026      	b.n	c0d071ce <ux_menu_elements_button+0xe6>
c0d07180:	20c8      	movs	r0, #200	; 0xc8
c0d07182:	5c30      	ldrb	r0, [r6, r0]
c0d07184:	5b71      	ldrh	r1, [r6, r5]
c0d07186:	4281      	cmp	r1, r0
c0d07188:	d22f      	bcs.n	c0d071ea <ux_menu_elements_button+0x102>
c0d0718a:	f7fe f9a1 	bl	c0d054d0 <io_seph_is_status_sent>
c0d0718e:	2800      	cmp	r0, #0
c0d07190:	d12b      	bne.n	c0d071ea <ux_menu_elements_button+0x102>
c0d07192:	f7fe f925 	bl	c0d053e0 <os_perso_isonboarded>
c0d07196:	28aa      	cmp	r0, #170	; 0xaa
c0d07198:	d103      	bne.n	c0d071a2 <ux_menu_elements_button+0xba>
c0d0719a:	f7fe f949 	bl	c0d05430 <os_global_pin_is_validated>
c0d0719e:	28aa      	cmp	r0, #170	; 0xaa
c0d071a0:	d123      	bne.n	c0d071ea <ux_menu_elements_button+0x102>
c0d071a2:	59f1      	ldr	r1, [r6, r7]
c0d071a4:	5b72      	ldrh	r2, [r6, r5]
c0d071a6:	0150      	lsls	r0, r2, #5
c0d071a8:	1808      	adds	r0, r1, r0
c0d071aa:	23d0      	movs	r3, #208	; 0xd0
c0d071ac:	58f3      	ldr	r3, [r6, r3]
c0d071ae:	2b00      	cmp	r3, #0
c0d071b0:	d004      	beq.n	c0d071bc <ux_menu_elements_button+0xd4>
c0d071b2:	4798      	blx	r3
c0d071b4:	2800      	cmp	r0, #0
c0d071b6:	d007      	beq.n	c0d071c8 <ux_menu_elements_button+0xe0>
c0d071b8:	5b72      	ldrh	r2, [r6, r5]
c0d071ba:	59f1      	ldr	r1, [r6, r7]
c0d071bc:	2801      	cmp	r0, #1
c0d071be:	d101      	bne.n	c0d071c4 <ux_menu_elements_button+0xdc>
c0d071c0:	0150      	lsls	r0, r2, #5
c0d071c2:	1808      	adds	r0, r1, r0
c0d071c4:	f7fb f96c 	bl	c0d024a0 <io_seproxyhal_display>
c0d071c8:	5b70      	ldrh	r0, [r6, r5]
c0d071ca:	1c40      	adds	r0, r0, #1
c0d071cc:	5370      	strh	r0, [r6, r5]
c0d071ce:	27c4      	movs	r7, #196	; 0xc4
c0d071d0:	59f0      	ldr	r0, [r6, r7]
c0d071d2:	2800      	cmp	r0, #0
c0d071d4:	d1d4      	bne.n	c0d07180 <ux_menu_elements_button+0x98>
c0d071d6:	e008      	b.n	c0d071ea <ux_menu_elements_button+0x102>
c0d071d8:	6870      	ldr	r0, [r6, #4]
c0d071da:	2800      	cmp	r0, #0
c0d071dc:	d005      	beq.n	c0d071ea <ux_menu_elements_button+0x102>
c0d071de:	f7fc fba5 	bl	c0d0392c <pic>
c0d071e2:	4601      	mov	r1, r0
c0d071e4:	68b0      	ldr	r0, [r6, #8]
c0d071e6:	4788      	blx	r1
c0d071e8:	2400      	movs	r4, #0
c0d071ea:	4620      	mov	r0, r4
c0d071ec:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0d071ee:	46c0      	nop			; (mov r8, r8)
c0d071f0:	20000bd8 	.word	0x20000bd8
c0d071f4:	80000001 	.word	0x80000001
c0d071f8:	80000002 	.word	0x80000002
c0d071fc:	40000002 	.word	0x40000002
c0d07200:	40000001 	.word	0x40000001
c0d07204:	80000003 	.word	0x80000003
c0d07208:	20000288 	.word	0x20000288
c0d0720c:	20000390 	.word	0x20000390

c0d07210 <ux_menu_display>:
c0d07210:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0d07212:	4d3f      	ldr	r5, [pc, #252]	; (c0d07310 <ux_menu_display+0x100>)
c0d07214:	2600      	movs	r6, #0
c0d07216:	606e      	str	r6, [r5, #4]
c0d07218:	2900      	cmp	r1, #0
c0d0721a:	d014      	beq.n	c0d07246 <ux_menu_display+0x36>
c0d0721c:	9000      	str	r0, [sp, #0]
c0d0721e:	9201      	str	r2, [sp, #4]
c0d07220:	2600      	movs	r6, #0
c0d07222:	4f3e      	ldr	r7, [pc, #248]	; (c0d0731c <ux_menu_display+0x10c>)
c0d07224:	447f      	add	r7, pc
c0d07226:	9102      	str	r1, [sp, #8]
c0d07228:	460c      	mov	r4, r1
c0d0722a:	221c      	movs	r2, #28
c0d0722c:	4620      	mov	r0, r4
c0d0722e:	4639      	mov	r1, r7
c0d07230:	f000 fa28 	bl	c0d07684 <memcmp>
c0d07234:	2800      	cmp	r0, #0
c0d07236:	d003      	beq.n	c0d07240 <ux_menu_display+0x30>
c0d07238:	1c76      	adds	r6, r6, #1
c0d0723a:	606e      	str	r6, [r5, #4]
c0d0723c:	341c      	adds	r4, #28
c0d0723e:	e7f4      	b.n	c0d0722a <ux_menu_display+0x1a>
c0d07240:	9902      	ldr	r1, [sp, #8]
c0d07242:	9a01      	ldr	r2, [sp, #4]
c0d07244:	9800      	ldr	r0, [sp, #0]
c0d07246:	1c43      	adds	r3, r0, #1
c0d07248:	d003      	beq.n	c0d07252 <ux_menu_display+0x42>
c0d0724a:	4286      	cmp	r6, r0
c0d0724c:	d200      	bcs.n	c0d07250 <ux_menu_display+0x40>
c0d0724e:	2000      	movs	r0, #0
c0d07250:	60a8      	str	r0, [r5, #8]
c0d07252:	20d4      	movs	r0, #212	; 0xd4
c0d07254:	4e2f      	ldr	r6, [pc, #188]	; (c0d07314 <ux_menu_display+0x104>)
c0d07256:	4b32      	ldr	r3, [pc, #200]	; (c0d07320 <ux_menu_display+0x110>)
c0d07258:	447b      	add	r3, pc
c0d0725a:	5033      	str	r3, [r6, r0]
c0d0725c:	23c8      	movs	r3, #200	; 0xc8
c0d0725e:	9301      	str	r3, [sp, #4]
c0d07260:	2009      	movs	r0, #9
c0d07262:	54f0      	strb	r0, [r6, r3]
c0d07264:	23c4      	movs	r3, #196	; 0xc4
c0d07266:	9300      	str	r3, [sp, #0]
c0d07268:	482e      	ldr	r0, [pc, #184]	; (c0d07324 <ux_menu_display+0x114>)
c0d0726a:	4478      	add	r0, pc
c0d0726c:	50f0      	str	r0, [r6, r3]
c0d0726e:	23d0      	movs	r3, #208	; 0xd0
c0d07270:	482d      	ldr	r0, [pc, #180]	; (c0d07328 <ux_menu_display+0x118>)
c0d07272:	4478      	add	r0, pc
c0d07274:	9302      	str	r3, [sp, #8]
c0d07276:	50f0      	str	r0, [r6, r3]
c0d07278:	2700      	movs	r7, #0
c0d0727a:	60ea      	str	r2, [r5, #12]
c0d0727c:	612f      	str	r7, [r5, #16]
c0d0727e:	6029      	str	r1, [r5, #0]
c0d07280:	4825      	ldr	r0, [pc, #148]	; (c0d07318 <ux_menu_display+0x108>)
c0d07282:	6047      	str	r7, [r0, #4]
c0d07284:	2103      	movs	r1, #3
c0d07286:	7001      	strb	r1, [r0, #0]
c0d07288:	4604      	mov	r4, r0
c0d0728a:	f7fe f8dd 	bl	c0d05448 <os_ux>
c0d0728e:	2504      	movs	r5, #4
c0d07290:	4628      	mov	r0, r5
c0d07292:	f7fe f949 	bl	c0d05528 <os_sched_last_status>
c0d07296:	6060      	str	r0, [r4, #4]
c0d07298:	f7fb fe0a 	bl	c0d02eb0 <io_seproxyhal_init_ux>
c0d0729c:	f7fb fe0a 	bl	c0d02eb4 <io_seproxyhal_init_button>
c0d072a0:	24c2      	movs	r4, #194	; 0xc2
c0d072a2:	5337      	strh	r7, [r6, r4]
c0d072a4:	9f00      	ldr	r7, [sp, #0]
c0d072a6:	4628      	mov	r0, r5
c0d072a8:	9d01      	ldr	r5, [sp, #4]
c0d072aa:	f7fe f93d 	bl	c0d05528 <os_sched_last_status>
c0d072ae:	491a      	ldr	r1, [pc, #104]	; (c0d07318 <ux_menu_display+0x108>)
c0d072b0:	6048      	str	r0, [r1, #4]
c0d072b2:	2800      	cmp	r0, #0
c0d072b4:	d02b      	beq.n	c0d0730e <ux_menu_display+0xfe>
c0d072b6:	2897      	cmp	r0, #151	; 0x97
c0d072b8:	d029      	beq.n	c0d0730e <ux_menu_display+0xfe>
c0d072ba:	e025      	b.n	c0d07308 <ux_menu_display+0xf8>
c0d072bc:	5d70      	ldrb	r0, [r6, r5]
c0d072be:	5b31      	ldrh	r1, [r6, r4]
c0d072c0:	4281      	cmp	r1, r0
c0d072c2:	d224      	bcs.n	c0d0730e <ux_menu_display+0xfe>
c0d072c4:	f7fe f904 	bl	c0d054d0 <io_seph_is_status_sent>
c0d072c8:	2800      	cmp	r0, #0
c0d072ca:	d120      	bne.n	c0d0730e <ux_menu_display+0xfe>
c0d072cc:	f7fe f888 	bl	c0d053e0 <os_perso_isonboarded>
c0d072d0:	28aa      	cmp	r0, #170	; 0xaa
c0d072d2:	d103      	bne.n	c0d072dc <ux_menu_display+0xcc>
c0d072d4:	f7fe f8ac 	bl	c0d05430 <os_global_pin_is_validated>
c0d072d8:	28aa      	cmp	r0, #170	; 0xaa
c0d072da:	d118      	bne.n	c0d0730e <ux_menu_display+0xfe>
c0d072dc:	59f1      	ldr	r1, [r6, r7]
c0d072de:	5b32      	ldrh	r2, [r6, r4]
c0d072e0:	0150      	lsls	r0, r2, #5
c0d072e2:	1808      	adds	r0, r1, r0
c0d072e4:	9b02      	ldr	r3, [sp, #8]
c0d072e6:	58f3      	ldr	r3, [r6, r3]
c0d072e8:	2b00      	cmp	r3, #0
c0d072ea:	d004      	beq.n	c0d072f6 <ux_menu_display+0xe6>
c0d072ec:	4798      	blx	r3
c0d072ee:	2800      	cmp	r0, #0
c0d072f0:	d007      	beq.n	c0d07302 <ux_menu_display+0xf2>
c0d072f2:	5b32      	ldrh	r2, [r6, r4]
c0d072f4:	59f1      	ldr	r1, [r6, r7]
c0d072f6:	2801      	cmp	r0, #1
c0d072f8:	d101      	bne.n	c0d072fe <ux_menu_display+0xee>
c0d072fa:	0150      	lsls	r0, r2, #5
c0d072fc:	1808      	adds	r0, r1, r0
c0d072fe:	f7fb f8cf 	bl	c0d024a0 <io_seproxyhal_display>
c0d07302:	5b30      	ldrh	r0, [r6, r4]
c0d07304:	1c40      	adds	r0, r0, #1
c0d07306:	5330      	strh	r0, [r6, r4]
c0d07308:	59f0      	ldr	r0, [r6, r7]
c0d0730a:	2800      	cmp	r0, #0
c0d0730c:	d1d6      	bne.n	c0d072bc <ux_menu_display+0xac>
c0d0730e:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0d07310:	20000bd8 	.word	0x20000bd8
c0d07314:	20000288 	.word	0x20000288
c0d07318:	20000390 	.word	0x20000390
c0d0731c:	00002a2c 	.word	0x00002a2c
c0d07320:	fffffe8d 	.word	0xfffffe8d
c0d07324:	000028c6 	.word	0x000028c6
c0d07328:	fffffca7 	.word	0xfffffca7

c0d0732c <__udivsi3>:
c0d0732c:	2900      	cmp	r1, #0
c0d0732e:	d034      	beq.n	c0d0739a <.udivsi3_skip_div0_test+0x6a>

c0d07330 <.udivsi3_skip_div0_test>:
c0d07330:	2301      	movs	r3, #1
c0d07332:	2200      	movs	r2, #0
c0d07334:	b410      	push	{r4}
c0d07336:	4288      	cmp	r0, r1
c0d07338:	d32c      	bcc.n	c0d07394 <.udivsi3_skip_div0_test+0x64>
c0d0733a:	2401      	movs	r4, #1
c0d0733c:	0724      	lsls	r4, r4, #28
c0d0733e:	42a1      	cmp	r1, r4
c0d07340:	d204      	bcs.n	c0d0734c <.udivsi3_skip_div0_test+0x1c>
c0d07342:	4281      	cmp	r1, r0
c0d07344:	d202      	bcs.n	c0d0734c <.udivsi3_skip_div0_test+0x1c>
c0d07346:	0109      	lsls	r1, r1, #4
c0d07348:	011b      	lsls	r3, r3, #4
c0d0734a:	e7f8      	b.n	c0d0733e <.udivsi3_skip_div0_test+0xe>
c0d0734c:	00e4      	lsls	r4, r4, #3
c0d0734e:	42a1      	cmp	r1, r4
c0d07350:	d204      	bcs.n	c0d0735c <.udivsi3_skip_div0_test+0x2c>
c0d07352:	4281      	cmp	r1, r0
c0d07354:	d202      	bcs.n	c0d0735c <.udivsi3_skip_div0_test+0x2c>
c0d07356:	0049      	lsls	r1, r1, #1
c0d07358:	005b      	lsls	r3, r3, #1
c0d0735a:	e7f8      	b.n	c0d0734e <.udivsi3_skip_div0_test+0x1e>
c0d0735c:	4288      	cmp	r0, r1
c0d0735e:	d301      	bcc.n	c0d07364 <.udivsi3_skip_div0_test+0x34>
c0d07360:	1a40      	subs	r0, r0, r1
c0d07362:	431a      	orrs	r2, r3
c0d07364:	084c      	lsrs	r4, r1, #1
c0d07366:	42a0      	cmp	r0, r4
c0d07368:	d302      	bcc.n	c0d07370 <.udivsi3_skip_div0_test+0x40>
c0d0736a:	1b00      	subs	r0, r0, r4
c0d0736c:	085c      	lsrs	r4, r3, #1
c0d0736e:	4322      	orrs	r2, r4
c0d07370:	088c      	lsrs	r4, r1, #2
c0d07372:	42a0      	cmp	r0, r4
c0d07374:	d302      	bcc.n	c0d0737c <.udivsi3_skip_div0_test+0x4c>
c0d07376:	1b00      	subs	r0, r0, r4
c0d07378:	089c      	lsrs	r4, r3, #2
c0d0737a:	4322      	orrs	r2, r4
c0d0737c:	08cc      	lsrs	r4, r1, #3
c0d0737e:	42a0      	cmp	r0, r4
c0d07380:	d302      	bcc.n	c0d07388 <.udivsi3_skip_div0_test+0x58>
c0d07382:	1b00      	subs	r0, r0, r4
c0d07384:	08dc      	lsrs	r4, r3, #3
c0d07386:	4322      	orrs	r2, r4
c0d07388:	2800      	cmp	r0, #0
c0d0738a:	d003      	beq.n	c0d07394 <.udivsi3_skip_div0_test+0x64>
c0d0738c:	091b      	lsrs	r3, r3, #4
c0d0738e:	d001      	beq.n	c0d07394 <.udivsi3_skip_div0_test+0x64>
c0d07390:	0909      	lsrs	r1, r1, #4
c0d07392:	e7e3      	b.n	c0d0735c <.udivsi3_skip_div0_test+0x2c>
c0d07394:	0010      	movs	r0, r2
c0d07396:	bc10      	pop	{r4}
c0d07398:	4770      	bx	lr
c0d0739a:	b501      	push	{r0, lr}
c0d0739c:	2000      	movs	r0, #0
c0d0739e:	f000 f85f 	bl	c0d07460 <__aeabi_idiv0>
c0d073a2:	bd02      	pop	{r1, pc}

c0d073a4 <__aeabi_uidivmod>:
c0d073a4:	2900      	cmp	r1, #0
c0d073a6:	d0f8      	beq.n	c0d0739a <.udivsi3_skip_div0_test+0x6a>
c0d073a8:	b503      	push	{r0, r1, lr}
c0d073aa:	f7ff ffc1 	bl	c0d07330 <.udivsi3_skip_div0_test>
c0d073ae:	bc0e      	pop	{r1, r2, r3}
c0d073b0:	4342      	muls	r2, r0
c0d073b2:	1a89      	subs	r1, r1, r2
c0d073b4:	4718      	bx	r3
c0d073b6:	46c0      	nop			; (mov r8, r8)

c0d073b8 <__divsi3>:
c0d073b8:	2900      	cmp	r1, #0
c0d073ba:	d041      	beq.n	c0d07440 <.divsi3_skip_div0_test+0x84>

c0d073bc <.divsi3_skip_div0_test>:
c0d073bc:	b410      	push	{r4}
c0d073be:	0004      	movs	r4, r0
c0d073c0:	404c      	eors	r4, r1
c0d073c2:	46a4      	mov	ip, r4
c0d073c4:	2301      	movs	r3, #1
c0d073c6:	2200      	movs	r2, #0
c0d073c8:	2900      	cmp	r1, #0
c0d073ca:	d500      	bpl.n	c0d073ce <.divsi3_skip_div0_test+0x12>
c0d073cc:	4249      	negs	r1, r1
c0d073ce:	2800      	cmp	r0, #0
c0d073d0:	d500      	bpl.n	c0d073d4 <.divsi3_skip_div0_test+0x18>
c0d073d2:	4240      	negs	r0, r0
c0d073d4:	4288      	cmp	r0, r1
c0d073d6:	d32c      	bcc.n	c0d07432 <.divsi3_skip_div0_test+0x76>
c0d073d8:	2401      	movs	r4, #1
c0d073da:	0724      	lsls	r4, r4, #28
c0d073dc:	42a1      	cmp	r1, r4
c0d073de:	d204      	bcs.n	c0d073ea <.divsi3_skip_div0_test+0x2e>
c0d073e0:	4281      	cmp	r1, r0
c0d073e2:	d202      	bcs.n	c0d073ea <.divsi3_skip_div0_test+0x2e>
c0d073e4:	0109      	lsls	r1, r1, #4
c0d073e6:	011b      	lsls	r3, r3, #4
c0d073e8:	e7f8      	b.n	c0d073dc <.divsi3_skip_div0_test+0x20>
c0d073ea:	00e4      	lsls	r4, r4, #3
c0d073ec:	42a1      	cmp	r1, r4
c0d073ee:	d204      	bcs.n	c0d073fa <.divsi3_skip_div0_test+0x3e>
c0d073f0:	4281      	cmp	r1, r0
c0d073f2:	d202      	bcs.n	c0d073fa <.divsi3_skip_div0_test+0x3e>
c0d073f4:	0049      	lsls	r1, r1, #1
c0d073f6:	005b      	lsls	r3, r3, #1
c0d073f8:	e7f8      	b.n	c0d073ec <.divsi3_skip_div0_test+0x30>
c0d073fa:	4288      	cmp	r0, r1
c0d073fc:	d301      	bcc.n	c0d07402 <.divsi3_skip_div0_test+0x46>
c0d073fe:	1a40      	subs	r0, r0, r1
c0d07400:	431a      	orrs	r2, r3
c0d07402:	084c      	lsrs	r4, r1, #1
c0d07404:	42a0      	cmp	r0, r4
c0d07406:	d302      	bcc.n	c0d0740e <.divsi3_skip_div0_test+0x52>
c0d07408:	1b00      	subs	r0, r0, r4
c0d0740a:	085c      	lsrs	r4, r3, #1
c0d0740c:	4322      	orrs	r2, r4
c0d0740e:	088c      	lsrs	r4, r1, #2
c0d07410:	42a0      	cmp	r0, r4
c0d07412:	d302      	bcc.n	c0d0741a <.divsi3_skip_div0_test+0x5e>
c0d07414:	1b00      	subs	r0, r0, r4
c0d07416:	089c      	lsrs	r4, r3, #2
c0d07418:	4322      	orrs	r2, r4
c0d0741a:	08cc      	lsrs	r4, r1, #3
c0d0741c:	42a0      	cmp	r0, r4
c0d0741e:	d302      	bcc.n	c0d07426 <.divsi3_skip_div0_test+0x6a>
c0d07420:	1b00      	subs	r0, r0, r4
c0d07422:	08dc      	lsrs	r4, r3, #3
c0d07424:	4322      	orrs	r2, r4
c0d07426:	2800      	cmp	r0, #0
c0d07428:	d003      	beq.n	c0d07432 <.divsi3_skip_div0_test+0x76>
c0d0742a:	091b      	lsrs	r3, r3, #4
c0d0742c:	d001      	beq.n	c0d07432 <.divsi3_skip_div0_test+0x76>
c0d0742e:	0909      	lsrs	r1, r1, #4
c0d07430:	e7e3      	b.n	c0d073fa <.divsi3_skip_div0_test+0x3e>
c0d07432:	0010      	movs	r0, r2
c0d07434:	4664      	mov	r4, ip
c0d07436:	2c00      	cmp	r4, #0
c0d07438:	d500      	bpl.n	c0d0743c <.divsi3_skip_div0_test+0x80>
c0d0743a:	4240      	negs	r0, r0
c0d0743c:	bc10      	pop	{r4}
c0d0743e:	4770      	bx	lr
c0d07440:	b501      	push	{r0, lr}
c0d07442:	2000      	movs	r0, #0
c0d07444:	f000 f80c 	bl	c0d07460 <__aeabi_idiv0>
c0d07448:	bd02      	pop	{r1, pc}
c0d0744a:	46c0      	nop			; (mov r8, r8)

c0d0744c <__aeabi_idivmod>:
c0d0744c:	2900      	cmp	r1, #0
c0d0744e:	d0f7      	beq.n	c0d07440 <.divsi3_skip_div0_test+0x84>
c0d07450:	b503      	push	{r0, r1, lr}
c0d07452:	f7ff ffb3 	bl	c0d073bc <.divsi3_skip_div0_test>
c0d07456:	bc0e      	pop	{r1, r2, r3}
c0d07458:	4342      	muls	r2, r0
c0d0745a:	1a89      	subs	r1, r1, r2
c0d0745c:	4718      	bx	r3
c0d0745e:	46c0      	nop			; (mov r8, r8)

c0d07460 <__aeabi_idiv0>:
c0d07460:	4770      	bx	lr
c0d07462:	46c0      	nop			; (mov r8, r8)

c0d07464 <__aeabi_llsl>:
c0d07464:	4091      	lsls	r1, r2
c0d07466:	0003      	movs	r3, r0
c0d07468:	4090      	lsls	r0, r2
c0d0746a:	469c      	mov	ip, r3
c0d0746c:	3a20      	subs	r2, #32
c0d0746e:	4093      	lsls	r3, r2
c0d07470:	4319      	orrs	r1, r3
c0d07472:	4252      	negs	r2, r2
c0d07474:	4663      	mov	r3, ip
c0d07476:	40d3      	lsrs	r3, r2
c0d07478:	4319      	orrs	r1, r3
c0d0747a:	4770      	bx	lr

c0d0747c <__aeabi_uldivmod>:
c0d0747c:	2b00      	cmp	r3, #0
c0d0747e:	d111      	bne.n	c0d074a4 <__aeabi_uldivmod+0x28>
c0d07480:	2a00      	cmp	r2, #0
c0d07482:	d10f      	bne.n	c0d074a4 <__aeabi_uldivmod+0x28>
c0d07484:	2900      	cmp	r1, #0
c0d07486:	d100      	bne.n	c0d0748a <__aeabi_uldivmod+0xe>
c0d07488:	2800      	cmp	r0, #0
c0d0748a:	d002      	beq.n	c0d07492 <__aeabi_uldivmod+0x16>
c0d0748c:	2100      	movs	r1, #0
c0d0748e:	43c9      	mvns	r1, r1
c0d07490:	0008      	movs	r0, r1
c0d07492:	b407      	push	{r0, r1, r2}
c0d07494:	4802      	ldr	r0, [pc, #8]	; (c0d074a0 <__aeabi_uldivmod+0x24>)
c0d07496:	a102      	add	r1, pc, #8	; (adr r1, c0d074a0 <__aeabi_uldivmod+0x24>)
c0d07498:	1840      	adds	r0, r0, r1
c0d0749a:	9002      	str	r0, [sp, #8]
c0d0749c:	bd03      	pop	{r0, r1, pc}
c0d0749e:	46c0      	nop			; (mov r8, r8)
c0d074a0:	ffffffc1 	.word	0xffffffc1
c0d074a4:	b403      	push	{r0, r1}
c0d074a6:	4668      	mov	r0, sp
c0d074a8:	b501      	push	{r0, lr}
c0d074aa:	9802      	ldr	r0, [sp, #8]
c0d074ac:	f000 f82a 	bl	c0d07504 <__udivmoddi4>
c0d074b0:	9b01      	ldr	r3, [sp, #4]
c0d074b2:	469e      	mov	lr, r3
c0d074b4:	b002      	add	sp, #8
c0d074b6:	bc0c      	pop	{r2, r3}
c0d074b8:	4770      	bx	lr
c0d074ba:	46c0      	nop			; (mov r8, r8)

c0d074bc <__aeabi_lmul>:
c0d074bc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
c0d074be:	9301      	str	r3, [sp, #4]
c0d074c0:	b283      	uxth	r3, r0
c0d074c2:	469c      	mov	ip, r3
c0d074c4:	0006      	movs	r6, r0
c0d074c6:	0c03      	lsrs	r3, r0, #16
c0d074c8:	4660      	mov	r0, ip
c0d074ca:	000d      	movs	r5, r1
c0d074cc:	4661      	mov	r1, ip
c0d074ce:	b297      	uxth	r7, r2
c0d074d0:	4378      	muls	r0, r7
c0d074d2:	0c14      	lsrs	r4, r2, #16
c0d074d4:	435f      	muls	r7, r3
c0d074d6:	4363      	muls	r3, r4
c0d074d8:	434c      	muls	r4, r1
c0d074da:	0c01      	lsrs	r1, r0, #16
c0d074dc:	468c      	mov	ip, r1
c0d074de:	19e4      	adds	r4, r4, r7
c0d074e0:	4464      	add	r4, ip
c0d074e2:	42a7      	cmp	r7, r4
c0d074e4:	d902      	bls.n	c0d074ec <__aeabi_lmul+0x30>
c0d074e6:	2180      	movs	r1, #128	; 0x80
c0d074e8:	0249      	lsls	r1, r1, #9
c0d074ea:	185b      	adds	r3, r3, r1
c0d074ec:	9901      	ldr	r1, [sp, #4]
c0d074ee:	436a      	muls	r2, r5
c0d074f0:	4371      	muls	r1, r6
c0d074f2:	0c27      	lsrs	r7, r4, #16
c0d074f4:	18fb      	adds	r3, r7, r3
c0d074f6:	0424      	lsls	r4, r4, #16
c0d074f8:	18c9      	adds	r1, r1, r3
c0d074fa:	b280      	uxth	r0, r0
c0d074fc:	1820      	adds	r0, r4, r0
c0d074fe:	1889      	adds	r1, r1, r2
c0d07500:	b003      	add	sp, #12
c0d07502:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0d07504 <__udivmoddi4>:
c0d07504:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d07506:	0006      	movs	r6, r0
c0d07508:	000f      	movs	r7, r1
c0d0750a:	0015      	movs	r5, r2
c0d0750c:	001c      	movs	r4, r3
c0d0750e:	b085      	sub	sp, #20
c0d07510:	428b      	cmp	r3, r1
c0d07512:	d863      	bhi.n	c0d075dc <__udivmoddi4+0xd8>
c0d07514:	d101      	bne.n	c0d0751a <__udivmoddi4+0x16>
c0d07516:	4282      	cmp	r2, r0
c0d07518:	d860      	bhi.n	c0d075dc <__udivmoddi4+0xd8>
c0d0751a:	0021      	movs	r1, r4
c0d0751c:	0028      	movs	r0, r5
c0d0751e:	f000 f86d 	bl	c0d075fc <__clzdi2>
c0d07522:	0039      	movs	r1, r7
c0d07524:	9000      	str	r0, [sp, #0]
c0d07526:	0030      	movs	r0, r6
c0d07528:	f000 f868 	bl	c0d075fc <__clzdi2>
c0d0752c:	9b00      	ldr	r3, [sp, #0]
c0d0752e:	0021      	movs	r1, r4
c0d07530:	1a1b      	subs	r3, r3, r0
c0d07532:	001a      	movs	r2, r3
c0d07534:	0028      	movs	r0, r5
c0d07536:	9303      	str	r3, [sp, #12]
c0d07538:	f7ff ff94 	bl	c0d07464 <__aeabi_llsl>
c0d0753c:	9000      	str	r0, [sp, #0]
c0d0753e:	9101      	str	r1, [sp, #4]
c0d07540:	42b9      	cmp	r1, r7
c0d07542:	d845      	bhi.n	c0d075d0 <__udivmoddi4+0xcc>
c0d07544:	d101      	bne.n	c0d0754a <__udivmoddi4+0x46>
c0d07546:	42b0      	cmp	r0, r6
c0d07548:	d842      	bhi.n	c0d075d0 <__udivmoddi4+0xcc>
c0d0754a:	9b00      	ldr	r3, [sp, #0]
c0d0754c:	9c01      	ldr	r4, [sp, #4]
c0d0754e:	2001      	movs	r0, #1
c0d07550:	2100      	movs	r1, #0
c0d07552:	9a03      	ldr	r2, [sp, #12]
c0d07554:	1af6      	subs	r6, r6, r3
c0d07556:	41a7      	sbcs	r7, r4
c0d07558:	f7ff ff84 	bl	c0d07464 <__aeabi_llsl>
c0d0755c:	0004      	movs	r4, r0
c0d0755e:	000d      	movs	r5, r1
c0d07560:	9b03      	ldr	r3, [sp, #12]
c0d07562:	2b00      	cmp	r3, #0
c0d07564:	d02b      	beq.n	c0d075be <__udivmoddi4+0xba>
c0d07566:	9b01      	ldr	r3, [sp, #4]
c0d07568:	9a00      	ldr	r2, [sp, #0]
c0d0756a:	07db      	lsls	r3, r3, #31
c0d0756c:	0850      	lsrs	r0, r2, #1
c0d0756e:	4318      	orrs	r0, r3
c0d07570:	9b01      	ldr	r3, [sp, #4]
c0d07572:	0859      	lsrs	r1, r3, #1
c0d07574:	9b03      	ldr	r3, [sp, #12]
c0d07576:	469c      	mov	ip, r3
c0d07578:	42b9      	cmp	r1, r7
c0d0757a:	d82c      	bhi.n	c0d075d6 <__udivmoddi4+0xd2>
c0d0757c:	d101      	bne.n	c0d07582 <__udivmoddi4+0x7e>
c0d0757e:	42b0      	cmp	r0, r6
c0d07580:	d829      	bhi.n	c0d075d6 <__udivmoddi4+0xd2>
c0d07582:	0032      	movs	r2, r6
c0d07584:	003b      	movs	r3, r7
c0d07586:	1a12      	subs	r2, r2, r0
c0d07588:	418b      	sbcs	r3, r1
c0d0758a:	2601      	movs	r6, #1
c0d0758c:	1892      	adds	r2, r2, r2
c0d0758e:	415b      	adcs	r3, r3
c0d07590:	2700      	movs	r7, #0
c0d07592:	18b6      	adds	r6, r6, r2
c0d07594:	415f      	adcs	r7, r3
c0d07596:	2301      	movs	r3, #1
c0d07598:	425b      	negs	r3, r3
c0d0759a:	449c      	add	ip, r3
c0d0759c:	4663      	mov	r3, ip
c0d0759e:	2b00      	cmp	r3, #0
c0d075a0:	d1ea      	bne.n	c0d07578 <__udivmoddi4+0x74>
c0d075a2:	0030      	movs	r0, r6
c0d075a4:	0039      	movs	r1, r7
c0d075a6:	9a03      	ldr	r2, [sp, #12]
c0d075a8:	f000 f81c 	bl	c0d075e4 <__aeabi_llsr>
c0d075ac:	9a03      	ldr	r2, [sp, #12]
c0d075ae:	19a4      	adds	r4, r4, r6
c0d075b0:	417d      	adcs	r5, r7
c0d075b2:	0006      	movs	r6, r0
c0d075b4:	000f      	movs	r7, r1
c0d075b6:	f7ff ff55 	bl	c0d07464 <__aeabi_llsl>
c0d075ba:	1a24      	subs	r4, r4, r0
c0d075bc:	418d      	sbcs	r5, r1
c0d075be:	9b0a      	ldr	r3, [sp, #40]	; 0x28
c0d075c0:	2b00      	cmp	r3, #0
c0d075c2:	d001      	beq.n	c0d075c8 <__udivmoddi4+0xc4>
c0d075c4:	601e      	str	r6, [r3, #0]
c0d075c6:	605f      	str	r7, [r3, #4]
c0d075c8:	0020      	movs	r0, r4
c0d075ca:	0029      	movs	r1, r5
c0d075cc:	b005      	add	sp, #20
c0d075ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d075d0:	2400      	movs	r4, #0
c0d075d2:	2500      	movs	r5, #0
c0d075d4:	e7c4      	b.n	c0d07560 <__udivmoddi4+0x5c>
c0d075d6:	19b6      	adds	r6, r6, r6
c0d075d8:	417f      	adcs	r7, r7
c0d075da:	e7dc      	b.n	c0d07596 <__udivmoddi4+0x92>
c0d075dc:	2400      	movs	r4, #0
c0d075de:	2500      	movs	r5, #0
c0d075e0:	e7ed      	b.n	c0d075be <__udivmoddi4+0xba>
	...

c0d075e4 <__aeabi_llsr>:
c0d075e4:	40d0      	lsrs	r0, r2
c0d075e6:	000b      	movs	r3, r1
c0d075e8:	40d1      	lsrs	r1, r2
c0d075ea:	469c      	mov	ip, r3
c0d075ec:	3a20      	subs	r2, #32
c0d075ee:	40d3      	lsrs	r3, r2
c0d075f0:	4318      	orrs	r0, r3
c0d075f2:	4252      	negs	r2, r2
c0d075f4:	4663      	mov	r3, ip
c0d075f6:	4093      	lsls	r3, r2
c0d075f8:	4318      	orrs	r0, r3
c0d075fa:	4770      	bx	lr

c0d075fc <__clzdi2>:
c0d075fc:	b510      	push	{r4, lr}
c0d075fe:	2900      	cmp	r1, #0
c0d07600:	d103      	bne.n	c0d0760a <__clzdi2+0xe>
c0d07602:	f000 f807 	bl	c0d07614 <__clzsi2>
c0d07606:	3020      	adds	r0, #32
c0d07608:	e002      	b.n	c0d07610 <__clzdi2+0x14>
c0d0760a:	0008      	movs	r0, r1
c0d0760c:	f000 f802 	bl	c0d07614 <__clzsi2>
c0d07610:	bd10      	pop	{r4, pc}
c0d07612:	46c0      	nop			; (mov r8, r8)

c0d07614 <__clzsi2>:
c0d07614:	211c      	movs	r1, #28
c0d07616:	2301      	movs	r3, #1
c0d07618:	041b      	lsls	r3, r3, #16
c0d0761a:	4298      	cmp	r0, r3
c0d0761c:	d301      	bcc.n	c0d07622 <__clzsi2+0xe>
c0d0761e:	0c00      	lsrs	r0, r0, #16
c0d07620:	3910      	subs	r1, #16
c0d07622:	0a1b      	lsrs	r3, r3, #8
c0d07624:	4298      	cmp	r0, r3
c0d07626:	d301      	bcc.n	c0d0762c <__clzsi2+0x18>
c0d07628:	0a00      	lsrs	r0, r0, #8
c0d0762a:	3908      	subs	r1, #8
c0d0762c:	091b      	lsrs	r3, r3, #4
c0d0762e:	4298      	cmp	r0, r3
c0d07630:	d301      	bcc.n	c0d07636 <__clzsi2+0x22>
c0d07632:	0900      	lsrs	r0, r0, #4
c0d07634:	3904      	subs	r1, #4
c0d07636:	a202      	add	r2, pc, #8	; (adr r2, c0d07640 <__clzsi2+0x2c>)
c0d07638:	5c10      	ldrb	r0, [r2, r0]
c0d0763a:	1840      	adds	r0, r0, r1
c0d0763c:	4770      	bx	lr
c0d0763e:	46c0      	nop			; (mov r8, r8)
c0d07640:	02020304 	.word	0x02020304
c0d07644:	01010101 	.word	0x01010101
	...

c0d07650 <__aeabi_memclr>:
c0d07650:	b510      	push	{r4, lr}
c0d07652:	2200      	movs	r2, #0
c0d07654:	f000 f80a 	bl	c0d0766c <__aeabi_memset>
c0d07658:	bd10      	pop	{r4, pc}
c0d0765a:	46c0      	nop			; (mov r8, r8)

c0d0765c <__aeabi_memcpy>:
c0d0765c:	b510      	push	{r4, lr}
c0d0765e:	f000 f835 	bl	c0d076cc <memcpy>
c0d07662:	bd10      	pop	{r4, pc}

c0d07664 <__aeabi_memmove>:
c0d07664:	b510      	push	{r4, lr}
c0d07666:	f000 f883 	bl	c0d07770 <memmove>
c0d0766a:	bd10      	pop	{r4, pc}

c0d0766c <__aeabi_memset>:
c0d0766c:	000b      	movs	r3, r1
c0d0766e:	b510      	push	{r4, lr}
c0d07670:	0011      	movs	r1, r2
c0d07672:	001a      	movs	r2, r3
c0d07674:	f000 f8d2 	bl	c0d0781c <memset>
c0d07678:	bd10      	pop	{r4, pc}
c0d0767a:	46c0      	nop			; (mov r8, r8)

c0d0767c <explicit_bzero>:
c0d0767c:	b510      	push	{r4, lr}
c0d0767e:	f000 f97b 	bl	c0d07978 <bzero>
c0d07682:	bd10      	pop	{r4, pc}

c0d07684 <memcmp>:
c0d07684:	b530      	push	{r4, r5, lr}
c0d07686:	2a03      	cmp	r2, #3
c0d07688:	d90c      	bls.n	c0d076a4 <memcmp+0x20>
c0d0768a:	0003      	movs	r3, r0
c0d0768c:	430b      	orrs	r3, r1
c0d0768e:	079b      	lsls	r3, r3, #30
c0d07690:	d119      	bne.n	c0d076c6 <memcmp+0x42>
c0d07692:	6803      	ldr	r3, [r0, #0]
c0d07694:	680c      	ldr	r4, [r1, #0]
c0d07696:	42a3      	cmp	r3, r4
c0d07698:	d115      	bne.n	c0d076c6 <memcmp+0x42>
c0d0769a:	3a04      	subs	r2, #4
c0d0769c:	3004      	adds	r0, #4
c0d0769e:	3104      	adds	r1, #4
c0d076a0:	2a03      	cmp	r2, #3
c0d076a2:	d8f6      	bhi.n	c0d07692 <memcmp+0xe>
c0d076a4:	1e55      	subs	r5, r2, #1
c0d076a6:	2a00      	cmp	r2, #0
c0d076a8:	d00b      	beq.n	c0d076c2 <memcmp+0x3e>
c0d076aa:	2300      	movs	r3, #0
c0d076ac:	e003      	b.n	c0d076b6 <memcmp+0x32>
c0d076ae:	1c5a      	adds	r2, r3, #1
c0d076b0:	429d      	cmp	r5, r3
c0d076b2:	d006      	beq.n	c0d076c2 <memcmp+0x3e>
c0d076b4:	0013      	movs	r3, r2
c0d076b6:	5cc2      	ldrb	r2, [r0, r3]
c0d076b8:	5ccc      	ldrb	r4, [r1, r3]
c0d076ba:	42a2      	cmp	r2, r4
c0d076bc:	d0f7      	beq.n	c0d076ae <memcmp+0x2a>
c0d076be:	1b10      	subs	r0, r2, r4
c0d076c0:	e000      	b.n	c0d076c4 <memcmp+0x40>
c0d076c2:	2000      	movs	r0, #0
c0d076c4:	bd30      	pop	{r4, r5, pc}
c0d076c6:	1e55      	subs	r5, r2, #1
c0d076c8:	e7ef      	b.n	c0d076aa <memcmp+0x26>
c0d076ca:	46c0      	nop			; (mov r8, r8)

c0d076cc <memcpy>:
c0d076cc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d076ce:	46c6      	mov	lr, r8
c0d076d0:	b500      	push	{lr}
c0d076d2:	2a0f      	cmp	r2, #15
c0d076d4:	d941      	bls.n	c0d0775a <memcpy+0x8e>
c0d076d6:	2703      	movs	r7, #3
c0d076d8:	000d      	movs	r5, r1
c0d076da:	003e      	movs	r6, r7
c0d076dc:	4305      	orrs	r5, r0
c0d076de:	000c      	movs	r4, r1
c0d076e0:	0003      	movs	r3, r0
c0d076e2:	402e      	ands	r6, r5
c0d076e4:	422f      	tst	r7, r5
c0d076e6:	d13d      	bne.n	c0d07764 <memcpy+0x98>
c0d076e8:	0015      	movs	r5, r2
c0d076ea:	3d10      	subs	r5, #16
c0d076ec:	092d      	lsrs	r5, r5, #4
c0d076ee:	46a8      	mov	r8, r5
c0d076f0:	012d      	lsls	r5, r5, #4
c0d076f2:	46ac      	mov	ip, r5
c0d076f4:	4484      	add	ip, r0
c0d076f6:	6827      	ldr	r7, [r4, #0]
c0d076f8:	001d      	movs	r5, r3
c0d076fa:	601f      	str	r7, [r3, #0]
c0d076fc:	6867      	ldr	r7, [r4, #4]
c0d076fe:	605f      	str	r7, [r3, #4]
c0d07700:	68a7      	ldr	r7, [r4, #8]
c0d07702:	609f      	str	r7, [r3, #8]
c0d07704:	68e7      	ldr	r7, [r4, #12]
c0d07706:	3410      	adds	r4, #16
c0d07708:	60df      	str	r7, [r3, #12]
c0d0770a:	3310      	adds	r3, #16
c0d0770c:	4565      	cmp	r5, ip
c0d0770e:	d1f2      	bne.n	c0d076f6 <memcpy+0x2a>
c0d07710:	4645      	mov	r5, r8
c0d07712:	230f      	movs	r3, #15
c0d07714:	240c      	movs	r4, #12
c0d07716:	3501      	adds	r5, #1
c0d07718:	012d      	lsls	r5, r5, #4
c0d0771a:	1949      	adds	r1, r1, r5
c0d0771c:	4013      	ands	r3, r2
c0d0771e:	1945      	adds	r5, r0, r5
c0d07720:	4214      	tst	r4, r2
c0d07722:	d022      	beq.n	c0d0776a <memcpy+0x9e>
c0d07724:	598c      	ldr	r4, [r1, r6]
c0d07726:	51ac      	str	r4, [r5, r6]
c0d07728:	3604      	adds	r6, #4
c0d0772a:	1b9c      	subs	r4, r3, r6
c0d0772c:	2c03      	cmp	r4, #3
c0d0772e:	d8f9      	bhi.n	c0d07724 <memcpy+0x58>
c0d07730:	3b04      	subs	r3, #4
c0d07732:	089b      	lsrs	r3, r3, #2
c0d07734:	3301      	adds	r3, #1
c0d07736:	009b      	lsls	r3, r3, #2
c0d07738:	18ed      	adds	r5, r5, r3
c0d0773a:	18c9      	adds	r1, r1, r3
c0d0773c:	2303      	movs	r3, #3
c0d0773e:	401a      	ands	r2, r3
c0d07740:	1e56      	subs	r6, r2, #1
c0d07742:	2a00      	cmp	r2, #0
c0d07744:	d006      	beq.n	c0d07754 <memcpy+0x88>
c0d07746:	2300      	movs	r3, #0
c0d07748:	5ccc      	ldrb	r4, [r1, r3]
c0d0774a:	001a      	movs	r2, r3
c0d0774c:	54ec      	strb	r4, [r5, r3]
c0d0774e:	3301      	adds	r3, #1
c0d07750:	4296      	cmp	r6, r2
c0d07752:	d1f9      	bne.n	c0d07748 <memcpy+0x7c>
c0d07754:	bc80      	pop	{r7}
c0d07756:	46b8      	mov	r8, r7
c0d07758:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0775a:	0005      	movs	r5, r0
c0d0775c:	1e56      	subs	r6, r2, #1
c0d0775e:	2a00      	cmp	r2, #0
c0d07760:	d1f1      	bne.n	c0d07746 <memcpy+0x7a>
c0d07762:	e7f7      	b.n	c0d07754 <memcpy+0x88>
c0d07764:	0005      	movs	r5, r0
c0d07766:	1e56      	subs	r6, r2, #1
c0d07768:	e7ed      	b.n	c0d07746 <memcpy+0x7a>
c0d0776a:	001a      	movs	r2, r3
c0d0776c:	e7f6      	b.n	c0d0775c <memcpy+0x90>
c0d0776e:	46c0      	nop			; (mov r8, r8)

c0d07770 <memmove>:
c0d07770:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d07772:	4288      	cmp	r0, r1
c0d07774:	d90a      	bls.n	c0d0778c <memmove+0x1c>
c0d07776:	188b      	adds	r3, r1, r2
c0d07778:	4298      	cmp	r0, r3
c0d0777a:	d207      	bcs.n	c0d0778c <memmove+0x1c>
c0d0777c:	1e53      	subs	r3, r2, #1
c0d0777e:	2a00      	cmp	r2, #0
c0d07780:	d003      	beq.n	c0d0778a <memmove+0x1a>
c0d07782:	5cca      	ldrb	r2, [r1, r3]
c0d07784:	54c2      	strb	r2, [r0, r3]
c0d07786:	3b01      	subs	r3, #1
c0d07788:	d2fb      	bcs.n	c0d07782 <memmove+0x12>
c0d0778a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d0778c:	2a0f      	cmp	r2, #15
c0d0778e:	d80b      	bhi.n	c0d077a8 <memmove+0x38>
c0d07790:	0005      	movs	r5, r0
c0d07792:	1e56      	subs	r6, r2, #1
c0d07794:	2a00      	cmp	r2, #0
c0d07796:	d0f8      	beq.n	c0d0778a <memmove+0x1a>
c0d07798:	2300      	movs	r3, #0
c0d0779a:	5ccc      	ldrb	r4, [r1, r3]
c0d0779c:	001a      	movs	r2, r3
c0d0779e:	54ec      	strb	r4, [r5, r3]
c0d077a0:	3301      	adds	r3, #1
c0d077a2:	4296      	cmp	r6, r2
c0d077a4:	d1f9      	bne.n	c0d0779a <memmove+0x2a>
c0d077a6:	e7f0      	b.n	c0d0778a <memmove+0x1a>
c0d077a8:	2703      	movs	r7, #3
c0d077aa:	000d      	movs	r5, r1
c0d077ac:	003e      	movs	r6, r7
c0d077ae:	4305      	orrs	r5, r0
c0d077b0:	000c      	movs	r4, r1
c0d077b2:	0003      	movs	r3, r0
c0d077b4:	402e      	ands	r6, r5
c0d077b6:	422f      	tst	r7, r5
c0d077b8:	d12b      	bne.n	c0d07812 <memmove+0xa2>
c0d077ba:	0015      	movs	r5, r2
c0d077bc:	3d10      	subs	r5, #16
c0d077be:	092d      	lsrs	r5, r5, #4
c0d077c0:	46ac      	mov	ip, r5
c0d077c2:	012f      	lsls	r7, r5, #4
c0d077c4:	183f      	adds	r7, r7, r0
c0d077c6:	6825      	ldr	r5, [r4, #0]
c0d077c8:	601d      	str	r5, [r3, #0]
c0d077ca:	6865      	ldr	r5, [r4, #4]
c0d077cc:	605d      	str	r5, [r3, #4]
c0d077ce:	68a5      	ldr	r5, [r4, #8]
c0d077d0:	609d      	str	r5, [r3, #8]
c0d077d2:	68e5      	ldr	r5, [r4, #12]
c0d077d4:	3410      	adds	r4, #16
c0d077d6:	60dd      	str	r5, [r3, #12]
c0d077d8:	001d      	movs	r5, r3
c0d077da:	3310      	adds	r3, #16
c0d077dc:	42bd      	cmp	r5, r7
c0d077de:	d1f2      	bne.n	c0d077c6 <memmove+0x56>
c0d077e0:	4665      	mov	r5, ip
c0d077e2:	230f      	movs	r3, #15
c0d077e4:	240c      	movs	r4, #12
c0d077e6:	3501      	adds	r5, #1
c0d077e8:	012d      	lsls	r5, r5, #4
c0d077ea:	1949      	adds	r1, r1, r5
c0d077ec:	4013      	ands	r3, r2
c0d077ee:	1945      	adds	r5, r0, r5
c0d077f0:	4214      	tst	r4, r2
c0d077f2:	d011      	beq.n	c0d07818 <memmove+0xa8>
c0d077f4:	598c      	ldr	r4, [r1, r6]
c0d077f6:	51ac      	str	r4, [r5, r6]
c0d077f8:	3604      	adds	r6, #4
c0d077fa:	1b9c      	subs	r4, r3, r6
c0d077fc:	2c03      	cmp	r4, #3
c0d077fe:	d8f9      	bhi.n	c0d077f4 <memmove+0x84>
c0d07800:	3b04      	subs	r3, #4
c0d07802:	089b      	lsrs	r3, r3, #2
c0d07804:	3301      	adds	r3, #1
c0d07806:	009b      	lsls	r3, r3, #2
c0d07808:	18ed      	adds	r5, r5, r3
c0d0780a:	18c9      	adds	r1, r1, r3
c0d0780c:	2303      	movs	r3, #3
c0d0780e:	401a      	ands	r2, r3
c0d07810:	e7bf      	b.n	c0d07792 <memmove+0x22>
c0d07812:	0005      	movs	r5, r0
c0d07814:	1e56      	subs	r6, r2, #1
c0d07816:	e7bf      	b.n	c0d07798 <memmove+0x28>
c0d07818:	001a      	movs	r2, r3
c0d0781a:	e7ba      	b.n	c0d07792 <memmove+0x22>

c0d0781c <memset>:
c0d0781c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0d0781e:	0005      	movs	r5, r0
c0d07820:	0783      	lsls	r3, r0, #30
c0d07822:	d049      	beq.n	c0d078b8 <memset+0x9c>
c0d07824:	1e54      	subs	r4, r2, #1
c0d07826:	2a00      	cmp	r2, #0
c0d07828:	d045      	beq.n	c0d078b6 <memset+0x9a>
c0d0782a:	0003      	movs	r3, r0
c0d0782c:	2603      	movs	r6, #3
c0d0782e:	b2ca      	uxtb	r2, r1
c0d07830:	e002      	b.n	c0d07838 <memset+0x1c>
c0d07832:	3501      	adds	r5, #1
c0d07834:	3c01      	subs	r4, #1
c0d07836:	d33e      	bcc.n	c0d078b6 <memset+0x9a>
c0d07838:	3301      	adds	r3, #1
c0d0783a:	702a      	strb	r2, [r5, #0]
c0d0783c:	4233      	tst	r3, r6
c0d0783e:	d1f8      	bne.n	c0d07832 <memset+0x16>
c0d07840:	2c03      	cmp	r4, #3
c0d07842:	d930      	bls.n	c0d078a6 <memset+0x8a>
c0d07844:	22ff      	movs	r2, #255	; 0xff
c0d07846:	400a      	ands	r2, r1
c0d07848:	0215      	lsls	r5, r2, #8
c0d0784a:	4315      	orrs	r5, r2
c0d0784c:	042a      	lsls	r2, r5, #16
c0d0784e:	4315      	orrs	r5, r2
c0d07850:	2c0f      	cmp	r4, #15
c0d07852:	d934      	bls.n	c0d078be <memset+0xa2>
c0d07854:	0027      	movs	r7, r4
c0d07856:	3f10      	subs	r7, #16
c0d07858:	093f      	lsrs	r7, r7, #4
c0d0785a:	013e      	lsls	r6, r7, #4
c0d0785c:	46b4      	mov	ip, r6
c0d0785e:	001e      	movs	r6, r3
c0d07860:	001a      	movs	r2, r3
c0d07862:	3610      	adds	r6, #16
c0d07864:	4466      	add	r6, ip
c0d07866:	6015      	str	r5, [r2, #0]
c0d07868:	6055      	str	r5, [r2, #4]
c0d0786a:	6095      	str	r5, [r2, #8]
c0d0786c:	60d5      	str	r5, [r2, #12]
c0d0786e:	3210      	adds	r2, #16
c0d07870:	42b2      	cmp	r2, r6
c0d07872:	d1f8      	bne.n	c0d07866 <memset+0x4a>
c0d07874:	3701      	adds	r7, #1
c0d07876:	013f      	lsls	r7, r7, #4
c0d07878:	19db      	adds	r3, r3, r7
c0d0787a:	270f      	movs	r7, #15
c0d0787c:	220c      	movs	r2, #12
c0d0787e:	4027      	ands	r7, r4
c0d07880:	4022      	ands	r2, r4
c0d07882:	003c      	movs	r4, r7
c0d07884:	2a00      	cmp	r2, #0
c0d07886:	d00e      	beq.n	c0d078a6 <memset+0x8a>
c0d07888:	1f3e      	subs	r6, r7, #4
c0d0788a:	08b6      	lsrs	r6, r6, #2
c0d0788c:	00b4      	lsls	r4, r6, #2
c0d0788e:	46a4      	mov	ip, r4
c0d07890:	001a      	movs	r2, r3
c0d07892:	1d1c      	adds	r4, r3, #4
c0d07894:	4464      	add	r4, ip
c0d07896:	c220      	stmia	r2!, {r5}
c0d07898:	42a2      	cmp	r2, r4
c0d0789a:	d1fc      	bne.n	c0d07896 <memset+0x7a>
c0d0789c:	2403      	movs	r4, #3
c0d0789e:	3601      	adds	r6, #1
c0d078a0:	00b6      	lsls	r6, r6, #2
c0d078a2:	199b      	adds	r3, r3, r6
c0d078a4:	403c      	ands	r4, r7
c0d078a6:	2c00      	cmp	r4, #0
c0d078a8:	d005      	beq.n	c0d078b6 <memset+0x9a>
c0d078aa:	b2c9      	uxtb	r1, r1
c0d078ac:	191c      	adds	r4, r3, r4
c0d078ae:	7019      	strb	r1, [r3, #0]
c0d078b0:	3301      	adds	r3, #1
c0d078b2:	429c      	cmp	r4, r3
c0d078b4:	d1fb      	bne.n	c0d078ae <memset+0x92>
c0d078b6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0d078b8:	0003      	movs	r3, r0
c0d078ba:	0014      	movs	r4, r2
c0d078bc:	e7c0      	b.n	c0d07840 <memset+0x24>
c0d078be:	0027      	movs	r7, r4
c0d078c0:	e7e2      	b.n	c0d07888 <memset+0x6c>
c0d078c2:	46c0      	nop			; (mov r8, r8)

c0d078c4 <setjmp>:
c0d078c4:	c0f0      	stmia	r0!, {r4, r5, r6, r7}
c0d078c6:	4641      	mov	r1, r8
c0d078c8:	464a      	mov	r2, r9
c0d078ca:	4653      	mov	r3, sl
c0d078cc:	465c      	mov	r4, fp
c0d078ce:	466d      	mov	r5, sp
c0d078d0:	4676      	mov	r6, lr
c0d078d2:	c07e      	stmia	r0!, {r1, r2, r3, r4, r5, r6}
c0d078d4:	3828      	subs	r0, #40	; 0x28
c0d078d6:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d078d8:	2000      	movs	r0, #0
c0d078da:	4770      	bx	lr

c0d078dc <longjmp>:
c0d078dc:	3010      	adds	r0, #16
c0d078de:	c87c      	ldmia	r0!, {r2, r3, r4, r5, r6}
c0d078e0:	4690      	mov	r8, r2
c0d078e2:	4699      	mov	r9, r3
c0d078e4:	46a2      	mov	sl, r4
c0d078e6:	46ab      	mov	fp, r5
c0d078e8:	46b5      	mov	sp, r6
c0d078ea:	c808      	ldmia	r0!, {r3}
c0d078ec:	3828      	subs	r0, #40	; 0x28
c0d078ee:	c8f0      	ldmia	r0!, {r4, r5, r6, r7}
c0d078f0:	0008      	movs	r0, r1
c0d078f2:	d100      	bne.n	c0d078f6 <longjmp+0x1a>
c0d078f4:	2001      	movs	r0, #1
c0d078f6:	4718      	bx	r3

c0d078f8 <strlen>:
c0d078f8:	b510      	push	{r4, lr}
c0d078fa:	0783      	lsls	r3, r0, #30
c0d078fc:	d00a      	beq.n	c0d07914 <strlen+0x1c>
c0d078fe:	0003      	movs	r3, r0
c0d07900:	2103      	movs	r1, #3
c0d07902:	e002      	b.n	c0d0790a <strlen+0x12>
c0d07904:	3301      	adds	r3, #1
c0d07906:	420b      	tst	r3, r1
c0d07908:	d005      	beq.n	c0d07916 <strlen+0x1e>
c0d0790a:	781a      	ldrb	r2, [r3, #0]
c0d0790c:	2a00      	cmp	r2, #0
c0d0790e:	d1f9      	bne.n	c0d07904 <strlen+0xc>
c0d07910:	1a18      	subs	r0, r3, r0
c0d07912:	bd10      	pop	{r4, pc}
c0d07914:	0003      	movs	r3, r0
c0d07916:	6819      	ldr	r1, [r3, #0]
c0d07918:	4a0c      	ldr	r2, [pc, #48]	; (c0d0794c <strlen+0x54>)
c0d0791a:	4c0d      	ldr	r4, [pc, #52]	; (c0d07950 <strlen+0x58>)
c0d0791c:	188a      	adds	r2, r1, r2
c0d0791e:	438a      	bics	r2, r1
c0d07920:	4222      	tst	r2, r4
c0d07922:	d10f      	bne.n	c0d07944 <strlen+0x4c>
c0d07924:	6859      	ldr	r1, [r3, #4]
c0d07926:	4a09      	ldr	r2, [pc, #36]	; (c0d0794c <strlen+0x54>)
c0d07928:	3304      	adds	r3, #4
c0d0792a:	188a      	adds	r2, r1, r2
c0d0792c:	438a      	bics	r2, r1
c0d0792e:	4222      	tst	r2, r4
c0d07930:	d108      	bne.n	c0d07944 <strlen+0x4c>
c0d07932:	6859      	ldr	r1, [r3, #4]
c0d07934:	4a05      	ldr	r2, [pc, #20]	; (c0d0794c <strlen+0x54>)
c0d07936:	3304      	adds	r3, #4
c0d07938:	188a      	adds	r2, r1, r2
c0d0793a:	438a      	bics	r2, r1
c0d0793c:	4222      	tst	r2, r4
c0d0793e:	d0f1      	beq.n	c0d07924 <strlen+0x2c>
c0d07940:	e000      	b.n	c0d07944 <strlen+0x4c>
c0d07942:	3301      	adds	r3, #1
c0d07944:	781a      	ldrb	r2, [r3, #0]
c0d07946:	2a00      	cmp	r2, #0
c0d07948:	d1fb      	bne.n	c0d07942 <strlen+0x4a>
c0d0794a:	e7e1      	b.n	c0d07910 <strlen+0x18>
c0d0794c:	fefefeff 	.word	0xfefefeff
c0d07950:	80808080 	.word	0x80808080

c0d07954 <strnlen>:
c0d07954:	b510      	push	{r4, lr}
c0d07956:	0003      	movs	r3, r0
c0d07958:	1844      	adds	r4, r0, r1
c0d0795a:	2900      	cmp	r1, #0
c0d0795c:	d103      	bne.n	c0d07966 <strnlen+0x12>
c0d0795e:	e009      	b.n	c0d07974 <strnlen+0x20>
c0d07960:	3301      	adds	r3, #1
c0d07962:	429c      	cmp	r4, r3
c0d07964:	d004      	beq.n	c0d07970 <strnlen+0x1c>
c0d07966:	781a      	ldrb	r2, [r3, #0]
c0d07968:	2a00      	cmp	r2, #0
c0d0796a:	d1f9      	bne.n	c0d07960 <strnlen+0xc>
c0d0796c:	1a18      	subs	r0, r3, r0
c0d0796e:	bd10      	pop	{r4, pc}
c0d07970:	1a20      	subs	r0, r4, r0
c0d07972:	e7fc      	b.n	c0d0796e <strnlen+0x1a>
c0d07974:	2000      	movs	r0, #0
c0d07976:	e7fa      	b.n	c0d0796e <strnlen+0x1a>

c0d07978 <bzero>:
c0d07978:	b510      	push	{r4, lr}
c0d0797a:	000a      	movs	r2, r1
c0d0797c:	2100      	movs	r1, #0
c0d0797e:	f7ff ff4d 	bl	c0d0781c <memset>
c0d07982:	bd10      	pop	{r4, pc}
c0d07984:	2f637273 	.word	0x2f637273
c0d07988:	5f707061 	.word	0x5f707061
c0d0798c:	6e69616d 	.word	0x6e69616d
c0d07990:	393a632e 	.word	0x393a632e
c0d07994:	72730033 	.word	0x72730033
c0d07998:	70612f63 	.word	0x70612f63
c0d0799c:	616d5f70 	.word	0x616d5f70
c0d079a0:	632e6e69 	.word	0x632e6e69
c0d079a4:	0038393a 	.word	0x0038393a
c0d079a8:	2f637273 	.word	0x2f637273
c0d079ac:	34706962 	.word	0x34706962
c0d079b0:	3a632e34 	.word	0x3a632e34
c0d079b4:	73003333 	.word	0x73003333
c0d079b8:	622f6372 	.word	0x622f6372
c0d079bc:	34347069 	.word	0x34347069
c0d079c0:	353a632e 	.word	0x353a632e
c0d079c4:	72730037 	.word	0x72730037
c0d079c8:	69622f63 	.word	0x69622f63
c0d079cc:	2e343470 	.word	0x2e343470
c0d079d0:	34373a63 	.word	0x34373a63
c0d079d4:	63727300 	.word	0x63727300
c0d079d8:	7069622f 	.word	0x7069622f
c0d079dc:	632e3434 	.word	0x632e3434
c0d079e0:	0036373a 	.word	0x0036373a
c0d079e4:	2f637273 	.word	0x2f637273
c0d079e8:	34706962 	.word	0x34706962
c0d079ec:	3a632e34 	.word	0x3a632e34
c0d079f0:	73003739 	.word	0x73003739
c0d079f4:	622f6372 	.word	0x622f6372
c0d079f8:	34347069 	.word	0x34347069
c0d079fc:	393a632e 	.word	0x393a632e
c0d07a00:	72730039 	.word	0x72730039
c0d07a04:	69622f63 	.word	0x69622f63
c0d07a08:	2e343470 	.word	0x2e343470
c0d07a0c:	30313a63 	.word	0x30313a63
c0d07a10:	252f0035 	.word	0x252f0035
c0d07a14:	73002764 	.word	0x73002764
c0d07a18:	622f6372 	.word	0x622f6372
c0d07a1c:	34347069 	.word	0x34347069
c0d07a20:	313a632e 	.word	0x313a632e
c0d07a24:	2f003730 	.word	0x2f003730
c0d07a28:	73006425 	.word	0x73006425
c0d07a2c:	622f6372 	.word	0x622f6372
c0d07a30:	34347069 	.word	0x34347069
c0d07a34:	313a632e 	.word	0x313a632e
c0d07a38:	73003131 	.word	0x73003131
c0d07a3c:	622f6372 	.word	0x622f6372
c0d07a40:	34347069 	.word	0x34347069
c0d07a44:	313a632e 	.word	0x313a632e
c0d07a48:	3231      	.short	0x3231
c0d07a4a:	00          	.byte	0x00
c0d07a4b:	73          	.byte	0x73
c0d07a4c:	642f6372 	.word	0x642f6372
c0d07a50:	646f6365 	.word	0x646f6365
c0d07a54:	2e484465 	.word	0x2e484465
c0d07a58:	30353a63 	.word	0x30353a63
c0d07a5c:	72730034 	.word	0x72730034
c0d07a60:	65642f63 	.word	0x65642f63
c0d07a64:	65646f63 	.word	0x65646f63
c0d07a68:	632e4844 	.word	0x632e4844
c0d07a6c:	3832353a 	.word	0x3832353a
c0d07a70:	63727300 	.word	0x63727300
c0d07a74:	6365642f 	.word	0x6365642f
c0d07a78:	4465646f 	.word	0x4465646f
c0d07a7c:	3a632e48 	.word	0x3a632e48
c0d07a80:	00393235 	.word	0x00393235
c0d07a84:	2f637273 	.word	0x2f637273
c0d07a88:	6f636564 	.word	0x6f636564
c0d07a8c:	48446564 	.word	0x48446564
c0d07a90:	353a632e 	.word	0x353a632e
c0d07a94:	73003833 	.word	0x73003833
c0d07a98:	642f6372 	.word	0x642f6372
c0d07a9c:	646f6365 	.word	0x646f6365
c0d07aa0:	2e484465 	.word	0x2e484465
c0d07aa4:	30323a63 	.word	0x30323a63
c0d07aa8:	72730031 	.word	0x72730031
c0d07aac:	65642f63 	.word	0x65642f63
c0d07ab0:	65646f63 	.word	0x65646f63
c0d07ab4:	632e4844 	.word	0x632e4844
c0d07ab8:	0034373a 	.word	0x0034373a
c0d07abc:	72636544 	.word	0x72636544
c0d07ac0:	20747079 	.word	0x20747079
c0d07ac4:	746e6f63 	.word	0x746e6f63
c0d07ac8:	00746e65 	.word	0x00746e65
c0d07acc:	65746e49 	.word	0x65746e49
c0d07ad0:	65727072 	.word	0x65727072
c0d07ad4:	676e6974 	.word	0x676e6974
c0d07ad8:	65687400 	.word	0x65687400
c0d07adc:	73656d20 	.word	0x73656d20
c0d07ae0:	65676173 	.word	0x65676173
c0d07ae4:	20736120 	.word	0x20736120
c0d07ae8:	75716552 	.word	0x75716552
c0d07aec:	20747365 	.word	0x20747365
c0d07af0:	646e7566 	.word	0x646e7566
c0d07af4:	61500073 	.word	0x61500073
c0d07af8:	20656579 	.word	0x20656579
c0d07afc:	6c627570 	.word	0x6c627570
c0d07b00:	61206369 	.word	0x61206369
c0d07b04:	65726464 	.word	0x65726464
c0d07b08:	41007373 	.word	0x41007373
c0d07b0c:	6e756f6d 	.word	0x6e756f6d
c0d07b10:	68430074 	.word	0x68430074
c0d07b14:	206e6961 	.word	0x206e6961
c0d07b18:	65646f63 	.word	0x65646f63
c0d07b1c:	6b6f5400 	.word	0x6b6f5400
c0d07b20:	63206e65 	.word	0x63206e65
c0d07b24:	0065646f 	.word	0x0065646f
c0d07b28:	2f637273 	.word	0x2f637273
c0d07b2c:	6f636564 	.word	0x6f636564
c0d07b30:	48446564 	.word	0x48446564
c0d07b34:	313a632e 	.word	0x313a632e
c0d07b38:	4d003730 	.word	0x4d003730
c0d07b3c:	006f6d65 	.word	0x006f6d65
c0d07b40:	666e6f43 	.word	0x666e6f43
c0d07b44:	006d7269 	.word	0x006d7269
c0d07b48:	70736572 	.word	0x70736572
c0d07b4c:	65736e6f 	.word	0x65736e6f
c0d07b50:	63727300 	.word	0x63727300
c0d07b54:	6365642f 	.word	0x6365642f
c0d07b58:	4465646f 	.word	0x4465646f
c0d07b5c:	3a632e48 	.word	0x3a632e48
c0d07b60:	00323431 	.word	0x00323431
c0d07b64:	2f637273 	.word	0x2f637273
c0d07b68:	6f636564 	.word	0x6f636564
c0d07b6c:	48446564 	.word	0x48446564
c0d07b70:	313a632e 	.word	0x313a632e
c0d07b74:	48003537 	.word	0x48003537
c0d07b78:	00687361 	.word	0x00687361
c0d07b7c:	2f637273 	.word	0x2f637273
c0d07b80:	6f636564 	.word	0x6f636564
c0d07b84:	48446564 	.word	0x48446564
c0d07b88:	313a632e 	.word	0x313a632e
c0d07b8c:	4f003238 	.word	0x4f003238
c0d07b90:	696c6666 	.word	0x696c6666
c0d07b94:	5520656e 	.word	0x5520656e
c0d07b98:	73004c52 	.word	0x73004c52
c0d07b9c:	642f6372 	.word	0x642f6372
c0d07ba0:	646f6365 	.word	0x646f6365
c0d07ba4:	2e484465 	.word	0x2e484465
c0d07ba8:	32343a63 	.word	0x32343a63
c0d07bac:	72730030 	.word	0x72730030
c0d07bb0:	65642f63 	.word	0x65642f63
c0d07bb4:	65646f63 	.word	0x65646f63
c0d07bb8:	632e4844 	.word	0x632e4844
c0d07bbc:	3035323a 	.word	0x3035323a
c0d07bc0:	65687400 	.word	0x65687400
c0d07bc4:	73656d20 	.word	0x73656d20
c0d07bc8:	65676173 	.word	0x65676173
c0d07bcc:	20736120 	.word	0x20736120
c0d07bd0:	6f636552 	.word	0x6f636552
c0d07bd4:	6f206472 	.word	0x6f206472
c0d07bd8:	72656874 	.word	0x72656874
c0d07bdc:	6f6c6220 	.word	0x6f6c6220
c0d07be0:	68636b63 	.word	0x68636b63
c0d07be4:	206e6961 	.word	0x206e6961
c0d07be8:	6e617274 	.word	0x6e617274
c0d07bec:	74636173 	.word	0x74636173
c0d07bf0:	206e6f69 	.word	0x206e6f69
c0d07bf4:	6174656d 	.word	0x6174656d
c0d07bf8:	61746164 	.word	0x61746164
c0d07bfc:	79615000 	.word	0x79615000
c0d07c00:	70207265 	.word	0x70207265
c0d07c04:	696c6275 	.word	0x696c6275
c0d07c08:	64612063 	.word	0x64612063
c0d07c0c:	73657264 	.word	0x73657264
c0d07c10:	74530073 	.word	0x74530073
c0d07c14:	73757461 	.word	0x73757461
c0d07c18:	74624f00 	.word	0x74624f00
c0d07c1c:	00444920 	.word	0x00444920
c0d07c20:	2f637273 	.word	0x2f637273
c0d07c24:	6f636564 	.word	0x6f636564
c0d07c28:	48446564 	.word	0x48446564
c0d07c2c:	333a632e 	.word	0x333a632e
c0d07c30:	73003330 	.word	0x73003330
c0d07c34:	642f6372 	.word	0x642f6372
c0d07c38:	646f6365 	.word	0x646f6365
c0d07c3c:	2e484465 	.word	0x2e484465
c0d07c40:	34333a63 	.word	0x34333a63
c0d07c44:	72730031 	.word	0x72730031
c0d07c48:	65642f63 	.word	0x65642f63
c0d07c4c:	65646f63 	.word	0x65646f63
c0d07c50:	632e4844 	.word	0x632e4844
c0d07c54:	3439333a 	.word	0x3439333a
c0d07c58:	63727300 	.word	0x63727300
c0d07c5c:	6365642f 	.word	0x6365642f
c0d07c60:	4465646f 	.word	0x4465646f
c0d07c64:	3a632e48 	.word	0x3a632e48
c0d07c68:	00313034 	.word	0x00313034
c0d07c6c:	2f637273 	.word	0x2f637273
c0d07c70:	66666964 	.word	0x66666964
c0d07c74:	65486569 	.word	0x65486569
c0d07c78:	616d6c6c 	.word	0x616d6c6c
c0d07c7c:	3a632e6e 	.word	0x3a632e6e
c0d07c80:	00343031 	.word	0x00343031
c0d07c84:	2f637273 	.word	0x2f637273
c0d07c88:	66666964 	.word	0x66666964
c0d07c8c:	65486569 	.word	0x65486569
c0d07c90:	616d6c6c 	.word	0x616d6c6c
c0d07c94:	3a632e6e 	.word	0x3a632e6e
c0d07c98:	00353331 	.word	0x00353331
c0d07c9c:	2f637273 	.word	0x2f637273
c0d07ca0:	66666964 	.word	0x66666964
c0d07ca4:	65486569 	.word	0x65486569
c0d07ca8:	616d6c6c 	.word	0x616d6c6c
c0d07cac:	3a632e6e 	.word	0x3a632e6e
c0d07cb0:	00363331 	.word	0x00363331
c0d07cb4:	2f637273 	.word	0x2f637273
c0d07cb8:	66666964 	.word	0x66666964
c0d07cbc:	65486569 	.word	0x65486569
c0d07cc0:	616d6c6c 	.word	0x616d6c6c
c0d07cc4:	3a632e6e 	.word	0x3a632e6e
c0d07cc8:	00363431 	.word	0x00363431
c0d07ccc:	2f637273 	.word	0x2f637273
c0d07cd0:	66666964 	.word	0x66666964
c0d07cd4:	65486569 	.word	0x65486569
c0d07cd8:	616d6c6c 	.word	0x616d6c6c
c0d07cdc:	3a632e6e 	.word	0x3a632e6e
c0d07ce0:	00383431 	.word	0x00383431
c0d07ce4:	2f637273 	.word	0x2f637273
c0d07ce8:	66666964 	.word	0x66666964
c0d07cec:	65486569 	.word	0x65486569
c0d07cf0:	616d6c6c 	.word	0x616d6c6c
c0d07cf4:	3a632e6e 	.word	0x3a632e6e
c0d07cf8:	00313731 	.word	0x00313731
c0d07cfc:	2f637273 	.word	0x2f637273
c0d07d00:	66666964 	.word	0x66666964
c0d07d04:	65486569 	.word	0x65486569
c0d07d08:	616d6c6c 	.word	0x616d6c6c
c0d07d0c:	3a632e6e 	.word	0x3a632e6e
c0d07d10:	00323731 	.word	0x00323731
c0d07d14:	2f637273 	.word	0x2f637273
c0d07d18:	66666964 	.word	0x66666964
c0d07d1c:	65486569 	.word	0x65486569
c0d07d20:	616d6c6c 	.word	0x616d6c6c
c0d07d24:	3a632e6e 	.word	0x3a632e6e
c0d07d28:	00333731 	.word	0x00333731
c0d07d2c:	2f637273 	.word	0x2f637273
c0d07d30:	66666964 	.word	0x66666964
c0d07d34:	65486569 	.word	0x65486569
c0d07d38:	616d6c6c 	.word	0x616d6c6c
c0d07d3c:	3a632e6e 	.word	0x3a632e6e
c0d07d40:	00343731 	.word	0x00343731
c0d07d44:	2f637273 	.word	0x2f637273
c0d07d48:	66666964 	.word	0x66666964
c0d07d4c:	65486569 	.word	0x65486569
c0d07d50:	616d6c6c 	.word	0x616d6c6c
c0d07d54:	3a632e6e 	.word	0x3a632e6e
c0d07d58:	00363032 	.word	0x00363032
c0d07d5c:	2f637273 	.word	0x2f637273
c0d07d60:	66666964 	.word	0x66666964
c0d07d64:	65486569 	.word	0x65486569
c0d07d68:	616d6c6c 	.word	0x616d6c6c
c0d07d6c:	3a632e6e 	.word	0x3a632e6e
c0d07d70:	00373032 	.word	0x00373032
c0d07d74:	2f637273 	.word	0x2f637273
c0d07d78:	66666964 	.word	0x66666964
c0d07d7c:	65486569 	.word	0x65486569
c0d07d80:	616d6c6c 	.word	0x616d6c6c
c0d07d84:	3a632e6e 	.word	0x3a632e6e
c0d07d88:	00383032 	.word	0x00383032
c0d07d8c:	2f637273 	.word	0x2f637273
c0d07d90:	66666964 	.word	0x66666964
c0d07d94:	65486569 	.word	0x65486569
c0d07d98:	616d6c6c 	.word	0x616d6c6c
c0d07d9c:	3a632e6e 	.word	0x3a632e6e
c0d07da0:	00393232 	.word	0x00393232
c0d07da4:	2f637273 	.word	0x2f637273
c0d07da8:	66666964 	.word	0x66666964
c0d07dac:	65486569 	.word	0x65486569
c0d07db0:	616d6c6c 	.word	0x616d6c6c
c0d07db4:	3a632e6e 	.word	0x3a632e6e
c0d07db8:	00303332 	.word	0x00303332
c0d07dbc:	2f637273 	.word	0x2f637273
c0d07dc0:	66666964 	.word	0x66666964
c0d07dc4:	65486569 	.word	0x65486569
c0d07dc8:	616d6c6c 	.word	0x616d6c6c
c0d07dcc:	3a632e6e 	.word	0x3a632e6e
c0d07dd0:	00333432 	.word	0x00333432
c0d07dd4:	2f637273 	.word	0x2f637273
c0d07dd8:	66666964 	.word	0x66666964
c0d07ddc:	65486569 	.word	0x65486569
c0d07de0:	616d6c6c 	.word	0x616d6c6c
c0d07de4:	3a632e6e 	.word	0x3a632e6e
c0d07de8:	00313532 	.word	0x00313532
c0d07dec:	2f637273 	.word	0x2f637273
c0d07df0:	66666964 	.word	0x66666964
c0d07df4:	65486569 	.word	0x65486569
c0d07df8:	616d6c6c 	.word	0x616d6c6c
c0d07dfc:	3a632e6e 	.word	0x3a632e6e
c0d07e00:	00393532 	.word	0x00393532
c0d07e04:	2f637273 	.word	0x2f637273
c0d07e08:	66666964 	.word	0x66666964
c0d07e0c:	65486569 	.word	0x65486569
c0d07e10:	616d6c6c 	.word	0x616d6c6c
c0d07e14:	3a632e6e 	.word	0x3a632e6e
c0d07e18:	00353732 	.word	0x00353732
c0d07e1c:	2f637273 	.word	0x2f637273
c0d07e20:	66666964 	.word	0x66666964
c0d07e24:	65486569 	.word	0x65486569
c0d07e28:	616d6c6c 	.word	0x616d6c6c
c0d07e2c:	3a632e6e 	.word	0x3a632e6e
c0d07e30:	00333533 	.word	0x00333533
c0d07e34:	2f637273 	.word	0x2f637273
c0d07e38:	66666964 	.word	0x66666964
c0d07e3c:	65486569 	.word	0x65486569
c0d07e40:	616d6c6c 	.word	0x616d6c6c
c0d07e44:	3a632e6e 	.word	0x3a632e6e
c0d07e48:	00353533 	.word	0x00353533
c0d07e4c:	2f637273 	.word	0x2f637273
c0d07e50:	68736168 	.word	0x68736168
c0d07e54:	313a682e 	.word	0x313a682e
c0d07e58:	73003231 	.word	0x73003231
c0d07e5c:	682f6372 	.word	0x682f6372
c0d07e60:	2e687361 	.word	0x2e687361
c0d07e64:	31313a68 	.word	0x31313a68
c0d07e68:	72730033 	.word	0x72730033
c0d07e6c:	61682f63 	.word	0x61682f63
c0d07e70:	682e6873 	.word	0x682e6873
c0d07e74:	0034383a 	.word	0x0034383a
c0d07e78:	2f637273 	.word	0x2f637273
c0d07e7c:	68736168 	.word	0x68736168
c0d07e80:	393a682e 	.word	0x393a682e
c0d07e84:	72730037 	.word	0x72730037
c0d07e88:	61682f63 	.word	0x61682f63
c0d07e8c:	682e6873 	.word	0x682e6873
c0d07e90:	0038393a 	.word	0x0038393a
c0d07e94:	2f637273 	.word	0x2f637273
c0d07e98:	66666964 	.word	0x66666964
c0d07e9c:	65486569 	.word	0x65486569
c0d07ea0:	616d6c6c 	.word	0x616d6c6c
c0d07ea4:	3a632e6e 	.word	0x3a632e6e
c0d07ea8:	73003733 	.word	0x73003733
c0d07eac:	642f6372 	.word	0x642f6372
c0d07eb0:	69666669 	.word	0x69666669
c0d07eb4:	6c654865 	.word	0x6c654865
c0d07eb8:	6e616d6c 	.word	0x6e616d6c
c0d07ebc:	343a632e 	.word	0x343a632e
c0d07ec0:	72730039 	.word	0x72730039
c0d07ec4:	69642f63 	.word	0x69642f63
c0d07ec8:	65696666 	.word	0x65696666
c0d07ecc:	6c6c6548 	.word	0x6c6c6548
c0d07ed0:	2e6e616d 	.word	0x2e6e616d
c0d07ed4:	30363a63 	.word	0x30363a63
c0d07ed8:	63727300 	.word	0x63727300
c0d07edc:	6669642f 	.word	0x6669642f
c0d07ee0:	48656966 	.word	0x48656966
c0d07ee4:	6d6c6c65 	.word	0x6d6c6c65
c0d07ee8:	632e6e61 	.word	0x632e6e61
c0d07eec:	0034363a 	.word	0x0034363a
c0d07ef0:	2f637273 	.word	0x2f637273
c0d07ef4:	66666964 	.word	0x66666964
c0d07ef8:	65486569 	.word	0x65486569
c0d07efc:	616d6c6c 	.word	0x616d6c6c
c0d07f00:	3a632e6e 	.word	0x3a632e6e
c0d07f04:	73003936 	.word	0x73003936
c0d07f08:	642f6372 	.word	0x642f6372
c0d07f0c:	69666669 	.word	0x69666669
c0d07f10:	6c654865 	.word	0x6c654865
c0d07f14:	6e616d6c 	.word	0x6e616d6c
c0d07f18:	333a632e 	.word	0x333a632e
c0d07f1c:	73003731 	.word	0x73003731
c0d07f20:	642f6372 	.word	0x642f6372
c0d07f24:	69666669 	.word	0x69666669
c0d07f28:	6c654865 	.word	0x6c654865
c0d07f2c:	6e616d6c 	.word	0x6e616d6c
c0d07f30:	333a632e 	.word	0x333a632e
c0d07f34:	73003931 	.word	0x73003931
c0d07f38:	642f6372 	.word	0x642f6372
c0d07f3c:	69666669 	.word	0x69666669
c0d07f40:	6c654865 	.word	0x6c654865
c0d07f44:	6e616d6c 	.word	0x6e616d6c
c0d07f48:	333a632e 	.word	0x333a632e
c0d07f4c:	73003332 	.word	0x73003332
c0d07f50:	642f6372 	.word	0x642f6372
c0d07f54:	69666669 	.word	0x69666669
c0d07f58:	6c654865 	.word	0x6c654865
c0d07f5c:	6e616d6c 	.word	0x6e616d6c
c0d07f60:	333a632e 	.word	0x333a632e
c0d07f64:	3432      	.short	0x3432
	...

c0d07f67 <BASE64>:
c0d07f67:	4241 4443 4645 4847 4a49 4c4b 4e4d 504f     ABCDEFGHIJKLMNOP
c0d07f77:	5251 5453 5655 5857 5a59 6261 6463 6665     QRSTUVWXYZabcdef
c0d07f87:	6867 6a69 6c6b 6e6d 706f 7271 7473 7675     ghijklmnopqrstuv
c0d07f97:	7877 7a79 3130 3332 3534 3736 3938 2f2b     wxyz0123456789+/

c0d07fa7 <BASE58ALPHABET>:
c0d07fa7:	3231 3433 3635 3837 4139 4342 4544 4746     123456789ABCDEFG
c0d07fb7:	4a48 4c4b 4e4d 5150 5352 5554 5756 5958     HJKLMNPQRSTUVWXY
c0d07fc7:	615a 6362 6564 6766 6968 6b6a 6e6d 706f     Zabcdefghijkmnop
c0d07fd7:	7271 7473 7675 7877 7a79 7273 2f63 6f65     qrstuvwxyzsrc/eo
c0d07fe7:	5f73 7475 6c69 2e73 3a63 3831 0031 7273     s_utils.c:181.sr
c0d07ff7:	2f63 6f65 5f73 7475 6c69 2e73 3a63 3831     c/eos_utils.c:18
c0d08007:	0036 7273 2f63 6f65 5f73 7475 6c69 2e73     6.src/eos_utils.
c0d08017:	3a63 3032 0037 7273 2f63 6f65 5f73 7475     c:207.src/eos_ut
c0d08027:	6c69 2e73 3a63 3032 0038 7273 2f63 6f65     ils.c:208.src/eo
c0d08037:	5f73 7475 6c69 2e73 3a63 3232 0031 7273     s_utils.c:221.sr
c0d08047:	2f63 6f65 5f73 7475 6c69 2e73 3a63 3232     c/eos_utils.c:22
c0d08057:	0032 7273 2f63 6f65 5f73 7475 6c69 2e73     2.src/eos_utils.
c0d08067:	3a63 3232 0033 7273 2f63 6f65 5f73 7475     c:223.src/eos_ut
c0d08077:	6c69 2e73 3a63 3432 0031 7273 2f63 6f65     ils.c:241.src/eo
c0d08087:	5f73 7475 6c69 2e73 3a63 3532 0030 7273     s_utils.c:250.sr
c0d08097:	2f63 6f65 5f73 7475 6c69 2e73 3a63 3532     c/eos_utils.c:25
c0d080a7:	0031 7273 2f63 6f65 5f73 7475 6c69 2e73     1.src/eos_utils.
c0d080b7:	3a63 3532 0032 7273 2f63 6966 2e6f 3a63     c:252.src/fio.c:
c0d080c7:	0034 7273 2f63 6966 2e6f 3a63 3732 7300     4.src/fio.c:27.s
c0d080d7:	6372 662f 6f69 632e 363a 0036 7273 2f63     rc/fio.c:66.src/
c0d080e7:	6966 2e6f 3a63 3637 7300 6372 662f 6f69     fio.c:76.src/fio
c0d080f7:	632e 383a 0033 7273 2f63 6966 2e6f 3a63     .c:83.src/fio.c:
c0d08107:	3538 2e00 3231 3433 6135 6362 6564 6766     85..12345abcdefg
c0d08117:	6968 6b6a 6d6c 6f6e 7170 7372 7574 7776     hijklmnopqrstuvw
c0d08127:	7978 007a 09b2 3801 f40a f54e 599c 4318     xyz....8..N..Y.C
c0d08137:	1f9a 419a 36d8 0269 1903 05a8 b874 a504     ...A.6i.....t...
c0d08147:	5cf9 7ebd dc21 42ae 18c0 0022 3fe9 4a95     .\.~!..B.."..?.J
c0d08157:	4007 f911 8a04 2476 fec6 d381 54c9 611a     .@....v$.....T.a
c0d08167:	884a 1cbd 7273 2f63 6567 5074 6275 696c     J...src/getPubli
c0d08177:	4b63 7965 632e 313a 3533 7300 6372 672f     cKey.c:135.src/g
c0d08187:	7465 7550 6c62 6369 654b 2e79 3a63 3738     etPublicKey.c:87
c0d08197:	7300 6372 672f 7465 7550 6c62 6369 654b     .src/getPublicKe
c0d081a7:	2e79 3a63 3131 0033 7273 2f63 6567 5074     y.c:113.src/getP
c0d081b7:	6275 696c 4b63 7965 632e 353a 0030 6e55     ublicKey.c:50.Un
c0d081c7:	7375 6175 206c 6572 7571 7365 0074 7250     usual request.Pr
c0d081d7:	636f 6565 2064 6977 6874 6320 7261 0065     oceed with care.
c0d081e7:	7845 6f70 7472 7020 6275 696c 2063 656b     Export public ke
c0d081f7:	0079 7550 6c62 6369 6b20 7965 4300 6e6f     y.Public key.Con
c0d08207:	6966 6d72 6520 7078 726f 0074 7570 6c62     firm export.publ
c0d08217:	6369 6b20 7965 003f 7273 2f63 6567 5074     ic key?.src/getP
c0d08227:	6275 696c 4b63 7965 632e 363a 0035 7273     ublicKey.c:65.sr
c0d08237:	2f63 6567 5074 6275 696c 4b63 7965 632e     c/getPublicKey.c
c0d08247:	333a 0031 7273 2f63 6567 5374 7265 6169     :31.src/getSeria
c0d08257:	2e6c 3a63 3532 0000                          l.c:25...

c0d08260 <C_icon_back_colors>:
c0d08260:	0000 0000 ffff 00ff                         ........

c0d08268 <C_icon_back_bitmap>:
c0d08268:	01e0 c1fe 38fd 067f 81df c4ff f37f bcff     .....8..........
c0d08278:	e71f f1e7 f83f 7807 0000 0000               ....?..x....

c0d08284 <C_icon_back>:
c0d08284:	000e 0000 000e 0000 0001 0000 8260 c0d0     ............`...
c0d08294:	8268 c0d0                                   h...

c0d08298 <C_icon_dashboard_colors>:
c0d08298:	0000 0000 ffff 00ff                         ........

c0d082a0 <C_icon_dashboard_bitmap>:
c0d082a0:	01e0 c1fe 38ff 0670 79d8 9e7e e79f b9e7     .....8p..y~.....
c0d082b0:	e601 f1c0 f83f 7807 0000 0000               ....?..x....

c0d082bc <C_icon_dashboard>:
c0d082bc:	000e 0000 000e 0000 0001 0000 8298 c0d0     ................
c0d082cc:	82a0 c0d0 7273 2f63 6568 5578 6974 736c     ....src/hexUtils
c0d082dc:	632e 333a 0039 7273 2f63 6568 5578 6974     .c:39.src/hexUti
c0d082ec:	736c 632e 343a 0030 7273 2f63 6568 5578     ls.c:40.src/hexU
c0d082fc:	6974 736c 632e 343a 0031                    tils.c:41.

c0d08306 <HEX_ALPHABET>:
c0d08306:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0d08316:	7300 6372 682f 7865 7455 6c69 2e73 3a63     .src/hexUtils.c:
c0d08326:	3834 7300 6372 692f 326f 632e 323a 0030     48.src/io2.c:20.
c0d08336:	7273 2f63 6f69 2e32 3a63 3132 7300 6372     src/io2.c:21.src
c0d08346:	692f 326f 632e 343a 0032 7273 2f63 6f69     /io2.c:42.src/io
c0d08356:	2e32 3a63 3334 7300 6372 692f 326f 632e     2.c:43.src/io2.c
c0d08366:	383a 0031 7273 2f63 656b 4479 7265 7669     :81.src/keyDeriv
c0d08376:	7461 6f69 2e6e 3a63 3931 5700 6961 6974     ation.c:19.Waiti
c0d08386:	676e 6620 726f 6300 6d6f 616d 646e 2e73     ng for.commands.
c0d08396:	2e2e 4100 6f62 7475 5100 6975 2074 7061     ...About.Quit ap
c0d083a6:	0070 6556 7372 6f69 006e 2e31 2e30 0035     p.Version.1.0.5.
c0d083b6:	6142 6b63 0000                              Back..

c0d083bc <menu_about>:
	...
c0d083cc:	83a8 c0d0 83b0 c0d0 0000 0000 8410 c0d0     ................
	...
c0d083e4:	8284 c0d0 83b6 c0d0 0000 0000 283d 0000     ............=(..
	...

c0d08410 <menu_main>:
	...
c0d08420:	8381 c0d0 838d c0d0 0000 0000 83bc c0d0     ................
	...
c0d0843c:	8399 c0d0 0000 0000 0000 0000 0000 0000     ................
c0d0844c:	2c47 c0d0 0000 0000 82bc c0d0 839f c0d0     G,..............
c0d0845c:	0000 0000 1d32 0000 0000 0000 0000 0000     ....2...........
	...

c0d08480 <seph_io_general_status>:
c0d08480:	0060 0002                                    `....

c0d08485 <seph_io_se_reset>:
c0d08485:	0046                                         F..

c0d08488 <g_pcHex>:
c0d08488:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef

c0d08498 <g_pcHex_cap>:
c0d08498:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
c0d084a8:	6843 6961 006e 7273 2f63 6973 6e67 7254     Chain.src/signTr
c0d084b8:	6e61 6173 7463 6f69 2e6e 3a63 3833 0031     ansaction.c:381.
c0d084c8:	7273 2f63 6973 6e67 7254 6e61 6173 7463     src/signTransact
c0d084d8:	6f69 2e6e 3a63 3833 0032 7273 2f63 6973     ion.c:382.src/si
c0d084e8:	6e67 7254 6e61 6173 7463 6f69 2e6e 3a63     gnTransaction.c:
c0d084f8:	3833 0033 7273 2f63 6973 6e67 7254 6e61     383.src/signTran
c0d08508:	6173 7463 6f69 2e6e 3a63 3833 0035 7273     saction.c:385.sr
c0d08518:	2f63 6973 6e67 7254 6e61 6173 7463 6f69     c/signTransactio
c0d08528:	2e6e 3a63 3833 0036 7273 2f63 6973 6e67     n.c:386.src/sign
c0d08538:	7254 6e61 6173 7463 6f69 2e6e 3a63 3134     Transaction.c:41
c0d08548:	0033 7273 2f63 6973 6e67 7254 6e61 6173     3.src/signTransa
c0d08558:	7463 6f69 2e6e 3a63 3234 0035 7273 2f63     ction.c:425.src/
c0d08568:	6973 6e67 7254 6e61 6173 7463 6f69 2e6e     signTransaction.
c0d08578:	3a63 3136 0032 7273 2f63 6973 6e67 7254     c:612.src/signTr
c0d08588:	6e61 6173 7463 6f69 2e6e 3a63 3136 0033     ansaction.c:613.
c0d08598:	7273 2f63 6973 6e67 7254 6e61 6173 7463     src/signTransact
c0d085a8:	6f69 2e6e 3a63 3136 0034 7273 2f63 6973     ion.c:614.src/si
c0d085b8:	6e67 7254 6e61 6173 7463 6f69 2e6e 3a63     gnTransaction.c:
c0d085c8:	3037 0031 7273 2f63 6973 6e67 7254 6e61     701.src/signTran
c0d085d8:	6173 7463 6f69 2e6e 3a63 3337 0033 7273     saction.c:733.sr
c0d085e8:	2f63 6973 6e67 7254 6e61 6173 7463 6f69     c/signTransactio
c0d085f8:	2e6e 3a63 3131 3630 7300 6372 682f 7361     n.c:1106.src/has
c0d08608:	2e68 3a68 3333 7300 6372 732f 6769 546e     h.h:33.src/signT
c0d08618:	6172 736e 6361 6974 6e6f 632e 313a 3131     ransaction.c:111
c0d08628:	7300 6372 732f 6769 546e 6172 736e 6361     .src/signTransac
c0d08638:	6974 6e6f 632e 363a 3934 4500 636e 7972     tion.c:649.Encry
c0d08648:	7470 6e69 0067 7273 2f63 6973 6e67 7254     pting.src/signTr
c0d08658:	6e61 6173 7463 6f69 2e6e 3a63 3539 7300     ansaction.c:95.s
c0d08668:	6372 732f 6769 546e 6172 736e 6361 6974     rc/signTransacti
c0d08678:	6e6f 632e 373a 3536 4500 636e 7972 7470     on.c:765.Encrypt
c0d08688:	6320 6e6f 6574 746e 003f 7273 2f63 6168      content?.src/ha
c0d08698:	6873 682e 343a 0036 7273 2f63 6168 6873     sh.h:46.src/hash
c0d086a8:	682e 343a 0037 7273 2f63 6973 6e67 7254     .h:47.src/signTr
c0d086b8:	6e61 6173 7463 6f69 2e6e 3a63 3838 0035     ansaction.c:885.
c0d086c8:	6953 6e67 7400 6172 736e 6361 6974 6e6f     Sign.transaction
c0d086d8:	003f 0000 6854 6965 2072 7550 6c62 6369     ?...Their Public
c0d086e8:	4b20 7965 0000 0000 754f 2072 7550 6c62      Key....Our Publ
c0d086f8:	6369 4b20 7965 0000 6953 6e67 7720 7469     ic Key..Sign wit
c0d08708:	0068                                        h.

c0d0870a <SECP256K1_N>:
c0d0870a:	ffff ffff ffff ffff ffff ffff ffff feff     ................
c0d0871a:	aeba e6dc 48af 3ba0 d2bf 8c5e 36d0 4141     .....H.;..^..6AA
c0d0872a:	7273 2f63 6973 6e67 7254 6e61 6173 7463     src/signTransact
c0d0873a:	6f69 436e 756f 746e 6465 6553 7463 6f69     ionCountedSectio
c0d0874a:	2e6e 3a63 3731 7300 6372 732f 6769 546e     n.c:17.src/signT
c0d0875a:	6172 736e 6361 6974 6e6f 6f43 6e75 6574     ransactionCounte
c0d0876a:	5364 6365 6974 6e6f 632e 333a 0033 7273     dSection.c:33.sr
c0d0877a:	2f63 6973 6e67 7254 6e61 6173 7463 6f69     c/signTransactio
c0d0878a:	436e 756f 746e 6465 6553 7463 6f69 2e6e     nCountedSection.
c0d0879a:	3a63 3433 7300 6372 732f 6769 546e 6172     c:34.src/signTra
c0d087aa:	736e 6361 6974 6e6f 6f43 6e75 6574 5364     nsactionCountedS
c0d087ba:	6365 6974 6e6f 632e 353a 0033 7273 2f63     ection.c:53.src/
c0d087ca:	6973 6e67 7254 6e61 6173 7463 6f69 436e     signTransactionC
c0d087da:	756f 746e 6465 6553 7463 6f69 2e6e 3a63     ountedSection.c:
c0d087ea:	3435 7300 6372 732f 6769 546e 6172 736e     54.src/signTrans
c0d087fa:	6361 6974 6e6f 6f43 6e75 6574 5364 6365     actionCountedSec
c0d0880a:	6974 6e6f 632e 373a 0033 7273 2f63 6973     tion.c:73.src/si
c0d0881a:	6e67 7254 6e61 6173 7463 6f69 496e 746e     gnTransactionInt
c0d0882a:	6765 6972 7974 632e 333a 3231 7300 6372     egrity.c:312.src
c0d0883a:	732f 6769 546e 6172 736e 6361 6974 6e6f     /signTransaction
c0d0884a:	6e49 6574 7267 7469 2e79 3a63 3333 0039     Integrity.c:339.

c0d0885a <allowedHashes>:
c0d0885a:	0b72 b929 06b7 acaa 35dd aea7 deef 5925     r.)......5....%Y
c0d0886a:	551a 0646 5416 7882 1684 e183 d7f0 7398     .UF..T.x.......s
c0d0887a:	0b72 b929 06b7 acaa 35dd aea7 deef 5925     r.)......5....%Y
c0d0888a:	551a 0646 5416 7882 1684 e183 d7f0 7398     .UF..T.x.......s
c0d0889a:	0b72 b929 06b7 acaa 35dd aea7 deef 5925     r.)......5....%Y
c0d088aa:	551a 0646 5416 7882 1684 e183 d7f0 7398     .UF..T.x.......s
c0d088ba:	0b72 b929 06b7 acaa 35dd aea7 deef 5925     r.)......5....%Y
c0d088ca:	551a 0646 5416 7882 1684 e183 d7f0 7398     .UF..T.x.......s
c0d088da:	6804 096b 1df5 b068 0d8a 6f0c 1aac 3753     .hk...h....o..S7
c0d088ea:	e405 8a02 f086 2fc5 2cb9 092c 30e1 5209     ......./.,,..0.R
c0d088fa:	2723 5c7c 4825 a21d 97a8 f2a5 a3b7 1e66     #'|\%H........f.
c0d0890a:	d735 9089 ad61 009b c291 3053 6bb2 ca42     5...a.....S0.kB.
c0d0891a:	6804 096b 1df5 b068 0d8a 6f0c 1aac 3753     .hk...h....o..S7
c0d0892a:	e405 8a02 f086 2fc5 2cb9 092c 30e1 5209     ......./.,,..0.R
c0d0893a:	2723 5c7c 4825 a21d 97a8 f2a5 a3b7 1e66     #'|\%H........f.
c0d0894a:	d735 9089 ad61 009b c291 3053 6bb2 ca42     5...a.....S0.kB.
c0d0895a:	6804 096b 1df5 b068 0d8a 6f0c 1aac 3753     .hk...h....o..S7
c0d0896a:	e405 8a02 f086 2fc5 2cb9 092c 30e1 5209     ......./.,,..0.R
c0d0897a:	2723 5c7c 4825 a21d 97a8 f2a5 a3b7 1e66     #'|\%H........f.
c0d0898a:	d735 9089 ad61 009b c291 3053 6bb2 ca42     5...a.....S0.kB.
c0d0899a:	6804 096b 1df5 b068 0d8a 6f0c 1aac 3753     .hk...h....o..S7
c0d089aa:	e405 8a02 f086 2fc5 2cb9 092c 30e1 5209     ......./.,,..0.R
c0d089ba:	2723 5c7c 4825 a21d 97a8 f2a5 a3b7 1e66     #'|\%H........f.
c0d089ca:	d735 9089 ad61 009b c291 3053 6bb2 ca42     5...a.....S0.kB.
c0d089da:	b3b9 496e c2e5 9eac d727 d1bf 336c a4db     ..nI....'...l3..
c0d089ea:	3679 6fc3 aca2 dc28 d89e 5ba8 3367 446f     y6.o..(....[g3oD
c0d089fa:	d990 f7dd 880d c232 b28a b2a8 aed5 2108     ......2........!
c0d08a0a:	c654 76cf 774e 225e 34de 1063 604b 73d4     T..vNw^".4c.K`.s
c0d08a1a:	b3b9 496e c2e5 9eac d727 d1bf 336c a4db     ..nI....'...l3..
c0d08a2a:	3679 6fc3 aca2 dc28 d89e 5ba8 3367 446f     y6.o..(....[g3oD
c0d08a3a:	d990 f7dd 880d c232 b28a b2a8 aed5 2108     ......2........!
c0d08a4a:	c654 76cf 774e 225e 34de 1063 604b 73d4     T..vNw^".4c.K`.s
c0d08a5a:	b3b9 496e c2e5 9eac d727 d1bf 336c a4db     ..nI....'...l3..
c0d08a6a:	3679 6fc3 aca2 dc28 d89e 5ba8 3367 446f     y6.o..(....[g3oD
c0d08a7a:	d990 f7dd 880d c232 b28a b2a8 aed5 2108     ......2........!
c0d08a8a:	c654 76cf 774e 225e 34de 1063 604b 73d4     T..vNw^".4c.K`.s
c0d08a9a:	b3b9 496e c2e5 9eac d727 d1bf 336c a4db     ..nI....'...l3..
c0d08aaa:	3679 6fc3 aca2 dc28 d89e 5ba8 3367 446f     y6.o..(....[g3oD
c0d08aba:	d990 f7dd 880d c232 b28a b2a8 aed5 2108     ......2........!
c0d08aca:	c654 76cf 774e 225e 34de 1063 604b 73d4     T..vNw^".4c.K`.s
c0d08ada:	0fab ce5c af2f 906b f393 beb5 6aa9 a774     ..\./.k......jt.
c0d08aea:	d270 6891 1ff7 3de5 7419 a5f7 3910 c163     p..h...=.t...9c.
c0d08afa:	7330 ed00 108d 2465 a37f 2add 7c1b a890     0s....e$...*.|..
c0d08b0a:	6fb2 adaf f7b6 5fa7 9291 e597 b1f1 9621     .o....._......!.
c0d08b1a:	0213 a04a eaa0 c870 5211 672d 4117 8ccd     ..J...p..R-g.A..
c0d08b2a:	f64e 3180 4d7c a05c faf2 4b3c 85b1 cdc5     N..1|M\...<K....
c0d08b3a:	268e 9484 d840 f9cd 1ad0 1708 0baa 3357     .&..@.........W3
c0d08b4a:	48f6 1ff0 fdea b451 3dac ad18 3f87 a4b9     .H....Q..=...?..
c0d08b5a:	9cf6 0fe5 df3c 1ea4 7e00 b0f3 c429 c73b     ....<....~..).;.
c0d08b6a:	3e92 78b3 7d71 96ed 411c 4c5a 5082 a1c9     .>.xq}...AZL.P..
c0d08b7a:	a8e7 edd4 d282 3260 5a54 c6c2 7373 f5fb     ......`2TZ..ss..
c0d08b8a:	a6fa 2f8f b8b4 e391 11e8 ca6a bf08 e159     .../......j...Y.
c0d08b9a:	e526 0f21 c88f 8e77 24b7 3297 a220 85bc     &.!...w..$.2 ...
c0d08baa:	11be b810 8d39 7ed2 3a9d afbc 1a58 7948     ....9..~.:..X.Hy
c0d08bba:	a6e0 d106 b334 fdbf 6f72 f769 a5d1 7868     ....4...roi...hx
c0d08bca:	add8 6615 1ed4 30dc be1d 09ea f182 0b3d     ...f...0......=.
c0d08bda:	ccd6 6005 a9fd 557d 49b2 2a4e 1359 e4e3     ...`..}U.IN*Y...
c0d08bea:	f73c 5e3e 3d28 e415 2d68 3e23 9b7c 630b     <.>^(=..h-#>|..c
c0d08bfa:	f3b5 5fed 4834 a35d 93a4 f010 8d09 71fb     ..._4H]........q
c0d08c0a:	5e34 6a0f 42c8 c016 b9e1 11ed 7c09 3022     4^.j.B.......|"0
c0d08c1a:	193b 63b4 bacd 75d4 7876 9203 ae17 ead5     ;..c...uvx......
c0d08c2a:	e113 abe8 c8c8 7b35 c850 5cef 2e1c 72e1     ......5{P..\...r
c0d08c3a:	3139 1ca7 8e07 285e 9020 253e 81e1 ea8f     91....^( .>%....
c0d08c4a:	da46 d916 56d2 91f3 5a7e 5be4 7394 df45     F....V..~Z.[.sE.
c0d08c5a:	a0ea 50ae 1058 4b80 1e52 0b91 64c9 73ad     ...PX..KR....d.s
c0d08c6a:	d976 fa37 ab33 1fcf 71f8 f950 eaba 2d4b     v.7.3....qP...K-
c0d08c7a:	12eb c264 a690 0978 56e1 06df d615 7e64     ..d...x..V....d~
c0d08c8a:	b947 9592 2b92 4051 c9e8 7f82 4f68 fce6     G....+Q@....hO..
c0d08c9a:	6262 4f11 75ad 7696 657f d043 9161 1d35     bb.O.u.v.eC.a.5.
c0d08caa:	bf6e d664 1c94 bb25 c159 e526 ce94 cf89     n.d...%.Y.&.....
c0d08cba:	4d68 1b19 18ec 3a69 2ac2 e379 e5bc c6a4     hM....i:.*y.....
c0d08cca:	a5e1 fdb3 046e 33b0 2fd4 1be6 515d 807b     ....n..3./..]Q{.
c0d08cda:	f1f7 cce3 bcda 9c21 efb7 45be 876c 59f3     ......!....El..Y
c0d08cea:	c976 0d9c ace9 9310 da46 911f 78d3 531b     v.......F....x.S
c0d08cfa:	7d04 0485 b9b6 5121 7d19 c920 9fe7 81c1     .}....!Q.} .....
c0d08d0a:	e43e d5a0 1da2 363c 8966 1a01 e971 8a2a     >.....<6f...q.*.
c0d08d1a:	7547 26d1 4ba4 9548 842d 435e 7e06 136b     Gu.&.KH.-.^C.~k.
c0d08d2a:	6f42 77dd 2555 6a9d 7ffc c083 c282 4ceb     Bo.wU%.j.......L
c0d08d3a:	4452 4f21 f979 27ba 349e fbd4 1335 c47f     RD!Oy..'.4..5...
c0d08d4a:	e606 7dc7 5199 d47e 7dd2 978e 1cf8 5434     ...}.Q~..}....4T
c0d08d5a:	73f8 bd29 2dc7 8daf acdb 28ac 24ea e17a     .s)..-.....(.$z.
c0d08d6a:	821a 4797 9b4f 8659 27cb f9e5 1d99 43f1     ...GO.Y..'.....C
c0d08d7a:	262d 417c 32f6 9127 7610 3996 0f57 f5e3     -&|A.2'..v.9W...
c0d08d8a:	9b56 a381 c902 461d 1995 260b 603b e4f0     V......F...&;`..
c0d08d9a:	1e2f a24e 4881 015e 1b55 204f 7b56 2797     /.N..H^.U.O V{.'
c0d08daa:	aeba 60ad b65f d783 4a37 060d a0eb bbf8     ...`_...7J......
c0d08dba:	85e4 6122 3b22 05a3 a042 0db6 bf73 cdf9     .."a";..B...s...
c0d08dca:	6a82 9b9c 7074 5c47 8061 2531 a946 214f     .j..tpG\a.1%F.O!
c0d08dda:	eff2 69c6 058f 1436 568b 431d 22b2 42fb     ...i..6..V.C.".B
c0d08dea:	1fb9 d88d 0783 ffb7 0987 f147 61b8 bb52     ..........G..aR.
c0d08dfa:	fb21 5021 7bd1 06a2 e74b a852 ca1f df68     !.!P.{..K.R...h.
c0d08e0a:	6260 eb43 3c75 9d56 1097 24c4 ba20 4df4     `bC.u<V....$ ..M
c0d08e1a:	2110 0624 ecf8 2bc1 4609 4c00 816c 8201     .!$....+.F.Ll...
c0d08e2a:	c867 6881 8a5a 6a57 b17e f7b1 7b6a ae4b     g..hZ.Wj~...j{K.
c0d08e3a:	19b8 106b 4b79 e13f b350 dba1 740f 82d3     ..k.yK?.P....t..
c0d08e4a:	6ca1 dbad 0db1 20d0 adc2 748e b1be b49f     .l..... ...t....
c0d08e5a:	1ea8 c54e 1ea9 4d6b 33e2 1f46 bffd 843c     ..N...kM.3F...<.
c0d08e6a:	5577 1fcb dd64 dc17 35e6 b9b4 7de7 dc27     wU..d....5...}'.
c0d08e7a:	9584 8442 8b3c d800 2c9c a017 6672 15f9     ..B.<....,..rf..
c0d08e8a:	0b08 f0c9 7c48 0901 2e15 7b42 8270 7a0d     ....H|....B{p..z
c0d08e9a:	1272 b53c c528 c467 45e3 1f56 74a9 cce3     r.<.(.g..EV..t..
c0d08eaa:	3387 9ebf c6e4 0b37 778f e37c a1a3 a302     .3....7..w|.....
c0d08eba:	92bd 8494 aa09 8e7b edc0 073a a381 3271     ......{...:...q2
c0d08eca:	5dec 02da 3f54 2ce7 b5ed c0e8 5ab9 38dd     .]..T?.,.....Z.8
c0d08eda:	00fd 4710 471a d1ad 015b cf5d d412 20ba     ...G.G..[.].... 
c0d08eea:	7d12 6ad6 3799 57de 6a79 3f30 92c3 8645     .}.j.7.Wyj0?..E.
c0d08efa:	3b4c e90f 9089 01d3 21ac 6f87 f136 743c     L;.......!.o6.<t
c0d08f0a:	ade0 6e9d b62b 225a 7864 ca04 a115 fc8c     ...n+.Z"dx......
c0d08f1a:	b9bf 5178 2d6e 0e39 9960 1618 357b eae3     ..xQn-9.`...{5..
c0d08f2a:	6ca5 1085 797a e331 72c3 463d b14a 6a40     .l..zy1..r=FJ.@j
c0d08f3a:	5f41 8345 b37a 54bf 6a4c 99a0 fb48 9a93     A_E.z..TLj..H...
c0d08f4a:	9fa9 604e 2561 a3ea 3ee3 60ca a9de 8ece     ..N`a%...>.`....
c0d08f5a:	a3fd 8ee5 9232 a4b9 176c 3480 f887 cdaf     ....2...l..4....
c0d08f6a:	e5a8 911e 2fbd 8e89 e81e 4830 8da8 bcd7     ...../....0H....
c0d08f7a:	089c 074d 168a 656f d8ca 5a80 6f82 28e3     ..M...oe...Z.o.(
c0d08f8a:	1318 ee88 d7c4 2faf 1bda a0e9 74f3 6001     ......./.....t.`
c0d08f9a:	7722 7467 049f b0fd 4a1b 879e 3caa a635     "wgt.....J...<5.
c0d08faa:	f1c3 62b8 d9b1 3312 5543 e82d 7d25 aa7c     ...b...3CU-.%}|.
c0d08fba:	8f53 e7c3 10cc 0426 e71c fd08 f09a 8af8     S.....&.........
c0d08fca:	c406 0462 d0a5 fd7c 99d4 bd30 9829 8e59     ..b...|...0.).Y.
c0d08fda:	c923 25ce 0af6 61d3 4265 86cd 76b6 4773     #..%...aeB...vsG
c0d08fea:	f27f 4514 012b 9666 ed35 f782 f11a 305d     ...E+.f.5.....]0
c0d08ffa:	34ac b297 ebd8 d394 4622 2e08 283f b309     .4......"F..?(..
c0d0900a:	1a40 8ff0 307d 831a 7bd7 13bc a27c 5cde     @...}0...{..|..\
c0d0901a:	8092 f045 ab68 8362 9bfd af55 af83 9f5f     ..E.h.b...U..._.
c0d0902a:	928b b14c 2db6 1a12 46e9 0fa0 d50f 824c     ..L..-...F....L.
c0d0903a:	a054 88de bd10 676f fc14 0dd1 b993 07e7     T.....og........
c0d0904a:	1428 ab2d 5c50 8312 87dc 52b5 026a 61f9     (.-.P\.....Rj..a
c0d0905a:	d6f5 37f2 66b4 e356 baca 01ac 4c50 a697     ...7.fV.....PL..
c0d0906a:	b72b 4514 54b6 187c b729 4fde aef3 02fd     +..E.T|.)..O....
c0d0907a:	6f81 d957 977d c63f 6130 5b79 2d26 2257     .oW.}.?.0ay[&-W"
c0d0908a:	e7e8 8ddc b2bf 51ab 4b15 577b 7052 2ddc     .......Q.K{WRp.-
c0d0909a:	aea9 7f65 822c 2b95 45ab 8531 e443 5912     ..e.,..+.E1.C..Y
c0d090aa:	4e45 102c 139c bee6 1e2a 0a97 face 13c6     EN,.....*.......
c0d090ba:	320f 3e00 48a4 dfc1 e821 ecf4 ae4e 687a     .2.>.H..!...N.zh
c0d090ca:	6836 200a a0b5 2cd5 26ec 952c 5004 07f9     6h. ...,.&,..P..
c0d090da:	285a 55c1 77fe 0653 97e7 1fcd e565 bebe     Z(.U.wS.....e...
c0d090ea:	496a 0ddd 10ce 1004 cbf2 ade0 d7a4 660d     jI.............f
c0d090fa:	1689 a345 26ad dce6 b9c6 b344 7c74 e776     ..E..&....D.t|v.
c0d0910a:	560e 39b8 75e5 48e5 3223 b293 bf7c ad44     .V.9.u.H#2..|.D.
c0d0911a:	f20c 0e4f eb34 ae55 60a2 4655 4ea3 0d48     ..O.4.U..`UF.NH.
c0d0912a:	34b8 2a58 6280 07c3 7665 3465 e9e6 6945     .4X*.b..eve4..Ei
c0d0913a:	4e80 2d3b 0bea 7b2c fb06 b50c fc63 f166     .N;-..,{....c.f.
c0d0914a:	950c 0ed0 6567 98a8 a8a3 1ee0 5eeb 3c65     ....ge.......^e<
c0d0915a:	12a2 f784 4ed7 3b24 7cbd 0361 8bbe ebeb     .....N$;.|a.....
c0d0916a:	44de f209 d25c 9008 031d aff2 22a3 b1bc     .D..\........"..
c0d0917a:	d685 4e13 0c7e 9c78 8b59 3d42 57a8 533e     ...N~.x.Y.B=.W>S
c0d0918a:	82b0 c9cb 0103 62e9 01bd 7355 a040 d9c6     .......b..Us@...
c0d0919a:	caaf 50de f1ca 6c6f 0e6e 9bca 54da 227d     ...P..oln....T}"
c0d091aa:	04a4 1732 6398 6224 e437 7d09 1502 ed48     ..2..c$b7..}..H.
c0d091ba:	777c 799d 5ed4 5a49 b9d4 f68d b3b9 444b     |w.y.^IZ......KD
c0d091ca:	d35e 4a6a 9f36 d71f 5b1a 19ec d945 396c     ^.jJ6....[..E.l9
c0d091da:	752e 74a8 cf8b 43dd b22d 1a58 c120 cd06     .u.t...C-.X. ...
c0d091ea:	6a76 6d55 29ac 6233 3f3e f472 f2af 201c     vjUm.)3b>?r.... 
c0d091fa:	b83a ceac 3b82 ff31 4ff5 9518 8219 eced     :....;1..O......
c0d0920a:	7682 4ade 4c91 c897 c418 90aa ae65 c199     .v.J.L......e...
c0d0921a:	032c 3b66 a8a4 e116 33d5 c9ed e453 b2e0     ,.f;.....3..S...
c0d0922a:	f1b5 fa9f 6148 dc62 20d2 c96e 8c46 cbe2     ....Hab.. n.F...
c0d0923a:	de4a 6167 a65f 6074 70a0 9e9b 0f81 7654     J.ga_.t`.p....Tv
c0d0924a:	6ae8 5bed bcaa 9604 5dc1 28eb 7cf5 25a5     .j.[.....].(.|.%
c0d0925a:	4df8 a3ac 93b0 32a7 2147 7e4c fbf1 0a99     .M.....2G!L~....
c0d0926a:	4fb5 6bf0 3b9d ac69 d973 f991 79df 4c54     .O.k.;i.s....yTL
c0d0927a:	2015 1ba0 148c 46c1 e22c 55cb 7c20 baef     . .....F,..U |..
c0d0928a:	776d 5f56 e1ec e9bf 600a a2f9 2de1 f833     mwV_.....`...-3.
c0d0929a:	b897 c4d1 1889 bc9b c6cb 8eb1 0c54 73ba     ............T..s
c0d092aa:	d237 8fe3 3e04 ad98 7eb9 ba6d aeaa a0ef     7....>...~m.....
c0d092ba:	7273 2f63 6973 6e67 7254 6e61 6173 7463     src/signTransact
c0d092ca:	6f69 506e 7261 6573 632e 313a 0036 7273     ionParse.c:16.sr
c0d092da:	2f63 6973 6e67 7254 6e61 6173 7463 6f69     c/signTransactio
c0d092ea:	506e 7261 6573 632e 353a 0034 7273 2f63     nParse.c:54.src/
c0d092fa:	6973 6e67 7254 6e61 6173 7463 6f69 506e     signTransactionP
c0d0930a:	7261 6573 632e 313a 3139 7300 6372 732f     arse.c:191.src/s
c0d0931a:	6769 546e 6172 736e 6361 6974 6e6f 6150     ignTransactionPa
c0d0932a:	7372 2e65 3a63 3931 0037 7273 2f63 6973     rse.c:197.src/si
c0d0933a:	6e67 7254 6e61 6173 7463 6f69 506e 7261     gnTransactionPar
c0d0934a:	6573 632e 313a 3135 2500 2a2e 3a73 2e25     se.c:151.%.*s:%.
c0d0935a:	732a 253a 2a2e 0073 0000 4f4e 2054 4d49     *s:%.*s...NOT IM
c0d0936a:	4c50 4d45 4e45 4554 0044 7273 2f63 6574     PLEMENTED.src/te
c0d0937a:	7478 7455 6c69 2e73 3a63 3231 7300 6372     xtUtils.c:12.src
c0d0938a:	742f 7865 5574 6974 736c 632e 323a 0032     /textUtils.c:22.
c0d0939a:	7273 2f63 6574 7478 7455 6c69 2e73 3a63     src/textUtils.c:
c0d093aa:	3532 7300 6372 742f 7865 5574 6974 736c     25.src/textUtils
c0d093ba:	632e 333a 0031 7273 2f63 6574 7478 7455     .c:31.src/textUt
c0d093ca:	6c69 2e73 3a63 3333 2000 4946 004f 7325     ils.c:33. FIO.%s
c0d093da:	7300 6372 742f 7865 5574 6974 736c 632e     .src/textUtils.c
c0d093ea:	353a 0036 7273 2f63 6574 7478 7455 6c69     :56.src/textUtil
c0d093fa:	2e73 3a63 3236 7300 6372 742f 7865 5574     s.c:62.src/textU
c0d0940a:	6974 736c 632e 373a 0032 7273 2f63 6574     tils.c:72.src/te
c0d0941a:	7478 7455 6c69 2e73 3a63 3139 7300 6372     xtUtils.c:91.src
c0d0942a:	742f 7865 5574 6974 736c 632e 393a 0038     /textUtils.c:98.
c0d0943a:	7273 2f63 6975 6548 706c 7265 2e73 3a63     src/uiHelpers.c:
c0d0944a:	3932 7300 6372 752f 4869 6c65 6570 7372     29.src/uiHelpers
c0d0945a:	632e 333a 0033 7273 2f63 6975 6548 706c     .c:33.src/uiHelp
c0d0946a:	7265 2e73 3a63 3934 7300 6372 752f 4869     ers.c:49.src/uiH
c0d0947a:	6c65 6570 7372 632e 363a 0036 7273 2f63     elpers.c:66.src/
c0d0948a:	6975 6548 706c 7265 2e73 3a63 3331 0038     uiHelpers.c:138.
c0d0949a:	7273 2f63 6975 6548 706c 7265 2e73 3a63     src/uiHelpers.c:
c0d094aa:	3331 0039 7273 2f63 6975 6548 706c 7265     139.src/uiHelper
c0d094ba:	2e73 3a63 3531 0031 7273 2f63 6975 6548     s.c:151.src/uiHe
c0d094ca:	706c 7265 2e73 3a63 3731 0034 7273 2f63     lpers.c:174.src/
c0d094da:	6975 6548 706c 7265 2e73 3a63 3731 0035     uiHelpers.c:175.
c0d094ea:	7273 2f63 6975 6548 706c 7265 2e73 3a63     src/uiHelpers.c:
c0d094fa:	3931 0030 7273 2f63 6975 6548 706c 7265     190.src/uiHelper
c0d0950a:	5f73 616e 6f6e 2e73 3a63 3038 7300 6372     s_nanos.c:80.src
c0d0951a:	752f 4869 6c65 6570 7372 6e5f 6e61 736f     /uiHelpers_nanos
c0d0952a:	632e 383a 0031 7273 2f63 6975 6548 706c     .c:81.src/uiHelp
c0d0953a:	7265 5f73 616e 6f6e 2e73 3a63 3031 0035     ers_nanos.c:105.
c0d0954a:	7273 2f63 6975 6548 706c 7265 5f73 616e     src/uiHelpers_na
c0d0955a:	6f6e 2e73 3a63 3031 0036 7273 2f63 6975     nos.c:106.src/ui
c0d0956a:	6548 706c 7265 5f73 616e 6f6e 2e73 3a63     Helpers_nanos.c:
c0d0957a:	3135 7300 6372 752f 4869 6c65 6570 7372     51.src/uiHelpers
c0d0958a:	6e5f 6e61 736f 632e 353a 0032 0000          _nanos.c:52...

c0d09598 <ui_busy>:
c0d09598:	0003 0000 0000 0080 0020 0000 0001 0000     ........ .......
c0d095a8:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0d095b8:	0007 0000 0014 0080 000c 0000 0000 0000     ................
c0d095c8:	ffff 00ff 0000 0000 800a 0000 8395 c0d0     ................

c0d095d8 <ui_prompt>:
c0d095d8:	0003 0000 0000 0080 0020 0000 0001 0000     ........ .......
c0d095e8:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0d095f8:	0405 0003 000c 0007 0007 0000 0000 0000     ................
c0d09608:	ffff 00ff 0000 0000 0000 0007 0000 0000     ................
c0d09618:	0305 0075 000d 0008 0006 0000 0000 0000     ..u.............
c0d09628:	ffff 00ff 0000 0000 0000 0006 0000 0000     ................
c0d09638:	0007 0000 000c 0080 000c 0000 0000 0000     ................
c0d09648:	ffff 00ff 0000 0000 800a 0000 09b2 2000     ............... 
c0d09658:	0007 0000 001a 0080 000c 0000 0000 0000     ................
c0d09668:	ffff 00ff 0000 0000 800a 0000 09d0 2000     ............... 

c0d09678 <ui_paginatedText>:
c0d09678:	0003 0000 0000 0080 0020 0000 0001 0000     ........ .......
c0d09688:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0d09698:	0105 0003 000c 0007 0007 0000 0000 0000     ................
c0d096a8:	ffff 00ff 0000 0000 0000 0009 0000 0000     ................
c0d096b8:	0205 0075 000d 0008 0006 0000 0000 0000     ..u.............
c0d096c8:	ffff 00ff 0000 0000 0000 000a 0000 0000     ................
c0d096d8:	0007 0000 000c 0080 000c 0000 0000 0000     ................
c0d096e8:	ffff 00ff 0000 0000 800a 0000 09b2 2000     ............... 
c0d096f8:	0007 0000 001a 0080 000c 0000 0000 0000     ................
c0d09708:	ffff 00ff 0000 0000 800a 0000 09d0 2000     ............... 
c0d09718:	7273 2f63 6975 6353 6572 6e65 2e73 3a63     src/uiScreens.c:
c0d09728:	3031 7300 6372 752f 5369 7263 6565 736e     10.src/uiScreens
c0d09738:	632e 313a 0031 7273 2f63 6975 6353 6572     .c:11.src/uiScre
c0d09748:	6e65 2e73 3a63 3034 7300 6372 752f 5369     ens.c:40.src/uiS
c0d09758:	7263 6565 736e 632e 343a 0031 7273 2f63     creens.c:41.src/
c0d09768:	6975 6353 6572 6e65 2e73 3a63 3234 7300     uiScreens.c:42.s
c0d09778:	6372 752f 5369 7263 6565 736e 632e 343a     rc/uiScreens.c:4
c0d09788:	0033 7273 2f63 6975 6353 6572 6e65 2e73     3.src/uiScreens.
c0d09798:	3a63 3934 7300 6372 752f 5369 7263 6565     c:49.src/uiScree
c0d097a8:	736e 632e 353a 0030 7273 2f63 6975 6353     ns.c:50.src/uiSc
c0d097b8:	6572 6e65 2e73 3a63 3835 7300 6372 752f     reens.c:58.src/u
c0d097c8:	5369 7263 6565 736e 632e 353a 0039 7273     iScreens.c:59.sr
c0d097d8:	2f63 6975 6353 6572 6e65 2e73 3a63 3336     c/uiScreens.c:63
c0d097e8:	7300 6372 752f 5369 7263 6565 736e 632e     .src/uiScreens.c
c0d097f8:	373a 0034 7273 2f63 6975 6353 6572 6e65     :74.src/uiScreen
c0d09808:	2e73 3a63 3537 7300 6372 752f 5369 7263     s.c:75.src/uiScr
c0d09818:	6565 736e 632e 373a 0036 7273 2f63 6975     eens.c:76.src/ui
c0d09828:	6353 6572 6e65 2e73 3a63 3837 0000 0000     Screens.c:78....

c0d09838 <USBD_HID_Desc>:
c0d09838:	2109 0111 0100 2222                          .!...."".

c0d09841 <HID_ReportDesc>:
c0d09841:	a006 09ff a101 0901 1503 2600 00ff 0875     ...........&..u.
c0d09851:	4095 0881 0409 0015 ff26 7500 9508 9140     .@......&..u..@.
c0d09861:	c008                                        ..

c0d09863 <C_usb_bos>:
c0d09863:	0f05 0039 1802 0510 3800 08b6 a934 a009     ..9......8..4...
c0d09873:	8b47 a0fd 8876 b615 0065 1e01 1c00 0510     G...v...e.......
c0d09883:	df00 dd60 89d8 c745 9c4c 65d2 9e9d 8a64     ..`...E.L..e..d.
c0d09893:	009f 0300 b206 7700                          .......w.

c0d0989c <HID_Desc>:
c0d0989c:	6d01 c0d0 6d11 c0d0 6d21 c0d0 6d31 c0d0     .m...m..!m..1m..
c0d098ac:	6d41 c0d0 6d51 c0d0 6d61 c0d0 6d71 c0d0     Am..Qm..am..qm..

c0d098bc <C_winusb_string_descriptor>:
c0d098bc:	0312 004d 0053 0046 0054 0031 0030 0030     ..M.S.F.T.1.0.0.
c0d098cc:	0077                                        w.

c0d098ce <C_winusb_guid>:
c0d098ce:	0092 0000 0100 0005 0001 0088 0000 0007     ................
c0d098de:	0000 002a 0044 0065 0076 0069 0063 0065     ..*.D.e.v.i.c.e.
c0d098ee:	0049 006e 0074 0065 0072 0066 0061 0063     I.n.t.e.r.f.a.c.
c0d098fe:	0065 0047 0055 0049 0044 0073 0000 0050     e.G.U.I.D.s...P.
c0d0990e:	0000 007b 0031 0033 0064 0036 0033 0034     ..{.1.3.d.6.3.4.
c0d0991e:	0030 0030 002d 0032 0043 0039 0037 002d     0.0.-.2.C.9.7.-.
c0d0992e:	0030 0030 0030 0034 002d 0030 0030 0030     0.0.0.4.-.0.0.0.
c0d0993e:	0030 002d 0034 0063 0036 0035 0036 0034     0.-.4.c.6.5.6.4.
c0d0994e:	0036 0037 0036 0035 0037 0032 007d 0000     6.7.6.5.7.2.}...
	...

c0d09960 <C_winusb_request_descriptor>:
c0d09960:	000a 0000 0000 0603 00b2 0008 0001 0000     ................
c0d09970:	00a8 0008 0002 0001 00a0 0014 0003 4957     ..............WI
c0d09980:	554e 4253 0000 0000 0000 0000 0000 0084     NUSB............
c0d09990:	0004 0007 002a 0044 0065 0076 0069 0063     ....*.D.e.v.i.c.
c0d099a0:	0065 0049 006e 0074 0065 0072 0066 0061     e.I.n.t.e.r.f.a.
c0d099b0:	0063 0065 0047 0055 0049 0044 0073 0000     c.e.G.U.I.D.s...
c0d099c0:	0050 007b 0043 0045 0038 0030 0039 0032     P.{.C.E.8.0.9.2.
c0d099d0:	0036 0034 002d 0034 0042 0032 0034 002d     6.4.-.4.B.2.4.-.
c0d099e0:	0034 0045 0038 0031 002d 0041 0038 0042     4.E.8.1.-.A.8.B.
c0d099f0:	0032 002d 0035 0037 0045 0044 0030 0031     2.-.5.7.E.D.0.1.
c0d09a00:	0044 0035 0038 0030 0045 0031 007d 0000     D.5.8.0.E.1.}...
c0d09a10:	0000 0000                                   ....

c0d09a14 <USBD_HID>:
c0d09a14:	6b81 c0d0 6baf c0d0 6af1 c0d0 0000 0000     .k...k...j......
c0d09a24:	0000 0000 6c05 c0d0 6c1d c0d0 0000 0000     .....l...l......
	...
c0d09a3c:	6e79 c0d0 6e79 c0d0 6e79 c0d0 6e89 c0d0     yn..yn..yn...n..

c0d09a4c <USBD_WEBUSB>:
c0d09a4c:	6c69 c0d0 6c95 c0d0 6c99 c0d0 0000 0000     il...l...l......
c0d09a5c:	0000 0000 6c9d c0d0 6cb5 c0d0 0000 0000     .....l...l......
	...
c0d09a74:	6e79 c0d0 6e79 c0d0 6e79 c0d0 6e89 c0d0     yn..yn..yn...n..

c0d09a84 <USBD_DeviceDesc>:
c0d09a84:	0112 0210 0000 4000 2c97 1011 0201 0201     .......@.,......
c0d09a94:	0103                                        ..

c0d09a96 <USBD_LangIDDesc>:
c0d09a96:	0304 0409                                   ....

c0d09a9a <USBD_MANUFACTURER_STRING>:
c0d09a9a:	030e 004c 0065 0064 0067 0065 0072          ..L.e.d.g.e.r.

c0d09aa8 <USBD_PRODUCT_FS_STRING>:
c0d09aa8:	030e 004e 0061 006e 006f 0020 0053          ..N.a.n.o. .S.

c0d09ab6 <USB_SERIAL_STRING>:
c0d09ab6:	030a 0030 0030 0030 0031                    ..0.0.0.1.

c0d09ac0 <C_winusb_wcid>:
c0d09ac0:	0028 0000 0100 0004 0001 0000 0000 0000     (...............
c0d09ad0:	0101 4957 554e 4253 0000 0000 0000 0000     ..WINUSB........
	...

c0d09ae8 <USBD_CfgDesc>:
c0d09ae8:	0209 0040 0102 c002 0932 0004 0200 0003     ..@.....2.......
c0d09af8:	0200 2109 0111 0100 2222 0700 8205 4003     ...!...."".....@
c0d09b08:	0100 0507 0302 0040 0901 0104 0200 ffff     ......@.........
c0d09b18:	02ff 0507 0383 0040 0701 0305 4003 0100     ......@......@..

c0d09b28 <USBD_DeviceQualifierDesc>:
c0d09b28:	060a 0200 0000 4000 0001 0000               .......@....

c0d09b34 <ux_menu_elements>:
c0d09b34:	8003 0000 0000 0080 0020 0000 0001 0000     ........ .......
c0d09b44:	0000 0000 ffff 00ff 0000 0000 0000 0000     ................
c0d09b54:	8105 0003 000e 0007 0004 0000 0000 0000     ................
c0d09b64:	ffff 00ff 0000 0000 0000 000b 0000 0000     ................
c0d09b74:	8205 0076 000e 0007 0004 0000 0000 0000     ..v.............
c0d09b84:	ffff 00ff 0000 0000 0000 000c 0000 0000     ................
c0d09b94:	4107 000e 0003 0064 000c 0000 0000 0000     .A....d.........
c0d09ba4:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0d09bb4:	4207 000e 0023 0064 000c 0000 0000 0000     .B..#.d.........
c0d09bc4:	ffff 00ff 0000 0000 800a 0000 0000 0000     ................
c0d09bd4:	1005 000e 0009 0000 0000 0000 0000 0000     ................
c0d09be4:	ffff 00ff 0000 0000 0000 0000 0000 0000     ................
c0d09bf4:	2007 000e 0013 0064 000c 0000 0000 0000     . ....d.........
c0d09c04:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................
c0d09c14:	2107 000e 000c 0064 000c 0000 0000 0000     .!....d.........
c0d09c24:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................
c0d09c34:	2207 000e 001a 0064 000c 0000 0000 0000     ."....d.........
c0d09c44:	ffff 00ff 0000 0000 8008 0000 0000 0000     ................

c0d09c54 <UX_MENU_END_ENTRY>:
	...

c0d09c70 <_etext>:
	...

	.thumb
	.syntax unified
vectors:
	.word zhanding
	.word kaishi + 1
	.equ zhanding, 0x20001000

kaishi:
__kai_pa_shi_zhong:	
	ldr r0, = 0x40021034
	movs r1, # 1
	str r1, [r0]
__pa_she_zhi:	
	ldr r0, = 0x50000000
	ldr r1, = 0xebfffffD
	str r1, [r0]

ting:
	movs r1, # 1
__led_kai:	
	str r1, [r0, # 0x18]
	ldr r2, = 0xfffff
__led_kai_yanshi:
	subs r2, r2, # 1
	bne __led_kai_yanshi
__led_guan:	
	str r1, [r0, # 0x28]
	ldr r2, = 0xfffff
__led_guan_yanshi:
	subs r2, r2, # 1
	bne __led_guan_yanshi
	b ting

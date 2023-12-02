	@@ 单片机PY32F002AF15P6TU
	@电池內阻测试仪(COG12864显示版)
	@时间：2023-08-28
	@编译器：ARM-NONE-EABI
	@__jisuan_cos_sin程序忘记加18000,导致校准角度有点问题，以后再修
	.thumb
	.syntax unified
	.section .text
vectors:	
	.word STACKINIT
	.word _start + 1
        .int 0x12345678	@f_chuchang_r,                
	.int 0x12345678	@f_chuchang_i,               
	.int 0x12345678	@f_jiaodu_r,                 
	.int 0x12345678	@f_jiaodu_i,                 
	.int 0x12345678	@f_r,                        
	.int 0x12345678	@f_mr,                     
	.word 0
	.word 0
	.word 0
	.word _svc_handler +1
	.word 0
	.word 0
	.word _pendsv_handler +1
	.word _systickzhongduan +1           @ 15
	.word aaa +1     @ _wwdg +1          @ 0
	.word aaa +1     @_pvd +1            @ 1
	.word aaa +1     @_rtc +1            @ 2
	.word aaa +1     @_flash +1          @ 3
	.word aaa +1    @ _rcc + 1           @ 4
	.word aaa +1      @_exti0_1  +1      @ 5
	.word aaa +1      @ _exti2_3 +1      @ 6
	.word aaa +1       @_exti4_15 +1     @ 7
	.word aaa +1                         @ 8
	.word aaa +1    @__dma_wan  +1       @ 9
	.word aaa +1    @_dma1_2_3 +1        @ 10
	.word aaa +1       @_dma1_4_5 +1     @ 11
	.word aaa +1     @_adc1 +1           @ 12
	.word aaa +1       @_tim1_brk_up +1  @ 13
	.word aaa +1        @ _tim1_cc +1    @ 14
	.word aaa +1         @_tim2 +1       @ 15
	.word aaa +1          @_tim3 +1      @ 16
	.word aaa +1     @LPTIM1               @ 17
	.word aaa +1                         @ 18
	.word aaa +1    @_tim14 +1           @ 19
	.word aaa +1                         @ 20
	.word aaa +1         @_tim16 +1      @ 21
	.word aaa +1         @_tim17 +1      @ 22
	.word aaa +1          @_i2c   +1     @ 23
	.word aaa +1                         @ 24
	.word aaa +1           @_spi1  +1    @ 25
	.word aaa +1           @_spi2  +1    @ 26
	.word aaa +1         @_usart1 +1     @ 27
	.word aaa +1	@_usart2 +1	     @ 28
	.word aaa +1				@29
	.word aaa +1	@led			@30
	.word aaa +1				@31
	.word 0
	.word 0
	.word 0
	.word 0
        .word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
xiang_liang_biao:
	.word STACKINIT
	.word _start + 1
	.word _nmi_handler + 1
	.word _hard_fault  + 1
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word _svc_handler +1
	.word 0
	.word 0
	.word _pendsv_handler +1
	.word _systickzhongduan +1           @ 15
	.word aaa +1     @ _wwdg +1          @ 0
	.word aaa +1     @_pvd +1            @ 1
	.word aaa +1     @_rtc +1            @ 2
	.word aaa +1     @_flash +1          @ 3
	.word aaa +1    @ _rcc + 1           @ 4
	.word aaa +1      @_exti0_1  +1      @ 5
	.word aaa +1      @ _exti2_3 +1      @ 6
	.word aaa +1       @_exti4_15 +1     @ 7
	.word aaa +1                         @ 8
	.word aaa +1    @__dma_wan  +1       @ 9
	.word aaa +1    @_dma1_2_3 +1        @ 10
	.word aaa +1       @_dma1_4_5 +1     @ 11
	.word aaa +1     @_adc1 +1           @ 12
	.word aaa +1       @_tim1_brk_up +1  @ 13
	.word aaa +1        @ _tim1_cc +1    @ 14
	.word aaa +1         @_tim2 +1       @ 15
	.word aaa +1          @_tim3 +1      @ 16
	.word aaa +1     @LPTIM1               @ 17
	.word aaa +1                         @ 18
	.word aaa +1    @_tim14 +1           @ 19
	.word aaa +1                         @ 20
	.word aaa +1         @_tim16 +1      @ 21
	.word aaa +1         @_tim17 +1      @ 22
	.word aaa +1          @_i2c   +1     @ 23
	.word aaa +1                         @ 24
	.word aaa +1           @_spi1  +1    @ 25
	.word aaa +1           @_spi2  +1    @ 26
	.word aaa +1         @_usart1 +1     @ 27
	.word aaa +1    @_usart2 +1          @ 28
	.word aaa +1                            @29
	.word aaa +1    @led                    @30
	.word aaa +1                            @31
	

_start:
@	bkpt # 0
	ldr r0, = 0xe000ed08
	ldr r1, = xiang_liang_biao
	str r1, [r0]	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	
shizhong:
	ldr r2, = 0x40022000   @FLASH访问控制
	movs r1, # 1
	str r1, [r2]          @0:flash没等待，1:flash等待
	ldr r0, = 0x40021000 @ rcc
	ldr r1, = 0x20008
	str r1, [r0, # 0x10]	@外部晶振选择
	ldr r1, [r0]
	ldr r2, = 0x10000
	orrs r1, r1, r2
	str r1, [r0]		@开外部振荡器
denghse:
	ldr r1, [r0]
	lsls r1, r1, # 14
	bpl denghse		@等外部振荡器
	
	ldr r1, = 0x01
	str r1, [r0, # 0x0c]	@PLL配置
	ldr r2, [r0]
	ldr r1, = 0x1000000
	orrs r1, r1, r2
	str r1, [r0]		@开PLL

dengpll:
	ldr r1, [r0]
	lsls r1, # 6
	bpl dengpll		@等PLL
	movs r1, # 0x02
	str r1, [r0, # 0x08]	@选择系统时钟
	
_neicunqingling:
	ldr r0, = 0x20001000
	ldr r2, = 0x20000000
	movs r1, # 0
_neicunqinglingxunhuan:
	subs r0, r0, # 4
	str r1, [r0]
	cmp r0, r2
	bne _neicunqinglingxunhuan
	
__wai_she_shi_zhong:
	@0x34
	@0=PA、1=PB、5=PF
	ldr r0, = 0x40021000
	movs r1, # 0x23
	str r1, [r0, # 0x34]	@IO时钟
	
	@0X38 复位值0x300
	@0=DMA，8=FLASH，12=CRC
	ldr r1, = 0x301
	str r1, [r0, # 0x38]

	@0X3C
	@1=TIM3,10=RTC，11=WWDG，14=SPI2,17=USART2,21=I2C，28=PWR，31=LPTIM
	movs r1, # 0x02
	str r1, [r0, # 0x3c]
	@0X40
	@0SYSCFG，11=TIM1,12=SPI1,14=USART1,15=TIM14,17=TIM16,18=TIM17,20=ADC
	@21=COMP1,22=COMP2,23=LED
	ldr r1, = 0x101801
	str r1, [r0, # 0x40]   
	str r1, [r0, # 0x30]
	movs r1, # 0
	str r1, [r0, # 0x30]
		
__io_she_zhi:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
	@pa=0x50000000,pb=0x50000400,pf=0x50001400
	@0xebffffff	0xffffffff	0xfffffcff
	@00=输入，01=通用输出，10=复用，11=模拟
	@0x04, 0=推挽，1=开漏
	@0x08, 00=非常低，01=低速，10=高速，11=非常高
	@PA=0X0C000000
	@0x0c, 00=无上拉下拉，01=上拉，10=下拉
	@PA=0X24000000,PB=0，PF=0X200
	@0x10=输入数据寄存器
	@0x14=输出数据寄存器
	@0X18，0-15 IO开，16-31 IO关
	@0X28, 0-15 IO关
	@0x20=复用功能低
	@0x24=复用功能高
	@0=AF0, 1=AF1，2=AF2，3=AF3，4=AF4, 5=AF5, 6=AF6, 7=AF7
	@8=AF8, 9=AF9, A=AF10,B=AF11,C=AF12,D=AF13,E=AF14,F=AF15
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	ldr r0, = 0x50000000
	ldr r1, = 0x2800890f
	str r1, [r0]
	movs r1, # 0x0c
	str r1, [r0, # 0x04]
	ldr r1, = 0x0c000050
	str r1, [r0, # 0x0c]
	ldr r1, = 0x0c000000
	str r1, [r0, # 0x08]

	
	str r1, [r0, # 0x08]
	ldr r0, = 0x50000400
	ldr r1, = 0xffffffbd
	str r1, [r0]
	movs r1, # 0xc0
	str r1, [r0, # 0x08]
	ldr r1, = 0x1000
	str r1, [r0, # 0x20]


spi_chushihua:
	ldr r0, = 0x40013000
	ldr r1, = 0x7c
	str r1, [r0]
	bl __lcd_chushihua
	bl __lcd_qingping
	
	ldr r0, = yjmwxwx
	movs r1, # 16           @显示几个字符
	ldr r2, = 0x0604         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii


__adc_dma:
	ldr r0, = 0x40020000
	ldr r1, = 0x40012440    @外设地址
	str r1, [r0, # 0x10]
	ldr r1, = 0x20000160    @储存器地址
	str r1, [r0, # 0x14]
	ldr r1, = 1000          @传输数量
	str r1, [r0, # 0x0c]
	ldr r1, = 0x35a1 @  0x583        @ 5a1  @传输模式
	str r1, [r0, # 0x08]

_adcchushihua:
	ldr r0, = 0x40012400  @ adc基地址
	ldr r1, = 0x80000000
	str r1, [r0, # 0x08]  @ ADC 控制寄存器 (ADC_CR)  @adc校准
_dengadcjiaozhun:
	ldr r1, [r0, # 0x08]
	movs r1, r1
	bmi _dengadcjiaozhun   @ 等ADC校准
_tongdaoxuanze:
	ldr r1, = 0x20000000
	str r1, [r0, # 0x10]    @时钟分频
	movs r1, # 0x03
	str r1, [r0, # 0x28]    @ 通道选择寄存器 (ADC_CHSELR)
	ldr r1, = 0x8c3         @0x3003         @连续0x2003 @触发0x8c3 @ 0xc43         @TIM3 0x8c3 @0x2003 @0x8c3
	str r1, [r0, # 0x0c]    @ 配置寄存器 1 (ADC_CFGR1)
	movs r1, # 0
	str r1, [r0, # 0x14]    @ ADC 采样时间寄存器 (ADC_SMPR)
	ldr r1, = 0x05         @ 开始转换
	str r1, [r0, # 0x08]    @ 控制寄存器 (ADC_CR)
	str r1, [r0, # 0x08]
	
	@__tim1_dma:
	@       ldr r0, = 0x40010000
	@       ldr r1, = 0x1000
	@       str r1, [r0, # 0x1c]
	@
	@       ldr r0, = 0x40020000
	@       ldr r1, = 0x40012c38    @外设地址
	@       str r1, [r0, # 0x24]
	@       ldr r1, =  zheng_xian_1khz @ 储存器地址
	@       str r1, [r0, # 0x28]
	@       ldr r1, = 200           @传输数量
	@       str r1, [r0, # 0x20]
	@       ldr r1, = 0x31b1        @传输模式
	@       str r1, [r0, # 0x1c]
	@
	@tim3chushihua:
	ldr r3, = 0x40000400 @ tim3_cr1
	ldr r2, = 0
	str r2, [r3, # 0x28] @ psc
	ldr r2, = 959
	str r2, [r3, # 0x2c] @ ARR
	movs r2, # 0x20
	str r2, [r3, # 0x04] @ TRGO

	@tim1chushiha:
	ldr r0, = 0x40012c00 @ tim1_cr1
	movs r1, # 0
	str r1, [r0, # 0x28] @ psc
	ldr r1, = 47999
	str r1, [r0, # 0x2c] @ ARR
	@       movs r1, # 0x20
	@       str r1, [r0, # 0x04] @ TRGO
	ldr r1, = 0x6800
	str r1, [r0, # 0x18] @ ccmr1  CC2
	ldr r1, = 0x10    @  CC2
	str r1, [r0, # 0x20] @ ccer
	ldr r1, = 0x8000
	str r1, [r0, # 0x44] @ BDTR
	@       ldr r1, = 0x100 @ CC2 DMA
	@       str r1, [r0, # 0x0c] @ DIER
	ldr r1, = 24000
	str r1, [r0, # 0x38]
	ldr r1, = 0x81
	str r1, [r0]
	str r1, [r3]
	ldr r4, = 0xe000e010
	ldr r3, = 479999
	str r3, [r4, # 4]
	str r3, [r4, # 8]
	movs r3, # 0x07
	str r3, [r4]    @systick 开

	ldr r0, = lvbo_changdu
	ldr r1, = lvbo_youyi
	movs r2, # 200
	str r2, [r0]
	movs r2, # 14
	str r2, [r1]

	ldr r0, = cossin
	ldr r1, = cos_sin_biao_1k
	str r1, [r0]


__huifu_chuchang:	
	ldr r0, = 0x8000008
	ldr r1, [r0]
	ldr r2, = 0x12345678
	cmp r2, r1
	bne __tiaoguo_chuchang_chushihua
	ldr r0, = chuchang_dianzu
	ldr r1, [r0]
	ldr r2, [r0, # 0x04]
	ldr r3, [r0, # 0x08]
	ldr r4, [r0, # 0x0c]
	ldr r5, [r0, # 0x10]
	ldr r6, [r0, # 0x14]
	ldr r7, [r0, # 0x18]
	ldr r0, = chuchang_r
	str r1, [r0]
	str r2, [r0, # 0x04]
	str r3, [r0, # 0x08]
	str r4, [r0, # 0x0c]
	str r5, [r0, # 0x10]
	str r6, [r0, # 0x14]
	str r7, [r0, # 0x18]
	bl __xie_flash
__tiaoguo_chuchang_chushihua:
	


	

__anjian0:
	b ting
	.ltorg
__anjian1:
__dangwei_jia_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	beq __dangwei_jia_le
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
        ldr r1, = f_r
	ldr r2, = f_chuchang_r
	bl __xianshi_neizu
	b __dangwei_jia_deng_songshou
__dangwei_jia_le:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	bne __anjian1_fanhui
	movs r1, # 0
	str r1, [r0]

__anjian1_fanhui:
	b __ren_wu_diao_du
	.ltorg
	
__anjian2:
__xianshi_jiaodu:
	ldr r2, = jiaodu
	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r0, [r0]
	ldr r1, [r1]
	bl __atan2_ji_suan
	asrs r0, r0, # 15
	str r0, [r2]
	bl __xianshi_j_d
	b __ren_wu_diao_du
	
__xianshi_j_d:
	push {r1-r4,lr}
        mov r4, r0
	movs r0, r0
	bpl __xian_shi_j_d
	mvns r0, r0
	adds r0, r0, # 1
	mov r4, r0
__j_d_shi_fu:
	ldr r0, = _fu
	movs r1, # 1           @显示几个字符
	ldr r2, = 0x0801         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_j_d1
__xian_shi_j_d:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	ldr r2, = 0x0801         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
__xianshi_j_d1:
	mov r0, r4
	movs r1, # 5
        ldr r2, = asciibiao
         movs r3, # 2            @小数点位置
	bl _zhuanascii
	movs r0, # 5            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, = 0x1100              @lcd位置
	bl __xie_lcd_ascii
	pop {r1-r4,pc}
	
__anjian3:
	bl __xianshi_jiaozhun_caidan
        bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	bne __anjian3
__anjian3_xunhuan:
        bl __xianshi_jiaozhun_caidan
	bl __an_jian
	cmp r0, # 1
	beq __jiaozhun_caidan_jia_deng_songshou
	cmp r0, # 2
	beq __jinru_jiaozhun_caidan_deng_songshou
	b __anjian3_xunhuan	
__jiaozhun_caidan_jia_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __tiaochu_anjian3
	cmp r0, # 0
	beq __jiaozhun_caidan_jia_le
	bl __xianshi_jiaozhun_caidan
	b __jiaozhun_caidan_jia_deng_songshou
__jiaozhun_caidan_jia_le:
	ldr r0, = jiaozhun_bianhao
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 3
	bne __anjian3_fanhui
	movs r1, # 0
	str r1, [r0]
__anjian3_fanhui:	
	b __anjian3_xunhuan
__tiaochu_anjian3:
	ldr r0, = wan
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	
        ldr r7, = 0xffffff
__yy1:
	subs r7, r7, # 1
	bne __yy1
	ldr r0, = kong
	movs r1, # 4           @显示几个字符
	ldr r2, = 0x06         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b ting
__xianshi_jiaozhun_caidan:
	push {r0-r2,lr}
	ldr r2, = jiaozhun_bianhao
	ldr r0, = p0
	ldrb r2, [r2]
	lsls r2, r2, # 2
	adds r0, r0, r2
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	pop {r0-r2,pc}

__jinru_jiaozhun_caidan_deng_songshou:
	bl __an_jian
	cmp r0, # 3
	beq __anjian3
	cmp r0, # 0
	beq __jinru_jiaozhun_caidan
	bl __xianshi_jiaozhun_caidan
	b __jinru_jiaozhun_caidan_deng_songshou
	
__jinru_jiaozhun_caidan:
	ldr r0, = jiaozhun_bianhao
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = jiaozhun_biao
	ldr r2, [r1, r0]
	mov pc, r2
	
__qingling:
	ldr r0, = p0jz
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
__duanlu_qingling:
	bl __duanlu_qingling_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __qingling_jia
	cmp r0, # 2
	beq __qingling_jian
	b __duanlu_qingling
__qingling_jia:
	bl __an_jian
	cmp r0, # 3
	beq __qingling_baocun
	cmp r0, # 0
	beq __qingling_jiale
	bl __duanlu_qingling_xianshi
	b __qingling_jia
__qingling_jiale:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = r
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __duanlu_qingling
__qingling_jian:
	bl __an_jian
	cmp r0, # 3
	beq __qingling_baocun
	cmp r0, # 0
	beq __qingling_jianle
	bl __duanlu_qingling_xianshi
	b __qingling_jian
__qingling_jianle:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = r
	ldr r2, [r1, r0]
	subs r2, r2, # 1
	str r2, [r1, r0]
	b __duanlu_qingling

__qingling_baocun:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	bne __duanlu_qingling
__duanlu_qingling_wan:
	movs r1, # 0
	str r1, [r0]

	ldr r0, = wan
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	
	
	ldr r7, = 0xffffff
__yy:
	subs r7, r7, # 1
	bne __yy
	bl __xie_flash
	bkpt # 1

__duanlu_qingling_xianshi:
	push {r0-r2,lr}
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
	ldr r1, = r
	ldr r2, = chuchang_r
	bl __xianshi_neizu
	bl __xianshi_zukang_danwei
	pop {r0-r2,pc}

__xiangwei:
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
	
__shezhi_jiaodu:
        movs r0, # 99
	movs r1, # 2             @两个字符
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 2            @写几个字
	movs r1, # 45           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, = 0x5800              @lcd位置(高8位0-0x83,低8位0-7)
	ldr r4, = danweibiao
	bl __xie_alabo
	
__shezhi_jiaodu1:	
	ldr r0, = p1jz
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	bl __shezhi_jiaodu_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __jiaodu_jia
	cmp r0, # 2
	beq __jiaodu_jian
	b __shezhi_jiaodu1
__jiaodu_jia:
	bl __an_jian
	cmp r0, # 3
	beq __jiaodu_shezhi_wan
	cmp r0, # 0
	beq __jiaodu_jiale
	bl __shezhi_jiaodu_xianshi
	b __jiaodu_jia
__jiaodu_jiale:
	ldr r1, = qiwang_jiaodu
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_jiaodu1
__jiaodu_jian:
	bl __an_jian
	cmp r0, # 3
	beq __jiaodu_shezhi_wan
	cmp r0, # 0
	beq __jiaodu_jianle
	bl __shezhi_jiaodu_xianshi
	b __jiaodu_jian
__jiaodu_jianle:
	ldr r1, = qiwang_jiaodu
	ldr r2, [r1]
	subs r2, r2, # 1
	str r2, [r1]
	b __shezhi_jiaodu1

__jiaodu_shezhi_wan:
	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r0, [r0]
	ldr r1, [r1]
	bl __atan2_ji_suan
	asrs r0, r0, # 15
	ldr r1, = qiwang_jiaodu
	ldr r1, [r1]
	subs r0, r0, r1
	bl __jisuan_cos_sin
	ldr r2, = jiaodu_r
	ldr r3, = jiaodu_i
	str r0, [r2]
	str r1, [r3]

	ldr r0, = wan
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	
	ldr r7, = 0xffffff
__yy2:
	subs r7, r7, # 1
	bne __yy2
	bl __xie_flash
	bkpt # 1

__shezhi_jiaodu_xianshi:
	push {r0-r1,lr}
	ldr r0, = qiwang_jiaodu
	ldr r0, [r0]
	bl __xianshi_j_d
	pop {r0-r1,pc}

__z_r:
	ldr r0, = p1jz
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	bl __du_jiaozhunbiao
	ldr r0, = liangcheng
	movs r1, # 0
	str r1, [r0]
__shezhi_z_r:
	bl __shezhi_z_r_xianshi
	bl __an_jian
	cmp r0, # 1
	beq __shezhi_z_r_jia
	cmp r0, # 2
	beq __shezhi_z_r_jian
	b __shezhi_z_r
__shezhi_z_r_jia:
	bl __an_jian
	cmp r0, # 3
	beq __shezhi_z_r_baocun
	cmp r0, # 0
	beq __shezhi_z_r_jiale
	bl __shezhi_z_r_xianshi
	b __shezhi_z_r_jia
__shezhi_z_r_jiale:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = chuchang_r
	ldr r2, [r1, r0]
	adds r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_z_r
__shezhi_z_r_jian:
	bl __an_jian
	cmp r0, # 3
	beq __shezhi_z_r_baocun
	cmp r0, # 0
	beq __shezhi_z_r_jianle
	bl __shezhi_z_r_xianshi
	b __shezhi_z_r_jian
__shezhi_z_r_jianle:
	ldr r0, = liangcheng
	ldr r0, [r0]
	lsls r0, r0, # 2
	ldr r1, = chuchang_r
	ldr r2, [r1, r0]
	subs r2, r2, # 1
	str r2, [r1, r0]
	b __shezhi_z_r

__shezhi_z_r_baocun:
	ldr r0, = liangcheng
	ldr r1, [r0]
	adds r1, r1, # 1
	str r1, [r0]
	cmp r1, # 2
	bne __shezhi_z_r
__shezhi_z_r_wan:
	movs r1, # 0
	str r1, [r0]

	ldr r0, = wan
	movs r1, # 4
	ldr r2, =  0x06
	bl __xie_ascii
	
	ldr r7, = 0xffffff
__yy3:
	subs r7, r7, # 1
	bne __yy3
	bl __xie_flash
	bkpt # 1

__shezhi_z_r_xianshi:
	push {r0-r1,lr}
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
        ldr r1, = r
	ldr r2, = chuchang_r
	bl __xianshi_neizu
	bl __xianshi_zukang_danwei
	pop {r0-r1,pc}

__ren_wu_diao_du:
	bl __an_jian
	lsls r0, r0, # 2
	ldr r1, = an_jian_biao
	ldr r2, [r1, r0]
	mov pc, r2


	
ting:
	bl __xiangwei_xuanzhuan
	ldr r0, = z_r
	ldr r0, [r0]
	ldr r1, = f_r
	ldr r2, = f_chuchang_r
	bl __xianshi_neizu
	bl __xianshi_zukang_danwei
	b __ren_wu_diao_du
	.ltorg

__xianshi_zukang_danwei:
	push {r0-r4,lr}
	ldr r0, = liangcheng
	ldr r1, = rs_danwei_biao
	ldr r0, [r0]
	ldrb r0, [r1, r0]
	movs r1, # 2             @两个字符
	ldr r2, = asciibiao
	movs r3, # 0xff
	bl _zhuanascii
	movs r0, # 2            @写几个字
	movs r1, # 45           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, = 0x5800              @lcd位置(高8位0-0x83,低8位0-7)
	ldr r4, = danweibiao
	bl __xie_alabo
	pop {r0-r4,pc}

__lcd_chushihua:
	push {r0-r1,lr}
	ldr r0, = 0x50000018
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]            @RS=0
	ldr r2, = 0x1ffff
	bl __lcd_yanshi

	movs r0, # 0xa2         @ 偏置选择
	bl __xie_spi1
	movs r0, # 0xa0         @SEG方向（横 0=0到131，1=131到0）
	bl __xie_spi1
	movs r0, # 0xc8         @选择COM方向（竖 0=0到63, 1=63到1）
	bl __xie_spi1
	movs r0, # 0x2f         @选择调节率
	bl __xie_spi1
	movs r0, # 0x81         @设置EV命令
	bl __xie_spi1
	movs r0, # 0x25         @设置EV（0x00-0x3f 对比度）
	bl __xie_spi1
	movs r0, # 0x2f         @助推器开启
	bl __xie_spi1           @调节器开、追踪器开
	movs r0, # 0xaf         @显示开
	bl __xie_spi1
	pop {r0-r1,pc}

__xie_spi1:
	push {r4-r5,lr}
	ldr r4, = 0x40013000
	bl __spi_mang
	strb r0, [r4,0x0c]
	ldr r4, =  0x1ff
__xie_spi1_yanshi:
	subs r4, r4, # 1
	bne __xie_spi1_yanshi
	pop {r4-r5,pc}

__spi_mang:
	ldr r5, [r4,0x08]
	lsls r5, r5, # 24
	bmi __spi_mang
	bx lr
__lcd_yanshi:
	subs r2, r2, # 1
	bne __lcd_yanshi
	bx lr
__xie_lcd_ye:
	@入口R0=数据首地址
	push {r1-r4,lr}
	movs r3, # 0xb0
	subs r3, r3, # 1
	mov r4, r0
__ye_jia:
	ldr r0, = 0x50000018
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r3, r3, # 1
	cmp r3, # 0xb9
	bne __xie_ye_dizhi
	pop {r1-r4,pc}
	@       movs r3, # 0xb0
	@       mvns r4, r4
	@       lsls r4, r4, # 24
	@       lsrs r4, r4, # 24
__xie_ye_dizhi:
	movs r0, # 0x10
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	mov r0, r3
	bl __xie_spi1

	ldr r0, = 0x50000018
	movs r1, # 0x10
	str r1, [r0]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi

	movs r1, # 132
__heng_sao:
	ldrb r0, [r4]
	@       mov r0, r4
	bl __xie_spi1
	adds r4, r4, # 1
	subs r1, r1, # 1
	bne __heng_sao
	b __ye_jia

__lcd_qingping:
	push {r0-r4,lr}
	movs r3, # 0xb0
	subs r3, r3, # 1
	movs r4, # 0
__ye_jia1:
	ldr r0, = 0x50000018
	movs r1, # 0x10
	lsls r1, r1, # 16
	str r1, [r0]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r3, r3, # 1
	cmp r3, # 0xb9
	bne __xie_ye_dizhi1
	pop {r0-r4,pc}
__xie_ye_dizhi1:
	movs r0, # 0x10
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	mov r0, r3
	bl __xie_spi1
	movs r2, # 0xff
	bl __lcd_yanshi
	ldr r0, = 0x50000018
	movs r1, # 0x10
	str r1, [r0]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi
	movs r1, # 133
__heng_sao1:
	mov r0, r4
	bl __xie_spi1
	subs r1, r1, # 1
	bne __heng_sao1
	b __ye_jia1


__xie_lcd_weizhi:
	@入口R0=要写的地址(低8=X，高8=Y=（0-131(r5=高4,R4=低4))
	push {r1-r5,lr}
	mov r5, r0
	mov r4, r0
	lsls r0, r0, # 24
	lsrs r0, r0, # 24
	lsrs r5, r5, # 12	@高4
	lsls r4, r4, # 20
	lsrs r4, r4, # 28
	ldr r1, = 0x50000018
	movs r3, # 0x10
	lsls r3, r3, # 16
	str r3, [r1]            @RS=0
	ldr r2, = 0xff
	bl __lcd_yanshi
	adds r0, r0, # 0xb0     @写页命令0XB0
	bl __xie_spi1		@写页地址0-8页

	movs r0, # 0x10
	orrs r0, r0, r5
	bl __xie_spi1

	mov r0, r4
	bl __xie_spi1

	movs r3, # 0x10
	str r3, [r1]            @RS=1
	ldr r2, = 0xff
	bl __lcd_yanshi
	pop {r1-r5,pc}


__xie_ascii:
	push {r3-r7,lr}
	@入口r0=ascii地址
	@r1=写几个字
	@r2=要写的地址
	mov r6, r9
	push {r6}
	mov r9, r2
	mov r7, r1
	movs r1, # 6
	movs r2, # 1
	mov r5, r0
	movs r6, # 0
__xie_lcd_dizhi2:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii2:
	ldrb r0, [r5, r6]
	subs r0, r0, # 32
	muls r0, r0, r1
	ldr r3, = ascii_biao
	add r3, r3, r0
__du_ziku_chushihua2:
	movs r4, # 0
__du_ziku1:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_ziku1
	bl __xie_spi1
	b __du_ziku1
__duwan_ziku1:
	adds r6, r6, # 1
	cmp r6, r7
	bne __du_ascii2
	pop {r6}
	mov r6, r9
	pop {r3-r7,pc}

__xie_alabo:
	push {r5-r7,lr}
	@入口r0=写几个字
	@r1=字库单字长度
	@r2=y宽（几行）
	@r3=要写的地址
	mov r5, r9
	mov r6, r10
	mov r7, r11
	push {r5-r7}
	mov r5, r12
	push {r5}
	ldr r5, = asciibiao
	mov r12, r4
	mov r9, r3
	movs r6, # 0
	mov r7, r6
	mov r10, r0
	mov r11, r2
__xie_lcd_dizhi1:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii1:
	ldrb r0, [r5, r6]
	muls r0, r0, r1
	mov r3, r12
	add r3, r3, r0
	adds r3, r3, r7
__du_ziku_chushihua1:
	movs r4, # 0
__du_ziku:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_ziku
	bl __xie_spi1
	b __du_ziku
__duwan_ziku:
	adds r6, r6, # 1
	cmp r6, r10
	bne __du_ascii1
	movs r6, # 0
	adds r7, r7, # 1        @字库地址偏移
	mov r0, r9
	adds r0, r0, # 1        @Y偏移
	mov r9, r0
	cmp r7, r11
	bne __xie_lcd_dizhi1
	pop {r5}
	mov r12, r5
	pop {r5-r7}
	mov r9, r5
	mov r10, r6
	mov r11, r7
	pop {r5-r7,pc}




__xie_lcd_ascii:
	push {r4-r7,lr}
	@入口r0=写几个字
	@r1=字库单字长度
	@r2=y宽（几行）
	@r3=要写的地址
	mov r4, r9
	mov r5, r10
	mov r6, r11
	mov r7, r12
	push {r4-r7}
	ldr r5, = asciibiao
	mov r9, r3
	movs r6, # 0
	mov r7, r6
	mov r12, r6
	mov r10, r0
	mov r11, r2
__xie_lcd_dizhi:
	mov r0, r9
	bl __xie_lcd_weizhi
__du_ascii:
	ldrb r0, [r5, r6]
	cmp r0, # 0x2e
	beq __xie_ascii_xiaoshudian
	muls r0, r0, r1

	ldr r3, = da_a_labo_hack  @da_a_labo_shuzi
	add r3, r3, r0
	adds r3, r3, r7
__du_ziku_16_chushihua:
	movs r4, # 0
__du_ziku_16:
	ldrb r0, [r3, r4]
	add r4, r4, r2
	cmp r4, r1
	bhi __duwan_16
	bl __xie_spi1
	b __du_ziku_16
__duwan_16:
	adds r6, r6, # 1
	cmp r6, r10
	bne __du_ascii
	movs r6, # 0
	adds r7, r7, # 1	@字库地址偏移
	mov r0, r9
	adds r0, r0, # 1	@Y偏移
	mov r9, r0
	cmp r7, r11
	bne __xie_lcd_dizhi
	pop {r4-r7}
	mov r9, r4
	mov r10, r5
	mov r11, r6
	mov r12, r7
	pop {r4-r7,pc}

__xie_ascii_xiaoshudian:
	mov r0, r12
	adds r0, r0, # 1
	mov r12, r0
	cmp r12, r2
	beq __xie_ru_xiaoshudian
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0
	bl __xie_spi1

	b __duwan_16
__xie_ru_xiaoshudian:
	movs r0, # 0
	bl __xie_spi1
	movs r0, # 0x70
	bl __xie_spi1
	movs r0, # 0x70
	bl __xie_spi1
	movs r0, # 0x70
	bl __xie_spi1
	b __duwan_16

_zhuanascii:									@ 16进制转ASCII
	@ R0要转的数据， R1长度，R2结果表首地址, r3=小数点位置
	push {r4-r7,lr}
	mov r7, r3
	mov r5, r0
	mov r6, r1
	movs r1, # 10
_xunhuanqiuma:
	bl _chufa
	mov r4, r0
	muls r4, r1
	subs r3, r5, r4
	@	adds r3, r3, # 0x30	@ascii偏移
	mov r5, r0
	subs r6, r6, # 1
	beq _qiumafanhui
	cmp r6, r7
	bne _meidaoxiaoshudian
	movs r4, # 0x2e		@小数点
	strb r4, [r2,r6]	@插入小数点
	subs r6, r6, # 1
_meidaoxiaoshudian:
	strb r3, [r2,r6]
	movs r6, r6
	bne _xunhuanqiuma
	pop {r4-r7,pc}
_qiumafanhui:
	strb r3, [r2, r6]
	pop {r4-r7,pc}

__zhuanascii:			              @ 转ASCII
	@ R0要转的数据， R1长度，R2结果表首地址, r3=小数点位置
	push {r4-r7,lr}
	mov r7, r3
	mov r5, r0
	mov r6, r1
	movs r1, # 10
__xunhuanqiuma:
	bl _chufa
	mov r4, r0
	muls r4, r1
	subs r3, r5, r4
	adds r3, r3, # 0x30     @ascii偏移
	mov r5, r0
	subs r6, r6, # 1
	beq __qiumafanhui
	cmp r6, r7
	bne __meidaoxiaoshudian
	movs r4, # 0x2e         @小数点
	strb r4, [r2,r6]        @插入小数点
	subs r6, r6, # 1
__meidaoxiaoshudian:
	strb r3, [r2,r6]
	movs r6, r6
	bne __xunhuanqiuma
	pop {r4-r7,pc}
__qiumafanhui:
	strb r3, [r2, r6]
	pop {r4-r7,pc}
	.ltorg

	
__du_jiaozhunbiao:
	ldr r0, = 0x8000008
	ldr r1, [r0]
	ldr r2, [r0, # 0x04]
	ldr r3, [r0, # 0x08]
	ldr r4, [r0, # 0x0c]
	ldr r5, [r0, # 0x10]
	ldr r6, [r0, # 0x14]
	ldr r7, [r0, # 0x18]
	ldr r0, = chuchang_r
	str r1, [r0]
	str r2, [r0, # 0x04]
	str r3, [r0, # 0x08]
	str r4, [r0, # 0x0c]
	str r5, [r0, # 0x10]
	str r6, [r0, # 0x14]
	str r7, [r0, # 0x18]
	bx lr


__xie_flash:
	ldr r0, = 0x40021000
	ldr r2, = 0x1fff0f00
	ldr r2, [r2, # 0x10]
	lsls r2, r2, # 0x13
	lsrs r2, r2, # 0x13
	str r2, [r0, # 0x04]
	movs r2, # 0x00
	str r2, [r0, # 0x08]
__deng_shizhong:
	ldr r1, [r0]
	lsls r1, r1, # 21
	bpl __deng_shizhong
	ldr r2, = 0x40022000   @FLASH访问控制
	ldr r1, = 0x45670123
	str r1, [r2, # 0x08]
	ldr r1, = 0xcdef89ab
	str r1, [r2, # 0x08]

	ldr r0, = 0x1fff0f00
	adds r0, r0, # 64
	ldr r1, [r0, # 0x2c]
	uxtb r3, r1
	ldr r1, = 0x40022100
	str r3, [r1]
	ldr r3, [r0, # 0x2c]
	lsls r3, r3, # 7
	lsrs r3, r3, # 23
	str r3, [r1, # 0x04]
	ldr r3, [r0, # 0x2c]
	lsls r3, r3, # 16
	lsrs r3, r3, # 24
	str r3, [r1, # 0x10]
	ldr r3, [r0, # 0x30]
	uxtb r3, r3
	str r3, [r1, # 0x08]
	ldr r3, [r0, # 0x30]
	lsls r3, r3, # 5
	lsrs r3, r3, # 21
	str r3, [r1, # 0x0c]
	ldr r3, [r0, # 0x34]
	lsls r3, r3, # 15
	lsrs r3, r3, # 15
	str r3, [r0, # 0x34]
	ldr r3, [r0, # 0x38]
	lsls r3, r3, # 15
	lsrs r3, r3, # 15
	str r3, [r1, # 0x18]
	ldr r3, [r0, # 0x3c]
	uxth r3, r3
	str r3, [r1, # 0x1c]
	ldr r0, [r0, # 0x3c]
	lsls r0, r0, # 2
	lsrs r0, r0, # 18
	str r0, [r1, # 0x20]
@	bkpt # 77

	

	ldr r0, = 0x1000002
	ldr r1, [r2, # 0x14]
	orrs r0, r0, r1
	str r0, [r2, # 0x14]
	bl __flash_mang
	ldr r3, = 0x8000000
	ldr r1, = 0xffffffff
	str r1, [r3]
	bl __flash_mang
@	bkpt # 66
	movs r1, # 1
	str r1, [r2, # 0x10]
	ldr r0, = 0x1000001
	str r0, [r2, # 0x14]
	bl __flash_mang

	ldr r3, = 0x8000000
	ldr r1, = 0x20000160
	str r1, [r3]
	bl __flash_mang
	adds r3, r3, # 4
	ldr r1, = _start
	adds r1, r1, # 1
	str r1, [r3]
	bl __flash_mang
	adds r3, r3, # 4
	ldr r1, = chuchang_r
	movs r4, # 0
__xie_flash_xunhuan:
	ldr r0, [r1, r4]
	str r0, [r3, r4]
	bl __flash_mang
	adds r4, r4, # 4
	cmp r4, # 24
	bne __xie_flash_xunhuan
	ldr r1, = 0xffffffff
__xie_flash_xunhuan1:
	str r1, [r3, r4]
	bl __flash_mang
	adds r4, r4, # 4
	cmp r4, # 0x74
	bne __xie_flash_xunhuan1
@	bkpt # 12
	ldr r0, = 0x80000
	ldr r1, [r2, # 0x14]
	orrs r0, r0, r1
	str r0, [r2, # 0x14]
	bl __flash_mang
	str r1, [r3, r4]
	bl __flash_mang

@	bkpt # 111

	
	ldr r1, = 0x80000000
	str r1, [r2, # 0x14]          		@flsh上锁
	ldr r0, = 0xe000ed0c
	ldr r1, = 0x05fa0004
	str r1, [r0]          		@复位
	bkpt # 33
__flash_mang:
	ldr r5, [r2, # 0x10]
	lsls r5, r5, # 15
	bmi __flash_mang
	mov r0, r0
	mov r0, r0
	mov r0, r0
	bx lr
	.ltorg
__xiangwei_xuanzhuan:
	push {r2-r7,lr}
	ldr r0, = f_jiaodu_r  @-3697
	ldr r1, = f_jiaodu_i  @32558
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, = shangbi_r
	ldr r3, = shangbi_i
	ldr r4, [r2]
	ldr r5, [r3]
	mov r6, r0
	mov r7, r1
	muls r0, r0, r4 @X*COS
	muls r7, r7, r5 @Y*SIN
	muls r1, r1, r4 @X*SIN
	muls r6, r6, r5 @Y*COS
	adds r0, r0, r7
	subs r1, r6, r1
	asrs r0, r0, # 15
	asrs r1, r1, # 15
	ldr r2, = z_r
	ldr r3, = z_i
	str r0, [r2]
	str r1, [r3]
	pop {r2-r7,pc}

	
__jisuan_cos_sin:					@jd
	@入口R0=角度 （-18000到+18000）
	@出口R0=COS，R1=SIN
	push {r2-r7,lr}
	ldr r1, = 18000
	cmp r0, r1
	bls __xiaoyu_180
	subs r0, r0, r1
	movs r7, # 1
	b __js_cos_sin
__xiaoyu_180:
	movs r7, # 0
__js_cos_sin:
	ldr r1, = 9000
	ldr r2, = 51471
	movs r0, r0
	bpl __jisuan_jiaodu_bushi0
	mvns r0, r0
	adds r0, r0, # 1
	movs r4, # 1
	b __jiance_chao90
__jisuan_jiaodu_bushi0:
	movs r4, # 0
__jiance_chao90:
	cmp r0, r1
	bls __xiaoyu_90
	ldr r6, = 18000
	subs r0, r6, r0
	movs r6, # 1
	b __suan_cossin
__xiaoyu_90:
	movs r6, # 0
__suan_cossin:
	ldr r5, = 10000
	muls r0, r0, r5
	bl _chufa
	muls r0, r0, r2
	mov r1, r5
	bl _chufa
	cmp r4, # 1
	bne __suan_cos_sin1
	mvns r0, r0
	adds r0, r0, # 1
__suan_cos_sin1:
	bl __cordic_cos_sin
	cmp r6, # 1
	bne __cos_sin_fanhui
	mvns r0, r0
	adds r0, r0, # 1
__cos_sin_fanhui:
	cmp r7, # 1
	bne __cossin_fh
	mvns r0, r0
	mvns r1, r1
	adds r0, r0, # 1
	adds r1, r1, # 1
__cossin_fh:
	pop {r2-r7,pc}
__cordic_cos_sin:
	@入口R0
	@出口R0=COS，R1=SIN
	@ x= 0x4dba
	@ r1=x,r2=y,r0=z,r4=d,r5=k,r6=cordic_mabiao

	push {r2-r7,lr}
	mov r2, r8
	mov r3, r9
	push {r2-r3}
	movs r5, # 0
	mov r2, r5
	mov r4, r5
	ldr r1, = 0x4dba
cordicxunhuan:					 @ 循环
	asrs r4, r0, # 15
	@ x
	mov r7, r2
	asrs r2, r2, r5
	eors r2, r2, r4
	subs r2, r2, r4
	subs r3, r1, r2
	@ y
	mov r6, r1
	asrs r1, r1, r5
	eors r1, r1, r4
	subs r1, r1, r4
	adds r7, r7, r1
	@ z
	ldr r6, = cordic_yong_atan_biao
	lsls r2, r5, # 2
	ldr r1, [r6, r2]
	eors r1, r1, r4
	subs r1, r1, r4
	subs r0, r0, r1
	mov r1, r3
	mov r2, r7
	adds r5, # 1
	cmp r5, # 16
	bne cordicxunhuan
	mov r0, r3
	mov r1, r7
	pop {r2-r3}
	mov r8, r2
	mov r9, r3
	pop {r2-r7,pc}
__atan2_ji_suan:					@jt
	@入口R0=实部，R1=虚部，结果=R0
	push {r2-r7,lr}
	mov r2, r8
	push {r2}
	ldr r3, = cordic_yong_cos_sin
	movs r2, # 10
	muls r0, r0, r2
	muls r1, r1, r2
	movs r2, # 0
	mov r8, r2
	ldr r4, = 9000
	lsls r4, r4, # 15
__cordic_atan2_xun_huan:
__du_cos_sin:
	ldr r5, [r3]	@cos
	adds r3, r3, # 4
	mov r7, r5
	ldr r6, [r3]	@sin
	adds r3, r3, # 4
	mov r2, r6
	muls r5, r5, r0         @x*cos
	muls r2, r2, r0         @x*sin
	muls r6, r6, r1         @y*sin
	muls r7, r7, r1         @y*cos
	movs r1, r1
	bpl __ni_shi_zhen_zhuan
__shun_shi_zhen_zhuan:
	subs r5, r5, r6
	adds r7, r7, r2
	mov r6, r8
	adds r6, r6, r4
	mov r8, r6
	b __xuan_zhuan_wan
__ni_shi_zhen_zhuan:
	adds r5, r5, r6
	subs r7, r7, r2
	mov r6, r8
	subs r6, r6, r4
	mov r8, r6
__xuan_zhuan_wan:
	ldr r6, = cordic_yong_cos_sin
	movs r2, # 32
	lsls r2, r2, # 2
	adds r6, r6, r2
	asrs r5, r5, # 14
	asrs r7, r7, # 14
	mov r0, r5
	mov r1, r7
	lsrs r4, r4, # 1	@旋转
	cmp r3,	r6
	bne __cordic_atan2_xun_huan
	mov r0, r8
	mvns r0, r0
	adds r0, r0, # 1
	@	asrs r0, r0, # 15      @除32768等于角度
	pop {r2}
	mov r8, r2
	pop {r2-r7,pc}
	.ltorg

	
__suan_atan2:
	@入口R0=实部，R1=虚部
	@出口R0=角度
	push {r2-r6,lr}
	ldr r6, = atan_biao
	movs r2, # 0
	mov r3, r2
	movs r0, r0
	bpl __panduan_xubu
	ldr r2, = 5898240
	mvns r0, r0
	mvns r1, r1
	adds r0, r0, # 1
	adds r1, r1, # 1
__panduan_xubu:
	movs r1, r1
	bpl __suan_atan2_xunhuan
	ldr r2, = 11796480
__suan_atan2_xunhuan:
	movs r1, r1
	bpl __atan2_zhengzhuan
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	subs r0, r0, r5
	adds r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	subs r2, r2, r4
	b __atan2_xuanzhuan
__atan2_zhengzhuan:
	mov r4, r0	@x
	mov r5, r1	@y
	asrs r5, r5, r3
	asrs r4, r4, r3
	adds r0, r0, r5
	subs r1, r1, r4
	mov r4, r3
	lsls r4, r4, # 2
	ldr r4, [r6, r4]
	adds r2, r2, r4
__atan2_xuanzhuan:
	adds r3, r3, # 1
	cmp r3, # 21
	bne __suan_atan2_xunhuan
	mov r1, r0
	mov r0,r2
	pop {r2-r6,pc}

	
__xianshi_neizu:
	push {r3-r6,lr}
	mov r4, r0
	mov r5, r1
	mov r6, r2
	ldr r0, = liangcheng
	ldr r0, [r0]
	ldr r3, = xiaoshudian_weizhi
	ldrb r3, [r3, r0]
	lsls r0, r0, # 2
	ldr r6, [r6, r0]
	ldr r5, [r5, r0]
	subs r4, r4, r5
	mov r0, r4
	muls r0, r0, r6
	asrs r0, r0, # 15
	mov r4, r0
	movs r0, r0
	bpl __xian_shi_nei_zu
	mvns r0, r0
	adds r0, r0, # 1
	mov r4, r0
__z_r_shi_fu:
	ldr r0, = _fu
	movs r1, # 1           @显示几个字符
	ldr r2, = 0x0801         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
	b __xianshi_z_r
__xian_shi_nei_zu:
	ldr r0, = kong
	movs r1, # 1           @显示几个字符
	ldr r2, = 0x0801         @LCD位置lcd位置(高8位0-0x83,低8位0-7)
	bl __xie_ascii
__xianshi_z_r:
	mov r0, r4
	movs r1, # 5
	ldr r2, = asciibiao
@	movs r3, # 4            @小数点位置
	bl _zhuanascii
	movs r0, # 5            @写几个字
	movs r1, # 48           @字库单字长度
	movs r2, # 3            @宽度
	ldr r3, = 0x1100              @lcd位置
	bl __xie_lcd_ascii	
	pop {r3-r6,pc}

__an_jian:
	@入口PA2=按键1，PA3=按键2
	@出口R0
	ldr r0, = 0x50000010
	ldr r0, [r0]	@pa6 pa9
	mvns r0, r0
	lsls r0, r0, # 28
	lsrs r0, r0, # 30
	bx lr
	
__dft:
	push {r2-r7,lr}
	mov r5, r10
	mov r6, r11
	mov r7, r12
	push {r5-r7}
	ldr r0, = cossin
	ldr r1, = dianyabiao
	ldr r0, [r0]
	movs r6, # 0
	mov r7, r6
	mov r12, sp
	mov r11, r0
	mov r10, r1
	b __dft_xunhuan
	.ltorg
__dft_xunhuan:
	@0
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@1
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@2
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@3
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@4
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@5
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@6
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@7
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@8
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@9
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@10
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@11
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4		@R
	muls r1, r1, r4		@I
	muls r2, r2, r5		@R
	muls r3, r3, r5		@I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2	 @r
	adds r1, r1, r3	 @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1

	@12
	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4         @R
	muls r1, r1, r4         @I
	muls r2, r2, r5         @R
	muls r3, r3, r5         @I
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2  @r
	adds r1, r1, r3  @i
	adds r6, r6, r0
	adds r7, r7, r1

	mov sp, r11
	pop {r0-r3}
	mov r11, sp
	mov sp, r10
	pop {r4}
	mov r10, sp
	mov r5, r4
	lsls r4, r4, # 16
	lsrs r4, r4, # 16
	lsrs r5, r5, # 16
	muls r0, r0, r4
	muls r1, r1, r4
	muls r2, r2, r5
	muls r3, r3, r5
	asrs r0, r0, # 6
	asrs r1, r1, # 6
	asrs r2, r2, # 6
	asrs r3, r3, # 6
	adds r0, r0, r2         @r
	adds r1, r1, r3         @i
	adds r6, r6, r0
	adds r7, r7, r1


	@	bkpt # 1
	ldr r0, = dianyabiao
	ldr r1, = 0x7d0
	adds r0, r0, r1
	cmp r10, r0
	beq __dft_fanhuile
	ldr r0, = cossin
	ldr r0, [r0]
	mov r11, r0
	ldr r0, = __dft_xunhuan
	adds r0, r0, # 1
	mov pc, r0
	@	b __dft_xunhuan
__dft_fanhuile:
	mov r0, r6
	mov r1, r7
	asrs r0, r0, # 9	@dfdf
	asrs r1, r1, # 9
	mov sp, r12
	pop {r2-r4}
	mov r10, r2
	mov r11, r3
	mov r12, r4
	pop {r2-r7,pc}
	.ltorg

__lv_bo_qi:
	@地址顺序：指针，累加值，缓冲区
	@入口R0=缓冲区，R1=数据, r2,=指针
	@出口R0
	push {r3-r7,lr}
	ldr r4, = lvbo_changdu
	ldr r7, = lvbo_youyi
	ldr r4, [r4]
	ldr r7, [r7]
	ldr r5, [r2]
	mov r3, r5
	lsls r3, r5, # 2
	ldr r6, [r0, r3]
	str r1, [r0, r3]
	adds r5, r5, # 1
	str r5, [r2]
	cmp r5, r4
	bne __huanchong_leijia
	movs r5, # 0
	str r5, [r2]
__huanchong_leijia:
	subs r0, r0, # 4
	ldr r5, [r0]
	adds r1, r1, r5
	subs r1, r1, r6
	str r1, [r0]
	asrs r1, r1, r7	 @# 12 @12 @  7	@128
	mov r0, r1
	pop {r3-r7,pc}
	.ltorg
__ji_suan_fu_du:		    @ 计算幅度
	@ 入r0= 实部，r1= 虚部
	@ 出r0 = 幅度
	@ Mag ~=Alpha * max(|I|, |Q|) + Beta * min(|I|, |Q|)
	@ Alpha * Max + Beta * Min
	push {r1-r3,lr}
	movs r0, r0
	bpl _shibubushifushu
	mvns r0, r0                             @ 是负数转成正数
	adds r0, r0, # 1
_shibubushifushu:		                               @ 实部不是负数
	movs r1, r1
	bpl _xububushifushu
	mvns r1, r1                             @ 是负数转成正数
	adds r1, r1, # 1
_xububushifushu:		                                @ 虚部不是负数
	cmp r0, # 0
	bne _panduanxubushibushi0
	mov r0, r1
	pop {r1-r3,pc}
_panduanxubushibushi0:
	cmp r1, # 0
	bne _jisuanfudu1
	pop {r1-r3,pc}
_jisuanfudu1:
	ldr r2, = 31066		@ Alpha q15 0.948059448969
	ldr r3, = 12867		@ Beta q15 0.392699081699
	cmp r1, r0
	bhi _alpha_min_beta_max
_alpha_max_beta_min:
	muls r0, r0, r2
	muls r1, r1, r3
	asrs r0, r0, # 15
	asrs r1, r1, # 15
	adds r0, r0, r1
	movs r1, # 1
	pop {r1-r3,pc}
_alpha_min_beta_max:
	muls r0, r0, r3
	muls r1, r1, r2
	asrs r0, r0, # 15
	asrs r1, r1, # 15
	adds r0, r0, r1
	movs r1, # 0
	pop {r1-r3,pc}

	
	
_chufa:					@软件除法
	@ r0 除以 r1 等于 商(r0)
	push {r1-r4,lr}
	cmp r0, # 0
	beq _chufafanhui
	cmp r1, # 0
	beq _chufafanhui
	mov r2, r0
	movs r3, # 1
	lsls r3, r3, # 31
	movs r0, # 0
	mov r4, r0
_chufaxunhuan:
	lsls r2, r2, # 1
	adcs r4, r4, r4
	cmp r4, r1
	bcc _chufaweishubudao0
	adds r0, r0, r3
	subs r4, r4, r1
_chufaweishubudao0:
	lsrs r3, r3, # 1
	bne _chufaxunhuan
_chufafanhui:
	pop {r1-r4,pc}
	.ltorg


	
_nmi_handler:
	bx lr
_hard_fault:
	bx lr
_svc_handler:
	bx lr
_pendsv_handler:
	bx lr
_systickzhongduan:		@syzd
	push {r0-r4,lr}
__suan_dft:
	bl __dft
	ldr r2, = shangbi_rr
	ldr r3, = shangbi_ii
	str r0, [r2]
	str r1, [r3]
	mov r4, r0
	ldr r2, = lvboqizhizhen1
	ldr r0, =lvboqihuanchong1
	bl __lv_bo_qi
	ldr r1, = shangbi_i
	str r0, [r1]
	mov r1, r4
	ldr r2, = lvboqizhizhen
	ldr r0, =lvboqihuanchong
	bl __lv_bo_qi
	ldr r1, = shangbi_r
	str r0, [r1]

	ldr r0, = shangbi_r
	ldr r1, = shangbi_i
	ldr r0, [r0]
	ldr r1, [r1]
	bl __ji_suan_fu_du
	ldr r2, = fudu
	str r0, [r2]

	ldr r0, = liangcheng
	ldr r2, = 0x50000400
	ldr r3, [r0]
	cmp r3, # 1
	beq __haoou_dang
__ou_dang:	
	movs r3, # 1
	lsls r3, r3, # 16
	str r3, [r2, # 0x18]
	b __systick_fanhui
__haoou_dang:	
	movs r3, # 1
	str r3, [r2, # 0x18]
	
__systick_fanhui:
	ldr r0, = 0xe0000d04
	ldr r1, = 0x02000000
	str r1, [r0]                 @ 清除SYSTICK中断
	pop {r0-r4,pc}
	
aaa:
	bx lr
	.ltorg
	
	.align 4
        .equ f_chuchang_r,                0x8000008
	.equ f_chuchang_i,                0x800000c
	.equ f_jiaodu_r,                  0x8000010
	.equ f_jiaodu_i,                  0x8000014
	.equ f_r,                         0x8000018
	.equ f_mr,                        0x800001c
	
	.equ dianyabiao,        	0x20000160
	.equ STACKINIT,         	0x20000160
	.equ lvboqizhizhen,             0x20000930
	.equ lvboqihuanchong,           0x20000938
	.equ lvboqizhizhen1,            0x20000c60
	.equ lvboqihuanchong1,          0x20000c68





	
	.equ chuchang_r,		0x20000fa0
	.equ chuchang_i,		0x20000fa4
	.equ jiaodu_r,			0x20000fa8
	.equ jiaodu_i,			0x20000fac
	.equ r,				0x20000fb0
	.equ mr,			0x20000fb4
	.equ jiaozhun_bianhao,		0x20000fb8
	.equ z_r,			0x20000fbc
	.equ z_i,			0x20000fc0
	.equ jiaodu,			0x20000fc4
	.equ liangcheng,		0x20000fc8
	.equ qiwang_jiaodu,		0x20000fcc
	.equ jishu,			0x20000fd0
	.equ fudu,			0x20000fd4
	.equ shangbi_rr,		0x20000fd8
	.equ shangbi_ii,		0x20000fdc
	.equ shangbi_r,			0x20000fe0
	.equ shangbi_i,			0x20000fe4
	.equ lvbo_youyi,		0x20000fe8
	.equ lvbo_changdu,		0x20000fec
	.equ cossin,                    0x20000ff0
	.equ danwei,                    0x20000ff4
	.equ asciibiao,			0x20000ff8
	
an_jian_biao:
	.word __anjian0	+1
	.word __anjian1	+1
	.word __anjian2	+1
	.word __anjian3	+1
cordic_yong_atan_biao:		@弧度
	.int 0x00006487,0x00003B58,0x00001F5B,0x00000FEA,0x000007FD,0x000003FF,0x000001FF,0x000000FF,0x0000007F,0x0000003F,0x0000001F,0x0000000F,0x00000007,0x00000003,0x00000001,0x00000000
cordic_yong_cos_sin:
	.int 0x0000,0x4000,0x2D41,0x2D41,0x3B20,0x187D,0x3EC5,0x0C7C,0x3FB1,0x0645,0x3FEC,0x0323,0x3FFB,0x0192,0x3FFE,0x00C9,0x3FFF,0x0064,0x3FFF,0x0032,0x3FFF,0x0019,0x3FFF,0x000C,0x3FFF,0x0006,0x3FFF,0x0003,0x3FFF,0x0001,0x3FFF,0x0000
atan_biao:		@角度
	.int 0x00168000,0x000D4853,0x000704A3,0x00039000,0x0001C9C5,0x0000E51B,0x00007295,0x0000394B,0x00001CA5,0x00000E52,0x00000729,0x00000394,0x000001CA,0x000000E5,0x00000072,0x00000039,0x0000001C,0x0000000E,0x00000007,0x00000003,0x00000001
	.align 4
xiaoshudian_weizhi:
	.byte 1,2
	.align 4
chuchang_dianzu:
	.int 7124,20591		@2欧=7124 58毫欧=20591
chuchang_jiaodu:
	.int -3697,32558
chuchang_duanlu_r:
	.int 0,0
	.align 4
rs_danwei_biao:			@31=毫欧，91=欧，81=千欧，41=兆欧
	.byte 91,31
	
danwei_biao:
	.byte 0x40,0x80
	.align 4
yjmwxwx:
	.ascii "yjmwxwx-20230828"
	.align 4
p0:
	.ascii "P-00"
p1:
	.ascii "P-01"
p2:
	.ascii "P-02"
wan:
	.ascii "END "
p0jz:
	.ascii "p0jz"
p1jz:
	.ascii "p1jz"
p2jz:
	.ascii "p2jz"
kong:
	.int 0x20202020
_fu:
	.ascii "-"
	.align 4
jiaozhun_biao:
	.word __qingling +1
	.word __xiangwei +1
	.word __z_r	 +1
	
	.align 4
zheng_xian_1khz:
	.byte 125,128,132,136,140,144,148,152,155,159,163,167,170,174,178,181,184,188,191,194,198,201,204,207,210,213,215,218,220,223,225,227,230,232,234,235,237,239,240,242,243,244,245,246,247,247,248,248,249,249,249,249,249,248,248,247,247,246,245,244,243,242,240,239,237,235,234,232,230,227,225,223,220,218,215,213,210,207,204,201,198,194,191,188,184,181,178,174,170,167,163,159,155,152,148,144,140,136,132,128,125,121,117,113,109,105,101,97,94,90,86,82,79,75,71,68,65,61,58,55,51,48,45,42,39,36,34,31,29,26,24,22,19,17,15,14,12,10,9,7,6,5,4,3,2,2,1,1,0,0,0,0,0,1,1,2,2,3,4,5,6,7,9,10,12,14,15,17,19,22,24,26,29,31,34,36,39,42,45,48,51,55,58,61,65,68,71,75,79,82,86,90,94,97,101,105,109,113,117,121
	
	.align 4
cos_sin_biao_1k:
	.int 0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4495,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4495,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4495,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4496,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C13,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC980,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6A,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x3680,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4496,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02C,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100B,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6A,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC980,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6A,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02C,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x3680,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4496,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x3680,0x73D1,0x3DAA,0x702A,0x4496,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02C,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC980,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6A,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6A,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD4,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4496,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x3680,0x73D1,0x3DAA,0x702A,0x4496,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD4,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF5,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93EE,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC980,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4496,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4496,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD5,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6A,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5196,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93ED,0x3DAA,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD5,0xFFFF8406,0x17FC,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF6,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02B,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6B,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE6A,0xFFFF9873,0xFFFFB4C4,0xFFFF93ED,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC256,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02B,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100A,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4495,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02C,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x367F,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C13,0x4495,0x702A,0x3DA9,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD4,0x7DBB,0x17FB,0x7EFD,0x100A,0x7FBF,0x0809,0x8000,0x0000,0x7FBF,0xFFFFF7F7,0x7EFD,0xFFFFEFF6,0x7DBB,0xFFFFE804,0x7BFA,0xFFFFE02B,0x79BC,0xFFFFD873,0x7702,0xFFFFD0E2,0x73D1,0xFFFFC981,0x702A,0xFFFFC256,0x6C12,0xFFFFBB6B,0x678D,0xFFFFB4C4,0x62A0,0xFFFFAE69,0x5D4E,0xFFFFA861,0x579F,0xFFFFA2B2,0x5197,0xFFFF9D60,0x4B3C,0xFFFF9873,0x4495,0xFFFF93ED,0x3DA9,0xFFFF8FD6,0x367F,0xFFFF8C2F,0x2F1E,0xFFFF88FE,0x278D,0xFFFF8644,0x1FD4,0xFFFF8406,0x17FB,0xFFFF8245,0x100A,0xFFFF8103,0x0809,0xFFFF8041,0x0000,0xFFFF8000,0xFFFFF7F7,0xFFFF8041,0xFFFFEFF5,0xFFFF8103,0xFFFFE804,0xFFFF8245,0xFFFFE02C,0xFFFF8406,0xFFFFD873,0xFFFF8644,0xFFFFD0E2,0xFFFF88FE,0xFFFFC981,0xFFFF8C2F,0xFFFFC256,0xFFFF8FD6,0xFFFFBB6A,0xFFFF93EE,0xFFFFB4C4,0xFFFF9873,0xFFFFAE69,0xFFFF9D60,0xFFFFA861,0xFFFFA2B2,0xFFFFA2B2,0xFFFFA861,0xFFFF9D60,0xFFFFAE69,0xFFFF9873,0xFFFFB4C4,0xFFFF93EE,0xFFFFBB6B,0xFFFF8FD6,0xFFFFC257,0xFFFF8C2F,0xFFFFC981,0xFFFF88FE,0xFFFFD0E2,0xFFFF8644,0xFFFFD873,0xFFFF8406,0xFFFFE02C,0xFFFF8245,0xFFFFE804,0xFFFF8103,0xFFFFEFF6,0xFFFF8041,0xFFFFF7F7,0xFFFF8000,0x0000,0xFFFF8041,0x0809,0xFFFF8103,0x100B,0xFFFF8245,0x17FC,0xFFFF8406,0x1FD5,0xFFFF8644,0x278D,0xFFFF88FE,0x2F1E,0xFFFF8C2F,0x367F,0xFFFF8FD6,0x3DAA,0xFFFF93EE,0x4495,0xFFFF9873,0x4B3C,0xFFFF9D60,0x5197,0xFFFFA2B2,0x579F,0xFFFFA861,0x5D4E,0xFFFFAE69,0x62A0,0xFFFFB4C4,0x678D,0xFFFFBB6B,0x6C12,0xFFFFC256,0x702A,0xFFFFC981,0x73D1,0xFFFFD0E2,0x7702,0xFFFFD873,0x79BC,0xFFFFE02B,0x7BFA,0xFFFFE804,0x7DBB,0xFFFFEFF6,0x7EFD,0xFFFFF7F7,0x7FBF,0x0000,0x8000,0x0809,0x7FBF,0x100A,0x7EFD,0x17FC,0x7DBB,0x1FD5,0x7BFA,0x278D,0x79BC,0x2F1E,0x7702,0x3680,0x73D1,0x3DAA,0x702A,0x4495,0x6C12,0x4B3C,0x678D,0x5197,0x62A0,0x579F,0x5D4E,0x5D4E,0x579F,0x62A0,0x5197,0x678D,0x4B3C,0x6C12,0x4495,0x702A,0x3DAA,0x73D1,0x367F,0x7702,0x2F1E,0x79BC,0x278D,0x7BFA,0x1FD4,0x7DBB,0x17FC,0x7EFD,0x100A,0x7FBF,0x0809
	
	.align 4
da_a_labo_hack:		 @16*24
	.byte 0x00, 0x00, 0x00, 0x80, 0xFF, 0x01, 0xF0, 0xFF, 0x0F, 0xF8, 0xFF, 0x1F, 0x7C, 0x00, 0x3E, 0x1E, 0x00, 0x78, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x1E, 0x00, 0x78, 0x7C, 0x00, 0x3E, 0xF8, 0xFF, 0x1F, 0xF0, 0xFF, 0x0F, 0x80, 0xFF, 0x01, 0x00, 0x00, 0x00 @ 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x70, 0x70, 0x00, 0x70, 0x70, 0x00, 0x70, 0x78, 0x00, 0x70, 0xFC, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ 1
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x1C, 0x00, 0x7C, 0x1C, 0x00, 0x7E, 0x0E, 0x00, 0x77, 0x0E, 0x00, 0x77, 0x0E, 0x80, 0x73, 0x0E, 0xC0, 0x71, 0x0E, 0xE0, 0x70, 0x1E, 0x78, 0x70, 0x1E, 0x3C, 0x70, 0xFC, 0x1F, 0x70, 0xF8, 0x07, 0x70, 0xF0, 0x03, 0x70, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00 @ 2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x1C, 0x00, 0x38, 0x1C, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x3E, 0x78, 0x1C, 0x37, 0x3C, 0xFC, 0xF3, 0x3F, 0xF8, 0xE3, 0x1F, 0xF0, 0xC0, 0x07, 0x00, 0x00, 0x00 @ 3
	.byte 0x00, 0xE0, 0x01, 0x00, 0xF0, 0x01, 0x00, 0xFC, 0x01, 0x00, 0xFE, 0x01, 0x00, 0xDF, 0x01, 0x80, 0xCF, 0x01, 0xE0, 0xC3, 0x01, 0xF0, 0xC1, 0x01, 0xF8, 0xC0, 0x01, 0x7C, 0xC0, 0x01, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01 @ 4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0xFE, 0x1F, 0x38, 0xFE, 0x0F, 0x70, 0xFE, 0x0F, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x1E, 0x78, 0x0E, 0x3C, 0x3C, 0x0E, 0xFC, 0x1F, 0x0E, 0xF8, 0x0F, 0x0E, 0xE0, 0x07, 0x00, 0x00, 0x00 @ 5
	.byte 0x00, 0x00, 0x00, 0x00, 0xFE, 0x03, 0xC0, 0xFF, 0x0F, 0xF0, 0xFF, 0x1F, 0xF8, 0x1C, 0x3E, 0x3C, 0x0C, 0x78, 0x1C, 0x0E, 0x70, 0x1E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x0E, 0x70, 0x0E, 0x1E, 0x78, 0x0E, 0x3C, 0x3C, 0x1E, 0xFC, 0x1F, 0x00, 0xF8, 0x0F, 0x00, 0xE0, 0x07, 0x00, 0x00, 0x00 @ 6
	.byte 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0E, 0x00, 0x40, 0x0E, 0x00, 0x70, 0x0E, 0x00, 0x7C, 0x0E, 0x00, 0x7F, 0x0E, 0xC0, 0x1F, 0x0E, 0xF0, 0x07, 0x0E, 0xFC, 0x00, 0x0E, 0x3F, 0x00, 0xCE, 0x0F, 0x00, 0xFE, 0x03, 0x00, 0xFE, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x00 @ 7
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x07, 0xF0, 0xE1, 0x1F, 0xF8, 0xF3, 0x3F, 0xFC, 0x3F, 0x3C, 0x1E, 0x1F, 0x78, 0x0E, 0x0E, 0x70, 0x0E, 0x0C, 0x70, 0x0E, 0x1C, 0x70, 0x0E, 0x18, 0x70, 0x1E, 0x3C, 0x78, 0xFC, 0x7F, 0x3C, 0xF8, 0xF3, 0x3F, 0xF0, 0xE1, 0x1F, 0x00, 0xC0, 0x07, 0x00, 0x00, 0x00 @ 8
	.byte 0x00, 0x00, 0x00, 0xE0, 0x07, 0x00, 0xF0, 0x1F, 0x00, 0xF8, 0x3F, 0x78, 0x3C, 0x3C, 0x70, 0x1E, 0x78, 0x70, 0x0E, 0x70, 0x70, 0x0E, 0x70, 0x70, 0x0E, 0x70, 0x78, 0x0E, 0x70, 0x38, 0x1E, 0x30, 0x3C, 0x7C, 0x38, 0x1F, 0xF8, 0xFF, 0x0F, 0xF0, 0xFF, 0x03, 0xC0, 0x7F, 0x00, 0x00, 0x00, 0x00 @ 9
	.align 4
ascii_biao:			@6*8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @
	.byte 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00 @ !
	.byte 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 @ "
	.byte 0x00, 0x14, 0x7F, 0x14, 0x7F, 0x14 @ #
	.byte 0x00, 0x24, 0x2A, 0x7F, 0x2A, 0x12 @ $
	.byte 0x00, 0x23, 0x13, 0x08, 0x64, 0x62 @ %
	.byte 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 @ &
	.byte 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 @ '
	.byte 0x00, 0x00, 0x1C, 0x22, 0x41, 0x00 @ (
	.byte 0x00, 0x00, 0x41, 0x22, 0x1C, 0x00 @ )
	.byte 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 @ *
	.byte 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 @ +
	.byte 0x00, 0x00, 0x50, 0x30, 0x00, 0x00 @ ,
	.byte 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 @ -
	.byte 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 @ .
	.byte 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 @ /
	.byte 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E @ 0
	.byte 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 @ 1
	.byte 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 @ 2
	.byte 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 @ 3
	.byte 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 @ 4
	.byte 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 @ 5
	.byte 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 @ 6
	.byte 0x00, 0x01, 0x01, 0x79, 0x05, 0x03 @ 7
	.byte 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 @ 8
	.byte 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E @ 9
	.byte 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 @ :
	.byte 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 @ ;
	.byte 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 @ <
	.byte 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 @ =
	.byte 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 @ >
	.byte 0x02, 0x01, 0x51, 0x09, 0x06, 0x00 @ ?
	.byte 0x00, 0x32, 0x49, 0x79, 0x41, 0x3E @ @
	.byte 0x00, 0x7E, 0x11, 0x11, 0x11, 0x7E @ A
	.byte 0x00, 0x41, 0x7F, 0x49, 0x49, 0x36 @ B
	.byte 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 @ C
	.byte 0x00, 0x41, 0x7F, 0x41, 0x41, 0x3E @ D
	.byte 0x00, 0x7F, 0x49, 0x49, 0x49, 0x49 @ E
	.byte 0x00, 0x7F, 0x09, 0x09, 0x09, 0x09 @ F
	.byte 0x00, 0x3E, 0x41, 0x41, 0x51, 0x72 @ G
	.byte 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F @ H
	.byte 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 @ I
	.byte 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 @ J
	.byte 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 @ K
	.byte 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 @ L
	.byte 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F @ M
	.byte 0x81, 0x7F, 0x06, 0x08, 0x30, 0x7F @ N
	.byte 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E @ O
	.byte 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 @ P
	.byte 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E @ Q
	.byte 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 @ R
	.byte 0x00, 0x26, 0x49, 0x49, 0x49, 0x32 @ S
	.byte 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 @ T
	.byte 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F @ U
	.byte 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F @ V
	.byte 0x00, 0x7F, 0x20, 0x18, 0x20, 0x7F @ W
	.byte 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 @ X
	.byte 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 @ Y
	.byte 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 @ Z
	.byte 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 @ [
	.byte 0x00, 0x02, 0x04, 0x08, 0x10, 0x20 @ BackSlash
	.byte 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 @ ]
	.byte 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 @ ^
	.byte 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 @ _
	.byte 0x00, 0x01, 0x02, 0x04, 0x00, 0x00 @ `
	.byte 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 @ a
	.byte 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 @ b
	.byte 0x00, 0x38, 0x44, 0x44, 0x44, 0x28 @ c
	.byte 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F @ d
	.byte 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 @ e
	.byte 0x00, 0x00, 0x08, 0x7E, 0x09, 0x02 @ f
	.byte 0x00, 0x0C, 0x52, 0x52, 0x4C, 0x3E @ g
	.byte 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 @ h
	.byte 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 @ i
	.byte 0x00, 0x20, 0x40, 0x44, 0x3D, 0x00 @ j
	.byte 0x00, 0x00, 0x7F, 0x10, 0x28, 0x44 @ k
	.byte 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 @ l
	.byte 0x00, 0x78, 0x04, 0x78, 0x04, 0x78 @ m
	.byte 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 @ n
	.byte 0x00, 0x38, 0x7C, 0x7C, 0x7C, 0x38 @ o
	.byte 0x00, 0x7E, 0x0C, 0x12, 0x12, 0x0C @ p
	.byte 0x00, 0x0C, 0x12, 0x12, 0x0C, 0x7E @ q
	.byte 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 @ r
	.byte 0x00, 0x58, 0x54, 0x54, 0x54, 0x64 @ s
	.byte 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 @ t
	.byte 0x00, 0x3C, 0x40, 0x40, 0x3C, 0x40 @ u
	.byte 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C @ v
	.byte 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C @ w
	.byte 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 @ x
	.byte 0x00, 0x1C, 0xA0, 0xA0, 0x90, 0x7C @ y
	.byte 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 @ z
	.byte 0x00, 0x00, 0x08, 0x36, 0x41, 0x00 @ {
	.byte 0x00, 0x00, 0x00, 0x77, 0x00, 0x00 @ |
	.byte 0x00, 0x00, 0x41, 0x36, 0x08, 0x00 @ }
	.byte 0x00, 0x02, 0x01, 0x02, 0x04, 0x02 @ ~
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @

	.align 4

danweibiao:		 @15*24
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0xC0, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x03, 0x00, 0x80, 0x03, 0x00, 0x80, 0x03, 0x00, 0xE0, 0x01, 0xFE, 0x7F, 0x00, 0xFE, 0xFF, 0x01, 0xFE, 0xFF, 0x03, 0x00, 0x80, 0x03, 0x00, 0x80, 0x01 @ µ
	.byte 0x00, 0x7F, 0x70, 0xE0, 0xFF, 0x73, 0xF0, 0xFF, 0x77, 0xF8, 0x00, 0x7F, 0x38, 0x00, 0x7C, 0x3C, 0x00, 0x70, 0x1C, 0x00, 0x60, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x60, 0x3C, 0x00, 0x70, 0x38, 0x00, 0x7C, 0xF8, 0x00, 0x7F, 0xF0, 0xFF, 0x77, 0xE0, 0xFF, 0x73, 0x00, 0x7F, 0x70 @Ω
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x1C, 0x00, 0x0E, 0x00, 0x00 @ F
	.byte 0x00, 0xF8, 0x7F, 0x00, 0xFC, 0x7F, 0x00, 0x1E, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0xF8, 0x7F, 0x00, 0xF8, 0x7F, 0x00, 0x1C, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x1E, 0x00, 0x00, 0xFC, 0x7F, 0x00, 0xF8, 0x7F, 0x00, 0x00, 0x00 @ m
	.byte 0x00, 0x00, 0x00, 0xFC, 0xFF, 0x0F, 0xFC, 0xFF, 0x0F, 0x3C, 0x00, 0x00, 0xF0, 0x01, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x3C, 0x00, 0x80, 0x0F, 0x00, 0xF0, 0x01, 0x00, 0x3C, 0x00, 0x00, 0xFC, 0xFF, 0x0F, 0xFC, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ M
	.byte 0x00, 0x00, 0x00, 0x80, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x00, 0x07, 0x00, 0x80, 0x03, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x01, 0x00, 0xC0, 0x03, 0x00, 0xC0, 0xFF, 0x7F, 0x80, 0xFF, 0x7F, 0x00, 0xFE, 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 @ n
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x1C, 0xE0, 0x00, 0x0E, 0xC0, 0x00, 0x06, 0x80, 0x01, 0x06, 0x80, 0x01, 0x06, 0x80, 0x01, 0x0E, 0xC0, 0x01, 0x1C, 0xE0, 0x00, 0xFC, 0xFF, 0x00, 0xF8, 0x7F, 0x00, 0xE0, 0x1F, 0x00, 0x00, 0x00, 0x00   @ p
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x1C, 0x00, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F, 0xFE, 0xFF, 0x7F @ H
	.byte 0x00, 0x00, 0x00, 0xFC, 0xFF, 0x7F, 0xFC, 0xFF, 0x7F, 0xFC, 0xFF, 0x7F, 0x00, 0x7C, 0x00, 0x00, 0xFE, 0x00, 0x00, 0xEF, 0x01, 0x80, 0xC7, 0x03, 0xC0, 0x83, 0x07, 0xE0, 0x01, 0x0F, 0xF0, 0x00, 0x1E, 0x78, 0x00, 0x3C, 0x3C, 0x00, 0x78, 0x1C, 0x00, 0x70, 0x0C, 0x00, 0x60	@ K
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	@空
	

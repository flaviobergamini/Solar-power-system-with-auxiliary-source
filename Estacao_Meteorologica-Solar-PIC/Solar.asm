
_mede_bateria:

;Solar.c,20 :: 		void mede_bateria()
;Solar.c,22 :: 		bateria1 = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _bateria1+0
	MOVF       R0+1, 0
	MOVWF      _bateria1+1
	MOVF       R0+2, 0
	MOVWF      _bateria1+2
	MOVF       R0+3, 0
	MOVWF      _bateria1+3
;Solar.c,24 :: 		bateria1 = (bateria1*12)/1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _bateria1+0
	MOVF       R0+1, 0
	MOVWF      _bateria1+1
	MOVF       R0+2, 0
	MOVWF      _bateria1+2
	MOVF       R0+3, 0
	MOVWF      _bateria1+3
;Solar.c,25 :: 		bat = bateria1;
	MOVF       R0+0, 0
	MOVWF      _bat+0
	MOVF       R0+1, 0
	MOVWF      _bat+1
	MOVF       R0+2, 0
	MOVWF      _bat+2
	MOVF       R0+3, 0
	MOVWF      _bat+3
;Solar.c,26 :: 		UART1_Write_Text("BATERIA: ");
	MOVLW      ?lstr1_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,27 :: 		FloatToStr(bat, str_bat);
	MOVF       _bat+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _bat+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _bat+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _bat+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _str_bat+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;Solar.c,28 :: 		UART1_Write_Text(str_bat);
	MOVLW      _str_bat+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,29 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,30 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,31 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_mede_bateria0:
	DECFSZ     R13+0, 1
	GOTO       L_mede_bateria0
	DECFSZ     R12+0, 1
	GOTO       L_mede_bateria0
	DECFSZ     R11+0, 1
	GOTO       L_mede_bateria0
	NOP
;Solar.c,32 :: 		}
L_end_mede_bateria:
	RETURN
; end of _mede_bateria

_main:

;Solar.c,34 :: 		void main()
;Solar.c,36 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Solar.c,37 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
;Solar.c,38 :: 		trisb = 0;
	CLRF       TRISB+0
;Solar.c,39 :: 		portb = 0;
	CLRF       PORTB+0
;Solar.c,40 :: 		trisc = 0b10000001;
	MOVLW      129
	MOVWF      TRISC+0
;Solar.c,41 :: 		portc = 0;
	CLRF       PORTC+0
;Solar.c,42 :: 		trisa = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;Solar.c,43 :: 		porta = 0;
	CLRF       PORTA+0
;Solar.c,44 :: 		adcon1 = 14;
	MOVLW      14
	MOVWF      ADCON1+0
;Solar.c,45 :: 		UART1_Write_Text("WS");
	MOVLW      ?lstr2_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,46 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,47 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,48 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Solar.c,49 :: 		while (1)
L_main3:
;Solar.c,51 :: 		mede_bateria();
	CALL       _mede_bateria+0
;Solar.c,53 :: 		LDR = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _LDR+0
	MOVF       R0+1, 0
	MOVWF      _LDR+1
	MOVF       R0+2, 0
	MOVWF      _LDR+2
	MOVF       R0+3, 0
	MOVWF      _LDR+3
;Solar.c,54 :: 		LDR = (LDR*100)/1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _LDR+0
	MOVF       R0+1, 0
	MOVWF      _LDR+1
	MOVF       R0+2, 0
	MOVWF      _LDR+2
	MOVF       R0+3, 0
	MOVWF      _LDR+3
;Solar.c,56 :: 		UART1_Write_Text("LDR: ");
	MOVLW      ?lstr3_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,57 :: 		FloatToStr(LDR, str_ldr);
	MOVF       _LDR+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _LDR+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _LDR+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _LDR+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _str_ldr+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;Solar.c,58 :: 		UART1_Write_Text(str_ldr);
	MOVLW      _str_ldr+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,59 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,60 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,62 :: 		bateria = bateria1;
	MOVF       _bateria1+0, 0
	MOVWF      R0+0
	MOVF       _bateria1+1, 0
	MOVWF      R0+1
	MOVF       _bateria1+2, 0
	MOVWF      R0+2
	MOVF       _bateria1+3, 0
	MOVWF      R0+3
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _bateria+0
	MOVF       R0+1, 0
	MOVWF      _bateria+1
;Solar.c,63 :: 		if(bateria < 8)
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      8
	SUBWF      R0+0, 0
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Solar.c,65 :: 		if(LDR > 8.5 && (portc.f0 == 0 || portc.f0 == 1))
	MOVF       _LDR+0, 0
	MOVWF      R4+0
	MOVF       _LDR+1, 0
	MOVWF      R4+1
	MOVF       _LDR+2, 0
	MOVWF      R4+2
	MOVF       _LDR+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      8
	MOVWF      R0+2
	MOVLW      130
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	BTFSS      PORTC+0, 0
	GOTO       L__main29
	BTFSC      PORTC+0, 0
	GOTO       L__main29
	GOTO       L_main10
L__main29:
L__main28:
;Solar.c,67 :: 		UART1_Write_Text("LUZ");
	MOVLW      ?lstr4_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,68 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,69 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,70 :: 		portb.f3 = 0;
	BCF        PORTB+0, 3
;Solar.c,71 :: 		portb.f0 = 0;                              //desliga alimentação auxiliar
	BCF        PORTB+0, 0
;Solar.c,72 :: 		portb.f1 = 0;                              //deixa habilitado a bateria
	BCF        PORTB+0, 1
;Solar.c,73 :: 		if(portc.f0 == 0)
	BTFSC      PORTC+0, 0
	GOTO       L_main11
;Solar.c,75 :: 		UART1_Write_Text("FD");
	MOVLW      ?lstr5_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,76 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,77 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,78 :: 		}
	GOTO       L_main12
L_main11:
;Solar.c,81 :: 		UART1_Write_Text("FH");
	MOVLW      ?lstr6_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,82 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,83 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,84 :: 		}
L_main12:
;Solar.c,85 :: 		}
	GOTO       L_main13
L_main10:
;Solar.c,86 :: 		else if(portc.f0 == 0 && LDR < 8.5)           //Não tem sol e nem bateria
	BTFSC      PORTC+0, 0
	GOTO       L_main16
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      8
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _LDR+0, 0
	MOVWF      R0+0
	MOVF       _LDR+1, 0
	MOVWF      R0+1
	MOVF       _LDR+2, 0
	MOVWF      R0+2
	MOVF       _LDR+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L__main27:
;Solar.c,88 :: 		portb.f3 = 1;                              //envia sinal de alerta para o servidor
	BSF        PORTB+0, 3
;Solar.c,89 :: 		UART1_Write_Text("FD-NSOL");
	MOVLW      ?lstr7_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,90 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,91 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,92 :: 		}
	GOTO       L_main17
L_main16:
;Solar.c,93 :: 		else if(portc.f0 == 1 && LDR < 8.5)           //se tiver alimentação auxiliar
	BTFSS      PORTC+0, 0
	GOTO       L_main20
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      8
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _LDR+0, 0
	MOVWF      R0+0
	MOVF       _LDR+1, 0
	MOVWF      R0+1
	MOVF       _LDR+2, 0
	MOVWF      R0+2
	MOVF       _LDR+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
L__main26:
;Solar.c,95 :: 		portb.f3 = 0;
	BCF        PORTB+0, 3
;Solar.c,96 :: 		portb.f0 = 1;                              //liga alimentação auxiliar
	BSF        PORTB+0, 0
;Solar.c,97 :: 		portb.f1 = 0;                              //deixa habilitado a bateria
	BCF        PORTB+0, 1
;Solar.c,98 :: 		UART1_Write_Text("FH-BH");
	MOVLW      ?lstr8_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,99 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,100 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,101 :: 		portb.f0 = 0;                              //desliga alimentação auxiliar
	BCF        PORTB+0, 0
;Solar.c,102 :: 		portb.f1 = 1;                              //desabilita a bateria
	BSF        PORTB+0, 1
;Solar.c,103 :: 		UART1_Write_Text("FD-BD");
	MOVLW      ?lstr9_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,104 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,105 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,106 :: 		mede_bateria();                            //le valor de tensão da bateria
	CALL       _mede_bateria+0
;Solar.c,107 :: 		delay_ms(5000);
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
;Solar.c,108 :: 		if(bateria > 11.0)
	MOVF       _bateria+0, 0
	MOVWF      R0+0
	MOVF       _bateria+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      48
	MOVWF      R0+2
	MOVLW      130
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main22
;Solar.c,110 :: 		portb.f3 = 0;
	BCF        PORTB+0, 3
;Solar.c,111 :: 		portb.f1 = 0;                          //habilita a bateria
	BCF        PORTB+0, 1
;Solar.c,112 :: 		UART1_Write_Text("BC");
	MOVLW      ?lstr10_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,113 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,114 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,115 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;Solar.c,116 :: 		}
L_main22:
;Solar.c,117 :: 		}
L_main20:
L_main17:
L_main13:
;Solar.c,118 :: 		}
	GOTO       L_main24
L_main5:
;Solar.c,121 :: 		portb.f3 = 0;
	BCF        PORTB+0, 3
;Solar.c,122 :: 		portb.f1 = 0;
	BCF        PORTB+0, 1
;Solar.c,123 :: 		UART1_Write_Text("BC");
	MOVLW      ?lstr11_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,124 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,125 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,126 :: 		delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;Solar.c,127 :: 		}
L_main24:
;Solar.c,128 :: 		}
	GOTO       L_main3
;Solar.c,129 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

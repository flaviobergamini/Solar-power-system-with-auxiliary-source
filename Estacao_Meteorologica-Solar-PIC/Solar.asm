
_main:

;Solar.c,19 :: 		void main()
;Solar.c,21 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Solar.c,22 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;Solar.c,23 :: 		trisb = 0;
	CLRF       TRISB+0
;Solar.c,24 :: 		portb = 0;
	CLRF       PORTB+0
;Solar.c,25 :: 		trisc = 0b10000001;
	MOVLW      129
	MOVWF      TRISC+0
;Solar.c,26 :: 		portc = 0;
	CLRF       PORTC+0
;Solar.c,27 :: 		trisa = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;Solar.c,28 :: 		porta = 0;
	CLRF       PORTA+0
;Solar.c,29 :: 		adcon1 = 14;
	MOVLW      14
	MOVWF      ADCON1+0
;Solar.c,30 :: 		UART1_Write_Text("WS");
	MOVLW      ?lstr1_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,31 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,32 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,33 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;Solar.c,35 :: 		while (1)
L_main2:
;Solar.c,37 :: 		bateria1 = ADC_Read(0);
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
;Solar.c,39 :: 		bateria1 = (bateria1*12)/1023;
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
;Solar.c,40 :: 		bat = bateria1;
	MOVF       R0+0, 0
	MOVWF      _bat+0
	MOVF       R0+1, 0
	MOVWF      _bat+1
	MOVF       R0+2, 0
	MOVWF      _bat+2
	MOVF       R0+3, 0
	MOVWF      _bat+3
;Solar.c,41 :: 		UART1_Write_Text("BATERIA: ");
	MOVLW      ?lstr2_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,42 :: 		FloatToStr(bat, str_bat);
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
;Solar.c,43 :: 		UART1_Write_Text(str_bat);
	MOVLW      _str_bat+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,44 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,45 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,46 :: 		delay_ms(1000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;Solar.c,48 :: 		LDR = ADC_Read(1);
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
;Solar.c,49 :: 		LDR = (LDR*100)/1023;
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
;Solar.c,51 :: 		UART1_Write_Text("LDR: ");
	MOVLW      ?lstr3_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,52 :: 		FloatToStr(LDR, str_ldr);
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
;Solar.c,53 :: 		UART1_Write_Text(str_ldr);
	MOVLW      _str_ldr+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,54 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,55 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,57 :: 		bateria = bateria1;
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
;Solar.c,58 :: 		if(bateria < 8)
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      8
	SUBWF      R0+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Solar.c,60 :: 		if(LDR > 8.5)
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
	GOTO       L_main6
;Solar.c,62 :: 		UART1_Write_Text("LUZ");
	MOVLW      ?lstr4_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,63 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,64 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,66 :: 		UART1_Write_Text("BH");
	MOVLW      ?lstr5_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,67 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,68 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,69 :: 		}
	GOTO       L_main7
L_main6:
;Solar.c,70 :: 		else if(portc.f0 == 1)                        //verifica se tem tensão na fonte
	BTFSS      PORTC+0, 0
	GOTO       L_main8
;Solar.c,72 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;Solar.c,73 :: 		UART1_Write_Text("FH-BD");
	MOVLW      ?lstr6_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,74 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,75 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,76 :: 		delay_ms(90);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      212
	MOVWF      R12+0
	MOVLW      133
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;Solar.c,77 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;Solar.c,78 :: 		UART1_Write_Text("FD-BH");
	MOVLW      ?lstr7_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,79 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,80 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,81 :: 		if(bateria > 11.0)
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
	GOTO       L_main10
;Solar.c,83 :: 		UART1_Write_Text("BC");
	MOVLW      ?lstr8_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,84 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,85 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,86 :: 		}
L_main10:
;Solar.c,87 :: 		}
	GOTO       L_main11
L_main8:
;Solar.c,90 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;Solar.c,91 :: 		UART1_Write_Text("FD-B");
	MOVLW      ?lstr9_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,92 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,93 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,94 :: 		}
L_main11:
L_main7:
;Solar.c,95 :: 		}
	GOTO       L_main12
L_main5:
;Solar.c,98 :: 		UART1_Write_Text("BC");
	MOVLW      ?lstr10_Solar+0
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
;Solar.c,101 :: 		}
L_main12:
;Solar.c,102 :: 		}
	GOTO       L_main2
;Solar.c,103 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

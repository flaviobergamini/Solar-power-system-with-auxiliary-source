
_main:

;Solar.c,3 :: 		void main()
;Solar.c,5 :: 		UART1_Init(9600);
	MOVLW      103
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Solar.c,6 :: 		Delay_ms(100);
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
;Solar.c,7 :: 		trisb = 0;
	CLRF       TRISB+0
;Solar.c,8 :: 		portb = 0;
	CLRF       PORTB+0
;Solar.c,9 :: 		trisc = 0b10000001;
	MOVLW      129
	MOVWF      TRISC+0
;Solar.c,10 :: 		portc = 0;
	CLRF       PORTC+0
;Solar.c,11 :: 		trisa = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;Solar.c,12 :: 		porta = 0;
	CLRF       PORTA+0
;Solar.c,13 :: 		adcon1 = 14;
	MOVLW      14
	MOVWF      ADCON1+0
;Solar.c,14 :: 		UART1_Write_Text("Weather Station");
	MOVLW      ?lstr1_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,15 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,16 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,18 :: 		while (1)
L_main1:
;Solar.c,20 :: 		bateria = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _bateria+0
	MOVF       R0+1, 0
	MOVWF      _bateria+1
	MOVF       R0+2, 0
	MOVWF      _bateria+2
	MOVF       R0+3, 0
	MOVWF      _bateria+3
;Solar.c,21 :: 		bateria = (bateria*5)/1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
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
	MOVWF      _bateria+0
	MOVF       R0+1, 0
	MOVWF      _bateria+1
	MOVF       R0+2, 0
	MOVWF      _bateria+2
	MOVF       R0+3, 0
	MOVWF      _bateria+3
;Solar.c,22 :: 		bateria = (bateria*12)/5;
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
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _bateria+0
	MOVF       R0+1, 0
	MOVWF      _bateria+1
	MOVF       R0+2, 0
	MOVWF      _bateria+2
	MOVF       R0+3, 0
	MOVWF      _bateria+3
;Solar.c,24 :: 		LDR = ADC_Read(1);
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
;Solar.c,25 :: 		LDR = (LDR*100)/1023;
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
;Solar.c,27 :: 		if(bateria < 8.5)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      8
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _bateria+0, 0
	MOVWF      R0+0
	MOVF       _bateria+1, 0
	MOVWF      R0+1
	MOVF       _bateria+2, 0
	MOVWF      R0+2
	MOVF       _bateria+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Solar.c,29 :: 		if(LDR == 80)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	MOVF       _LDR+0, 0
	MOVWF      R0+0
	MOVF       _LDR+1, 0
	MOVWF      R0+1
	MOVF       _LDR+2, 0
	MOVWF      R0+2
	MOVF       _LDR+3, 0
	MOVWF      R0+3
	CALL       _Equals_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;Solar.c,31 :: 		UART1_Write_Text("Existe a presença de luz");
	MOVLW      ?lstr2_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,32 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,33 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,35 :: 		UART1_Write_Text("Fonte Desabilitada");
	MOVLW      ?lstr3_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,36 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,37 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,38 :: 		if(bateria == 12)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _bateria+0, 0
	MOVWF      R0+0
	MOVF       _bateria+1, 0
	MOVWF      R0+1
	MOVF       _bateria+2, 0
	MOVWF      R0+2
	MOVF       _bateria+3, 0
	MOVWF      R0+3
	CALL       _Equals_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;Solar.c,40 :: 		UART1_Write_Text("Bateria Carregada");
	MOVLW      ?lstr4_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,41 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,42 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,43 :: 		}
L_main5:
;Solar.c,44 :: 		}
	GOTO       L_main6
L_main4:
;Solar.c,45 :: 		else if(portc.f0 == 1)                        //verifica se tem tensão na fonte
	BTFSS      PORTC+0, 0
	GOTO       L_main7
;Solar.c,47 :: 		portb.f0 = 1;
	BSF        PORTB+0, 0
;Solar.c,48 :: 		UART1_Write_Text("Fonte Habilitada");
	MOVLW      ?lstr5_Solar+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Solar.c,49 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,50 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Solar.c,51 :: 		delay_ms(90);                        //tempo de 30 minutos
	MOVLW      2
	MOVWF      R11+0
	MOVLW      212
	MOVWF      R12+0
	MOVLW      133
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
;Solar.c,52 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;Solar.c,53 :: 		UART1_Write_Text("Fonte Desabilitada");
	MOVLW      ?lstr6_Solar+0
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
;Solar.c,56 :: 		if(bateria == 12)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       _bateria+0, 0
	MOVWF      R0+0
	MOVF       _bateria+1, 0
	MOVWF      R0+1
	MOVF       _bateria+2, 0
	MOVWF      R0+2
	MOVF       _bateria+3, 0
	MOVWF      R0+3
	CALL       _Equals_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;Solar.c,58 :: 		UART1_Write_Text("Bateria Carregada");
	MOVLW      ?lstr7_Solar+0
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
;Solar.c,61 :: 		}
L_main9:
;Solar.c,62 :: 		}
	GOTO       L_main10
L_main7:
;Solar.c,63 :: 		else if(LDR < 80)
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      133
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
	GOTO       L_main11
;Solar.c,65 :: 		portb.f0 = 0;
	BCF        PORTB+0, 0
;Solar.c,66 :: 		UART1_Write_Text("Fonte Desabilitada e bateria com tensão igual ou maior que 8.5V");
	MOVLW      ?lstr8_Solar+0
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
L_main11:
L_main10:
L_main6:
;Solar.c,70 :: 		}
L_main3:
;Solar.c,71 :: 		}
	GOTO       L_main1
;Solar.c,72 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

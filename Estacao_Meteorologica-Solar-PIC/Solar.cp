#line 1 "C:/Users/fhmbe/Meus projetos/Estacao_Meteorologica-Solar/Solar-power-system-with-auxiliary-source/Estacao_Meteorologica-Solar-PIC/Solar.c"
#line 15 "C:/Users/fhmbe/Meus projetos/Estacao_Meteorologica-Solar/Solar-power-system-with-auxiliary-source/Estacao_Meteorologica-Solar-PIC/Solar.c"
float bateria1, LDR, bat;
char str_bat[4];
char str_ldr[4];
int bateria;

void mede_bateria()
{
 bateria1 = ADC_Read(0);

 bateria1 = (bateria1*12)/1023;
 bat = bateria1;
 UART1_Write_Text("BATERIA: ");
 FloatToStr(bat, str_bat);
 UART1_Write_Text(str_bat);
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(1000);
}

void main()
{
 UART1_Init(9600);
 Delay_ms(100);
 trisb = 0;
 portb = 0;
 trisc = 0b10000001;
 portc = 0;
 trisa = 0b00000011;
 porta = 0;
 adcon1 = 14;
 UART1_Write_Text("WS");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(1000);
 while (1)
 {
 mede_bateria();

 LDR = ADC_Read(1);
 LDR = (LDR*100)/1023;

 UART1_Write_Text("LDR: ");
 FloatToStr(LDR, str_ldr);
 UART1_Write_Text(str_ldr);
 UART1_Write(10);
 UART1_Write(13);

 bateria = bateria1;
 if(bateria < 8)
 {
 if(LDR > 8.5 && (portc.f0 == 0 || portc.f0 == 1))
 {
 UART1_Write_Text("LUZ");
 UART1_Write(10);
 UART1_Write(13);
 portb.f3 = 0;
 portb.f0 = 0;
 portb.f1 = 0;
 if(portc.f0 == 0)
 {
 UART1_Write_Text("FD");
 UART1_Write(10);
 UART1_Write(13);
 }
 else
 {
 UART1_Write_Text("FH");
 UART1_Write(10);
 UART1_Write(13);
 }
 }
 else if(portc.f0 == 0 && LDR < 8.5)
 {
 portb.f3 = 1;
 UART1_Write_Text("FD-NSOL");
 UART1_Write(10);
 UART1_Write(13);
 }
 else if(portc.f0 == 1 && LDR < 8.5)
 {
 portb.f3 = 0;
 portb.f0 = 1;
 portb.f1 = 0;
 UART1_Write_Text("FH-BH");
 UART1_Write(10);
 UART1_Write(13);
 portb.f0 = 0;
 portb.f1 = 1;
 UART1_Write_Text("FD-BD");
 UART1_Write(10);
 UART1_Write(13);
 mede_bateria();
 delay_ms(5000);
 if(bateria > 11.0)
 {
 portb.f3 = 0;
 portb.f1 = 0;
 UART1_Write_Text("BC");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(500);
 }
 }
 }
 else
 {
 portb.f3 = 0;
 portb.f1 = 0;
 UART1_Write_Text("BC");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(500);
 }
 }
}

#line 1 "C:/Users/fhmbe/Meus projetos/Estacao_Meteorologica-Solar/Solar-power-system-with-auxiliary-source/Estacao_Meteorologica-Solar-PIC/Solar.c"
float bateria, LDR;

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
 UART1_Write_Text("Weather Station");
 UART1_Write(10);
 UART1_Write(13);

 while (1)
 {
 bateria = ADC_Read(0);
 bateria = (bateria*5)/1023;
 bateria = (bateria*12)/5;

 LDR = ADC_Read(1);
 LDR = (LDR*100)/1023;

 if(bateria < 8.5)
 {
 if(LDR == 80)
 {
 UART1_Write_Text("Existe a presença de luz");
 UART1_Write(10);
 UART1_Write(13);

 UART1_Write_Text("Fonte Desabilitada");
 UART1_Write(10);
 UART1_Write(13);
 if(bateria == 12)
 {
 UART1_Write_Text("Bateria Carregada");
 UART1_Write(10);
 UART1_Write(13);
 }
 }
 else if(portc.f0 == 1)
 {
 portb.f0 = 1;
 UART1_Write_Text("Fonte Habilitada");
 UART1_Write(10);
 UART1_Write(13);
 delay_ms(90);
 portb.f0 = 0;
 UART1_Write_Text("Fonte Desabilitada");
 UART1_Write(10);
 UART1_Write(13);
 if(bateria == 12)
 {
 UART1_Write_Text("Bateria Carregada");
 UART1_Write(10);
 UART1_Write(13);
 }
 }
 else if(LDR < 80)
 {
 portb.f0 = 0;
 UART1_Write_Text("Fonte Desabilitada e bateria com tensão igual ou maior que 8.5V");
 UART1_Write(10);
 UART1_Write(13);
 }
 }
 }
}

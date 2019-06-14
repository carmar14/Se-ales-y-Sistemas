#include <FreeRTOS_ARM.h>


float output=0;
float coef[61] = {0.0002,0.0006,0.0010,0.0012,0.0010,0.0005,-0.0005,-0.0018,-0.0032,-0.0040,-0.0037,-0.0020,0.0012,0.0053,0.0091,0.0113,0.0106,0.0060,-0.0021,-0.0123,-0.0222,-0.0285,-0.0278,-0.0176,0.0028,0.0322,0.0674,0.1034,0.1346,0.1557,0.1632,0.1557,0.1346,0.1034,0.0674,0.0322,0.0028,-0.0176,-0.0278,-0.0285,-0.0222,-0.0123,-0.0021,0.0060,0.0106,0.0113,0.0091,0.0053,0.0012,-0.0020,-0.0037,-0.0040,-0.0032,-0.0018,-0.0005,0.0005,0.0010,0.0012,0.0010,0.0006,0.0002};
float x[61]={0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000};


void setup() {

analogWriteResolution(12); 
analogReadResolution(12);
pinMode(DAC0,OUTPUT);
pinMode(13,OUTPUT);

xTaskCreate(salida, NULL,configMINIMAL_STACK_SIZE , NULL, 1, NULL);
vTaskStartScheduler(); 

}


//Tarea de filtrar la señal
static void salida(void*arg){

portTickType xLastWakeTime;
xLastWakeTime = xTaskGetTickCount();

  while (1) {
    digitalWrite(13,HIGH);
    float sensorValue=analogRead(A0);
    x[0]=sensorValue;
  
    for (int k = 0; k < 61; k++)   output=coef[k]*x[k] + output;
            
    analogWrite(DAC0,output);
    output=0;

    for(int i=1;i<62;i++)    x[62-i]=x[61-i];
    digitalWrite(13,LOW);
    vTaskDelayUntil(&xLastWakeTime,(2/portTICK_RATE_MS));
    
    }
    
  }
  
void loop() {}



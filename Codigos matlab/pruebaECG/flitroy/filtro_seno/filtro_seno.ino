
#include <FreeRTOS_ARM.h>


float output=0;
float coef[61] = {0.0007,0.0009,0.0010,0.0012,0.0013,0.0013,0.0011,0.0006,-0.0002,-0.0014,-0.0029,-0.0047,-0.0065,-0.0083,-0.0096,-0.0102,-0.0097,-0.0079,-0.0045,0.0007,0.0076,0.0161,0.0259,0.0367,0.0479,0.0589,0.0690,0.0776,0.0842,0.0884,0.0898,0.0884,0.0842,0.0776,0.0690,0.0589,0.0479,0.0367,0.0259,0.0161,0.0076,0.0007,-0.0045,-0.0079,-0.0097,-0.0102,-0.0096,-0.0083,-0.0065,-0.0047,-0.0029,-0.0014,-0.0002,0.0006,0.0011,0.0013,0.0013,0.0012,0.0010,0.0009,0.0007};
float x[61]={0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000};


void setup() {

analogWriteResolution(12); 
analogReadResolution(12);
pinMode(DAC0,OUTPUT);

xTaskCreate(salida, NULL,configMINIMAL_STACK_SIZE , NULL, 1, NULL);
vTaskStartScheduler(); 

}


//Tarea de filtrar la señal
static void salida(void*arg){

portTickType xLastWakeTime;
xLastWakeTime = xTaskGetTickCount();

  while (1) {
  
    float sensorValue=analogRead(A0);
    x[0]=sensorValue;
  
    for (int k = 0; k < 61; k++)   output=coef[k]*x[k] + output;
            
    
    analogWrite(DAC0,output);
    output=0;

    for(int i=1;i<62;i++)    x[62-i]=x[61-i];
  
    vTaskDelayUntil(&xLastWakeTime,(1/portTICK_RATE_MS));
    
    }
    
  }

void loop() {}



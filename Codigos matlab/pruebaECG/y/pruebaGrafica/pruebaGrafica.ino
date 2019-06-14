#include <FreeRTOS_ARM.h>

float seno[500];
int i=1;

// Declare the thread function for thread 2.
static void Thread1(void* arg) {

portTickType xLastWakeTime;

xLastWakeTime = xTaskGetTickCount();

  while (1) {
   seno[i-1]=analogRead(A0);
   
   
   if (i==500){
    //Serial.print('E');
    for (int k=0;k<500;k++){
    Serial.println(seno[k]);
    }
    
    //Serial.println();
    i=0;
   }
   
   vTaskDelayUntil(&xLastWakeTime, (2/portTICK_RATE_MS));
    i++;   
  }
}


void setup() {
  
analogWriteResolution(12);  //Resolucion de 12 bits, valores entre 0 y 4095
pinMode(DAC0,OUTPUT);
pinMode(DAC1,OUTPUT);
Serial.begin(115200);


xTaskCreate(Thread1, NULL,configMINIMAL_STACK_SIZE , NULL, 1, NULL);
vTaskStartScheduler(); 
  
}

void loop() {}

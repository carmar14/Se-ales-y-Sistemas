#include <FreeRTOS_ARM.h>
float a[8]={0.0031,-0.0096,0.0136,-0.0065,-0.0065,0.0136,-0.0096,0.0031};
float b[7]={-5.7911, 14.8576, -21.8117, 19.7466, -11.0104,3.4987, -0.4887};
float output = 0;
float output_x = 0;
float output_y = 0;
float x[8]={0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000};
float y[7]={0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000};


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
  
    int sensorValue=analogRead(A0);
    
    for(int i=2;i<9;i++){    //for(int i=1;i<9;i++){   
      x[9-i]=x[8-i];
    }
    
    
    x[0]=sensorValue;
    
  
    for (int k = 0; k < 8; k++)   output_x=a[k]*x[k] + output_x;

    for (int k = 0; k < 7; k++)   output_y=b[k]*y[k] + output_y;

    output = output_x - output_y;

     for(int i=2;i<8;i++){    //for(int i=1;i<8;i++){ 
     y[8-i]=y[7-i];
    }

    y[0]=output;
    
        
    analogWrite(DAC0,output);
    output_x = 0; output_y = 0;

    vTaskDelayUntil(&xLastWakeTime,(2/portTICK_RATE_MS));
    
    }
    
  }
  
void loop() {}



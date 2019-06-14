
#include <FreeRTOS_ARM.h>
#undef F
#define F(str) str
portBASE_TYPE h1;

float output=0;
float coef[51] = {0.0006,-0.0000,-0.0010,0.0000,0.0017,-0.0000,-0.0028,0.0000,0.0044,-0.0000,-0.0069,0.0000,0.0105,-0.0000,-0.0158,0.0000,0.0236,-0.0000,-0.0356,0.0000,0.0562,-0.0000,-0.1014,0.0000,0.3166,0.4998,0.3166,0.0000,-0.1014,-0.0000,0.0562,0.0000,-0.0356,-0.0000,0.0236,0.0000,-0.0158,-0.0000,0.0105,0.0000,-0.0069,-0.0000,0.0044,0.0000,-0.0028,-0.0000,0.0017,0.0000,-0.0010,-0.0000,0.0006};
float x[51]={0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000};
void setup() {

  // put your setup code here, to run once:
analogWriteResolution(12); 
analogReadResolution(12);
pinMode(DAC0,OUTPUT);
h1=xTaskCreate(salida, NULL,configMINIMAL_STACK_SIZE , NULL, 1, NULL);
vTaskStartScheduler(); 
}


//Tarea de filtrar la señal
static void salida(void*arg){
portTickType xLastWakeTime;
//const portTickType freq = 1;
xLastWakeTime = xTaskGetTickCount();
  while (1) {
    float sensorValue=analogRead(A0);
    for(int i=1;i<52;i++){
    x[52-i]=x[51-i];
    }
    x[0]=sensorValue;
  
for (int k = 0; k < 51; k++) {
  
  output=coef[k]*x[k]+output;
    
    }
analogWrite(DAC0,output);
vTaskDelayUntil(&xLastWakeTime, (1/portTICK_RATE_MS));
    }
    
  }

void loop() {


  
}

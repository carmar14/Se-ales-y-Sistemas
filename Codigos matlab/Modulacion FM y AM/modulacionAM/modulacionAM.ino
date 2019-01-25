//Señal de tiempo
double t=0;
//Señal moduladora/mensaje
double mt=0;
//Señal portadora
double ct=0;
//Señal modulada
double sm=0;

double smm=0;
double sd=0;
//Parametros del filtro FIR para obtener el mensaje
double b[17]={0.00896970595068511, 0.0129781856072802 , 0.0243639168247371,  0.0414892027331748,  0.0617902770616952,  0.0821756485634424,  0.0995120990041507 , 0.111120436253538, 0.115201056002593, 0.111120436253538, 0.0995120990041507 , 0.0821756485634424 , 0.0617902770616952 , 0.0414892027331748  ,0.0243639168247371 , 0.0129781856072802 , 0.00896970595068511};
int i=0;
int k=0;

double x[17]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //Entradas
double y[17]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //Salidas
double salida=0;
double cx=0;
double cy=0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  analogReadResolution(12);
  analogWriteResolution(12);
}

void loop() {
  //Proceso de modulacion AM
  mt=10*0.5*sin(50*t);
  ct=20*sin(500*t);
  sm=mt*ct;
  //Proceso de demodulacion
  smm=sm*ct;
  //smm=25*ct;
  x[0]=smm;
  //if(i==16)i=0;
  //Serial.print(sm);
  //Serial.print('\t');
  for (k=0;k<17;k++){
      cx+=b[k]*x[k];
    }

   sd=cx;
   //Actualizacion
   for(k=17;k<=1;k--){
      x[k]=x[k-1];
    }
  Serial.println(sd);
  //i+=1;
  t+=0.001;
}

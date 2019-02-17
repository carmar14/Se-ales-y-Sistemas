# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 14:15:34 2017

@author: Administrador
"""
import soundfile as sf
import matplotlib.pyplot as plt
import winsound

data, samplerate = sf.read('Hola.wav')
data=data[:,0] #Como el archivo esta grabado en formato estereo, se trabaja un solo canal, es decir formato monofonico
#sf.write('sonido2.wav', data, samplerate) #Si se desea guardar el formato monofonico, descomentar esta linea
#winsound.PlaySound('sonido2.wav',winsound.SND_FILENAME) #Si se desea escuchar el archivo previamente guardado en formato monofonico


t=[]    #Vector de tiempo
x=[]    #Señal
tiempo=0
cuenta=0
tm=1.0/samplerate #Tiempo de muestreo

#Llenar vector de tiempo y señal
#while tiempo+tm<=len(data)*tm:  #para el audio de Sonido.wav  y hola.wav
while tiempo <=len(data)*tm-tm:  
    t.append(round(tiempo,3))
    x.append(data[cuenta])
    cuenta=cuenta+1
    tiempo=tiempo+tm

#Desplazar señal
a=5 #Desplazar la señal cinco segundos a la derecha
td=[]
xd=[]
tiempo=0
cuenta=0
#print len(data)*tm++t[len(data)-1]+a
while tiempo+tm<=len(data)*tm+a:
    td.append(round(tiempo,3))
    if tiempo<a:
        xd.append(0)
    else:
        xd.append(x[cuenta])
        cuenta=cuenta+1
        
    tiempo=tiempo+tm

#Guardar archivo de sonido con la operación de desplazamiento temporal y reproduccion del mismo
sf.write('sonidod.wav', xd, samplerate)
winsound.PlaySound('sonidod.wav',winsound.SND_FILENAME)

#Inversion de la señal
ti=[]
xi=[]
tiempo=0
cuenta=len(data)-1
while tiempo+tm<=len(data)*tm:
    ti.append(-t[cuenta])
    xi.append(x[cuenta])  
    cuenta=cuenta-1    
    tiempo=tiempo+tm

#Guardar archivo de sonido con la operación de inversion temporal y reproduccion del mismo
sf.write('sonidoi.wav', xi, samplerate)
winsound.PlaySound('sonidoi.wav',winsound.SND_FILENAME)

#Señal dilatada x=(t/2)
a=2
ted=[]
xed=[]
tiempo=0
cuenta=0
cuenta2=0
while tiempo+tm<=a*len(data)*tm:
    mod=divmod(cuenta2,a)
    if mod[1]==0:
        ted.append(tiempo)
        xed.append(x[cuenta]) 
        cuenta=cuenta+1 
    else:
        ted.append(tiempo)
        xed.append(0)
    
    cuenta2=cuenta2+1
       
    tiempo=tiempo+tm
#Guardar archivo de sonido con la operación de escalamiento temporal y reproduccion del mismo    
sf.write('sonidoed.wav', xed, samplerate)
winsound.PlaySound('sonidoed.wav',winsound.SND_FILENAME)

#Señal comprimida x=(2t)
tec=[]
xec=[]
tiempo=0
cuenta=0

while tiempo+tm/a<=len(data)*tm/a:
    mod=divmod(cuenta,a)
    if mod[1]==0:
        tec.append(tiempo)
        xec.append(x[cuenta]) 
    cuenta=cuenta+1 
    tiempo=tiempo+tm/a
    
#Guardar archivo de sonido con la operación de escalamiento temporal y reproduccion del mismo    
sf.write('sonidoec.wav', xec, samplerate)
winsound.PlaySound('sonidoec.wav',winsound.SND_FILENAME)

#A continuacion se grafican cada una de las trasnformaciones pro separado
plt.figure()
#plt.subplot(5,1,1)
plt.plot(t,x)
plt.title('Original')
plt.figure()
#plt.subplot(5,1,2)
plt.plot(td,xd)
plt.title('Desplazada')
plt.figure()
#plt.subplot(5,1,3)
plt.plot(ti,xi)
plt.title('Invertida')
plt.figure()
plt.plot(ted,xed)
plt.title('Escalada 0<alpha<1')
plt.figure()
plt.plot(tec,xec)
plt.title('Escalada alpha>1')
plt.show()  


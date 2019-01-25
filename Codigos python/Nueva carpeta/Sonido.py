# -*- coding: utf-8 -*-
"""
Created on Thu Aug 17 14:15:34 2017

@author: Administrador
"""
import soundfile as sf
import matplotlib.pyplot as plt
import winsound

#data, samplerate = sf.read('uno.wav')
data, samplerate = sf.read('Hola.wav')
data=data[:,0] #Hola.wav,Sonido.wav
#sf.write('sonido2.wav', data, samplerate)
#winsound.PlaySound('sonido2.wav',winsound.SND_FILENAME)
#

t=[]    #Vector de tiempo
x=[]    #Señal
tiempo=0
cuenta=0
tm=1.0/samplerate#Tiempo de muestreo

#Llenar vector de tiempo y señal
while tiempo+tm<=len(data)*tm:  #para el audio de Sonido.wav  y hola.wav
#while tiempo <=len(data)*tm:
    t.append(round(tiempo,3))
    x.append(data[cuenta])
    cuenta=cuenta+1
    tiempo=tiempo+tm

#Desplazar señal
a=2 #Desplazar la señal dos segundos a la derecha
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
    mod=divmod(cuenta2,2)
    if mod[1]==0:
        ted.append(tiempo)
        xed.append(x[cuenta]) 
        cuenta=cuenta+1 
    else:
        ted.append(tiempo)
        xed.append(0)
    
    cuenta2=cuenta2+1
       
    tiempo=tiempo+tm
    
sf.write('sonidoed.wav', xed, samplerate)
winsound.PlaySound('sonidoed.wav',winsound.SND_FILENAME)

#Señal comprimida x=(2t)

tec=[]
xec=[]
tiempo=0
cuenta=0
#cuenta2=0
while tiempo+tm/a<=len(data)*tm/a:
    mod=divmod(cuenta,2)
    if mod[1]==0:
        tec.append(tiempo)
        xec.append(x[cuenta]) 
        '''cuenta=cuenta+1 
    else:
        ted.append(tiempo)
        xed.append(0)'''
    cuenta=cuenta+1 
    #cuenta2=cuenta2+1
       
    tiempo=tiempo+tm/a
    
    
sf.write('sonidoec.wav', xec, samplerate)
winsound.PlaySound('sonidoec.wav',winsound.SND_FILENAME)

plt.figure()
plt.subplot(5,1,1)
plt.plot(t,x)
plt.subplot(5,1,2)
plt.plot(td,xd)
plt.subplot(5,1,3)
plt.plot(ti,xi)

plt.figure()
plt.plot(ted,xed)

plt.figure()
plt.plot(tec,xec)

plt.show()


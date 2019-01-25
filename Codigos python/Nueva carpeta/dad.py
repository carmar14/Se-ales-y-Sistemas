# -*- coding: utf-8 -*-

import soundfile as sf
import matplotlib.pyplot as plt
import winsound

data, samplerate = sf.read('uno.wav')

t=[]    #Vector de tiempo
x=[]    #Señal
tiempo=0
cuenta=0
tm=1.0/samplerate#Tiempo de muestreo

#Llenar vector de tiempo y señal
while tiempo<=len(data)*tm:
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
print len(data)
print len(t)
print len(data)*tm++t[len(data)-1]+a
while tiempo+tm<=len(data)*tm+a:
    td.append(round(tiempo,3))
    if tiempo<2:
        xd.append(0)
    else:
        xd.append(x[cuenta])
        cuenta=cuenta+1

    tiempo=tiempo+tm

#sf.write('sonidod.wav', xd, samplerate)
#winsound.PlaySound('sonidod.wav',winsound.SND_FILENAME)

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

plt.figure()
plt.subplot(3,1,1)
plt.plot(t,x)
plt.subplot(3,1,2)
plt.plot(td,xd)
plt.subplot(3,1,3)
plt.plot(ti,xi)
plt.show()
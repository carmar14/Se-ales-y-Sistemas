# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal
"""

import matplotlib.pyplot as plt
import numpy as np



t=[]    #Vector de tiempo
x=[]    #Señal
tiempo=-5

tm=0.001 #Tiempo de muestreo
#Llenar vector de tiempo
while tiempo+0.001<=5:
    t.append(round(tiempo,3))
    if tiempo<0:
        x.append(0)
    else:
        x.append(1)

    tiempo=tiempo+0.001

plt.figure()
plt.subplot(3,1,1)
plt.plot(t,x)
plt.xlim(-5,5)
plt.ylim(-0.5,1.5)
#plt.xlabel("Tiempo (s)", fontsize = 10)
plt.ylabel("Amplitud", fontsize = 10)
plt.title("Senal escalon original", fontsize = 10)

#Desplazamiento
a=1.7 #Valor a desplazar
xd=[]
tiempo=-5
while tiempo+0.001<=5:
    if tiempo<a:
        xd.append(0)
    else:
        xd.append(1)

    tiempo=tiempo+0.001

plt.subplot(3,1,2)
plt.plot(t,xd)
plt.xlim(-5,5)
plt.ylim(-0.5,1.5)
#plt.xlabel("Tiempo (s)", fontsize = 10)
plt.ylabel("Amplitud", fontsize = 10)
plt.title("Senal escalon desplazada a unidades", fontsize = 10)

#Inversion
xi=[]
tiempo=-5
while tiempo+0.001<=5:
    if tiempo<0:
        xi.append(1)
    else:
        xi.append(0)

    tiempo=tiempo+0.001

plt.subplot(3,1,3)
plt.plot(t,xi)
plt.xlim(-5,5)
plt.ylim(-0.5,1.5)
plt.xlabel("Tiempo (s)", fontsize = 10)
plt.ylabel("Amplitud", fontsize = 10)
plt.title("Senal escalon invertida", fontsize = 10)
plt.show()



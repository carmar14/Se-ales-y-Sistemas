# -*- coding: utf-8 -*-
"""
Created on Fri Sep 22 17:07:26 2017

@author: Administrador
"""

from scipy import signal
import matplotlib.pyplot as plt

sys = signal.lti(3, [1,4,3]) # Creamos el sistema
t,y=signal.step2(sys)

plt.figure()
plt.plot(t,y)

plt.title('Respuesta al escalon')
plt.xlabel('Tiempo(s)')
plt.ylabel('Voltaje(V)')


plt.figure()

plt.plot(sys.zeros.real, sys.zeros.imag,'o',sys.poles.real, sys.poles.imag,'x')


plt.title('Mapa de polos y ceros')

plt.show()
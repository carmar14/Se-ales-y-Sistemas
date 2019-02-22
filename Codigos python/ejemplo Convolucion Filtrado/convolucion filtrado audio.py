# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal
"""

from scipy.signal import firwin, lfilter
from scipy.io.wavfile import write
import numpy as np
import matplotlib.pyplot as plt
import soundfile as sf
import winsound

def generarRuido(data,fs):
    l=len(data)
    f1=300;
    f2=13000;
    f3=100;
    t = np.linspace(0,l/fs, l, endpoint=False)
    r=np.sin(2*np.pi*f1*t)+np.sin(2*np.pi*f2*t)+np.sin(2*np.pi*f3*t)
    r=r*0.5
    return r

def filtrar(dato,filtro):
    sf=lfilter(filtro,1,dato)
    return sf
    
def leerSonido():
    data, samplerate = sf.read('Hola.wav')
    return data,samplerate
    
def disenarFiltro_PasaBanda(fc_baja,fc_alta,orden,fs):
    
    filtro=firwin(orden,[fc_baja/(fs/2.0),fc_alta/(fs/2.0)],window=0.5)
    return filtro

def graficar(data,sruido,sf,fs):
    l=len(data)
    t = np.linspace(0,l/fs, l, endpoint=False)
    plt.figure()
    plt.plot(t,data)
    plt.title('Original')
    plt.figure()
    plt.plot(t,sruido)
    plt.title('Contaminada')
    plt.figure()
    plt.plot(t,sf)
    plt.title('Filtrada')
    plt.show()
    
    
def escuchar(sr,sf,samplerate):
    winsound.PlaySound('Hola.wav',winsound.SND_FILENAME)
    sr= np.int16(sr* 32767)
    sf=np.int16(sf* 32767)
    write('sr.wav',samplerate,sr)
    winsound.PlaySound('sr.wav',winsound.SND_FILENAME)
    write('sf.wav',samplerate,sf)
    winsound.PlaySound('sf.wav',winsound.SND_FILENAME)
    

    
def gestion():
    data, samplerate =leerSonido()
    data=data[:,0]
    ruido=generarRuido(data,samplerate)
    sr=ruido+data    
    filtro=disenarFiltro_PasaBanda(800,8000,397,samplerate)
    sf=filtrar(data,filtro)
    graficar(data,sr,sf,samplerate)
    escuchar(sr,sf,samplerate)
    
if __name__ == "__main__":
    
    
    gestion()
    
    
    
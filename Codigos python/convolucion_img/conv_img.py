import numpy as np
import cv2
from matplotlib import pyplot as plt
import matplotlib.image as mpimg
from skimage.exposure import rescale_intensity

def cargarImagen():
    global img
    img = mpimg.imread('torre.jpg')
    showResultados(img)
    plt.title('Imagen Original')

def maskEnfoque():
    #filtro box
    enfocar = np.zeros((3, 3), np.float32)
    enfocar[0,1]=-1
    enfocar[1,0]=-1
    enfocar[1,1]=5
    enfocar[1,2]=-1
    enfocar[2,1]=-1

    #enfocar+=np.ones((3, 3), np.float32)
    #enfocar/=10

    print(enfocar)

    imgE = filtrar(enfocar)  # Desenfocar

    showResultados(imgE)
    plt.title('Imagen Enfocada')
    #imgE = cv2.filter2D(img, -1, np.rot90(np.rot90(enfocar)))  # Desenfocar
    #showResultados(imgE)
    #plt.title('Imagen Enfocada usando comando')

def maskRepujado():
    #promedio pesado
    '''desenfocar = np.ones((3, 3), np.float32) / 16
    desenfocar[0, 1] = 2
    desenfocar[1, 0] = 2
    desenfocar[1, 1] = 4
    desenfocar[1, 2] = 2
    desenfocar[2, 1] = 2'''

    repujar = np.ones((3, 3), np.float32)
    repujar[0, 0] = -2
    repujar[0, 1] = -1
    repujar[1, 0] = -1
    repujar[2, 2] = 2
    repujar[2, 0] = 0
    repujar[0, 2] = 0


    print(repujar)


    #imgD = filtrar(desenfocar)  # Desenfocar
    imgR=filtrar(repujar)

    showResultados(imgR)#+img[0:imgR.shape[0],0:imgR.shape[1],:])
    plt.title('Imagen Repujada')
    #imgR = cv2.filter2D(img, -1, np.rot90(np.rot90(repujar)))
    #showResultados(imgR)
    #plt.title('Imagen Repujada usando comando')

def maskDesenfoque():
    # filtro box
    desenfocar = np.ones((3, 3), np.float32) / 9
    imgD = filtrar(desenfocar)  # Desenfocar
    showResultados(imgD)
    plt.title('Imagen Desenfocada con Filtro Box')
    #imgD = cv2.filter2D(img, -1, np.rot90(np.rot90(desenfocar)))  # Desenfocar
    #showResultados(imgD)
    #plt.title('Imagen Desenfocada usando comando')

def filtrar(kernel):

    rows = img.shape[0] - kernel.shape[0] + 1
    cols = img.shape[1] - kernel.shape[1] + 1
    depth = img.shape[2]  # -kernel.shape[2]+1
    #print(depth)
    salida = np.zeros((rows, cols, depth), np.float32)  # 'uint8')
    kernel_inv =np.rot90(np.rot90(kernel))

    for i in range(0, salida.shape[0]):
        for j in range(0, salida.shape[1]):
            for k in range(0, salida.shape[2]):
                # desplazando el kernel por cada capa (RGB)
                signal_patch = img[i:i + len(kernel), j:j + len(kernel), k]
                salida[i][j][k] = (kernel_inv * signal_patch).sum()
    #salida = cv2.filter2D(img, -1, kernel_inv)

    salida = rescale_intensity(salida, in_range=(0, 255))
    salida = (salida * 255).astype("uint8")

    return salida

def showResultados(salida):

    plt.figure()
    plt.imshow(salida)

def gestionar():
    #global enfocar,desenfocar
    cargarImagen()
    maskEnfoque()
    maskDesenfoque()
    maskRepujado()
    plt.show()
    '''imgD=filtrar(desenfocar) # Desenfocar
    showResultados(imgD)'''

def codigo():
    img = mpimg.imread('torre.jpg')

    [r,c,d]=img.shape
    print(r)
    print(c)
    print(d)

    #kernel=np.array([[1, 0, 0], [0, 1, 0], [0, 0, 1]], 'uint8')
    kernel = np.ones((3,3),np.float32)/9

    #signal=np.array([[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], 'uint8')

    rows=img.shape[0]-kernel.shape[0]+1
    cols=img.shape[1]-kernel.shape[1]+1
    depth=img.shape[2]#-kernel.shape[2]+1
    print(depth)
    salida=np.zeros((rows,cols,depth), np.uint8)#'uint8')

    print(salida.shape[2])
    kernel_inv=np.rot90(np.rot90(kernel))

    for i in range(0, salida.shape[0]):
       for j in range(0, salida.shape[1]):
           for k in range(0,salida.shape[2]):
                #desplazando el kernel por cada capa (RGB)
                signal_patch=img[i:i+len(kernel),j:j+len(kernel),k]
                salida[i][j][k]=(kernel_inv*signal_patch).sum()

    #print(type(salida))
    #imgF = cv2.filter2D(img,-1,kernel_inv)

    #print(imgF.shape)
    #print(salida.shape)

    #Graficas
    plt.figure()
    plt.imshow(img)
    plt.figure()
    plt.imshow(salida)
    plt.figure()
    plt.imshow(imgF)
    plt.show()

if __name__ == "__main__":
    gestionar()
import numpy as np
from matplotlib import pyplot as plt
import matplotlib.image as mpimg
from skimage.transform import resize

img=mpimg.imread('torre.jpg')

[m,n,o]=img.shape  #obtengo las dimensiones de la imagen
print(img.shape)
#traslacion
y=50
x=10
imgD= np.zeros((m+x, n+y, o), np.uint8)

#print(imgD.shape)
for i in range(0,m):
    for j in range(0,n):

        pi=i+x
        pj=j+y
        if pi>0 and pj>0:
            imgD[pi][pj][:]=img[i,j,:]

#inversion Horizontal
imgR= np.zeros((m, n, o), np.uint8)
for i in range(0,m):
    for j in range(0,n-1):
        cj=n-j-1
        imgR[i][cj][:]=img[i,j+1,:]

#Escalamiento
imgE=resize(img,(3*m,3*n))

plt.figure()
plt.imshow(img),plt.title('Original')
plt.figure()
plt.imshow(imgD[0:m,0:n,:]), plt.title('Desplazada')
plt.figure()
plt.imshow(imgR), plt.title('Reflexion Horizontal')
plt.figure()
plt.imshow(imgE),plt.title('Imagen escalada')
plt.show()


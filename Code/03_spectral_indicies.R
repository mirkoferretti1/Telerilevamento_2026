library(terra)
library(imageRy)
library(viridis)

#listing files
im.list()

#importing data

mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

mato1992 <- flip(mato1992) #girare l'immagine, invertendo il nord con il sud

#l1=NIR, l2=red, l3=green
im.plotRGB(mato1992, 1, 2, 3)

#esercizio: mettere NIR nella componente verde dello schema RGB

im.plotRGB(mato1992, 2, 1, 3)

#NIR nella componente blue

im.plotRGB(mato1992, 3, 2, 1)

#Esercizio: importare l'immagine del 2006
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

mato2006 <- flip(mato2006) 

im.plotRGB(mato2006, 1, 2, 3)

Esercizio: fare un multiframe con due immagini una vicino all'altra

im.multiframe(1,2)

im.plotRGB(mato1992, 1, 2, 3)
im.plotRGB(mato2006, 1, 2, 3)

#NIR su verde
im.multiframe(1,2)

im.plotRGB(mato1992, 2, 1, 3)
im.plotRGB(mato2006, 2, 1, 3)

#NIR su blu
im.multiframe(1,2)

im.plotRGB(mato1992, 3, 2, 1)
im.plotRGB(mato2006, 3, 2, 1)

#DVI
#l1=NIR, l2=red, l3=green

dvi1992 <- mato1992[[1]] - mato1992[[2]]
plot(dvi1992)

#valore teorico
#8 bit
#NIR - red= 255 - 0 = 255 #massimo DVI possibile
#NIR - red= 0 -255= -255 #minimo DVI possibile

# dunque il range di DVI in un'immagine a 8 bit è fra -255 e 255

#Esercizio: calcolare il minimo e il massimo di DVI per un'immagine composta da dati a 4 bit

# 4 bit = 2^4 = 16 valori, dunque da 0 a 15

#NIR - red= 15 - 0 = 15 #massimo DVI possibile
#NIR - red= 0 -15= -15 #minimo DVI possibile

#NDVI: se ho immagini con bit diversi non posso confrontare i due DVI dunque vanno prima standardizzati, ottenendo dunque il NDVI. 

#NDVI = (NIR -red)/(NIR + red)

#8 bit
#NIR - red= (255 - 0)/(255 + 0) = 1 #max DVI 
#NIR - red= (0 -255)/(0 + 255) = -1 #min DVI 

#4 bit
#NIR - red= (15 - 0)/(15 + 0) = 1 #max DVI 
#NIR - red= (0 -15)/(0 + 15) = -1 #min DVI 

#ciò dimostra che il NDVI è comparabile

# NDVI

ndvi1992 = dvi1992 / (mato1992[[1]] + mato1992[[2]])

dvi2006 <- mato2006[[1]] - mato2006[[2]]
ndvi2006 = dvi2006 / (mato2006[[1]] + mato2006[[2]])

im.multiframe(1,2)
plot(ndvi1992)
plot(ndvi2006)

plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

#DVI tramite imageRy

dvi1992 = im.dvi(mato1992, 1,2)
dvi2006 = im.dvi(mato2006, 1, 2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

#NDVI tramite imageRy

ndvi1992 = im.ndvi(mato1992, 1,2)
ndvi2006 = im.ndvi(mato2006, 1, 2)
plot(ndvi1992, col=mako(100))
plot(ndvi2006, col=mako(100))

# Esercizio: fare un plot con DVI e NDVI per i due dati in due righe e due colonne

im.multiframe(2,2)

plot(dvi1992, col=magma(100))
plot(dvi2006, col=magma(100))
plot(ndvi1992, col=magma(100))
plot(ndvi2006, col=magma(100))

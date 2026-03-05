# R code for visualizing multispectral data
# install.packages("devtools")
# install.packages("viridis")

library(devtools)

# install_github("ducciorocchini/imageRy")
library(viridis)

library(terra) #package for using spatial data
library(imageRy) #package devoted to satellite images

im.list()

#Sentinel-2 bands
#https://gisgeography.com/sentinel-2-bands-combinations/

b2 <- im.import("sentinel.dolomites.b2.tif")

#cambiare i colori 
cl <- colorRampPalette(c("lightsalmon","magenta","mediumpurple1"))(100)
plot(b2,col=cl)

#piccolo numero di sfumature di colore 
cl <- colorRampPalette(c("lightsalmon","magenta","mediumpurple1"))(3)
plot(b2,col=cl)

# Uso viridis per cambiare i colori

plot(b2, col=inferno(100))

plot(b2, col=mako(100))

#esercizio: assegnare una palette scala di grigi all'immagine
cl <- colorRampPalette(c("dark gray","gray", "light gray"))(100)
plot(b2,col=cl)

#par
par(mfrow=c(1,2))
plot(b2, col=inferno(100))
plot(b2,col=cl)


#per chiudere tutte le schede grafiche
dev.off()

#alternativa a par
im.multiframe(1,2)

#importing band 3
b3 <- im.import("sentinel.dolomites.b3.tif")

#esercizio: cambiare colori all'imagine usando viridis
plot(b3, col=inferno(100))

#importing band 4
b4 <- im.import("sentinel.dolomites.b4.tif")

# importing band 8
b8 <- im.import("sentinel.dolomites.b8.tif")

#esercizio: multiframe con le 4 bande, legende in linea con le lunghezze d'onda

im.multiframe(2,2)

clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(b2,col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(b3,col=clg)

clr <- colorRampPalette(c("firebrick4", "red", "pink"))(100)
plot(b4,col=clr)

cln <- colorRampPalette(c("goldenrod3", "goldenrod2", "goldenrod"))(100)
plot(b8,col=cln)

sentinel <- c(b2, b3, b4, b8)
plot(sentinel)
plot(sentinel, col=inferno(100))

plot(sentinel$sentinel.dolomites.b8)


#laye1=b2, layer2=b3, layer3=b4, layer4=b8
plot(sentinel[[4]])
plot(sentinel[[2]])

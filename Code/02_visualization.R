# R code for visualizing multispectral data

library(terra) #package for using spatial data
library(imageRy) #package devoted to satellite images
# install.packages("devtools")
# install.packages("viridis")
library(devtools)

# install_github("ducciorocchini/imageRy")
library(viridis)

library(ggplot2)

# install.packages("patchwork")
library("patchwork")

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
plot(b2, col=inferno(100))
plot(b2, col=cl)

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

plot(b2, col=inferno(100))
plot(b3, col=inferno(100))
plot(b4, col=inferno(100))
plot(b8, col=inferno(100))

sentinel <- c(b2, b3, b4, b8)
plot(sentinel)
plot(sentinel, col=inferno(100))

plot(sentinel$sentinel.dolomites.b8)


#laye1=b2, layer2=b3, layer3=b4, layer4=b8
plot(sentinel[[4]])
plot(sentinel[[2]])

#stack
#sist rife

b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

p1<-im.ggplot(b8)
p2<-im.ggplot(b4)

p1+p2

#Multifram, ci sono diversi metodi per farlo:
#1. par(mfrow=c(1,2))
#2. im.multiframe(1,2)
#3. stack
#4. ggplot2 patchwork

#RGB plotting
#prima facciamo uno stack
sentinel<- c(b2, b3, b4, b8)

#1=b2 blue
#2=b3 green
#3=b4 red
#4=8 nir

#3 filtri e 4 bande
im.plotRGB(sentinel, r=3, g=2, b=1) # natural colors (immagine a colori naturali)
im.plotRGB(sentinel, r=4, g=3, b=2) #false colors (immagine in cui escludiamo il blu per includere il vicino infrarosso) 
#è indifferente come metto gli altri colori, l'unica cosa importante è dove metto il NIR.

im.multiframe (1,2)
im.plotRGB(sentinel, r=3, g=2, b=1)

#NIR on red
im.plotRGB(sentinel, r=4, g=3, b=2)

plot(sentinel[[4]])
im.plotRGB(sentinel, r=4, g=3, b=2)

#NIR on green
im.plotRGB(sentinel, r=3, g=4, b=2)

#esercizio: NIR on blue
im.plotRGB(sentinel, r=3, g=2, b=4)

# Plot the four manners of RGB in a single multiframe
im.multiframe (2,2)
im.plotRGB(sentinel, r=3, g=2, b=1)
im.plotRGB(sentinel, r=4, g=3, b=2)
im.plotRGB(sentinel, r=3, g=4, b=2)
im.plotRGB(sentinel, r=3, g=2, b=4)

# posizionamento delle bande visibili
im.multiframe (1,2)
im.plotRGB(sentinel, r=4, g=2, b=3)
im.plotRGB(sentinel, r=4, g=3, b=2)

pairs(sentinel)

#semplificazione della funzione
im.plotRGB(sentinel, 4, 2, 3)

#plotRGB() from terra

plotRGB(sentinel, 4, 2, 3, stretch="lin") # quando uso la funzione di imageRy non devo inserire lo stretch perchè è già sott'inteso.
plotRGB(sentinel, 4, 2, 3, stretch="hist")















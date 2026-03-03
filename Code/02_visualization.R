# R code for visualizing multispectral data

install.packages("viridis")

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






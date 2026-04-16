library(terra)
library(imageRy)

setwd("C:/Users/mirko/Downloads")

getwd()

list.files()

richat <- rast("richatstructure_oli_20260306.jpg")
richat <- flip(richat)
plot(richat)

png("figura.png")
plot(richat)
dev.off()

png("bande.png")
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
dev.off()


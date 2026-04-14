# Code to import data

library(terra)
library(viridis)
library(imageRy)
library(patchwork)

setwd("C:/Users/mirko/Downloads")

getwd()

# lista dei files

list.files()

gre <- rast("DJI_20260409152942_0001_MS_G.tiff")
gre <- flip(gre)
plot(gre)
plot(gre, col=mako(100))

red <- rast("DJI_20260409152942_0001_MS_R.tiff")
red <- flip(red)
plot(red)

# Esercizio: importare e plottare correttamente la banda NIR

nir <- rast("DJI_20260409152942_0001_MS_NIR.tiff")
nir <- flip(nir)
plot(nir)

#stack

stack <- c(gre, red, nir)
plot(stack)

im.multiframe(1,2)
plotRGB(stack, r=3, g=2, b=1, stretch="lin")
plotRGB(stack, r=3, g=2, b=1, stretch="hist")

# NDVI

ndvi <- im.ndvi(stack, 3, 2)
plot(ndvi)

# Export data
writeRaster(ndvi, "ndvi.tif")

# Importing data
ndvi2 <- rast("ndvi.tif")
plot(ndvi2)

# Exporting a figure
im.multiframe (2,2)

plot(gre)
plot(red)
plot(nir)
plot(ndvi)

png("fugura1.png")
im.multiframe (2,2)

plot(gre)
plot(red)
plot(nir)
plot(ndvi)
dev.off()

#oppure (stessa cosa, ma in pdf)
pdf("fugura1.pdf")
im.multiframe (2,2)

plot(gre)
plot(red)
plot(nir)
plot(ndvi)
dev.off()

# 
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(ndvi, scale=1)

p1 + p2

pdf("figura2.pdf")
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(ndvi, scale=1)
p1 + p2
dev.off()

png("figura2.png")
p1 <- im.ggplot(ndvi)
p2 <- im.ridgeline(ndvi, scale=1)
p1 + p2
dev.off()

# Import dei dati direttamente da github
gregt <- rast("https://github.com/ducciorocchini/Telerilevamento_2026/tree/main/Drone2)

#cambiare github.com con raw.githubusercontent.com
gregt <- rast("https://raw.githubusercontent.com/ducciorocchini/Telerilevamento_2026/tree/main/Drone2)

#togliere tree
gregt <- rast("https://raw.githubusercontent.com/ducciorocchini/Telerilevamento_2026/main/Drone2)

#aggiungere nome del file
gregt <- rast("https://raw.githubusercontent.com/ducciorocchini/Telerilevamento_2026/main/Drone2/DJI_20260409152942_0001_MS_G.TIF") #così è pronto
gregt <- flip(gregt)
plot(gregt)






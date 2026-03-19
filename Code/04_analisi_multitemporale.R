# code for performing multitemporal analysis with satellite imagery

library(imageRy)
library(terra)
library(viridis)

im.list()

EN_01 <- im.import("EN_01")

EN_01 <- flip(EN_01)

plot(EN_01)
EN_01

EN_13 <- im.import("EN_13.png")
EN_13 <- flip(EN_13)
plot(EN_13)

#esercizio: plottare le due immagini una sopra l'altra

im.multiframe(2,1)

plot(EN_01)
plot(EN_13)

# Differenza fra due immagini 

ENdiff = EN_01[[1]] - EN_13[[1]]

plot(ENdiff)

# Greenland example

# Esercizio: importare tutti i dati della groenlandia e creare uno stack

g2000 <- im.import("greenland.2000.tif")
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

sg <- c(g2000, g2005, g2010, g2015)

plot(sg)

gr <- im.import("greenland") #si possono importare i 4 file tutti insieme semplicemente mettendo il pezzo del nome in comune fra loro.

im.multiframe (1,2)
plot (gr[[1]])
plot (gr[[4]])

im.multiframe (1,2)
plot (gr[[1]], col=plasma(100))
plot (gr[[4]], col=plasma(100))

diff = gr[[4]] - gr[[1]]
plot(diff)

#RGB sostituendo gli anni ai colori 

im.plotRGB (gr, r=1, g=2, b=3)

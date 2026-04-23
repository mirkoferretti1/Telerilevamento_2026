# Codice R per classificare le immagini

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)


im.list()

setwd("C:/Users/mirko/Downloads")

sun<- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# Classificazione
sunc<- im.classify(sun, num_clusters=3)
sunc<- im.classify(sun, num_clusters=3, seed=19)

# Grand Canyon classification

can<- im.import("dolansprings_oli_2013088_canyon_lrg.jpg")

canc<- im.classify(can, num_clusters=4, seed=19)

# Classificazione di un'immagine da internet
list.files()

dji<- rast("dji_fly_20241226_054143_0_1735188103432_photo_low_quality.JPG")
dji<- flip(dji)

plot(dji)

djic<- im.classify(dji, num_clusters=3)

# Classificazione dei dati del Mato Grosso

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

im.multiframe(1,2)

plot(m1992)
plot(m2006)

m1992c <- im.classify(m1992, num_clusters=2, seed=19)

levels(m1992c) <- data.frame(
  value = c(2, 1),
  label = c("forest", "human")
)

m2006c <- im.classify(m2006, num_clusters=2, seed=19)

levels(m2006c) <- data.frame(
  value = c(2, 1),
  label = c("forest", "human")
)

# Calcolo delle percentuali di foresta

#1992
freq1992<- freq(m1992c)
freq1992

perc1992<- freq1992$count * 100 /ncell(m1992c)
perc1992

#2006
freq2006<- freq(m2006c)

perc2006<- freq2006$count * 100 /ncell(m2006c)
perc2006

# Creo una tabella
tabout<- data.frame( 
  class=c("Forest", "Human"),
  perc1992=c(83,17),
  perc2006=c(45,55)
  )
tabout

ggplot(tabout, aes(x=class, y=perc1992, color=class)) + #struttura
       geom_bar(stat="identity", fill="white") # bar plot

# esercizio plottare il grafico per il 2006

ggplot(tabout, aes(x=class, y=perc2006, color=class)) +
       geom_bar(stat="identity", fill="white")

# Uso patchwork

p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
       geom_bar(stat="identity", fill="white")

p2<- ggplot(tabout, aes(x=class, y=perc2006, color=class)) +
       geom_bar(stat="identity", fill="white")

p1 + p2

# Le scale sono diverse, le aggiustiamo

p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
       geom_bar(stat="identity", fill="white")  +
       ylim(c(0,100))

p2<- ggplot(tabout, aes(x=class, y=perc2006, color=class)) +
       geom_bar(stat="identity", fill="white") +
       ylim(c(0,100))

p1 + p2

# togliamo una delle due legende perchè sono due uguali ed è ridondante

p1 <- ggplot(tabout, aes(x=class, y=perc1992, color=class)) +
       geom_bar(stat="identity", fill="white")  +
       ylim(c(0,100)) +
       theme(legend.position="none")

p2<- ggplot(tabout, aes(x=class, y=perc2006, color=class)) +
       geom_bar(stat="identity", fill="white") +
       ylim(c(0,100))

p1 + p2


















#First R script

#oggetti e assegnazione

michele<- 2+3

tecla<-4+6

michele + tecla

michele/tecla

#vettori (arrays)

sonia <- c(10, 8, 3, 1, 0)  #funzione e argomenti

giorgia <- c(3, 10, 20, 50, 100)

plot(giorgia, sonia)

plot(giorgia, sonia, xlab="Conc. inquinanti", ylab="N. delfini", col="red", pch=19, cex=2)

#installazione pacchetti
#CRAN
install.packages("terra")

library(terra)

#GitHub 
install.packages("devtools")
library(devtools)

install_github("ducciorocchini/imageRy")

library(imageRy)
im.list()

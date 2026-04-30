# La mia funzione!!! XD

somma <- function(x,y){
  z=x+y
  return(z)
  }

somma(1, 100)

#esercizio: fare una funzione chiamata differenza

differenza <- function(x,y){
  z=x-y
  return(z)
  }

differenza(1, 100)


# par
mf <- function(nx,ny){
  par(mfrow=c(nx,ny))
}

mf(1,2)

mf2 <- function(nx=1,ny=2){ #qui ho degli argomenti di default, non ho bisogno di specificare il numero di righe o colonne
  par(mfrow=c(nx,ny))
}

mf2()

# if else

pos<-function(x) {
  if(x>0) {
    "Questo numero è positivo"
  }
  else {
    "Questo numero è negativo"
  }
}

pos(6)

pos(-9)

pos(0) # in questo modo però ci da lo 0 come negativo, quindi dobbiamo correggere questa cosa

pos<-function(x) {
  if(x>0) {
    "Questo numero è positivo"
  }
  else if(x<0) {
    "Questo numero è negativo"
  } 
  else {
    "Zero non è né positivo né negativo"
  }
}

#for

loop <-function() {
  for (i in 1:50) {
    print(i)
    }
}

loop2 <-function() {
  for (i in 1:50) {
    op <- i*7
    print(op)
    }
}

# questa è sostanzialmente la tabellina del 7

# la esportiamo
setwd("C:/Users/mirko/Downloads")

sink("loop2.txt")
loop2()
  sink()


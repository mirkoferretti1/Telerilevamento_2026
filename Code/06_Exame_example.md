# Questo sarà il titolo del mio progetto di Esame

L'area di studio .... eccetera (descrizione)

<img width="326" height="349" alt="Mr-map" src="https://github.com/user-attachments/assets/600788a2-3cf5-48ea-8a3e-7de2c8afd283" />


## Pacchetti utilizzati

Per questo esame sono stati utilizzati i seguenti pacchetti:

``` r
library(terra) # pacchetto per fare...
library(imageRy) # pacchetto per multiframe e altro...
```

## Importazione dei dati
i dati sono stati scaricati da earth observatory: [Earth observatory](https://science.nasa.gov/earth/earth-observatory/eyeing-the-richat-structure/)

Il codice utilizzato è il seguent; prima di tutto settiamo la working directory:

``` r
setwd("C:/Users/mirko/Downloads")

getwd()

list.files()
```

per importare i dati è stata usata la funzione `rast()` del pacchetto `terra`:

``` r
richat <- rast("richatstructure_oli_20260306.jpg")
richat <- flip(richat)
plot(richat)
``` 

<img width="480" height="480" alt="figura" src="https://github.com/user-attachments/assets/9539a627-a29f-4b80-9d15-c07e02ce421a" />

## Analisi esplorativa

Prima di tutto facciamo il plottaggio di singole bande:

``` r
png("bande.png")
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
dev.off()
```

<img width="480" height="480" alt="bande" src="https://github.com/user-attachments/assets/bbaa5b36-41f4-4992-aa21-262f2760cfc9" />

















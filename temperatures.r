library(ncdf4)
library(raster)
Carico il pacchetto richiesto: sp
setwd("/Users/Amina/desktop/Lab") #set working directory
t1 <- raster("c_gls_LST_202101191200_GLOBE_GEO_V2.0.1.nc") #import file
plot(t1) #plot first file

t2 <- raster("c_gls_LST_202101200000_GLOBE_GEO_V2.0.1.nc") #import second file
plot(t2)
 
cl1 <-colorRampPalette(c("blue", "green", "yellow")) (100) #create a color palette
plot(t1, col=cl1)

levelplot(t1) #grafico attorno all'immagine
Error in levelplot(t1) : non trovo la funzione "levelplot"
library(rasterVis)
Carico il pacchetto richiesto: lattice
Carico il pacchetto richiesto: latticeExtra
library(rasterdiv)
levelplot(t1)

levelplot(t1, col=cl1) #non gli posso cambiare il colore
Errore: $ operator is invalid for atomic vectors

ext <- c(0,20,35,55) # cut italy
t1ita <- crop(t1, ext)
plot(t1ita)

ext2 <- c(-20, 30, 35, 70) #cut europe
t1eu <- crop(t1, ext2)
plot(t1eu)
plot(t1eu, col=cl1)

extaf <- c(-30, 60, -40, 40) # cut africa
t1af <- crop(t1, extaf)
plot(t1af)
### africa

dif <- t1 - t2 #difference between first and second image
plot(dif)
dif2 <- t2 - t1
plot(dif2)

difaf <- crop(dif2, extaf) #plot differences only in africa
plot(difaf)

par(mfrow=c(1,2)) #plot togheter
plot(t1af, col=cl1)
plot(difaf, col=cl1)

par(mfrow=c(1,2)) # plot togheter with title
plot(t1af, col=cl1, main="africa temp")
plot(difaf, col=cl1, main="africa ampli term")

cuts=c(-5, 0, 5, 10, 20) # tentativo per modificare la scala delle temperature
plot(t1, breaks=cuts, col=cl1)

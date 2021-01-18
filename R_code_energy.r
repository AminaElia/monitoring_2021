install.packages("rasterdiv")
library(rasterdiv)
library(raster)
data(copNDVI)
plot(copNDVI)

#we need to remove the blue of the ocean
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

install.packages("rasterVis")
library(rasteVis)
levelplot(copNDVI)# to obtain a map with a graph indicating the average value of the pixels in the row or column

#changing colors
clymin <- colorRampPalette(c('yellow', 'red', 'blue')) (100)
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red','yellow','blue'))(100)
plot(copNDVI, col=clymed) #AA yellow is the first color we see

clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

par(mfrow=c(1,2)) # to see two maps togheter 
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

# to zoom on a certain part of the planet
ext <- c(0, 20, 35, 55) #minime e massime di longi e lati, declare di extension(xmin, xmax, ymin,ymax)
copNDVI_Italy <- crop(copNDVI, ext) #to crop the geogrphic sumset
plot(copNDVI_Italy, col=clymax)



#Deforestation, jan 18 2021

library(raster)
library(RStoolbox)

setwd("/Users/Amina/desktop/Lab")

defor1 <- brick("defor1_.png")

plotRGB(defor1, 1, 2, 3, stretch="Lin")

defor2 <- brick("defor2_.png")

plotRGB(defor2, 1, 2, 3, stretch="Lin")

par(mfrow=c(2,1)) #to obtain the 2 images togheter
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")

#vegetation index
# DVI Difference Vegetation Index = NIR - RED
dvi1 <- defor1$defor1_.1-defor1$defor1_.2
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

dvi2 <- defor2$defor2_.1-defor2$defor2_.2
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main= "DVI before cut")
plot(dvi2, col=cl, main= "DVI after cut")

difdvi <- dvi1 - dvi2
plot(difdvi)

cld <- colorRampPalette(c('blue', 'white', 'red'))(100)
plot(difdvi, cl=cld)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

hist(difdvi, col="red")

#final par!!
par(mfrow=c(3,2))
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")
plot(dvi1, col=cl, main= "DVI before cut")
plot(dvi2, col=cl, main= "DVI after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")

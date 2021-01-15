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

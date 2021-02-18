#### Thermal Amplitude - land surface temperatures


# set working directory (mac)
setwd("/Users/Amina/desktop/Lab")

# call all the pacages needed
# previously installed with the function install.packages("...")
library(raster)
library(ncdf4)
library(rasterVis)

# import data
t1 <- raster("c_gls_LST_202101191200_GLOBE_GEO_V2.0.1.nc")
t2 <- raster("c_gls_LST_202101200000_GLOBE_GEO_V2.0.1.nc")

# plot to know if data have been imported correctly
plot(t1)
plot(t2)

# create color palettes
cl1 <- colorRampPalette(c("blue", "green", "yellow")) (100) # for principal plots
cl2 <- colorRampPalette(c("blue", "purple", "red")) (100) # for differences

# plot temperatures
plot(t1, col=cl1, main="Temperatures at 12 am, jan 19 2021")
plot(t2, col=cl1, main="Temperatures at 00 am, jan 20 2021")

# plot temperatures togheter
par(mfrow=c(1,2))
plot(t1, col=cl1, main="Temperatures at 12 am, jan 19 2021")
plot(t2, col=cl1, main="Temperatures at 00 am, jan 20 2021")

# compute difference between t1 and t2: thermal amplitude
dif <- t1 - t2

# plot themal amplitude
plot(dif, col=cl2, main="Thermal amplitude")

# plot temperatures and differences togheter
par(mfrow=c(1,3))
plot(t1, col=cl1, main="Temperatures at 12 am, jan 19 2021")
plot(t2, col=cl1, main="Temperatures at 00 am, jan 20 2021")
plot(dif, col=cl2, main="Thermal amplitude")

# level plot: 
levelplot(t1)
levelplot(t2)
levelplot(dif)

# focus on europe
# select coordinates for europe
eu <- c(-20, 30, 35, 70)
# crop t1 plot with the selected coordinates and plot it
t1eu <- crop(t1, eu)
plot(t1eu, col=cl1, main="Temperatures in Europe (12 am, jan 19 2021)")
# crop t2 plot with the selected coordinates and plot it
t2eu <- crop(t2, eu)
plot(t2eu, col=cl1, main="Temperatures in Europe (00 am, jan 20 2021)")
# crop dif plot with the selected coordinates and plot it
difeu <- crop(dif, eu)
plot(difeu, col=cl2, main="Thermic amplitude in Europe")
# plot all europe's plots togheter
par(mfrow=c(1,3))
plot(t1eu, col=cl1, main="Temperatures in Europe (12 am, jan 19 2021)")
plot(t2eu, col=cl1, main="Temperatures in Europe (00 am, jan 20 2021)")
plot(difeu, col=cl2, main="Thermic amplitude in Europe")

# focus on africa
# select coordinates for africa
af <- c(-30, 60, -40, 40)
# crop t1 plot with the selected coordinates and plot it
t1af <- crop(t2, af)
plot(t1af, col=cl1, main="Temperatures in Africa (12 am, jan 19 2021)")
# crop t2 plot with the selected coordinates and plot it
t2af <- crop(t2, af)
plot(t2af, col=cl1, main="Temperatures in Europe (00 am, jan 20 2021)")
# crop dif plot with the selected coordinates and plot it
difaf <- crop(dif, af)
plot(difaf, col=cl2, main="Thermic amplitude in Africa")
# plot all africa's plot togheter
par(mfrow=c(1,3))
plot(t1af, col=cl1, main="Temperatures in Africa (12 am, jan 19 2021)")
plot(t2af, col=cl1, main="Temperatures in Europe (00 am, jan 20 2021)")
plot(difaf, col=cl2, main="Thermic amplitude in Africa")










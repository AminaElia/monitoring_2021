# Prendo i dati da copernicus, land surface temperature
install.packages("ncdf4")
library(ncdf4)

library(raster)

setwd()

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

tbho <- raster("c_gls_LST10-DC_202012210000_GLOBE_GEO_V1.2.1.nc")
plot(tbho)

clbho <- colorRampPalette(c("red", "yellow", "green")
plot(tbho, cl=clbho)

dift <- tjan - tbho #calcolo la differenza delle temperature nei due diversi momenti
cldif <- colorRampPalette(c('blue', 'white', 'red'))(100)
plot(dift, col=cldif)

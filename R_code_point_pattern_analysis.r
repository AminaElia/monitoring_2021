# Point pattern analysis

install.packages("spatstat")
library(spatstat)

setwd()
covid <- read.table()

# planar point pattern in spatstat
attach(covid)
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
# ppp(x,y,ranges)

density_map <- density(covid_planar)

plot(density_map) # esce la mappa con le sfumature di densità
points (covid_planar) # per aggiungerci i pallini

cl <- colorRampPalette(c('yellow', 'orange', 'red'))(100)
plot(density_map, col = cl)

cla <- colorRampPalette(c('green', 'yellow', 'purple'))(100)
plot(density_map, col = cla)

# Putting countries on top of the map

install.packages("rgdal")


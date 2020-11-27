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

library(rgdal)

coastlines <- readOGR("ne_10m_coastline.shp")

plot(density_map, col = cl)
points (covid_planar, pch = 16, cex = 0.1) #pch x forma dei pallini, cex per grandezza
plot(coastlines, add = TRUE) #per mettere la mappa del mondo sulla carta delle sfumature

# to save the map:
png("figure1.png")
plot(density_map, col = cl)
points (covid_planar, pch = 16, cex = 0.1) 
plot(coastlines, add = TRUE)
dev.off()

# si può anche fare in pdfusando il comando pdf("") al posto di png, mettere sempre dev.off() alla fine
#pdf is the best

head(covid)

# interpolation
marks(covid_planar) <- cases #cases è la colonna da cui prendiamo i dati
cases_map <- Smooth(covid_planar)

plot(cases_map, col = cl)
plot(coastalines, add = TRUE)
points(covid_planar)

#plot(cases_map, col = cl)
#points(covid_planar)
#plot(coastlines, add = T)


#########
# plotting points with different size relate to covid data toghether with the interpolation

setwd()





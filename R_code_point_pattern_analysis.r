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

#### ATTENTION L'ultima volta ho perso alcune cose, recupererare

# Leonardo Zabotti data

setwd()

leo <- read.table("dati_zabotti.csv", header = T, sep=",")
head(leo)

attach(leo)

library(spatstat)

summary(leo) #per vedere i min e max di x e y

leo_ppp <- ppp(leo$x, leo$y, c(2300000, 2325000), c(5005000, 5045000))
##mi da errore...

plot(leo)

density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)


### Interpolation 

setwd()

load("point_pattern_analysis.RData")
ls() #list of files inside the dataset

library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) # 
plot(chlh_map, col=cl)
points(leo_ppp)

# chlorophyl in the sediments
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map)
points(leo_ppp)

# multipanel  Per avere tre mappe assieme!
par(mfrow=c(1,3))

#first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)

# build a multipanel with 3 rows and 1 column, cioè mappe posizionate in verticale, una sopra l'altra
par(mfrow=c(3,1))
#first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

# third graph
plot(chls_map, col=cl)
points(leo_ppp)






# R spatial 

library(sp)
data(meuse)
head(meuse)

coordinates(meuse) = ~x+y
plot(meuse)

# zinc distribution and concentration
# spplot is used to plot elements spread in space, main is used for the main title
spplot(meuse, "zinc", main="concentration of zinc")

# copper concentration
spplot(meuse, "copper", main="Concentration of copper")

# Exercice: see copper and zink
# SBAGLIATO: spplot(meuse, ~"copper"+"zink")
# Da errore... spplot(meuse, c("copper", "zink"), main="concentrations of copper and zink")
spplot(meuse, c("copper","zinc"))

# Rather than using colours, let's use dubbles
# cioè pallini più grossi per zone con concentrazione più elevata!
bubble(meuse, "zinc")
bubble(meuse, "lead")
#changing colour, from green to red
bubble(meuse, "lead", col="red")

#16 november 2021
# Installing the ggplot2 library

install.packages("ggplot2")
library(ggplot2)

# ecological dataframe

# biofules
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
# oxydative enzimes
oydative <- c(1200,1300, 21000,34000, 5000) #errore: oxydative, ho dimenticato la x

#dataframe
d <- data.frame(biofuels,oydative)
d # per visualizzare la tabella

ggplot(d, aes(x = biofuels, y = oydative)) + geom_point() # grafico con pallini
ggplot(d, aes(x = biofuels, y = oydative)) + geom_point(size = 5, col = "red")

ggplot(d, aes(x = biofuels, y = oydative)) + geom_line() # grafico con linea

# grafico con puntini e linee
ggplot(d, aes(x = biofuels, y = oydative)) + geom_point(size = 5, col = "red") + geom_line()

#polygons
ggplot(d, aes(x = biofuels, y = oydative)) + geom_polygon()


###### IMPORT DATA FROM AN EXTERNAL SOURCE
# setwd("path/Lab")

 setwd("/Users/Amina/Desktop/Lab")
# set working directory

covid <- read.table("covid_agg.csv", header=TRUE)
#header dice se il file contiene il nome delle variabili, in questo caso ci sono quindi metto TRUE
# ho usato view.php.cvs xk il file mi si è salvato cosi
head(covid)
summary(covid)

#ggplot
library(ggplot2)

ggplot(covid, aes(x = lon, y = lat)) + geom_point()
# names(covid) per vedere i nomi delle variabili da inserire, in questo caso lon e lat così ci esce un plot a forma di mondo (astratto)

#changing the size of the data points in relation to the number of cases
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()






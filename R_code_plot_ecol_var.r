# install a packages called sp
install.packages("sp")
library(sp)

# data is used to recall datasets
data(meuse)

# look inside the set
meuse

# per vedere tutti i dati in una bella tabella, not working for Mac (install: xquartz.org)
View(meuse)

# per vedere le prime linee del dataset
head(meuse)

#Exercice: find the mean of all variables.
# cadmium: (Troppo laborioso...)
#(11.7+8.6+....)/N
# mi da un sacco di dati, tra cui la mean
summary(meuse)

# Exercice: plot zinc (y) against cadmium (x)
# error... xk cadmium not find
plot(cadmium, zinc)
# use of $
plot(meuse$cadmium, meuse$zinc)
# per mantenere il link con meuse e non usare sempre $:
attach(meuse)

plot(cadmium, zinc)

plot(cadmium, lead)

# how to impress your supervisor, escono tipo tutti i graficini in una volta, scatterplot matrix
 pairs(meuse)

# Exercice: pairing only the elements part of the dataset: how to do that? cadmium, copper, lead, zinc




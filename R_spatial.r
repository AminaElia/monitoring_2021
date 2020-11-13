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



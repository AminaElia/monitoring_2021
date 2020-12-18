# R_code_multivar.r

#install.packages("vegan")

library(vegan)

setwd("/Users/Amina/Desktop/Lab")

load("biomes_multivar.RData")

#plot per species matrix
head(biomes)

multivar <- decorana(biomes) #correlation between species
plot(multivar)  # ho un plot in 2D anche se avevo 4 variabili... ma xk le prime due spiegano il 75%

#biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, biomes_types$type, col=c("black", "red", "green", "blue"), kind= "ehull", lwd=3)

ordispider(multivar, biomes_types$type, col=c("black", "red", "green", "blue"), label=T)

# to save the image:
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, biomes_types$type, col=c("black", "red", "green", "blue"), kind= "ehull", lwd=3)
ordispider(multivar, biomes_types$type, col=c("black", "red", "green", "blue"), label=T)
dev.off()

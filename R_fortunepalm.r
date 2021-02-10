#set working directory
setwd("/Users/Amina/desktop/Lab")

library(ggplot2)

#import data from external source
palm <- read.table("palmticino.csv", header=T, sep=",")

summary(palm)

Plot with poit's size corresponding to the number of palms 
ggplot(palm, aes(x=coorx, y=coory, size=observationspalm)) + geom_point()

ggplot(palm, aes(x=coorx, y=coory, size=observationspalm)) + geom_point(pch=21) + aes(fill=alti)

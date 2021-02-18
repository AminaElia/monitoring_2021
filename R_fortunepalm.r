#### Trachycarpus fortunei distribution in Ticino, CH

#set working directory
setwd("/Users/Amina/desktop/Lab")

# call the package needed
library(ggplot2)

#import data from external source
palm <- read.table("palmticino.csv", header=T, sep=",")

# summary to see if data have been correctly imported and to know the names of the columns
summary(palm)

# Plot with poit's size corresponding to the number of palms 
ggplot(palm, aes(x=coorx, y=coory, size=observationspalm)) + geom_point()

# Plot with point's size corresponding to the number of palms and the color corresponding to the altitude
ggplot(palm, aes(x=coorx, y=coory, size=observationspalm)) + geom_point(pch=21) + aes(fill=alti)

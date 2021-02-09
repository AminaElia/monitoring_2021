#set working directory
setwd("/Users/Amina/desktop/Lab")
#import data from external source
palm <- read.table("fortune2.csv", header=T, sep=",")

summary(palm)

Plot with poit's size corresponding to the number of palms 
ggplot(palm, aes(x=coorx, y=coory, size=observationspalm)) + geom_point()


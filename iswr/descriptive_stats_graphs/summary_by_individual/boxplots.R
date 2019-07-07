# a "boxplot" or "box-and-whisker plot" is a graphical display 
# of the summary of a distribution
library(ISwR)
par(mfrow = c(1, 2))# multiframe rowwise 1x2 layout
boxplot(IgM)
boxplot(log(IgM))
par(mfrow = c(1, 1)) # reset layout parameter

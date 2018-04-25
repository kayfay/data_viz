library('MVA')
library('ggplot2')

mlab <- "Manufacturing enterprises with 20 or more workers"
plab <- "Population size (1970 census) in thousands"
slab <- "SO2 content of air in micrograms per cubic meters"
tlab <- "Average annual temperature in degrees Fahrenheit"

# A graph wtih high correlation
ggplot(USairpollution, aes(manu, popul)) +
    geom_point() +
    geom_smooth(method=lm) +
    xlab(mlab) +
    ylab(plab)

# A graph with low correlation
ggplot(USairpollution, aes(SO2, temp)) +
    geom_point() +
    geom_smooth(method=lm) +
    xlab(slab) +
    ylab(tlab)

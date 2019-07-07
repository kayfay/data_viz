x <- rnorm(100)
hist(x, freq = F)
curve(dnorm(x), add = T)

# changing y-axis magnitude of y values to make plot big 
# enough to hold density and histogram bar height
h  <- hist(x, plot = F) # to use for getting denisty for scaling
ylim  <- range(0, h$density, dnorm(0))
hist(x, freq = F, ylim = ylim)
curve(dnorm(x), add = T)

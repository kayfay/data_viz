x <- rnorm(50)
y <- x * x
z <- 1:50
a <- sample(1:1000, size = 5)
# [1] 867 493  44 985 505
b <- sample(1:1000, size = 5)
# [1] 630  18 209 492 338
d <- cbind(a, b)
#        a   b
# [1,] 867 630
# [2,] 493  18
# [3,]  44 209
# [4,] 985 492
# [5,] 505 338

# explore the possibilities for different kinds of line and 
# point plots. Vary the plot symbol, line type, line width, 
# and colour.
plot(x, y, ...) 

plot(x, y, type = "p")
plot(x, z, type = "l")
plot(x, y, type = "b")
plot(x, y, type = "c")
plot(x, y, type = "o")
plot(x, y, type = "h")
plot(x, z, type = "s")
plot(x, z, type = "S")
plot(x, y, type = "n")

plot(x, y, type = "p", main = "x and a it's square")
plot(x, y, type = "p", 
     main = "x and a it's square",
     sub = "x and it's square",
     xlab = "x label",
     ylab = "y label",
     pch = 1:18
     )

plot(x, z, type = "o", lwd = 5)

demo(colors)
plot(x, z, type = "o", lwd = 5, col = "violetred")
plot(x, y, type = "o", col = "wheat")

# When plotting plot(rnorm(10), type = "o"), 
# remove the lines visibile inside the plotting symbols
plot(rnorm(10), type = "o")
# since
# • ‘"o"’ for both ‘*o*verplotted’,
# using either of the three options are an option
# • ‘"p"’ for *p*oints,
# • ‘"l"’ for *l*ines,
# • ‘"b"’ for *b*oth,
plot(rnorm(10), type = "b")

# how can you overlay two qqnorm plots in the same plotting area
# what goes wrong if you try to generate a plot using type = "l"
# how to avoid that?

qqnorm(x)
qqline(x)
qqplot(y, z)

qqnorm(x, ylim = c(-5, 5),
       main = "Normal Q-Q Plot",
       xlab = "Theoretical Quantiles",
       ylab = "Zoomed in window, Q reduced by 50%",
       type = "p"
       )

qqline(y, datax = FALSE,
       distribution = qnorm,
       probs = c(0.25, 0.75),
       qtype = 8
       )

qqplot(x, y, plot.it = TRUE,
       xlab = deparse(substitute(x)),
       ylab = deparse(substitute(y)))


qqnorm(cbind(x, y), beside = T)
qqnorm(d, beside = T)

qqnorm(x, type = "l")
qqnorm(x, type = "p")

# plot a histogram for the react dataset
# what does highly discretized mean
# why is the histogram biased because of it
# try truehist from the MASS package


library(ISwR)
library(MASS)
data(react, package="ISwR")
hist(react)
# being highly discretized it appears to be seperated into
# normally distributed sets

truehist(react)
# using true hist shows a more precise and uneven
# or non-normal distribution


# generate a sample vector z of five random numbers 
# from the uniform distribution, and plot quantile(z, x)
# as a function of x (use curve for instance)

x <- 1:5
z <- runif(5)
curve(quantile(z, x), from = 0, to = 1)
# notice the linear interpolation of the data

# data and graphics parameters
x <- 1:5 ; y <- rexp(5, 1) ; opar <- par(mfrow = c(2, 2))
# plots 4 varying types
plot(x, y, pch = 15) # filled square
plot(x, y, type = "b", lty = "dotted")
plot(x, y, type = "b", lwd = 3)
plot(x, y, type = "o", col = "blue")
par(opar)
 
# using a filled symbol and setting fill 
# color equal to the plot background
plot(rnorm(10), type = "o", pch = 21, bg = "white")

# qqnorm plot.it=F and get a return value for range information
x1 <- sort(rnorm(20))
x2 <- sort(rnorm(10) + 1)
q1 <- qqnorm(x1, plot.it = F) # false to plotting
q2 <- qqnorm(x2, plot.it = F) # 
xr <- range(q1$x, q2$x) # extract range for x
yr <- range(q1$y, q2$y) # extract range for y
qqnorm(x1, xlim = xr, ylim = yr) # plot x1 as qqnorm
points(q2, col = "red") # plot q2 as points

qqnorm(x1, xlim = xr, ylim = yr, type = "l")
points(q2, col = "red", type = "l")

# react dataset breaks on the digits and shifts the dataset left
# a hist with truehist allows setting breaks
library(ISwR)
data(react, package = "ISwR")
hist(react)
library(MASS)
truehist(react, h = 1, x0 = .5)

# generate a sample vector z of five random numbers from the
# uniform distribution and plot quantile(z, x) as a function
# of x (use curve, for instance)
x <- 1:5
z <- runif(5)
curve(quantile(z, x), from = 0, to = 1)

# the empirical cumulative distribution function is defined 
# as the fraction of data smaller than or equal to x, if x is
# the smallest observation then the proportion k/n of the data
# is smaller than or equal to x (7/10 if x is no. 7 of 10)

x <- rnorm(50)
n <- length(x)
plot(sort(x), (1:n) / n, type = "s", ylim = c(0, 1))

# parameter type = "s" step function, (x,y) is the left end of the step
# ylim is a vector of two elements specifying y-coord extremes

# other displays available with then ecdf funcition
ecdf

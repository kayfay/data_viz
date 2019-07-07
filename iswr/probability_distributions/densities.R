# the density is for a continous distribution is a measure of
# the relative probability of "getting a value close to x".
# the probability of getting a value in a particular interval
# is the area under the corresponding part of the curve

# for discrete distributions the term "density" is ued for the
# point probability, for the probability of getting exactly x

x <- seq(-4, 4, 0.1)
plot(x, dnorm(x), type = "l")

# also if y can be expressed as a functional expression of x
curve(dnorm(x), from = -4, to = 4)

# a pin diagram for a discrete distribution where variables
# take on only distinct values, for binomial distributions
# n = 50, p = 0.33, e.g., number of events in 50 trials
x <- 0:50
plot(x, dbinom(x, size = 50, prob = 0.33), type = "h")

# with the "d-function" n trials, and p probability
# and type="h" as histogram-like

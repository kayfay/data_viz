# the probability a standard normally distributed variable is larger than 3
pnorm(3, lower.tail = FALSE)
# [1] 0.001349898

# the probability a normally distributed variable with a mean of 35 and a 
# sd of 6 is larger than 42
pnorm(42, mean = 35, sd = 6, lower.tail = FALSE)
# [1] 0.1216725

# getting 10 out of 10 successes in a binomial distribution 
# with probability 0.8 (density)
dbinom(10, size = 10, prob = .8, lower.tail = FALSE)
# [1] 0.1073742

# X < 0.9 when X has the standard uniform distribution
punif(.9) # a point probability
# [1] 0.9

# X > 6.5 in a chi^2 distribution w/ 2 deg of freedom
pchisq(6.5, df = 2, lower.tail = FALSE)
# [1] 0.03877421

# a rule of thumb is that 5% of the normal distribution lies outside an
# interval approximately \pm 2 sd about the mean;
curve(dnorm(c(-4, 4, .1)), from = -4, to = 4)
# where are the limits for 1%, .5%, .1%
# what is the position of the quartiles measured in standard deviation units

# looking at 5% of the normal distribution
pnorm(2, lower.tail = FALSE)  * 2 # left tail outside of 90% times 2
# [1] 0.04550026

# the limits for quantiles of the normal distribution
qnorm(1 - .01 / 2) # the limit for 1%
# [1] 2.575829
qnorm(1 - .005 / 2) # the limit for .5%
# [1] 2.807034
qnorm(1 - .001 / 2) # the lmiit for .1%
# [1] 3.290527

# quartiles measured in standard deviations
qnorm(.25)
# [1] -0.6744898
qnorm(.75)
# [1] 0.6744898

# for a disease known to have a postoperative complication frequency of 20%
# a surgeon suggests a new procedure, tests it on 10 patients with no 
# complications, what is the probability of operating on 10 patients
# sucessfully with the traditional method
dbinom(0, size = 10, prob = .2)
# [1] 0.1073742

# simulated coin-tossing can be done using rbinom instead of sample
sample(c(1, 0), 10, replace = TRUE)
#  [1] 1 1 1 0 0 0 0 1 0 1

rbinom(10, size = 1, .5 )
#  [1] 1 1 1 0 1 0 1 1 1 1

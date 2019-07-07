# the quantile function is the inverse of the cumulative distribution function
# the p-quantile is the value with the property that there is probability p
# of getting a value less than or equal to it, the median is by definition
# the 50% quantile

# tables of statistical distributions are given in tables of quantiles
# a boundary that a test statistic must cross in order to be considered 
# statistically significant at that level

# theoretical quantiles are commonly used for calculation of confidence
# intervals and for power calculations 

# $ \bar{x} + \sigma \sqrt{n} \times N_0.025 
# \leq \mu \leq 
# \bar{x} + \sigma / \sqrt{n} \times N_0.975

# \textit{standard error of the the mean} with 
# \sigma = 12 n = 5, \xbar={x}
xbar <- 83
sigma <- 12
n <- 5
sem <- sigma / sqrt(n)

xbar + sem * qnorm(0.025)
# [1] 72.48173
xbar + sem * qnorm(0.975)
# [1] 93.51827

# and thus a 95% confidence interval for \mu from 93.52 to 72.48

# since the normal distribution is symmetric and N_0.025 = -N_0.975
# then confidence intervals \xbar{x} \sigma / \sqrt{n} \times N_0.975
# and the quantile as \Phi^{-1}(0.975) with \Phi as standard notation
# for the cumulative distribution function of the normal distribution
# e.g., \Phi = pnorm cumulative probability

# another application of quantiles are Q-Q plots which can be used to 
# reason a set of data is a subset of another dataset

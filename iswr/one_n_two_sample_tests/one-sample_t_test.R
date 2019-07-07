# t-tests are based on the assumption data is normally distributed
# in one samples $ x_1, ... , x_n $ assumed to be independent 
# realizations of random variables with distribution 
# $ N(\mu, \sigma^{2}) $ denoting the normal distribution
# and wishing to test the $ \textit null hypothesis $
# that is $ \mu = \mu_0 $ and using estimated parameters
# $ \mu, \sigma $ of the emperical mean $\bar{x}$ and
# standard deviasion $s$ althought not exact values

# the $\textit{standard error of the mean}$ or SEM describes 
# variation of the average of $n$ random variables with mean 
# $\mu$ and variance $\sigma^{2}$ 

# SEM $= \sigma / \sqrt{n}$

# Using a single sample for the SEM as $ s / \sqrt{n} $
# which can show how far the observed mean strayed 
# from its true value
 
# for normally distributed data there is a 95% probability
# of straying within $ \mu \pm 2\sigma $
# and $ \mu_0 $ would be the true mean if $ \bar{x} is within 2 SEM
# $ t = \frac{\bar{x} - \mu_0}{SEM} $

# the $ \textit{acceptance region} $  of t which is releative -2 to 2
# the specified $ significance level $ often 5%

daily.intake <- c(5260, 5470, 5640, 6180, 
		  6390, 6515, 6805, 7515, 8230, 8770)

mean(daily.intake)
# [1] 6677.5

sd(daily.intake)
# [1] 1174.11

quantile(daily.intake)
#     0%    25%    50%    75%   100% 
# 5260.0 5775.0 6452.5 7337.5 8770.0 

t.test(daily.intake, mu = 7725)
# 
#         One Sample t-test
# 
# data:  daily.intake
# t = -2.8213, df = 9, p-value = 0.02001
# alternative hypothesis: true mean is not equal to 7725
# 95 percent confidence interval:
#  5837.592 7517.408
# sample estimates:
# mean of x 
#    6677.5 


# t = -2.8213, df = 9, p-value = 0.02001
# since p < 0.05 the data deviates significantly from the hypothesis

# the data deviate significantly from the hypotheis 
# alternative hypothesis: true mean is not equal to 7725

# the hypotheis test confirms that the mean are not equal to
# 95 percent confidence interval:
#  5837.592 7517.408

# $ \bar{x} - t_0.975(f) \cross SEM < \mu < \bar{x} + t_0.875(f) \cross SEM $

# sample estimates:
# mean of x 
#    6677.5 


# Use alternative = greater / less for a one-sided test
#  t.test(daily.intake, mu = 7725, alternative="greater")
# 
#         One Sample t-test
# 
# data:  daily.intake
# t = -2.8213, df = 9, p-value = 0.99
# alternative hypothesis: true mean is greater than 7725
# 95 percent confidence interval:
#  5996.89     Inf
# sample estimates:
# mean of x 
#    6677.5 

# specifying confidence level
# t.test(daily.intake, mu = 7725, alternative="greater", conf.level=0.99)
# 
#         One Sample t-test
# 
# data:  daily.intake
# t = -2.8213, df = 9, p-value = 0.99
# alternative hypothesis: true mean is greater than 7725
# 99 percent confidence interval:
#  5629.939      Inf
# sample estimates:
# mean of x 
#    6677.5 

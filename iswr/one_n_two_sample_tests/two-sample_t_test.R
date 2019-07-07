# two-sample t-test tests the hypothesis that two samples may be 
# assumed to come from the same distribution with the same mean

library(ISwR)
attach(energy)
head(energy)
#   expend stature
# 1   9.21   obese
# 2   7.53    lean
# 3   7.48    lean
# 4   8.08    lean
# 5   8.09    lean
# 6  10.15    lean

t.test(expend~stature) # expend described by stature
# 
# 	Welch Two Sample t-test
# 
# data:  expend by stature
# t = -3.8555, df = 15.919, p-value = 0.001411
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -3.459167 -1.004081
# sample estimates:
#  mean in group lean mean in group obese 
#            8.066154           10.297778 
# 


# Assume variances are the same resulting in fractional degrees of freedom
t.test(expend~stature, var.equal = T)
# 
# 	Two Sample t-test
# 
# data:  expend by stature
# t = -3.9456, df = 20, p-value = 0.000799
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -3.411451 -1.051796
# sample estimates:
#  mean in group lean mean in group obese 
#            8.066154           10.297778 
# 

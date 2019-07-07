# F test on the ratio of the group variances
library(ISwR)
attach(energy)
var.test(expend~stature)
# 
# 	F test to compare two variances
# 
# data:  expend by stature
# F = 0.78445, num df = 12, denom df = 8, p-value = 0.6797
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#  0.1867876 2.7547991
# sample estimates:
# ratio of variances 
#           0.784446 
# 

# Notice the test is based on independent groups and does not apply
# to paired data

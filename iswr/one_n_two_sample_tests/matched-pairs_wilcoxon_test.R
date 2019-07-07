# matched-pairs Wilxocon test

library(ISwR)
attach(intake)

wilcox.test(pre, post, paired = T)
# 
# 	Wilcoxon signed rank test with continuity correction
# 
# data:  pre and post
# V = 66, p-value = 0.00384
# alternative hypothesis: true location shift is not equal to 0
# 

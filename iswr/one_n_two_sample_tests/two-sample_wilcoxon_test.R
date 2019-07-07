# nonparametric test when doubting the asumptions of a normal
# distribution
# replace data by their rank, without regard to grouping,
# calculate the sum of the ranks in one group, reducing the 
# reducing the problem to sampling $ n_1 $ without replacement
# from 1 to $ n_1 + n_2 $.

library(ISwR)
attach(energy)
wilcox.test(expend~stature)
# 
# 	Wilcoxon rank sum test with continuity correction
# 
# data:  expend by stature
# W = 12, p-value = 0.002122
# alternative hypothesis: true location shift is not equal to 0
# 

# with W as the sum of ranks in the first group minus its 
# theoretical minimum 

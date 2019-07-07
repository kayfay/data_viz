# Paired tests measure the same experiment unit among two measurements
# i.e., taking differences and reducing the problem to a one sample test.
# Assumption levels are independent:
# \begin{itemsize}
# \item Make a scatterplot of the pairs with the line of identity added.
# \item Plot the difference against the average of the pair.
# \end{itemsize}
# If a tendency for dispersion to change with the level then it may be 
# useful to transform the data. If the standard deviation is proportional
# to the level a logarithmic transformation is useful.

library(ISwR)
attach(intake)
intake
#     pre post
# 1  5260 3910
# 2  5470 4220
# 3  5640 3885
# 4  6180 5160
# 5  6390 5645
# 6  6515 4680
# 7  6805 5265
# 8  7515 5975
# 9  7515 6790
# 10 8230 6900
# 11 8770 7335

# With 11 women tested, looking at individual differences
post - pre
#  [1] -1350 -1250 -1755 -1020  -745 -1835 -1540 -1540  -725 -1330 -1435

# All differences are negative, a lower energy level post/pre menstrual

t.test(pre, post, paired = T)
# 
# 	Paired t-test
# 
# data:  pre and post
# t = 11.941, df = 10, p-value = 3.059e-07
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  1074.072 1566.838
# sample estimates:
# mean of the differences 
#                1320.455 
# 

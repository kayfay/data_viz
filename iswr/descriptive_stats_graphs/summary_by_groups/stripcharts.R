# plotting data by marking a dot on a number line for value
library(ISwR)
attach(energy)
opar <- par(mfrow = c(2, 2), mex = 0.8, mar = c(3, 3, 2, 1) + 0.1)
# $mfrow
# [1] 1 1
# 
# $mex
# [1] 1
# 
# $mar
# [1] 5.1 4.1 4.1 2.1
# 
stripchart(expend ~ stature)
stripchart(expend ~ stature, method = "stack")
stripchart(expend ~ stature, method = "jitter")
stripchart(expend ~ stature, method = "jitter", jitter = .03)
par(opar)

# or can also be expressed as
stripchart(list(lean = expend.lean, obese = expend.obese))

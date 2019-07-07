# entering on multiple lines using histograms for groups
library(ISwR)
attach(energy)
expend.lean <- expend[stature == "lean"]
#  [1]  7.53  7.48  8.08  8.09 10.15  8.40 10.88  6.13  7.90  7.05  7.48  7.58
# [13]  8.11
expend.obese <- expend[stature == "obese"]
# [1]  9.21 11.51 12.79 11.85  9.97  8.79  9.69  9.68  9.19

par(mfrow = c(2, 1))
hist(expend.lean, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "white")
hist(expend.obese, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "grey")
par(mfrow = c(1, 1))

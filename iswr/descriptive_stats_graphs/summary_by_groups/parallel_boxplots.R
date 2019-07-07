# putting boxplots from several groups in the same frame
library(ISwR)
attach(energy)
expend.lean <- expend[stature == "lean"]
expend.obese <- expend[stature == "obese"]

boxplot(expend ~ stature)

# or by seperate vectors
boxplot(expend.lean, expend.obese)

# y ~ x or "y described using x" as a model formula

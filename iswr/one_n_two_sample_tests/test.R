# This is some header space.

daily.intake <- c(5260, 5470, 5640, 6180, 
		  6390, 6515, 6805, 7515, 8230, 8770)

t.test(daily.intake)
# 
# 	One Sample t-test
# 
# data:  daily.intake
# t = 17.985, df = 9, p-value = 2.312e-08
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#  5837.592 7517.408
# sample estimates:
# mean of x 
#    6677.5 
# 

t.test(daily.intake, conf.level = .99)


t.test(daily.intake, alternative = "greater")
t.test(daily.intake, alternative = "less")


results <- t.test(daily.intake)

names(results)

results$statistic

results$parameter

results$p.value

results$conf.int

results$estimate

results$null.value

results$alternative

results$method

results$data.name





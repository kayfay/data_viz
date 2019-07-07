# wilcoxon signed-rank test uses a $ \textit{distribution free method} $
# which works by replacing data with corresponding order statistics
# one-sample wilcoxon test: (1) 
# (2) rank 
# \flushleft
# \begin{enumerate}
# \item Subtract $ \textit{the theoretical} \mu_0 $.
# \item Rank the absolute difference.
# \item Calculate the sum of positive and negative ranks.
# \end{description}
# \end{enumerate}

daily.intake <- c(5260, 5470, 5640, 6180,
		  6390, 6515, 6805, 7515, 8230, 8770)

results <- wilcox.test(daily.intake, mu = 7725)
# 
# 	Wilcoxon signed rank test
# 
# data:  daily.intake
# V = 6, p-value = 0.02734
# alternative hypothesis: true location is not equal to 7725
# 

names(results)
results$statistic
results$parameter
results$p.value
results$null.value
# location 
#     7725 
results$alternative
results$method
results$data.name
results$conf.int
results$estimate

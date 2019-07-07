# \documentclass[a4paper,11pt]{article}
# \usepackage{listings}
# %define the title
# \author{A. ~Tools}
# \title{Exercise One and Two-Sample tests}
# \begin{document}
# \maketitle
# %insert the table of contents
# \tableofcontents
# \section{Exercise 1}
# Examine the react dataset for normality and test one sample t.test $\mu$ = 0

#  The numeric vector react contains differences between two 
#  nurses' determinations of 334 tuberculin reaction sizes. 
#   A single vector, differences between reaction sizes in mm. 

# \begin[language=R]{lslisting}
data(react, package = "ISwR")
View(react)

react
#   [1] -9 -6 -5 -5 -5 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -4 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3
#  [41] -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -3 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2
#  [81] -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
# [121] -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
# [161] -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1  0  0
# [201]  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
# [241]  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1
# [281]  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2  2
# [321]  2  2  2  2  2  3  3  3  3  3  4  4  5  8

str(react)
#  int [1:334] -9 -6 -5 -5 -5 -4 -4 -4 -4 -4 ...

mean(react)
# [1] -0.7964072

sd(react)
# [1] 1.877763

var(react)
# [1] 3.525993

median(react)
# [1] -1

quantile(react)
#   0%  25%  50%  75% 100% 
#   -9   -2   -1    0    8 

pvec <- seq(0, 1, 0.1)
quantile(react, pvec)
#   0%  10%  20%  30%  40%  50%  60%  70%  80%  90% 100% 
# -9.0 -3.0 -2.0 -2.0 -1.0 -1.0  0.0  0.0  1.0  1.7  8.0 

summary(react)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -9.0000 -2.0000 -1.0000 -0.7964  0.0000  8.0000 

n <- length(react)
# [1] 334

table(react) # View as factors
# react
# -9 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  8 
#  1  1  3 21 29 49 94 61 41 25  5  2  1  1 
# \end{lslisting}

# Visualizations of the data for normality.
# <<plot1, fig.pos = "t", fig.height = 4, fig.width = 4, fig.cap = "Empirival cumulative distribution">>=
plot(sort(react), y = (1:n) / n, type = "s", ylim = c(0, 1))
# @
# The figure \ref{fig:plot1}

#<<plot2, fig.pos = "t", fig.height = 4, fig.width = 4, fig.cap = "Q-Q plot">>= 
qqnorm(react)
# @
# The figure \ref{fig:plot2}

# <<plot3, fig.pos = "t", fig.height = 4, fig.width = 4, fig.cap = "Botplot">>=
boxplot(react)
# @
# The figure \ref{fig:plot3}

# <<plot4, fig.pos = "t", fig.height = 4, fig.width = 4, fig.cap = "Histogram with Normal Curve">>=
h <- hist(react, plot = FALSE)
ylim <- range(0, h$density, dnorm(0))
hist(react, freq = FALSE, ylim = ylim)
x <- rnorm(n)
curve(dnorm(x), add = TRUE, from = -6, to = 5 )
# @
# The figure \ref{fig:plot4}

# <<plot5, fig.pos = "t", fig.height = 4, fig.width = 4, fig.cap = "Adjusted histogram">>=
library(MASS)
truehist(react)
# @
# The figure \ref{fig:plot5}


t.test(react)
# 
# 	One Sample t-test
# 
# data:  react
# t = -7.7512, df = 333, p-value = 1.115e-13
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#  -0.9985214 -0.5942930
# sample estimates:
#  mean of x 
# -0.7964072 
# 

# \section{Exercise 2}

# \end{document}

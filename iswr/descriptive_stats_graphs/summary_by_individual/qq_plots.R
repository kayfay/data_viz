# the c.d.f. used to see data can be assumed normally distributed
# plotting the kth smallest observation to the expected value of 
# the kth smallest observation out of n in a standard normally
# distribution, you would get a straight line with any mean/sd

x <- rnorm(50)
qqnorm(x) # quantile vs quantile

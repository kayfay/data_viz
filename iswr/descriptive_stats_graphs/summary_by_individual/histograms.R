# a reasonable impression of the shape of a distribution
# by drawing a histogram, a count of how many observations
# fall within specified divisions ('bins') of the x-axis

hist(x)

# breaks = n gets approximately n bars
# or specifying breaks as a vector

# using age groups and accident counts
# 0-4, 5-9, 10-15, 16, 17, 18-19, 20-24, 25-59, 60-79

mid.age <- c(2.5, 7.5, 13, 16.5, 17.5, 19, 22.5, 44.5, 70.5)
acc.count <- c(28, 46, 58, 20, 31, 64, 149, 316, 103)
age.acc <- rep(mid.age, acc.count)

# creating a unequal divisions in a histogram
brk <- c(0, 5, 10, 16, 17, 18, 20, 25, 60, 80)
hist(age.acc, breaks = brk)

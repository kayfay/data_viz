# the cumulative distribution is the probability of "hitting" x
# or less in a given distribution, "p-function"

# given a biochemical measure in healthy individuals is well 
# described by a normal distribution with a mean of 132 and a
# standard deviation of 13, then patient with value 160 has

1 - pnorm(160, mean = 132, sd = 13)
# [1] 0.01562612

# 1.5% of the general population that value or higher

# Twenty patients are given two treatments, blindly and rand
# asked whether A or B worked better, with 16 favoring A

# is a better or by chance, if no differences then A would be
# binomially distributed with p = 0.5 and n = 20 then what is
# the probability using a normal distribution and tail prob

pbinom(16, size = 20, prob = .5) # tail probbility

# and with 1 degree of freedom removed and the using 1 - p
# for getting the upper tail
1 - pbinom(15, size = 20, prob = .5)
# [1] 0.005908966

# if not knowing which treatment is better, then two-tailed
# test by adding probability of equally extreme results in
# the opposite direction, adding four or fewer people perfer A

1 - pbinom(15, 20, .5) + pbinom(4, 20, .5)
# [1] 0.01181793

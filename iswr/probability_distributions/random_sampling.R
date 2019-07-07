# sample 5 from a set of 40 numbers
sample(1:40, 5)
# [1] 30  3  9 17 24

# x as a vector of values to be sampled, 5 as the sample size
sample(40, 5)
# [1] 15 26 30 40  1


# sampling with replacement for a coin toss using replace=T
sample(c("H", "T"), 10, replace = T)
#  [1] "T" "H" "H" "H" "H" "H" "H" "T" "T" "T"

# successfull outcome of an event say 90% success like 
# surgery would have better than 50%, so set with the prob arg
sample(c("succ", "fail"), 10, replace = T, prob = c(0.9, 0.1))
#  [1] "succ" "succ" "succ" "succ" "fail" "succ" "fail" "succ" "succ" "succ"

# sampling without replacement, sample(1:40, 5)
# first case, 1/40, 2nd case 1/39, 3rd case 1/38 ...
# so a probability should be 1/(40*39*38*37*36)

prod # calculates the product of a vector
# the prod function: function (..., na.rm = FALSE)  .Primitive("prod")

# probability of sample(1:40, 5) (specifically in a given order)
1 / prod(40:36)
# [1] 1.266449e-08

# probability of a given set of 5 numbers
# since all changes would be the same finding out 
# the given number of cases and multiply by that
# the five possibilities for the 1st number
# 4 possibilities for the second, 3rd for 3rd ...
# 5 x 4 x 3 x 2 x 1 , 5!
prod(5:1) / prod(40:36)
# [1] 1.519738e-06

# or since all sets of numbers are immaterial
# all sets of five numbers must have the same probability
# so counting the number of ways to choose 5 numbers out of 40
#( 40 )
#( 5  )
# 40!/5!35!
factorial(40) / factorial(5) * factorial(35)
# [1] 8.159153e+47
1 / choose(40, 5)
# [1] 1.519738e-06

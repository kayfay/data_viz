# standard distributions for model building and statistical tests
# can be replaced in R from traditional statistical tables
dnorm # density or point probabilities
# function (x, mean = 0, sd = 1, log = FALSE) 
# .Call(C_dnorm, x, mean, sd, log)
# <bytecode: 0x55e5811b1c90>
# <environment: namespace:stats>

pnorm # cumulative probability, distribution function
# function (q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 
# .Call(C_pnorm, q, mean, sd, lower.tail, log.p)
# <bytecode: 0x55e5811c3128>
# <environment: namespace:stats>

qnorm # quantiles
# function (p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 
# .Call(C_qnorm, p, mean, sd, lower.tail, log.p)
# <bytecode: 0x55e5811cd990>
# <environment: namespace:stats>

rnorm # psuedo-random numbers
# function (n, mean = 0, sd = 1) 
# .Call(C_rnorm, n, mean, sd)
# <bytecode: 0x55e5811da188>
# <environment: namespace:stats>

hist.with.normal <- function(x, xlab = deparse(substitute(x)), ...)
{
  h <- hist(x, plot = f, ...)
  s <- sd(x)
  m <- mean(x)
  ylim <- range(0, h$density, dnorm(0, sd = s))
  hist(x, freq = F, ylim = ylim, xlab = xlab, ...)
  curve(dnorm(x, m, s), add = T)
}

# xlab becomes the evaluated character expression for x 
# e.g., rnorm(100) for x becomes xlab="rnorm(100)")

# as ... also passes ... arguments collected into hist calls

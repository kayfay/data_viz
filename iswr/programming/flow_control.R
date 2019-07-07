# newtons method of calculating a square root
y <- 12345
x <- y / 2
y
x
while (abs(x * x - y) > 1e-10) x <- (x + y / x) / 2
x
x ^ 2

x <- y / 2
# a compound expreesion is held together by {}
repeat {
  x <- (x + y / x) / 2
  # an if construction for conditional execution
  if (abs(x * x - y) < 1e-10) break # break expression for loop exit
  }
x

# would illustrate y as a vector using all
y <- c(961, 1936, 2916, 3969, 4900)
x <- y / 2
repeat {
  x <- (x + y / x) / 2
  if (all(abs(x * x - y)) < 1e-10) break
  }
x

# power curves on the unit interval
x <- seq(0, 1, .05)
plot(x, x, ylab = "y", type = "l")
for ( j in 2:8 ) lines(x, x ^ j)

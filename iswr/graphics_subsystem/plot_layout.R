x <- runif(50, 0, 2)
y <- runif(50, 0, 2)
plot(x, y, 
     main="Main title", 
     sub="subtitle", 
     xlab="x-label", 
     ylab="y-label")

text(0.6, 0.6, "text at (0.6, 0.6)")

abline(h=.6, v=.6)

for (side in 1:4) mtext(-1:4, side=side, at=.7, line=-1:4)
mtext(paste("side", 1:4), side=1:4, line=-1, font=2)

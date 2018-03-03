library(ggplot2)

# attach the dataset to the current path
attach(mpg)

# relate engine size, displacement, to highway mpg
lm.fit <-lm(hwy~displ)

# examine coefficients
coef(lm.fit)

png(filename = "Rplot%03.d.png")

# plotting the data and linear model
ggplot(mpg, aes(displ, hwy)) +
    geom_point() +
    geom_smooth(method="lm") +
    ggtitle("Engine size to Highway Miles Per Gallon") +
    xlab("Engine Size in Displacement") +
    ylab("Highway Miles per Gallon")


# examine coefficients of cylinder to highway mpg
coef(lm(hwy~cyl))

# plotting cylinder realted to highway mpg
ggplot(mpg, aes(cyl, hwy)) +
    geom_jitter() +
    geom_smooth(method="lm") +
    ggtitle("Cylinders to Highway Miles Per Gallon") +
    xlab("Number of Cylinders") +
    ylab("Highway Miles per Gallon")


# plotting with classes for more perspective
ggplot(mpg, aes(cyl, hwy, color=class)) +
    geom_jitter(shape = 1) +
    geom_smooth(method="lm") +
    ggtitle("Car types to highway miles") +
    xlab("Number of Cylinders") +
    ylab("Highway Miles per Gallon")

dev.off()


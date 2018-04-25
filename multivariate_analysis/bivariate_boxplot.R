library("MVA")

mlab <- "Manufacturing enterprises with 20 or more workers"
plab <- "Population size (1970 census) in thousands"
slab <- "SO2 content of air in micrograms per cubic meters"
tlab <- "Average annual temperature in degrees Fahrenheit"
wlab <- "Average annual wind speed in miles per hour"
clab <- "Average annual precipitatoin in inches"
pdlab <- "Average number of days with precipitation per year"


# Plot generation
p.k <- function(x, xlab, ylab, out.idx) {
    # Create main label with correlation
    olab <- paste(c("Correlation with outliers removed:"),
                with(USairpollution,
                     round(cor(x)[2], digits = 2)))
    # Plot bivariate boxplot over scatterplot
    bvbox(x, mtitle = "", cex.lab = 0.9, type = "n",
          xlab = c(xlab, olab), ylab = ylab)
    # Add abbrevated names as plots
    with(USairpollution, text(x[[1]], x[[2]], cex = 0.6,
                          labels = abbreviate(row.names(x))))
    with(USairpollution, chiplot(x[[1]], x[[2]]))
}

# bivariate boxplot scatterplots used to detect outliers
# Outliers: "Chicago", "Providence", "Miami"
out.1 <- match(c("Chicago", "Providence", "Miami"), rownames(USairpollution))
x.1 <- USairpollution[, c("SO2", "temp")]
p.k(x.1, slab, tlab, out.1)

# Outliers: "Chicago", "Philidelpha"
out.2 <- match(c("Chicago", "Philidelpha"), rownames(USairpollution))
x.2 <- USairpollution[, c("temp", "manu")]
p.k(x.2, tlab, mlab, out.2)

# Outliers: "Detroit", "Philidelpha", "Chicago"
out.3 <- match(c("Detroit", "Philidelpha", "Chicago"), rownames(USairpollution))
x.3 <- USairpollution[, c("manu", "popul")]
p.k(x.3, mlab, plab, out.3)

# Outliers: "Detroit", "Philidelpha", "Chicago"
out.4 <- match(c("Detroit", "Philidelpha", "Chicago"), rownames(USairpollution))
x.4 <- USairpollution[, c("popul", "wind")]
p.k(x.4, plab, wlab, out.4)

# Outliers: "Albuquerque", "Phoenix"
out.5 <- match(c("Albuquerque", "Phoenix"), rownames(USairpollution))
x.5 <- USairpollution[, c("wind", "precip")]
p.k(x.5, wlab, clab, out.5)

# Outliers: "Albuquerque", "Phoenix"
out.6 <- match(c("Albuquerque", "Phoenix"), rownames(USairpollution))
x.6 <- USairpollution[, c("precip", "predays")]
p.k(x.6, clab, pdlab, out.6)

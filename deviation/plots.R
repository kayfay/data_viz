# FRED Graph Observations
# Federal Reserve Economic Data
# Link: https://fred.stlouisfed.org
# Help: https://fred.stlouisfed.org/help-faq
# Economic Research Division
# Federal Reserve Bank of St. Louis
#
# PPOILUSDM	Global price of Palm Oil, U.S. Dollars per Metric Ton, Monthly, Not Seasonally Adjusted
#
# Frequency: Monthly
# observation_date	PPOILUSDM Sell in US	POLVOILUSDQ Overall sell in the World

library(ggplot2)

o.data <- read.delim("oil.txt", sep="\t", header=F)

colnames(o.data) <- c("Date", "Palm Oil Sales U.S.", "Palm Oil Sales World")

Date   <- as.Date(unlist(o.data[1]), format = "%Y-%m-%d")
U.S.   <- as.numeric(unlist(o.data[2]))
Global <- as.numeric(unlist(o.data[3]))
o2.data <- data.frame(Date, U.S., Global)

png(filename = "Rplot%03.d.png")
barplot(cbind(U.S., Global), beside = T, horiz = T, main = "Palm Oil Sales in U.S. Dollars")

ggplot(o2.data, aes(Date, y = Sales, color = Market)) +
    geom_point(aes(y = U.S., col = "US")) +
    geom_point(aes(y = Global, col = "Global")) +
    geom_abline(intercept = 683, slope = -0.05) +
    geom_abline(intercept = 402, slope = 0.5) +
    ggtitle("Palm Oil Sales")

ggplot(o2.data, aes(Date, y = Sales, color = Market)) +
    geom_point(aes(y = log(U.S.), col = "US")) +
    geom_point(aes(y = log(Global), col = "Global")) +
    geom_abline(intercept = 6.7, slope = -0.00015) +
    geom_abline(intercept = 7.1, slope = 0.00017) +
    ggtitle("Palm Oil Sales")

ggplot(o2.data, aes(Date, y = Sales, color = Market)) +
    geom_area(stat="identity", aes(y = log(U.S.), col = "US")) +
    geom_area(stat="identity", aes(y = log(Global), col = "Global"), alpha=0.5) +
    geom_abline(intercept = 6.7, slope = -0.00015, color = "deepskyblue3") +
    geom_abline(intercept = 7.1, slope = 0.00017, color = "plum2") +
    ggtitle("Palm Oil Sales")

# mean absolute deviation
mad(U.S.) # 120.1
mad(Global) # 1191.1

# mean deviation from global minima and maxima of U.S. sales
min(U.S.) # 162.794
max(U.S. )# 785.8735
mad(U.S., min(U.S.))
mad(U.S., max(U.S.))

# mean deviation from global minima and maxima of Global sales
min(Global) # 1814.1
max(Global) # 6167.2
mad(Global, min(Global))
mad(Global, max(Global))

o.us <- data.frame(Date, U.S.)
ggplot(o.us, aes(Date, U.S.)) +
    geom_bar(stat = "identity", aes(y = U.S.), width = 150, fill = "lightskyblue") +
    geom_abline(intercept = 785.8735, slope = 0) +
    geom_abline(intercept = mad(U.S., max(U.S.)), slope = 0, color = "red1") +
    ggtitle("US Palm Oil Sales Mean Absolute Devation from the most sales.")

o.gl <- data.frame(Date, Global)
ggplot(o.gl, aes(Date, Gobal)) +
    geom_bar(stat = "identity", aes(y = Global), width = 150, fill = "lightskyblue") +
    geom_abline(intercept = 6167.2, slope = 0) +
    geom_abline(intercept = mad(Global, max(Global)), slope = 0, color = "red1") +
    ggtitle("Global Palm Oil Sales Mean Absolute Devation from the most sales.")

ggplot(o.gl, aes(Date, Gobal)) +
    geom_bar(stat = "identity", aes(y = Global), width = 150, fill = "lightskyblue") +
    geom_abline(intercept = 1814.1, slope = 0) +
    geom_abline(intercept = mad(Global, min(Global)), slope=0, color="red1") +
    ggtitle("Global Palm Oil Sales Mean Absolute Devation from the most sales.")



ggplot(o2.data, aes(Date, y = Sales, color = Market)) +
    geom_area(stat = "identity", aes(y = log(U.S.), col = "US")) +
    geom_area(stat = "identity", aes(y = log(Global), col = "Global"), alpha = 0.5) +
    geom_abline(intercept = 6.7, slope = -0.00015, color = "deepskyblue3") +
    geom_abline(intercept = 7.1, slope = 0.00017, color = "plum2") +
    # visual deviation analysis for Global
    geom_abline(intercept = log(1814.1), slope = 0, linetype = 2, color = "grey") +
    geom_abline(intercept = log(mad(Global, log(min(Global)))), slope = 0, color = "magenta") +
    geom_abline(intercept = log(6167.2), slope = 0, linetype = 2, color = "grey") +
    # visual deviation analysis for US
    geom_abline(intercept = log(162.794), slope = 0, linetype = 2, color = "grey") +
    geom_abline(intercept = log(mad(U.S., log(min(U.S.)))), slope = 0, color = "turquoise") +
    geom_abline(intercept = log(785.8735), slope = 0, linetype = 2, color = "grey") +
    ggtitle("Palm Oil Sales")

dev.off()

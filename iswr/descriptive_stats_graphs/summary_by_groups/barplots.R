# bar plots

# caffine consumption by marital status
dat.mat <- c(652, 1537, 598, 242, 36, 46, 38, 21, 218, 327, 106, 67)
caff.marital <- matrix(dat.mat, nrow = 3, byrow = T)
colnames(caff.marital) <- c("0", "1-150", "151-300", ">300")
rownames(caff.marital) <- c("Married", "Prev.married", "Single")
names(dimnames(caff.marital)) <- c("marital", "consumption")

total.caff <- margin.table(caff.marital, 2)
# consumption
#       0   1-150 151-300    >300 
#     906    1910     742     330 

barplot(total.caff, col = "white")

# if the argument is a matrix then a stacked barchat is created
# if you want row besides each other use beside = T
par(mfrow = c(2, 2))
barplot(caff.marital, col = "white")
barplot(t(caff.marital), col = "white")
barplot(t(caff.marital), col = "white", beside = T)
barplot(prop.table(t(caff.marital), 2), col = "white", beside = T)
par(mfrow = c(1, 1))

# presenting with a color legend
barplot(prop.table(t(caff.marital), 2), beside = T,
legend.text = colnames(caff.marital),
args.legend = list(x = 16.3, y = .5),
col = c("white", "grey80", "grey50", "black"))
locator()


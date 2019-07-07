# marital data to plot
dat.mat <- c(652, 1537, 598, 242, 36, 46, 38, 21, 218, 327, 106, 67)
caff.marital <- matrix(dat.mat, nrow = 3, byrow = T)
colnames(caff.marital) <- c("0", "1-150", "151-300", ">300")
rownames(caff.marital) <- c("Married", "Prev.married", "Single")
names(dimnames(caff.marital)) <- c("marital", "consumption")

# dotcharts like barplots with besides = T
dotchart(t(caff.marital), lcolor = "black")

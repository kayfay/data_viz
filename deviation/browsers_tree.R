
library('treemapify')
library('ggplot2')

browsers <- read.table("browsers.csv", header=TRUE, sep=",")
browsers <- browsers[2:9]
b_sums <- apply(browsers, 2, sum, na.rm=T)
browser_usage <- as.vector(b_sums)
lbls <- data.frame(names(b_sums))

png(filename="treemap.png")
ggplot(data.frame(b_sums), aes(area = browser_usage, fill = browser_usage, label =lbls)) +
    geom_treemap() +
    geom_treemap_text(colour = "white", place = "centre", grow=TRUE)
dev.off()

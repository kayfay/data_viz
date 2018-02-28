library("RColorBrewer")

browsers <- read.table("browsers.txt", header=TRUE)
browsers <- browsers[order(browsers[,2]),]

pielabels <- sprintf("%s = %3.1f%s", browsers[,1],
                     100*browsers[,2]/sum(browsers[,2]), "%")

png(filename="pie_chart.png")
pie(browsers[,2],
    labels=pielabels,
    clockwise=TRUE,
    radius=1,
    col=brewer.pal(7,"Set1"),
    border="white",
    cex=0.8,
    main="Percentage Share of Internet Browser usage")
dev.off()

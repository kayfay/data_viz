library('MVA')

layout(matrix(1:8, nc = 2))
sapply(colnames(USairpollution), function(x) {
                    qqnorm(USairpollution[[x]], main =x)
                    qqline(USairpollution[[x]])
})

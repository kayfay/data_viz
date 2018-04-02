library(GGally)
library(network)
library(sna)
library(ggplot2)
net = rgraph(10, mode = "graph", tprob = 0.5)
net = network(net, directed = FALSE)
network.vertex.names(net) = letters[1:10]
ggnet2(net)
ggnet2(net, node.size = 6, node.color = "black", edge.size = 1, edge.color = "grey")

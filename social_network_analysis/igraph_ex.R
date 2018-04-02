# Static and Dynamic Network Visualizations with R: http://kateto.net/network-visualization

if(!require('igraph')) {install.packages("igraph")}

# edgelist dataset
nodes <- read.csv('./polnet/Data\ files/Dataset1-Media-Example-NODES.csv', header=T, as.is=T)
links<- read.csv('./polnet/Data\ files/Dataset1-Media-Example-EDGES.csv', header=T, as.is=T)

# since links has more dimensions, from multiple links between the same nodes
# we will collapse the links based on their summed weights
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[4] <- 'weight'
rownames(links) <- NULL

# matrix dataset
# Two-mode graphs have two different kinds of actors and links that go across
nodes2 <- read.csv('./polnet/Data\ files/Dataset2-Media-User-Example-NODES.csv', header=T, as.is=T)
# links2 is a two mode-network news sources and their consumers
links2 <- as.matrix(read.csv('./polnet/Data\ files/Dataset2-Media-User-Example-EDGES.csv', header=T, row.names=1))

# Use igraph to convert the data into an igraph network object
# plotting with igraph http://igraph.org/
library('igraph')

# take two dataframes, links and nodes as d and vertices
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
# d (the edges of the network) takes IDs for from and to
# while assigning attributes type and weight to the new object
#       from  to      type weight
#     1  s01 s02 hyperlink     22
#     2  s01 s03 hyperlink     22
#     3  s01 s04 hyperlink     21
#     4  s01 s15   mention     20
#
# vertices take column of node IDs and the rest as node attributes

# Access information from the igraph network object via the following functions
#  E(net)       # The edges of the "net" object
#  V(net)       # The vertices of the "net" object
#  E(net)$type  # Edge attribute "type"
#  V(net)$media # Vertex attribute "media"
#
#  # Find nodes and edges by attribute:
#  # (that returns oblects of type vertex sequence/edge sequence)
#  V(net)[media=="BBC"]

#  E(net)[type=="mention"]
#
#  # You can also examine the network matrix directly:
#  net[1,]
#  net[5,7]

# extract edge list or matrix
# as_edgelist(net, names=T)
# as_adjacency_matrix(net, attr="weight")

# data frames of nodes and edges *original data frames*
# as_data_frame(net, what="edges")
# as_data_frame(net, what="vertices")

pdf(file='Rplot01.pdf')
# plotting net shows it requires bueatification
plot(net)
net <- simplify(net, remove.multiple=F, remove.loops=T) # some arrows loop or multiples
plot(net, edge.arrow.size=.4, vertex.label=NA) # reduce arrow size & remove labels
# plot with curved edges showing multiple links
plot(net, edge.arrow.size=.1, edge.curved=.1, vertex.label=NA)
# replace vertex name stored in media, adjust colors
plot(net, edge.arrow.size=.2, edge.color="orange",
     vertex.color="orange", vertex.frame.color="#ffffff",
     vertex.label=V(net)$media, vertex.label.color="black")
dev.off()

# remove labels
V(net)$label <- NA

# graph media nodes as colors
colors <- c("gray50", "tomato", "gold")
V(net)$color <- colors[V(net)$media.type]

# size based on degree of centrality (more links = larger node)
deg <- degree(net, mode="all")
V(net)$size <- deg*3
# size based on audience size value
# V(net)$size <- V(net)$audience.size*0.6

# width of edges based on weight
E(net)$width <- E(net)$weight/6

# change arrow size and edge color
E(net)$arrow.size <- .2
E(net)$edge.color <- "gray80"
E(net)$width <- 1+E(net)$weight/12

pdf(file='Rplot02.pdf')
plot(net)
legend(x=-1.5, y=-1.1, c("Newspaper", "Television", "Online News"), pch=21,
                         col="#777777", pt.bg=colors, pt.cex=2, cex=.8, bty="n", ncol=1)

# plot with semantic labels for nodes
plot(net, vertex.shape="none", vertex.label=V(net)$media,
     vertex.label.font=2, vertex.label.color="gray40",
     vertex.label.cex=.7, edge.color="gray85")

# gather starting node for each edge
edge.start <- ends(net, es=E(net), names=F)[,1]
# create colors by edge.start
edge.col <- V(net)$color[edge.start]

plot(net, edge.color=edge.col, edge.curved=.1)

dev.off()

# Network Layouts
# generate an 80-node graph with sample_pa()
net.bg <- sample_pa(80)
V(net.bg)$size <- 8
V(net.bg)$frame.color <- "white"
V(net.bg)$color <- "orange"
V(net.bg)$label <- ""
E(net.bg)$arrow.mode <- 0

pdf(file='Rplot03.pdf')
plot(net.bg)

plot(net.bg, layout=layout_randomly) # random layout settings

c <- layout_in_circle(net.bg) # as a circle
plot(net.bg, layout=c)

d <- cbind(1:vcount(net.bg), c(1, vcount(net.bg):2)) # as diag
plot(net.bg, layout=d)

s <- layout_on_sphere(net.bg) # 3D sphear
plot(net.bg, layout=s)

# force directed algorithm as layout (Fruchterman-Reingold)
par(mfrow=c(2,2), mar=c(0,0,0,0)) # plot four figures
for (i in 1:4) {
plot(net.bg, layout=layout_with_fr(net.bg))
}
# force directed algorithm  as layout (Kamada Kawai)
plot(net.bg, layout=layout_with_kk(net.bg))

# force directed algorithm good for large connected graphs (LGL)
plot(net.bg, layout=layout_with_lgl)

# Multidimensional scaling algorithm (MDS) as a measure of
# similarity/distance between nodes
plot(net.bg, layout=layout_with_mds)

dev.off()

pdf(file='Rplot04.pdf')
# all layouts
layouts <- grep ("^layout_", ls("package:igraph"), value=T)[-1]
layouts <- layouts[!grepl("bipartite|merge|norm|sugiyama|tree", layouts)] # remove non-applicable graphs

par(mfrow=c(5,3), mar=c(1,1,1,1))
for (layout in layouts) {
    print(layout)
    l <- do.call(layout,list(net))
    plot(net, edge.arrow.mode=0, layout=l, main=layout)
}

dev.off()

pdf(file='Rplot05.pdf')
# create a sparse network, remove links lower than the mean
cut.off <- mean(links$weight)
net.sp <- delete_edges(net, E(net)[weight<cut.off])
plot(net.sp)

# show communities using label propagation
clp <- cluster_label_prop(net)
# class(clp)

par(mfrow=c(1,2))
plot(clp, net)

# color nodes based on communities
V(net)$community <- clp$membership
colors <- adjustcolor( c("gray50", "tomato", "gold", "yellowgreen"), alpha=.6)
plot(net, vertex.color=colors[V(net)$community])

dev.off()

## highlighting specific nodes and links
# we can use the distances() function to find the shortest paths from nodes
# using the v parameter on V(net), looking at distance from NYT following
dist.from.NYT <- distances(net, v=V(net)[media=="NY Times"],
                           to=V(net), weights=NA)

# set colors to plot the distances
oranges <- colorRampPalette(c("dark red", "gold"))
colors <- oranges(max(dist.from.NYT) + 1)
colors <- colors[dist.from.NYT + 1]

pdf(file='Rplot06.pdf')
plot(net, vertex.color = colors, vertex.label=dist.from.NYT, edge.arrow.size=.6,
     vertex.label.color="white")

# highlight a path in the network
news.path <- shortest_paths(net,
                            from=V(net)[media=="MSNBC"],
                            to=V(net)[media=="New York Post"],
                            output = "both") # path nodes and edges


# generate edge color variable to plot the path
ecolor <- rep("gray80", ecount(net))
ecolor[unlist(news.path$epath)] <- "orange"


# generate edge width variable to plot the path
ewith <- rep(2, ecount(net))
ewith[unlist(news.path$epath)] <- 4

# generate node color variable to plot the path
vcolor <- rep("gray40", vcount(net))
vcolor[unlist(news.path$vpath)] <- "gold"

plot(net, vertex.color=vcolor, edge.color=ecolor,
     edge.width=ewith, edge.arrow.mode=0)

# highlight edges going into the vertex instance for WSJ
# using incident() and incident_edges() function
inc.edges <- incident(net, V(net)[media=="Wall Street Journal"], mode="all")

# set colors to plot the selected edges
ecolor <- rep("grey80", ecount(net))
ecolor[inc.edges] <- "orange"
vcolor <- rep("grey40", vcount(net))
vcolor[V(net)$media=="Wall Street Journal"] <- "gold"

plot(net, vertex.color=vcolor, edge.color=ecolor)

# neighbors of a vertex like WSJ can be found using neighbors()
# from a focal factor and ego() with order to set the number of steps
neigh.nodes <- neighbors(net, V(net)[media=="Wall Street Journal"], mode="out")

# set colors
vcolor[neigh.nodes] <- "#ff9d00"

plot(net, vertex.color=vcolor)

# mark with communities
par(mfrow=c(1,2))
plot(net, mark.groups=c(1,4,5,8), mark.col="#C5E5E7", mark.border=NA)

# multiple groups
plot(net, mark.groups=list(c(1,4,5,8), c(15:17)),
     mark.col=c("#C5E5E7", "#ECD89A"), mark.border=NA)

dev.off()

# heatmap of the network matrix
netm <- as_adjacency_matrix(net, attr="weight", sparse=F)
colnames(netm) <- V(net)$media
rownames(netm) <- V(net)$media

palf <- colorRampPalette(c("gold", "dark orange"))
heatmap(netm[,17:1], Rowv=NA, Colv=NA, col=palf(100),
        scale="none", margins=c(10,10))


pdf(file='Rplot07.pdf')
# a simple graph of degree and cumulative frequency
# showing degree distribution for the network
deg.dist <- degree_distribution(net, cumulative=T, mode="all")
plot(x=0:max(deg), y=1-deg.dist, pch=19, cex=1.2, col="orange",
     )

# read matrix links2
net2 <- graph_from_incidence_matrix(links2)
# table(V(net2)$type) # node attribute type FALSE/TRUE for vertex mode
#
#    FALSE  TRUE
#       10    20

## plotting two-mode networks
plot(net2, vertex.label=NA)

# Media outlets are blue squares, audience nodes are orange circles
V(net2)$color <- c("steel blue", "orange")[V(net2)$type+1]
V(net2)$shape <- c("square", "circle")[V(net2)$type+1]

# Media outlets will have name labels, audience members will not
V(net2)$label <- ""
V(net2)$label[V(net2)$type==F] <- nodes2$media[V(net2)$type==F]
V(net2)$label.cex=.6
V(net2)$label.font=2

plot(net2, vertex.label.color="white", vertex.size=(2-V(net2)$type)*8)

# using text as nodes
plot(net2, vertex.shape="none", vertex.label=nodes2$media,
     vertex.label.color=V(net2)$color, vertex.label.font=2,
     vertex.label.cex=.6, edge.color="gray70", edge.width=2)

dev.off()

# using image files using the png package
library('png')

img.1 <- readPNG("./Images/news.png")
img.2 <- readPNG("./Images/user.png")

V(net2)$raster <- list(img.1, img.2)[V(net2)$type+1]

pdf(file='Rplot08.pdf')

plot(net2, vertex.shape="raster", vertex.label=NA,
     vertex.size=16, vertex.size2=16, edge.width=2)

# plot two-mode network bipartite projections
# co-memberships can be calculated by multiplying the network matrix
# by its transposed matrix the igraph functio bipartite.projection()
net2.bp <- bipartite.projection(net2)

par(mfrow=c(1, 2))

plot(net2.bp$proj1, vertex.label.color="black", vertex.label.dist=1,
     vertex.label=nodes2$media[!is.na(nodes2$media.type)])

plot(net2.bp$proj2, vertex.label.color="black", vertex.label.dist=1,
     vertex.label=nodes2$media[!is.na(nodes2$media.type)])

dev.off()

# plotting multiplex networks
# multple graphs, (multigraphs), have multple edges connecting the
# same two nodes, multiplex networks have multiple types of ties
# relationships can represent friendships between individuals

# hyperlinks and mentions plotted seperately
E(net)$width <- 1.5

pdf(file="Rplot09.pdf")
plot(net, edge.color=c('dark red', "slategrey")[(E(net)$type=="hyperlink")+1],
     vertex.color="gray40", layout=layout_in_circle, edge.curved=.3)

# a second way to visualize
net.m <- net - E(net)[E(net)$type=="hyperlink"]
net.h <- net - E(net)[E(net)$type=="mention"]

# structure nodes layout
lyot.fr <- layout_with_fr(net)

par(mfrow=c(1,2))
plot(net.h, vertex.color="orange", layout=lyot.fr, main="Tie: Hyperlink")
plot(net.m, vertex.color="lightsteelblue2", layout=lyot.fr, main="Tie: Mention")

dev.off()

# Node dyads connecting multiple types of connections do not exist in our dataset
# where we have a 'hyperlink' and 'mention' connected to the same two news outlets

# an example generated multiple edge by the same two nodes

pdf(file="Rplot10.pdf")
multigtr <- graph(edges = c(1,2, 1,2, 1,2), n = 2)
lyot <- layout_with_kk(multigtr)

par(mfrow=c(1,2))

plot(multigtr, vertex.color="lightsteelblue", vertex.frame.color="white",
     vertex.size=40, vertex.shape="circle", vertex.label=NA,
     edge.color=c("gold", "tomato", "yellowgreen"), edge.width=5,
     edge.arrow.size=3, edge.curved=0.1, layout=lyot)

plot(multigtr, vertex.color="lightsteelblue", vertex.frame.color="white",
     vertex.size=40, vertex.shape="circle", vertex.label=NA,
     edge.color=c("gold", "tomato", "yellowgreen"), edge.width=5,
     edge.arrow.size=3, edge.curved=curve_multiple(multigtr), layout=lyot)

dev.off()

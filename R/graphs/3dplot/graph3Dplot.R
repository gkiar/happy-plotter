library(igraph)
library(rgl)
g <- read.graph('./demo_graph.graphml', format='graphml')

centroids <- get.vertex.attribute(g, 'centroid')

layouts <- matrix(nrow = length(centroids), ncol = 3)
for (i in 1:length(centroids)) {
  temp <- na.omit(as.numeric(unlist(strsplit(unlist(centroids[i]), "[^0-9]+"))))
  layouts[i,] <- temp
}

g$layout <- layouts

open3d()
bg3d('black')
rglplot(g, layout = g$layout,
        vertex.label = NA, vertex.size = 12, vertex.color='tomato1',
        edge.width = log10(get.edge.attribute(g, 'weight')), edge.color='paleturquoise1')

rgl.postscript('./demo_fig.pdf', fmt = 'pdf')
rgl.snapshot('./demo_fig.png', fmt='png')

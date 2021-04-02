require(colordistance)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(ggplot2)

## ==================================================================
## ==                         Histogramas                          ==
## ==================================================================

def_ggpairs <- function(all_points){
  his <- ggpairs(all_points, columns = 1:3,
          upper = list(continuous = wrap("density", size=0.3)),
          lower = list(continuous = wrap("points", size=0.0001, alpha=.3,
                                         col = rgb(all_points$R, all_points$G, all_points$B)), 
                       combo = wrap("dot")
          )
  ) + theme_pander()
  
  return(his)
}

def_histogram(all_points){
  h <- getLabHist(origImage, bins = c(179, 453, 523), sample.size = NULL,
             ref.white = "D65", from = "sRGB",
             bin.avg = T, as.vec = T,
             a.bounds = c(-128, 127),
             b.bounds = c(-128, 127))
  return(h)
}

# overlying the histogram using ggplot
def_curva <- function(all_points){
  ggplot(all_points) +
    geom_density(aes(L, fill = "L"), alpha = .3) +
    geom_density(aes(a, fill = "a"), alpha = .3) +
    geom_density(aes(b, fill = "b"), alpha = .3)
}
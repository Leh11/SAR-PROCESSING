require(colordistance)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(ggplot2)
require(distrEx)

## ==================================================================
## ==                         Histogramas                          ==
## ==================================================================

# read the ideal "pauli"
ideal <- loadImage("../image/ideal/pauli.png", 
                   CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                   lower = NULL, upper = NULL)

# get data from the Lab and RGB space
frame_LAB <- data.frame(ideal$filtered.lab.2d)
frame_RGB <- data.frame(ideal$filtered.rgb.2d)

names(frame_RGB) <- c("R", "G", "B")

all_points <- cbind(frame_LAB, frame_RGB)

ggpairs(all_points, columns = 1:3,
        upper = list(continuous = wrap("density", size=0.3)),
        lower = list(continuous = wrap("points", size=0.0001, alpha=.3,
                    col = rgb(all_points$R, all_points$G, all_points$B)), 
                        combo = wrap("dot")
        )
) + theme_pander()

# overlying the histogram using ggplot
ggplot(all_points) +
  geom_density(aes(L, fill = "L"), alpha = .3) +
  geom_density(aes(a, fill = "a"), alpha = .3) +
  geom_density(aes(b, fill = "b"), alpha = .3)
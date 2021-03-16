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

ideal <- loadImage("../ideal/pauli.png", 
                   CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                   lower = NULL, upper = NULL)

# get data from the Lab and RGB space
frame_LAB <- data.frame(ideal$filtered.lab.2d)
frame_RGB <- data.frame(ideal$filtered.rgb.2d)

names(frame_RGB) <- c("R", "G", "B")

all_points <- cbind(frame_LAB, frame_RGB)

# overlying the histogram using ggplot
ggplot(all_points) +
      geom_histogram(aes(x = a, fill = "a", alpha = .3),
                     col = "white", bins = 70) +
      geom_histogram(aes(x = b, fill = "b", alpha = .3),
                     col = "white", bins = 70) +
      geom_histogram(aes(x = L, fill = "L", alpha = .3),
                     col = "white", bins = 70) 

                 

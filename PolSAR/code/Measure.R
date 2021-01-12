require("colordistance")
require("colorspace")

# read the ideal "pauli"
ideal <- loadImage("pauli.png", 
                   CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                   lower = NULL, upper = NULL)
# read the ideal "lena"
ideal_lena <- loadImage("lena.png", 
                      CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                      lower = NULL, upper = NULL)
# read the ideal "mandrill"
ideal_mandrill <- loadImage("mandrill.png", 
                        CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                        lower = NULL, upper = NULL)

ideal_lighthouse <- loadImage("lighthouse.png", 
                            CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                            lower = NULL, upper = NULL)

ideal_mount <- loadImage("mount.png", 
                            CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                            lower = NULL, upper = NULL)


#show the ideal image histogram
plotPixels(ideal_mandrill, color.space = "lab",
           ref.white = "D65", from = "sRGB",
           main = "Pixel on CIElab space - mandrill",
           xlim = "default",
           ylim = "default",
           zlim = "default", 
           lower = NULL, upper = NULL)

#getting the histogram of L component in each image

par(mfrow = c(2, 3))
h.ideal.L <- hist(ideal$filtered.lab.2d$L, 
                  main = "Histogram of L components of pauli",
                  xlab = "L component")

h.ideal_lena.L <- hist(ideal_lena$filtered.lab.2d$L,
                       main = "Histogram of L components of lena",
                       xlab = "L component")

h.ideal_mandrill.L <- hist(ideal_mandrill$filtered.lab.2d$L, 
                           main = "Histogram of L components of mandrill", 
                           xlab = "L component")

h.ideal_lighthouse.L <- hist(ideal_lighthouse$filtered.lab.2d$L, 
                             main = "Histogram of L components of ideal_lighthouse", 
                             xlab = "L component")

h.ideal_mount.L <- hist(ideal_mount$filtered.lab.2d$L, 
                           main = "Histogram of L components of mount", 
                           xlab = "L component")
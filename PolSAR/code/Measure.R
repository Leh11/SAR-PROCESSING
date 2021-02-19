require("colordistance")
require("colorspace")
require(plot3D)

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

## ===============================================================================
## ==                             3D Histogram                                  ==         
## ===============================================================================

ideal.Pauli <- as.matrix(ideal$filtered.lab.2d)
ideal.Lena <- as.matrix(ideal_lena$filtered.lab.2d)
ideal.mandrill <- as.matrix(ideal_mandrill$filtered.lab.2d)
ideal.lighthouse <- as.matrix(ideal_lighthouse$filtered.lab.2d)
ideal.mount <- as.matrix(ideal_mount$filtered.lab.2d)

par(mfrow = c(2, 5))
hist3D(z = ideal.Pauli[1:20, ], scale = F, 
       expand = 0.01,
       theta = 40, phi = 50,
       border = "black", shade = 0.2,
       space = 0.2, ticktype = "detailed",
       main = "Histogram of pauli with theta = 40 and phi = 40 using hist3D()")

hist3D(z = ideal.Lena[1:20, ], scale = F, 
       expand = 0.01,
       theta = 40, phi = 50,
       border = "black", shade = 0.2,
       space = 0.2, ticktype = "detailed",
       main = "Histogram of Lena with theta = 40 and phi = 40 using hist3D()")

hist3D(z = ideal.mandrill[1:20, ], scale = F, 
       expand = 0.01,
       theta = 40, phi = 50,
       border = "black", shade = 0.2,
       space = 0.2, ticktype = "detailed",
       main = "Histogram of mandrill with theta = 40 and phi = 40 using hist3D()")

hist3D(z = ideal.lighthouse[1:20, ], scale = F, 
       expand = 0.01,
       theta = 40, phi = 50,
       border = "black", shade = 0.2,
       space = 0.2, ticktype = "detailed",
       main = "Histogram of lighthouse with theta = 40 and phi = 40 using hist3D()")


hist3D(z = ideal.mount[1:20, ], scale = F, 
       expand = 0.01,
       theta = 40, phi = 50,
       border = "black", shade = 0.2,
       space = 0.2, ticktype = "detailed",
       main = "Histogram of mount with theta = 40 and phi = 40 using hist3D()")

#======
getLabHist(ideal, 
           sample.size = 'null',
           bins = c(4, 4, 4), 
           color.space = "CIELab",
           ref.white = "D65",
           plotting = T,
           a.bounds = c(-127, 127),
           b.bounds = c(-127, 127),
           title = "Histogram of lena using getLabHist()")

getLabHist(ideal_lena, 
           sample.size = 'null',
           bins = c(4, 4, 4), 
           color.space = "CIELab",
           ref.white = "D65",
           plotting = T,
           a.bounds = c(-127, 127),
           b.bounds = c(-127, 127),
           title = "Histogram of lena using getLabHist()")

getLabHist(ideal_mandrill, 
           sample.size = 'null',
           bins = c(4, 4, 4), 
           color.space = "CIELab",
           ref.white = "D65",
           plotting = T,
           a.bounds = c(-127, 127),
           b.bounds = c(-127, 127),
           title = "Histogram of mandrill using getLabHist()")

getLabHist(ideal_lighthouse, 
           sample.size = 'null',
           bins = c(4, 4, 4), 
           color.space = "CIELab",
           ref.white = "D65",
           plotting = T,
           a.bounds = c(-127, 127),
           b.bounds = c(-127, 127),
           title = "Histogram of lighthouse using getLabHist()")


getLabHist(ideal_mount, 
           sample.size = 'null',
           bins = c(4, 4, 4), 
           color.space = "CIELab",
           ref.white = "D65",
           plotting = T,
           a.bounds = c(-127, 127),
           b.bounds = c(-127, 127),
           title = "Histogram of mount using getLabHist()")


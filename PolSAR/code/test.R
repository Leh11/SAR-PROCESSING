require(imager)
require(magick)
require(colorspace)
require(colordistance)
require(plot3D)

originalRGB <- load.image("../image/original/mandrill.png")
#originalRGB <- load.image("../image/original/flowers.png")
originalLab <- RGBtoLab(originalRGB)


originalLab_1 <- RGBtoLab(originalRGB)
originalLab_1[,,,2] <- originalLab_1[,,,3] <- 0
originalRGB_1 <- LabtoRGB(originalLab_1)


originalLab_2 <- RGBtoLab(originalRGB)
originalLab_2[,,,1] <- originalLab_2[,,,1] - 55.13316
originalRGB_2 <- LabtoRGB(originalLab_2)
display(originalRGB_2)

par(mfrow = c(1, 2))
plot(originalRGB, axes = FALSE)
plot(originalRGB_2, axes = FALSE)
## 4

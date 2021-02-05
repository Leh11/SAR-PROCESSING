require(ggplot2)
require(colordistance)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(plot3D)
require(multiApply)

set.seed(1234567890, kind="Mersenne-Twister")

## a funcão mesh forma um array-mesh 21x21x21
                   
dataMESH <- mesh(seq(0, 0.2, by = 0.01),
                 seq(0, 0.2, by = 0.01),
                 seq(0, 0.2, by = 0.01))

frameRGB <- cbind(dataMESH$x, dataMESH$y, dataMESH$z)

frameRGB <- data.frame(frameRGB)
names(frameRGB) <- c("R", "G", "B")

## arrayLab - contém a matriz de cores convertida de CIE RGB à Lab usando convertColorSpace().
## sample.size = NULL para pegar amostra completa; e referência à luz do dia = "D65".

frameLab <- convertColorSpace(frameRGB, from = "CIE RGB", 
                              to = "Lab", from.ref.white = NULL,
                              to.ref.white = "D65", sample.size = NULL)

frameLab <- data.frame(arrayLab)

# Em baixo, atravez da ggpairs, pode-se vizualizar os dados, com seguintes
# caracteristicas: acima do diagonal principal, vê-se os dados em formato
# da sua densidade, enquanto que abaixo do diagonal, apresenta-se em 
# formato disperso. Finalmente, por default, o diagonal principal nos mostra
# a curva dos dados dados.

allpoints <- cbind(frameRGB, frameLab)

ggpairs(allpoints, columns = 4:6,
        upper = list(continuous = wrap("density", size=0.3)),
        lower = list(continuous = wrap("points", size=0.0001, alpha=.9,
                                       col=rgb(allpoints$R, allpoints$G, allpoints$B)), 
                     combo = wrap("dot")
        )
) + theme_pander()
#===========================================================================================
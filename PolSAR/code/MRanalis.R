require(ggplot2)
require("colordistance")
require("colorspace")
require("GGally")
require(ggthemes)
require(cowplot)
require(mvmesh)

## N - define o tamanho de amostra usado na construção de matriz de cores, usando espaço RGB. 
N <- 100

set.seed(1234567890, kind="Mersenne-Twister")

## arrayRGB - matriz de cores no espaço RGB com N linha e 3 colunas.

arrayRGB <- matrix(c((1:99)/N, (1:99)/N, (1:99)/N),
                   nrow = 99, ncol = 3)

dataFRGB = data.frame(arrayRGB)

## arrayLab - contém a matriz de cores convertida de CIE RGB à Lab usando convertColorSpace().
## sample.size = NULL para pegar amostra completa; e referência à luz do dia = "D65".

arrayLab <- convertColorSpace(arrayRGB, from = "CIE RGB", 
                              to = "Lab", from.ref.white = NULL,
                              to.ref.white = "D65", sample.size = NULL)

dataFLab <- data.frame(arrayLab)

# Esta função permite vizualizar os pontos das matrizes que contêm os dados 
# nos espaços "RGB e Lab", colorindo os componentes com as devidas cores. 
# faz o preenchimento 
# O parâmetro pch = 20 deixa os pontos preenchidos.

#pairs(dataFLab, col = c("red", "green", "blue"),
#      labels = c("Red", "Green", "Blue"), pch = 20,
#      main = "The Correlations between colors", 
#      lower.panel = list(continuous = wrap("smooth", alpha = 0.7, size=0.3)))

# Em baixo, atravez da ggpairs, pode-se vizualizar os dados, com seguintes
# caracteristicas: acima do diagonal principal, vê-se os dados em formato
# da sua densidade, enquanto que abaixo do diagonal, apresenta-se em 
# formato disperso. Finalmente, por default, o diagonal principal nos mostra
# a curva dos dados dados.

cor(dataFLab)

names(dataFRGB) <- c("R", "G", "B")
allpoints <- cbind(dataFRGB, dataFLab)

ggpairs(allpoints, columns = 4:6,
        upper = list(continuous = wrap("density", size=0.3)),
        lower = list(continuous = wrap("points", size=0.0001, alpha=.1,
                                       col=rgb(allpoints$R, allpoints$G, allpoints$B)), 
                     combo = wrap("dot")
        )
) +
  theme_pander()

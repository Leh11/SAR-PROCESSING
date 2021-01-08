require("colordistance")
require("colorspace")
require("GGally")

## N - define o tamanho de amostra usado na construção de matriz de cores, usando espaço RGB. 
N <- 1000

## arrayRGB - matriz de cores no espaço RGB com N linha e 3 colunas.
arrayRGB <- matrix(c(runif(N), runif(N), runif(N)),
                   nrow = N, ncol = 3)
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

#pairs(arrayLab)

# Em baixo, atravez da ggpairs, pode-se vizualizar os dados, com seguintes
# caracteristicas: acima do diagonal principal, vê-se os dados em formato
# da sua densidade, enquanto que abaixo do diagonal, apresenta-se em 
# formato disperso. Finalmente, por default, o diagonal principal nos mostra
# a curva dos dados dados.

dataFRGB %>% ggpairs(., lower = list(continuous = wrap("smooth", alpha = 0.5, size=0.3)),
                     upper = list(continuous = wrap("density", alpha = 0.5, size=0.3)))


ggpairs(dataFLab, lower = list(continuous = wrap("smooth", alpha = 0.5, size=0.3)),
                     upper = list(continuous = wrap("density", alpha = 0.5, size=0.3)))

cor(dataFLab)
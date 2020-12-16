require("colordistance")
require("colorspace")

## N - define o tamanho de amostra usado na construção de matriz de cores, usando espaço RGB. 
N <- 100000

## arrayRGB - matriz de cores no espaço RGB com N linha e 3 colunas.
arrayRGB <- matrix(c(runif(N), runif(N), runif(N)),
                   nrow = N, ncol = 3)

## arrayLab - contém a matriz de cores convertida de CIE RGB à Lab onvertColorSpace().
## sample.size setado como NULL para pegar amostra completa e referência a luz do dia - "D65".
## Este array já está em forma do data.frame.
arrayLab <- convertColorSpace(arrayRGB, from = "CIE RGB", 
                              to = "Lab", from.ref.white = NULL,
                              to.ref.white = "D65", sample.size = NULL)

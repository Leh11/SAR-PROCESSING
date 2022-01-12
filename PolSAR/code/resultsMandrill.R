require(colordistance)
require(plot3D)
require(imager)
require(textmineR)
source("functs.R")
source("imagematrix.R")

## ========================= carregar imagem =========================== ##
originalRGB_mandrill <- load.image("../image/original/mandrill.png")

## ================= converter imagem original para Lab ================ ##
originalLab_mandrill <- RGBtoLab(originalRGB_mandrill)


## =============== montar grade para imagem de referencia ================ ##
#criar grade no intervalo especificados!
dataMESH <- mesh(seq(from=0, to=1, length.out=50),
                 seq(from=0, to=1, length.out=50),
                 seq(from=0, to=1, length.out=50))

idealRGB <- data.frame(cbind(dataMESH$x, dataMESH$y, dataMESH$z))

#converter imagem ideal de RGB para espaco Lab usando a referência da luz D65.
idealLab <- convertColorSpace(idealRGB, from = "CIE RGB", 
                              to = "Lab", from.ref.white = NULL,
                              to.ref.white = "D65", sample.size = NULL)


## ================== obter componente L  ======================= ##
## component L de ideal
L_I <- idealLab$L

## componente L de original
L_mandrill <- originalLab_mandrill[,,,1]



## ================ forçar histograma de original =============##
hist_mandrill_match_L <- HistToEcdf(hist(L_I, breaks = "FD", plot = F),
                        inverse = T)(equalize(L_mandrill))



## ================ construir imagem melhorada por matching  ================ ##

## copia 
nova_originalLab_mandrill <- originalLab_mandrill

## substituir componente L
nova_originalLab_mandrill[,,,1] <- hist_mandrill_match_L

## converter a imagem melhora para RGB
nova_originalRGB_mandrill <- LabtoRGB(nova_originalLab_mandrill)


## ========================= versão equalizada ======================== ##

versao_mandrill_equalizada <- equalImg(originalRGB_mandrill)


## ================= versão melhorada por deco Decorr ================= ##

versao_mandrill_decorr <- dc_stretch(originalRGB_mandrill)



## ====================== montar histograma ======================== ## 

#x <- seq(1, nrow(z), 1)
#y <- seq(1, ncol(z), 1)
#mandrill_histogram <- hist3D(histograma_original_mandrill = z, shade = .75)

## matriz com todos os componentes de imagem original 
matriz_original_mandrill <- matrix(c(originalRGB_mandrill),  
                                    nrow = 3*nrow(originalRGB_mandrill[,,,1]), 
                                    ncol = ncol(originalRGB_mandrill[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada
matriz_melhorada_mandrill <- matrix(c(nova_originalRGB_mandrill),
                                     nrow = 3*nrow(nova_originalRGB_mandrill[,,,1]), 
                                     ncol = ncol(originalRGB_mandrill[,,,1]), byrow = T)

## matriz com todos os componentes de imagem equalizada
matriz_equalizada_mandrill <- matrix(c(versao_mandrill_equalizada),
                                     nrow = 3*nrow(versao_mandrill_equalizada[,,,1]), 
                                     ncol = ncol(versao_mandrill_equalizada[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada por decorr
matriz_melhoradaDcorr_mandrill <- matrix(c(versao_mandrill_decorr),
                                     nrow = 3*nrow(versao_mandrill_decorr[,,,1]), 
                                     ncol = ncol(versao_mandrill_decorr[,,,1]), byrow = T)

bins <- hist(matriz_original_mandrill, breaks = "FD", plot = F)$breaks

p_original_mandrill <- hist(matriz_original_mandrill, breaks = bins)$density

q_melhorada_mandrill <- hist(matriz_melhorada_mandrill, breaks = bins)$density

q_equalizada_mandrill <- hist(matriz_equalizada_mandrill, breaks = bins)$density

q_melhoradaDcorr_mandrill <- hist(matriz_melhoradaDcorr_mandrill, breaks = bins)$density



## ================= visualizar imagem ============================= ##

## visualizar imagem mandrill original
plot(originalRGB_mandrill, axes = F)
title("mandrill original")

## visualizar imagem mandrill melhorada por matching histogram
plot(nova_originalRGB_mandrill, axes = F)
title("mandrill melhorada")

## visualizar imagem mandrill equalizada
plot(versao_mandrill_equalizada, axes = F)
title("mandrill equalizada")

## visualizar imagem mandrill melhorada por decorr
plot(versao_mandrill_decorr, axes = F)
title("mandrill melhorada por decorr")


## =================== aplicar distancia de hellinger ============== ##

## distance entre original e melhorada por matching
CalcHellingerDist(p_original_mandrill, q_melhorada_mandrill)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_mandrill, q_equalizada_mandrill)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_mandrill, q_melhoradaDcorr_mandrill)


require(colordistance)
require(plot3D)
require(imager)
require(textmineR)
source("functs.R")
source("imagematrix.R")

## ========================= carregar imagem =========================== ##
originalRGB_pauli <- load.image("../report/Relatorio/Imagens/Pauli.png")

## ================= converter imagem original para Lab ================ ##
originalLab_pauli <- RGBtoLab(originalRGB_pauli)


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
L_pauli <- originalLab_pauli[,,,1]



## ================ forçar histograma de original =============##
hist_pauli_match_L <- HistToEcdf(hist(L_I, breaks = "FD", plot = F),
                        inverse = T)(equalize(L_pauli))



## ================ construir imagem melhorada por matching  ================ ##

## copia 
nova_originalLab_pauli <- originalLab_pauli

## substituir componente L
nova_originalLab_pauli[,,,1] <- hist_pauli_match_L

## converter a imagem melhora para RGB
nova_originalRGB_pauli <- LabtoRGB(nova_originalLab_pauli)


## ========================= versão equalizada ======================== ##

versao_pauli_equalizada <- equalImg(originalRGB_pauli)


## ================= versão melhorada por deco Decorr ================= ##

versao_pauli_decorr <- dc_stretch(originalRGB_pauli)



## ====================== montar histograma ======================== ## 

#x <- seq(1, nrow(z), 1)
#y <- seq(1, ncol(z), 1)
#pauli_histogram <- hist3D(histograma_original_pauli = z, shade = .75)

## matriz com todos os componentes de imagem original 
histograma_original_pauli <- matrix(c(originalRGB_pauli),  
                                    nrow = 3*nrow(originalRGB_pauli[,,,1]), 
                                    ncol = ncol(originalRGB_pauli[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada
histograma_melhorada_pauli <- matrix(c(nova_originalRGB_pauli),
                                     nrow = 3*nrow(nova_originalRGB_pauli[,,,1]), 
                                     ncol = ncol(originalRGB_pauli[,,,1]), byrow = T)

## matriz com todos os componentes de imagem equalizada
histograma_equalizada_pauli <- matrix(c(versao_pauli_equalizada),
                                     nrow = 3*nrow(versao_pauli_equalizada[,,,1]), 
                                     ncol = ncol(versao_pauli_equalizada[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada por decorr
histograma_melhoradaDcorr_pauli <- matrix(c(versao_pauli_decorr),
                                     nrow = 3*nrow(versao_pauli_decorr[,,,1]), 
                                     ncol = ncol(versao_pauli_decorr[,,,1]), byrow = T)

bins <- hist(histograma_original_pauli, breaks = "FD", plot = F)$breaks

p_original_pauli <- hist(histograma_original_pauli, breaks = bins)$density

q_melhorada_pauli <- hist(histograma_melhorada_pauli, breaks = bins)$density

q_equalizada_pauli <- hist(histograma_equalizada_pauli, breaks = bins)$density

q_melhoradaDcorr_pauli <- hist(histograma_melhoradaDcorr_pauli, breaks = bins)$density



## ================= visualizar imagem ============================= ##

## visualizar imagem pauli original
plot(originalRGB_pauli, axes = F)
title("Pauli original")

## visualizar imagem pauli melhorada por matching histogram
plot(nova_originalRGB_pauli, axes = F)
title("Pauli melhorada")

## visualizar imagem pauli equalizada
plot(versao_pauli_equalizada, axes = F)
title("Pauli equalizada")

## visualizar imagem pauli melhorada por decorr
plot(versao_pauli_decorr, axes = F)
title("Pauli melhorada por decorr")


## =================== aplicar distancia de hellinger ============== ##

## distance entre original e melhorada por matching
CalcHellingerDist(p_original_pauli, q_melhorada_pauli)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_pauli, q_equalizada_pauli)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_pauli, q_melhoradaDcorr_pauli)


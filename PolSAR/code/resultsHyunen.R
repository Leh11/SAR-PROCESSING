require(colordistance)
require(plot3D)
require(imager)
require(textmineR)
source("functs.R")
source("imagematrix.R")

## ========================= carregar imagem =========================== ##
originalRGB_hyunen <- load.image("../report/Relatorio/Imagens/Hyunen.png")

## ================= converter imagem original para Lab ================ ##
originalLab_hyunen <- RGBtoLab(originalRGB_hyunen)


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
L_hyunen <- originalLab_hyunen[,,,1]



## ================ forçar histograma de original =============##
hist_hyunen_match_L <- HistToEcdf(hist(L_I, breaks = "FD", plot = F),
                        inverse = T)(equalize(L_hyunen))



## ================ construir imagem melhorada por matching  ================ ##

## copia 
nova_originalLab_hyunen <- originalLab_hyunen

## substituir componente L
nova_originalLab_hyunen[,,,1] <- hist_hyunen_match_L

## converter a imagem melhorada para RGB
nova_originalRGB_hyunen <- LabtoRGB(nova_originalLab_hyunen)


## ========================= versão equalizada ======================== ##

versao_hyunen_equalizada <- equalImg(originalRGB_hyunen)


## ================= versão melhorada por deco Decorr ================= ##

versao_hyunen_decorr <- dc_stretch(originalRGB_hyunen)



## ====================== montar histograma ======================== ## 

#x <- seq(1, nrow(z), 1)
#y <- seq(1, ncol(z), 1)
#hyunen_histogram <- hist3D(histograma_original_hyunen = z, shade = .75)

## matriz com todos os componentes de imagem original 
matriz_original_hyunen <- matrix(c(originalRGB_hyunen),  
                                    nrow = 3*nrow(originalRGB_hyunen[,,,1]), 
                                    ncol = ncol(originalRGB_hyunen[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada
matriz_melhorada_hyunen <- matrix(c(nova_originalRGB_hyunen),
                                     nrow = 3*nrow(nova_originalRGB_hyunen[,,,1]), 
                                     ncol = ncol(originalRGB_hyunen[,,,1]), byrow = T)

## matriz com todos os componentes de imagem equalizada
matriz_equalizada_hyunen <- matrix(c(versao_hyunen_equalizada),
                                     nrow = 3*nrow(versao_hyunen_equalizada[,,,1]), 
                                     ncol = ncol(versao_hyunen_equalizada[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada por decorr
matriz_melhoradaDcorr_hyunen <- matrix(c(versao_hyunen_decorr),
                                     nrow = 3*nrow(versao_hyunen_decorr[,,,1]), 
                                     ncol = ncol(versao_hyunen_decorr[,,,1]), byrow = T)

bins <- hist(matriz_original_hyunen, breaks = "FD", plot = F)$breaks

p_original_hyunen <- hist(matriz_original_hyunen, breaks = bins)$density

q_melhorada_hyunen <- hist(matriz_melhorada_hyunen, breaks = bins)$density

q_equalizada_hyunen <- hist(matriz_equalizada_hyunen, breaks = bins)$density

q_melhoradaDcorr_hyunen <- hist(matriz_melhoradaDcorr_hyunen, breaks = bins)$density



## ================= visualizar imagem ============================= ##

## visualizar imagem Hyunen original
save.image(originalRGB_hyunen, "../Articles/image/hyunen_original.png")

## visualizar imagem Hyunen melhorada por matching histogram
save.image(nova_originalRGB_hyunen, "../Articles/image/hyunen_melhorada.png")

## visualizar imagem Hyunen equalizada
save.image(versao_hyunen_equalizada, "../Articles/image/hyunen_equalizada.png")

## visualizar imagem Hyunen melhorada por decorr
save.image(versao_hyunen_decorr, "../Articles/image/hyunen_decorr.png")


## =================== aplicar distancia de hellinger ============== ##

## distance entre original e melhorada por matching
CalcHellingerDist(p_original_hyunen, q_melhorada_hyunen)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_hyunen, q_equalizada_hyunen)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_hyunen, q_melhoradaDcorr_hyunen)


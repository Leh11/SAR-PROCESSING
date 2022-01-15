require(colordistance)
require(plot3D)
require(imager)
require(textmineR)
source("functs.R")
source("imagematrix.R")

## ========================= carregar imagem =========================== ##
originalRGB_krogager <- load.image("../report/Relatorio/Imagens/Krogager.png")

## ================= converter imagem original para Lab ================ ##
originalLab_krogager <- RGBtoLab(originalRGB_krogager)


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
L_krogager <- originalLab_krogager[,,,1]

#L_lena <- originalLab_lena[,,,1]


## ================ forçar histograma de original =============##
hist_krogager_match_L <- HistToEcdf(hist(L_I, breaks = "FD", plot = F),
                                 inverse = T)(equalize(L_krogager))



## ================ construir imagem melhorada por matching  ================ ##

## copia 
nova_originalLab_krogager <- originalLab_krogager

## substituir componente L
nova_originalLab_krogager[,,,1] <- hist_krogager_match_L

## converter a imagem melhora para RGB
nova_originalRGB_krogager <- LabtoRGB(nova_originalLab_krogager)


## ========================= versão equalizada ======================== ##

versao_krogager_equalizada <- equalImg(originalRGB_krogager)


## ================= versão melhorada por Decorr ================= ##

versao_krogager_decorr <- dc_stretch(originalRGB_krogager)



## ====================== montar histograma ======================== ## 

#x <- seq(1, nrow(z), 1)
#y <- seq(1, ncol(z), 1)
#krogager_histogram <- hist3D(histograma_original_krogager = z, shade = .75)

## matriz com todos os componentes de imagem original 
matriz_original_krogager <- matrix(c(originalRGB_krogager),  
                                    nrow = 3*nrow(originalRGB_krogager[,,,1]), 
                                    ncol = ncol(originalRGB_krogager[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada
matriz_melhorada_krogager <- matrix(c(nova_originalRGB_krogager),
                                     nrow = 3*nrow(nova_originalRGB_krogager[,,,1]), 
                                     ncol = ncol(originalRGB_krogager[,,,1]), byrow = T)

## matriz com todos os componentes de imagem equalizada
matriz_equalizada_krogager <- matrix(c(versao_krogager_equalizada),
                                      nrow = 3*nrow(versao_krogager_equalizada[,,,1]), 
                                      ncol = ncol(versao_krogager_equalizada[,,,1]), byrow = T)

## matriz com todos os componentes de imagem melhorada por decorr
matriz_melhoradaDcorr_krogager <- matrix(c(versao_krogager_decorr),
                                          nrow = 3*nrow(versao_krogager_decorr[,,,1]), 
                                          ncol = ncol(versao_krogager_decorr[,,,1]), byrow = T)


bins <- hist(matriz_original_krogager, breaks = "FD", plot = F)$breaks

p_original_krogager <- hist(matriz_original_krogager, breaks = bins)$density

q_melhorada_krogager <- hist(matriz_melhorada_krogager, breaks = bins)$density

q_equalizada_krogager <- hist(matriz_equalizada_krogager, breaks = bins)$density

q_melhoradaDcorr_krogager <- hist(matriz_melhoradaDcorr_krogager, breaks = bins)$density



## ================= visualizar imagem ============================= ##

## visualizar imagem krogager original
save.image(originalRGB_krogager, "../Articles/image/krogager_original.png")

## visualizar imagem krogager melhorada por matching histogram
save.image(nova_originalRGB_krogager, "../Articles/image/krogager_melhorada.png")

## visualizar imagem krogager equalizada
save.image(versao_krogager_equalizada, "../Articles/image/krogager_equalizada.png")

## visualizar imagem krogager melhorada por decorr
save.image(versao_krogager_decorr, "../Articles/image/krogager_decorr.png")


## =================== aplicar distancia de hellinger ============== ##

## distance entre original e melhorada por matching
CalcHellingerDist(p_original_krogager, q_melhorada_krogager)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_krogager, q_equalizada_krogager)


## distance entre original e melhorada por matching
CalcHellingerDist(p_original_krogager, q_melhoradaDcorr_krogager)


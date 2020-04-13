library(pracma)

kennaugh <- function(hhImg, hvImg, vvImg){
  
  rgbImg <- array(0, dim = c(l, c, 16))
  
  rgbImg[,,1] = (abs(hhImg + vvImg)/4) + (abs(hhImg - vvImg)/4) + abs(hvImg)
  rgbImg[,,2] = (abs(hhImg - vvImg)/2)
  rgbImg[,,3] = Re(t(hvImg) * (hhImg + vvImg))
  rgbImg[,,4] = Im(t(hvImg) * (hhImg - vvImg))
  rgbImg[,,5] = (abs(hhImg - vvImg)/2)
  rgbImg[,,6] = (abs(hhImg + vvImg)/4) + (abs(hhImg - vvImg)/4) - abs(hvImg)
  rgbImg[,,7] = Re(t(hvImg) * (hhImg - vvImg))
  rgbImg[,,8] = Im(t(hvImg) * (hhImg + vvImg))
  rgbImg[,,9] = Re(t(hvImg) * (hhImg + vvImg))
  rgbImg[,,10] = Re(t(hvImg) * (hhImg - vvImg))
  rgbImg[,,11] = (abs(hhImg + vvImg)/4) - (abs(hhImg - vvImg)/4) - abs(hvImg)
  rgbImg[,,12] = Im(hhImg * t(vvImg))
  rgbImg[,,13] = Im(t(hvImg) * (hhImg - vvImg))
  rgbImg[,,14] = Im(t(hvImg) * (hhImg + vvImg))
  rgbImg[,,15] = Im(hhImg * t(vvImg))
  rgbImg[,,16] = -(abs(hhImg + vvImg)/4) + (abs(hhImg - vvImg)/4) + abs(hvImg)
  
}

A0 = (1/4) * abs(imagem[,,1] + imagem[,,3])^2
B0 = (1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2
B = (1/4) * abs(imagem[,,1] - imagem[,,3])^2 - abs(imagem[,,2])^2
C = (1/2) * abs(imagem[,,1] - imagem[,,3])^2
D = Im(imagem[,,1] * t(Conj(imagem[,,3])))
E = Re(t(Conj(imagem[,,2])) * (imagem[,,1] - imagem[,,3]))
F = Im(t(Conj(imagem[,,2])) * (imagem[,,1] - imagem[,,3]))
G = Im(t(Conj(imagem[,,2])) * (imagem[,,1] + imagem[,,3]))
H = Re(t(Conj(imagem[,,2])) * (imagem[,,1] + imagem[,,3]))

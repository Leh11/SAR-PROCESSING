

hyunen <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- (((1/2) * Mod(imagem[,,1] - imagem[,,3])^2)^2 + (Im(imagem[,,1] * imagem[,,3]))^2) / (1/4) * Mod(imagem[,,1] + imagem[,,3])^2
  
  imagemRGB[,,2] <- (Im(imagem[,,2] * (imagem[,,1] + imagem[,,3])^2)^2 + (imagem[,,2] * Re(imagem[,,1] + imagem[,,3])^2)^2) / (1/4) * Mod(imagem[,,1] + imagem[,,3])^2
  
  imagemRGB[,,3] <- 2 * (1/4) * Mod(imagem[,,1] + imagem[,,3])^2
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
}
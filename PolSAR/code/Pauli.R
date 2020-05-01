

pauli <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- (imagem[,,1] - imagem[,,3]) / sqrt(2)
  
  imagemRGB[,,2] <- (2 * imagem[,,2]) / sqrt(2)
  
  imagemRGB[,,3] <- (imagem[,,1] + imagem[,,3]) / sqrt(2)
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
}
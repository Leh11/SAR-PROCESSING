

pauli <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- (imagem[,,1] + imagem[,,3])
  
  imagemRGB[,,2] <- (imagem[,,1] - imagem[,,3])
  
  imagemRGB[,,3] <- 2 * imagem[,,2]
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
}


krogager <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- sqrt(2 * ((((1/4) * Mod(imagem[,,1] - imagem[,,3])^2) + Mod(imagem[,,2])^2) - Mod(imagem[,,2])^2)) 
  
  imagemRGB[,,2] <- 2 * sqrt((((1/4) * Mod(imagem[,,1] - imagem[,,3])^2) + Mod(imagem[,,2])^2) - sqrt((((1/4) * Mod(imagem[,,1] - imagem[,,3])^2) + Mod(imagem[,,2])^2)^2 - (Mod(imagem[,,2])^2)^2))
  
  imagemRGB[,,3] <- sqrt(2 * (1/4) * Mod(imagem[,,1] + imagem[,,3])^2)
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
  
}
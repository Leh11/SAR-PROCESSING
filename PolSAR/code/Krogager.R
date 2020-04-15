

krogager <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- sqrt((((1/4) * abs(imagem[,,1] - imagem[,,3])^2) + abs(imagem[,,2])^2) - abs(Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))) 
  
  imagemRGB[,,2] <- sqrt((((1/4) * abs(imagem[,,1] - imagem[,,3])^2) + abs(imagem[,,2])^2) - abs(Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))) 
  sqrt((((1/4) * abs(imagem[,,1] - imagem[,,3])^2) + abs(imagem[,,2])^2) + abs(Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3]))))
  
  imagemRGB[,,3] <- sqrt(2 * (1/4) * (abs(imagem[,,1] + imagem[,,3])^2))
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
}


#krogager <- function(imagem){
  
# imagemRGB <- imagem
  
#  imagemRGB[,,1] <- ((sqrt(as.complex(-1))) * imagem[,,2]) + ((1/2) * (imagem[,,1] - imagem[,,3])) 
  
#  imagemRGB[,,2] <- (1/2) * (imagem[,,1] + imagem[,,3])

#  imagemRGB[,,3] <- ((sqrt(as.complex(-1))) * imagem[,,2]) - ((1/2) * (imagem[,,1] - imagem[,,3]))
  
#  imagemRGBeq <- equal(imagemRGB)
  
#  return(imagemRGBeq)
#}


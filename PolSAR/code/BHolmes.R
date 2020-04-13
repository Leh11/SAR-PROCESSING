
holmes <- function(imagem){
  
  imagemRGB <- imagem
  
  imagemRGB[,,1] <- (((1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2) + ((1/4) * abs(imagem[,,1] - imagem[,,3])^2 - abs(imagem[,,2])^2) - Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))^2
                    + (Re(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))^2 / (2*(((1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2) - (Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))))
    
  imagemRGB[,,2] <- (((1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2) - ((1/4) * abs(imagem[,,1] - imagem[,,3])^2 - abs(imagem[,,2])^2) - Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))^2
                    + (Re(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))^2 / (2*(((1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2) - (Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))))
  
  imagemRGB[,,3] <- ((((1/2) * abs(imagem[,,1] - imagem[,,3])^2) - Im(Conj(imagem[,,2]) * (imagem[,,1] + imagem[,,3])))^2 + (Re(Conj(imagem[,,2]) * (imagem[,,1] + imagem[,,3])) - Im(imagem[,,1] * Conj(imagem[,,3])))^2) / 
                    (2 * (((1/4) * abs(imagem[,,1] - imagem[,,3])^2 + abs(imagem[,,2])^2) - (Im(Conj(imagem[,,2]) * (imagem[,,1] - imagem[,,3])))))
  
  imagemRGBeq <- equal(imagemRGB)
  
  return(imagemRGBeq)
}




hellinger_distance <- function(p, q){
  return(sqrt(sum((sqrt(p) - sqrt(q))**2))/sqrt(2))
}

equalImg <- function(img){
  img[,,,1] <- ecdf(img[,,,1])(img[,,,1])
  img[,,,2] <- ecdf(img[,,,2])(img[,,,2])
  img[,,,3] <- ecdf(img[,,,3])(img[,,,3])
  return(img)
}

equal <- function(imgRGB){
  
  imgRGB[,,1] <- matrix(ecdf(imgRGB[,,1])(imgRGB[,,1]), nrow = nrow(imgRGB[,,1]), ncol = ncol(imgRGB[, , 1]))
  
  imgRGB[,,2] <- matrix(ecdf(imgRGB[,,2])(imgRGB[,,2]), nrow = nrow(imgRGB[,,2]), ncol = ncol(imgRGB[, , 2]))
  
  imgRGB[,,3] <- matrix(ecdf(imgRGB[,,3])(imgRGB[,,3]), nrow = nrow(imgRGB[,,3]), ncol = ncol(imgRGB[, , 3]))
  
  return(imgRGB)
}


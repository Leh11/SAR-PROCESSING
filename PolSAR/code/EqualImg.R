
equalImg <- function(img){
  obj_eq <- ecdf(img)(img)
  return(obj_eq)
}

equal <- function(imgRGB){
  
  imgRGB[, , 1] <- matrix(ecdf(imgRGB[, , 1])(imgRGB[, , 1]), nrow = nrow(imgRGB[, , 1]), ncol = ncol(imgRGB[, , 1]))
  
  imgRGB[, , 2] <- matrix(ecdf(imgRGB[, , 2])(imgRGB[, , 2]), nrow = nrow(imgRGB[, , 2]), ncol = ncol(imgRGB[, , 2]))
  
  imgRGB[, , 3] <- matrix(ecdf(imgRGB[, , 3])(imgRGB[, , 3]), nrow = nrow(imgRGB[, , 3]), ncol = ncol(imgRGB[, , 3]))
  
  return(imgRGB)

}

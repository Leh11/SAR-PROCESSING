

mediana <- function(imgRuido){
  imgRGB = imgRuido
  for (i in 2:(nrow(imgRuido))-1){
    for (j in 2:(ncol(imgRuido))-1){
      imgRGB[i, j, 1] = median(c(imgRuido[i, j-1, 1], imgRuido[i, j, 1], imgRuido[i, j+1, 1],
                         imgRuido[i-1, j-1, 1], imgRuido[i-1, j, 1], imgRuido[i-1, j+1, 1],
                         imgRuido[i+1, j-1, 1], imgRuido[i+1, j, 1], imgRuido[i+1, j+1, 1]))
      
      imgRGB[i, j, 2] = median(c(imgRuido[i, j-1, 2], imgRuido[i, j, 2], imgRuido[i, j+1, 2],
                         imgRuido[i-1, j-1, 2], imgRuido[i-1, j, 2], imgRuido[i-1, j+1, 2],
                         imgRuido[i+1, j-1, 2], imgRuido[i+1, j, 2], imgRuido[i+1, j+1, 2]))
      
      imgRGB[i, j, 3] = median(c(imgRuido[i, j-1, 3], imgRuido[i, j, 3], imgRuido[i, j+1, 3],
                         imgRuido[i-1, j-1, 3], imgRuido[i-1, j, 3], imgRuido[i-1, j+1, 3],
                         imgRuido[i+1, j-1, 3], imgRuido[i+1, j, 3], imgRuido[i+1, j+1, 3]))
    }
  }
  return(imgRGB)
}


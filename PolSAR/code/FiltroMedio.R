
media <- function(ImgRuido){
  ImgRGB <- ImgRuido
  for (i in 2:(nrow(ImgRuido)-1)){
    for (j in 2:(ncol(ImgRuido)-1)){
      ImgRGB[i, j, 1] <- (ImgRuido[i, j-1, 1] + ImgRuido[i, j, 1] + ImgRuido[i, j+1, 1]
                         + ImgRuido[i-1, j-1, 1] + ImgRuido[i-1, j, 1] + ImgRuido[i-1, j+1, 1]
                         + ImgRuido[i+1, j-1, 1] + ImgRuido[i+1, j, 1] + ImgRuido[i+1, j+1, 1]) / 9
      
      ImgRGB[i, j, 2] <- (ImgRuido[i, j-1, 2] + ImgRuido[i, j, 2] + ImgRuido[i, j+1, 2]
                         + ImgRuido[i-1, j-1, 2] + ImgRuido[i-1, j, 2] + ImgRuido[i-1, j+1, 2]
                         + ImgRuido[i+1, j-1, 2] + ImgRuido[i+1, j, 2] + ImgRuido[i+1, j+1, 2]) / 9
      
      ImgRGB[i, j, 3] <- (ImgRuido[i, j-1, 3] + ImgRuido[i, j, 3] + ImgRuido[i, j+1, 3]
                         + ImgRuido[i-1, j-1, 3] + ImgRuido[i-1, j, 3] + ImgRuido[i-1, j+1, 3]
                         + ImgRuido[i+1, j-1, 3] + ImgRuido[i+1, j, 3] + ImgRuido[i+1, j+1, 3]) / 9
      }
    }
  return(ImgRGB)
}

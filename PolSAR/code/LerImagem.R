
lerImagem <- function(ficheiroHH, ficheiroHV, ficheiroVV, lin, col){
  
  imgHH <- matrix(readBin(ficheiroHH, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
  
  imgHV <- matrix(readBin(ficheiroHV, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
  
  imgVV <- matrix(readBin(ficheiroVV, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
  
  imagemLida <- array(c(imgHH, imgHV, imgVV), dim = c(lin, col, 3)) 
}
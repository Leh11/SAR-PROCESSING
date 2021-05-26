require(plot3D)
require(colordistance)

# carregamento e tratamento da imagem original
def_readOrig <- function(){
  origImage <- loadImage("../image/ideal/pauli.png", 
                         CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                         lower = NULL, upper = NULL)
  
  lab_orig <- data.frame(origImage$filtered.lab.2d)
  rgb_orig <- data.frame(origImage$filtered.rgb.2d)
  
  names(rgb_orig) <- c("R", "G", "B")
  all_points <- cbind(lab_orig, rgb_orig)
  
  return(all_points)
}
# criacao de grade mesh usado como referencia
def_ref <- function(){
  
  dataMESH <- mesh(seq(from=0, to=1, length.out=50),
                   seq(from=0, to=1, length.out=50),
                   seq(from=0, to=1, length.out=50))
  
  rgb_ref <- data.frame(cbind(dataMESH$x, dataMESH$y, dataMESH$z))

    names(rgb_ref) <- c("R", "G", "B")
  
  lab_ref <- convertColorSpace(rgb_ref, from = "CIE RGB", 
                                 to = "Lab", from.ref.white = NULL,
                                 to.ref.white = "D65", sample.size = NULL)
  
  all_points_ref <- cbind(lab_ref, rgb_ref)
  
  return(all_points_ref)
}
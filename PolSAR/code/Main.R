library(png)

#determinar tempo de execução!

ptm <- proc.time()
    
    lin <- 6498
    col <- 3300
    
    ficheiroHH <- file("NISARA_190930_HH.mlc", "rb")
    
    ficheiroHV <- file("NISARA_190930_HV.mlc", "rb")
    
    ficheiroVV <- file("NISARA_190930_VV.mlc", "rb")
    
    
    lerImagem <- function(ficheiroHH, ficheiroHV, ficheiroVV){
      
      imgHH <- matrix(readBin(ficheiroHH, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
      
      imgHV <- matrix(readBin(ficheiroHV, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
      
      imgVV <- matrix(readBin(ficheiroVV, double(), n = (lin * col), size = 4, endian = "little"), nrow = lin, ncol = col, byrow = T)
      
      imagemLida <- array(c(imgHH, imgHV, imgVV), dim = c(lin, col, 3)) 
    }
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV)
    
    #imgPauli <- pauli(imagemLida)
    
    imgKrogager <- krogager(imagemLida)
    
    #imgHyunen <- hyunen(imagemLida)
    
    writePNG(imgKrogager, target = "/home/leh11/snap/R-Package/R-Pack/src/Dados/NISARA-2019-11-12/imgKrogagerNISARA.png")

proc.time() - ptm
    

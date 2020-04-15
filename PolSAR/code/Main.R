library(png)
library(raster)
library(rgdal)
library(pracma)

#ptm <- proc.time()
    lin <- 6954
    col <- 2475
    
    ficheiroHH <- file("SDelta_HH.mlc", "rb")
    
    ficheiroHV <- file("SDelta_HV.mlc", "rb")
    
    ficheiroVV <- file("SDelta_VV.mlc", "rb")
    
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)
    
    #filtrar <- media(imagemLida)
    
    #pauli <- pauli(imagemLida)
    
    #krogager <- krogager(imagemLida)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    #hyunen <- hyunen(imagemLida)
    
    #holmes <- holmes(imagemLida)
   
    writePNG(hyunen, target = "hyunen.png")
#proc.time() - ptm
    
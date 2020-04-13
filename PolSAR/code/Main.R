library(png)

#ptm <- proc.time()
    lin <- 7779
    col <- 3300
    
    ficheiroHH <- file("Rosamd_HH.mlc", "rb")
    
    ficheiroHV <- file("Rosamd_HV.mlc", "rb")
    
    ficheiroVV <- file("Rosamd_VV.mlc", "rb")
    
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)
    
    #filtrar <- media(imagemLida)
    
    #pauli <- pauli(imagemLida)
    
    #krogager <- krogager(imagemLida)
    
    hyunen <- hyunen(imagemLida)
    
    #holmes <- holmes(imagemLida)
    writePNG(hyunen, target = "hyunen.png")
#proc.time() - ptm
    
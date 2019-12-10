library(png)

ptm <- proc.time()
    
    lin <- 6451
    col <- 3300
    
    ficheiroHH <- file("NISARA_00914_HH.mlc", "rb")
    
    ficheiroHV <- file("NISARA_00914_HV.mlc", "rb")
    
    ficheiroVV <- file("NISARA_00914_VV.mlc", "rb")
    
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)
    
    #filtrar <- media(imagemLida)
    
    #imgPauli <- pauli(imagemLida)
    
    imgKrogager <- krogager(imagemLida)
    
    #imgHyunen <- hyunen(imagemLida)
    
    writePNG(imgKrogager, target = "/home/leh11/Desen/SAR-PROCESSING/PolSAR/image/imgKrogager.png")

proc.time() - ptm
    

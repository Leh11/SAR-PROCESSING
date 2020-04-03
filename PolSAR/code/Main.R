library(png)

ptm <- proc.time()
    lin <- 10819
    col <- 3162
    
    ficheiroHH <- file("GrMesa_HH.mlc", "rb")
    
    ficheiroHV <- file("GrMesa_HV.mlc", "rb")
    
    ficheiroVV <- file("GrMesa_VV.mlc", "rb")
    
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)
proc.time() - ptm
    
    #filtrar <- media(imagemLida)
    
    #pauli <- pauli(imagemLida)
    
    #krogager <- krogager(imagemLida)
    
    hyunen <- hyunen(imagemLida)
    
    #holmes <- holmes(imagemLida)
    writePNG(hyunen, target = "hyunen.png")
    
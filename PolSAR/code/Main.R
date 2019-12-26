library(png)

ptm <- proc.time()
    
    lin <- 10819
    col <- 3162
    
    ficheiroHH <- file("GrMesa_26108_HH.mlc", "rb")
    
    ficheiroHV <- file("GrMesa_26108_HV.mlc", "rb")
    
    ficheiroVV <- file("GrMesa_26108_VV.mlc", "rb")
    
    
    imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)
    
    
    #filtrar <- media(imagemLida)
    
    #pauli <- pauli(imagemLida)
    
    #krogager <- krogager(imagemLida)
    
    #hyunen <- hyunen(imagemLida)
    
    writePNG(hyunen, target = "hyunen.png")

proc.time() - ptm
    

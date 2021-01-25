require(png)
require(raster)
require(rgdal)
require(pracma)
require(magick)

lin <- 10812
col <- 3162

ficheiroHH <- file("GrMesa_HH.mlc", "rb")

ficheiroHV <- file("GrMesa_HV.mlc", "rb")

ficheiroVV <- file("GrMesa_VV.mlc", "rb")


imagemLida <- lerImagem(ficheiroHH, ficheiroHV, ficheiroVV, lin, col)

#filtrar <- media(imagemLida)

#pauli <- pauli(imagemLida)

#krogager <- krogager(imagemLida)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
#hyunen <- hyunen(imagemLida)

#holmes <- holmes(imagemLida)

#writePNG(holmes, target = "Hyunem.png")

originalMagick <- image_read("Original.png")

image_crop(originalMagick, geometry = "512x512+279+2193")
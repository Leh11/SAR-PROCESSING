require(ggplot2)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(statip)

## ==================================================================
## ==                         Hellinger                            ==
## ==         dependente de script Read & Histograma               ==
## ==================================================================

# =========================================================
# obter a imagem original pela funcao def_readOrig()
# definida no script Read.
allpoints_org <- def_readOrig()

# obter a imagem de refencia pela funcao def_ref() 
# definida no script Read.
allpoints_ref <- def_ref()

# =========================================================
# plotando  ggpairs do espaco Lab original 
#def_ggpairs(allpoints_org)

# plotando histograma sobreposto de original
def_curva(allpoints_org[,1:3])

# plotando ggpairs do espaco Lab da referencia
def_ggpairs(allpoints_ref)

# plotando histograma sobreposto da referencia
def_curva(allpoints_ref[,1:3])

# ===================================================================
# funcao que calcula a distancia de hellinger
hellinger_distance01 <- function(p, q){
  return(sqrt(sum((sqrt(p) - sqrt(q))**2))/sqrt(2))
}

# exemplo da distancia entre componentes L de original e referência!
p <- allpoints_org$L
q <- allpoints_ref$L

bins <- hist(p, breaks = "FD", plot = F)$breaks
hp <- hist(p, breaks = "FD", plot = F)$density
hq <- hist(q, breaks = bins, plot = F)$density

# chamada da funcao
hellinger_distance01(hp, hq)
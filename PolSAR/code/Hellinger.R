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
# defina no script Read.
allpoints_org <- def_readOrig()

# obter a imagem de refencia pela funcao def_ref() 
# defina no script Read.
allpoints_ref <- def_ref()

# ===================================================================
# plotando  ggpairs do espaco Lab original 
def_ggpairs(allpoints_org)

# plotando histograma sobreposto de original
def_curva(allpoints_org[,1:3])

# plotando ggpairs do espaco Lab da referencia
def_ggpairs(allpoints_ref)

# plotando histograma sobreposto da referencia
def_curva(allpoints_ref[,1:3])

# ===================================================================
# funcao computada usando a formula do wiki hellinger
hellinger_distance01 <- function(p, q){
  return(sqrt(sum((sqrt(p) - sqrt(q))**2))/sqrt(2))
}

# funcao hellinger do pacote statip para comparacao 
hellinger(p, q)

#c(allpoints_org$L, allpoints_org$a, allpoints_org$b)
#cut(p, breaks = nclass.FD(p))

hellinger_distance01(p, q)
hellinger(p, q)
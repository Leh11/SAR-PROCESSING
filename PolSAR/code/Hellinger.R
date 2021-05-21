require(ggplot2)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(statip)

source("./Read.R")
source("./Histograma.R")
source("./EqualImg.R")

## ==================================================================
## ==                         Hellinger                            ==
## ==         dependente de script Read & Histograma!              ==
## ==         Primeiro, rodar Read, Histogra & EqualImg            ==
## ==================================================================

# =========================================================
# obter a imagem original pela funcao def_readOrig()
# definida no script Read.allpoints_org <- def_readOrig()
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

# Obtendo os componentes L de original e referência!
# estou usando só a luminância como exemplo.
p <- allpoints_org$L
q <- allpoints_ref$L

# usando q como referência, linha seguinte captura bins de q
# e é usado para forcar o mesmo numero de bins em histo de p.
bins <- hist(q, breaks = "FD", plot = F)$breaks
hp <- hist(p, breaks = bins, plot = F)$density
hq <- hist(q, breaks = bins, plot = F)$density

# chamada da funcao para calcular hell_dist entre
hellinger_distance01(hp, hq)

#distancia de Original e original com histograma equalização

# linha 59 equaliza hp a partir da funcao definida no EqualImg
hp_equal <- equalImg(hp)

hellinger_distance01(hp, hp_equal)
# Obs: na linha 61, é calculda distancia de original e original 
#      equalizada. Deveria devolver entre [0, 1] contrário
#      do que ta acontecendo. 

#Uso de hist.matching

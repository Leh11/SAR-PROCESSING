require(ggplot2)
require(colordistance)
require(plot3D)
require(colorspace)
require(GGally)
require(ggthemes)
require(cowplot)
require(statip)

## esta funcao permite fazer a carregamento da imagem 
## a partir do diretório!
## a linha 12 e 13 que se encontram dentro da funcao servem para 
## pegar os canais Lab RGB mapeada pela funcao loadImage().
read_orig <- function(){
  origImage <- loadImage("../image/ideal/pauli.png", 
                         CIELab = TRUE, sample.size = NULL, ref.white = "D65",
                         lower = NULL, upper = NULL)
  #obtencao dos espacos Lab e RGB nas linhas 14 e 15
  lab_orig <- data.frame(origImage$filtered.lab.2d)
  rgb_orig <- data.frame(origImage$filtered.rgb.2d)
  
  names(rgb_orig) <- c("R", "G", "B")
  all_points <- cbind(lab_orig, rgb_orig)
  
  return(all_points)
}

## chamando read_orig() e atribuindo os dados de original 
## ao objeto allpoints_original.
allpoints_original <- read_orig()

## esta funcao cria um grade e faz a conversao para espaco Lab dessa 
## que servirá como referência. 
creat_grid <- function(){
  
  #cria grade no intervalo especificados!
  dataMESH <- mesh(seq(from=0, to=1, length.out=50),
                   seq(from=0, to=1, length.out=50),
                   seq(from=0, to=1, length.out=50))
  
  rgb_ref <- data.frame(cbind(dataMESH$x, dataMESH$y, dataMESH$z))
  
  names(rgb_ref) <- c("R", "G", "B")
  
  #converte para espaco Lab usando a referência da luz D65.
  lab_ref <- convertColorSpace(rgb_ref, from = "CIE RGB", 
                               to = "Lab", from.ref.white = NULL,
                               to.ref.white = "D65", sample.size = NULL)
  
  all_points_ref <- cbind(lab_ref, rgb_ref)
  
  return(all_points_ref)
}

## chamando a funcao creat_grid que cria grade.
## o objetos allpoints_reference contém dados de referência.
allpoints_reference <- creat_grid()

## funcao que calcula a distancia de hellinger
hellinger_distance01 <- function(p, q){
  return(sqrt(sum((sqrt(p) - sqrt(q))**2))/sqrt(2))
}

## funcao para equalizacao
equal_object <- function(object){
  return(ecdf(object)(object))
}

## ggpairs para plotar os pontos dos componentes desejados.
ggpairs(allpoints_reference, columns = 1:3,
               upper = list(continuous = wrap("density", size=0.3)),
               lower = list(continuous = wrap("points", size=0.0001, alpha=.3,
                                  col = rgb(allpoints_reference$R, allpoints_reference$G, allpoints_reference$B)), 
                            combo = wrap("dot")
               )
) + theme_pander()


## esse trecho plota histogramas sobreposto
ggplot(all_points) +
  geom_density(aes(L, fill = "L"), alpha = .3) +
  geom_density(aes(a, fill = "a"), alpha = .3) +
  geom_density(aes(b, fill = "b"), alpha = .3)


## Obtendo os componentes L de original e da referência!
## usando luminância apenas como exemplo.
p <- allpoints_original$L
q <- allpoints_reference$L


## usando q como referência, linha seguinte captura bins de q
## e é usado para forcar o mesmo numero de bins em histograma de p.
bins <- hist(q, breaks = "FD", plot = F)$breaks
hp <- hist(p, breaks = bins, plot = F)$density
hq <- hist(q, breaks = bins, plot = F)$density

## uso de da funcao hellinger
hellinger_distance01(hq, hp)

## aplicando equalizacao ao original
hp_eq = equal_object(p)
plot(hp_eq)

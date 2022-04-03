rm(list=ls())

help(set.seed)

# Set a seed for random numbers generation
set.seed(1010)


######### ESPERIMENTO MONTECARLO 1 ###################
#
### Genero una x dalla normale
## La mia x deve avere:
# 250 osservazioni,  media = 0 deviazione standard = 3
x <- rnorm(250, mean = 0, sd = 3)
#
### Genero una u dalla normale
## La mia u (termine di errore) deve avere:
# 250 osservazioni,  media = 0 deviazione standard = 6
u <- rnorm(250, mean = 0, sd = 6)
#
# Negli esperimenti montecarlo (come quello che stiamo per fare)
# vogliamo sempre controllare il signal-to-noise ratio
#
# Volendo avere un R² a circa 0.5 fisso in questo modo le deviazioni standard
#
x
u
y <- 3 + 2*x + u
mod1 <- lm(y ~ x)
summary(mod1)
#
######################################################


######### ESPERIMENTO MONTECARLO CON LOOP ###################
#
### Genero una x dalla normale
## La mia x deve avere:
# 250 osservazioni,  media = 0 deviazione standard = 3
x <- rnorm(250, mean = 0, sd = 3)
#
### Decido il numero di montecarlo samples (5000)
mc_samples <- 5000
### Genero una matrice di 5000 righe e 2 colonne 
strg <- matrix( , nrow = mc_samples, ncol = 2)
#
# Riempio la matrice con le normali u
for(i in 1:mc_samples) {
  ### Ad ogni iterazione genero una u dalla normale
  ## La mia u (termine di errore) deve avere:
  # 250 osservazioni,  media = 0 deviazione standard = 6
  u <- rnorm(250, mean = 0, sd = 6)
  y <- 3 + 2*x + u
  strg[i,] <- coefficients(lm(y ~ x))
}
#
# Stampo la media di ogni colonna
apply(strg, 2, mean)
#
######################################################


######## CALCOLARE INTERCETTA E COEFFICIENTE MANUALMENTE ##########
#
## Creiamo due distribuzioni uniformi y e x
y <- runif(5, 0,5)
y
x <- runif(5, 0,2)
x
#
## Applico la funzione lm a y su x
mod1 <- lm(y~x)
summary(mod1)
#
## Calcoliamo la covarianza tra x e y
covxy <- cov(x,y)
covxy
#
## Calcoliamo la varianza di x
vx <- var(x)
vx
#
## Calcoliamo B1^ (covarianza/varianza)
hb1 <- covxy/vx
hb1
#
## Calcoliamo B0^ (media di y - hb1 * media di x)
hb0 <- mean(y) - hb1 * mean(x)
hb0
#
##################################################################


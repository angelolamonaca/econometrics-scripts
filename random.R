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


############################### EXERCISES ###########################

##### DISTRIBUZIONE UNIFORME - MEDIA E DEVIAZIONE STANDARD #######
##### Uniform distribution - mean and standard deviation
#
## Genera 500 osservazioni di x (variabile esplicativa) da una distribuzione 
# uniforme con range [0-10].
# Start generating 500 observations on x - the explanatory variable - 
# from the uniform distribution with range [0-10].
x <- runif(500, 0,10)
#
## Quanto é la media di x?
# What is the sample mean?
mean(x)
# La media é circa: (A+B)/2 ovvero (10+0)/2
#
## Quanto é la deviazione standard di x?
# What is the sample standard deviation?
sd(x)
# La deviazione standard é circa: radice ( (A+B)² / 12 )
#
##################################################################


##### DISTRIBUZIONE NORMALE - MEDIA E DEVIAZIONE STANDARD ######
##### Normal distribution - mean and standard deviation
#
## Genera 500 errori, ui, dalla distrubuzione Normale(0.36).
# Randomly generate 500 errors, ui, from the Normal(0,36) distribution.
u <- rnorm(500, mean=0, sd=6) # sd la scegliamo facendo sd(x)²
#
## La media di u é esattamente 0?
# Is the sample average of the ui exactly 0?
mean(u)
# No, perché questa é una pseudo random generation, é impossibile generare un 
# vettore con esattamente media 0
#
## Quale é la deviazione standard di u?
# What is the sample standard deviation of the u?
sd(u)
# Dovremmo aspettarci una sd di 6, invece é leggermente diversa
#
################################################################


########## OLS - INTERCEPT, SLOPE - EXPLANATION ###############
# Now, generate the y as
# y = 1+2x + u
# that is, the population intercept is one and the population slope is two.
# Use the data to run the regression of y on x.
y <- 1 + 2*x + u
ols <- lm(y ~ x)
summary(ols)
#
# What are your estimates of the intercept and slope?
coefficients(ols)
#
# Are they equal to the population values in the above equation?
# I coefficienti non saranno mai uguali a 1 e 2 perché la proprietá di unbiasness 
# é una proprietá dello stimatore e non della stima
#
###############################################################


########### OLS Residuals ############
### Obtain the OLS residuals, u, and verify that they sum to zero (subject to rounding error)
sum(residuals(ols))
# 
# La somma dei residui di questo modello lineare é praticamente 0 
# (attenzione: quando si verifica l'errore e- vuol dire ZERO)
#
#####################################



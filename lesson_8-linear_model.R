rm(list=ls())

# Import package
library(wooldridge)

# Extract data from wooldridge
data("wage1")

# Dataset Documentation
help(wage1)

### LINEAR MODEL ###
help(lm)
# lm(formula, data)

### FORMULA ###
# variabile dipendente (y) ~ variabile indipendente/esplicativa (x)
# -1 alla fine della formula significa non mettere l'intercetta

mod1 <- lm(wage ~ educ, data = wage1)
# Regress wage on education

summary(mod1)
#########################################
#
# Residuals:
#   Min     1Q        Median    3Q      Max 
# -5.3396   -2.1501   -0.9674   1.1921  16.6085 
#
# Summary dei residui (u, i, a cappello)
#
#########################################
#
# Coefficients:
#             Estimate    Std. Error  t value   Pr(>|t|)    
# (Intercept) -0.90485    0.68497     -1.321    0.187    
# educ         0.54136    0.05325     10.167    <2e-16 ***
#
# Risultati delle stime dei coefficienti 
# Intercept = Beta zero cappello = -0.90485
# Coefficiente education = Beta uno cappello = 0.54136
#
#########################################
#
# Regessione : y^=a+bx
# y : valori osservati
# y^: valori teorici
# a: intercetta (quantitá di y quando x=0)
# b: coefficiente angolare (variazione in media di y all'aumento di un'unitá di x)
# x: variabile indipendente/esplicativa (x)
#
# L'intercetta é il punto dove incrocio l'asse delle Y
# Sull'asse Y misuriamo il salario
# Sull'asse X misuriamo gli anni di educazione
#
# Interpretare beta0 (l'intercetta)
# L'intercetta é il salario in caso di 0 anni di educazione 
# (valore di X in corrispondenza dell'asse Y)
#
# Interpretare beta1 (coefficiente educ)
# Per ogni anno di educazione in piú, 
# un individuo incrementa il suo salario orario di 0.54136


coefficients(mod1)
# Extract coefficients from lm

help(fitted)
what <- fitted(mod1)
# Extract fitted values (valori teorici)

help(residuals)
uhat <- residuals(mod1)
# Extract model residuals (residui)

comp <- cbind(wage1$wage, wage1$educ, what, uhat)
comp[1:5,]

#Essendoci bounding error, é zero come é giusto che sia la media o la somma dei residui
mean(uhat)
sum(uhat)

# La media dei valori teorici e la media dei valori osservati é uguale
mean(wage1$wage)
mean(what)

# La somma dei residui, ciascuno moltiplicato per valore della x, é zero
sum(wage1$educ * uhat)

# La covarianza tra i residui e i valori teorici deve essere 0
sum(what * uhat)

### R QUADRATO ###
#
# R²= SSE / SST
# R² = 1 - (SSR / SST)
# 0 <= R² <= 1
#
# Se R quadrato = 1, tutti i punti dello scatter 
# si trovano esattamente sulla retta di regressione
#
# Se R quadrato = 0, nessun punto dello scatter
# si trova sulla retta di regressione
#
# All'aumentare di R quadrato, i valori osservati 
# si avvicinano ai valori teorici
#
# Dire R² = 0.165 per esempio, significa dire che gli anni di educazione 
# spiegano circa il 16.5% della variazione del salario orario
#
##################


### CAMBIO PERCENTUALE ###
#
## In caso di log-level
#
# 100 * B1^ = percentuale di variazione del salario quando l'educazione varia di uno
#
##########################


### STANDARD ERRORS ###
#
# Coefficients:
#               Estimate    Std. Error    t value   Pr(>|t|)    
# (Intercept)   -0.90485    0.68497       -1.321    0.187    
# educ          0.54136     0.05325       10.167    <2e-16 ***
#
###
# Per B1^ lo standard error (0.05325) sará
# la radice quadrata della varianza dell'errore stimata attraverso i residui 
# diviso la SST di x
#
######################


### ERROR STANDARD DEVIATION ###
# 
# La deviazione standard dell'errore (sigma quadro) é 3.378
# Residual standard error: 3.378 on 524 degrees of freedom
#
# Calcolata con:
# radice quadrata(SSR/(n -2))
#
################################
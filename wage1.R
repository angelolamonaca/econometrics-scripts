rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("wage1")
help(wage1)
str(wage1)
# 
mod1 <- lm(wage ~ educ, data = wage1)
#
# Intercetta e coefficiente educ
coefficients(mod1)
#
# lwage = log(wage)
str(wage1)
#
#####################################


############ ESERCIZIO 1 ############
#
### Quanto é wage se educ = 10?
#
# Beta0^ + Beta1^ * 10
# Intercetta + coefficiente educ * 10
res <- coefficients(mod1)[1] + coefficients(mod1)[2] * 10
#
### Secondo questo modello un individuo con 10 anni di educ guadagna 4.51$/h
res
#
#####################################


############ ESERCIZIO 2 ############
#
### LOG-LEVEL
#
mod2 <- lm(lwage ~ educ, data = wage1)
summary(mod2)
#
## INTEPRETAZIONI
# Intercept: valore del logaritmo del wage quando educ = 0
#
# Coefficiente educ: in un modello log-level (log della dipendente e livello della esplicativa)
# B1 * 100 = variazione percentuale di Y dovuta ad una variazione di X
# Quindi ad ogni incremento dell educ di un anno, il salario cresce del 8.27%
#
###
res
#
#####################################



############ ESERCIZIO X ############
#
###
#
###
res
#
#####################################
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
###
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
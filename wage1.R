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

LOG-LEVEL
############ ESERCIZIO 2 ############
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

LOG-LEVEL
#### ESERCIZIO 3 - PARTIALLING OUT ####
#
### Using the 526 observations on workers in wage1, we include educ, exper, and tenure in an equation explaining log(wage).
### Confirm the partialling out interpretation of the OLS estimates by explicity doing the partialling out with respect to educ.
#
mod <- lm(lwage ~ educ + exper + tenure, data=wage1)
summary(mod)
#
# Per fare il partialling out devo fare una regressione di educ su tutte le altre variabili esplicative del modello (exper, tenure)
pmod <- lm(educ ~ exper + tenure, data=wage1)
# Prendere i residui di questo modello
uh <- residuals(pmod)
# Fare una regressione della variabile dipendente log(wage) su questi residui
res <- lm(lwage ~ uh, data=wage1)
summary(res)
# Otterró un coefficiente che é lo stesso coefficiente che otterrei da una regressione lineare multipla 
# dove log(wage) e le variabili indipendenti sono tutte e 3 nel modello
#
###
res
#
#######################################



############ ESERCIZIO X ############
#
###
#
###
res
#
#####################################

rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("wage2")
help(wage2)
str(wage2)
# 
#####################################


############################### EXERCISES ###########################

############### IQ score ###############
### Use the data in wage2 to estimate a simple regression explaining monthly
### salary (wage) in term of IQ score (IQ)
ols <- lm(wage ~ IQ, data=wage2)
summary(ols)
#
summary(wage2$IQ)
#
###### INTERPRETAZIONE #######
#
# L'intercetta ci dice che i soggetti con IQ pari a 0, guadagneranno 117$ mensili
# Informazione abbastanza irrilevante
#
# L'informazione rilevante invece é che ogni 10 punti di IQ in piú, il salario
# mensile aumenta di 83$
#
# Date le cifre del salario questo é un incremento abbastanza sostanziale
#
## Find the average salary and average IQ in the sample
mean(wage2$wage)
mean(wage2$IQ)
#
## What is the sample standard deviation of IQ score?
sd(wage2$IQ)
#
#
######## OLS where QI increase change wage by a CONSTANT amount ######
### CONSTANT quindi LEVEL-LEVEL
#
## Estimate a simple regression model where one-point increase in IQ changes wage by a constant dollar amount.
ols <- lm(wage ~ IQ, data=wage2)
summary(ols)
#
## Use this model to find the predicted increase in wage for an increase in IQ of 15 points.
coefficients(ols)[2] * 15
#
#
## Does IQ explain most of the variation in wage?
#
# Dobbiamo guardare R quadrato
summary(ols)
# In questo modello é 0.09554 ed é un valore bassissimo (0 <= R² <= 1)
# QI spiega neanche l'un percento della variabilitá di wage
#
#######################################

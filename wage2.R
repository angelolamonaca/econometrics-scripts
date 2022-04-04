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

LOG-LEVEL
########### INTERPRETAZIONE ##########
#
ols <- lm(lwage ~ educ, data = wage2)
summary(ols)
#
# Intercetta = a 5.97 sui modelli log-level é quello che ci interessa meno
# É molto interessante vedere l'effetto del coefficiente di educazione B1^, 
# perché ci dice che per ogni anno in piú id educazione il salario cresce di 5.9% (essendo log-level si fa * 100)
#
# R² é basso perché c'é un unica variabile esplicativa, anche se 0.097 non é poco
#
## Aggiungiamo IQ al modello
ols2 <- lm(lwage ~ educ + IQ, data = wage2)
summary(ols2)
#
# Intercetta non cambia molto
# Il coefficiente educazione si é abbassato e per ogni anno in piú di educazione, se tutte le altre variabili restano fisse (ceteris paribus), il salario aumenta del 4%
# Il coefficiente di IQ ci dice che all'aumentare di 10 punti IQ,  se tutte le altre variabili restano fisse (ceteris paribus), il salario aumenta del 5.8%
# R² é aumentato (di fatti non puó diminuire all'aumentare delle variabili nel modello, al piú resta uguale)
#
# IMPORTANTE: A paritá di variabili tra due soggetti (ceteris paribus)
# Abbiamo due soggetti A e B che hanno lo stesso IQ (55 per esempio)
# Se uno di loro ha studiato un anno piú dell'altro vuol dire che quell'individuo avrá il 3.9% in piú del salario rispetto all'altro
#
#
# Perché il coefficiente di educazione diminuisce quando si aggiunge IQ?
# Essendo IQ un coefficiente positivo, quando non lo stavamo considerando nel modello
# stavamo attribuendo il valore di IQ ad educ
#
# Calcoliamo la correlazione tra educ e IQ
cor(wage2$educ, wage2$IQ)
# La correlazione é positiva
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

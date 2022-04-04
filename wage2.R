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


############# EQUAZIONE DATA - GIVEN EQUATION #############
#
##### educ^ = 10.36 - .094sibs + .131meduc + .210feduc;   n = 722,    R² = .214
# where educ is years of schooling, sibs is number of siblings, meduc is mother's years of schooling, and feduc is father's years of schooling.
# dove educ sono gli anni di studio, sibs é il numero di fratelli/sorelle, meduc gli anni di studio della madre e feduc gli anni di studio del padre
#
### Does sibs have the expected effect? Explain.
# Se la famiglia non é particolarmente facoltosa, magari quando ci sono piú figli 
# si investe su quello piú capace, quindi avere fratelli e sorelle e mantenerli 
# tutti all'universitá con i vari costi diventa piú difficile. Quindi se sei figlio 
# unico sei avvantaggiato perché non hai questa competizione interna nella famiglia.
# Quindi il segno negativo in sibs é giustificato
#
#
### Holding meduc and feduc fixed, by how much does sibs have to increase to reduce 
### predicted years of education by one year? (A noninteger answer is acceptable here)
1/0.094
# Questo risultato sembra dire che, guardando questo campione, la variabile siblings non é il massimo per spiegare gli anni di educazione dell'individuo
#
#
### Discuss the interpretation of the coefficient on meduc
### Discuti l'interpretazione dle coefficiente della variabile meduc
# In base a questo campione, ogni 10 anni di incremento degli studi della madre, tenendo fisse le altre variabili (ceteris paribus), porta un incremento dell'educazione del figlio pari a 2 anni
#
#
#
##### Suppose that Man A has no siblings, and his mother and father each have 12 years of education, and Man B has no siblings, and his mother and father each have 16 years of education.
##### What is the predicted difference in years of education between B and A?
##### Supponiamo che l'individuo A non ha fratelli, ed i suoi genitori hanno entrambi 12 anni di educazione,
##### e che l'individuo B non ha fratelli e che i suoi genitori hanno ciascuno 16 anni di educazione.
##### Qual'é la differenza predetta in anni di educazione tra B e A?

## calcolare le educazioni predette dei due individui e fare la differenza
educA <- 10.36 - 0 + .131 * 12 + .210 * 12
educB <- 10.36 - 0 + .131 * 16 + .210 * 16
difference <- educB - educA
difference
#
############################################################ 

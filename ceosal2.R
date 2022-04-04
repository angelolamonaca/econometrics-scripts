rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI - DATA EXPLANATION ############
#
data("ceosal2")
help(ceosal2)
str(ceosal2)
# 
# Ci sono 177 CEOs e 15 variabili
# Il dataset contiene informazioni sui CEO di aziende americane
# La variabile salary é il compenso annuale espresso in migliaia di dollari
# La variabile ceoten sono gli anni in cui é stato CEO nella compagnia (ceo tenure)
#
####################################


############################### EXERCISES ###########################

########### MEDIA - AVERAGE ############ 
#
# Calcola la media dei salari annuali
# Find the average salary
mean(ceosal2$salary)
#
# Calcola la media delle anzianitá della carica di CEO
# Find the average tenure
mean(ceosal2$ceoten)
#
#######################################


##### QUANTI CEO SONO NEL LORO PRIMO ANNO DI CARICA (OVVERO, ceoten=0) ? #####
### How many CEOs are in their first year as CEO (that is, ceoten = 0) ?
#
# OPTION 1) using a TABLE and looking on the column "0"
table(ceosal2$ceoten)
#
# OPTION 2
length(which(ceosal2$ceoten == 0))
#
##############################################################################


########## QUAL'É L'ANZIANITÁ PIÚ LONGEVA IN CARICA DI CEO ? ##############
##### What is the longest tenure as CEO?
#
# OPTION 1) using a TABLE and looking on the last column header
table(ceosal2$ceoten)
#
# OPTION 2) read the Max property on the summary
summary(ceosal2$ceoten)
#
###########################################################################

LOG-LEVEL
##### STIMA IL MODELLO DI REGRESSIONE SEMPLICE E RIPORTA I RISULTATI ######
#### Estimate the simple regression model and report your results
### log(salary) = B0 + B1 ceoten + u
#
# Abbiamo un modello log-level, quindi prima di tutto vediamo 
# se nel dataset abbiamo giá un logsalary (lsalary)
names(ceosal2)
#
# C'é la variabile lsalary, quindi non é necessario calcolarlo
#
ols2 <- lm(lsalary ~ ceoten, data=ceosal2)
summary(ols2)
# 
# Essendo un modello log-level dobbiamo moltiplicare il coefficiente per 100 e
# questo ci dirá la variazione del salario in percentuale, all'aumentare dell'anzianitá di un anno
#
# Per ogni anno in piú come CEO il salario aumenta dello 0.97%
# É un aumento abbastanza basso visto che in genere dovrebbe essere circa 3/4%
# É un aumento che non copre nemmeno l'inflazione
#
###########################################################################


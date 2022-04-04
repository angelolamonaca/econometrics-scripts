rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI - DATA EXPLANATION ############
#
data("sleep75")
help(sleep75)
str(sleep75)
# 
# Ci sono 706 individui e 34 variabili
# Il dataset contiene informazioni su anni di educazione, ore di sonno e lavoro dei singoli individui
# La variabile educ rappresenta gli anni di studio
# La variabile age rappresenta l'etá dell'individuo in anni
# La variabile totwrk rappresenta i minuti per settimana di lavoro
# La variabile sleep rappresenta i minuti per settimana di sonno notturno
#
####################################


##### Using the data in sleep75, the estimated equation is
#
# sleep^ = 3683.25 - .148totwrk + 11.13educ + 2.20age
# where n = 706 and R² = .113
#
# Essendo R² = 0.113 possiamo dire che avendo queste variabili possiamo spiegare solo il 10% della variazione della variabile dipendente (sleep)
# Evidentemente qui ci sono delle variabili che andrebbero incluse nel modello ma che stiamo omettendo
#
### Quali potrebbero essere altre variabili che hanno un'influenza sul sonno notturno?
# Avere bambini piccoli in famiglia, indicazioni su problemi di salute, se l'individuo é self-employed, le ore di ozio giornaliere
#
#
### If someone works five more hours per week, by how many minutes is sleep predicted to fall? 
### Is this a large trade-off?
### Se un individuo lavora 5 ore a settimana, di quanti minuti in meno quell'individuo dormirá?
### É un cambio grande?
# Bisogna moltiplicare il coefficiente totwrk per 5*60 (minuti presenti in 5 ore ovvero 300)
-.148 * (5 * 60)
# L'individuo che lavora 5 ore a settimana dormirá 44 minuti in meno
#
# Per capire se il cambio é considerevole bisogna vedere il range nel campione di queste variabili
summary(sleep75$sleep)
# Il range di sleep é [755 - 4695]
summary(sleep75$totwrk)
# Il range di totwrk é [0 - 6415]
# Secondo il trade-off é regolare, ovvero non sorprendente ma nemmeno irrisorio
#
#
### Discuss the sign and magnitude of the estimated coefficient on educ.
### Discutere il segno e la grandezza del coefficiente stimato educ.
# Questo é un modello level-level quindi un anno in piú di educazione porta a dormire 11 minuti in piú a settimana di notte, tenendo fisse le altre variabili (ceteris paribus)
#
#
### Would you say totwrk, educ, and age explain much of the variation in sleep?
# R² é 0.113 quindi queste variabili spiegano poco la variazione di Y (sleep)
#
###############################################

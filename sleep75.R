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

###########################################
#### The following model is a semplified version of the multiple regression model 
### used by Biddle and Hamermesh (1990) to study the trade-off between time spent 
### sleeping and working and look at other factors affecting sleep:
#### Il modello seguente é una versione semplificata del modello di regressione multipla 
### usata in un paper nel 1990, questo paper studia il trade-off tra il tempo passato 
### a dormire ed il tempo passato a lavorare, ed introduce altri fattori che possono 
### influenzare le ore di sonno
#
# sleep = B0 + B1 totwrk + B2educ + B3age +u
#
# sleep: minuti di sonno alla settimana
# totwrk: minuti di lavoro alla settimana
# educ and age: misurati in anni
#

#### If adults trade off sleep for work, what is the sign of B1?
#### Se gli individui cambiano le ore di sonno con quelle di lavoro, come é il segno di B1?
# Negativo, perché se lavorano di piú, dormono di meno.
#
#
#### What signs do you think B2 and B3 will have?
#### Quali sono i segni di B2 e B3 secondo te?
# B2: educ, ci sono piú ragionamenti possibili:
# 1) Piú sei educato, piú sei quindi documentato e tieni conto dell'importanza del sonno (segno positivo perché al crescere del coefficiente, cresce Y)
# 2) Piú sei educato, piú avrai un lavoro prestigioso che ti consente di dormire di piú (segno positivo perché al crescere del coefficiente, cresce Y)
# 3) Piú sei educato, piú il tuo lavoro ti porterá stress e responsabilitá che diminuiranno le tue ore di sonno (segno negativo perché al decrescere del coefficiente, cresce Y)
#
# B3: age
# Di solito in etá piú anziana si tende a dormire meno, quindi mi aspetto un segno negativo perché al decrescere dell'etá aumenta il tempo del sonno
# É anche vero peró che in etá giovane si tende a dormire meno per via degli studi, o delle prime esperienze lavorative che richiedono uno sforzo maggiore
# Quindi, si puó dire che é un effetto non lineare
#
#########################################



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



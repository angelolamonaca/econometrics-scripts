rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("vote1")
help(vote1)
str(vote1)
#
# 173 congressi americani
# Nelle elezioni ci sono due candidati, A e B
# VoteA = la percentuale di voti che l'individuo ha preso in quel distretto
# ShareA = la percentuale di denaro che A ha impegnato nella campagna elettorale in quel distretto ( spesaA / (spesaA + spesaB) 
#
# es.Nel distretto 7 nello stato dell'alabama (AL) il candidato presidenziale 
# ha speso il 97% del totale
#
summary(vote1$shareA)
#
mod1 <- lm(voteA ~ shareA, data = vote1)
#
summary(mod1)
#
# L'intercetta (Beta0 cappello) é la percentuale di voti presi con investimento pari a 0
# Beta1 cappello = all'aumentare dell'1% di shareA, voteA incrementa del 0.46% 
#
# per es. all'aumentare del 10% di di shareA, voteA incrementa del 4.6%
#
#####################################


############ ESERCIZIO 1 ############
#
### Quanto é voteA se shareA = 50%?
#
# Beta0^ + 50 * Beta1^
res <- coefficients(mod1)[1] + coefficients(mod1)[2] * 50
#
### Se lo shareA é 50, voteA é 50%
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
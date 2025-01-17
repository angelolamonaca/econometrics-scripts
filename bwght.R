rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI - DATA EXPLANATION ############
#
data("bwght")
help(bwght)
str(bwght)
# 
# Ci sono 1388 individui (neonati) e 14 variabili
# Il dataset contiene informazioni su reddito famigliare (faminc), consumo di sigarette (cigs), e peso del bambino alla nascita (bwght)
#
# Il peso del bambino � in oncie (oz)
# Il numero di sigarette non � in pacchetti ma � in numero di sigarette
#
####################################



####### A problem of interest to health officials (and others) is to determine the effects of smoking during pregnancy on infant health.
# One measure of infant health is birth weight; a birth weight that is too low can plclust(an infant at risk for contracting various illnesses.
# Since factors other than cigarette smoking that affect birth weight are likely to be correlated with smoking, we should take those factors into account.
# For example, heigher income generally results in access to better prenatal care, as well as better
# nutrition for the mother.
# An equation that recognizes this is
#
# bwght = B0 + B1cigs + B2faminc + u
#
# Qui il peso del nascituro � un parametro per misurare la salute del bambino
# Alcuni aspetti da considerare sono il consumo di sigarette della madre durante la gravidanza (cigs) e il reddito famigliare (faminc)
#
#
#### What is the most likely sign for B1 and B2?
# Il segno pi� probabile per B1 � negativo perch� l'incremento del consumo di sigarette dovrebbe comportare uno stato di salute peggiore e quindi un peso del bambino minore
# Il segno pi� probabile per B2 � positivo perch� con l'incremento del reddito ci si aspetta un miglior stato di salute del nascituro e quindi un peso maggiore
#
#
#### Do you think cigs and faminc are likely to be correlated?
#### Explain why the correlation might be positive or negative
### Pensi che il consumo di sigarette ed il reddito famigliare siano correlate?
### Spiega perch� la correlazione potrebbe essere positiva o negativa
# La correlazione potrebbe essere positiva se supponiamo che un reddito famigliare elevato consente una maggiore facilit� nell'acquisto delel sigarette
# Allo stesso tempo per� se potrebeb essere negativa se supponiamo che un reddito famigliare pi� elevato sia a sua volta correlato ad una maggiore educazione nella famiglia, 
# ed una maggiore educazione della famiglia potrebbe portare ad un decremento del consumo di sigarette, per via della maggior consapevolezza dei rischi connessi al fumo durante la gravidanza.
#
#
#### Now, estimate the equation with and without faminc, using data in bwght.
#### Report the results in equation form, including the sample size and R-squared.
#### Discuss your results, focusing on whether adding faminc substantially changes the estimated effect of cigs on bwght.
mod1 <- lm(bwght ~ cigs, data=bwght)
summary(mod1)
# Il peso quando la donna non fuma � 119oz
# Per ogni sigaretta addizionale che la donna fuma in gravidanza, il peso diminuisce di quasi mezza oncia (0.5oz)
#
#### Qual'� l'effetto della variabile faminc sul peso del nascituro?
# Positivo
#
#### Il B1~ che abbiamo appena stimato (includendo faminc) ci aspettiamo che sia maggiore o minore del B1^?
# Essendo il coefficiente negativo, il B1~ mi aspetto che sia maggiore perch� l'influenza di faminc su Y era inclusa in B1^ 
# Ovviamente se il coefficiente fosse stato positivo, mi sarei aspettato un B1~ minore, per lo stesso motivo, ovvero perch� aggiungendo la variabile andiamo a scorporare da B1 l'influenza su Y che gli avevamo assegnato
#
#
mod2 <- lm(bwght ~ cigs + faminc, data=bwght)
summary(mod2)
#
# 
#
#
###########################
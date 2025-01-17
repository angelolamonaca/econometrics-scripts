rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI - DATA EXAMINATION ############
#
data("k401k")
help(k401k)
str(k401k)
# 
# Un piano 401k � un conto pensione sponsorizzato dal datore di lavoro. 
# Consente a un dipendente di dedicare una percentuale del proprio stipendio 
# ante imposte a un conto pensione.
#
# Nel dataset k401k ci sono 1534 imprese
# La variabile prate � la percentuale di lavoratori all'interno dell'azienda
# che sono idonei alla pensione ed hanno un piano attivo
#
# mrate � la misurazione della generosit� del piano 
# ovvero � l'ammontare medio di contribuzione da parte dell'azienda
# al piano di ogni lavoratore, per ogni dollaro di contributo del lavoratore
#
##########################################



############################### EXERCISES ###########################

########### MEDIA - AVERAGE ############ 
#
# Calcola la media delle percentuali di partecipazione al piano
# Find the average partecipation rate
mean(k401k$prate)
#
# Calcola la media delle generosit� (contribuzione da parte dell'impresa)
# Find the average match rate
mean(k401k$mrate)
#
#######################################

LEVEL-LEVEL
#### INTERPRETAZIONE - INTERPRETATION #####
#
# Stimare l'equazione di regressione semplice e riportare i risultati includendo
# la dimensione del campione ed R quadrato
# Estimate the simple regression equation and report the results along
# with sample size and R-squared
#
# prate^ = B0^ + B1^ * mrate
#
ols <- lm(prate ~ mrate, data=k401k)
summary(ols)
#
# L'intercetta per questo modello � 83.0755 ed il coefficiente mrate � 5.8611
#
## Interpretazione intercetta
# L'intercetta � il valore della variabile dipendente quando la variabile esplicativa � 0
# Quindi quando la misura della generosit� � pari a 0
# la percentuale dei lavoratori idonei con un piano attivo � del 83.1%
# 
## Interpretazione coefficiente mrate
# All'aumentare di 1 del mrate, la percentuale di prate aumenta del 5.86%
#
## Dimensione del campione
length(k401k$prate)
#
## R quadrato = 0.0747
#
#############################################


####### CALCOLA prate DATA UNA CERTA mrate (� prevedibile?) #########
#### Find the predicted prate when mrate = 3.5. Is this a reasonable prediction?
#
## Trova il valore predetto di prate quando mrate = 3.5
#
hb0 <- coefficients(ols)[1]
hb1 <- coefficients(ols)[2]
res <- hb0 + hb1 * 3.5
res
# Quando mrate � 3.5, prate � predetto 103.5892
#
# � ragionabile come predizione?
# No, perch� una percentuale del 103% � assurda
#
# Questa variabile � cos� alta perch� stiamo escludendo dal modello tanti 
# altri fattori importanti che possono influenzare le decisioni dei lavoratori
#
######################################################################


####### CALCOLA QUANTO LA VARIAZIONE DI prate � SPIEGATA DA mrate (molto?) #######
### How much of the variation in prate is explained by mrate? Is a lot?
#
# Dobbiamo guardare R quadrato
summary(ols)
# In questo modello � 0.0747 ed � un valore bassissimo (0 <= R� <= 1)
# mrate spiega neanche l'un percento della variabilit� di prate
#
##################################################################################


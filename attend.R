rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("attend")
help(attend)
str(attend)
# 
# Il dataset rappresenta le presenze in classe di un corso universitario
# Ci sono 680 osservazioni su 11 variabili
#
# Il numero di studenti osservati é 680
# attend é il numero di classi (su 32) a cui lo studente ha partecipato
# missed é il numero di classi che lo studente ha saltato
# final é il voto nell'esame finale
#
#####################################

LEVEL-LEVEL
############# INTERPRETAZIONE #############
#
# Tracciamo il modello lineare per il voto sulle assenze
ols <- lm(final ~ missed, data=attend)
summary(ols)
#
# Se lo studente non ha mai mancato nessuna lezione, il voto sará 26.59
# Per ogni lezione saltata, abbiamo un decremento di 0.12 nella valutazione finale
# Quindi per ogni 10 lezioni saltate, il voto finale scende di 1
#
#
# R² é bassissimo, quindi le assenze (missed) non spiegano il voto finale (final)
#
# Quindi aggiungiamo priGPA (prior GPA) ovvero la valutazione dello studente all'inizio del semestre
ols2 <- lm(final ~missed + priGPA, data = attend)
summary(ols2)
#
# Vediamo che R² é aumentato di molto, quindi priGPA insieme a missed spiega abbastanza final
# L'intercetta é 17.41 quindi uno studente con 0 lezioni mancate e priGPA 0, il voto finale é 17
#
# Per ogni incremento di missed, tenendo fisso il prior GPA, il final aumenta di 0.017
# Per ogni incremento di priGPA, tenendo fisso il missed, il final aumenta di 3.23
#
#
# Che tipo di correlazione c'é tra missed e priGPA?
# Correlazione negativa, perché all'aumentare del prior gpa si tende a saltare meno lezioni (opinione personale)
#
#########################################



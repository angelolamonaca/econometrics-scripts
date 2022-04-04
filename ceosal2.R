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


LOG-LOG
########### CONSTANT ELASTICITRY VARIETY FOR BOTH independent variable #####
#### Estimate a model relating annual salary to firm sales and market avlue.
#### Make the model of the constant elasticity variety for both independent variables.
#### Write the results out in equation form.
### Stima un modello che mette in relazione il salario annuale con le vendite e la variabile market value.
### Vista la richiesta della varietá elastica costante, dovremo utilizzare un modello log-log
#
# Nel nostro dataset abbiamo giá tutti i logaritmi delle variabili che ci servono
mod <- lm(lsalary ~ lsales + lmktval, data = ceosal2)
summary(mod)
#
#### Interpretazione
# Sappiamo che é un modello LOG-LOG-LOG quindi l'interpretazione dei Beta ceteris paribus é la seguente:
# Il Beta misura la variazione percentuale della Y dovuta ad una variazione percentuale della X
# 
# Coefficients:
#                 Estimate   
# (Intercept)     4.62092    
#   lsales        0.16213    
#   lmktval       0.10671     
#
# Ceteris paribus, tenendo le altre variabili fisse, l'aumento dell'1% delle vendite, comporta l'aumento del salario del CEO del 0.16%
# Ceteris paribus, tenendo le altre variabili fisse, l'aumento dell'1% del market value, comporta l'aumento del salario del CEO del 0.11%
#
#
#### Quanta variabilitá riusciamo a spiegare della Y?
# R² ovvero 0.3, le variabili considerate, nonostante siano poche, spiegano in modo abbastanza soddisfaciente la Y
#
#
### Matrice di varianza e covarianza dei Beta stimati
#
# 1) Prendiamo i residui
u <- residuals(mod)
# 2) Calcoliamo sigma² (stimatore della varianza dell'errore)
# crossprod(residui)/degrees_of_freedom
s2 <- crossprod(u)/(174)
s2
# 3) Generiamo la x
x <- cbind(1, ceosal2$lsales, ceosal2$lmktval)
head(x)
# 4) Calcoliamo x primo x
xpx <- crossprod(x)
# 5) Facciamo l'inverso
xpxi <- solve(xpx)
xpxi
# 6) Calcoliamo la matrice di varianza e covarianza 
vcbetas <- as.numeric(s2) * xpxi
# usiamo as.numeric per convertire la matrice 1x1 in un numero
vcbetas
#
# vcbetas[1,1] : varianza dell'intercetta
vintercept <- vcbetas[1,1]
vintercept
#
# vcbetas[2,2] : varianza del beta 1 (coefficiente dei log sales)
vb1 <- vcbetas[2,2]
vb1
# vcbetas[2,3] : covarianza tra lsales e lmkval
cb2b3 <- vcbetas[2,3]
cb2b3
# 7) Calcoliamo gli standard errors
serrors <- sqrt(diag(vcbetas))
# Questi valori sono quelli che troviamo nel summary del modello
#
#
### Un modo rapido per estrarre la matrice di varianza e covarianza é l'utilizzo della funzione vcov
vcbetas2 <- vcov(mod)
vcbetas2
#
#
########## ADD VARIABLE TO THE MODEL IN LOGARITHMIC FORM ##################
### Add profits to the previous model. 
mod2 <- lm(lsalary ~ lsales + lmktval + profits, data=ceosal2)
summary(mod2)
#
#
### Why can this variable not be included in logarithmic form?
# Se una variabile ha valori negativi non si puó prendere il logaritmo
summary(ceosal2$profits)
# profits ha il minimo di -463, negativo! Quindi non possiamo prendere il logaritmo della variabile profits e non avrebbe senso prenderlo
#
#
### Would you say that these firm performance variables explain most of the variation in CEO salaries?
# il coefficiente di profits é 3.566e-05 che sarebbe 0.00003566, praticamente 0
# Quindi non spiega la variazione del salario
#
# il coefficiente di lsales é 1.614e-01, ovvero 0.1614 e rimane quasi invariato rispetto alla short form
# il coefficiente lmktval é 9.753e-02, ovvero 0.09753 e diminuisce anch'esso di pochissimo
# possiamo spiegare questa diminuizione per via del fatto che abbiamo introdotto una variabile il cui effetto é positivo
# perché entrambe (lsales e lmktval) stavano prendendo una parte del profitto, prima di inserire quest'ultima nel modello
#
#
######## ADD VARIABLE - ESTIMATED PERCENTAGE RETURN ######################
#### Add the variable ceoten to the model.
#### What is the estimated percentage return for another year of CEO tenure, holding other factors fixed?
#
mod3 <- lm(lsalary ~ lsales + lmktval + profits + ceoten, data=ceosal2)
summary(mod3)
#
# coefficiente di ceoten = 1.168e-02 ovvero 0.01168
# LOG-LEVEL! quindi nell'interpretazione dobbiamo moltiplicare * 100
#
# Ceteris paribus, cioé tenendo tutte le altre variabili fisse, l'effetto di ceo tenure
# sul salario del CEO é:
# all'aumentare di un anno del CEO tenure, il salario aumenta del 1.16%
#
# L'incremento é basso, non copre nemmeno l'inflazione
#
#
#
################# SAMPLE CORRELATION COEFFICIENT ##############
#### Find the sample correlation coefficient between the variables log (mktval) and profits.
### Dobbiamo calcolare la correlazione tra lmktval e profits
cor(ceosal2$lmktval, ceosal2$profits)
#
#### Are these variables highly correlated?
# La correlazione é di 0.78, é altissima.
#
#### What does this say about the OLS estimators?
# Un aspetto é che, se sono altamente correlate ma non perfettamente, aiuta a spiegare la variabilitá della Y.
# Un alta correlazione tra i regressori puó portare ad una varianza che é piú alta
#
###########################################################################



rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("ceosal1")
help(ceosal1)
str(ceosal1)
# 
# Ci sono 209 CEOs e 12 variabili
#
# ROE : percentuale di redditivitá del capitale dell'azienda
# ROE = ( Reddito netto di esercizio / mezzi propri ) * 100
#
summary(ceosal1)
#
# Display summary of salary and roe
summary(ceosal1[,c(1,4)])
#
mod1 <- lm(salary ~ roe, data = ceosal1)
summary(mod1)
#
#####################################


############ ESERCIZIO 1 ############
#
### Trasformare roe percentuale in decimale
#
roedec <- ceosal1$roe/100
str(roedec)
mod2 <- lm(salary ~ roedec, data = ceosal1)
summary(mod2)
###
res
#
#####################################


############ ESERCIZIO 2 ############
#
### Trasformare salary from thousands of dollars to dollars)
salaryusd <- ceosal1$salary * 1000
#
mod2 <- lm(salaryusd ~ roe, data = ceosal1)
summary(mod2)
###
res
#
#####################################


############ ESERCIZIO 3 ############
#
### LOG-LOG 
## Interpretare log(salary) e log(sales)
#
# Variazione percentuale del salario rispetto 
# alla variazione percentuale delle vendite
#
mod3 <- lm(lsalary ~ lsales, data = ceosal1)
res <- summary(mod3)
#
### Se le vendite aumentano dell'1%, il salario del CEO aumenta del 0.25%
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
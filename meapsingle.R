rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("meapsingle")
help(meapsingle)
str(meapsingle)
#  
# Ci sono 229 scuole and 18 variables
#
# pctsgle: la percentuale di famiglie composte da un solo genitore
# free: percentuale degli studenti poveri
#
#####################################


LEVEL-LEVEL
############ ESERCIZIO 1 ############
#
### Use the data in meapsingle to study the effects of single-parent households
### on student math performance.
### These data are for a subset of schools in southeast Michigan for the year 2000.
### The socioeconomic variables are obtained at the ZIP code level (where ZIP code is asigned to schools based on their mailing addresses).
#
# Le variabili socioeconomiche sono prese in base al ZIP code e non individualmente sullo studente
#
### Run the simple regression of math4 on pctsgle and report the results in the usual format.
#
mod <- lm(math4 ~ pctsgle, data=meapsingle)
summary(mod)
#
### Interpret the slope coefficient. 
#
# Per una corretta interpretazione del coefficiente, é utile esaminare il range di math4 e pctsgle
summary(meapsingle$math4)
# Il range di math4 é [18-100]
summary(meapsingle$pctsgle)
# Il range di pctsgle é [5-56] 
#
# L'interpretazione del coefficiente pctsgle é la seguente:
# Per ogni valore percentuale aggiunto al pctsgle, il valore math4 diminuisce di 0.83288 punti
#
### Does the effect of single parenthood seem large or small?
# L'effetto del genitore single sul punteggio in matematica non é sorprendentemente grande ma nemmeno irrisorio
#
### Per ottenere una diminuizione di math4 di 10 punti, di quanto deve variare pctsgle?
10/-0.83288
# pctsgle deve aumentare di circa il 12%
#
################# LEVEL-LOG / ADD log as variable ####################
### Add the variables lmedinc and free to the equation.
mod1 <- lm(math4 ~ pctsgle + lmedinc + free, data=meapsingle)
summary(mod1)
#
### What happens to the coefficient on pctsgle?
### Explain what is happening.
# Adesso per ogni punto percentuale aggiungo ad pctsgle, il valore di math4 scende di 0.19, in ceteris paribus
# Il decremento in questo modello é minore, perché il decremento che avevamo nel modello precedente comprendeva gli effetti della variabile free
#
#
### Find the variation inflation factors (VIFs) for each of the explanatory variables appearing in the regression.
# Il VIF é 1 / (1-R²j) dove j é una regressione di una xj su tutte le altre
#
### Which variable has the largest VIF?
### Does this knowledge affect the model you would use to study the casual effect on single parenthood on math performance?
#
#
#
#####################################

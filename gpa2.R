rm(list=ls())

# Import package
library(wooldridge)

############ SPIEGAZIONE DATI ############
#
data("gpa2")
help(gpa2)
str(gpa2)
#
# Il GPA é su una scala di 4 punti
# hsperc percentile dello studente a fine highschool (se é uguale a 5, era nel top 5% della classe. quindi piú aumenta e piú la performance é peggiore)
# sat é un risultato che combina due achievement test su matematica e lingue
#
#########################################



############################### EXERCISES ###########################

######## COEFFICIENTE NEGATIVO - NEGATIVE COEFFICIENT #####
####
# colgpa^ = 1392 - .0135hsperc + .00148sat;  n=4137,   R²= .273
#
#
#### Perché il coefficiente di hsperc é negativo e spiega se ha senso
#### Why does it make sense for the coefficient to hsperc to be negative?
# É giustificato il coefficiente negativo perché il colgpa aumenta al decrescere del hsperc
# 
#
#### Qual'é il college GPA predetto quando hsperc = 20 e sat = 1050?
#### What is the predicted college GPA when hsperc = 20 and sat = 1050?
# Bisogna semplicemente sostituire all'equazione i valori
colgpa <- 1.392 - .0135 * 20 + .00148 * 1050
colgpa
#
#
#### Suppose that two high school graduates, A and B, gratuated in the same percentile from high school, but student A' sat score was 140 points higher (about one standard deviation in the sample).
#### What is the predicted difference in college GPA for these two students? 
#### Supponiamo che due ragazzi, A e B, che finiscono la stessa scuola stando nello stesso percentile, ma lo studente A ha un sat score di 140 maggiore dello studente B.
#### Quale sará la differenza predette in colGPA per questi due studenti?
colgpa_variation <- 0.00148*140
colgpa_variation
# Mantenendo tutti gli altri valori fissi (ceteris paribus) la variazione del gpa é pari ad un incremento di 0.2072 punti
#
#### Is the difference large?
#### Questa differenza é ampia?
# Una differenza di 0.2072 é una differenza abbastanza sostanziale
#
#
#### Holding hsperc fixed, what difference in SAT scores leads to a predicted colgpa difference of .50, or one-half of a grade point?
#### Comment on your answer.
#### Mantenendo fisso hsperc, qual'é la differenza in SAT legata ad una differenza predetta del colgpa pari a 0.50, o mezzo punto?
sat_variation <- .50 / .00148
sat_variation
# Con 338 punti in piú, uno ha mezzo punto in piú di colgpa, un incremento sostanziale del colgpa
# Quindi sembrerebbe che il sat score non sia un grande predettore del colgpa
#
#
#
#
##########################################################
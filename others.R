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
########
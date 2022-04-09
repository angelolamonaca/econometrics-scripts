# La seguente tabella riporta la media e la varianza del numero dei dipen-
#   denti (X) e la spesa eettuata per training e continuing education (Y ,
#   misurata in EURO) per un campione di n = 1250 imprese.
#   variable x variable y
# Mean    45 261
# Variance 106 2593
# La covarianza tra X e Y e uguale a 466.6. Stimare la spesa per training e
# continuing education per una impresa con 37 dipendenti.

b1 <- 466.6 / 106
# B1 é il rapporto tra la covarianza tra X e Y e la varianza si X
b1

b0 <- 261 - b1 * 45 
# b0 = y medio - Beta1Cappello * x medio
b0  

y = b0 + b1 * 37
y
# spesa per training e continuing educ é 225.78



# Il salario dei giocatori di basket della lega professionistica americana (NBA)
# e legato a molti fattori, tra cui il numero di punti a partita realizzati, il
# numero di assist, il numero di rimbalzi catturati e gli anni di esperienza
# nella lega:
#   log(wage) = 0 + 1exper + 2points + 3rebounds + 4assists + u (1)

rm(list=ls())

# Import package
library(wooldridge)

data("nbasal")
help(nbasal)
str(nbasal)

mod <- lm(lwage ~ exper + points + rebounds + assists, data=nbasal)
summary(mod)

# Usando i dati nbasal, stimate il precedente modello di regressione
# dove la variabile dipendente e il logaritmo del salario. Qual e l'eetto
# di ciascun regressore? Fornite una interpretazione dei coecienti
# stimati.

# LOG-LEVEL
# All'aumentare di un anno di esperienza, il salario aumenta del 7.3% in ceteris paribus (ovvero tenendo le altre variabili costanti)
# All'aumentare di un punto di media a partita, il salario aumenta del 6% in ceteris paribus
# Idem per palleggi e assists



# Immaginate di selezionare due giocatori a caso. Questi due giocatori
# hanno le stesse statistiche per quello che riguarda la performance, ma
# uno dei due ha 4 anni di esperienza in piu nella lega. Quale sara la
# dierenza di salario predetta?

deltalogwage <- 0.07342 * 4 * 100
deltalogwage
# 4 anni in piu di esperienza, incrementano del 29.37% il salario in ceteris paribus



# Quali altri fattori avreste dovuto considerare nel modello? Se nec-
#   essario, discutere le conseguenze derivanti dal fatto di aver omesso
# queste altre variabili dal modello.

# Nel modello attuale, il valore R² non é basso, e quindi le variabili lo spiegano abbastanza
# Secondo me variabili che si potrebbero includere nel modello sono le partite giocate in media in un anno etc..


# Scegliendo a vostro piacimento una delle variabili esplicative, confer-
#   mate l'interpretazione \partialling out" delle stime OLS.

# PARTIALLING OUT
# calcolo i residui di point
uh <- residuals(lm(points~ exper + rebounds + assists, data = nbasal))
# regredisco lwage sui residui
mod2 <- lm(lwage~uh, data = nbasal)
summary(mod2)
summary(mod)
# la regressione multipla va a filtrare il valore della correlazione tra le variabili per estrarre il coefficiente originale

data(meap93)
help(meap93)

# Stimare il seguente modello
# math10 = 0 + 1 log(expend) + 2 log(chprg) + u (3)
# dove math10 e la percentuale di studenti che passano il test di matem-
#   atica (MEAP), log(expend) e il logaritmo della spesa per studente
# (in USD), e log(chprg) corrisponde alla percentuale di studenti che
# hanno scelto di pranzare nella mensa della scuola. Dopo aver sti-
#   mato il modello, osservare i segni dei coecienti: sono coerenti con
# le aspettative? Giusticare la risposta.

mod <- lm(math10 ~ lexpend + lnchprg, data=meap93)
summary(mod)

# All'aumentare di un punto percentuale della spesa per studente, la percentuale di studenti che passano il test aumenta del 0.06%
# L'aumento di un punt percentuale del lunch program, la percentuale di studenti che passano il test diminuisce del 0.3%
# Dall' R² basso (0.17) deduciamo che queste variabili non spiegano efficientemente il modello
# L'intercetta ci dice che 


# Ora stimare un modello di regressione semplice che include solamente
# log(expend) e confrontare il coeciente 1 stimato nel punto (a).

mod2 <- lm(math10 ~ lexpend, data=meap93)
summary(mod2)


# Find the correlation between lexpend 5 log(expend) and lnchprg. Does its sign
# make sense to you?

cor(meap93$lexpend, meap93$lnchprg)
help(cor)
# la correlazione tra le due é -0.19 ed é negativa
# secondo me ha senso il segno negativo perché una spesa maggiore indica uno studente con famiglia piú facoltosa e che quindi non ha diritto al lunch program

# Provare che lo stimatore dei minimi quadrati e unbiased.


# C10
# Use the data in HTV.RAW to answer this question. The data set includes information on
# wages, education, parents' education, and several other variables for 1,230 working men
# in 1991. 

data(htv)
help(htv)
str(htv)

# (i) What is the range of the educ variable in the sample? 
summary(htv$educ)
range(htv$educ)
#the range in [6~20]


# What percentage of men
# completed 12th grade but no higher grade?
length(htv$educ[htv$educ == 12])/length(htv$educ)


# Do the men or their parents have, on average, higher levels of education?
mean(htv$educ)
# The men do have higher levels of education than 12

mean(htv$fatheduc)
# The mens' fathers do have higher levels of education then 12

mean(htv$motheduc)
# The mens' mothers do have higher levels of education then 12

# The mens do have higher education averages than their parents



# Estimate the regression model
# educ 5 b0 1 b1motheduc 1 b2 fatheduc 1 u
# by OLS and report the results in the usual form. 
mod <- lm(educ ~ motheduc + fatheduc, data= htv)
summary(mod)
# sample size, coefficients, rsquared

#How much sample variation in
# educ is explained by parents' education?
# La variazione di educ é spiegata dall'educazione dei genitori in modo non ottimale, analizzando che l'R quadro é pari a 0.25
# L'educazione dei genitori spiega il modello al 25%

# Interpret the coefficient on motheduc.
# In ceteris paribus, l'incremento dell'educazione della madre pari a 3 gradi comporta un incremento dell'educazione del figlio pari a circa un grado


# Add the variable abil (a measure of cognitive ability) to the regression from
# part (ii), and report the results in equation form. 
mod2 <- lm(educ ~ motheduc + fatheduc + abil, data= htv)
summary(mod2)
# educ = 8.45 + .19motheduc + .11fatheduc + .50abil 


# Does "ability" help to explain variations
# in education, even after controlling for parents' education? Explain.
summary(lm(educ ~ motheduc + fatheduc, data= htv))$r.squared
summary(lm(educ ~ motheduc + fatheduc + abil, data= htv))$r.squared
# La variabile ability ha un forte valore esplicativo perché in seguito alla sua aggiunta nel modello, il valore di R² é aumentato di 0.18



# (Requires calculus) Now estimate an equation where abil appears in quadratic form:
#   educ 5 b0 1 b1motheduc 1 b2 fatheduc 1 b3abil 1 b4abil2 1 u.
# Using the estimates b ^ 3 and b^ 4 , use calculus to find the value of abil, call it abil*,
# where educ is minimized. (The other coefficients and values of parents' education
#                           variables have no effect; we are holding parents' education fixed.) Notice that abil
# is measured so that negative values are permissible. You might also verify that the
# second derivative is positive so that you do indeed have a minimum.

b0h <- htv$educ
b1h <- htv$motheduc
b2h <- htv$fatheduc
b3h <- htv$abil
b4h <- htv$abil
# TODO


# Use the data in DISCRIM.RAW to answer this question. These are zip code-level data
# on prices for various items at fast-food restaurants, along with characteristics of the zip
# code population, in New Jersey and Pennsylvania. The idea is to see whether fast-food
# restaurants charge higher prices in areas with a larger concentration of blacks.
data(discrim)
help(discrim)
summary(discrim$prpblck)
#Find the average values of prpblck and income in the sample, along with their
# standard deviations. What are the units of measurement of prpblck and income?
mean(discrim$prpblck, na.rm = T)
mean(discrim$income, na.rm = T)
# la media di prpblck é 0.11
# la media di income é 47054

sd(discrim$prpblck, na.rm = T)
sd(discrim$income, na.rm = T)
# la deviazione standard di prpblck é 0.18
# la deviazione standard di income é 13179

# prpblck é in percentuale
# income é in dollari



# Consider a model to explain the price of soda, psoda, in terms of the proportion of
# the population that is black and median income:
#   psoda 5 b0 1 b1prpblck 1 b2income 1 u.
# Estimate this model by OLS and report the results in equation form, including the
# sample size and R-squared. 
mod <- lm(psoda ~ prpblck + income, data = discrim)
summary(mod)
# psoda = 0.95 + 0.12prpblck + 0.0000016income
# la sample size é di 410 osservazioni
# R² é pari a 0.064


# Interpret the coefficient on prpblck. Do you think it is economically large?
# All'aumentare del 10% sul rapporto neri/popolazione, il prezzo della soda aumenterá di 11 cents

# Compare the estimate from part (ii) with the simple regression estimate from
# psoda on prpblck. Is the discrimination effect larger or smaller when you control
# for income?
mod2 <- lm(psoda ~ prpblck, data=discrim)
summary(mod2)



library(wooldridge)



data(discrim)
help(discrim)
summary(discrim$prpblck)
#Find the average values of prpblck and income in the sample, along with their
# standard deviations. What are the units of measurement of prpblck and income?
mean(discrim$prpblck, na.rm = T)
mean(discrim$income, na.rm = T)
# la media di prpblck é 0.11
# la media di income é 47054



sd(discrim$prpblck, na.rm = T)
sd(discrim$income, na.rm = T)
# la deviazione standard di prpblck é 0.18
# la deviazione standard di income é 13179



# prpblck é in percentuale
# income é in dollari





# Consider a model to explain the price of soda, psoda, in terms of the proportion of
# the population that is black and median income:
# psoda 5 b0 1 b1prpblck 1 b2income 1 u.
# Estimate this model by OLS and report the results in equation form, including the
# sample size and R-squared.
mod <- lm(psoda ~ prpblck + income, data = discrim)
summary(mod)
# psoda = 0.95 + 0.12prpblck + 0.0000016income
# la sample size é di 410 osservazioni
# R² é pari a 0.064




# Interpret the coefficient on prpblck. Do you think it is economically large?
# All'aumentare del 10% sul rapporto neri/popolazione, il prezzo della soda aumenterá di 11 cents


# A model with a constant price elasticity with respect to income may be more
# appropriate. Report estimates of the model
# log(psoda) 5 b0 1 b1prpblck 1 b2log(income) 1 u.
# If prpblck increases by .20 (20 percentage points), what is the estimated percentage change in psoda? (Hint: The answer is 2.xx, where you fill in the "xx.")



mod3 <- lm(lpsoda ~ prpblck + lincome, data = discrim)
summary(mod3)
0.12158/100
0.0012158*100
0.12158*20
# al variare dell'1% del prpblck il prezzo della soda aumenterà di =0,12% (in ceteris paribus)
# aumentando il prpblack di 20% e tenendo ceteris paribus le altre variabili il prezzo della soda aumenterà del 2.43%.



# Now add the variable prppov to the regression in part (iv). What happens
# to b^prpblck?

mod4 <- lm(lpsoda ~ prpblck + lincome + prppov, data = discrim )
summary(mod4)
a <- na.omit(discrim$prppov)
b <- na.omit(discrim$prpblck)
cor(a, b )
# il valore di prpblck è diminuito perchè in assenza di prppov, prpblck includeva in esso parte della variazione di prppov



# Find the correlation between log(income) and prppov. Is it roughly what you
# expected?



cor(na.omit(discrim$lincome), na.omit(discrim$prppov))
# si mi aspettavo questa forte correlazione negativa perchè aumentando il reddito ci si aspetta una diminuzione di povertà



# Evaluate the following statement: "Because log(income) and prppov are so highly
# correlated, they have no business being in the same regression."



#secondo me avere queste due variabil nello stesso modello consente al modello di spiegare leggermente meglio il prezzo della soda, ma in minimam parte perche l'R-square è aumnetato di 0,018




library(wooldridge)
data("charity")



# Use the data in CHARITY.RAW to answer the following questions:
# (i) Estimate the equation
# gift 5 b0 1 b1mailsyear 1 b2giftlast 1 b3propresp 1 u
# by OLS and report the results in the usual way, including the sample size and
# R-squared. How does the R-squared compare with that from the simple regression
# that omits giftlast and propresp?



ols <- lm(gift ~ mailsyear + giftlast + propresp, data = charity)
summary(ols)



#semple size = 4268
#R-squared = 0,08336



ols2 <- lm(gift ~ mailsyear, data = charity)
summary(ols2)



#comparando i due modelli notiamo che l'R-squared del modello semplice diminuisce di 0,07 abbassando notevolmente il livello di significativita del modello



#Interpret the coefficient on mailsyear. Is it bigger or smaller than the corresponding simple regression coefficient?



#il coefficiente di mailsyear e piu piccolo rispetto al coefficiente nel modello lineare semplice perchè in quest'ultimo esso si fa carico di rappresentare parte delle due variabili omesse



#Interpret the coefficient on propresp. Be careful to notice the units of measurement of propresp



summary(charity$propresp)
summary(charity$gift)
#in condizione di ceteris paribus, all'aumentare del 1% della percentuale di risposte il numero di gift aumeteran di 0.15



# Now add the variable avggift to the equation. What happens to the estimated effect
# of mailsyear?



ols3 <- lm(gift ~ mailsyear + giftlast + propresp + avggift, data = charity)
summary(ols3)



#il coefficiente mailsyear aggiungendo avggift nel modello si è notevolmente abbasato dimezzandosi, da cio si deduce che mailsyear si faceva carico anche di parte dell'influenza di avggift. inoltre possiamo dire che l'aggiunta di avggift fa aumentare l'R-squared considerevolmente rendendolo notevolmente piu significativo.




# In the equation from part (iv), what has happened to the coefficient on giftlast?
# What do you think is happening?



#notiamo che aggiungendo avggift al modello il coefficiente giftlast è passato da un valore positivo prossimo allo 0 ad un valore negativo di -0,26. da questo possiamo dedurre che in assenza di avggif giftlast si fa carico di parte della sua influenza
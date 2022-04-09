rm(list=ls())

# Import package
library(wooldridge)

data("nbasal")
help(nbasal)
str(nbasal)

mod <- lm(lwage ~ exper + points + rebounds + assists, data=nbasal)
summary(mod)

# PARTIALLING OUT
# calcolo i residui di point
uh <- residuals(lm(points~ exper + rebounds + assists, data = nbasal))
# regredisco lwage sui residui
mod2 <- lm(lwage~uh, data = nbasal)
summary(mod2)
summary(mod)
# la regressione multipla va a filtrare il valore della correlazione tra le variabili per estrarre il coefficiente originale


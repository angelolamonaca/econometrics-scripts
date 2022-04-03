rm(list=ls())

# Import package
library(wooldridge)

# Extract data from wooldridge
data("wage1")

# Dataset Documentation
help(wage1)

# Wage average (media aritmetica)
mean(wage1$wage)

# Display summary
summary(wage1)

# Display summary of the first 3 variables (wage, educ, exper)
summary(wage1)[,1:3]
summary(wage1[,1:3])

# Display elements with educ == 0
wage1$educ[wage1$educ == 0]

# Display indexes of elements with educ = 0
which(wage1$educ == 0)

# Display qty of elements with educ = 0
length(which(wage1$educ == 0))

# Display ricorrenze
table(wage1$educ)
# 2 elementi hanno educ = 0
# 1 elemento ha educ = 2


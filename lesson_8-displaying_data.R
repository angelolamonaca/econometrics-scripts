rm(list=ls())

# Import package
library(wooldridge)

# Extract data from wooldridge
data("wage1")

# Dataset Documentation
help(wage1)

# Display data
str(wage1)

## IN ORDER TO DISPLAY DATA THE INDEX SHOULD BE SET AS FOLLOWING:
## array_name[element_index,variable_index]
## IF YOU DON'T SET THE INDEX, IT WILL RETRIEVE ALL

# Display the first variable of all elements
str(wage1["wage"])
str(wage1[1])
str(wage1[,1])

# Display the first variable of the first 3 elements
str(wage1[1:3,"wage"])
str(wage1[1:3,1])

# Display the first variable of the first element
str(wage1[1,"wage"])
str(wage1[1,1])

# Display all variables of the first element
str(wage1[1,])

# Display the first 3 variables of the first element
str(wage1[1,1:3])

# Display the first variable of the first element
str(wage1[1,1])

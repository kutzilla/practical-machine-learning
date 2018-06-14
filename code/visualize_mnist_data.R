library(h2o)

source("code/load.mnist.R")

# Darstellung des Mittelwerts
avg <- matrix(h2o.mean(train60k[,x]), nrow = 28)
image(avg, col = grey(255:0/255))

# Darstellung der Standardabweichung
avgsd <- matrix(sapply(x, function(x) h2o.sd(train60k[,x]) ), nrow = 28)
image(avgsd, col=grey(255:0/255))  

# Prüfen wie viele Spalten einen Farbwert größer 16 haben
mean(h2o.mean(train60k[, x]) > 16)


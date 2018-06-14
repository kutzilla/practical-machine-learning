library(h2o)

source("code/load.building_energy.R")

# Korrelation zwischen allen Variablen bilden
round(h2o.cor(train), 2)

# Korrelationen ohne die Enum-Spalten
numericColumns <- setdiff(colnames(train), c("X6", "X8"))
d <- round(h2o.cor(train[,numericColumns]), 2)
rownames(d) <- colnames(d)
d

# Prüfen ob die Daten normalverteilt sind. Anhand eines Histograms
par(mfrow = c(2, 5))
ylim <- NULL
#ylim <- c(0, 350)
dummy <- lapply(colnames(d), function(col) {
  h <- h2o.hist(train[, col], breaks = 30, plot = FALSE)
  plot(h, main = col, xlab = "", ylim = ylim)
})

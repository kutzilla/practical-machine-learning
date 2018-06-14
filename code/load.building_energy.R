library(h2o)

h2o.init(nthreads = -1)

data <- h2o.importFile(paste(getwd(), "/datasets/ENB2012_data.csv", sep = ""))

factorLists <- c("X6", "X8")

data[,factorLists] <- as.factor(data[,factorLists])

split <- h2o.splitFrame(data, 0.8)

train <- split[[1]]

test <- split[[2]]

# X1: Relative Compactness, X2: Surface Area, X3: Wall Area, X4: Roof Area
# X5: Overall Height, X6: Orientation, X7: Glazing Area, X8: Glazing Area Distribution
# Y1: Heating Load, Y2: Cooling Load
x <- c("X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8")

y <- "Y2" # oder Y1
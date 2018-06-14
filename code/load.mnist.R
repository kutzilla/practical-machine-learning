library(h2o)

h2o.init(nthreads = -1, max_mem_size = "3G")

train60k <- h2o.importFile(paste(getwd(), "/datasets/mnist.train.csv.gz", sep = ""))

test <- h2o.importFile(paste(getwd(), "/datasets/mnist.test.csv.gz", sep = ""))

# Die ersten 784 Spalte (28 x 28) sind die Pixel als Farbwert von 0 - 255
x <- 1:784

# Die letzte Spalte ist die Zahl die dargestellt werden soll
y <- 785

# Umwandlung als Faktoren
train60k[, y] <- as.factor(train60k[,y])
test[,y] <- as.factor(test[,y])

parts <- h2o.splitFrame(train60k, 1.0 / 6.0)
valid <- parts[[1]]
test <- parts[[2]]
rm(parts)


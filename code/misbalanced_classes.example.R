library(h2o)

h2o.init(nthreads = -1)

datasets <- "https://raw.githubusercontent.com/DarrenCook/h2o/bk/datasets/"

data <- h2o.importFile(paste0(datasets, "iris_wheader.csv"))

data <- data[1:120,]

summary(data$class)

parts <- h2o.splitFrame(data, 0.8)

train <- parts[[1]]
test <- parts[[2]]

summary(train)
summary(test)

m1 <- h2o.randomForest(
  1:4, 5, train, model_id = "RF_defaults"
)

h2o.confusionMatrix(m1)

m2 <- h2o.randomForest(
  1:4, 5, train, model_id = "RF_balanced",
  balance_classes = TRUE
)

h2o.confusionMatrix(m2)

m3 <- h2o.randomForest(
  1:4, 5, train, model_id = "RF_class_sampling",
  balance_classes = TRUE, class_sampling_factors = c(1, 1, 2.5)
)

h2o.confusionMatrix(m3)

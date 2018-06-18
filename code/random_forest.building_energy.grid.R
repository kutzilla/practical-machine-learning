library(h2o)

source("code/load.building_energy.R")

g <- h2o.grid("randomForest",
              hyper_params = list(
                ntrees = c(50, 100, 120), #3
                max_depth = c(40, 60), #2
                min_rows = c(1, 2) #2
              ), # 3 * 2 * 2 = 12 (Modelle)
              x = x, y = y, training_frame = train, nfolds = 10
            )

# Änderung der Sortierreihenfolge
g_r2 <- h2o.getGrid(g@grid_id, sort_by = "r2", decreasing = TRUE)

# Abfrage aller Modelle (Default-mäßig werden nur 12 zurückgegeben)
as.data.frame(g_r2@summary_table)

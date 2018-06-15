library(h2o)

h2o.init(nthreads = -1)

train <- h2o.importFile(paste(getwd(), "/datasets/football.train.csv", sep = ""))
test <- h2o.importFile(paste(getwd(), "/datasets/football.test.csv", sep = ""))
valid <- h2o.importFile(paste(getwd(), "/datasets/football.valid.csv", sep = ""))

train$HomeWin <- as.factor(train$FTR == "H")
valid$HomeWin <- as.factor(valid$FTR == "H")
test$HomeWin <- as.factor(test$FTR == "H")

train$ScoreDraw <- as.factor(train$FTHG > 0 & train$FTHG == train$FTAG)
valid$ScoreDraw <- as.factor(valid$FTHG > 0 & valid$FTHG == valid$FTAG)
test$ScoreDraw <- as.factor(test$FTHG > 0 & test$FTHG == test$FTAG)

statFields <- c(
  "FTHG", "FTAG", "FTR", "HTHG", "HTAG", "HTR",
  "HS", "AS", "HST", "AST", "HF", "AF",
  "HC", "AC", "HY", "AY", "HR", "AR",
  "HomeWin", "ScoreDraw"
)

ignoreFields <- c("Date", "HomeTeam", "AwayTeam", statFields)

xNoOdds <- c(
  "Div", "HS1", "AS1", "HST1", "AST1",
  "HF1", "AF1", "HC1", "AC1", "HY1", "AY1", "HR1", "AR1",
  "res1H", "res1A", "res5H", "res5A", "res20H", "res20A"
)

# y <- "FTR" # 3-value multinomial
# y <- "ScoreDraw" # Unbalanced binomial
y <- "HomeWin" # Balanced binomial
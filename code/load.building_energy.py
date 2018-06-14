import os
import h2o

h2o.init()

# TODO Fehler mit Pfad beheben
path = os.path.dirname("/Users/Matthias/Development/Code/practical-machine-learning/datasets")
fname = os.path.join(path, "/ENB2012_data.csv")
data = h2o.import_file(fname)


factorsList = ["X6", "X8"]

data[factorsList] = data[factorsList].asfactor()

train, test = data.split_frame([0.8])

x = ["X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8"]

y = "Y2"

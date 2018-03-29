import h2o

h2o.init()


datasets = "https://raw.githubusercontent.com/DarrenCook/h2o/bk/datasets/"
data = h2o.import_file(datasets + "iris_wheader.csv")

data.frame_id

data = data[:, 1:]

data.frame_id

data = h2o.assign(data, "iris")
data.frame_id

h2o.ls()
h2o.remove("iris_wheader.hex")
h2o.ls()

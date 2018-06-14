import h2o
h2o.init()

# From dictionary

patients = {
    'height' : [188, 157, 175],
    'age' : [29, 33, 65],
    'risk' : ['A', 'B', 'B']
}

df = h2o.H2OFrame(patients)

print(df.types)

# From dictionary with customization

patients = {
    'height' : [188, 157, 175.1],
    'age' : [29, 33, 65],
    'risk' : ['A', 'B', 'B']
}

df = h2o.H2OFrame.from_python(
    patients,
    column_types= ['enum', None, None],
    destination_frame="patients"
)

print(df.type)
print(df.frame_id)

# From pandas

import pandas as pd

patients = pd.DataFrame({
    'height' : [188, 157, 175.1],
    'age' : [29, 33, 65],
    'risk' : ['A', 'B', 'B']
})

df = h2o.H2OFrame(patients)

print(df.types)
print(df.frame_id)

# From pandas with customization

patients = pd.DataFrame({
    'height' : [188, 157, 175.1],
    'age' : [29, 33, 65],
    'risk' : ['A', 'B', 'B']
})

df = h2o.H2OFrame.from_python(
    patients,
    column_names=patients.columns.tolist()
)

print(df.types)
print(df.frame_id)

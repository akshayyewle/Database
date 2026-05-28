
import pandas as pd

df = pd.read_csv('train.csv')
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_') \
    .str.replace('(', '').str.replace(')', '')

print(df.columns)
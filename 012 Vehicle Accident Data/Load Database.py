import os
import pandas as pd 
from sqlalchemy import create_engine
from IPython.display import clear_output, display
import regex as re

# Database Connection Details
PGSQL_Server = 'localhost:5432'  # Use Your Server Name
PGSQL_Username = 'postgres'     # Use Your Username
PGSQL_Password = os.getenv('PGAdmin_Password') # Use Your Password
PGSQL_Database = 'accidents'

# Create Database Connection
connection_string = f'postgresql://{PGSQL_Username}:{PGSQL_Password}@{PGSQL_Server}/{PGSQL_Database}'
Query_Engine = create_engine(connection_string)
Connection = Query_Engine.connect()

# Get List Of Files In Folder
Folder_Input = 'Input Data'
Files_List = os.listdir(Folder_Input)
Files_List = sorted(Files_List)
print('No. Of Files Found:',len(Files_List))
print(Files_List,'\n')

# Filter CSV Files
CSV_Files_List = [filename for filename in Files_List if '.csv' in filename.lower()]
# CSV_Files_List = [filename for filename in Files_List if re.findall(r'\.csv',filename,re.I)]
print('No. Of CSV Files:', len(CSV_Files_List))
print(CSV_Files_List,'\n')

# Load Data To SQL Database
for filename in CSV_Files_List:
    clear_output(wait=True)
    print('Reading & Loading: ',filename)
    df = pd.read_csv(f'{Folder_Input}/{filename}')
    # display(df.head(10))
    table_name = re.findall('(\w+)\.csv$',filename)[0]
    df.to_sql(name=table_name,con=Connection,if_exists='replace',index=False)
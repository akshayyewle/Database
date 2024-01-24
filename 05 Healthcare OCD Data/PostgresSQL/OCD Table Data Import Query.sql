-- Load the data from the CSV file into the data table
COPY OCD_data FROM '"C:\Users\aksha\OneDrive\06 Data Science & Analytics\Github\Database\05 Healthcare OCD Data\ocd_patient_dataset.csv"' 
DELIMITER ',' CSV HEADER;
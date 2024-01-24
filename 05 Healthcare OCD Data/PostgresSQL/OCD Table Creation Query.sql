CREATE TABLE OCD_data (
	PatientID INT,
    Age INT,
    Gender VARCHAR(10),
    Ethnicity VARCHAR(50),
    Marital_Status VARCHAR(20),
    Education_Level VARCHAR(50),
    OCD_Diagnosis_Date DATE,
    Duration_of_Symptoms_months INT,
    Previous_Diagnoses VARCHAR(100),
    Family_History_of_OCD VARCHAR(100),
    Obsession_Type VARCHAR(100),
    Compulsion_Type VARCHAR(100),
    YBOCS_Score_Obsessions INT,
    YBOCS_Score_Compulsions INT,
    Depression_Diagnosis VARCHAR(100),
    Anxiety_Diagnosis VARCHAR(100),
    Medications VARCHAR(100)
);
CREATE DATABASE heart_patient;
USE heart_patient;

SHOW TABLES;
-- BASIC SQL QUESTIONS
-- Count the total number of patients.
SELECT COUNT(*) AS total_numbers FROM heart_patient;

-- Find the average age of patients.
SELECT AVG(age) FROM heart_patient;

-- List all distinct chest pain types.
SELECT DISTINCT chest_pain_type FROM heart_patient;

-- Count how many male and female patients are there.
SELECT 
    CASE 
        WHEN sex = 1 THEN 'Male'
        WHEN sex = 0 THEN 'Female'
    END AS gender,
    COUNT(*) AS total
FROM heart_patient
GROUP BY sex;

-- Find patients older than 60 years.
SELECT * FROM heart_patient WHERE age > 60;

-- Count patients with heart disease.
SELECT COUNT(*) FROM heart_patient WHERE heart_disease = 1;

-- Retrieve patients with cholesterol level greater than 240.
SELECT * FROM heart_patient WHERE cholesterol > 240;

-- Show patients with fasting blood sugar > 120 mg/dl.
	SELECT * FROM heart_patient WHERE fasting_blood_sugar = 1;

-- List patients who have exercise-induced angina.
SELECT * FROM heart_patient WHERE exercise_induced_angina = 'YES';

-- Find the minimum and maximum resting blood pressure.
SELECT MIN(resting_bp), MAX(resting_bp) FROM heart_patient;



-- INTERMEDIATE SQL QUESTIONS
-- Count heart disease cases grouped by gender.
SELECT COUNT(*),gender FROM heart_patient WHERE heart_disease = 1 GROUP BY gender;

-- Find the average cholesterol level by chest pain type.
SELECT AVG(cholesterol), chest_pain_type FROM heart_patient GROUP BY chest_pain_type;

-- List patients with heart disease and age above 55.
SELECT * FROM heart_patient WHERE heart_disease = 1 AND age > 55;

-- Count patients grouped by chest pain type.
SELECT COUNT(*), chest_pain_type FROM heart_patient GROUP BY chest_pain_type;

-- Find the average max heart rate by gender.
SELECT AVG(max_heart_rate), gender FROM heart_patient GROUP BY gender;

-- Retrieve patients with normal ECG and no heart disease.
SELECT * FROM heart_patient WHERE resting_ecg = 'Normal' AND heart_disease = 0;

-- Count how many patients have 0 major vessels affected.
SELECT COUNT(*) FROM heart_patient WHERE num_major_vessels = 0;

-- Find patients with oldpeak greater than 2.0.
SELECT * FROM heart_patient WHERE oldpeak > 2.0;

-- Group patients by thalassemia and count cases.
SELECT thalassemia, COUNT(*) FROM heart_patient GROUP BY thalassemia;

-- Find the top 10 patients with the highest cholesterol.
SELECT * FROM heart_patient WHERE (SELECT MAX(cholesterol) FROM heart_patient) 
ORDER BY cholesterol DESC LIMIT 10;




-- MEDIUM LEVEL SQL QUESTIONS
-- Find the percentage of patients with heart disease.
SELECT 
    (SUM(CASE WHEN heart_disease = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) 
    AS heart_disease_percentage FROM heart_patient;
    
-- Compare average cholesterol for patients with and without heart disease.
SELECT heart_disease,AVG(cholesterol) AS avg_cholesterol
FROM heart_patient GROUP BY heart_disease;

-- Find age-wise distribution of heart disease cases.
SELECT age, COUNT(*) AS heart_disease_cases FROM heart_patient
WHERE heart_disease = 1 GROUP BY age ORDER BY age;

-- Identify chest pain types most associated with heart disease.
SELECT chest_pain_type AS chest_pain_type, COUNT(*) AS total_cases FROM heart_patient
WHERE heart_disease = 1 GROUP BY chest_pain_type ORDER BY cases DESC;

-- Find patients who have:
-- Heart disease
-- Exercise-induced angina
-- Cholesterol > 250
SELECT * FROM heart_patient WHERE heart_disease = 1 AND exercise_induced_angina = 1 AND cholesterol > 250;

-- Rank patients by maximum heart rate (use window functions).

-- Find gender-wise heart disease ratio.

-- Determine which slope type has the highest heart disease cases.

-- Find patients whose resting BP is above the dataset average.

-- Create a view showing only high-risk patients (heart disease = 1 and age > 60).


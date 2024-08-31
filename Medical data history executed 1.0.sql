SELECT first_name, last_name, gender
FROM patients
WHERE gender = 'M';
SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL;
SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';
SELECT first_name, last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;

UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

select p.first_name,p.last_name,pro.province_name from patients as p
inner join province_names as pro
on p.province_id=pro.province_id;


SELECT COUNT(*)
FROM patients
WHERE YEAR(birth_date) = 2010;
SELECT first_name, last_name, height
FROM patients
ORDER BY height DESC
LIMIT 1;
SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);
SELECT COUNT(*)
FROM admissions;
SELECT *
FROM admissions
WHERE DATE(admission_date) = DATE(discharge_date);
SELECT COUNT(*)
FROM admissions
WHERE patient_id = 579;
SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year;
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;
SELECT patient_id, first_name
FROM patients
WHERE LENGTH(first_name) >= 6 AND first_name LIKE 's%';
SELECT patient_id, first_name, last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
);
(SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name);
SELECT
SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END)
AS total_male_patients,
SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS total_female_patients
FROM patients;
select 
sum(gender ='M') as total_male,
sum(gender ='F') as total_female
from patients;

SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city;

select first_name,last_name,'patients' as role from patients
union all
select first_name,last_name,'doctor' from doctors;
    
    SELECT
    allergies,
    COUNT(*) AS total_diagnosis
FROM
    patients
WHERE
    allergies IS NOT NULL
    AND allergies != 'NKA'
GROUP BY
    allergies
ORDER BY
    total_diagnosis DESC;
     
SELECT
    first_name,
    last_name,
    birth_date
FROM
    patients
WHERE
    YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY
    birth_date;
    SELECT
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name
FROM
    patients
ORDER BY
    first_name DESC;
    SELECT
    province_id,
    SUM(height) AS total_height
FROM
    patients
GROUP BY
    province_id
HAVING
    SUM(height) >= 7000;
    
SELECT MAX(weight) - MIN(weight) AS weight_difference
FROM patients
WHERE last_name = 'Maroni';

SELECT DAY(admission_date) AS day_of_month, COUNT(*) AS admissions_count
FROM admissions
GROUP BY day_of_month
ORDER BY admissions_count DESC;
SELECT
    FLOOR(weight / 10) * 10 AS weight_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;
SELECT
    patient_id,
    weight,
    height,
    CASE WHEN weight / (height / 100) >= 30 THEN 1 ELSE 0 END AS isObese
FROM patients;
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty AS attending_doctor_specialty
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
    AND d.first_name = 'Lisa';
    
    select concat(patient_id,length(last_name),year(birth_date)) as temprory_password from patients;
    

































































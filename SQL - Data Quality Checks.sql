-- DATA QUALITY CHECKS

-- Step 1. Checking for NULL values in each table and for each column and decide what to do with the missing values.

-- allergies table (only NULL values in stop column which is OK)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(allergy_id) AS allergy_id_not_null,
    COUNT(start) AS start_not_null,
    COUNT(stop) AS stop_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null
FROM allergies;

-- careplans table (NULL values in stop column is OK. reason_code and reason_description will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(careplan_id) AS careplan_id_not_null,
    COUNT(start) AS start_not_null,
    COUNT(stop) AS stop_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null,
    COUNT(reason_code) AS reason_code_not_null,
    COUNT(reason_description) AS reason_description_not_null
FROM careplans;

-- conditions table (only NULL values in stop column which is OK)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(conditions_id) AS conditions_id_not_null,
    COUNT(start) AS start_not_null,
    COUNT(stop) AS stop_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null
FROM conditions;

-- encounters table (reason_code and reason_description will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(encounter_id) AS encounter_id_not_null,
    COUNT(start) AS start_not_null,
    COUNT(stop) AS stop_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(organization) AS organization_not_null,
    COUNT(provider) AS provider_not_null,
    COUNT(payer) AS payer_not_null,
	COUNT(encounter_class) AS encounter_class_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null,
	COUNT(base_encounter_cost) AS base_encounter_cost_not_null,
    COUNT(total_claim_cost) AS total_claim_cost_not_null,
	COUNT(payer_coverage) AS payer_coverage_not_null,
    COUNT(reason_code) AS reason_code_not_null,
    COUNT(reason_description) AS reason_description_not_null
FROM encounters;

-- medications table (NULL values in stop column is OK. reason_code and reason_description will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(medication_id) AS medication_id_not_null,
    COUNT(start) AS start_not_null,
    COUNT(stop) AS stop_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(payer) AS payer_not_null,
	COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null,
	COUNT(base_cost) AS base_cost_not_null,
	COUNT(payer_coverage) AS payer_coverage_not_null,
    COUNT(dispenses) AS dispenses_not_null,
	COUNT(total_cost) AS total_cost_not_null,	
	COUNT(reason_code) AS reason_code_not_null,
    COUNT(reason_description) AS reason_description_not_null
FROM medications;

-- observations table (encounter and units will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(observation_id) AS observation_id_not_null,
    COUNT(date) AS date_not_null,
    COUNT(patient) AS patient_not_null,
	COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null,
	COUNT(value) AS value_not_null,
    COUNT(units) AS units_not_null,
	COUNT(type) AS type_not_null
FROM observations;

-- organizations table (phone will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(organization_id) AS organization_id_not_null,
    COUNT(name) AS name_not_null,
    COUNT(address) AS address_not_null,
    COUNT(city) AS city_not_null,
    COUNT(state) AS state_not_null,
	COUNT(zip) AS zip_not_null,
    COUNT(latitude) AS latitude_not_null,
    COUNT(longitude) AS longitude_not_null,
	COUNT(phone) AS phone_not_null,
	COUNT(revenue) AS revenue_not_null,
    COUNT(utilization) AS utilization_not_null
FROM organizations;

-- patients table (NULL values in death_date column is OK. Others will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(patient_id) AS patient_id_not_null,
    COUNT(birth_date) AS birth_date_not_null,
    COUNT(death_date) AS death_date_not_null,
    COUNT(ssn) AS ssn_not_null,
    COUNT(drivers) AS drivers_not_null,
	COUNT(passport) AS passport_not_null,
    COUNT(prefix) AS prefix_not_null,
    COUNT(first) AS first_not_null,
	COUNT(last) AS last_not_null,
	COUNT(suffix) AS suffix_not_null,
	COUNT(maiden_name) AS maiden_name_not_null,
    COUNT(marital_status) AS marital_status_not_null,
    COUNT(race) AS race_not_null,
    COUNT(ethnicity) AS ethnicity_not_null,
	COUNT(gender) AS gender_not_null,
    COUNT(birthplace) AS birthplace_not_null,
    COUNT(address) AS address_not_null,
    COUNT(city) AS city_not_null,
    COUNT(state) AS state_not_null,
    COUNT(county) AS county_not_null,	
	COUNT(zip) AS zip_not_null,
    COUNT(latitude) AS latitude_not_null,
    COUNT(longitude) AS longitude_not_null,
	COUNT(healthcare_expenses) AS healthcare_expenses_not_null,
	COUNT(healthcare_coverage) AS healthcare_coverage_not_null
FROM patients;

-- procedures table (reason_code and reason_description will be handled in Python and Tableau)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(procedure_id) AS procedure_id_not_null,
    COUNT(date) AS date_not_null,
    COUNT(patient) AS patient_not_null,
    COUNT(encounter) AS encounter_not_null,
    COUNT(code) AS code_not_null,
    COUNT(description) AS description_not_null,
	COUNT(base_cost) AS base_cost_not_null,
	COUNT(reason_code) AS reason_code_not_null,
    COUNT(reason_description) AS reason_description_not_null
FROM procedures;

-- providers table (No NULL values)
SELECT 
    COUNT(*) AS total_rows,
	COUNT(provider_id) AS provider_id_not_null,
	COUNT(organization) AS organization_not_null,
    COUNT(name) AS name_not_null,
	COUNT(gender) AS gender_not_null,
	COUNT(specialty) AS speciality_not_null,	
    COUNT(address) AS address_not_null,
    COUNT(city) AS city_not_null,
    COUNT(state) AS state_not_null,
	COUNT(zip) AS zip_not_null,
    COUNT(latitude) AS latitude_not_null,
    COUNT(longitude) AS longitude_not_null,
    COUNT(utilization) AS utilization_not_null
FROM providers;


-- Step 2. Verify consistency in data types across the created database.

SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public'
ORDER BY 
    table_name, column_name;

-- I identified that the observations.value column is a text field because it combines both numerical and text values.
-- I will create an additional column for the numeric values. 

ALTER TABLE observations
ADD COLUMN value_numeric numeric;

UPDATE observations
SET value_numeric = value::numeric
WHERE type = 'numeric' AND value ~ '^[-]?[0-9]+(\.[0-9]+)?$';


-- Step 3. Check for Referential Integrity to ensure that all foreign keys in the tables are pointing to valid records in the referenced table.
-- Following are the foreign keys in our database and we will check whether all rows have a value to refer to using LEFT JOIN and checking for null values.

--  1. careplans.patient referencing patients.patient_id
--  2. careplans.encounter referencing encounters.encounter_id
--  3. providers.organization referencing organizations.organization_id
--  4. medications.patient referencing patients.patient_id
--  5. medications.encounter referencing encounters.encounter_id
--  6. procedures.patient referencing patients.patient_id
--  7. procedures.encounter referencing encounters.encounter_id
--  8. observations.patient referencing patients.patient_id
--  9. observations.encounter referencing encounters.encounter_id
-- 10. allergies.patient referencing patients.patient_id
-- 11. allergies.encounter referencing encounters.encounter_id
-- 12. encounters.patient referencing patients.patient_id
-- 13. conditions.patient referencing patients.patient_id
-- 14. conditions.encounter referencing encounters.encounter_id

--  1. careplans.patient referencing patients.patient_id (Successful)
SELECT c.patient
FROM careplans c
LEFT JOIN patients p ON c.patient = p.patient_id
WHERE p.patient_id IS NULL;

--  2. careplans.encounter referencing encounters.encounter_id (Successful)
SELECT c.encounter
FROM careplans c
LEFT JOIN encounters e ON c.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

--  3. providers.organization referencing organizations.organization_id (Successful)
SELECT p.organization
FROM providers p
LEFT JOIN organizations o ON p.organization = o.organization_id
WHERE o.organization_id IS NULL;

--  4. medications.patient referencing patients.patient_id (Successful)
SELECT m.patient
FROM medications m
LEFT JOIN patients p ON m.patient = p.patient_id
WHERE p.patient_id IS NULL;

--  5. medications.encounter referencing encounters.encounter_id (Successful)
SELECT m.encounter
FROM medications m
LEFT JOIN encounters e ON m.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

--  6. procedures.patient referencing patients.patient_id (Successful)
SELECT pr.patient
FROM procedures pr
LEFT JOIN patients p ON pr.patient = p.patient_id
WHERE p.patient_id IS NULL;

--  7. procedures.encounter referencing encounters.encounter_id (Successful)
SELECT p.encounter
FROM procedures p
LEFT JOIN encounters e ON p.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

--  8. observations.patient referencing patients.patient_id (Successful)
SELECT o.patient
FROM observations o
LEFT JOIN patients p ON o.patient = p.patient_id
WHERE p.patient_id IS NULL;

--  9. observations.encounter referencing encounters.encounter_id (30,363 NULL values where encounter is missing entirely)
--     All non-null encounters in observations are valid
SELECT o.encounter
FROM observations o
LEFT JOIN encounters e ON o.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

SELECT COUNT(*) FROM observations WHERE encounter IS NOT NULL; -- 269,334

SELECT COUNT(*) 
FROM observations o
JOIN encounters e ON o.encounter = e.encounter_id; -- 269,334

-- Since our readmission analysis is encounter-based, I create a cleaned version of observations table to be used:

CREATE TABLE observations_cleaned AS   -- new table will have the same structure as the previous table
SELECT o.*
FROM observations o
WHERE o.encounter IS NOT NULL;

-- 10. allergies.patient referencing patients.patient_id (Successful)
SELECT a.patient
FROM allergies a
LEFT JOIN patients p ON a.patient = p.patient_id
WHERE p.patient_id IS NULL;

-- 11. allergies.encounter referencing encounters.encounter_id (Successful)
SELECT a.encounter
FROM allergies a
LEFT JOIN encounters e ON a.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

-- 12. encounters.patient referencing patients.patient_id (Successful)
SELECT e.patient
FROM encounters e
LEFT JOIN patients p ON e.patient = p.patient_id
WHERE p.patient_id IS NULL;

-- 13. conditions.patient referencing patients.patient_id (Successful)
SELECT c.patient
FROM conditions c
LEFT JOIN patients p ON c.patient = p.patient_id
WHERE p.patient_id IS NULL;

-- 14. conditions.encounter referencing encounters.encounter_id (Successful)
SELECT c.encounter
FROM conditions c
LEFT JOIN encounters e ON c.encounter = e.encounter_id
WHERE e.encounter_id IS NULL;

-- Referential integrity is confirmed!


-- Step 4. Check for Duplicates. We check whether there are duplicates in each table

-- 1. patients table (no duplicates found)
SELECT first, last, birth_date, gender, COUNT(*)
FROM patients
GROUP BY first, last, birth_date, gender
HAVING COUNT(*) > 1;

-- 2. encounters table (no duplicates found)
SELECT patient, start, stop, encounter_class, code, provider, organization, reason_code, COUNT(*)
FROM encounters
GROUP BY patient, start, stop, encounter_class, code, provider, organization, reason_code
HAVING COUNT(*) > 1;

-- 3. conditions table (no duplicates found)
SELECT patient, encounter, code, start, COUNT(*)
FROM conditions
GROUP BY patient, encounter, code, start
HAVING COUNT(*) > 1;

-- 4. medications table (no duplicates found)
SELECT 
    patient, encounter, code, start, stop, base_cost, COUNT(*)
FROM medications
GROUP BY 
    patient, encounter, code, start, stop, base_cost
HAVING COUNT(*) > 1;

-- 5. observations_cleaned table (442 duplicates found)
SELECT patient, encounter, code, description, date, value, units, type, COUNT(*)
FROM observations_cleaned
GROUP BY patient, encounter, code, description, date, value, units, type
HAVING COUNT(*) > 1;

-- we have identified 442 duplicates and we will remove them.
-- PostgreSQL provides a system column called ctid, which is unique for each row.

DELETE FROM observations_cleaned
WHERE ctid NOT IN (                  -- we keep the first instance and delete the next ctids which are duplicates
    SELECT MIN(ctid)
    FROM observations_cleaned
    GROUP BY patient, encounter, code, description, date, value, units, type
);

-- 6. careplans table (no duplicates found)
SELECT patient, encounter, code, start, COUNT(*)
FROM careplans
GROUP BY patient, encounter, code, start
HAVING COUNT(*) > 1;

-- 7. allergies table (no duplicates found)
SELECT patient, encounter, code, start, COUNT(*)
FROM allergies
GROUP BY patient, encounter, code, start
HAVING COUNT(*) > 1;

-- 8. organizations table (no duplicates found)
SELECT name, address, city, state, zip, revenue, COUNT(*)
FROM organizations
GROUP BY name, address, city, state, zip, revenue
HAVING COUNT(*) > 1;

-- 9. providers table (no duplicates found)
SELECT name, organization, specialty, state, zip, COUNT(*)
FROM providers
GROUP BY name, organization, specialty, state, zip
HAVING COUNT(*) > 1;

-- 10. procedures table (no duplicates found)
SELECT patient, encounter, code, date, COUNT(*)
FROM procedures
GROUP BY patient, encounter, code, date
HAVING COUNT(*) > 1;


-- Step 5. Check for correct logic in related fields

-- Check that all the stop dates are after the start dates

SELECT * 
FROM allergies
WHERE stop < start;

SELECT * 
FROM careplans
WHERE stop < start;

SELECT * 
FROM conditions
WHERE stop < start;

SELECT * 
FROM encounters
WHERE stop < start;

SELECT * 
FROM medications
WHERE stop < start;

-- I identified 5 rows where the stop is before start. This is incorrect. I adjust this by making stop = start for those 5 rows

UPDATE medications
SET stop = start
WHERE stop < start;


-- Check that all the death_date are after the birth_date (Successful)
SELECT *
FROM patients
WHERE death_date IS NOT NULL AND death_date < birth_date;


-- Check whether any birth_date is in the future (Successful)
SELECT *
FROM patients
WHERE birth_date > CURRENT_DATE;



-- DATA CLEANING PROCESS

-- 1. Standardize Categorical Values

-- All categorical values such as gender are aligned.

-- 2. Data error correction

-- Incorrect data in names (first, last, maiden_name) has no impact on the analysis so no cleaning is carried out.
-- We only provide the cleaning for the provider name.

-- We use Regular Expression with following codes:
-- '\d+', '', 'g'     \d+  replaces all digits with '' for the entire string 'g' (global flag)
-- '\s+', ' ', 'g'    \s+  replaces multiple spaces with a single space ' ' for the entire string 'g' (global flag)

UPDATE providers
SET name = REGEXP_REPLACE(REGEXP_REPLACE(name, '\d+', '', 'g'), '\s+', ' ', 'g');






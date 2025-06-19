-- Create the Readmission database
CREATE DATABASE readmission;

-- Create all the different tables

-- 1. Create patients table according to patients.csv
CREATE TABLE patients (
    patient_id TEXT PRIMARY KEY,
    birth_date DATE,
    death_date DATE,
    ssn TEXT,
    drivers TEXT,
    passport TEXT,
    prefix TEXT,
    first TEXT,
    last TEXT,
    suffix TEXT,
    maiden_name TEXT,
    marital_status TEXT,
    race TEXT,
    ethnicity TEXT,
    gender TEXT,
    birthplace TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    county TEXT,
    zip TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    healthcare_expenses NUMERIC,
    healthcare_coverage NUMERIC
);

-- 2. Create encounters table according to encounters.csv
CREATE TABLE encounters (
    encounter_id TEXT PRIMARY KEY,
    start TIMESTAMP,
    stop TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
    organization TEXT,
    provider TEXT,
    payer TEXT,	
	encounter_class TEXT,
    code TEXT,
    description TEXT,
    base_encounter_cost NUMERIC,
    total_claim_cost NUMERIC,
	payer_coverage NUMERIC,
    reason_code TEXT,
    reason_description TEXT
);

-- 3. Create conditions table according to conditions.csv
CREATE TABLE conditions (
	conditions_id SERIAL PRIMARY KEY,  -- auto-generated unique identifier
	start TIMESTAMP,
    stop TIMESTAMP,
    patient TEXT REFERENCES patients(patient_id), -- Foreign key
    encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT
);

-- 4. Create medications table according to medications.csv
CREATE TABLE medications (
    medication_id SERIAL PRIMARY KEY,  -- auto-generated unique identifier
    start TIMESTAMP,
    stop TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
	payer TEXT,
	encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT,
	base_cost NUMERIC,
	payer_coverage NUMERIC,
	dispenses INTEGER,
	total_cost NUMERIC,
    reason_code TEXT,
    reason_description TEXT
);

-- 5. Create procedures table according to procedures.csv
CREATE TABLE procedures (
    procedure_id SERIAL PRIMARY KEY,
    date TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
    encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT,
	base_cost NUMERIC,
    reason_code TEXT,
    reason_description TEXT
);

-- 6. Create observations table according to observations.csv
CREATE TABLE observations (
    observation_id SERIAL PRIMARY KEY,
    date TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
    encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT,
    value TEXT,
    units TEXT,
    type TEXT
);

-- 7. Create allergies table according to allergies.csv
CREATE TABLE allergies (
    allergy_id SERIAL PRIMARY KEY,
    start TIMESTAMP,
    stop TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
    encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT
);

-- 8. Create careplans table according to careplans.csv
CREATE TABLE careplans (
    careplan_id TEXT PRIMARY KEY,
    start TIMESTAMP,
    stop TIMESTAMP,
	patient TEXT REFERENCES patients(patient_id), -- Foreign key
    encounter TEXT REFERENCES encounters(encounter_id), -- Foreign key
    code TEXT,
    description TEXT,
    reason_code TEXT,
    reason_description TEXT
);

-- 9. Create organizations table according to organizations.csv
CREATE TABLE organizations (
    organization_id TEXT PRIMARY KEY,
    name TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
	phone TEXT,
	revenue NUMERIC,
	utilization INTEGER
);

-- 10. Create providers table according to providers.csv
CREATE TABLE providers (
    provider_id TEXT PRIMARY KEY,
    organization TEXT REFERENCES organizations(organization_id), -- Foreign key
    name TEXT,
    gender TEXT,
    speciality TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
	utilization INTEGER
);

-- Loading the csv files into the tables using the 'Import/Export Data' when right-click each table in following order:
-- 1. patients		2. encounters 	3. organizations
-- 4. providers		5. conditions 	6. allergies
-- 7. careplans		8. procedures 	9. medications
-- 10. observations


-- CLEANING
-- 1. Change column names
ALTER TABLE vehicle_data RENAME COLUMN `Electric (EV)` TO EV;
ALTER TABLE vehicle_data RENAME COLUMN `Plug-In Hybrid Electric (PHEV)` TO PHEV;
ALTER TABLE vehicle_data RENAME COLUMN `Hybrid Electric (HEV)` TO HEV;
ALTER TABLE vehicle_data RENAME COLUMN `Ethanol/Flex (E85)` TO E85;
ALTER TABLE vehicle_data RENAME COLUMN `Compressed Natural Gas (CNG)` TO CNG;
ALTER TABLE vehicle_data RENAME COLUMN `Unknown Fuel` TO unknown_fuel;

-- 2. Remove decimal separators

UPDATE vehicle_data
SET 
	EV = REGEXP_REPLACE(EV, ',', ''),
    PHEV = REGEXP_REPLACE(PHEV, ',', ''),
	HEV = REGEXP_REPLACE(HEV, ',', ''),
	Biodiesel = REGEXP_REPLACE(Biodiesel, ',', ''),
	E85 = REGEXP_REPLACE(E85, ',', ''),
	CNG = REGEXP_REPLACE(CNG, ',', ''),
	Propane = REGEXP_REPLACE(Propane, ',', ''),
	Hydrogen = REGEXP_REPLACE(Hydrogen, ',', ''),
	Methanol = REGEXP_REPLACE(Methanol, ',', ''),
    Gasoline = REGEXP_REPLACE(Gasoline, ',', ''),
	Diesel = REGEXP_REPLACE(Diesel, ',', ''),
	unknown_fuel = REGEXP_REPLACE(unknown_fuel, ',', '')
;

-- 3. Trim whitespaces
UPDATE vehicle_data
SET 
	State = TRIM(State),
	EV = TRIM(EV),
	PHEV = TRIM(PHEV),
	HEV = TRIM(HEV),
	Biodiesel = TRIM(Biodiesel),
	E85 = TRIM(E85),
	CNG = TRIM(CNG),
	Propane = TRIM(Propane),
	Hydrogen = TRIM(Hydrogen),
	Methanol = TRIM(Methanol),
    Gasoline = TRIM(Gasoline),
	Diesel = TRIM(Diesel),
	unknown_fuel = TRIM(unknown_fuel)
;

-- 4. Remove empty column
ALTER TABLE vehicle_data
DROP COLUMN methanol;

-- 5. Create cleaned table to export it
CREATE TABLE cleaned_table AS
SELECT *
FROM vehicle_data;
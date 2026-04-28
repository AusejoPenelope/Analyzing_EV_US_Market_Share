SELECT * 
FROM vehicle_data
LIMIT 20;

DESCRIBE vehicle_data;

SELECT COUNT(*) AS total_rows
FROM vehicle_data;

SELECT COUNT(*) AS missing_count
FROM vehicle_data
WHERE EV IS NULL
  OR PHEV IS NULL
  OR HEV IS NULL
  OR Biodiesel IS NULL
  OR E85 IS NULL
  OR CNG IS NULL
  OR Propane IS NULL
  OR Hydrogen IS NULL
  OR Gasoline IS NULL
  OR Diesel IS NULL
  OR unknown_fuel IS NULL
;

SELECT COUNT(*) AS missing_count
FROM vehicle_data
WHERE EV IS NULL
  OR PHEV IS NULL
  OR HEV IS NULL
  OR Biodiesel IS NULL
  OR E85 IS NULL
  OR CNG IS NULL
  OR Propane IS NULL
  OR Hydrogen IS NULL
  OR Gasoline IS NULL
  OR Diesel IS NULL
  OR unknown_fuel IS NULL
;


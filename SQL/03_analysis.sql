SELECT *
FROM vehicle_data;

-- MARKET SHARE ANALYSIS
-- 1. What percentage of vehicles in each state are EVs, PHEVs, HEVs, and gasoline?
WITH Total_market AS
(SELECT 
	State,
    EV,
    PHEV,
    HEV,
    Gasoline,
    (EV + PHEV + HEV + biodiesel + E85 + CNG + Propane + Hydrogen + Gasoline + Diesel + unknown_fuel) AS total_vehicles
FROM vehicle_data
)
SELECT
State,
ROUND((EV / total_vehicles)*100, 2) AS EV_mkt_share,
ROUND((HEV / total_vehicles)*100, 2) AS KEV_mkt_share,
ROUND((PHEV / total_vehicles)*100, 2) AS PHEV_mkt_share,
ROUND((Gasoline / total_vehicles)*100, 2) AS Gasoline_mkt_share
FROM Total_market
ORDER BY State
;

-- 2. Which states have the highest EV adoption rates, and which states lag behind?
-- HIGHEST FIVE
WITH Total_market AS
(SELECT 
	State,
    EV,
    PHEV,
    HEV,
    Gasoline,
    (EV + PHEV + HEV + biodiesel + E85 + CNG + Propane + Hydrogen + Gasoline + Diesel + unknown_fuel) AS total_vehicles
FROM vehicle_data
)
SELECT
State,
ROUND((EV / total_vehicles)*100, 2) AS EV_mkt_share
FROM Total_market
ORDER BY EV_mkt_share DESC
LIMIT 5
;

-- LOWEST FIVE
WITH Total_market AS
(SELECT 
	State,
    EV,
    PHEV,
    HEV,
    Gasoline,
    (EV + PHEV + HEV + biodiesel + E85 + CNG + Propane + Hydrogen + Gasoline + Diesel + unknown_fuel) AS total_vehicles
FROM vehicle_data
)
SELECT
State,
ROUND((EV / total_vehicles)*100, 2) AS EV_mkt_share
FROM Total_market
ORDER BY EV_mkt_share ASC
LIMIT 5
;

-- Which alternative fuels (biodiesel, ethanol, hydrogen) are significant vs. niche?

WITH Total_Mkt AS
(SELECT *,  
(EV + PHEV + HEV + biodiesel + E85 + CNG + Propane + Hydrogen + Gasoline + Diesel + unknown_fuel) AS total_vehicles
FROM vehicle_data)
SELECT State,
ROUND((biodiesel / total_vehicles)*100, 2) AS biodiesel_mkt_share,
ROUND((E85 / total_vehicles)*100, 2) AS E85_mkt_share,
ROUND((hydrogen / total_vehicles)*100, 2) AS hydrogen_mkt_share
FROM Total_Mkt
ORDER BY biodiesel_mkt_share DESC;

-- SIGNIFICANT vs NICHE
WITH alternative_mkt AS
(SELECT State,
ROUND((biodiesel / (biodiesel + E85 + Hydrogen))*100, 2) AS alt_mktshare
FROM vehicle_data
)
SELECT
State, 
CASE 
	WHEN alt_mktshare >= 10 THEN 'Significant'
    WHEN alt_mktshare < 10 THEN 'Niche'
END AS 'Importance'
FROM alternative_mkt
ORDER BY alt_mktshare DESC;

-- Where should policymakers prioritize EV infrastructure investment based on adoption trends and gaps in support?

-- Calculate the percentage of EVs, PHEVs, HEVs, and Gasoline vehicles for each state.
-- Identify the top 5 states with the highest EV adoption rate (EVs as a % of all registered vehicles).
-- Compare EV adoption in California vs. other large states (e.g., Texas, Florida, New York).

SELECT State, EV
FROM vehicle_data
WHERE State = 'California' 
OR State = 'Texas'
OR State = 'Florida'
OR State = 'New York';


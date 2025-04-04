USE beauxbatons;

ALTER TABLE air_pollution 
ADD PRIMARY KEY (id);

ALTER TABLE energy_consumption 
ADD CONSTRAINT fk_air_pollution 
FOREIGN KEY (id) REFERENCES air_pollution(id) ON DELETE CASCADE;

SELECT * FROM energy_consumption;
SELECT * FROM air_pollution;

-- Compare carbon emissions in millions of tons to the CO air pollution in each country per year. 

SELECT e.country, e.carbon_emissions_million_tons, a.co
FROM energy_consumption e
JOIN air_pollution a ON e.id = a.id;

-- See how total CO pollution is progressing over time
SELECT 
    e.year, 
    SUM(a.co) AS total_co_pollution
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
GROUP BY 
    e.year
ORDER BY 
    e.year;

-- Find out total CO pollution per country in the 4 years
SELECT 
    e.country, 
    SUM(a.co) AS total_co_pollution
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
GROUP BY 
    e.country
ORDER BY 
    total_co_pollution DESC
LIMIT 10;

-- Find out progression of carbon emissions and CO pollution per country by year
SELECT 
    e.country, 
    e.year, 
    e.carbon_emissions_million_tons, 
    a.co
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
ORDER BY 
    e.country, e.year;

-- Find out progression of fossil fuel dependency % and CO pollution per country by year
SELECT 
    e.country, 
    e.year, 
    e.`fossil_fuel_dependency_%`, 
    a.co
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
ORDER BY 
    e.country, e.year;

-- Find out progression of industrial energy use % and CO pollution per country by year
SELECT 
    e.country, 
    e.year, 
    e.`industrial_energy_use_%`, 
    a.co
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
ORDER BY 
    e.country, e.year;

-- Find out progression of renewable energy share % and CO pollution per country by year
SELECT 
    e.country, 
    e.year, 
    e.`renewable_energy_share_%`, 
    a.co
FROM 
    energy_consumption e
JOIN 
    air_pollution a ON e.id = a.id
ORDER BY 
    e.country, e.year;

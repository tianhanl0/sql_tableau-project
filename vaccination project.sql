# check relationship between several columns
SELECT location, date, total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters
FROM covidvaccinations
WHERE total_vaccinations <> ''
order by 1,2;

SELECT location, Max(people_vaccinated), Max(people_fully_vaccinated), Max(total_boosters)
FROM covidvaccinations
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY 1;

SELECT Sum(people_vaccinated) people_vaccinated, Sum(people_fully_vaccinated) people_fully_vaccinated, Sum(total_boosters) total_boosters
FROM (SELECT location, Max(cast(people_vaccinated as decimal)) people_vaccinated, Max(cast(people_fully_vaccinated as decimal)) people_fully_vaccinated, Max(cast(total_boosters as decimal)) total_boosters
FROM covidvaccinations
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY 1) a;

#total_global_view
SELECT Sum(people_vaccinated) people_vaccinated, Sum(people_fully_vaccinated) people_fully_vaccinated, Sum(total_boosters) total_boosters
FROM (SELECT location, Max(cast(people_vaccinated as decimal)) people_vaccinated, Max(cast(people_fully_vaccinated as decimal)) people_fully_vaccinated, Max(cast(total_boosters as decimal)) total_boosters
FROM covidvaccinations
WHERE continent <> ''
GROUP BY 1) a;

SELECT Sum(population) population
FROM (SELECT location, Max(cast(population as decimal)) population
FROM coviddeath
WHERE continent <> ''
GROUP BY 1) b;

SELECT people_vaccinated, people_fully_vaccinated, total_boosters, people_fully_vaccinated/population as VaccinatedPercentage, total_boosters/population as BoosterPercentage
FROM (SELECT Sum(people_vaccinated) people_vaccinated, Sum(people_fully_vaccinated) people_fully_vaccinated, Sum(total_boosters) total_boosters
FROM (SELECT location, Max(cast(people_vaccinated as decimal)) people_vaccinated, Max(cast(people_fully_vaccinated as decimal)) people_fully_vaccinated, Max(cast(total_boosters as decimal)) total_boosters
FROM covidvaccinations
WHERE continent <> ''
GROUP BY 1) a) a, (SELECT Sum(population) population
FROM (SELECT location, Max(cast(population as decimal)) population
FROM coviddeath
WHERE continent <> ''
GROUP BY 1) b) b;

SELECT location, Max(cast(people_vaccinated as decimal)) people_vaccinated, Max(cast(people_fully_vaccinated as decimal)) people_fully_vaccinated, Max(cast(total_boosters as decimal)) total_boosters
FROM covidvaccinations
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY 1;

SELECT continent, location, people_fully_vaccinated/population as vaccinatedpercentage
FROM (SELECT continent, location, Max(cast(people_vaccinated as decimal)) people_vaccinated, Max(cast(people_fully_vaccinated as decimal)) people_fully_vaccinated, Max(cast(total_boosters as decimal)) total_boosters
FROM covidvaccinations
WHERE continent <> ''
GROUP BY 1,2) a
JOIN (SELECT continent, location, Max(cast(population as decimal)) population
FROM coviddeath
WHERE continent <> ''
GROUP BY 1,2) b USING (continent, location);

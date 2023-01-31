#get a whole picture of the data
SELECT *
FROM coviddeath;

SELECT *
FROM covidvaccinations;

# check the case percentage  (total cases vs population)
SELECT location, date, total_cases, population, (total_cases/population)*100  as CasePercentage
FROM coviddeath
# we could look for specific country using where clause
WHERE location like '%state%'
order by 1,2;

# check total death count for each countries
SELECT location, Max(cast(total_deaths as decimal)) as TotalDeathCount
FROM coviddeath
# this where clause is used to exclude continent
# we look at counties only in this case
WHERE continent <> ''
GROUP BY location
order by totaldeathcount desc;

# check death percentage ( total_deaths vs total_cases) for each continent
SELECT location, MAX(cast(total_deaths as decimal)/total_cases)*100 as Deathpercentage
FROM coviddeath
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY location
order by Deathpercentage desc;

SELECT location, date, population, total_cases, total_deaths
FROM coviddeath
where continent <> ''
ORDER BY 1, 2;

# check vaccination percentage 
SELECT continent, location, Max(total_vaccinations/population)*100 as vaccination_percentage
FROM new_vaccinations
GROUP BY 1,2;

# create views for visualization in Tableau
CREATE VIEW `total_deathpercentage` AS (SELECT Sum(new_cases) as total_cases, Sum(cast(new_deaths as decimal)) as total_deaths, Sum(cast(new_deaths as decimal))/Sum(new_cases)*100 as DeathPercentage
FROM coviddeath
where continent <> ''
ORDER BY 1, 2);

CREATE VIEW `total_deathcount` AS (SELECT location, MAX(cast(total_deaths as decimal)) as TotalDeathCount
FROM coviddeath
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY location
order by totaldeathcount desc);

CREATE VIEW `percent_population_infected` AS (SELECT location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
FROM coviddeath
GROUP BY location, population
order by percentpopulationinfected desc);

CREATE VIEW `percent_population_infected_date` AS (SELECT location, population, date,  Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
FROM coviddeath
GROUP BY location, population, date
order by percentpopulationinfected desc);

CREATE VIEW `new_vaccinations` AS (SELECT d.continent, d.location, d.date, population, Sum(new_vaccinations) Over(Partition by d.location Order by d.date) as total_vaccinations
FROM coviddeath d
JOIN covidvaccinations USING (location, date)
WHERE d.continent <> ''
ORDER BY  2,3);




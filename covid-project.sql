SELECT *
FROM coviddeath;

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100  as DeathPercentage
FROM coviddeath
WHERE location like '%state%'
order by 1,2;

SELECT location, date, total_cases, population, (total_cases/population)*100  as CasePercentage
FROM coviddeath
WHERE location like '%state%'
order by 1,2;

SELECT location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
FROM coviddeath
GROUP BY location, population
order by percentpopulationinfected desc;

SELECT location, Max(cast(total_deaths as decimal)) as TotalDeathCount
FROM coviddeath
WHERE continent <> ''
GROUP BY location
order by totaldeathcount desc;

SELECT location, MAX(cast(total_deaths as decimal)) as TotalDeathCount
FROM coviddeath
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY location
order by totaldeathcount desc;

SELECT location, MAX(cast(total_deaths as decimal)/total_cases)*100 as Deathpercentage
FROM coviddeath
WHERE location IN ('Europe', 'North America', 'South America', 'Asia', 'Africa', 'Oceania')
GROUP BY location
order by Deathpercentage desc;

SELECT date, Sum(new_cases) as total_cases, Sum(cast(new_deaths as decimal)) as total_deaths, Sum(cast(new_deaths as decimal))/Sum(new_cases)*100 as DeathPercentage
FROM coviddeath
WHERE continent <> ''
GROUP BY date
ORDER BY 1;

with popvsvac as (SELECT d.continent, d.location, d.date, population, Sum(new_vaccinations) Over(Partition by d.location Order by d.date) as total_vaccinations
FROM coviddeath d
JOIN covidvaccinations USING (location, date)
WHERE d.continent <> ''
ORDER BY  2,3)

SELECT continent, location, Max(total_vaccinations/population)*100 as vaccination_percentage
FROM new_vaccinations
GROUP BY 1,2;


# SQL Tableau Project
· Covid deaths and vaccination time series data 

· data source: https://ourworldindata.org/covid-deaths

· time range: from 2020-02 to 2023-01

· two main parts: Covid case and death report & Covid vaccination and death report

## Covid case and death report 

· followed by Alex youtube video: https://www.youtube.com/watch?v=qfyynHBFOsM&list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f&index=1

### SQL part

· transferred raw data into two tables (covid deaths and covid vaccination) and import csv version into MySQL Workbench

· explored death percentage, death count, population infected and people vaccinated in different group (continent, date, country)

### Tableau part

· linked tables/views in MySQL Workbench with Tableau Desktop, adjusted visual chart by the types of variables in each tables/views

· used text table to get a sense of total cases, total deaths and total death percentage worldwide

· applied maps to visualize population infected percent for each countries

· assigned bar chart to analyze total death count throughout continent

· utilized line chart to comprehend increasement of population infected trend percent through time for specific countries

<img width="988" alt="截屏2023-01-30 20 20 35" src="https://user-images.githubusercontent.com/112505253/215634793-29461058-438b-4f50-b6b0-6d8267405c61.png">

## Covid vaccination and death report 

· finished independently with some additional thought

### SQL part

· explored vaccinated, fully vaccinated (two vaccinations) and boosters percentages in different group (continent, date, country)

· found out the optimal visualizable relationship between vaccination percentage and death (new_cases) rate

### Tableau part

· used text table to get a global sense of people (fully) vaccinated and booster percentage worldwide

· applied maps to visualize the fully vaccination percentage cross countries

· assigned treemap to analyze total vaccinated count throughout continent

· utilized multi-line chart to comprehend the relationship between vaccination and death rate for indivisual countries selected

· created linkage filter in dashboard between vaccination percentage (maps) and vaccination and death rate (multi-line chart), built a perceptual intuition

<img width="977" alt="截屏2023-01-30 20 27 12" src="https://user-images.githubusercontent.com/112505253/215635769-984b872b-15d1-4f62-bcd9-c9ee9340c45e.png">

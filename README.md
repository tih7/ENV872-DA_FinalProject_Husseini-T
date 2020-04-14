# ENV872-DA_FinalProject_Husseini-T

## Summary

The aim of the project is to investigate and report on the effects of environmental indicators on community health characteristics in the State of California using the CalEnviroScreen 3.0 data set. All project related materials can be found within this repository. 

## Investigators

Tamera Husseini 

Master of Environmental Management, CEM

Nicholas School of the Environment, Duke University

tamera.husseini@duke.edu

## Keywords

Environmental Justice, Public Health, California, Environmental Indicators

## Database Information

Environmental, health and socioeconomic indicator data was downloaded from CalEnviroScreen 3.0, an environmental justice mapping tool used by the State of California. The tool was designed to help identify California communities that are most affected by many sources of pollution. The indicator data is used to derive a rank score; an area with a high score is one that experiences a much higher pollution burden than areas with low scores.  The data is divided along 2010 census tract boundaries. The data set was last updated in 2018.

More information about CalEnviroScreen 3.0 can be found here: https://oehha.ca.gov/calenviroscreen/about-calenviroscreen

Data was downloaded on 2020-04-14. 

## Folder structure, file formats, and naming conventions 


1. The **data** folder contains two sub-folders, **data_raw** and **data_processed** data.  All data files are saved as .csv. 
2. The **scripts** folder contains all R scripts (.R, .Rmd etc.) used for data wrangling and project analysis. 
3. The **output** folder contains visuals saved as .png
4. The **docs** folder contains the final project report and a sub-folder called **docs_supplement**. The sub-folder contains project related supplementary materials such as PDF reports, word docs etc.  


All file naming conventions are as follows:

`Date_FileName_Source_Version.format`

  *Date*: the date the document was created given as YYYY-MM-DD.

  *FileName*: a brief descriptive title of the file's contents.

  *Source*: the source of the document of data or, althernatively, the initials of the document author.

  *Version*: the version number or decriptor e.g. v1, v2, draft, final etc. 

  *Format*: refers to the files extension e.g. csv, txt etc.  

## Metadata

The data is saved as single csv file titled "2020-04-14_CalEnviroScreen" and can be found in the **data_raw** subfolder. An Excel file version of the data can be also be found in the **docs_supplement** folder. 

##### Data variables ##### 

Geographic and Demographic Data:

* Census Tract: Census tract ID from the 2010 census.
* Total Population: 2010 census tract population
* California County: California county name in which the tract is located
* ZIP: Postal zip code in which tract is located
* Nearby City: closest city to census tract to help approximate census tract location
* Longtitude:Longtitude at the center of the census tract in decimal degrees
* Latitude: Latitude of the census in decimal degrees

* CES 3.0 Score: CalEnviroScreen Score, Pollution Score multiplied by Population Characteristics Score
* CES 3.0 Percentile: Percentile of the CalEnviroScreen score
* CES 3.0 Percentile Range: Percentile of the CalEnviroScreen score
* SB 535 Disadvantaged Community: Disadvantaged communities list from:
https://oehha.ca.gov/calenviroscreen/sb535
http://www.calepa.ca.gov/EnvJustice/GHGInvest/ 


Exposure Indicators: 

* Ozone: Amount of daily max. 8hr Ozone concentration
* PM2.5: Annual mean PM 2.5 concentration
* Diesel PM: Diesel PM emission from on-road and non-road sources
* Drinking Water: Drinking water contaminant index for selected contaminnats
* Pesticides: Total pounds of selected active pesticide ingredients (filtered for hazard and volatility) used in production-agriculture per square mile in the census tract. 
* Tox. Release: Toxicity-weighted concentrations of modeled chemical releases to air from facility emissions and off-site incineration (from RSEI)
* Traffic: Traffic density, in vehicle-kilometers per hour per road length, within 150 meters of the census tract boundary

Environmental Effects Indicators:

* Cleanup Sites: Traffic density, in vehicle-kilometers per hour per road length, within 150 meters of the census tract boundary
* Groundwater Threats:Groundwater threats, sum of weighted GeoTracker leaking underground storage tank sites  within buffered distances to populated blocks of census tracts
* Haz. Waste: Sum of weighted hazardous waste facilities and large quantity generators within buffered distances to populated blocks of census tracts.
*Imp. Water Bodies: Impaired water bodies, sum of number of pollutants across all impaired water bodies within buffered distances to populated blocks of census tracts. 
* Solid Waste:Sum of weighted hazardous waste facilities and large quantity generators within buffered distances to populated blocks of census tracts

Sensitive Population Indicators:

* Asthma: Age-adjusted rate of emergency department visits for asthma
* Low Birth Weight: Percent low birth weigth
* Cardiovascular Disease: Age-adjusted rate of emergency dept. visits for heart attacks per 10,000.

Socio-economic Factor Indicators:

* Education: Percent of population living below two times the federal poverty level
* Linguistic Isolation: Percent limited English speaking households.
* Poverty: Percent of population living below two times the federal poverty level.
* Unemployment: Percent of the population over the age of 16 that is unemployed and eligible for the labor force.
* Housing Burden: Percent housing burdened low income households. 

<For each data file in the repository, describe the data contained in each column. Include the column name, a description of the information, the class of data, and any units associated with the data. Create a list or table for each data file.> 

## Scripts and code

1. Data wrangling
2. Analysis
3. Visualisations

## Quality assurance/quality control

<describe any relevant QA/QC procedures taken with your data. Some ideas can be found here:>
<https://www.dataone.org/best-practices/develop-quality-assurance-and-quality-control-plan>
<https://www.dataone.org/best-practices/ensure-basic-quality-control>
<https://www.dataone.org/best-practices/communicate-data-quality>
<https://www.dataone.org/best-practices/identify-outliers>
<https://www.dataone.org/best-practices/identify-values-are-estimated>

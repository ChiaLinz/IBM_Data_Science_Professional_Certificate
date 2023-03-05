/*
Instructions
As a hands on Assignment, you will be working on a real world dataset provided by the Chicago Data Portal. Imagine, you have been hired by a non-profit organization that strives to improve educational outcomes for children and youth in the City of Chicago. Your job is to analyze the census, crime, and school data for a given neighborhood or district. You will identify causes that impact the enrollment, safety, health, environment ratings of schools.

You will be asked questions that will help you understand the data just like a data analyst or data scientist would. You will be assessed both on the correctness of your SQL queries and results.

A Python based Jupyter notebook has been provided to help with completing this assignment. Follow the instructions to complete all the problems. Then share the Queries and Results with your peers for reviewing.

Step-By-Step Assignment Instructions
Assignment Topic:
In this assignment, you will download the datasets provided, load them into a database, write and execute SQL queries to answer the problems provided, and upload a screenshot showing the correct SQL query and result for review by your peers. A Jupyter notebook is provided in the preceding lesson to help you with the process.

This assignment involves 3 datasets for the city of Chicago obtained from the Chicago Data Portal:

1. Chicago Socioeconomic Indicators

This dataset contains a selection of six socioeconomic indicators of public health significance and a hardship index, by Chicago community area, for the years 2008 ¡V 2012.

2. Chicago Public Schools

This dataset shows all school level performance data used to create CPS School Report Cards for the 2011-2012 school year.

3. Chicago Crime Data

This dataset reflects reported incidents of crime (with the exception of murders where data exists for each victim) that occurred in the City of Chicago from 2001 to present, minus the most recent seven days.

Instructions:
1. Review the datasets

Before you begin, you will need to become familiar with the datasets. Snapshots for the three datasets in .CSV format can be downloaded from the following links:

Chicago Socioeconomic Indicators: Click here (https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/FinalModule_Coursera_V5/data/ChicagoCensusData.csv?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork22-2022-01-01)

Chicago Public Schools: Click here (https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/FinalModule_Coursera_V5/data/ChicagoPublicSchools.csv?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork22-2022-01-01)

Chicago Crime Data: Click here (https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DB0201EN-SkillsNetwork/labs/FinalModule_Coursera_V5/data/ChicagoCrimeData.csv?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork22-2022-01-01)

NOTE: Ensure you have downloaded the datasets using the links above instead of directly from the Chicago Data Portal. The versions linked here are subsets of the original datasets and have some of the column names modified to be more database friendly which will make it easier to complete this assignment. The CSV file provided above for the Chicago Crime Data is a very small subset of the full dataset available from the Chicago Data Portal. The original dataset is over 1.55GB in size and contains over 6.5 million rows. For the purposes of this assignment you will use a much smaller sample with only about 500 rows.

2. Load the datasets into a database

Perform this step using the LOAD tool in the Db2 console. You will need to create 3 tables in the database, one for each dataset, named as follows, and then load the respective .CSV file into the table:

CENSUS_DATA

CHICAGO_PUBLIC_SCHOOLS

CHICAGO_CRIME_DATA

To load the data into the tables the steps are similar to Week 2 Lab 1 Part II. The only difference with that lab is that in Step 5 of the instructions you will need to click on create (+) New Table and specify the name of the table you want to create and then click Next.

*/

/*
3. Write and execute queries

Perform this step in the Jupyter notebook provided in the previous section. Carefully read and understand each problem. Compose and execute the appropriate SQL queries to answer each of the problems. Take a screenshot of each query and its results and save it as a jpg file..

Problem 1: Find the total number of crimes recorded in the CRIME table.

Problem 2: List community areas with per capita income less than 11000.

Problem 3: List all case numbers for crimes involving minors?

Problem 4: List all kidnapping crimes involving a child?(children are not considered minors for the purposes of crime analysis)

Problem 5: What kind of crimes were recorded at schools?

Problem 6: List the average safety score for all types of schools.

Problem 7: List 5 community areas with highest % of households below poverty line.

Problem 8: Which community area(number) is most crime prone?

Problem 9: Use a sub-query to find the name of the community area with highest hardship index.

Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?

*/

USE Chicago
GO

-- Problem 1: Find the total number of crimes recorded in the CRIME table.

select count(*) 
from CHICAGOCRIMEDATA;


-- Problem 2: List community areas with per capita income less than 11000.

SELECT COMMUNITY_AREA_NAME 
FROM CHICAGOCENSUSDATA WHERE PER_CAPITA_INCOME < 11000;


-- Problem 3: List all case numbers for crimes involving minors?

SELECT DISTINCT CASE_NUMBER
FROM CHICAGOCRIMEDATA WHERE DESCRIPTION LIKE '%MINOR%';


-- Problem 4: List all kidnapping crimes involving a child?(children are not considered minors for the purposes of crime analysis)

SELECT DISTINCT CASE_NUMBER, PRIMARY_TYPE, DATE, DESCRIPTION 
FROM CHICAGOCRIMEDATA 
WHERE PRIMARY_TYPE='KIDNAPPING';


-- Problem 5: What kind of crimes were recorded at schools?

SELECT DISTINCT(PRIMARY_TYPE), LOCATION_DESCRIPTION 
FROM CHICAGOCRIMEDATA 
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%';


-- Problem 6: List the average safety score for all types of schools.

ALTER TABLE CHICAGOPUBLICSCHOOLS
ALTER COLUMN SAFETY_SCORE int;

SELECT Elementary_Middle_or_High_School, AVG(SAFETY_SCORE) as AVERAGE_SAFETY_SCORE 
FROM CHICAGOPUBLICSCHOOLS 
GROUP BY  Elementary_Middle_or_High_School;


-- Problem 7: List 5 community areas with highest % of households below poverty line.

SELECT TOP 5 COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY 
FROM CHICAGOCENSUSDATA 
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC;


-- Problem 8: Which community area(number) is most crime prone?

SELECT Top 1 COMMUNITY_AREA_NUMBER ,COUNT(COMMUNITY_AREA_NUMBER) AS FREQUENCY
FROM CHICAGOCRIMEDATA 
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC;


-- Problem 9: Use a sub-query to find the name of the community area with highest hardship index.

SELECT COMMUNITY_AREA_NAME 
FROM  CHICAGOCENSUSDATA 
WHERE HARDSHIP_INDEX = (SELECT MAX(HARDSHIP_INDEX) FROM CHICAGOCENSUSDATA);


-- Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?

SELECT TOP 1 community_area_name 
FROM CHICAGOCENSUSDATA
WHERE COMMUNITY_AREA_NUMBER = (SELECT TOP 1 COMMUNITY_AREA_NUMBER FROM CHICAGOCENSUSDATA
    GROUP BY COMMUNITY_AREA_NUMBER
    ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC);
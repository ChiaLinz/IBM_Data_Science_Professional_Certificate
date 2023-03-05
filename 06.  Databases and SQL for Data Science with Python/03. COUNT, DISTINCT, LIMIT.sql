/*
Hands-on Lab : COUNT, DISTINCT, LIMIT
Estimated time needed: 35 minutes

In this lab, you will learn a few useful expressions that are used with SELECT statements. First, you will learn COUNT, which is an aggregate function that retrieves the number of rows that matches the query criteria. Next, you will learn DISTINCT, which is used to remove duplicate values from a specified result set and only return the unique values. Lastly, you will learn LIMIT, which is used for restricting the number of rows retrieved from the table.


Software Used in this Lab
In this lab, you will use Datasette , an open source multi-tool for exploring and publishing data.


Database Used in this Lab
The database used in this lab comes from the following dataset source: Film Locations in San Francisco under a PDDL: Public Domain Dedication and License(.


Objectives
After completing this lab, you will be able to:

Retrieve the number of rows that match a query criteria
Remove duplicate values from a result set and return the unique values
Restrict the number of rows retrieved from a table

*/

USE IBM_Data_Science_SQL
GO


-- Exercise 1: COUNT

--- Task A: Example exercises on COUNT

---- Q: Retrieve the number of rows from the "FilmLocations" table.

SELECT COUNT(*) 
FROM Film_Locations_in_San_Francisco;


---- Q: Retrieve the number of locations of the films which are written by James Cameron.

SELECT COUNT(Locations) 
FROM Film_Locations_in_San_Francisco
WHERE Writer= 'James Cameron';


--- Task B: Practice exercises on COUNT

---- Q: Retrieve the number of locations of the films which are directed by Woody Allen.

SELECT COUNT(Locations) 
FROM Film_Locations_in_San_Francisco
WHERE Director= 'Woody Allen';


---- Q: Retrieve the number of films shot at Russian Hill.

SELECT Count(Title) 
FROM Film_Locations_in_San_Francisco
WHERE Locations = 'Russian Hill';


---- Q: Retrieve the number of rows having a release year older than 1950 from the "FilmLocations" table.

SELECT Count(*) 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year<1950;


-- Exercise 2: DISTINCT

--- Task A: Example exercises of DISTINCT

---- Q: Retrieve the name of all films without any repeated titles.

SELECT DISTINCT Title 
FROM Film_Locations_in_San_Francisco;


---- Q: Retrieve the number of release years of the films distinctly, produced by Warner Bros. Pictures.

SELECT COUNT(DISTINCT Release_Year) 
FROM Film_Locations_in_San_Francisco
WHERE Production_Company = 'Warner Bros. Pictures';


--- Task B: Practice exercises on DISTINCT

---- Q: Retrieve the name of all unique films released in the 21st century and onwards, along with their release years.

SELECT DISTINCT Title, Release_Year 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year>=2001;


---- Q: Retrieve the names of all the directors and their distinct films shot at City Hall.

SELECT DISTINCT Title, Director 
FROM Film_Locations_in_San_Francisco
WHERE Locations = 'City Hall';


---- Q: Retrieve the number of distributors distinctly who distributed films acted by Clint Eastwood as 1st actor.

SELECT COUNT(DISTINCT Distributor) 
FROM Film_Locations_in_San_Francisco
WHERE Actor1 = 'Clint Eastwood';


-- Exercise 3: LIMIT

--- Task A: Example exercises of LIMIT

---- Q: Retrieve the first 25 rows from the "FilmLocations" table.

SELECT TOP 25 * 
FROM Film_Locations_in_San_Francisco;


---- Q: Retrieve the first 15 rows from the "FilmLocations" table starting from row 11.

SELECT TOP 15 TITLE
FROM Film_Locations_in_San_Francisco
WHERE TITLE NOT IN (
		SELECT TOP 10 TITLE
		FROM Film_Locations_in_San_Francisco);


--- Task B: Practice exercises on LIMIT

---- Q: Retrieve the name of first 50 films distinctly.

SELECT DISTINCT TOP 50 Title 
FROM Film_Locations_in_San_Francisco;


---- Q: Retrieve first 10 film names distinctly released in 2015.

SELECT DISTINCT TOP 10 Title 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year=2015;


---- Q: Retrieve the next 3 film names distinctly after first 5 films released in 2015.

SELECT DISTINCT TOP 3 Title 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year = 2015 and
	  Title not in (
		SELECT DISTINCT Top 5 Title 
		FROM Film_Locations_in_San_Francisco
		WHERE Release_Year = 2015);



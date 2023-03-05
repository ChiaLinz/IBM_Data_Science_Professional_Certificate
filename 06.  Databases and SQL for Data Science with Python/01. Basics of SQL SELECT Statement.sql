/*
Hands-on Lab : Basics of SQL SELECT Statement
Estimated time needed: 20 minutes

In this lab, you will learn one of the most commonly used statements of SQL (Structured Query Language), the SELECT statement. The SELECT statement is used to select data from a database.


How does the syntax of a SELECT statement look?

SELECT column1, column2, ...
FROM table_name
WHERE condition
;

What do the keywords / clauses of a SQL statement shown above do?

FROM: Specifies from which table to get the data. The clause can include optional JOIN subclauses to specify the rules for joining tables.
[Optional Clause] WHERE : Specifies which rows to retrieve.

Why is there a semicolon after the SQL statements?

Some database systems require a semicolon at the end of each SQL statement for execution. It is a standard way to separate one SQL statement from another which allows more than one SQL statement to be executed in the same call to the server. So, it is good practice to use a semicolon at the end of each SQL statement.

Software Used in this Lab
In this lab, you will use Datasette , an open source multi-tool for exploring and publishing data.


Database Used in this Lab
The database used in this lab comes from the following dataset source: Film Locations in San Francisco(https://data.sfgov.org/Culture-and-Recreation/Film-Locations-in-San-Francisco/yitu-d5am?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork22-2022-01-01) under a PDDL: Public Domain Dedication and License(https://opendatacommons.org/licenses/pddl/1-0/?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursesIBMDeveloperSkillsNetworkDB0201ENSkillsNetwork22-2022-01-01).


Objectives
After completing this lab, you will be able to:

Query a database
Retrieve data records from one or more tables of a database as resultset according to the criteria you specify

*/

USE IBM_Data_Science_SQL
GO

-- Task A: Exploring the Database
--- Let us first explore the SanFranciscoFilmLocations database using the Datasette tool:

--- If the first statement listed below is not already in the Datasette textbox on the right, then copy the code below by clicking on the little copy button on the bottom right of the codeblock below and then paste it into the textbox of the Datasette tool using either Ctrl+V or right-click in the text box and choose Paste.

/*
FilmLocations(
    Title:              titles of the films, 
    ReleaseYear:        time of public release of the films, 
    Locations:          locations of San Francisco where the films were shot, 
    FunFacts:           funny facts about the filming locations, 
    ProductionCompany:  companies who produced the films, 
    Distributor:        companies who distributed the films, 
    Director:           people who directed the films, 
    Writer:             people who wrote the films, 
    Actor1:             person 1 who acted in the films, 
    Actor2:             person 2 who acted in the films, 
    Actor3:             person 3 who acted in the films
)
*/


-- Task B: Example exercises on SELECT statement

-- Q1: Retrieve all records with all columns from the "FilmLocations" table.

SELECT * 
FROM Film_Locations_in_San_Francisco;


-- Q2: Retrieve the names of all films with director names and writer names.

SELECT Title, Director, Writer 
FROM Film_Locations_in_San_Francisco;


-- Q3: Retrieve the names of all films released in the 21st century and onwards (release years after 2001 including 2001), along with filming locations and release years.

SELECT Title, Release_Year, Locations 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year>=2001;


-- Task C: Practice exercises on SELECT statement

-- Q4: Retrieve the fun facts and filming locations of all films.

SELECT Locations, Fun_Facts 
FROM Film_Locations_in_San_Francisco;


-- Q5: Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000) that, along with filming locations and release years.

SELECT Title, Release_Year, Locations 
FROM Film_Locations_in_San_Francisco
WHERE Release_Year<=2000;


-- Q6: Retrieve the names, production company names, filming locations, and release years of the films which are not written by James Cameron.

SELECT Title, Production_Company, Locations, Release_Year, Writer 
FROM Film_Locations_in_San_Francisco
WHERE Writer not like ('James Cameron');
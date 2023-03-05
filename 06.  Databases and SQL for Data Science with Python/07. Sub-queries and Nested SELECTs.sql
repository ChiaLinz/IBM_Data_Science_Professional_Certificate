/*
Hands-on Lab : Sub-queries and Nested SELECTs
Estimated time needed: 20 minutes

In this lab, you will run through some SQL practice problems that will provide hands-on experience with nested SQL SELECT statements (also known as Sub-queries).


How does a typical Nested SELECT statement syntax look?

SELECT column_name [, column_name ]
FROM table1 [, table2 ]
WHERE column_name OPERATOR
   (SELECT column_name [, column_name ]
   FROM table1 [, table2 ]
   WHERE condition);

Software Used in this Lab
In this lab, you will use an IBM Db2 Database. Db2 is a Relational Database Management System (RDBMS) from IBM, designed to store, analyze and retrieve data efficiently.

To complete this lab you will utilize a Db2 database service on IBM Cloud. If you did not already complete this lab task earlier in this module, you will not yet have access to Db2 on IBM Cloud, and you will need to follow the lab below first:

Hands-on Lab : Sign up for IBM Cloud, Create Db2 service instance and Get started with the Db2 console
Database Used in this Lab
The database used in this lab is an internal database. You will be working on a sample HR database. This HR database schema consists of 5 tables called EMPLOYEES, JOB_HISTORY, JOBS, DEPARTMENTS and LOCATIONS. Each table has a few rows of sample data. The following diagram shows the tables for the HR database:


NOTE: This lab requires you to have all 5 of these tables of the HR database populated with sample data on Db2. If you didn't complete the earlier lab in this module, you won't have the tables above populated with sample data on Db2, so you will need to go through the lab below first:

Hands-on Lab : Create tables using SQL scripts and Load data into tables
Objectives
After completing this lab you will be able to:

Write SQL queries that demonstrate the necessity of using sub-queries
Compose sub-queries in the where clause
Build Column Expressions (i.e. sub-query in place of a column)
Write Table Expressions (i.e. sub-query in place of a table)
NOTE : Make sure that you are using the CSV file and datasets from the same instruction file.
Instructions
When you approach the exercises in this lab, follow the instructions to run the queries on Db2:

Go to the Resource List of IBM Cloud by logging in where you can find the Db2 service instance that you created in a previous lab under Services section. Click on the Db2-xx service. Next, open the Db2 Console by clicking on Open Console button. Click on the 3-bar menu icon in the top left corner and go to the Run SQL page. The Run SQL tool enables you to run SQL statements.

If needed, follow Hands-on Lab : Sign up for IBM Cloud, Create Db2 service instance and Get started with the Db2 console

*/

-- Exercise:

---- Q: Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.

select * 
from employees 
where salary < AVG(salary);


---- Q: Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.

select EMP_ID, F_NAME, L_NAME, SALARY 
from employees 
where SALARY < (select AVG(SALARY) 
                from employees);


---- Q: Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

select EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
from employees;


---- Q: Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.

select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;


---- Q: Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;
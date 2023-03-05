/*
Hands-on Lab: Using Views
Estimated time needed: 10 minutes

In this lab, you will learn about using views. In SQL, a view is an alternative way of representing data that exists in one or more tables. Just like a real table, it contains rows and columns. The fields in a view are fields from one or more real tables in the database. Though views can be queried like a table, views are dynamic; only the definition of the view is stored, not the data.


How does the syntax of a CREATE VIEW statement look?

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

How does the syntax of a REPLACE VIEW statement look?

CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

How does the syntax of a DROP VIEW statement look?

DROP VIEW view_name;

Objectives
After completing this lab, you will be able to:

Create a View and show a selection of data for a given table
Update a View to combine two or more tables in meaningful ways
Drop a created View
Instructions
When you approach the exercises in this lab, follow the instructions to run the queries on Db2:

Go to the Resource List of IBM Cloud by logging in where you can find the Db2 service instance that you created in a previous lab under Services section. Click on the Db2-xx service. Next, open the Db2 Console by clicking on Open Console button. Click on the 3-bar menu icon in the top left corner and go to the Run SQL page. The Run SQL tool enables you to run SQL statements.

If needed, follow Hands-on Lab : Sign up for IBM Cloud, Create Db2 service instance and Get started with the Db2 consolezz

*/

-- Exercise 1: Create a View

---- Q: Let's create a view called EMPSALARY to display salary along with some basic sensitive data of employees from the HR database. To create the EMPSALARY view from the EMPLOYEES table, copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

CREATE VIEW EMPSALARY AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES; 


---- Q: Using SELECT, query the EMPSALARY view to retrieve all the records. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

SELECT * FROM EMPSALARY;


-- Exercise 2: Update a View

---- Q: It now seems that the EMPSALARY view we created in exercise 1 doesn't contain enough salary information, such as max/min salary and the job title of the employees. Let's update the EMPSALARY view: 
/*
combining two tables EMPLOYEES and JOBS so that we can display our desired information from the HR database.
including the columns JOB_TITLE, MIN_SALARY, MAX_SALARY of the JOBS table as well as excluding the SALARY column of the EMPLOYEES table.
*/
CREATE OR REPLACE VIEW EMPSALARY  AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

---- Q: Using SELECT, query the updated EMPSALARY view to retrieve all the records. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

SELECT * FROM EMPSALARY;


-- Exercise 3: Drop a View

---- Q: Let's delete the created EMPSALARY view. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

DROP VIEW EMPSALARY;


---- Q: Using SELECT, you can verify whether the EMPSALARY view has been deleted or not. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

SELECT * FROM EMPSALARY;
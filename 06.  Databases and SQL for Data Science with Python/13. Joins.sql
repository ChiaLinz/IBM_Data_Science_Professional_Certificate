/*Hands-on Lab: Joins
Estimated time needed: 25 minutes

In this lab, you will run through some SQL practice problems that will provide hands-on experience with the different kinds of join operations.


How does a CROSS JOIN (also known as Cartesian Join) statement syntax look?

SELECT column_name(s)
FROM table1
CROSS JOIN table2;

How does an INNER JOIN statement syntax look?

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
WHERE condition;

How does a LEFT OUTER JOIN statement syntax look?

SELECT column_name(s)
FROM table1
LEFT OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

How does a RIGHT OUTER JOIN statement syntax look?

SELECT column_name(s)
FROM table1
RIGHT OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

How does a FULL OUTER JOIN statement syntax look?

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

How does a SELF JOIN statement syntax look?

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

*/

-- Exercise

---- Q: Select the names and job start dates of all employees who work for the department number 5.

select E.F_NAME,E.L_NAME, JH.START_DATE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
where E.DEP_ID ='5';


---- Q: Select the names, job start dates, and job titles of all employees who work for the department number 5.

select E.F_NAME,E.L_NAME, JH.START_DATE, J.JOB_TITLE 
from EMPLOYEES as E 
INNER JOIN JOB_HISTORY as JH on E.EMP_ID=JH.EMPL_ID 
INNER JOIN JOBS as J on E.JOB_ID=J.JOB_IDENT
where E.DEP_ID ='5';


---- Q: Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.

select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP;


---- Q: Re-write the previous query but limit the result set to include only the rows for employees born before 1980.

select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
where YEAR(E.B_DATE) < 1980;


---- Q: Re-write the previous query but have the result set include all the employees but department names for only the employees who were born before 1980.

select E.EMP_ID,E.L_NAME,E.DEP_ID,D.DEP_NAME
from EMPLOYEES AS E 
LEFT OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP 
AND YEAR(E.B_DATE) < 1980;


---- Q: Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.

select E.F_NAME,E.L_NAME,D.DEP_NAME
from EMPLOYEES AS E 
FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP;


---- Q: Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.

select E.F_NAME,E.L_NAME,D.DEPT_ID_DEP, D.DEP_NAME
from EMPLOYEES AS E 
FULL OUTER JOIN DEPARTMENTS AS D ON E.DEP_ID=D.DEPT_ID_DEP AND E.SEX = 'M';
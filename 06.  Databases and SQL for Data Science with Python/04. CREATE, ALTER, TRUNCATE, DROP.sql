/*
Estimated time needed: 15 minutes

In this lab, you will learn some commonly used DDL (Data Definition Language) statements of SQL. First you will learn the CREATE statement, which is used to create a new table in a database. Next, you will learn the ALTER statement which is used to add, delete, or modify columns in an existing table. Then, you will learn the TRUNCATE statement which is used to remove all rows from an existing table without deleting the table itself. Lastly, you will learn the DROP statement which is used to delete an existing table in a database.

Objectives
After completing this lab, you will be able to:

Create a new table in a database
Add, delete, or modify columns in an existing table
Remove all rows from an existing table without deleting the table itself
Delete an existing table in a database
Instructions
When you approach the exercises in this lab, follow the instructions to run the queries on Db2:

Go to the Resource List of IBM Cloud by logging in where you can find the Db2 service instance that you created in a previous lab under Services section. Click on the Db2-xx service. Next, open the Db2 Console by clicking on Open Console button. Click on the 3-bar menu icon in the top left corner and go to the Run SQL page. The Run SQL tool enables you to run SQL statements.

If needed, follow Hands-on Lab : Sign up for IBM Cloud, Create Db2 service instance and Get started with the Db2 console

*/


-- Exercise 1: CREATE

---- Q: You need to create two tables, PETSALE and PET. To create the two tables PETSALE and PET, copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );
    
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );


---- Q: Now insert some records into the two newly created tables and show all the records of the two tables. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');
    
INSERT INTO PET VALUES
    (1,'Cat',3),
    (2,'Dog',4),
    (3,'Hamster',2);
    
SELECT * FROM PETSALE;
SELECT * FROM PET;


-- Exercise 2: ALTER

--- Task A: ALTER using ADD COLUMN

---- Q: Add a new QUANTITY column to the PETSALE table and show the altered table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

SELECT * FROM PETSALE;


---- Q: Now update the newly added QUANTITY column of the PETSALE table with some values and show all the records of the table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

SELECT * FROM PETSALE;


--- Task B: ALTER using DROP COLUMN

---- Q: Delete the PROFIT column from the PETSALE table and show the altered table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;


--- Task C: ALTER using ALTER COLUMN

---- Q: Change the data type to VARCHAR(20) type of the column PET of the table PETSALE and show the altered table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

ALTER TABLE PETSALE
ALTER COLUMN PET SET DATA TYPE VARCHAR(20);

SELECT * FROM PETSALE;

---- Q: Now verify if the data type of the column PET of the table PETSALE changed to VARCHAR(20) type or not. Click on the 3 bar menu icon in the top left corner and click Explore > Tables. Find the PETSALE table from Schemas by clicking Select All. Click on the PETSALE table to open the Table Definition page of the table. Here, you can see all the current data type of the columns of the PETSALE table.


--- Task D: ALTER using RENAME COLUMN

---- Q: Rename the column PET to ANIMAL of the PETSALE table and show the altered table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

ALTER TABLE PETSALE
RENAME COLUMN PET TO ANIMAL;

SELECT * FROM PETSALE;


-- Exercise 3: TRUNCATE

----  Q: Remove all rows from the PET table and show the empty table. Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

TRUNCATE TABLE PET IMMEDIATE;

SELECT * FROM PET;


-- Exercise 4: DROP

---- Q: Delete the PET table and verify if the table still exists or not (SELECT statement won't work if a table doesn't exist). Copy the code below and paste it to the textbox of the Run SQL page. Click Run all.

DROP TABLE PET;

SELECT * FROM PET;



### DataAnalytics-Assessment-
COWRYWISE_TEST_ASSESSMENT

## STEP 1: The first step I took was to create the database adashi_assessment using the DATA DEFINITION LANGUAGE (DDL) CREATE command in the MySQL workbench.

SQL COMMAND TO CREATE THE ADASHI DATABASE.
CREATE DATABASE adashi_assessment;
Next, I executed the adashi_assessment database using the USE command which allowed me to use only the adashi_assessment database because I also had other databases I had created previously.
SQL COMMAND TO EXECUTE AND USE THE ADASHI DATABASE.
USE adashi_assessment;

## STEP 2: The second step was I took was to open the downloaded adashi assessment database, copied all the SQL commands and executed them inside my created adashi_assessment database in the MySQL workbench.

## STEP 3:  The third step was to check how many tables were in the adashi_assessment database using the DATA MANIPULATION LANGUAGE (DML) SELECT command.
SQL COMMANDS TO CHECK HOW MANY TABLES I HAVE IN THE ADASHI DATABASE.
SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;





# QUESTION 1:  Assessment_Q1.sql

SOLUTION: I identified each column needed for the analysis from the plan_plans, savings_savingsaccount, and the users_customuser tables. I used inner joins to join the three different tables together by identifying their unique identifiers in each table.
No match was found in my query execution results. Therefore, if my query was right, no user had a savings and investment plan.
I provided two different SQL queries on how I approached the problem, but got the same answers.
PROBLEM: The unique identifiers were very difficult to comprehend, causing a confusion for me initially in merging a primary key to a foreign key.

# QUESTION 2: Assessment_Q2.sql
SOLUTION: I identified the columns from the savings_savingsaccount column and used COMMON TABLE EXPRESSIONS (CTEs) to create virtual tables from the latter.
First I created the monthly transaction count virtual table to get the count of all our users. I formatted the transaction date column to enable me to group each customer by the frequency of their transactions.  
Secondly, I created the average transaction of each user's virtual table to get their average transaction per month.
Finally, I created the frequency of each customer virtual table using the condition as stated in the instructions and joined the user_customuser table to it.

PROBLEM: None was encountered, except trying to figure out a solution.

# QUESTION 3: Assessment_Q3.sql
SOLUTION: I identified the necessary columns from the plans_plan and savings_savingsaccount tables, I used left join to join the different tables together and subqueries to specify different conditions.
I also used the DATEDIFF, DATEFORMAT and DATESUB date functions to format and add different conditions to the date column.
PROBLEM: None were encountered except trying to figure out my logic.

# QUESTION 4: Assessment_Q4.sql
SOLUTION: Just like the previous questions, i dentified the neccessary columns from the savings_savingsaccount and users_customuser tables.
Most of the SQL queries came from previously anaswered questions from 1 - 3.

I used the TIMESTAMPDIFF date function to substract the date a customer joined by the curent date to get the Customer Lifetime Value (CLV) Estimation of the customers.
To get the estimated customer lifetime value (CLV), i created a condition and performed the neccessary calculations.








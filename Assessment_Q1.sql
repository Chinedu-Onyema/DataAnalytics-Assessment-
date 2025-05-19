-- STEP 1: CREATE THE ADASHI DATABASE -- 
CREATE DATABASE adashi_assessment;

-- STEP 2: EXECUTE THE ADASHI DATABASE FOR USE --
USE adashi_assessment;

-- STEP 3: EXECUTE THE DOWNLOADED ADASHI DATABASE SQL FILE --

-- STEP 4: EXECITE THE SELECT STATEMENTS TO VIEW THE CREATED TABLES IN THE ADASHI DATABASE --
SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;
SELECT * FROM withdrawals_withdrawal;


-- QUESTION 1: High-Value Customers with Multiple Products --
-- Scenario: The business wants to identify customers who have both a savings and an investment plan (cross-selling opportunity) --


-- FIRST SQL SCRIPT --
-- My results are empty rows --

SELECT                          -- filters the table --
	u.id AS owner_id,           -- The primary key column from the users_customuser table renamed to the owner id --
    concat(u.first_name, ' ', u.last_name) AS name,   -- Combined the first_name and last_name columns using the concat function from the users_customuser table and renamed to name --
    p.is_regular_savings AS savings_count,      -- identified the regular savings column in the plans_plan table as it makes more sense to use because it makes cowrywise profitable and i also renamed it to saving count -- 
    p.is_fixed_investment AS investment_count,  -- identified the fixed investment column in the plans_plan table as it makes more sense to use because it makes cowrywise profitable renamed it to investment count -- 
    SUM(s.confirmed_amount) AS total_deposits  -- identified the confirmed amount column in the savings_savingsaccount as cowrywise can only make money from confirmed deposits. Also changed the name to total deposits --
FROM 
    plans_plan p
INNER JOIN 
	users_customuser u ON p.id = u.id            -- joining the users_customuser and plans_plan tables
INNER JOIN 
    savings_savingsaccount s ON p.owner_id = s.plan_id   -- joining the savings_savingsaccount and plans_plan tables
GROUP BY 
    u.id, u.first_name, u.last_name
ORDER BY total_deposits DESC;

-----------------------------------------------------------------------------------------------------------------------------------

-- SECOND SQL SCRIPT --
SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    p.is_regular_savings AS savings_count,
    p.is_fixed_investment AS investment_count,
    SUM(s.confirmed_amount) AS total_deposits
FROM 
    users_customuser u
JOIN 
    plans_plan p ON u.id = p.id                       -- joining the users_customuser and plans_plan tables
JOIN 
    savings_savingsaccount s ON p.owner_id = s.plan_id  -- joining the savings_savingsaccount and plans_plan tables
GROUP BY 
    u.id, u.first_name, u.last_name
HAVING 
    SUM(CASE WHEN p.is_regular_savings THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN p.is_fixed_investment THEN 1 ELSE 0 END) > 0
ORDER BY 
    total_deposits DESC;

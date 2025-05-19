-- QUESTION 3: Account Inactivity Alert
-- Scenario: The ops team wants to flag accounts with no inflow transactions for over one year.

SELECT * FROM plans_plan;
SELECT * FROM savings_savingsaccount;

-- Step 1: Identify active plans (status_id=1, not deleted, not archived)
-- Step 2: Check for missing transactions in the last 365 days using the latest transaction date in the data
SELECT 
    p.id AS plan_id,
    p.owner_id,
    p.description AS type,
	DATE_FORMAT(s.transaction_date, '%Y-%m-%d') AS last_transaction_date,  -- formatted the transaction date column to remove the timestamp from the date -- 
	DATEDIFF(CURDATE(), s.transaction_date) AS inactivity_days          -- substracted the current present date from the dates in the transaction date column --
FROM plans_plan p
LEFT JOIN savings_savingsaccount s ON s.plan_id = p.id
WHERE 
    p.status_id = 1                -- assumed that 1 is means the customers we are analyzing are still presently active
    AND p.is_deleted = 0           -- assumed that that the customer is not active
    AND p.is_archived = 0          -- assumed that that the customer is not active
    AND NOT EXISTS (
        SELECT 1 
        FROM savings_savingsaccount s 
        WHERE 
            s.plan_id = p.id 
            -- Use the latest transaction date in the data (2025-04-18) as reference
            AND s.transaction_date <= DATE_SUB('2025-04-18', INTERVAL 365 DAY)
    )
ORDER BY p.start_date DESC;

    
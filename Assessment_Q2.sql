-- QUESTION 2: Transaction Frequency Analysis
-- Scenario: The finance team wants to analyze how often customers transact to segment them (e.g., frequent vs. occasional users) --

-- Used Common Table Expressons to solve the problem --
-- 1. Created the Monthly transaction counts per user virtual table --
WITH monthly_transaction_counts AS (
    SELECT
        owner_id AS user_id,
        DATE_FORMAT(transaction_date, '%Y-%m-%d') AS transaction_month,
        COUNT(*) AS transaction_count
    FROM savings_savingsaccount
    GROUP BY owner_id, transaction_month 
),

-- 2. Created the Average transactions per user per month virtual table --
user_average_transaction AS (
    SELECT
        user_id,
        COUNT(*) AS customer_count,
        ROUND(AVG(transaction_count), 2) AS average_transactions_per_month       
    FROM monthly_transaction_counts
    GROUP BY user_id
)

-- 3. Created the transaction fequency of each customer and Joined it with the users_customuser table.
SELECT
    CASE
        WHEN a.customer_count >= 10 THEN 'High Frequency'
        WHEN a.customer_count BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category, customer_count, average_transactions_per_month -- showing only the columns we need for the analysis
FROM user_average_transaction a
INNER JOIN users_customuser u ON u.id = a.user_id      
ORDER BY a.average_transactions_per_month DESC;



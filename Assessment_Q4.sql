-- QUESTION 4: Account Inactivity Alert
-- Scenario: Marketing wants to estimate CLV based on account tenure and transaction volume (simplified model).

SELECT * FROM savings_savingsaccount;
SELECT * FROM users_customuser;

SELECT 
    u.id AS customer_id,
    concat(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    CASE 
        WHEN TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()) = 0 THEN 0
        ELSE (COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE())) * 12 * (SUM(s.amount) * 0.001 / COUNT(s.id))
    END AS estimated_clv
FROM 
    users_customuser u
LEFT JOIN 
    savings_savingsaccount s ON u.id = s.owner_id
WHERE 
    u.is_active = 1 -- Only active users
    AND u.is_account_deleted = 0 -- Not deleted accounts
GROUP BY 
    u.id, u.first_name, u.last_name
ORDER BY 
    estimated_clv DESC;
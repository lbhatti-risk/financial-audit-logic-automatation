-- Title: IPE Integrity & Duplicate Check Logic
-- Description: SQL logic to identify duplicate transaction IDs and null Safes 
--              prior to the Power Query reconciliation.

SELECT 
    transaction_id, 
    count(*) as duplicate_count
FROM 
    `project.dataset.transaction_table`
WHERE 
    audit_period = '2023-Q4'
GROUP BY 
    transaction_id
HAVING 
    count(*) > 1;

-- Check for orphaned Safes in CyberArk logs
SELECT 
    SafeName, 
    VaultOwner
FROM 
    `project.dataset.cyberark_extract`
WHERE 
    VaultOwner IS NULL;

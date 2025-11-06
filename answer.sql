SELECT
    t.investor_id,
    s.sector_name,
    -- Calculate the percentage: (sector shares / investor's total shares) * 100
    -- Then, round the result to two decimal places
    ROUND(
        (CAST(t.no_of_shares AS NUMERIC) * 100.0) / SUM(t.no_of_shares) OVER (PARTITION BY t.investor_id)
    , 2) AS percentage  -- Column name changed to 'percentage'
FROM
    investor_transactions t
JOIN
    sectors s ON t.sector_id = s.sector_id
ORDER BY
    t.investor_id,
    percentage DESC;-- ADD YOUR SQL QUERY HERE

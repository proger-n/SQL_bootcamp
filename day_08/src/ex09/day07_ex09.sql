SELECT
    address,
    ROUND(
        MAX(age) - MIN(age) / MAX(age)::NUMERIC, 2
    ) AS formula,
    ROUND(AVG(age), 2) AS average,
    CASE
        WHEN (
            ROUND(
                MAX(age) - MIN(age) / MAX(age)::NUMERIC, 2
            )
        ) > (ROUND(AVG(age), 2)) THEN 'true'
        ELSE 'false'
    END
FROM person
GROUP BY
    1
ORDER BY 1;
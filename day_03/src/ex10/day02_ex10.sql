WITH t1 AS (
        SELECT name, address
        FROM person
    ), t2 AS (
        SELECT name, address
        FROM person
    )
SELECT
    t1.name,
    t2.name,
    t1.address
FROM t1
    LEFT JOIN t2 ON t1.address = t2.address
WHERE t1.name > t2.name
ORDER BY 1, 2, 3;
WITH d AS (
        SELECT
            GENERATE_SERIES(
                '2022-01-01',
                '2022-01-10',
                interval '1 day'
            ) as dates
    )
SELECT
    d.dates :: date as missing_date
FROM (
        SELECT *
        FROM person_visits
        WHERE
            person_id BETWEEN 1 AND 2
    ) vd
    RIGHT JOIN d ON vd.visit_date = d.dates
WHERE vd.person_id IS NULL
ORDER BY d.dates;
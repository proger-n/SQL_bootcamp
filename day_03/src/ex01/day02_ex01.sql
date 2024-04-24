SELECT d :: date as missing_date
FROM (
        SELECT *
        FROM person_visits
        WHERE
            person_id BETWEEN 1 AND 2
    ) vd
    RIGHT JOIN GENERATE_SERIES(
        '2022-01-01',
        '2022-01-10',
        interval '1 day'
    ) d ON vd.visit_date = d
WHERE vd.person_id IS NULL
ORDER BY d;
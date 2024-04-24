WITH t1 AS (
        SELECT
            pizzeria.name,
            COUNT(pizzeria.name) count
        FROM pizzeria
            RIGHT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
            LEFT JOIN person ON person.id = person_visits.person_id
        WHERE
            person.gender = 'male'
        GROUP BY
            pizzeria.name
    ),
    t2 AS (
        SELECT
            pizzeria.name,
            COUNT(pizzeria.name) count
        FROM pizzeria
            RIGHT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
            LEFT JOIN person ON person.id = person_visits.person_id
        WHERE
            person.gender = 'female'
        GROUP BY
            pizzeria.name
    )
SELECT t1.name
FROM t1
    INNER JOIN t2 ON t1.name = t2.name AND t1.count > t2.count
UNION ALL
SELECT t2.name
FROM t2
    INNER JOIN t1 ON t1.name = t2.name AND t1.count < t2.count
ORDER BY 1;
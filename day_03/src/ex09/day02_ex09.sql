WITH t1 AS (
        SELECT name
        FROM person_order po
            LEFT JOIN person pn ON pn.id = po.person_id
            LEFT JOIN menu m ON m.id = po.menu_id
        WHERE
            pn.gender = 'female'
            AND m.pizza_name = 'pepperoni pizza'
    ),
    t2 AS (
        SELECT name
        FROM person_order po
            LEFT JOIN person pn ON pn.id = po.person_id
            LEFT JOIN menu m ON m.id = po.menu_id
        WHERE
            pn.gender = 'female'
            AND m.pizza_name = 'cheese pizza'
    )
SELECT *
FROM t1
WHERE t1.name IN(
        SELECT t2.name
        FROM t2
    )
ORDER BY 1;
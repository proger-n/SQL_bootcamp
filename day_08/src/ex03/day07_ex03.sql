WITH
    t_o AS (
        SELECT p.name, COUNT(*)
        FROM
            person_order po
            LEFT JOIN menu m ON m.id = po.menu_id
            LEFT JOIN pizzeria p ON p.id = m.pizzeria_id
        GROUP BY
            p.name
        ORDER BY 2 DESC
    ),
    t_v AS (
        SELECT p.name, COUNT(*)
        FROM person_visits pv
            LEFT JOIN pizzeria p ON p.id = pv.pizzeria_id
        GROUP BY
            p.name
        ORDER BY 2 DESC
    )
SELECT name, COALESCE(t_v.count, 0) + COALESCE(t_o.count, 0) AS total_count
FROM t_o
    FULL JOIN t_v USING (name)
ORDER BY 2 DESC, 1 ASC;
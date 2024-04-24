(
    SELECT p.name, COUNT(*), 'order' AS action_type
    FROM
        person_order po
        LEFT JOIN menu m ON m.id = po.menu_id
        LEFT JOIN pizzeria p ON p.id = m.pizzeria_id
    GROUP BY
        p.name
    ORDER BY 2 DESC
    LIMIT 3
)
UNION ALL
(
    SELECT p.name, COUNT(*), 'visit' AS action_type
    FROM person_visits pv
        LEFT JOIN pizzeria p ON p.id = pv.pizzeria_id
    GROUP BY
        p.name
    ORDER BY 2 DESC
    LIMIT 3
)
ORDER BY 3, 2 DESC
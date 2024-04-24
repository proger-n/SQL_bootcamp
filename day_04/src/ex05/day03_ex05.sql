(
    SELECT pz.name
    FROM person_visits pv
        INNER JOIN person p ON (
            p.id = pv.person_id AND p.name = 'Andrey'
        )
        INNER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
)
EXCEPT (
    SELECT pz.name
    FROM person_order po
        INNER JOIN person p ON (
            p.id = po.person_id AND p.name = 'Andrey'
        )
        INNER JOIN menu m ON m.id = po.menu_id
        INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
)
ORDER BY 1;
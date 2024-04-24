(
    SELECT DISTINCT pz.name
    FROM person_order po
        LEFT JOIN person p ON p.id = po.person_id
        LEFT JOIN menu m ON m.id = po.menu_id
        LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'female'
    EXCEPT
    SELECT DISTINCT pz.name
    FROM person_order po
        LEFT JOIN person p ON p.id = po.person_id
        LEFT JOIN menu m ON m.id = po.menu_id
        LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'male'
)
UNION (
    SELECT DISTINCT pz.name
    FROM person_order po
        LEFT JOIN person p ON p.id = po.person_id
        LEFT JOIN menu m ON m.id = po.menu_id
        LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'male'
    EXCEPT
    SELECT DISTINCT pz.name
    FROM person_order po
        LEFT JOIN person p ON p.id = po.person_id
        LEFT JOIN menu m ON m.id = po.menu_id
        LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    WHERE p.gender = 'female'
)
ORDER BY 1;
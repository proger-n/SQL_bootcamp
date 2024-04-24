SELECT pizza_name, pl.name
FROM person_order po
    LEFT JOIN person p ON p.id = po.person_id
    LEFT JOIN menu ON menu.id = po.menu_id
    LEFT JOIN pizzeria pl ON pl.id = menu.pizzeria_id
WHERE
    p.name IN('Denis', 'Anna')
ORDER BY 1, 2;
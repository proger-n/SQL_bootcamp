SELECT
    menu.pizza_name,
    menu.price,
    pizzeria.name
FROM menu
    LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id NOT IN(
        SELECT
            DISTINCT menu_id
        FROM person_order
    )
ORDER BY 1, 2;
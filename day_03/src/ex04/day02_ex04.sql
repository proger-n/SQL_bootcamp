SELECT
    pizza_name,
    p.name as pizzeria_name,
    price
FROM menu
    LEFT JOIN pizzeria p ON p.id = menu.pizzeria_id
WHERE
    pizza_name IN(
        'mushroom pizza',
        'pepperoni pizza'
    )
ORDER BY
    pizza_name,
    pizzeria_id;
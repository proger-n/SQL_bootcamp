SELECT
    person.name person_name,
    menu.pizza_name pizza_name,
    pizzeria.name pizzeria_name
FROM person_order
    LEFT JOIN person ON person.id = person_order.person_id
    LEFT JOIN menu ON menu.id = person_order.menu_id
    LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name;
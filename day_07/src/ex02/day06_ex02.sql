SELECT person.name, menu.pizza_name, menu.price, ROUND(
        menu.price * (
            100 - person_discounts.discount
        ) / 100
    ) discount_price, pizzeria.name
FROM
    person_order
    INNER JOIN person ON person.id = person_order.person_id
    INNER JOIN menu ON menu.id = person_order.menu_id
    INNER JOIN person_discounts ON person_discounts.person_id = person.id
    AND person_discounts.pizzeria_id = menu.pizzeria_id
    INNER JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
ORDER BY 1, 2
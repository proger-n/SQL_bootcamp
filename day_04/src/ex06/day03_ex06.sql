SELECT
    DISTINCT m.pizza_name,
    pz.name pizzeria_name_1,
    pz2.name pizzeria_name_2,
    m.price
FROM menu m
    INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
    INNER JOIN menu m2 ON m2.pizza_name = m.pizza_name AND m2.pizzeria_id < m.pizzeria_id
    INNER JOIN pizzeria pz2 ON m2.pizzeria_id = pz2.id
WHERE m.price = m2.price
ORDER BY m.pizza_name
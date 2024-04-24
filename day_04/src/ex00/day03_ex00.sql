SELECT
    pizza_name,
    price,
    pizzeria.name pizzeria_name,
    visit_date
FROM person_visits
    FULL JOIN person_order USING(person_id)
    LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person_id = (
        SELECT id
        FROM person
        WHERE
            name = 'Kate'
    )
    AND price BETWEEN 800 AND 1000
ORDER BY
    pizza_name,
    price,
    pizzeria_name;
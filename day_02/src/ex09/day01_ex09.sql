SELECT name
FROM pizzeria
WHERE id NOT IN (
        SELECT pizzeria_id
        FROM person_visits
    );

SELECT name
FROM pizzeria p
WHERE NOT EXISTS(
        SELECT pizzeria_id
        FROM person_visits po
        WHERE
            po.pizzeria_id = p.id
    );
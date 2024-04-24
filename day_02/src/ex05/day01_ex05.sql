SELECT
    person.id AS "person.id",
    person.name AS "person.name",
    age,
    gender,
    address,
    pizzeria.id,
    pizzeria.name,
    rating
FROM person, pizzeria
ORDER BY
    person.id,
    pizzeria.id;
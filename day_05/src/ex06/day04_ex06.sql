CREATE MATERIALIZED VIEW
    mv_dmitriy_visits_and_eats AS
SELECT pz.name
FROM person_visits pv
    LEFT JOIN person p ON p.id = pv.person_id
    LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    LEFT JOIN menu m ON m.pizzeria_id = pz.id
WHERE
    pv.visit_date = '2022-01-08'
    AND p.name = 'Dmitriy'
    AND price < 800;
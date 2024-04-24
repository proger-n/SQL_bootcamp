SELECT
    CASE
        WHEN p.name IS NOT NULL THEN p.name
        ELSE '-'
    END person_name,
    pv.visit_date,
    CASE
        WHEN pz.name IS NOT NULL THEN pz.name
        ELSE '-'
    END pizzeria_name
FROM person p
    FULL JOIN (
        SELECT
            person_id,
            visit_date,
            pizzeria_id
        FROM person_visits
        WHERE
            visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) pv ON pv.person_id = p.id
    FULL JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY
    person_name,
    pv.visit_date,
    pizzeria_name;
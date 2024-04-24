SELECT (
        SELECT name
        FROM person prs
        WHERE
            prs.id = pv.person_id
    ) AS person_name, (
        SELECT name
        FROM pizzeria pzz
        WHERE
            pzz.id = pv.pizzeria_id
    ) AS pizzeria_name
FROM person_visits pv
WHERE
    pv.visit_date BETWEEN '2022-01-07' AND '2022-01-09'
ORDER BY
    person_name,
    pizzeria_name DESC;
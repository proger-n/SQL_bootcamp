SELECT DISTINCT person.id
FROM person
    INNER JOIN person_visits ON person.id = person_visits.person_id
WHERE (
        person_visits.visit_date >= '2022-01-06'
        AND person_visits.visit_date <= '2022-01-09'
    )
    OR person_visits.pizzeria_id = 2
GROUP BY person.id
ORDER BY person.id DESC;
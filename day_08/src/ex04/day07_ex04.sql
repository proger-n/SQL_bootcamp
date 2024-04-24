SELECT name, COUNT(*) count_of_visits
FROM person_visits pv
    INNER JOIN person p ON p.id = pv.person_id
GROUP BY
    name
HAVING
    COUNT(*) > 3;
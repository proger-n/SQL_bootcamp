SELECT DISTINCT
    p.name
FROM person_order po
    RIGHT JOIN person p ON p.id = po.person_id
ORDER BY 1
SELECT pn.name
FROM person_order po
    LEFT JOIN person pn ON pn.id = po.person_id
    LEFT JOIN menu m ON m.id = po.menu_id
WHERE
    pn.gender = 'male'
    AND (
        pizza_name = 'pepperoni pizza'
        OR pizza_name = 'mushroom pizza'
    )
    AND (
        pn.address = 'Moscow'
        OR pn.address = 'Samara'
    )
ORDER BY 1 DESC;
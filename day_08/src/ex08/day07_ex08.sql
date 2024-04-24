SELECT address, pz.name, COUNT(*) count_of_orders
FROM
    person_order pv
    LEFT JOIN person p ON p.id = pv.person_id
    LEFT JOIN menu m ON m.id = pv.menu_id
    LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY
    address,
    pz.name
ORDER BY 1, 2;
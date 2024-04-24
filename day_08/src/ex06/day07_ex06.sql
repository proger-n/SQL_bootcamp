SELECT
    name,
    COUNT(*) count_of_orders,
    ROUND(AVG(price), 2) average_price,
    MAX(price) max_price,
    MIN(price) min_price
FROM
    person_order po
    LEFT JOIN menu m ON m.id = po.menu_id
    LEFT JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY
    name
ORDER BY 1;
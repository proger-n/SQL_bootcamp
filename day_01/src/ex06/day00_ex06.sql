SELECT (
        SELECT name
        FROM person p
        WHERE
            p.id = po.person_id
    ) AS NAME, (
        SELECT name
        FROM person as p
        WHERE
            p.id = po.person_id
    ) = 'Denis' AS is_denis
FROM person_order as po
WHERE
    order_date = '2022-01-07'
    AND menu_id IN(13, 14, 18)
SELECT (
        SELECT name
        FROM person as p
        WHERE
            p.id = po.person_id
    ) AS name
FROM person_order as po
WHERE
    po.order_date = '2022-01-07'
    AND po.menu_id IN(13, 14, 18);
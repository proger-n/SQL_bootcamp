INSERT INTO
    person_order (
        id,
        person_id,
        menu_id,
        order_date
    )
SELECT t + (
        SELECT max(id) + 1
        FROM
            person_order
    ) id,
    id person_id, (
        SELECT id
        FROM menu
        WHERE
            pizza_name = 'greek pizza'
    ) menu_id,
    '2022-02-25' order_date
FROM person p
    INNER JOIN GENERATE_SERIES(
        0, (
            SELECT COUNT(*)
            FROM
                person
        )
    ) AS t ON t = p.id
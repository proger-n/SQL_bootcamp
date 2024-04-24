CREATE VIEW
    v_price_with_discount AS
SELECT
    person.name,
    pizza_name,
    price,
    ROUND(price * 0.9, 0) :: INT discount_price
FROM person_order po
    INNER JOIN menu ON menu.id = po.menu_id
    INNER JOIN person ON person.id = po.person_id
ORDER BY 1, 2;
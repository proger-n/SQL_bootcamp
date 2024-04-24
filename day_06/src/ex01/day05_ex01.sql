SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT pizza_name, name
FROM menu
    INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
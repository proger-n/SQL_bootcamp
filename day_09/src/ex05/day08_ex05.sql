-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT SUM(rating) FROM pizzeria;

SELECT SUM(rating) FROM pizzeria;

COMMIT;

SELECT SUM(rating) FROM pizzeria;

-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';

COMMIT;

SELECT SUM(rating) FROM pizzeria;
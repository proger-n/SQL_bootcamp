-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
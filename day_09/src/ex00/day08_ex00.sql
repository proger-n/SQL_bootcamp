-- сессия 1
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;

-- сессия 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
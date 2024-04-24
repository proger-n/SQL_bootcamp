-- сессия 1
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 1 WHERE id = 1;

UPDATE pizzeria SET rating = 1 WHERE id = 2;

COMMIT;

-- сессия 2
BEGIN TRANSACTION;

UPDATE pizzeria SET rating = 2 WHERE id = 2;

UPDATE pizzeria SET rating = 2 WHERE id = 1;

COMMIT;
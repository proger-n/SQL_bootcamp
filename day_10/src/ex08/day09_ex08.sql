CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer 
DEFAULT 10) RETURNS TABLE(number bigint) AS 
$$
DECLARE
	fib1 bigint := 0;
	fib2 bigint := 1;
	fib3 bigint;
BEGIN
	IF pstop > 0 THEN number := fib1;
	RETURN NEXT;
	IF pstop > 1 THEN number := fib2;
	RETURN NEXT;
END
	IF;
	LOOP fib3 := fib1 + fib2;
	IF fib3 < pstop THEN number := fib3;
	RETURN NEXT;
	ELSE EXIT;
END
	IF;
	fib1 := fib2;
	fib2 := fib3;
END
	LOOP;
END
	IF;
END;
$$
LANGUAGE
plpgsql; 

select * from fnc_fibonacci (100);

select * from fnc_fibonacci ();
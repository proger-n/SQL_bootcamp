CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(pperson VARCHAR DEFAULT 'Dmitriy', pprice INTEGER DEFAULT 
500, pdate DATE DEFAULT '2022-01-08') RETURNS TABLE(name 
VARCHAR) AS 
$$
BEGIN
	RETURN QUERY
	SELECT pz.name
	FROM
	    pizzeria pz
	    RIGHT JOIN person_visits pv ON pv.pizzeria_id = pz.id
	    LEFT JOIN person p ON p.id = pv.person_id
	    INNER JOIN menu m ON m.pizzeria_id = pz.id
	WHERE
	    price < pprice
	    AND p.name = pperson
	    AND pv.visit_date = pdate;
END;
$$
LANGUAGE
PLPGSQL;; 

select * from fnc_person_visits_and_eats_on_date (pprice := 800);

select *
from
    fnc_person_visits_and_eats_on_date (
        pperson := 'Anna', pprice := 1300, pdate := '2022-01-01'
    );

SELECT 
	CASE
	    WHEN name IS NULL THEN 'not defined'
	    ELSE name
	END,
	CASE
	    WHEN lastname IS NULL THEN 'not defined'
	    ELSE lastname
	END, 
    type, 
    SUM(money) volume,
    currency_name,
    CASE
    	WHEN last_rate_to_usd IS NULL THEN 1
        ELSE last_rate_to_usd
    END,
        SUM(money)*(CASE
    	WHEN last_rate_to_usd IS NULL THEN 1
        ELSE last_rate_to_usd
    END) total_volume_in_usd
FROM (SELECT "user".name,
		"user".lastname,
        type,
        money,
        MAX(upd),
      CASE
             WHEN currency.name IS NULL THEN 'not defined'
             ELSE currency.name
             END currency_name,
      MAX(rate_to_usd) last_rate_to_usd
FROM "user"
     FULL JOIN (SELECT user_id, money, type, currency_id, MAX(updated) upd
               FROM balance
               GROUP BY user_id, money, type, currency_id) balance ON balance.user_id="user".id
     LEFT JOIN (SELECT id, name, rate_to_usd, MAX(updated)
               FROM currency
               GROUP BY id, name, rate_to_usd) currency ON currency.id=balance.currency_id
GROUP BY "user".name,
		"user".lastname,
        type,
        money,
     currency_name) t1
GROUP BY 1,2,3,5,6
ORDER BY 1 DESC, 2, 3;

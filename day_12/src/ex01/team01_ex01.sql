WITH all_balances AS (
    SELECT
        "user".name AS name_person,
        "user".lastname AS lastname_person,
        c.name,
        balance.money,
        (
            SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
              AND currency.updated < balance.updated
            ORDER BY currency.rate_to_usd
            LIMIT 1
         ) AS min_rate,
         (
            SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
              AND currency.updated > balance.updated
            ORDER BY currency.rate_to_usd
            LIMIT 1
         ) AS max_rate
    FROM balance
    INNER JOIN (SELECT id, name FROM currency GROUP BY id, name) AS c ON c.id = balance.currency_id
    LEFT JOIN "user" ON user_id = "user".id
)

SELECT
    coalesce(all_balances.name_person, 'not defined') AS name,
    coalesce(all_balances.lastname_person, 'not defined') AS lastname,
    all_balances.name AS currency_name,
    all_balances.money * coalesce(min_rate, max_rate) as currency_in_usd
    FROM all_balances
ORDER BY 1 DESC, 2, 3;
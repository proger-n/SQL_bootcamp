SELECT
    concat(
        name,
        '(age:',
        age,
        ',gender:''',
        gender,
        ''',address:''',
        address,
        ''')'
    ) as s
FROM person
ORDER BY s;
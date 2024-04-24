CREATE VIEW
    v_generated_dates AS
SELECT
    GENERATE_SERIES(
        '2022-01-01',
        '2022-01-31',
        interval '1 day'
    ) :: DATE as generated_date;
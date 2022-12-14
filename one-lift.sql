-- usage: cat weights.csv | clickhouse local \
--          --queries-file <(sed 's/{lift}/squat/' < one-lift.sql)
SELECT date, weight, comment FROM
file(stdin, 'CSV', 'date Date, lift String, weight String, comment String')
WHERE lift = '{lift}'

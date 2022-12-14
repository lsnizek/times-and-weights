-- usage: cat times.csv | clickhouse local \
--          --queries-file <(sed 's/{event}/50 free/' < one-event.sql)
SELECT date, time, comment FROM
file(stdin, 'CSV', 'date Date, event String, time String, comment String')
WHERE event = '{event}'

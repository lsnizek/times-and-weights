-- usage: cat times.csv | clickhouse local --queries-file most-recent.sql
SELECT event, top.2 AS time, top.1 AS date, top.3 AS comment FROM (
  SELECT event, groupArray((date, time, comment))[-1] AS top FROM
  file(stdin, 'CSV', 'date Date, event String, time String, comment String')
  GROUP BY event
)

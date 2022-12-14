-- usage: cat times.csv | clickhouse local --queries-file parse-times.sql

CREATE FUNCTION timeToStr AS y ->
  if(y > 60, concat(toString(intDiv(y, 60)), ':',
  toString(round(y % 60, 2))), toString(round(y, 2)));

CREATE FUNCTION timeFromStr AS x ->
  arrayReduce('sum', arrayMap(u -> 60 * toUInt32(u),
  arrayPopBack(splitByChar(':', x)))) +
  toFloat32(arrayLast(u -> 1, splitByChar(':', x)));

SELECT event, top.2 AS time, top.1 AS date, top.3 AS comment FROM (
  SELECT event, groupArray((date, time, comment))[-1] AS top FROM
  file(stdin, 'CSV', 'date Date, event String, time String, comment String')
  GROUP BY event
);

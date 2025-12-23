
TRUNCATE TABLE mart_airpollution_hourly;

INSERT INTO mart_airpollution_hourly
SELECT
  DATE_FORMAT(measurement_time, '%Y-%m-%d %H:00:00'),
  AVG(pm25), AVG(pm10), AVG(no2), AVG(o3), AVG(co), AVG(so2),
  COUNT(*)
FROM stg_airpollution_jinju
WHERE data_quality_flag='OK'
GROUP BY DATE_FORMAT(measurement_time, '%Y-%m-%d %H');

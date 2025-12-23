TRUNCATE TABLE mart_airpollution_hourly;

INSERT INTO mart_airpollution_hourly (
  date_hour,
  avg_pm25, avg_pm10, avg_no2, avg_o3, avg_co, avg_so2,
  record_count
)
SELECT
  DATE_FORMAT(measurement_time, '%Y-%m-%d %H:00:00') AS date_hour,
  AVG(pm25) AS avg_pm25,
  AVG(pm10) AS avg_pm10,
  AVG(no2)  AS avg_no2,
  AVG(o3)   AS avg_o3,
  AVG(co)   AS avg_co,
  AVG(so2)  AS avg_so2,
  COUNT(*)  AS record_count
FROM stg_airpollution_jinju
WHERE data_quality_flag = 'OK'
GROUP BY DATE_FORMAT(measurement_time, '%Y-%m-%d %H:00:00')
ORDER BY date_hour;

-- 실행확인
SELECT COUNT(*) FROM mart_airpollution_hourly;
SELECT * FROM mart_airpollution_hourly ORDER BY date_hour LIMIT 10;

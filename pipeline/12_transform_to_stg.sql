TRUNCATE TABLE stg_airpollution_jinju;

INSERT INTO stg_airpollution_jinju (
  measurement_time,
  pm25, pm10, no2, o3, co, so2,
  addr, latitude, longitude,
  data_quality_flag
)
SELECT
  STR_TO_DATE(TRIM(STNDR_DAYHMINSEC), '%Y%m%d%H%i%s') AS measurement_time,

  NULLIF(PM25_CTRN_MM3, '') + 0 AS pm25,
  NULLIF(PM10_CTRN_MM3, '') + 0 AS pm10,
  NULLIF(NO2_CTRN_PPM,  '') + 0 AS no2,
  NULLIF(O3_CTRN_PPM,   '') + 0 AS o3,
  NULLIF(CO_CTRN_PPM,   '') + 0 AS co,
  NULLIF(SO2_CTRN_PPM,  '') + 0 AS so2,

COALESCE(NULLIF(TRIM(STNDR_ADDR), ''), 'UNKNOWN') AS addr,
  CAST(LATITUDE  AS DECIMAL(10,6)) AS latitude,
  CAST(LONGITUDE AS DECIMAL(10,6)) AS longitude,

  CASE
    WHEN PM25_CTRN_MM3 IS NULL OR PM25_CTRN_MM3 = ''
      OR PM10_CTRN_MM3 IS NULL OR PM10_CTRN_MM3 = ''
      OR NO2_CTRN_PPM  IS NULL OR NO2_CTRN_PPM  = ''
      OR O3_CTRN_PPM   IS NULL OR O3_CTRN_PPM   = ''
      OR CO_CTRN_PPM   IS NULL OR CO_CTRN_PPM   = ''
      OR SO2_CTRN_PPM  IS NULL OR SO2_CTRN_PPM  = ''
    THEN 'MISSING'
    ELSE 'OK'
  END AS data_quality_flag
FROM raw_airpollution_jinju
WHERE STR_TO_DATE(TRIM(STNDR_DAYHMINSEC), '%Y%m%d%H%i%s') IS NOT NULL;

-- 실행확인
SELECT COUNT(*) AS stg_cnt FROM stg_airpollution_jinju;
SELECT addr, COUNT(*) FROM stg_airpollution_jinju GROUP BY addr ORDER BY COUNT(*) DESC LIMIT 10;

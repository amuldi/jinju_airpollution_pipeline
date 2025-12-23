
CREATE TABLE stg_airpollution_jinju (
  measurement_time DATETIME,
  pm25 DECIMAL(6,2),
  pm10 DECIMAL(6,2),
  no2 DECIMAL(6,4),
  o3 DECIMAL(6,4),
  co DECIMAL(6,4),
  so2 DECIMAL(6,4),
  addr VARCHAR(255),
  latitude DECIMAL(10,6),
  longitude DECIMAL(10,6),
  data_quality_flag VARCHAR(20)
);

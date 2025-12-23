DROP TABLE IF EXISTS mart_airpollution_hourly;

CREATE TABLE mart_airpollution_hourly (
    date_hour DATETIME PRIMARY KEY,

    avg_pm25 DECIMAL(6,2),
    avg_pm10 DECIMAL(6,2),
    avg_no2  DECIMAL(6,4),
    avg_o3   DECIMAL(6,4),
    avg_co   DECIMAL(6,4),
    avg_so2  DECIMAL(6,4),

    record_count INT,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SHOW COLUMNS FROM raw_airpollution_jinju;

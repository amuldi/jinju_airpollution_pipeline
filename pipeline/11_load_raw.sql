-- load_raw.sql
-- CSV 파일을 raw 테이블에 적재하는 단계
-- (현재 프로젝트에서는 DBeaver Import로 대체 가능)

-- 예시: 실제 운영 시 사용
-- LOAD DATA LOCAL INFILE '/path/to/file.csv'
-- INTO TABLE raw_airpollution_jinju
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (
--   STNDR_DAYHMINSEC,
--   PM25_CTRN_MM3,
--   PM10_CTRN_MM3,
--   NO2_CTRN_PPM,
--   O3_CTRN_PPM,
--   CO_CTRN_PPM,
--   SO2_CTRN_PPM,
--   STNDR_ADDR,
--   LATITUDE,
--   LONGITUDE
-- )
-- SET
--   source_file = '2025-11-06.csv',
--   ingestion_date = CURDATE();

-- 현재 로컬 프로젝트에서는 DBeaver Import로 raw 적재 완료
SELECT COUNT(*) AS raw_cnt
FROM raw_airpollution_jinju;

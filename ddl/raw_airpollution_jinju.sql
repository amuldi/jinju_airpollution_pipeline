CREATE TABLE raw_airpollution_jinju (
    raw_id           BIGINT AUTO_INCREMENT PRIMARY KEY,

    -- 원본 시간 문자열
    STNDR_DAYHMINSEC VARCHAR(14),

    -- 측정값 (문자열 그대로)
    PM25_CTRN_MM3    VARCHAR(20),
    PM10_CTRN_MM3    VARCHAR(20),
    NO2_CTRN_PPM     VARCHAR(20),
    O3_CTRN_PPM      VARCHAR(20),
    CO_CTRN_PPM      VARCHAR(20),
    SO2_CTRN_PPM     VARCHAR(20),

    -- 위치 / 행정 정보
    STNDR_ADDR       VARCHAR(255),
    LATITUDE         VARCHAR(50),
    LONGITUDE        VARCHAR(50),

    -- 메타데이터
    source_file      VARCHAR(255),
    ingestion_date   DATE,
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

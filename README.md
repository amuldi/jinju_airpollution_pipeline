# Jinju Air Pollution Data Pipeline

진주시 대기오염 데이터를 기반으로 한 SQL 중심 ETL 파이프라인 프로젝트입니다.

## Pipeline Flow
CSV → raw → stg → mart

## Tech Stack
- MySQL
- DBeaver
- SQL

## Folder Structure
```
jinju_airpollution_pipeline/
├── ddl/
│   ├── raw_airpollution_jinju.sql
│   ├── stg_airpollution_jinju.sql
│   └── mart_airpollution_hourly.sql
│
└── pipeline/
    ├── 11_load_raw.sql
    ├── 12_transform_to_stg.sql
    └── 13_aggregate_to_mart.sql
```

## Description
- raw: 원본 CSV 적재
- stg: 타입 변환, 결측치 처리
- mart: 시간 단위 집계 테이블
- 
## How to Run
1. Execute DDL scripts (once)
   - ddl/raw_airpollution_jinju.sql
   - ddl/stg_airpollution_jinju.sql
   - ddl/mart_airpollution_hourly.sql

2. Load raw data
   - pipeline/11_load_raw.sql
   - (CSV imported via DBeaver)

3. Transform raw → staging
   - pipeline/12_transform_to_stg.sql

4. Aggregate staging → mart
   - pipeline/13_aggregate_to_mart.sql

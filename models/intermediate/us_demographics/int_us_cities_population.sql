{{ config(materialized="table") }}
with source_data as (
select 
    distinct City,
    `State Code` as state_code,
    concat(`City`,'_',`State Code`) as city_state_code,
    SAFE_CAST(`Median Age` AS FLOAT64) as median_age,
    SAFE_CAST(`Total Population` AS INT64) as total_population,
    round(SAFE_DIVIDE(SAFE_CAST(`Male Population` AS INT64),SAFE_CAST(`Total Population` AS INT64)),2) as male_sex_ratio,
    round(`Average Household Size`,2) as average_household_size
from {{source("us_cities_population_datasoft","us_cities_population_formatted")}}
)
select *
from source_data
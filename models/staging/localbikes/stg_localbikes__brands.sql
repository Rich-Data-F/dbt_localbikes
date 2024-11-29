{{ config(materialized="view") }}
with
    source_data as (
        select brand_id, brand_name
        from {{ source("localbikes", "brands") }}
    )

select *
from source_data

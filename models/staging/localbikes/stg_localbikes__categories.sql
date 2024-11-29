{{ config(materialized="view") }}

with
    source_data as (
        select *
        from {{ source("localbikes", "categories") }}
    )

select *
from source_data

{{ config(materialized="table") }}
with source_data as (select * from {{ source("localbikes", "customers")}})
select customer_id, 	
    first_name,
    last_name,	
    concat(first_name,' ',last_name) as full_name,
    phone,
    email,
    street,
    city,
    state,
    count(*) as line_count,
from source_data
group by
    customer_id, 	
    first_name,
    last_name,	
    full_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
order by
     customer_id, line_count desc
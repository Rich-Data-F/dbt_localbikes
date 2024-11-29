/* {{ config(materialized="view") }}*/
with source_data_orders as (select * from {{ source("localbikes", "orders") }})

select
    order_id,
    customer_id, -- foreign key
    order_status,
    order_date,
    required_date,
    case when shipped_date = 'NULL' THEN null else shipped_date end as shopped_date,
--    ifnull(shipped_date, 'pending') as shipped_date_status,  /* requires correction
    store_id, -- foreign key
    staff_id, -- foreign key
    count(*) as line_count
from source_data_orders
group by
    order_id,
    customer_id,
    order_status,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,
    staff_id
order by order_id, line_count desc
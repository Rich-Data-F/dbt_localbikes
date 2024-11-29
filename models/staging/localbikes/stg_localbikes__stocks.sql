/* {{ config(materialized="view") }}*/
with source_data as (select * from {{ source("localbikes", "stocks") }})
/* 'fivetrandestination.localbikes.stocks`) */
/* */
select
    concat(store_id, '_', product_id) as store_product_id,
    store_id,
    product_id,
    quantity as stock_quantity,
    count(*) as line_count,
from source_data
group by store_product_id, store_id, product_id, quantity
order by store_product_id, line_count desc

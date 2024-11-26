/* {{ config(materialized="view") }}*/
with
    source_data_order_items as (select * from {{ source("localbikes", "order_items") }})

select
    concat(order_id, '_', item_id) as order_items_id,
    product_id,
    quantity,
    list_price as unit_product_price,
    discount,
    round(list_price * quantity * (1 - discount),2) as order_paid_price,
    count(*) as line_count,
from source_data_order_items
group by
    order_items_id, product_id, quantity, unit_product_price, discount, order_paid_price
order by line_count desc

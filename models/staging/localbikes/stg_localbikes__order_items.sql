/* {{ config(materialized="view") }}*/
with
    source_data_order_items as (select * from {{ source("localbikes", "order_items") }})

select
    order_id,
    concat(order_id, '_', item_id) as order_item_id,
    product_id,
    quantity as order_quantity,
    list_price as product_unit_price,
    discount,
    round(list_price * quantity * (1 - discount),2) as order_item_paid_price,
/*    count(*) as line_count,*/
from source_data_order_items
group by
    order_id, order_item_id, product_id, order_quantity, product_unit_price, discount, order_item_paid_price
/*order by line_count desc*/

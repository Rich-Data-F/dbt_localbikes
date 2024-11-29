with order_items_interim as (
select 
    o.order_id as order_id,
    oi.order_item_id as order_item_id,
    o.customer_id as customer_id,
    o.order_status as order_status,
    o.order_date as order_date,
    o.store_id as store_id,
    o.staff_id as staff_id,
    oi.product_id as product_id,
    order_quantity,
    discount,
    order_item_paid_price,
from {{ ref('stg_localbikes__order_items') }} AS oi
left join {{ ref('stg_localbikes__orders') }} AS o ON o.order_id = oi.order_id 
)
select 
    order_id,
    oii.customer_id as customer_id,
    c.full_name as customer_full_name,
    c.city as city,
    c.state as state,
    order_status,
    order_date,
    store_id,
    staff_id,
    sum(order_quantity) as total_order_articles,
    sum(order_item_paid_price) as total_order_amount,
from order_items_interim  as oii
left join {{ ref('stg_localbikes__customers') }} as c ON c.customer_id = oii.customer_id
group by 
    order_id,
    customer_id,
    customer_full_name,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id
{{ config(materialized="table") }}
select
    ss.product_id,
    pcb.product_name,
    brand_name,
    category_name,
    model_year,
    list_price,
    store_name,
    state,
    city,
    store_id,
    sum(ss.stock_quantity) as product_at_store_quantity
from {{ref('int_localbikes__products_w_categories_brands')}} as pcb
left join {{ref('int_localbikes__stocks_w_stores')}} as ss ON ss.product_id=pcb.product_id
group by
    ss.product_id,
    pcb.product_name,
    brand_name,
    category_name,
    model_year,
    list_price,
    store_name,
    state,
    city,
    store_id
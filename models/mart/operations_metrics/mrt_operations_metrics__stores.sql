{{ config(materialized="table") }}
select
    int.city,
    int.state,
    int.store_id,
    stores.store_name,
    int.order_date,
    count(int.order_id) as total_orders_number,
    sum(int.total_order_amount) as total_orders_amount,
    avg(int.total_order_articles) as average_order_articles_number,
    sum(int.total_order_articles) as total_ordered_articles_number,
    avg(int.total_order_amount)/count(int.order_id) as average_order_value,
    avg(int.total_order_amount)/sum(int.total_order_articles) as average_article_value,
from {{ref('int_localbikes__orders_w_items_customers')}} as int
left join {{ref('stg_localbikes__stores')}} as stores ON stores.store_id=int.store_id
group by
    store_id,
    store_name,
    state,
    city,
    int.order_date
order by
    store_name
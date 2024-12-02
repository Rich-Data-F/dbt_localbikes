{{ config(materialized="table") }}
select
    order_date,
    state,
    count(order_id) as total_orders_number,
    sum(total_order_amount) as total_orders_amount,
    avg(total_order_articles) as average_order_articles_number,
    sum(total_order_articles) as total_ordered_articles_number,
    avg(total_order_amount)/count(order_id) as average_order_value,
    avg(total_order_amount)/sum(total_order_articles) as average_article_value
from {{ref('int_localbikes__orders_w_items_customers')}}
group by
    order_date,
    state
order by
    order_date

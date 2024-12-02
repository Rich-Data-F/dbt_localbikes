{{ config(materialized="table") }}
select
    customer_full_name,
    city,
    state,
    count(order_id) as total_orders_number,
    sum(total_order_amount) as total_orders_amount,
    round(avg(total_order_articles),2) as average_ordered_articles,
    sum(total_order_articles) as total_ordered_articles_number,
    min(order_date) as first_order_date,
    max(order_date) as latest_order_date,
    count(order_id) / NULLIF(DATE_DIFF(max(order_date),min(order_date),DAY),0)*365 AS average_yearly_order_numbers,
    FORMAT('%.2f%%', avg(average_discount*total_order_articles)* 100) as average_discount,
    DATE_DIFF(max(order_date),min(order_date),DAY) as customer_lifetime_span,
    Round(SUM(total_order_amount) / NULLIF(DATE_DIFF(max(order_date),min(order_date),DAY),0)*365,2) AS average_yearly_customer_value,
    Round(SUM(total_order_articles) / NULLIF(DATE_DIFF(max(order_date),min(order_date),DAY),0)*365,2) AS average_yearly_articles_number
from {{ref('int_localbikes__orders_w_items_customers')}}
group by
    customer_full_name,
    city,
    state
order by
    customer_full_name
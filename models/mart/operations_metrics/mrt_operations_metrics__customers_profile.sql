{{ config(materialized="table") }}
with interim_data as (
select
    customer_full_name,
    city,
    state,
    total_orders_number,
    total_orders_amount,
    average_ordered_articles,
    total_ordered_articles_number,
    average_yearly_order_numbers,
    average_discount, -- to be formated as %
    customer_lifetime_span,
    average_yearly_customer_value,
    average_yearly_articles_number
from {{ref('mrt_operations_metrics__customers_level')}}
)
SELECT
    customer_full_name,
    CASE
        WHEN average_yearly_customer_value > 5000 OR
            average_yearly_articles_number > 25
        THEN 'High Value Customer'
        WHEN average_yearly_customer_value BETWEEN 1500 AND 5000 OR
            average_yearly_articles_number BETWEEN 5 AND 25
            THEN 'Medium Value Customer'
        ELSE 'Basic Customer'
    END AS customer_profile_group
From interim_data
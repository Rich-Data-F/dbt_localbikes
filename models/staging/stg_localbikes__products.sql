/* {{ config(materialized="view") }}*/

with source_data as (select * FROM {{ source("localbikes",     "products") }})
/*(`fivetrandestination.localbikes.products`)*/ 
SELECT
    product_id,
    product_name,
    brand_id,
    category_id,	
    model_year,	
    list_price,
    count(*) as line_count
from source_data
group by
    product_id,
    product_name,
    brand_id,
    category_id,	
    model_year,	
    list_price
order by product_id, line_count desc
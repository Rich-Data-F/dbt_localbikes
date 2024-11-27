/* {{ config(materialized="view") }}*/

with source_data as (select * FROM {{ source("localbikes", "staffs")}})
/*(SELECT * FROM fivetrandestination.localbikes.staffs)*/

SELECT
    staff_id,	
    first_name,
    last_name,	
    email,
    phone,
    active, # left in also all rows currently at 1
    store_id,
    manager_id,
    count(*) as line_count,
from source_data
group by
    staff_id,
    first_name,
    last_name,	
    email,
    phone,
    active, # left in also all rows currently at 1
    store_id,
    manager_id
order by staff_id, line_count desc
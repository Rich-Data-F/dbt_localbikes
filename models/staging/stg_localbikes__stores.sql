/* {{ config(materialized="view") }}*/

with source_data as 
(SELECT * FROM {{ source("localbikes","stores") }}) 
/*fivetrandestination.localbikes.stores*/
SELECT
  store_id,
  store_name,
  phone,
  email,
  street,	
  city,	
  state,
/*  count(*) as line_count,*/
from source_data
group by
  store_id,
  store_name,
  phone,
  email,
  street,	
  city,	
  state
order by
  store_id
/*  line_count desc */
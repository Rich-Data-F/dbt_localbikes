select
    p.product_id,
    p.product_name,
    b.brand_name,
    cat.category_name,
    model_year,
    list_price,
from {{ref('stg_localbikes__products')}} as p
left join {{ref('stg_localbikes__brands')}} as b on b.brand_id=p.brand_id
left join {{ref('stg_localbikes__categories')}} as cat on cat.category_id=p.category_id
order by
    product_id
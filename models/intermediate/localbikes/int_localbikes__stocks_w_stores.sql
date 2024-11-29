SELECT
    r.store_id,
    k.product_id,
    p.product_name,
    stock_quantity,
    r.city,
    r.state,
FROM
    {{ref('stg_localbikes__stocks')}} as k
    left join {{ref('stg_localbikes__stores')}} as r on k.store_id=r.store_id
    left join {{ref('stg_localbikes__products')}} as p on p.product_id=k.product_id
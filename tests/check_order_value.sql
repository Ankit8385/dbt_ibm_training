{# singular test #}

select order_id, total_price from {{ref('stg_orders')}} where total_price <= {{var('v_min_order')}}
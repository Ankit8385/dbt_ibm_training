{{config(materialized='table')}}

with cust_order_region as (select 
    customer_id,
    stgc.nation_id,
    stgc.name as c_name,
    stgc.address,
    stgn.name as n_name,
    stgr.name as r_name,
    phone_number,
    account_number,
    market_segment
from {{ref('stg_customers')}} stgc
join {{ref('stg_nations')}} stgn on stgc.nation_id = stgn.nation_id
join {{ref('stg_regions')}} stgr on stgn.region_id = stgr.region_id )

select * from cust_order_region
with source as (select * from {{ ref('stg_lineitems') }}),

changed as (

    select

        l_orderkey as order_id,
        l_partkey as part_id,
        l_suppkey as supplier_id,

        -- descriptions
        l_linenumber as line_number,
        l_comment as comment,
        l_shipmode as ship_mode,
        l_shipinstruct as ship_instructions,
        
        -- numbers
        l_quantity as quantity,
        l_extendedprice as extended_price_usd,
        l_extendedprice*0.86 as extended_price_eur,
        l_discount as discount_percentage,
        l_tax as tax_rate_usd,
        l_tax*0.86 as tax_rate_eur,
        
        -- status
        l_linestatus as status_code,
        l_returnflag as return_flag,
        
        -- dates
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date

    from source

)

select * from changed

with 
source as (
    select * from {{ source('gz_source', 'ship') }}
),
renamed as (
    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost AS FLOAT64) as ship_cost
    from source
)
select * from renamed

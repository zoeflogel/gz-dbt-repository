with 

source as (

    select * from {{ source('gz_source', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        CAST (ship_cost AS FLOAT)

    from source
    where shipping_fee != shipping_fee_1
)

select * from renamed

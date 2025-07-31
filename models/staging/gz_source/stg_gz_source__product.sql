with 
source as (
    select * from {{ source('gz_source', 'product') }}
),

renamed as (
    select
        products_id,
        purchse_price as purchase_price
    from source
)
select * from renamed

SELECT
    sales.date_date,
    sales.orders_id,
    sales.quantity,
    sales.revenue,
    prod.purchase_price,
    CAST(prod.purchase_price AS FLOAT64)*sales.quantity AS purchase_cost,
    ROUND((sales.revenue - (sales.quantity * CAST(prod.purchase_price AS FLOAT64))),2) AS margin
FROM {{ ref("stg_gz_source__sales")}} AS sales
JOIN {{ ref("stg_gz_source__product")}} AS prod
ON sales.products_id = prod.products_id

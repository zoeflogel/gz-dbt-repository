 SELECT
     sales_margin.orders_id,
     sales_margin.date_date,
     ROUND(SUM(sales_margin.revenue),2) as revenue,
     ROUND(SUM(sales_margin.quantity),2) as quantity,
     ROUND(SUM(sales_margin.purchase_cost),2) as purchase_cost,
     ROUND(SUM(sales_margin.margin),2) as margin
 FROM {{ ref("int_sales_margin") }} AS sales_margin
 GROUP BY sales_margin.orders_id, sales_margin.date_date
 ORDER BY sales_margin.orders_id DESC
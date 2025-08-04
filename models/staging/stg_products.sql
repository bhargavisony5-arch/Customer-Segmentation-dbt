{{ config(materialized='view') }}

WITH cleaned AS (
  SELECT *
  FROM {{ source('public', 'products') }}
  WHERE id != 35  
)

SELECT
  id AS product_id,
  name AS product_name,
  category,
  price_gbp
FROM cleaned
ORDER BY product_id

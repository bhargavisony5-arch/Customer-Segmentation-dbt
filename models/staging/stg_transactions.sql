{{ config(materialized='view') }}

WITH source AS (
  SELECT *
  FROM {{ source('public', 'transactions') }}
)

SELECT
  id AS transaction_id,
  customer_id,
  CASE
    WHEN product_id = 35 THEN 30
    ELSE product_id
  END AS product_id,
  quantity::integer,
  transaction_date::date
FROM source
ORDER BY transaction_id

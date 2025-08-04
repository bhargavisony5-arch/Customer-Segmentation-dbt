{{ config(materialized='table') }}

WITH t AS (
  SELECT
    transaction_id,
    customer_id,
    product_id,
    quantity,
    transaction_date
  FROM {{ ref('stg_transactions') }}  -- test commit
),

p AS (
  SELECT
    product_id,
    price_gbp
  FROM {{ ref('stg_products') }}
)

SELECT
  t.transaction_id,
  t.customer_id,
  t.product_id,
  t.quantity,
  t.transaction_date,
  p.price_gbp,
  (t.quantity * p.price_gbp) AS total_amount
FROM t
JOIN p ON t.product_id = p.product_id

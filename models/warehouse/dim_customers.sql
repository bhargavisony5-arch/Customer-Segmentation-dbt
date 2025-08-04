{{ config(materialized='table') }}

SELECT
  customer_id,
  full_name,
  email,
  gender,
  age,
  country_code,
  country_name,
  signup_date
FROM {{ ref('stg_customers') }}

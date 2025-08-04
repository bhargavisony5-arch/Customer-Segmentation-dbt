{{ config(materialized='table') }}

with customer_metrics as (
  select
    customer_id,
    sum(total_amount) as total_spent,
    count(*) as num_transactions,
    count(distinct product_id) as num_products
  from {{ ref('fact_transactions') }}
  group by customer_id
),

segments as (
  select
    *,
    ntile(3) over (order by total_spent desc) as spend_rank,
    ntile(3) over (order by num_transactions desc) as freq_rank,
    ntile(2) over (order by num_products desc) as diversity_rank
  from customer_metrics
)

select
  customer_id,
  total_spent,
  num_transactions,
  num_products,

  case spend_rank when 1 then 'High' when 2 then 'Medium' else 'Low' end as spend_segment,
  case freq_rank when 1 then 'Frequent' when 2 then 'Occasional' else 'Rare' end as frequency_segment,
  case diversity_rank when 1 then 'Diverse' else 'Focused' end as diversity_segment

from segments

{{
  config(
    materialized='view'
  )
}}

select
  ord.OrderId,
  ord.CustomerId,
  {{ initcap('ord.SalesPerson') }} as SalesPerson,
  cast(ord.OrderPlacedTimestamp as timestamp) as OrderPlacedTimestamp,
  ord.OrderStatus,
  cast(ord.UpdatedAt as timestamp) as UpdatedAt
from {{ ref('raw_orders') }} as ord

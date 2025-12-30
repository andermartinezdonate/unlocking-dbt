-- analysis/revenue_by_salesperson.sql
select
  SalesPerson,
  sum(Revenue) as total_revenue
from main_finance.fct_revenue_orders
group by 1;

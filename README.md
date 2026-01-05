# dbt Analytics Engineering Project (DuckDB)

This project models a small transactional dataset representing customers,
orders, order items, and products. The objective is to demonstrate how raw data
can be transformed into analytics-ready fact and dimension tables using dbt
best practices, including layered modeling, reusable macros, and data quality
testing.

The project is designed as a **portfolio example** of analytics engineering
rather than a production data warehouse.

---

## Objectives

- Apply dbt core concepts in a realistic project structure
- Separate raw data, staging, intermediate, and mart layers
- Build analytics-ready fact and dimension tables
- Use macros to avoid duplicated SQL logic
- Enforce data quality with dbt tests
- Demonstrate different materialization strategies

---

## Tech Stack

- **dbt Core**
- **DuckDB** (local analytical database)
- **SQL + Jinja**
- **dbt-utils**

---

## Project Structure

```
models/
├── staging/
│   ├── crm/                      # CRM sources and light cleaning
│   └── furniture_mart/           # Furniture mart sources and light cleaning
├── intermediate/
│   ├── operations/               # Reusable joins and intermediate datasets
│   └── finance/                  # Finance-specific intermediate logic
├── marts/
│   ├── operations/               # Operational fact tables
│   │   ├── fct_orders.sql
│   │   └── fct_daily_orders.sql
│   └── finance/                  # Revenue-focused fact tables
│       ├── fct_revenue_orders.sql
│       ├── fct_revenue_orders_insert_overwrite_static.sql
│       └── fct_revenue_orders_insert_overwrite_dynamic.sql
└── dimensions/
    └── dim_customers.sql          # Customer dimension
```

Additional folders:
- `macros/` — reusable SQL logic (e.g. phone number formatting)
- `seeds/` — raw CSV data loaded into DuckDB
- `tests/` — custom data tests
- `snapshots/` — snapshot examples
- `models/*_schema.yml` — tests and documentation

---

## Data Layers

### Raw
Raw data is loaded into DuckDB using **dbt seeds**, producing tables such as:
- `raw_customers`
- `raw_orders`
- `raw_orderitems`
- `raw_products`

### Staging
Staging models perform:
- column renaming
- basic cleaning
- type casting
- no business logic

### Intermediate
Intermediate models:
- join multiple staging tables
- encapsulate reusable logic
- prepare datasets for analytics marts

### Marts (Final Outputs)
Analytics-ready datasets intended for consumption by BI tools or downstream
analytics.

**Final tables include:**
- `dim_customers` — customer dimension (one row per customer; uniqueness validated)
- `fct_orders` — orders fact table
- `fct_daily_orders` — daily aggregated orders
- `fct_revenue_orders` — revenue-focused fact tables (including alternative
  insert-overwrite strategies)

---

## Macros

The project uses custom macros to encapsulate reusable SQL logic, such as:
- phone number formatting
- shared transformation patterns

Macros run at **compile time** and generate SQL that is executed in the database.

---

## Tests

Data quality is enforced using dbt tests, including:
- `not_null`
- `unique`
- `relationships`

Tests are defined alongside models in `schema.yml` files and treated as **data
contracts**, not data fixes.

---

## Why DuckDB

DuckDB is used because:
- it runs locally with zero infrastructure
- it supports analytical SQL workloads
- it makes the project fully reproducible

All dbt patterns used in this project are **warehouse-agnostic** and directly
transferable to platforms such as BigQuery, Snowflake, or Redshift.

---

## How to Run

```bash
dbt deps
dbt seed
dbt run
dbt test
```

---

## Attribution

This project is inspired by the book  
*Unlocking dbt: Design and Deploy Transformations in Your Cloud Data Warehouse*  
by Cameron Cyr & Dustin Dorsey (Apress, 2023).

The original materials have been extended, reorganized, and adapted to form a
complete analytics engineering portfolio project.

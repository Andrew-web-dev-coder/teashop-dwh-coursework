# teashop-dwh-coursework

#  Teashop Data Warehouse – Coursework Project

This repository contains the complete implementation of a data warehouse solution for a fictional tea shop business. The project covers the entire pipeline from data ingestion (OLTP) to analytical reporting (OLAP), including ETL processing and visualization.

---

##  Folder Structure

csv_data/ # Raw data files (.csv) to be loaded into staging (OLTP)
load_scripts/ # SQL scripts to create OLTP tables and perform ETL
schemas/ # OLTP and OLAP schema diagrams (.drawio and .png)
sql_queries/ # Insightful SQL queries from both OLTP and OLAP
PowerBI/ # Power BI .pbix report
solution_report/ # Final documentation (solution.docx)
README.md # Project overview


---

## Setup & Execution

### 1. Create OLTP Tables
Run `load_scripts/create_oltp_tables.sql` in pgAdmin to create all OLTP base tables.

### 2. Load CSVs to Staging
Run `load_scripts/load_csv_to_staging.sql` to populate `stg_*` tables from files in `csv_data/`.

### 3. Run ETL Process
Run `load_scripts/etl_process.sql` to transform data from staging to dimensional OLAP tables.

---

##  Queries

- `sql_queries/oltp_queries.sql` – at least 3 SQL queries to extract business-level insights from OLTP tables.
- `sql_queries/olap_queries.sql` – at least 3 SQL queries on OLAP schema to answer analytical questions.

---

##  Reports

Power BI dashboard (`PowerBI/Course Work Report.pbix`) includes:
- Sales trends over years
- Category performance
- Customer analytics

---

##  Documentation

See `solution_report/Course Work Documentation.docx` for:
- OLTP/OLAP context
- Schema descriptions and relationships
- ETL instructions
- Power BI explanation

---

##  Technologies Used

- PostgreSQL (pgAdmin 4)
- Power BI
- draw.io
- SQL (DDL, DML, ETL logic)
- CSV (data sources)

---

## Author

Coursework by Andrew Yeudakimau 

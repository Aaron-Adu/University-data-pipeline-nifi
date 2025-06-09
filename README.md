# University Data Warehouse Pipeline with Apache NiFi

This project demonstrates multiple Apache NiFi-based ETL/ELT pipelines for ingesting, transforming, and loading diverse data sources into PostgreSQL. Designed for an on-premise university data warehouse testbed, it includes integrations with Prometheus and Grafana for observability.

---

## 🚀 Project Highlights

- **ETL/ELT pipelines** using Apache NiFi 1.28.1
- Integration with **PostgreSQL**
- Real-world sources: **CSV**, **Public APIs**, and **Apache Logs**
- Monitoring via **Prometheus + Grafana**
- Timestamping, error handling, schema inference
- Suitable for staging or production-level data engineering use cases

---

## 🔧 Tech Stack

- Apache NiFi 1.28.1
- PostgreSQL
- Prometheus + Grafana
- Bash / Linux / Java 17
- JSON, CSV, SQL

---

## 📁 Included Pipelines

### 1. CSV to PostgreSQL (ELT)
- Reads CSV → Splits → Loads into PostgreSQL table
- Processors: `GetFile` → `RouteOnAttribute` → `SplitRecord` → `PutDatabaseRecord`

### 2. CSV ETL with SQL Transformations
- Applies filtering and transformation using `QueryRecord`
- Adds category field: *adult* / *minor*

### 3. Apache Access Log Ingestion
- Uses `TailFile` + regex parsing to transform logs to structured JSON
- Enriches with ingestion timestamp
- Loads into PostgreSQL for audit/dashboarding

### 4. Public API → CSV
- Uses `InvokeHTTP` → `SplitJson` → `EvaluateJsonPath` → `AttributesToCSV` → `PutFile`

### 5. MySQL → PostgreSQL
- Simulates DB-to-DB migration: `ExecuteSQL` → `ConvertAvroToJSON` → `PutSQL`

---

## 🧪 How to Reproduce

1. Clone the repo
2. Import any `.xml` template into NiFi
3. Run the SQL scripts in the `SQL_Schemas/` folder to create test tables
4. Feed sample data in `Sample_Data/` or configure live API log files
5. Monitor via Grafana (JSON dashboards provided)

---

## 🎥 Demo (Optional)

Hosted demo or walkthrough video coming soon. 

---

## 📸 Screenshots

*Add images of your NiFi canvas, Grafana dashboards, PostgreSQL outputs.*

---

## 👨‍💻 Author

Aaron Offei Adu-Assifo  
Senior ICT Assistant  
University Information Technology Services, KNUST

---

## 📝 License

None

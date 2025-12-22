# 🧾 PAN Number Validation Project (SQL)

A data quality and validation project built using **SQL (PostgreSQL)**.  
The goal is to **clean, validate, and classify PAN numbers** using business rules, regex, SQL functions, and analytical reporting.

This project demonstrates **real-world SQL skills** such as data cleaning, validation logic, custom functions, views, and reporting.

---

## ✨ Key Features
- Data cleaning (NULLs, spaces, letter case)
- PAN format validation using **Regex**
- Custom SQL functions:
  - Repeated character detection
  - Sequential character detection
- Classification of PANs into **Valid / Invalid**
- Final summary report for analytics

---

## 📌 PAN Validation Rules
A PAN number is considered **VALID** if:
- Matches the format:  
  **`[A-Z]{5}[0-9]{4}[A-Z]`**
- Does **not** contain:
  - Repeated consecutive characters
  - Sequential characters (ABCDE, 1234)
- Is not NULL or empty

---

## 🛠 Tech Stack
- PostgreSQL
- SQL (CTEs, Views, Functions)
- Regex
- Data Validation Logic

---

## 📂 Project Structure
.
├── numbers_foods.sql # Main SQL script
├── README.md

yaml
Copy code

---

## ▶️ How to Run the Project

### 1️⃣ Prerequisites
- Install **PostgreSQL**
- Use one of the following:
  - pgAdmin
  - psql (command line)

---

### 2️⃣ Create the Table
```sql
CREATE TABLE numbers_foods (
    pan_number TEXT
);
Insert your data:

sql
Copy code
INSERT INTO numbers_foods (pan_number)
VALUES
('ABCDE1234F'),
('AAAAA1111A'),
('ABCDE1234Z'),
(NULL),
('  abcde1234f ');
3️⃣ Create Validation Functions
Run the SQL functions:

fn_has_repeated_chars

fn_is_sequential

These functions detect invalid PAN patterns.

4️⃣ Create Validation View
sql
Copy code
CREATE OR REPLACE VIEW vw_valid_invalid_pans AS ...
This view classifies PANs as:

✅ Valid PAN

❌ Invalid PAN

5️⃣ View Results
sql
Copy code
SELECT * FROM vw_valid_invalid_pans;
6️⃣ Generate Final Report
sql
Copy code
SELECT
    total_processed_records,
    total_valid_pans,
    total_invalid_pans,
    total_missing
FROM final_report;
📊 Sample Output
PAN Number	Status
ABCDE1234F	Valid PAN
AAAAA1111A	Invalid PAN
NULL	Missing

💡 What This Project Shows
✔ Strong SQL fundamentals
✔ Data quality & validation logic
✔ Business-rule implementation
✔ Analytical thinking
✔ Production-style SQL design

👤 Author
Mahmoud Saad

GitHub: https://github.com/msd9090

Kaggle: https://www.kaggle.com/mah20050











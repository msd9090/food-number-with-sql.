# 🍲 Food Industry Data Cleaning & PAN Validation

![Excel](https://img.shields.io/badge/Source-Excel_Sheet-green.svg)
![SQL](https://img.shields.io/badge/Processing-PostgreSQL-blue.svg)

This project automates the cleaning and validation of food-related records imported from Excel spreadsheets. It specifically targets the **PAN (Permanent Account Number)** associated with food vendors and ingredients.

---

## 📊 Data Overview (Excel Structure)
The source data is an Excel file containing food item details. The SQL pipeline processes this data to ensure it meets quality standards.

### Data Attributes:
* **Food Category:** Types of food products.
* **Ingredient ID:** Unique numbers for food components.
* **PAN Number:** Security identification numbers that require strict validation.



---

## 🛠️ Data Cleaning Pipeline
When Excel data is imported, it often contains "noise." This project handles:
1. **White Spaces:** Removing leading/trailing spaces from Excel cells.
2. **Case Sensitivity:** Standardizing all entries to Uppercase.
3. **Pattern Matching:** Ensuring the PAN follows the legal format using Regex.



---

## 🚀 How to Run
1. **Import:** Load your Excel data into the `numbers_foods` table.
2. **Clean:** Run the SQL scripts to trim and format the data.
3. **Validate:** Use the `fn_check` functions to flag invalid or suspicious entries.

## 📈 Final Report (Output)
The system generates a summary table showing the health of the imported Excel data:

| Total Excel Rows | Validated Records | Flagged (Invalid) | Missing Info |
| :--- | :--- | :--- | :--- |
| 10,000 | 9,200 | 750 | 50 |

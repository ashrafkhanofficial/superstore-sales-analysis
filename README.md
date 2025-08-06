# Superstore Sales Data Analysis 📊

This project presents an exploratory data analysis of the Superstore dataset using **Microsoft Excel**.

## 📁 Dataset
- Downloaded from [Kaggle](https://www.kaggle.com/)
- Contains sales data of a fictional retail store, including details like Order Date, Category, Region, Sales, Profit, and Quantity.

## 🧩 Tools Used
- Microsoft Excel
  - Tables
  - Pivot Tables
  - Slicers
  - Timelines
  

## 🔍 Analysis Performed
- Converted raw data into Excel Tables for better filtering and referencing.
- Created **Pivot Tables** to analyze:
  - Total **Sales**, **Profit**, and **Quantity** by:
    - Category
    - Region
    - State
    - Product Name
- Added **Slicers** to filter by Region and Category interactively.
- Added a **Timeline** to analyze trends over time.
- Used basic formatting to enhance data readability.

## 🛢 SQL-Based Analysis (MySQL Workbench)

This section explains how to set up and perform analysis using MySQL.

### 📄 Project Files
- `superstore.sql` – Contains:
  - SQL to create the database and table
  - Sample queries to extract insights
- `superstore.csv` – The dataset file (CSV format)

### ⚙️ Setup Instructions

#### 🔹 Step 1: Create Database and Table
1. Open **MySQL Workbench**.
2. Open a **new SQL tab**.
3. Copy the initial lines from `sql analysis of superstore.sql`:
   ```sql
   CREATE DATABASE superstore_db;
   USE superstore_db;
   create table query written in the `sql analysis of superstore.sql`
4. Right Click on the database superstore and click on `table data import wizard`.
5. Browse the attached file name `cleaned superstore.csv`
6. Select the table created in superstore database and and click next.
7. Verify the columns mapping and execute it.
8. Run all the queries one by one to get insights.

## 📊 Insights Gained
- Identified high-performing product categories.
- Found which regions and states generated the most profit.
- Analyzed trends in sales and profit over time.
- Enabled interactive filtering for deeper exploration.
- Sql analysis insights are commented before each query in the file.

## 🧠 Future Enhancements
- Re-create this analysis in **Power BI** for interactive dashboards.
- Perform more advanced analytics using **Python (pandas & matplotlib)**.

## 📂 Files
- `analysis of superstore.xlsx` – The Excel workbook with the analysis.
- `cleaned superstore.csv` - The superstore dataset
- `sql analysis of superstore.sql`

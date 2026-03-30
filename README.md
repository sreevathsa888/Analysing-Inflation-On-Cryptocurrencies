# 📊 Analyzing the Impact of Inflation on Cryptocurrency Prices

## 📌 Project Overview

This project explores how macroeconomic factors such as **inflation (CPI)** and **interest rates** influence cryptocurrency prices, specifically **Bitcoin, Ethereum, and Solana**.

Using a complete **data science pipeline**, the project combines data preprocessing, exploratory analysis, statistical modeling, and interactive visualization.

---

## 🎯 Objectives

* Analyze the relationship between inflation and cryptocurrency prices
* Study the effect of interest rates on crypto market behavior
* Evaluate whether cryptocurrencies act as an inflation hedge
* Build predictive models for Bitcoin price movements

---

## 📦 Dataset Description

The dataset includes:

* 📅 Date (time-series data)
* 💰 Bitcoin, Ethereum, Solana prices
* 📈 CPI (Inflation)
* 🏦 Interest Rate (Federal Funds Rate)

---

## ⚙️ Methodology

### 1️⃣ Data Collection

* Historical crypto price datasets (CSV)
* CPI and interest rate datasets

### 2️⃣ Data Preprocessing

* Date formatting
* Merging datasets
* Handling missing values
* Feature alignment

### 3️⃣ Exploratory Data Analysis (EDA)

* Price trend visualization
* Inflation trend analysis
* Correlation analysis
* Rolling correlation between CPI and crypto prices

### 4️⃣ Predictive Modeling

* **Linear Regression Model**

  * BTC_price ~ CPI + Interest_rate
* Model evaluation using:

  * RMSE (Root Mean Square Error)
  * R² (Coefficient of Determination)

### 5️⃣ Time Series Forecasting

* ARIMA model for Bitcoin price prediction
* 30-day forecast visualization

---

## 📊 Power BI Dashboard

The project includes an interactive Power BI dashboard with:

### 🔹 Overview Page

* KPI cards (Average price, volatility, max values)
* Crypto price trends
* Date slicer

### 🔹 Macro Analysis Page

* Bitcoin vs Inflation scatter plot
* CPI & Interest rate trends
* Correlation insights

### 🔹 Modeling & Forecast Page

* Actual vs Predicted prices
* Residual analysis
* Forecast visualization

---

## 📈 Key Insights

* Bitcoin shows a **moderate relationship with inflation**
* Cryptocurrencies are **highly volatile** compared to traditional assets
* Interest rates significantly influence crypto price movements
* Crypto does **not consistently act as a reliable inflation hedge**

---

## 🛠️ Tools & Technologies

* **R** (dplyr, ggplot2, forecast, Metrics)
* **Power BI** (Dashboard & visualization)
* **GitHub** (Version control)

---

## 📂 Project Structure

```
crypto-inflation-project/
│
├── data/                # Raw and processed datasets
├── scripts/             # R scripts (data collection, EDA, modeling)
├── outputs/             # Generated plots and results
├── dashboard/           # Power BI file
├── README.md            # Project documentation
```

---

## 🚀 How to Run the Project

1. Open RStudio
2. Run scripts in order:

   * `01_data_collection.R`
   * `02_preprocessing.R`
   * `03_eda.R`
   * `04_modeling.R`
3. Open Power BI dashboard file
4. Refresh data

---

## 🧠 Conclusion

This project demonstrates how macroeconomic indicators influence cryptocurrency markets. While inflation impacts crypto prices, their behavior remains complex and influenced by multiple factors, including market sentiment and interest rates.

---

## 👨‍💻 Author

**Sreevathsa Oleti**

---

## ⭐ Acknowledgment

This project was developed as part of a **Data Mining** course to demonstrate real-world data analysis and visualization skills.

---

# customer-behaviour-analysis
SQL analysis project on retail sales data using PostgreSQL

# Retail Sales Analysis using SQL (PostgreSQL)

## Overview
This project analyzes retail transaction data using SQL only to understand customer behavior, revenue patterns, and churn.


## Tools Used
- PostgreSQL
- SQL
- pgAdmin
- GitHub

## Dataset
Transaction-level retail data with the following columns:
- InvoiceNo, StockCode, Description
- Quantity, UnitPrice
- InvoiceDate, CustomerID, Country

Basic cleaning was applied:
- Removed NULL CustomerID
- Removed negative Quantity and UnitPrice
- Revenue = Quantity × UnitPrice

## Business Questions Answered
- Total revenue and unique customers
- Revenue by country
- Top 10 customers by revenue
- Average Order Value (AOV)
- One-time vs repeat customers
- New customer acquisition (monthly)
- Customer churn
- Top products by revenue

## Key SQL Concepts
- GROUP BY, HAVING
- CASE WHEN
- CTEs
- Views
- Basic window functions (only where required)

## Dataset Note
The full dataset is larger than GitHub's file size limit.  
A sample dataset is provided in the `data` folder for reference.  
The complete dataset can be downloaded from the UCI Machine Learning Repository.



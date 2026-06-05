# GitHub Developer Intelligence Platform

## Overview

Built an end-to-end data analytics solution using Python, MySQL, and Data Warehousing concepts.

The project extracts repository data from the GitHub REST API, transforms it into a dimensional warehouse, and performs analytics on repository popularity, programming language adoption, and owner performance.

---

## Tech Stack

- Python
- Pandas
- GitHub REST API
- MySQL
- SQL
- Data Warehousing

---

## Dataset

- 500 GitHub Repositories
- 425 Unique Owners
- 3 Programming Languages
- 470 Unique Dates

---

## Architecture

GitHub API
↓
Python ETL
↓
CSV
↓
MySQL Staging Table
↓
Star Schema
↓
SQL Analytics

---

## Star Schema

                Dim_Date
                   |
                   |
                   |
Dim_Language --- Fact_Repo_Metrics --- Dim_Repository
                   |
                   |
                   |
             Dim_Owner

---

## SQL Concepts Used

- Joins
- Group By
- Having
- Subqueries
- CTEs
- Window Functions
- Views
- Stored Procedures

---

## Key Analytics

- Top Repositories by Stars
- Top Owners by Stars
- Language Performance Analysis
- Repository Ranking Analysis

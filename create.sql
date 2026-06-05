CREATE DATABASE github_analytics;

USE github_analytics;

CREATE TABLE repositories (
    name VARCHAR(200),
    language VARCHAR(50),
    stars INT,
    forks INT,
    owner VARCHAR(100),
    created_at VARCHAR(50)
);

CREATE TABLE Dim_Language (
    Language_ID INT AUTO_INCREMENT PRIMARY KEY,
    Language_Name VARCHAR(50)
);

CREATE TABLE Dim_Owner (
    Owner_ID INT AUTO_INCREMENT PRIMARY KEY,
    Owner_Name VARCHAR(100)
);

CREATE TABLE Dim_Repository (
    Repo_ID INT AUTO_INCREMENT PRIMARY KEY,
    Repo_Name VARCHAR(200)
);

CREATE TABLE Dim_Date (
    Date_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Date DATE,
    Year INT,
    Month INT,
    Quarter VARCHAR(2)
);

CREATE TABLE Fact_Repo_Metrics (
    Repo_ID INT,
    Language_ID INT,
    Owner_ID INT,
    Stars INT,
    Forks INT
);
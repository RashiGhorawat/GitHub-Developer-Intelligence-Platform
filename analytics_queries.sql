-- Total repositories, stars and forks by language

SELECT
    dl.Language_Name,
    COUNT(*) AS Repo_Count,
    SUM(f.Stars) AS Total_Stars,
    SUM(f.Forks) AS Total_Forks,
    AVG(f.Stars) AS Avg_Stars
FROM Fact_Repo_Metrics f
JOIN Dim_Language dl
    ON f.Language_ID = dl.Language_ID
GROUP BY dl.Language_Name
ORDER BY Total_Stars DESC;


-- Top repositories by stars

SELECT
    dr.Repo_Name,
    f.Stars
FROM Fact_Repo_Metrics f
JOIN Dim_Repository dr
    ON f.Repo_ID = dr.Repo_ID
ORDER BY f.Stars DESC
LIMIT 10;

-- Owners with highest total stars

SELECT
    do.Owner_Name,
    SUM(f.Stars) AS Total_Stars
FROM Fact_Repo_Metrics f
JOIN Dim_Owner do
    ON f.Owner_ID = do.Owner_ID
GROUP BY do.Owner_Name
ORDER BY Total_Stars DESC
LIMIT 10;

-- Rank repositories based on stars

SELECT
    dr.Repo_Name,
    f.Stars,
    RANK() OVER(ORDER BY f.Stars DESC) AS Repo_Rank
FROM Fact_Repo_Metrics f
JOIN Dim_Repository dr
    ON f.Repo_ID = dr.Repo_ID;
    
    -- CTE: Total stars by language

WITH LanguageStars AS
(
    SELECT
        dl.Language_Name,
        SUM(f.Stars) AS Total_Stars
    FROM Fact_Repo_Metrics f
    JOIN Dim_Language dl
        ON f.Language_ID = dl.Language_ID
    GROUP BY dl.Language_Name
)

SELECT *
FROM LanguageStars
ORDER BY Total_Stars DESC;

-- Languages having more than 50 repositories

SELECT
    dl.Language_Name,
    COUNT(*) AS Repo_Count
FROM Fact_Repo_Metrics f
JOIN Dim_Language dl
    ON f.Language_ID = dl.Language_ID
GROUP BY dl.Language_Name
HAVING COUNT(*) > 50;

-- Repositories having more stars than average

SELECT
    dr.Repo_Name,
    f.Stars
FROM Fact_Repo_Metrics f
JOIN Dim_Repository dr
    ON f.Repo_ID = dr.Repo_ID
WHERE f.Stars >
(
    SELECT AVG(Stars)
    FROM Fact_Repo_Metrics
);
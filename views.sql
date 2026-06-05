CREATE VIEW vw_top_repositories AS

SELECT
    dr.Repo_Name,
    f.Stars,
    f.Forks
FROM Fact_Repo_Metrics f
JOIN Dim_Repository dr
    ON f.Repo_ID = dr.Repo_ID;
    
    SELECT *
FROM vw_top_repositories
ORDER BY Stars DESC
LIMIT 10;
create database remote_work
use remote_work
select * from rm

-- Total Count By Gender
SELECT Gender, COUNT(*) AS Count
FROM rm
GROUP BY Gender
ORDER BY Count DESC;


--Count By Industry
SELECT Industry, COUNT(*) AS Count
FROM rm
GROUP BY Industry
ORDER BY Count DESC;


--Count By Age Group
WITH AgeDistribution AS (
    SELECT 
        CASE 
            WHEN Age < 20 THEN 'Under 20'
            WHEN Age BETWEEN 20 AND 29 THEN '20-29'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60 and above'
        END AS Age_Group,
        COUNT(*) AS Frequency
    FROM 
        rm
    GROUP BY 
        CASE 
            WHEN Age < 20 THEN 'Under 20'
            WHEN Age BETWEEN 20 AND 29 THEN '20-29'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            ELSE '60 and above'
        END
)

SELECT Age_Group, Frequency
FROM AgeDistribution
ORDER BY 
    CASE 
        WHEN Age_Group = 'Under 20' THEN 1
        WHEN Age_Group = '20-29' THEN 2
        WHEN Age_Group = '30-39' THEN 3
        WHEN Age_Group = '40-49' THEN 4
        WHEN Age_Group = '50-59' THEN 5
        ELSE 6
    END;

--Count by gender and stress level
SELECT Gender, Stress_Level, COUNT(*) AS Count
FROM rm
GROUP BY Gender, Stress_Level
ORDER BY Gender, Stress_Level;


-- Count by Work location and mental health
SELECT Work_Location, Mental_Health_Condition, 
COUNT(*) AS Count
FROM rm
GROUP BY Work_Location, Mental_Health_Condition
ORDER BY Work_Location, Mental_Health_Condition;

-- count by hours per week and stress level
SELECT Hours_Worked_Per_Week, Stress_Level, 
COUNT(*) AS Count
FROM rm
GROUP BY Hours_Worked_Per_Week, Stress_Level
ORDER BY Hours_Worked_Per_Week, Stress_Level;

-- count by strss level categoty
SELECT Stress_Level, COUNT(*) AS Stress_Count
FROM rm
GROUP BY Stress_Level
ORDER BY Stress_Count DESC;

-- Stress level by age
SELECT 
    CASE
        WHEN Age BETWEEN 20 AND 29 THEN '20-30'
        WHEN Age BETWEEN 30 AND 39 THEN '31-40'
        WHEN Age BETWEEN 40 AND 49 THEN '41-50'
        WHEN Age BETWEEN 50 AND 59 THEN '51-60'
    END AS Age_Group,
    Stress_Level,
    COUNT(*) AS Stress_Count
FROM rm
GROUP BY 
    CASE
        WHEN Age BETWEEN 20 AND 29 THEN '20-30'
        WHEN Age BETWEEN 30 AND 39 THEN '31-40'
        WHEN Age BETWEEN 40 AND 49 THEN '41-50'
        WHEN Age BETWEEN 50 AND 59 THEN '51-60'
    END,
    Stress_Level
ORDER BY Age_Group, Stress_Level;

-- Stress count byStress level and industry 
SELECT Industry,Stress_Level,COUNT(*) AS Stress_Count
FROM rm
GROUP BY Industry, Stress_Level
ORDER BY Industry, Stress_Level;

-- Count by Productivity change and stress level
SELECT Stress_Level,Productivity_Change,COUNT(*) AS Count
FROM rm
GROUP BY Stress_Level, Productivity_Change
ORDER BY Stress_Level, Productivity_Change;


-- Count by Satisfection Level
SELECT Satisfaction_with_Remote_Work,
COUNT(*) AS Employee_Count
FROM rm
GROUP BY Satisfaction_with_Remote_Work
ORDER BY 
    CASE 
        WHEN Satisfaction_with_Remote_Work = 'Satisfied' THEN 1
        WHEN Satisfaction_with_Remote_Work = 'Unsatisfied' THEN 2
        ELSE 3
    END;

-- Count by sleep change and productivity change
SELECT Sleep_Quality, Productivity_Change, 
COUNT(*) AS Count
FROM rm
GROUP BY Sleep_Quality, Productivity_Change
ORDER BY Sleep_Quality, Productivity_Change;


-- count By region and satisfection level
SELECT Region, Satisfaction_with_Remote_Work AS Satisfaction_Level, 
COUNT(Employee_ID) AS Employee_Count
FROM rm
GROUP BY Region, Satisfaction_with_Remote_Work
ORDER BY Region, Satisfaction_Level;


--Increase productivity count by industry
SELECT Industry, 
COUNT(Employee_ID) AS Increase_Count
FROM rm
WHERE Productivity_Change = 'Increase'
GROUP BY Industry
ORDER BY Increase_Count DESC;


--Increase productivity count by Job Role
SELECT Job_Role, 
COUNT(Employee_ID) AS Increase_Count
FROM 
rm
WHERE Productivity_Change = 'Increase'
GROUP BY Job_Role
ORDER BY Increase_Count DESC;




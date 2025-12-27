SELECT * FROM EMPLOYEE;
SELECT * FROM JOBDEPARTMENT;
SELECT * FROM LEAVES;
SELECT * FROM PAYROLL;
SELECT * FROM QUALIFICATION;
SELECT * FROM SALARY_BONUS;

-- 1.EMPLOYEE INSIGHTS
-- HOW MANY UNIQUE EMPLOYEES ARE CURRENTLY IN THE SYSTEM?
SELECT COUNT(DISTINCT EmpID,FirstName,LastName) AS EMPLOYEE_COUNT FROM EMPLOYEE;

-- Which departments have the highest number of employees?
SELECT 
    J.JobDept AS DEPARTMENT,
    COUNT(E.EmpID) AS NUMBER_OF_EMPLOYEE
FROM
    EMPLOYEE E
        JOIN
    JOBDEPARTMENT J ON E.JobID = J.JobID
GROUP BY J.JobDept
ORDER BY NUMBER_OF_EMPLOYEE DESC;

-- What is the average salary per department?
SELECT 
    J.JobDept AS DEPARTMENT,
    AVG(S.Amount) AS AVG_SALARY
FROM
    SALARY_BONUS S
        JOIN
    JOBDEPARTMENT J ON S.JobID = J.JobID
GROUP BY J.JobDept
ORDER BY AVG_SALARY DESC;

-- Who are the top 5 highest-paid employees?
SELECT 
    E.FirstName,
    E.LastName,
    S.Amount,
    S.Annual,
    S.Bonus,
    (S.Annual + S.Bonus) AS TOTAL_COMPOSITION,
    J.JobDept AS DEPARTMENNT
FROM
    EMPLOYEE E
        JOIN
    SALARY_BONUS S ON E.JobID = S.JobID
        JOIN
	JobDepartment J ON E.JobID = J.JobID
ORDER BY TOTAL_COMPOSITION DESC
LIMIT 5;

-- What is the total salary expenditure across the company?
SELECT SUM(TotalAmount) AS MONTH_Expenditures from payroll;

-- 2.JOB ROLE AND DEPARTMENT ANALYSIS
-- How many different job roles exist in each department?
SELECT 
    JobDept, COUNT(DISTINCT JobID) AS NumOfJobRoles
FROM
    Jobs
GROUP BY JobDept;

-- 


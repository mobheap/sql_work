use employees;
SELECT 
    first_name, last_name
FROM
    employees;
SELECT 
    dept_no
FROM
    departments;
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR 'Aruna';
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' and (first_name = 'Kellie' or 'Aruna');
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Elvis' , 'Denis');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'Mark%';
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '%2000%';
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE '1000_';
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE '%Jack%';
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE '%Jack%';
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND hire_date >= '2000-01-01';
SELECT 
    salary
FROM
    salaries
WHERE
    salary > 150000;
SELECT DISTINCT
    hire_date
FROM
    employees;
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
SELECT 
    COUNT(DISTINCT emp_no)
FROM
    dept_manager;
SELECT 
    COUNT(*)
FROM
    dept_manager;
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
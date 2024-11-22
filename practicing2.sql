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
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name;
SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary;
SELECT 
    emp_no, COUNT(emp_no) AS number_of_contracts
FROM
    dept_emp
WHERE
    from_date > '2000=01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1;
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;
use employees;
insert into employees
values (999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
commit;
update departments
set dept_name = 'Data Analysis'
where dept_name = 'Business Analysis';
DELETE FROM departments 
WHERE
    dept_no = 'd010';
select * from departments;
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
SELECT 
    MIN(emp_no)
FROM
    employees;
SELECT 
    MAX(emp_no)
FROM
    employees;
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
SELECT 
    ROUND(AVG(salary), 3)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
USE employees;
CREATE TABLE departments_dup (
    dept_no CHAR(4),
    dept_name VARCHAR(40)
);
insert into departments_dup
SELECT dept_no, dept_name from departments;
SELECT 
    *
FROM
    departments_dup;
insert into departments_dup
values (null, 'Public Relations');
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
insert into departments_dup(dept_no)
values('d010'), ('d011');


DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup
SELECT * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
						(999905, '2017-01-01'),
						(999906, '2017-01-01'),
						(999907, '2017-01-01');
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES               ('Public Relations');
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
use employees;
SELECT 
    m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager m
        JOIN
    employees e ON m.emp_no = e.emp_no;
select * from titles;
SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch';

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    d.dept_name,
    m.from_date
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no;
use employees;
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
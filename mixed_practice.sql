-- (practice01 - practice07) are about INNER JOIN and LEFT JOIN
-- (practice08 - practice16) are from Midterm Test at TNI on 2026-01-26


-- practice01
SELECT last_name, job_title
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id
WHERE job_title = 'Programmer';


-- practice02
SELECT count(last_name), job_title
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id
WHERE job_title = 'Programmer'
GROUP BY job_title;


-- practice03
SELECT last_name, job_title, department_name
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id 
                    INNER JOIN hr.departments d ON e.department_id = d.department_id
WHERE job_title = 'Programmer';


-- practice04
SELECT last_name, job_title, country_name, state_province
FROM hr.employees e INNER JOIN hr.jobs j ON e.job_id = j.job_id 
                    INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
                    INNER JOIN hr.countries c ON c.country_id = l.country_id
WHERE job_title = 'Programmer';


-- practice05
SELECT last_name, state_province
FROM hr.employees e LEFT JOIN hr.departments d ON e.department_id = d.department_id
                    LEFT JOIN hr.locations l ON l.location_id = d.location_id;


-- practice06
SELECT count(last_name), state_province
FROM hr.employees e INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
GROUP BY state_province;


-- practice07
SELECT last_name, state_province, street_address
FROM hr.employees e INNER JOIN hr.departments d ON e.department_id = d.department_id
                    INNER JOIN hr.locations l ON l.location_id = d.location_id
WHERE state_province IS NULL and street_address IS NULL;


-- practice08
SELECT last_name, job_id, salary, department_id
FROM hr.employees
WHERE job_id LIKE 'IT_PROG' OR
      (job_id LIKE 'FI_ACCOUNT' AND 5000 <= salary AND salary <= 10000) OR
      (department_id = 80 AND 5000 <= salary AND salary <= 10000)
ORDER BY job_id ASC, salary DESC;


-- practice09
SELECT last_name, salary, department_name, '&city' AS "CITY"
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id;


-- practice10
SELECT length(concat('&firstname', '&lastname')) AS "Length of Name"
FROM dual;


-- practice11
SELECT last_name, department_name, salary, (salary + (salary * 0.05)) AS "New Salary"
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE department_name LIKE 'Sales' OR department_name LIKE 'Shipping';


-- practice12
SELECT employee_id, last_name, department_name
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE department_name LIKE '%ing';


-- practice13
SELECT concat(city, ' ' || state_province) AS "Address", department_name
FROM hr.locations INNER JOIN hr.departments ON hr.locations.location_id = hr.departments.location_id;


-- practice14
SELECT to_char(hire_date, 'YYYY') AS "Year",
       to_char(hire_date, 'Month') AS "Month",
       to_char(hire_date, 'DD') AS "Day",
       first_name, last_name
FROM hr.employees
WHERE to_char(hire_date, 'MM') IN (10, 11, 12)
ORDER BY to_char(hire_date, 'Month') ASC,
         to_char(hire_date, 'YYYY') DESC,
         to_char(hire_date, 'DD') ASC,
         first_name ASC;


-- practice15
SELECT to_char(hire_date, 'YYYY') AS "Year",
       to_char(hire_date, 'Month') AS "Month",
       to_char(hire_date, 'DD') AS "Day",
       first_name, last_name, department_name
FROM hr.employees INNER JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
WHERE to_char(hire_date, 'MM') IN (10, 11, 12)
ORDER BY to_char(hire_date, 'Month') DESC,
         to_char(hire_date, 'YYYY') ASC,
         to_char(hire_date, 'DD') DESC,
         first_name ASC;


-- practice16
SELECT employee_id, concat(first_name, ' ' || last_name) AS "Name", job_id,
length(last_name)
FROM hr.employees
WHERE concat(first_name, ' ' || last_name) LIKE '%n';
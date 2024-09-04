-- UNIONS => menggabungkan kumpulan hasil dari dua atau lebih pernyataan SELECT. (MENGGABUNGKAN BARIS)

SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'old man' AS LABEL
FROM employee_demographics
WHERE age > 40 AND gender='male'
UNION
SELECT first_name, last_name, 'old lady' AS LABEL
FROM employee_demographics
WHERE age > 40 AND gender='female'
UNION
SELECT first_name, last_name, 'highly paid employee' AS LABEL
FROM employee_salary
WHERE  salary > 70000
ORDER BY first_name, last_name; 


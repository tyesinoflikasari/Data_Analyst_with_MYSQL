-- CASE STATEMENT => melewati kondisi dan mengembalikan nilai saat kondisi pertama terpenuhi (seperti pernyataan if-then-else).

SELECT first_name, age
FROM employee_demographics;

SELECT first_name,
last_name,
age,
CASE 
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
END AS age_bracket
FROM employee_demographics;

-- Pay increase and bonus
-- < 50000 =5%
-- > 70000 =7%
-- Finance =10% bonus

SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;

SELECT * ,
CASE
	WHEN SALARY < 50000 THEN salary + (salary*0.05) -- BISA GUNAKAN THEN salary*1.05 
    WHEN SALARY > 50000 THEN salary + (salary*0.07)
END AS NEW_SALARY,
CASE
	WHEN dept_id = 6 THEN salary*0.10
END AS BONUS
FROM employee_salary;
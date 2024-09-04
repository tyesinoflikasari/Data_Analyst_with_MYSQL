-- SUBQUERIES => sebuah query di dalam query lain.
--  Subquery sering digunakan saat Anda perlu memproses data dalam beberapa langkah

SELECT *
FROM employee_demographics
WHERE employee_id IN -- SQL IN adalah operator yang membantu kamu memilih beberapa nilai dalam satu query.
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1
);

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

select *
from employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
group by gender;

SELECT gender, AVG(age), max(age),min(age), count(age)
FROM employee_demographics
group by gender;

SELECT AVG(max_age)
FROM
(SELECT gender,
AVG(age) AS avg_age,
max(age) AS max_age,
min(age) AS min_age,
count(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS agg_table
;


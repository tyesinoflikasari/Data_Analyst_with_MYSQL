-- WINDOW FUNCTION => MELAKUKAN PERHITUNGAN PADA SERANGKAIAN BARIS YANG TERKAIT DENGAN BARIS SAAT INI.
-- FUNGSI INI HANYA DIIZINKAN DALAM DAFTAR SELECT DAN KLAUSA ORDER BY

SELECT gender, avg(salary) as avg_salary
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender ;

SELECT dem.first_name,dem.last_name,gender, avg(salary) over(partition by gender)
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
 ;
 
 SELECT dem.first_name,dem.last_name,gender,salary,
 SUM(salary) over(partition by gender ORDER BY dem.employee_id) AS ROLLING_TOTAL
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
 ;


SELECT dem.employee_id, dem.first_name,dem.last_name,gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS ROW_NUM,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS RANK_NUM,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS DENSE_RANK_NUM
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id=sal.employee_id
 ;
-- JOIN
-- digunakan untuk menggabungkan baris dari dua atau lebih tabel berdasarkan kondisi yang terkait.

-- INNER JOIN => Mengembalikan hanya baris yang memiliki nilai yang sesuai di kedua tabel yang digabungkan.
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;  

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id=employee_salary.employee_id
; -- ON => DIGUNAKAN UNTUK MENETAPKAN KONDISI PENGGABUNGAN  

-- agar mudah dibaca pakai alias
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id;

-- OUTER JOINS

-- LEFT JOIN => Mengembalikan semua baris dari tabel di sebelah kiri (left table), dan baris yang cocok dari tabel di sebelah kanan (right table). Jika tidak ada kecocokan, nilai dari tabel kanan akan menjadi NULL.
-- RIGHT JOIN KEBALIKAN DARI LEFT JOIN

SELECT *
FROM employee_demographics
LEFT JOIN employee_salary
	ON employee_demographics.employee_id=employee_salary.employee_id
;

SELECT *
FROM employee_demographics
RIGHT JOIN employee_salary
	ON employee_demographics.employee_id=employee_salary.employee_id
;

-- SELF JOIN => jenis operasi penggabungan di mana sebuah tabel digabungkan dengan dirinya sendiri

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1=emp2.employee_id;
    
-- joining multile tables together => menggunakan operator join untuk menggabungkan data dari lebih dari dua tabel
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id; 
    
SELECT *
FROM parks_departments;

   
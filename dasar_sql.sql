-- BELAJAR KALUSA SELECT
SELECT*
FROM parks_and_recreation.employee_demographics;

SELECT first_name, last_name, birth_date
FROM parks_and_recreation.employee_demographics;

-- urutan untuk operasi aritmatika di sql yaitu PEMDAS (tanda kurung, pembagian, perkalian, penjumlahan, dan pengurangan 
SELECT first_name, 
last_name, 
birth_date,
age,
(age+10)*10+10
FROM parks_and_recreation.employee_demographics;

-- MENGGUNAKAN DISTINCT
-- CARA MEMILIH NILAI UNIK ATAU ID DARI SEBUAH KOLOM 
-- MENGGUNAKAN DISTINCT

SELECT DISTINCT gender, first_name
FROM parks_and_recreation.employee_demographics;

-- KLAUSA WHERE 
-- WHERE => hanya digunakan untuk mengembalikan baris-baris yang memenuhi kondisi tertentu
SELECT *
FROM employee_salary
WHERE salary>50000;

SELECT*
FROM employee_demographics
WHERE birth_date > '1985-01-01';

SELECT*
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender='Female';

-- OPERATOR LOGIKA AND, OR, NOT 
SELECT*
FROM employee_demographics
WHERE (first_name = 'leslie' AND age = 44) OR age > 55 ;

-- LIKE STATEMENT => MENCARI DATA DENGAN POLA TERTENTU 
-- OPERATOR LIKE => % MEWAKILI NOL, SATU, ATAU BEBERAPA KARAKTER
-- _ (GARIS BAWAH) MEWAKILI SATU KAREKTER TUNGGAL

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'l%'; -- 'l%' huruf depan nya l kalo '%l' huruf belakang l

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';


SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1994%';

-- GROUP BY => mengelompokkan kumpulan hasil berdasarkan satu atau lebih kolom
-- digunakan dengan fungsi agregat ( COUNT() , MAX() , MIN() , SUM() , AVG() )
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;
 -- menggunakan fungsi agregat
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY => mengurutkan hasil kueri dalam urutan tertentu berdasarkan satu atau beberapa kolom
-- umumnya digunakan untuk mengatur data dalam urutan menaik atau menurun
-- ASC => URUTKAN DARI YANG TERKECIL
-- DESC => URUTKAN DARI YANG TERBESAR
  
SELECT *
FROM employee_demographics
ORDER BY age DESC;

-- having VS where
-- WHERE harus digunakan pada baris individual, diterapkan sebelum klausa group by 
-- HAVING harus digunakan saat hasil dikelompokkan menggunakan fungsi agregat, hanya bisa digunakan setelah adanya perintah group by

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age)>40;

SELECT occupation, AVG (salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%' 
GROUP BY occupation
Having AVG (salary) > 55000;

-- limit  
-- LIMIT di MySQL dapat digunakan untuk melakukan proses pagination, tujuannya adalah mempermudah dan mempercepat pengambilan data.

SELECT *
FROM employee_demographics
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age ASC
LIMIT 6;

-- ALIAS (AS)
-- MySQL ALIAS dapat digunakan untuk membuat nama sementara untuk kolom atau tabel.

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age)>40;

-- bisa juga tanpa menambahkan AS, example: 
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age)>40;  

  


  
-- string function => fungsi bawaan yang memungkinkan pengguna memanipulasi data karakter dengan berbagai cara

SELECT LENGTH('Skyfall');

SELECT first_name, length(first_name)
from employee_demographics
order by 2; 

-- INITCAP => HURUF AWAL BESAR SELAINNYA KECIL 
-- UPPER => mengubah string menjadi huruf besar 
SELECT upper('sky') AS Upper;

SELECT first_name, upper(first_name)
from employee_demographics;

-- TRIM => digunakan untuk menghapus karakter tertentu SEPERTI  SPASI dari awal, akhir, atau kedua sisi sebuah string
SELECT TRIM(' 		sky			'); 
SELECT RTRIM('      sky			'); 
SELECT LTRIM('		sky			'); 

SELECT first_name, left(first_name, 4)
from employee_demographics;

SELECT first_name, RIGHT(first_name, 4)
from employee_demographics;

SELECT first_name, 
substring(first_name, 3,2), -- ambil dari huruf ke 3 dan ambil 2 huruf saja
birth_date,
substring(birth_date,6,2) AS birth_month
FROM employee_demographics;

-- mengganti karakter dengan REPLACE 
SELECT first_name, replace(first_name, 'a','z') -- dari kolom fisrt_name huruf a diganti dengan z
FROM employee_demographics;

-- LOCATE, INSTR => MENENTUKAN LOKASI KARAKTER
SELECT INSTR ('alexender', 'a');
SELECT LOCATE ('a', 'alexender');

SELECT first_name,LOCATE ('ANN', first_name)
FROM employee_demographics;

-- CONCAT => MENGGABUNGKAN BEBERAPA KOLOM
SELECT first_name, last_name,
CONCAT (first_name,' ', last_name) -- ' ' untuk pemberian spasi 
FROM employee_demographics;




-- temporary tables => tabel yang digunakan untuk menyimpan dan memproses hasil sementara dalam sistem manajemen basis data

create temporary table tempt_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

select *
from tempt_table;

INSERT INTO tempt_table 
VALUES('Alex', 'Freberg', 'Lord of the Rings: The Two Towers');

select *
from tempt_table;


select*
from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary > 50000;

select*
from employee_salary;


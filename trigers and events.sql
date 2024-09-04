-- trigers  => blok kode yang dijalankan secara otomatis ketika suatu event terjadi pada tabel tertentu
SELECT*
FROM employee_salary;

SELECT*
FROM employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW. employee_id, NEW. first_name, NEW. last_name);
END;
DELIMETER $$

INSERT INTO employee_salary ( employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Jean-Ralpio', 'Saperstein', 'Entertainment 720 CEO', 100000, NULL);


-- Events => tugas yang berjalan sesuai jadwal .


DELIMITER $$
CREATE EVENT hapus_pensiun
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >=60 ;
END $$
DELIMITER ;

SELECT*
FROM employee_demographics;

SHOW VARIABLES LIKE "Event%"










-- stored pocedure =>  objek basis data yang dibuat dan disimpan dalam sistem manajemen basis data.
 CREATE PROCEDURE large_salary()
 SELECT*
 FROM employee_salary
 WHERE salary > 50000;
 
 CALL large_salary();
 
CREATE PROCEDURE large_salary2()
SELECT*
FROM employee_salary
WHERE salary >= 50000;
SELECT*
FROM employee_salary
WHERE salary >= 10000;

CALL large_salary2();
 
 DELIMITER $$
 CREATE PROCEDURE large_salary3()
 BEGIN
	 SELECT*
	 FROM employee_salary
	 WHERE salary >= 50000;
	 SELECT*
	 FROM employee_salary
	 WHERE salary >= 10000;
END $$
DELIMITER ;



 DELIMITER $$
 CREATE PROCEDURE large_salary4(p_employee_id INT)
 BEGIN
	 SELECT salary
	 FROM employee_salary
	 WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL large_salary4(5);


 
 
 
 
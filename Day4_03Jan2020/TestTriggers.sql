SET serveroutput ON;
set verify OFF;

--trigger TO AVOID DML statement between 0900 to 1800 hrs and on sat/sun
CREATE OR REPLACE TRIGGER updSal
BEFORE UPDATE ON emp
FOR EACH ROW
BEGIN
    IF (:new.salary < :old.salary) THEN
        RAISE_APPLICATION_ERROR(-20323, 'New Salary cannot be less than Old salary');
    end if;
END;
/
  
select employee_id, salary from emp where employee_id = 108;

--Test update query for trigger
update emp
set salary = 1200   
where employee_id = 108;
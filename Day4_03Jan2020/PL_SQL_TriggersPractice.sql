SET serveroutput ON;
SET verify OFF;

--log_tab for trigger
CREATE TABLE log_tab
(username varchar2(30),
dml_time timestamp,
action varchar2(40));

--trigger1
CREATE OR REPLACE TRIGGER emp_trig_Bdel
BEFORE DELETE ON emp
BEGIN
    INSERT INTO log_tab
    VALUES(user, current_timestamp, 'B4 Delete statement');
END;
/
--trigger 2
CREATE OR REPLACE TRIGGER emp_trig_Adel
AFTER DELETE ON emp
BEGIN
    INSERT INTO log_tab
    VALUES(user, current_timestamp, 'After Delete statement');
END;
/
--trigger3
CREATE OR REPLACE TRIGGER emp_trig_BrowDel
BEFORE DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO log_tab
    VALUES(user, current_timestamp, 'B4 Row Delete');
END;
/
--trigger 4
CREATE OR REPLACE TRIGGER emp_trig_ArowDel
AFTER DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO log_tab
    VALUES(user, current_timestamp, 'After Row Delete');
END;
/
--test statement for emp_trig_Bdel/emp_trig_Adel/emp_trig_BrowDel/emp_trig_ArowDel
delete from  emp where employee_id in (106, 107);


--trigger TO AVOID DML statement between 0900 to 1800 hrs and on sat/sun
CREATE OR REPLACE TRIGGER T1
BEFORE INSERT OR UPDATE OR DELETE ON emp
BEGIN
    IF TO_CHAR(sysdate, 'hh24') NOT BETWEEN 9 AND 18
    OR
    TO_CHAR(SYSDATE, 'dy') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20323, 'Do not work on  off days');
    end if;
END;
/

--CREATED EMPTRY EX_EMP TABLE TO STORE DELETED DATA.
CREATE TABLE ex_emp
AS SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, PHONE_NUMBER
FROM EMP WHERE 1=2;
/


--ROW LEVEL TRIGGER AFTER DELETE TO INSERTDATA IN EX_EMP
CREATE OR REPLACE TRIGGER trig_bkp
BEFORE DELETE ON EMP
FOR EACH ROW
BEGIN
    INSERT INTO ex_emp
    VALUES(:old.employee_id, :old.last_name, :old.job_id, :old.phone_number);
END;
/

--STATEMENT TO FIRE TRIGGER AFTER ROW DELETION
delete from emp where employee_id in (102, 104);

--DISPLAY ALL DATA FROM BACKUP TABLE
SELECT * FROM ex_emp;
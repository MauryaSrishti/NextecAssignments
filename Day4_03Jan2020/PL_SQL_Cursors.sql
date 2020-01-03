SET serveroutput ON;
SET verify OFF;
--Implicit Cursors.
BEGIN
    delete from departments where department_id = 240;
    dbms_output.put_line(SQL%ROWCOUNT||' row/rows deleted');
END;

--Explicit Cursor WITH basic loop
DECLARE
    CURSOR c1
    IS SELECT last_name, job_id, salary
    FROM employees
    WHERE salary BETWEEN 5000 AND 15000;
    
    erec c1%ROWTYPE;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO erec;
        EXIT WHEN c1%NOTFOUND;
        dbms_output.put_line(erec.last_name||' '||erec.job_id||' '||erec.salary);
    END LOOP;
    CLOSE c1;
END;

--Explicit Cursor with FOR loop
DECLARE
    CURSOR c1
    IS SELECT last_name, job_id, salary
    FROM employees
    WHERE salary BETWEEN 5000 AND 15000;
    
BEGIN
    FOR erec IN c1 
    LOOP
        dbms_output.put_line(erec.last_name||' '||erec.job_id||' '||erec.salary);
    END LOOP;
END;

--ROLLBACK;

--Explicit Row Lock using cursors
--To avoid integrity constraint
CREATE TABLE EMP
AS SELECT  * FROM employees;

DECLARE
    CURSOR c1
    IS SELECT last_name, job_id, salary
    FROM emp
    WHERE salary BETWEEN 5000 AND 15000
    --FOR UPDATE WAIT 4;
    FOR UPDATE NOWAIT;
    
BEGIN
    FOR erec IN c1 
    LOOP
        dbms_output.put_line(erec.last_name||' '||erec.job_id||' '||erec.salary);
        delete from emp where last_name = 'Higgins';
    END LOOP;
END;

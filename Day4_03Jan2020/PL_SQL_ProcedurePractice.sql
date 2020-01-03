Set serveroutput ON;
set verify OFF;

--Sample Procedure to update salary according to the employee_id
CREATE OR REPLACE PROCEDURE inc_salary
  (p_id IN emp.employee_id%TYPE)
IS
BEGIN
  UPDATE emp
  SET    salary = salary * 1.10
  WHERE  employee_id = p_id;
END inc_salary;

--to check for initial values of salary of emp_id = 102 & 106
Select employee_id, salary from emp
where employee_id IN (102, 106);

--decs the procedure
desc inc_salary;

--static call for the procedure
exec inc_salary(102);

--rollback;

--Dynamic call for procedure
BEGIN
    inc_salary(&empid);
END;    

--
--
--

CREATE OR REPLACE PROCEDURE TestProc
  (p_id      IN   emp.employee_id%TYPE,
   p_name    OUT  emp.last_name%TYPE,
   p_salary  OUT  emp.salary%TYPE,
   p_comm    OUT  emp.commission_pct%TYPE)
IS
BEGIN
  SELECT   last_name, salary, commission_pct
   INTO    p_name, p_salary, p_comm
   FROM    emp
   WHERE   employee_id = p_id;
   dbms_output.put_line(p_name||' '||p_salary||' '||nvl(p_comm, 0));
END TestProc;

DECLARE
    p_name varchar2(30);
    p_salary number;
    p_comm number;
BEGIN
    TestProc(&empid, :p_name, :p_salary, :p_comm);
END; 

rollback;

--print phone number in format (672)-2588782
CREATE OR REPLACE PROCEDURE phoneproc (
    phno IN OUT varchar2)
IS
BEGIN
    phno:='('||substr(phno, 1, 3)||')-'||substr(phno, 4);
END phoneproc;    

DECLARE
    phno varchar2(50):=&phno;
BEGIN
    phoneproc(phno);
    dbms_output.put_line(phno);
END;    
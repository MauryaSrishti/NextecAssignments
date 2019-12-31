select employee_id, salary, rpad('*', trunc(salary/1000), '*') star from employees order by salary
/

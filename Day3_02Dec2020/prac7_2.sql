select employee_id, last_name, salary from employees
where department_id IN
(select department_id from employees
where last_name LIKE '%u%')
and salary >
(select avg(salary) from employees)
/

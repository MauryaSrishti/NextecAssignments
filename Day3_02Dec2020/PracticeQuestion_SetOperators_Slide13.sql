--Ques1: The HR department needs a list a departmet ids for the departments
--that do not contain the job id ST_CLERK . Use the set opetaors to create this report.
select department_id from employees
minus
select department_id from employees
where job_id = 'ST_CLERK';

--Ques2: 
select c.country_id, c.country_name
from countries c

select c.country_id, c.country_name from countries c
join locations l on c.country_id = l.country_id
join departments d on d.location_id = d.location_id
where d.department_id IS NOT NULL;

--Ques3
select job_id, department_id, 1 as dummy from employees
where department_id = 10
union
select job_id, department_id, 2 from employees
where department_id = 50
union
select job_id, department_id, 3 from employees
where department_id = 20;

--Ques4: 
select employee_id, job_id from job_history
INTERSECT 
select employee_id, job_id from employees;

--Ques5:
select department_id, last_name from employees
union all
select department_id, department_name from departments;
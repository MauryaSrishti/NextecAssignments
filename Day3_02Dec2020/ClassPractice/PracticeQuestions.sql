
select employee_id, last_name from employees
where employee_id NOT IN (select distinct manager_id from employees where manager_id is not null)
order by employee_id;

select employee_id, last_name from employees
where employee_id NOT IN (select employee_id from job_history);

--to display the data of department in order (60, 20, 40)
select last_name, department_id, 1 as dummy from employees
where department_id = 60
union
select last_name, department_id, 2 from employees
where department_id = 20
union 
select last_name, department_id, 3 as dummy from employees
where department_id = 40
order by 3;

-- employee last name in sequence(oxford, toronto, london)
select e.last_name, l.city, 1 as dummy 
from employees e 
join departments d on e.department_id  = d.department_id
join locations l on d.location_id = l.location_id
where lower(l.city) = 'oxford'
union 
select e.last_name, l.city, 2
from employees e 
join departments d on e.department_id  = d.department_id
join locations l on d.location_id = l.location_id
where lower(l.city) = 'toronto'
union 
select e.last_name, l.city, 3 
from employees e 
join departments d on e.department_id  = d.department_id
join locations l on d.location_id = l.location_id
where lower(l.city) = 'london'
order by 3;

desc employees;
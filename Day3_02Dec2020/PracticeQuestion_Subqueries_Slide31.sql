--Ques1: Write a query to display the ename and hiredate of  any employee 
--in the same department as smith. Exclude smith.
select last_name, hire_date
from employees
where department_id = (
select distinct department_id from employees
where last_name = 'Smith')and last_name <> 'Smith';

--Ques2: Create a query to display the employee numbers and enames 
--of all employees who earn more than the average salary.
--Sort the results in ascending order of salary. 
select employee_id, last_name from employees
where salary > (select avg(salary) from employees)
order by salary;

--Ques3: Write a query that displays the employee numbers and last names of all
--employees who work in a department with any employee whose last name 
--contains a u. Save your SQL statement in a text file named prac7_1.sql. Run your query.
select employee_id, last_name  from employees
where department_id IN (select department_id from employees
where last_name LIKE '%u%');

--Ques4: Display the last name, department number, and job ID of all employees
--whose department location ID is 1700.
select e.last_name, e.department_id, job_id from employees e
join departments d on e.department_id = d.department_id
where d.location_id = 1700;

--Ques5: Display the last name and salary of every employee who reports to King.
select last_name, salary from employees
where manager_id = (select distinct employee_id from employees
where last_name = 'King' and manager_id IS NULL);

--Ques6: Display the department number, last name, and job ID
--for every employee in the Executive department.
select e.department_id, e.last_name, e.job_id
from employees e
join departments d on e.department_id = d.department_id
where d.department_id = (select department_id from departments
where department_name = 'Executive');

--Ques7: Modify the query in  to display the employee numbers, last names, 
--and salaries of all employees who earn more than the average salary
--and who work in a department with any employee with a u in their name.
--Resave prac7_1  with the name prac7_2sql.
--Run the statement in prac7_2.sql.
select employee_id, last_name, salary from employees
where department_id IN 
(select department_id from employees
where last_name LIKE '%u%') 
and salary > 
(select avg(salary) from employees);

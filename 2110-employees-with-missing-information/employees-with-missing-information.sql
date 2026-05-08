# Write your MySQL query statement below
select t1.employee_id
from (
select e.employee_id,e.name as eon,s.salary as eos
from employees e
left join salaries s on e.employee_id = s.employee_id
union
select s.employee_id,e.name as eon,s.salary as eos
from employees e
right join salaries s  on e.employee_id  = s.employee_id) as t1
where (t1.eon is null) or (t1.eos is null)
order by employee_id;
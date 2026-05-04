# Write your MySQL query statement below
select d.name as department, e.name as employee, e.salary as Salary
from department d
join employee e on d.id = e.departmentId
where (d.name,e.salary) in ( select d.name, max(e.salary)
from department d
join employee e on d.id = e.departmentId
group by d.name);

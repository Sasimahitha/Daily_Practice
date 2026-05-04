# Write your MySQL query statement below
select t1.depart as Department, t1.emp as Employee, t1.sal as Salary
from (
select e.name as emp, e.salary as sal, d.name as depart, dense_rank() over(partition by d.id order by e.salary desc) as dr
from employee e
join department d on e.departmentid = d.id) as t1
where t1.dr <= 3;
# Write your MySQL query statement below
select name as employee
from employee e1
where salary > (select salary 
                from employee e2
                where e1.managerid = e2.id);
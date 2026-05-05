# Write your MySQL query statement below
-- select t1.sname as name
-- from (
-- select sp.name as sname,o.order_id, c.name as cname, o.amount
-- from SalesPerson sp
-- left join orders o on sp.sales_id = o.sales_id
-- left join company c on o.com_id = c.com_id) as t1
-- where t1.cname <> 'RED' ;

select t1.sname as name from (
select sp.name as sname,o.order_id, c.name as cname, o.amount, CONCAT_WS(' ',c.name) as cols
from SalesPerson sp
left join orders o on sp.sales_id = o.sales_id
left join company c on o.com_id = c.com_id
group by sp.name
having cols <> 'RED') as t1 ;
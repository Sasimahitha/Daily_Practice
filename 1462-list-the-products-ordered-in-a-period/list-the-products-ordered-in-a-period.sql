# Write your MySQL query statement below
select t1.pro as product_name, t1.total as unit
from (
select p.product_name as pro,date_format(o.order_date, '%Y-%m') as mon, sum(o.unit) as total
from orders o
left join products p  on p.product_id = o.product_id
group by p.product_id,mon 
having mon = '2020-02' and total >= 100) as t1;
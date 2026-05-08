# Write your MySQL query statement below
select t1.customer_id, count(t1.customer_id) as count_no_trans
from (
select v.customer_id, t.transaction_id, t.visit_id
from visits v
left join transactions t on v.visit_id = t.visit_id) as t1
where (t1.transaction_id is null) and (t1.visit_id is null)
group by t1.customer_id;
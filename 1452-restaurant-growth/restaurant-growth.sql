# Write your MySQL query statement below
-- select visited_on, sum(amount) over(rows between 6 preceding and current row) as amt
-- from customer
-- group by visited_on;

select t1.visited_on, sum(t1.tot) over(rows between 6 preceding and current row) as amount, round(avg(t1.tot) over(rows between 6 preceding and current row),2) as average_amount
from (
select visited_on, sum(amount) as tot
from customer
group by visited_on) as t1
LIMIT 18446744073709551610 OFFSET 6;
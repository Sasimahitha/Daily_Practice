# Write your MySQL query statement below
select user_id, time_stamp as last_stamp
from (
select user_id, time_stamp , rank() over(partition by user_id order by time_stamp desc) as r
from logins
having year(time_stamp) = 2020) as t1
where t1.r = 1;
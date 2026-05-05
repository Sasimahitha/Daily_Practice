# Write your MySQL query statement below
(select t1.naam as results
from (
select u.name as naam, count(u.user_id) as ct
from movierating mr
left join users u on mr.user_id = u.user_id
group by u.user_id 
order by ct desc, u.name 
limit 1 ) as t1)
union all
(select t2.tit as results
from (
select m.title  as tit, date_format(mr.created_at,"%Y-%m") as mon, avg(rating) as ar
from movierating mr
left join movies m on mr.movie_id = m.movie_id
group by m.movie_id, mon
having mon = '2020-02'
order by ar desc, title asc
limit 1) as t2);

# Write your MySQL query statement below
select st.machine_id,  round(((et.end_time)-(st.start_time)),3) as processing_time
from
(select machine_id, avg(timestamp) as start_time
from activity
where activity_type like 'start'
group by machine_id) st
join 
(select machine_id, avg(timestamp) as end_time
from activity
where activity_type like 'end'
group by machine_id) et on st.machine_id = et.machine_id;


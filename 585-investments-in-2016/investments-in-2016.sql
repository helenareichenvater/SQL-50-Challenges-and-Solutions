# Write your MySQL query statement below
with latilongi as
(
    select
        pid,
        lat,
        lon,
        tiv_2015
    from insurance
    group by pid
)
select
    round(sum(i.tiv_2016),2) as tiv_2016
from insurance as i
    inner join latilongi as l on l.pid = i.pid
where l.tiv_2015 in (
    select tiv_2015 from insurance
        where pid != i.pid) 
    and (i.lat, i.lon) not in (select lat, lon from insurance where pid != i.pid)
;
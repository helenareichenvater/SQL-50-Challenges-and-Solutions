# Write your MySQL query statement below
with log_ids as (
    select
        num,
        lead(num, 1) over(order by id) as next1,
        lead(num, 2) over(order by id) as next2
    from
        logs
)
select
    distinct num as ConsecutiveNums
from
    log_ids
where
    num = next1 and num = next2
;
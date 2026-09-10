# Write your MySQL query statement below
select
    e.name,
    b.bonus
from
    employee as e
left join
    bonus as b
        on b.empid = e.empid
where
    bonus < 1000 or bonus is null
;
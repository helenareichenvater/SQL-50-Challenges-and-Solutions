# Write your MySQL query statement below
with runningcalc as
(
select
    person_name,
    sum(weight) over(order by turn asc) as running_weight
from
    queue
)
select
    person_name
from
    runningcalc
where
    running_weight <= 1000
order by
    running_weight desc
limit
    1        
;
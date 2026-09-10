# Write your MySQL query statement below
with first_order as
(
    select
        customer_id,
        order_date,
        customer_pref_delivery_date,
        row_number() over(partition by customer_id order by order_date asc) as rownumber
    from
        delivery
)
select
    round(
        avg(
             case when
                 order_date = customer_pref_delivery_date
                  then 1.0 else 0.0 end) * 100, 2
                ) 
as immediate_percentage
from 
    first_order
where rownumber = 1
;
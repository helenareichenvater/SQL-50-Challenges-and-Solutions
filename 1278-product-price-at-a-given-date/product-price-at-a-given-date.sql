# Write your MySQL query statement below
with selected_date_data as (
    select
        product_id,
        new_price as price,
        change_date  as correct_date,
        row_number() over (partition by product_id order by change_date desc) as rn
    from
        products
    where change_date <= '2019-08-16'
),
product_list as (
    select
        distinct product_id
    from
        products
)
select
    product_list.product_id,
    ifnull(selected_date_data.price, 10) as price
from
    product_list
left join
    selected_date_data
        on product_list.product_id = selected_date_data.product_id
        and selected_date_data.rn = 1
;
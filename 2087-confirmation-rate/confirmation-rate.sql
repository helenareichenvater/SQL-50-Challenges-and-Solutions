# Write your MySQL query statement below
select
signups.user_id,
  round(
        avg(
            case
                when confirmations.action = 'confirmed' then 1.00 else 0
                end
                ),
                2)
                as confirmation_rate
        from
            signups
        left join
            confirmations
                on signups.user_id = confirmations.user_id
        group by
        signups.user_id
        order by
        confirmation_rate
  ;
  
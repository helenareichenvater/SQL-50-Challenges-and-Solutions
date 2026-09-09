SELECT visits.customer_id as customer_id,count(visits.customer_id) as count_no_trans
FROM visits
LEFT JOIN transactions
ON visits.visit_id=transactions.visit_id
where transactions.visit_id is NULL
GROUP BY visits.customer_id 
ORDER BY count_no_trans DESC

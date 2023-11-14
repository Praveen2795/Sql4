with cte1 as (select s.sales_id, s.name, o.com_id
from Orders as o
right join SalesPerson as s
on o.sales_id = s.sales_id),
cte2 as (select cte1.name as person, c.name as com_name
from cte1
left join Company as c
on cte1.com_id = c.com_id)

SELECT distinct person as name
FROM cte2
WHERE person not in (select person from cte2 where com_name = 'RED')

# Write your MySQL query statement below

with cte1 as (select s.sales_id, s.name, s.salary, o.order_id, o.com_id
from salesPerson as s
left join Orders as o
on s.sales_id = o.sales_id),
cte2 as (select cte1.name, cte1.order_id, cte1.com_id, c.name as company_name
from cte1
left join company as c
on cte1.com_id = c.com_id)

select distinct name
from cte2
where name not in (select name from cte2 where company_name = 'RED')  


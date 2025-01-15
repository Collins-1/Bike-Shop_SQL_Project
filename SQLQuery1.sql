-- to append the table, we use the "UNION" function which will also remove duplicates.

with cte as (
SELECT * from bike_shop_year_0
union
SELECT * from bike_shop_year_1)


select dteday, 
season, 
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price as Revenue,
riders * price - COGS as Profit
from cte a
left join cost_table b
on a.yr = b.yr
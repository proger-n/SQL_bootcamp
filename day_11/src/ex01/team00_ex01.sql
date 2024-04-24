with recursive a_trace as (
	select 
		point1 as tour, 
		point1, 
		point2, 
		cost,
		cost as sum
	from nodes
	where point1 = 'A'
	union all
	select 
		parrent.tour || ',' || child.point1 as tour,
		child.point1,
		child.point2,
		parrent.cost,
		parrent.sum + child.cost as sum
	from
		nodes as child
	inner join a_trace as parrent on child.point1 = parrent.point2
	where tour not like '%' || child.point1 || '%'
),
final_res as (
	select *
	from a_trace
	where length(tour) = 7 and point2 = 'A'
)
select 
	sum as total_cost,
	'{' || tour || ',A' || '}' as tour
from final_res 
where sum in(
	select min(sum)
	from final_res
)
UNION ALL
select 
	sum as total_cost,
	'{' || tour || ',A' || '}' as tour
from final_res 
where sum in(
	select max(sum)
	from final_res
)
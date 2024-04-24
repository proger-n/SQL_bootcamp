-- Создание таблицы
create table nodes (
	point1 varchar,
	point2 varchar, 
	cost integer
);

insert into nodes(point1, point2, cost)
values('A', 'B', 10);

insert into nodes(point1, point2, cost)
values('B', 'A', 10);

insert into nodes(point1, point2, cost)
values('A', 'D', 20);

insert into nodes(point1, point2, cost)
values('D', 'A', 20);

insert into nodes(point1, point2, cost)
values('A', 'C', 15);

insert into nodes(point1, point2, cost)
values('C', 'A', 15);

insert into nodes(point1, point2, cost)
values('B', 'D', 25);

insert into nodes(point1, point2, cost)
values('D', 'B', 25);

insert into nodes(point1, point2, cost)
values('B', 'C', 35);

insert into nodes(point1, point2, cost)
values('C', 'B', 35);

insert into nodes(point1, point2, cost)
values('C', 'D', 30);

insert into nodes(point1, point2, cost)
values('D', 'C', 30);

-- Основной запрос
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
SELECT 
destination , 
passanger ,  
time as 'The Time'
FROM dataset_1
WHERE passanger = 'Alone'
OR  time = '2PM'
Order BY time DESC;

SELECT destination, 
time, 
AVG(temperature), 
SUM(temperature), 
COUNT(temperature), 
COUNT(DISTINCT temperature) 
FROM dataset_1 d 
WHERE time <> '10PM'
Group by destination, time
--having occupation = 'student'
order by time;

SELECT *
FROM dataset_1 d;

SELECT *
FROM dataset_1 d 
union all
select * 
from table_to_union ttu;

SELECT DISTINCT destination
from dataset_1 d;

SELECT DISTINCT destination 
from 
(
SELECT *
FROM dataset_1 d 
union
select *
FROM table_to_union ttu);

SELECT * 
FROM table_to_join ttj;

SELECT destination, d.time, ttj.part_of_day 
from dataset_1 d 
left join table_to_join ttj 
on d.time = ttj.time;

SELECT *
FROM dataset_1 d 
WHERE time like '%P%';

SELECT *
FROM dataset_1 d 
WHERE temperature BETWEEN 29 and 75
ORDER by temperature;

SELECT occupation 
FROM dataset_1 d 
WHERE occupation IN('Sales & Related', 'Managment');



SELECT 
destination,
weather,
AVG(temperature) OVER (PARTITION BY weather) AS 'avg_temp_by_weather'
FROM dataset_1 d;

SELECT 
destination,
weather,
ROW_NUMBER() over (PARTITION by weather order by destination) as 'avg_temp_by_weather'
FROM dataset_1 d;

SELECT 
	destination, 
	weather, 
	RANK() OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;

SELECT 
destination, 
weather, 
DENSE_RANK() OVER (PARTITION BY weather ORDER BY destination) AS 'avg_temp_by_weather'
FROM dataset_1;

SELECT destination, time, LAG(row_count , 1, '99999') OVER (ORDER BY row_count) AS 'LaggedCount' 
FROM dataset_1;

SELECT destination, time, LEAD(row_count , 1, '99999') OVER (ORDER BY row_count) AS 'LaggedCount' 
FROM dataset_1;








select * from road_accident

select sum(number_of_casualties) as Total_Year_Casualties
from road_accident

select sum(number_of_casualties) as CY_Casualties
from road_accident
where year(accident_date) = '2022' 

select sum(number_of_casualties) as CY_Casualties
from road_accident
where year(accident_date) = '2022' and road_surface_conditions = 'Dry'

select count(distinct accident_index) as CY_Accidents
from road_accident
where year(accident_date) = '2022'

select sum(number_of_casualties) as CY_Fatal_Casuslties
from road_accident
where year(accident_date) = '2022' and accident_severity = 'Fatal' 

select sum(number_of_casualties) as CY_Fatal_Casuslties
from road_accident
where accident_severity = 'Fatal'  

select sum(number_of_casualties) as CY_Serious_Casuslties
from road_accident
where accident_severity = 'Serious'

select sum(number_of_casualties) as CY_Serious_Casuslties
from road_accident
where year(accident_date) = '2022' and accident_severity = 'Serious'

select sum(number_of_casualties) as CY_Slight_Casuslties
from road_accident
where year(accident_date) = '2022' and accident_severity = 'Slight'

select sum(number_of_casualties) as CY_Slight_Casuslties
from road_accident
where accident_severity = 'Slight'

select cast(sum(number_of_casualties) as decimal(10,2)) /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident)
from road_accident
where accident_severity = 'Slight'

select cast(sum(number_of_casualties) as decimal(10,2)) * 100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident) as percentage_of_total
from road_accident
where accident_severity = 'Slight'

select cast(sum(number_of_casualties) as decimal(10,2)) * 100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident) as percentage_of_total
from road_accident
where accident_severity = 'Serious'

select cast(sum(number_of_casualties) as decimal(10,2)) * 100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident) as percentage_of_total
from road_accident
where accident_severity = 'Fatal'

select * from road_accident

select
    case
	    when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc') then 'Bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') then 'Van'
		else 'Other'
	end as vehicle_group,
	sum(number_of_casualties) as CY_Casualties
from road_accident
where year(accident_date) = '2022'
group by
    case
	    when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc') then 'Bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') then 'Van'
		else 'Other'
	end

select
    case
	    when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc') then 'Bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') then 'Van'
		else 'Other'
	end as vehicle_group,
	sum(number_of_casualties) as CY_Casualties
from road_accident
--where year(accident_date) = '2022'
group by
    case
	    when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		when vehicle_type in ('Car', 'Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Motorcycle over 500cc') then 'Bike'
		when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') then 'Van'
		else 'Other'
	end
	    
select datename(month, accident_date) as Month_Name, sum(number_of_casualties) as CY_Casualties
from road_accident
where year(accident_date) = '2022'
group by datename(month, accident_date)

select datename(month, accident_date) as Month_Name, sum(number_of_casualties) as PY_Casualties
from road_accident
where year(accident_date) = '2021'
group by datename(month, accident_date)

select road_type, sum(number_of_casualties) as CY_Casualties from road_accident
where year(accident_date) = '2022'
group by road_type 

select urban_or_rural_area, sum(number_of_casualties) from road_accident
where year(accident_date) = '2022'
group by urban_or_rural_area

select urban_or_rural_area, sum(number_of_casualties) * 100 /
(select sum(number_of_casualties) from road_accident where year(accident_date) = '2022')
from road_accident
where year(accident_date) = '2022'
group by urban_or_rural_area

select urban_or_rural_area, cast(sum(number_of_casualties) as decimal(10,2)) * 100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident where year(accident_date) = '2022')
as percentage_of_total
from road_accident
where year(accident_date) = '2022'
group by urban_or_rural_area

select urban_or_rural_area, sum(number_of_casualties) as total_casualties, cast(sum(number_of_casualties) as decimal(10,2)) * 100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident)
as ptc
from road_accident
--where year(accident_date) = '2022'
group by urban_or_rural_area

select 
    case
	    when light_conditions in ('Daylight') then 'Day'
		when light_conditions in ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') then 'Night'
	end as Light_Condition,
	cast(cast(sum(number_of_casualties) as decimal(10,2)) * 100 / 
	(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident where year(accident_date) = '2022') as decimal(10,2))
	as CY_Casualties_PTC
from road_accident
where year(accident_date) = '2022'
group by 
case 
    when light_conditions in ('Daylight') then 'Day'
	when light_conditions in ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') then 'Night'
end

select local_authority, sum(number_of_casualties) as Total_Casualties
from road_accident
group by local_authority

select local_authority, sum(number_of_casualties) as Total_Casualties
from road_accident
group by local_authority
order by Total_Casualties desc

select top 10 local_authority, sum(number_of_casualties) as Total_Casualties
from road_accident
group by local_authority
order by Total_Casualties desc
		
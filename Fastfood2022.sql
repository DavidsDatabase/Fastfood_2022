--Exploring through dataset 

select *
from fastfood_2022

--Data cleaning/exploration
--Deleting unnecessary columns for a cleaner dataset

alter table fastfood_2022
drop column item_description, serving_size_text, serving_size_unit, serving_size_household, potassium, notes, calories_text, total_fat_text, saturated_fat_text, cholesterol_text, sodium_text, carbohydrates_text, dietary_fiber_text, sugar_text, protein_text, trans_fat_text

--EDA

--total count of each food_category from all restaurants (12 food categories), excluding nulls 

select distinct food_category, count(food_category) as count_food_category
from fastfood_2022
where food_category is not null and restaurant is not null
group by food_category 
order by count_food_category desc

--total count of food items from all restaurants (92 restaurants), excluding nulls 

select restaurant, count(food_category) as count_food_category
from fastfood_2022
where food_category is not null and restaurant is not null
group by restaurant
order by count_food_category desc

--average calories of food items per restaurant, excluding nulls 

select restaurant, round(avg(calories),0) as avg_calories
from fastfood_2022
where calories is not null and restaurant is not null
group by restaurant
order by avg_calories desc

--average total fats(g) of food items per restaurant, excluding nulls

select restaurant, round(avg(total_fat),0) as avg_total_fat
from fastfood_2022
where total_fat is not null and restaurant is not null
group by restaurant
order by avg_total_fat desc

--average cholesterol(mg) of food items per restaurant, excluding nulls

select restaurant, round(avg(cholesterol),0) as avg_cholesterol
from fastfood_2022
where cholesterol is not null and restaurant is not null
group by restaurant
order by avg_cholesterol desc

--average sodium(mg) of food items per restaurant, excluding nulls

select restaurant, round(avg(sodium),0) as avg_sodium
from fastfood_2022
where sodium is not null and restaurant is not null
group by restaurant
order by avg_sodium desc

--average carbohydrates(g) of food items per restaurant, excluding nulls

select restaurant, round(avg(carbohydrates),0) as avg_carbohydrates
from fastfood_2022
where carbohydrates is not null and restaurant is not null
group by restaurant
order by avg_carbohydrates desc

--average protein(g) of food items per restaurant, excluding nulls

select restaurant, round(avg(protein),0) as avg_protein
from fastfood_2022
where protein is not null and restaurant is not null
group by restaurant
order by avg_protein desc

--highest calorie food item(s) per restaurant

With maxcalories as (
select restaurant, item_name, calories,
RANK() OVER (PARTITION BY restaurant ORDER BY calories DESC) as highest_calorie
from fastfood_2022
where calories <> '0' 
group by restaurant, item_name, calories
)
select ma.restaurant, max_cal_restaurant.item_name, calories
from maxcalories ma
inner join (select restaurant, item_name, MAX(highest_calorie) as maxcal
			from maxcalories
			group by restaurant, item_name) as max_cal_restaurant
on ma.restaurant = max_cal_restaurant.restaurant and ma.highest_calorie = max_cal_restaurant.maxcal and ma.item_name = max_cal_restaurant.item_name
where highest_calorie = '1'
group by ma.restaurant, max_cal_restaurant.item_name, calories
order by calories desc

--same output, different code

select restaurant, item_name, calories from (
select restaurant, item_name, calories,
DENSE_RANK() OVER (PARTITION BY restaurant order by calories desc) as ranking
from fastfood_2022
group by restaurant, item_name, calories) as highrank
where ranking = 1 and restaurant is not null and calories is not null and calories <> '0'
order by calories desc

--lowest calorie food item(s) per restaurant

With mincalories as (
select restaurant, item_name, calories,
RANK() OVER (PARTITION BY restaurant ORDER BY calories asc) as lowest_calorie
from fastfood_2022
where calories <> '0' 
group by restaurant, item_name, calories
)
select ma.restaurant, min_cal_restaurant.item_name, calories
from mincalories ma
inner join (select restaurant, item_name, MIN(lowest_calorie) as mincal
			from mincalories
			group by restaurant, item_name) as min_cal_restaurant
on ma.restaurant = min_cal_restaurant.restaurant and ma.lowest_calorie = min_cal_restaurant.mincal and ma.item_name = min_cal_restaurant.item_name
where lowest_calorie = '1'
group by ma.restaurant, min_cal_restaurant.item_name, calories
order by calories desc

--highest fat food item(s) per restaurant

With maxfatrank as (
select restaurant, item_name, total_fat,
RANK() OVER (PARTITION BY restaurant ORDER BY total_fat DESC) as highest_fat
from fastfood_2022
where total_fat <> '0' 
group by restaurant, item_name, total_fat
)
select ma.restaurant, max_fat_restaurant.item_name, ma.total_fat
from maxfatrank ma
inner join (select restaurant, item_name, MAX(highest_fat) as maxfat
			from maxfatrank
			group by restaurant, item_name) as max_fat_restaurant
on ma.restaurant = max_fat_restaurant.restaurant and ma.highest_fat = max_fat_restaurant.maxfat and ma.item_name = max_fat_restaurant.item_name
where highest_fat = '1'
group by ma.restaurant, max_fat_restaurant.item_name, ma.total_fat
order by total_fat desc

--lowest fat food item(s) per restaurant

With minfatrank as (
select restaurant, item_name, total_fat,
RANK() OVER (PARTITION BY restaurant ORDER BY total_fat ASC) as lowest_fat
from fastfood_2022
where total_fat <> '0' 
group by restaurant, item_name, total_fat
)
select ma.restaurant, min_fat_restaurant.item_name, ma.total_fat
from minfatrank ma
inner join (select restaurant, item_name, MIN(lowest_fat) as minfat
			from minfatrank
			group by restaurant, item_name) as min_fat_restaurant
on ma.restaurant = min_fat_restaurant.restaurant and ma.lowest_fat = min_fat_restaurant.minfat and ma.item_name = min_fat_restaurant.item_name
where lowest_fat = '1'
group by ma.restaurant, min_fat_restaurant.item_name, ma.total_fat
order by total_fat desc

--highest cholesterol item(s) per restaurant 

select restaurant, item_name, cholesterol from (
select restaurant, item_name, cholesterol,
DENSE_RANK() OVER (PARTITION BY restaurant order by cholesterol desc) as ranking
from fastfood_2022
group by restaurant, item_name, cholesterol) as highrank
where ranking = 1 and restaurant is not null and cholesterol is not null and cholesterol <> '0'
order by cholesterol desc

--lowest cholesterol item(s) per restaurant 

select restaurant, item_name, cholesterol from (
select restaurant, item_name, cholesterol,
DENSE_RANK() OVER (PARTITION BY restaurant order by cholesterol asc) as ranking
from fastfood_2022
where restaurant is not null and cholesterol is not null and cholesterol <> '0'
group by restaurant, item_name, cholesterol) as lowrank
where ranking = 1 
order by cholesterol desc

--highest sodium item(s) per restaurant 

select restaurant, item_name, sodium from (
select restaurant, item_name, sodium,
DENSE_RANK() OVER (PARTITION BY restaurant order by sodium desc) as ranking
from fastfood_2022
group by restaurant, item_name, sodium) as highrank
where ranking = 1 and restaurant is not null and sodium is not null and sodium <> '0'
order by sodium desc

--lowest sodium item(s) per restaurant 

select restaurant, item_name, sodium from (
select restaurant, item_name, sodium,
DENSE_RANK() OVER (PARTITION BY restaurant order by sodium asc) as ranking
from fastfood_2022
where restaurant is not null and sodium is not null and sodium <> '0'
group by restaurant, item_name, sodium) as lowrank
where ranking = 1 
order by sodium desc

--highest carbohydrates items per restaurant

select restaurant, item_name, carbohydrates from (
select restaurant, item_name, carbohydrates,
DENSE_RANK() OVER (PARTITION BY restaurant order by carbohydrates desc) as ranking
from fastfood_2022
group by restaurant, item_name, carbohydrates) as highrank
where ranking = 1 and restaurant is not null and carbohydrates is not null and carbohydrates <> '0'
order by carbohydrates desc

--lowest carbohydrates items per restaurant

select restaurant, item_name, carbohydrates from (
select restaurant, item_name, carbohydrates,
DENSE_RANK() OVER (PARTITION BY restaurant order by carbohydrates asc) as ranking
from fastfood_2022
where restaurant is not null and carbohydrates is not null and carbohydrates <> '0'
group by restaurant, item_name, carbohydrates) as lowrank
where ranking = 1 
order by carbohydrates desc

--highest protein items per restaurant

select restaurant, item_name, protein from (
select restaurant, item_name, protein,
DENSE_RANK() OVER (PARTITION BY restaurant order by protein desc) as ranking
from fastfood_2022
group by restaurant, item_name, protein) as highrank
where ranking = 1 and restaurant is not null and protein is not null and protein <> '0'
order by protein desc

--lowest protein items per restaurant

select restaurant, item_name, protein from (
select restaurant, item_name, protein,
DENSE_RANK() OVER (PARTITION BY restaurant order by protein asc) as ranking
from fastfood_2022
where restaurant is not null and protein is not null and protein <> '0'
group by restaurant, item_name, protein) as lowrank
where ranking = 1 
order by protein desc

--which resturant has highest calorie per food_category?

With highranks as (
select food_category, restaurant, item_name, calories,
DENSE_RANK() OVER (PARTITION BY food_category ORDER BY calories DESC) as rankings
from fastfood_2022 
)
select food_category, restaurant, item_name, calories
from highranks
where rankings = 1
order by calories desc

--which resturant has lowest calorie per food_category, excluding nulls and 0s

With highranks as (
select food_category, restaurant, item_name, calories,
DENSE_RANK() OVER (PARTITION BY food_category ORDER BY calories ASC) as rankings
from fastfood_2022 
where calories is not null and calories <> '0'
)
select food_category, restaurant, item_name, calories
from highranks
where rankings = 1 
order by calories desc


--Limitations: Many items have NULLs as values so calculations may seem very high or low. This is due to missing information, further investigation or data collecting would be needed for a more thorough analysis.
--Some restaurants have many items and nutritional values so their averages are more accurate, while some restaurants only had a few items that had all relevant information so their averages are very skewed, either really high or low.
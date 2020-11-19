

# 1 +2 + 3 I created the table and imported the file using import wizard. I could create the table manually, but I had errors so I followed the simplier way. 

#4 checking data
select * from house_price_data; #same data as python and excel, very well;

select count(id) from house_price_data;

select count(distinct(id)) from house_price_data; # here we see that we have duplicates, performed in python ;

# 5 to drop coloumn date
ALTER TABLE house_price_data
DROP COLUMN date;

# date coloumn is gone, checking

select * from house_price_data
limit 10;

#6 how many data? 

select count(*) from house_price_data;

#7 unique values

select distinct bedrooms as uniquebedrooms from house_price_data
order by bedrooms;

select distinct `condition` as uniquecondition from house_price_data
order by `condition`;

select distinct grade as uniquegrade from house_price_data
order by grade;

select distinct bathrooms as uniquebathroom from house_price_data
order by bathrooms;

select distinct floors as uniquefloors from house_price_data
order by floors;

#8 filter id

select id as house_id, price as price from house_price_data
order by price desc
LIMIT 10;

#while importing the data had to change the name of price to get rid of an error! I dunno why!
ALTER TABLE house_price_data
RENAME COLUMN cost TO price

#9 avg 
select round(avg(price),2) from house_price_data;

# 10. What is the average price of the houses grouped by bedrooms? 

select bedrooms, round(avg(price),2) as avgprice
from house_price_data
group by bedrooms
order by bedrooms;

#10. What is the average sqft_living of the houses grouped by bedrooms? 

select bedrooms, round(avg(sqft_living),2) as avglivingsqft
from house_price_data
group by bedrooms
order by bedrooms;

#10. What is the average price of the houses with a waterfront and without a waterfront? 

select waterfront, round(avg(price),2) as avgprice
from house_price_data
group by waterfront
order by waterfront;

#10. Is there any correlation between the columns condition and grade? 

select 
      (avg(hp.condition*grade) - avg(hp.condition) * avg(grade)) /
      (sqrt(avg(hp.condition*hp.condition) - avg(hp.condition) * avg(hp.condition)) * sqrt(avg(grade * grade) - avg(grade) * avg(grade)))
      As 'Pearsons r'  
      from house_price_data as hp;    
 

#11. Number of bedrooms either 3 or 4, Bathrooms more than 3, Bathrooms more than 3, No waterfront, Condition should be 3 at least, Grade should be 5 at least, Price less than 300000

select * from house_price_data
where bedrooms in (3, 5) and bathrooms>3 and waterfront=0 and house_price_data.condition >=3 and grade >= 5 and price <300000
order by 2; 

#12.Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. Write a query to show them the list of such properties. You might need to use a sub query for this problem.


#without subquerey
select *,(select round(avg(price),2) from house_price_data) as avgerage, price from house_price_data
where price > (select round(avg(price) *2,2) from house_price_data); 

#subquery
select * from(
              select *,(select round(avg(price)*2,2) from house_price_data) as avgeragetwice from house_price_data) as calculation
where avgeragetwice < price;

#13.view creation

create view avgtwice_v as select * from(
              select *,(select round(avg(price)*2,2) from house_price_data) as avgeragetwice from house_price_data) as calculation
where avgeragetwice < price;

#14. Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?

select `bedrooms`, round(avg( price),2) as avg_price
from house_price_data
where bedrooms in (3, 4)
group by bedrooms;

# tried a complicated way after talking to Imogen (i know, u meant it should be simple, but my brain did not work ;))
select sum(avg_4) - sum(avg_3) as differenceavg from (
     select case 
     when bedrooms = 3 then avg_price 
     else 0 
     end as avg_3,
     case 
     when bedrooms = 4 then avg_price
     else 0
     end as avg_4
     from (
select `bedrooms`, round(avg( price),2) as avg_price
from house_price_data
where bedrooms in (3, 4)
group by bedrooms) as bed) as result;


#15.What are the different locations where properties are available in your database? (distinct zip codes)

select distinct house.`zipcode`
from house_price_data as house

#16.Show the list of all the properties that were renovated

select * from house_price_data
where yr_renovated <> 0 
order by yr_renovated; 


#17.Provide the details of the property that is the 11th most expensive property in your database.
#using row_number, soure: https://www.sqlshack.com/overview-of-the-sql-row-number-function/

select * from (
select row_number () over (order by price desc) as num, house_price_data.* from house_price_data) filter
WHERE num = 11;




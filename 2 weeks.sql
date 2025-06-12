CREATE SCHEMA pizza_runner;
show tables;
use pizza_runner;
CREATE TABLE runners (
  runner_id INTEGER,
  registration_date DATE
);
INSERT INTO runners
  (runner_id, registration_date)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');

CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time TIMESTAMP
);
INSERT INTO customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');

CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

INSERT INTO customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');
  show tables;
  
  CREATE TABLE pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);
INSERT INTO pizza_names
  (pizza_id, pizza_name)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


CREATE TABLE pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);
INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');

CREATE TABLE pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);
INSERT INTO pizza_toppings
  (topping_id, topping_name)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');

CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

INSERT INTO runner_orders
  (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');

  /* Handling null values */
  set sql_safe_updates=0;
use pizza_runner;   /* customers_orders*/
update customer_orders
set exclusions=0
where exclusions ='null' or exclusions='NA';

update customer_orders
set extras=0
where extras ='null' or extras='NA';

select * from runner_orders;
update runner_orders
set cancellation='0'
where cancellation='null' or cancellation='NA';
use pizza_runner;
/* Accessing every table */
select * from customer_orders;
select * from pizza_names;
select * from pizza_recipes;
select * from pizza_toppings;
select * from runner_orders;
select * from runners;
                                      /*  A. PIZZA METRICS */
                                      
/* 1. HOW MANY PIZZAS WERE ORDERED */

select count(order_id) as total_orders
from customer_orders;

/*2. how many unique customers orders were made? */

select customer_id
from customer_orders
group by customer_id;

/*3. how many successful orders were delivered by each runner*/

select * from runner_orders;
select count(cancellation) as total_success_orders_sends
from runner_orders
where cancellation ='NA' or cancellation='null';

/* 4. how many of each type of pizza was delivered? */
use pizza_runner;
select * from customer_orders;
select pizza_name,count(p.pizza_id) as total_pizzas_delivered
from customer_orders as c join pizza_names as p
on c.pizza_id=p.pizza_id
group by pizza_name,p.pizza_id;

/* 5.how many vegetarian and Meatlovers were ordered by each customer?*/

select c.customer_id,p.pizza_name,count(p.pizza_name) as ordered_pizzas
from customer_orders as c left join pizza_names as p
on c.pizza_id=p.pizza_id
group by c.customer_id,p.pizza_name
order by customer_id asc;

/* 6.what was the maximum number of pizzas delivered in a single order?*/

select customer_id,count(pizza_id) as Max_ordered_pizzas
from customer_orders
group by customer_id
order by Max_ordered_pizzas desc
limit 1 ;

use pizza_runner;

/* 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?*/

select customer_id,
sum(CASE WHEN exclusions >0 THEN 1 ELSE 0 END) as Changes_pizzas,
sum(CASE WHEN exclusions =0 THEN 1 ELSE 0 END) as No_Changes_pizzas
from customer_orders
group by customer_id;

/*8.How many pizzas were delivered that had both exclusions and extras? */
select count(c.order_id) as Ordered_pizzas
from customer_orders as c right join runner_orders as r
on c.order_id=r.order_id
where cancellation='NA';

/*9.What was the total volume of pizzas ordered for each hour of the day?*/

select extract(hour from order_Time) as hours,count(order_id) as Pizza_ordered_count
from customer_orders
group by extract(hour from order_time) ;

/* 10.What was the volume of orders for each day of the week? */

select extract(DAY from order_time) as Days , count(order_id) as Pizza_ordered_count
from customer_orders
group by extract( DAY from order_time) ;

                                        /* B.RUNNER AND CUSTOMER EXPERIENCE * /
									
/* 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01) */

select * from runners;
select date_add('2021-01-01',interval timestampdiff(week,'2021-01-01',registration_date) WEEK ) as weeks_start,
count(runner_id) as Runners_Signed_up
from runners
where registration_date>='2021-01-01'
group by date_add('2021-01-01',interval timestampdiff(week,'2021-01-01',registration_date) WEEK ) ;

/*2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?*/
with average_minute as
(  
select runner_id,extract(minute from pickup_time) as 'Minutes' 
from runner_orders)

select runner_id,avg(minutes) as 'avg_min'
from Average_minute
group by runner_id;

/* 3.Is there any relationship between the number of pizzas and how long the order takes to prepare?*/
use pizza_runner;
select * from customer_orders;
select * from runner_orders;
select o.order_id,o.order_time, r.pickup_time,count(o.order_id) as numberofpizza,timestampdiff(minute,o.order_time,pickup_time) as Preparation
 from customer_orders as o join runner_orders as r
on o.order_id=r.order_id
group by o.order_id,o.order_time, r.pickup_time;

/*4.What was the average distance travelled for each customer? */

select customer_id,avg(distance) as avg_distance
from runner_orders  as r join customer_orders as c
on r.order_id=c.order_id
group by customer_id;

/* 5.What was the difference between the longest and shortest delivery times for all orders?*/
use pizza_runner;
select * from runner_orders;
with runner_order2 as (select order_id,duration
from runner_orders
where duration not like 'null')
select max(duration)-min(duration) as Difference_duration
from runner_order2;

/*6.What was the average speed for each runner for each delivery and do you notice any trend for these values? */
use pizza_runner;
SELECT 
  r.runner_id, 
  c.customer_id, 
  c.order_id, 
  COUNT(c.order_id) AS pizza_count, 
  r.distance, (r.duration / 60) AS duration_hr , 
  ROUND((r.distance/r.duration * 60), 2) AS avg_speed
FROM runner_orders AS r
JOIN customer_orders AS c
  ON r.order_id = c.order_id
WHERE distance != 0
GROUP BY r.runner_id, c.customer_id, c.order_id, r.distance, r.duration
ORDER BY c.order_id;

/*7.What is the successful delivery percentage for each runner?*/
select* from runner_orders;
select s.runner_id,s.deliveries,t.total_delivery_counts,(deliveries/total_delivery_counts )*100 as Percentage
from (select runner_id,count(cancellation) as deliveries
from runner_orders
where cancellation='NA'
group by runner_id) as s join (select runner_id,count(runner_id) as total_delivery_counts
from runner_orders 
group by runner_id) as t
on s.runner_id=t.runner_id;

select                                          /* approach-2*/
runner_id,round(100*sum(
case when distance='null' then 0 
else 1 end)/count(*)) as Percentage
from runner_orders
group by runner_id;

                            /* C.ingredient optimazation */
select * from pizza_toppings;
select * from pizza_recipes;
select * from pizza_names;
select * from customer_orders;

/*1.What are the standard ingredients for each pizza?*/
select pizza_name,topping_name
from pizza_names as p join pizza_recipes as p1
on p.pizza_id=p1.pizza_id join pizza_toppings as p2
on p1.toppings=p2.topping_id;

/*2.What was the most commonly added extra?*/
select * from customer_orders;
select extras,count(*) as count_extra
from customer_orders
where extras>'0'
group by extras
order by count_extra desc
limit 1;

/*3.What was the most common exclusion?*/
select exclusions,count(*) as count_exclusion
from customer_orders
where exclusions>'0'
group by exclusions 
order by count_exclusion desc
limit 1;

/*4.Generate an order item for each record in the customers_orders table in the format of one of the following:*/
/*Meat Lovers
Meat Lovers - Exclude Beef
Meat Lovers - Extra Bacon
Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers */
SELECT  c.pizza_id,   CONCAT(
        pizza_name,
        IF(exclusions IS NOT NULL AND exclusions != '', CONCAT(' - Exclude ', exclusions), '') ,
        IF(extras IS NOT NULL AND extras != '', CONCAT(' - Extra ', extras), '')
    ) AS order_item
from customer_orders  as c join pizza_names as p
on c.pizza_id=p.pizza_id join pizza_recipes as p1
on p.pizza_id=p1.pizza_id join pizza_toppings as p2
on p1.toppings=p2.topping_id; 


/*5.Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients*/
/*For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"*/

/*6.What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?*/
select  pt.topping_name,count(*) as Total_ingredients
from runner_orders as r join customer_orders as c
on r.order_id=c.order_id join pizza_names as p1
on c.pizza_id=p1.pizza_id join pizza_recipes as p2
on p1.pizza_id=p2.pizza_id join pizza_toppings as pt
on FIND_IN_SET(pt.topping_id, p2.toppings)
group by pt.topping_name
order by Total_ingredients desc;
  //* D. Pricing and Rating *//
/*1.if a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges
for changes - how much money has Pizza Runner made so far if there are no delivery fees?*/
select * from customer_orders;
use pizza_runner;
select customer_id,p.pizza_id,pizza_name,case when p.pizza_id=1 then 12 else 10 end as Cost
from pizza_names as p join customer_orders as c
on p.pizza_id=c.pizza_id
group by customer_id;
 
                               /* D.Pricing and Rating */
/*1.if a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges
for changes - how much money has Pizza Runner made so far if there are no delivery fees?*/
select * from customer_orders;
use pizza_runner;
select   p.pizza_name,
    COUNT(*) AS pizza_count,sum(case when c.pizza_id=1 then 12 else 10 end) as Cost
from runner_orders as r join customer_orders as c
on r.order_id=c.order_id join pizza_names as p
on c.pizza_id=p.pizza_id
WHERE r.cancellation IS NULL OR r.cancellation = '' OR r.cancellation = 'null'
group by p.pizza_name;


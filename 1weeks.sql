use dannys_diner;
/* 1.What is the total amount each customer spent at the restaurant? */
  select s.customer_id,sum(m.price) as total_amount_Each_person
  from sales as s join menu as m
  on s.product_id=m.product_id
  group by s.customer_id;
  
  /* 2.How many days has each customer visited the restaurant?*/
  select customer_id,count(order_date) as Visited
  from sales
  group by customer_id;
  
USE DANNYS_DINER;
select customer_id,order_date,s.product_id,product_name
from sales as s   LEFT JOIN menu as m
on s.product_id=m.product_id;

/*3.What was the first item from the menu purchased by each customer?  */
with first_item as(
select customer_id,first_value(product_name)over(partition by customer_id order by order_date ) as 'First_items'
from sales as s left join menu as m
on s.product_id=m.product_id)

select customer_id,first_items as First_item_for_each_customer
from first_item;

/* 4.1.  most purched ITems on Menu */
select product_name,count(s.product_id) 'Most_purchased_items'
from sales as s left join menu as m
on s.product_id=m.product_id
group by product_name,s.product_id;
/* 4.2 How many times was it purchased by all customer */
select customer_id,count(customer_id) as 'Times_purchases_for_each_one'
from sales 
group by customer_id;

/* 5.which items was the most purchased by each customer? */

select customer_id,product_name,count(s.product_id) as "Each_ordered_count"
from sales as s   LEFT JOIN menu as m
on s.product_id=m.product_id
group by customer_id,m.product_name;
use dannys_diner;
/*6.Which item was purchased first by the customer after they became a member?*/

select MemberCard.customer_id,MemberCard.order_date,join_date,
MemberCard.product_name
from
(select s.customer_id,s.order_date,join_date,m1.product_name
from members as m join sales as s
on m.customer_id=s.customer_id join menu as m1
on s.product_id=m1.product_id
where m.join_date<=s.order_date
order by s.customer_id,m1.product_name asc) as MemberCard
group by MemberCard.customer_id,MemberCard.order_date,MemberCard.product_name,MemberCard.join_date;

/*7.Which item was purchased just before the customer became a member?*/
with Before_Member as
(
select s.customer_id,s.order_date,m.join_date,m1.product_name
from members as m join sales as s
on m.customer_id=s.customer_id join menu as m1
on s.product_id=m1.product_id
where s.order_date<=m.join_date
order by s.customer_id asc)

select customer_id,order_date,join_date,product_name
from Before_Member
group by s.customer_id,s.order_date,m.join_date,m1.product_name;

use dannys_diner;

/* 8.what is the total items and amount spent for each member before they became a member?*/

select s.customer_id,count(m1.product_name) as total_items,sum(m1.price) as total_amount
from members as m right join sales as s
on s.customer_id=m.customer_id join menu as m1
on s.product_id=m1.product_id
group by s.customer_id
order by s.customer_id asc;

/*9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?*/

select s.customer_id,
SUM( 
CASE
WHEN m.product_name='sushi' THEN 1
WHEN  m.product_name='curry' THEN 1.5
else 1.2
END) as total_points
from sales as s join menu as m
on s.product_id=m.product_id
group by customer_id;

/*10.In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
 not just sushi - how many points do customer A and B have at the end of January?*/

select s.customer_id,
SUM( 
CASE
WHEN m.product_name='sushi' THEN 1
WHEN  m.product_name='curry' THEN 1.5
else 1.2
END) as total_points
from sales as s join menu as m
on s.product_id=m.product_id
where order_date>=31-01-2021
group by customer_id;

/* 11. Add column membership */
select s.customer_id,s.order_date,m1.product_name,m1.price,(
CASE 
WHEN  m.join_date  is not null and order_date>=join_date THEN 'Y'
ELSE 'N'
END) as member
from sales as s left join members as m
on m.customer_id=s.customer_id join menu as m1
on s.product_id=m1.product_id
order by customer_id,order_date;

/* 12. Rank All The Things
Danny also requires further information about the ranking of customer products,
 but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.*/
 
 with members as (
 select s.customer_id,s.order_date,m1.product_name,m1.price,(
CASE 
WHEN  m.join_date  is not null and order_date>=join_date THEN 'Y'
ELSE 'N'
END) as member
from sales as s left join members as m
on m.customer_id=s.customer_id join menu as m1
on s.product_id=m1.product_id
order by customer_id,order_date)

select customer_id,
order_date,product_name,
price,member,
CASE 
WHEN member='Y' THEN
dense_rank()over(partition by member order by order_date)
end  as Ranking
from members;







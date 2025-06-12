# 8-Week-SQL-Challege-Files
# 🍱 1st Week SQL Challenge – Danny's Diner
![image alt](https://github.com/PUJITHA12-S/8-Week-SQL-Challege-Files/blob/4ea0d24e3927bcef736195ea024a62758f8309d2/Danny's%20Diner.png)
### 📖 Introduction
  
Danny loves Japanese food and opened a small restaurant, Danny’s Diner, in early 2021 selling sushi, curry, and ramen. As the business grows, Danny wants to understand his customer behavior better to improve service and evaluate expanding his loyalty program.

### 🧩 Problem Statement
Danny is looking for insights from his limited customer data. He wants to know how frequently customers visit, how much they spend, and which menu items are their favorites. These insights will help Danny deliver personalized experiences and make smarter business decisions.

### 🗃️ Datasets
All tables are part of the dannys_diner schema:
* sales: Tracks customer purchases by customer_id, order_date, and product_id.
* menu: Maps each product_id to its name and price.
* members: Captures when each customer_id joined the loyalty program.

### 🧠 Case Study Questions
This analysis answers the following SQL-based business questions:

1. Total amount spent by each customer.
2. Number of days each customer visited.
3. First menu item purchased by each customer.
4. Most purchased item and its frequency.
5. Most popular item per customer.
6. First item purchased after becoming a member.
7. Last item purchased before becoming a member.
8. Total items and amount spent before joining.
9. Points earned (10x per $1, with 2x multiplier for sushi).
10. Points earned in first week of membership (2x for all items).

### 📊 Key Insights
1. Customer A spent the most and also purchased the widest variety of items.
2. Sushi was the most popular menu item across all customers.
3. Customers make frequent purchases shortly after joining the loyalty program.
4. Loyalty members earn significantly more points, especially within the first week.

### 💡 Recommendations
1. Promote sushi with targeted offers since it’s already high-performing and has a points multiplier.
2. Encourage new memberships by highlighting the 2x points benefit during the first week.
3. Consider analyzing inactive members for re-engagement opportunities.

### ✅ Conclusion
Danny’s Diner has valuable customer data that can be leveraged for personalizing service, optimizing loyalty rewards, and enhancing menu strategies. With structured SQL insights, Danny can make data-driven decisions to sustain and grow his business.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 🍕 2nd week SQL Challenge - Pizza Runner

### 📖 Introduction
Danny has expanded his business ventures with a new delivery-based startup called Pizza Runner, blending the convenience of on-demand food with a classic pizza menu. The company is growing but needs data-driven insights to improve operations and customer satisfaction.

### 🧩 Problem Statement
Pizza Runner has collected data across orders, deliveries, ingredients, and customer interactions. Danny wants to analyze key performance metrics, optimize delivery operations, understand customer preferences, and assess financial performance to improve overall business efficiency.

### 🗃️ Datasets
All tables are part of the pizza_runner schema:
* runners: Contains the runner_id and registration dates.
* customer_orders: Captures order details like customer_id, pizza_id, exclusions, extras, and order_time.
* runner_orders: Records delivery info such as pickup_time, distance, duration, and cancellations.
* pizza_names: Maps pizza_id to pizza names (e.g., Meat Lovers, Vegetarian).
* pizza_recipes: Lists ingredients (by topping_id) per pizza type.
* pizza_toppings: Maps topping_id to topping names.

### 🧠 Case Study Analysis Sections
### 🍕 A. Pizza Metrics
* Total number of pizzas ordered
* Unique customers who ordered
* Successful deliveries by runners
* Pizza type popularity
* Customer-specific pizza ordering behavior
* Orders with/without changes
* Hourly and daily order volumes

### 🏃‍♂️ B. Runner and Customer Experience
* Weekly sign-ups by runners
* Average pickup time per runner
* Order preparation time vs number of pizzas
* Average distance traveled per customer
* Delivery time variation
* Speed analysis per runner
* Successful delivery rates

### 🧂 C. Ingredient Optimization
* Standard pizza ingredients
* Most common extras and exclusions
* Breakdown of order customizations
* Total quantity of ingredients used in delivered pizzas

### 💰 D. Pricing and Revenue
* Total revenue earned based on pizza type pricing
* No delivery fees or extra customization charges assumed

### 📊 Key Insights
1. Meat Lovers is the most frequently ordered pizza.
2. Evening hours (6–9 PM) are peak for orders.
3. Cheese, Bacon, and Mushrooms are top-used ingredients.
4. Most customers placed repeat orders, often customizing toppings.
5. Runner 1 had the highest number of successful deliveries.

### 💡 Recommendations
1. Focus delivery scheduling during peak hours for better service.
2. Prioritize inventory stock for top toppings like Cheese and Bacon.
3. Train underperforming runners using best practices from Runner 1.
4. Implement better data validation to clean null or inconsistent entries.
5. Offer loyalty benefits to frequent customizers to boost engagement.

### ✅ Conclusion
The Pizza Runner analysis reveals clear trends in customer behavior, delivery efficiency, and ingredient use. By acting on these insights, Danny can improve operations, cut costs, and scale Pizza Runner more effectively through smarter decisions backed by SQL analysis.

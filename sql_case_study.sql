-- Retrive the total number of orders placed.
SELECT COUNT(order_id) AS total_orders FROM orders;

-- calculate the total revenue generated from pizza sales.
SELECT SUM(order_details.quantity * pizzas.price ) AS total_revenue FROM order_details JOIN pizzas 
ON order_details.pizza_id = pizzas.pizza_id;

-- Identify the highest-priced pizza.
SELECT pizza_types.name,pizzas.price FROM pizza_types JOIN pizzas 
ON pizza_types.pizza_type_id= pizzas.pizza_type_id ORDER BY pizzas.price DESC LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT pizzas.size,COUNT(order_details.order_details_id) from order_details JOIN pizzas 
ON order_details.pizza_id= pizzas.pizza_id GROUP BY pizzas.size ORDER BY COUNT(order_details.order_details_id)  DESC LIMIT 1  ;

-- List the top 5 most ordered pizza types along with their quantities.
 SELECT pizza_types.name, SUM(order_details.quantity) FROM pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id = pizzas.pizza_type_id
 JOIN order_details ON order_details.pizza_id = pizzas.pizza_id GROUP BY pizza_types.name
 ORDER BY SUM(order_details.quantity) DESC LIMIT 5;
 
 -- Join the necessary tables to find the total quantity of each pizza category ordered.
 SELECT pizza_types.category, SUM(order_details.quantity) FROM pizza_types JOIN pizzas 
 ON pizza_types.pizza_type_id=pizzas.pizza_type_id JOIN order_details 
 ON pizzas.pizza_id=order_details.pizza_id GROUP BY pizza_types.category ORDER BY SUM(order_details.quantity) DESC; 
 
 -- Determine the distribution of orders by hour of the day.
 SELECT HOUR(order_time),COUNT(order_id) FROM orders 
 GROUP BY HOUR(order_time)  ORDER BY COUNT(order_id) DESC;
 
 -- Join relevant tables to find the category-wise distribution of pizzas.
 SELECT category, COUNT(name) FROM pizza_types GROUP BY category ORDER BY COUNT(name);
 
--  Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT AVG(total_quantity) FROM 
(SELECT orders.order_date, SUM(order_details.quantity) AS total_quantity FROM 
orders  JOIN  order_details ON orders.order_id= order_details.order_id 
GROUP BY orders.order_date) AS order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.category,SUM(pizzas.price * order_details.quantity) AS total_revenue FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id JOIN order_details ON
pizzas.pizza_id = order_details.pizza_id GROUP BY pizza_types.category ORDER BY total_revenue DESC LIMIT 3;








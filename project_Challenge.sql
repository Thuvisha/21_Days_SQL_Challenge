-- Phase 1: Foundation & Inspection
-- Install IDC_Pizza.dump as IDC_Pizza server

create database IDC_Pizza;

select * from IDC_Pizza.orders Limit 10;
-- order_id  date  time

select * from IDC_Pizza.order_details Limit 10;
-- order_details_id  order_id  pizza_id  quantity

select * from IDC_Pizza.pizza_types  Limit 10;
-- pizza_type_id   name  category  ingredients

select * from IDC_Pizza.pizzas Limit 10;
-- pizza_id   pizza_type_id   size   price

-- List all unique pizza categories (DISTINCT).
SELECT DISTINCT category AS unique_pizza_categories FROM IDC_Pizza.pizza_types;

-- Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
SELECT pizza_type_id, COALESCE(ingredients,'Missing Data') AS Ingredients FROM IDC_Pizza.pizza_types LIMIT 5;

-- Check for pizzas missing a price
SELECT * FROM  IDC_Pizza.pizzas WHERE price IS NULL;

-- Phase 2: Filtering & Exploration

-- Orders placed on '2015-01-01' (SELECT + WHERE).
SELECT * FROM IDC_Pizza.orders WHERE date = '2015-01-01';

-- List pizzas with price descending.
SELECT * FROM IDC_Pizza.pizzas ORDER BY price DESC;

-- Pizzas sold in sizes 'L' or 'XL'.
SELECT * FROM IDC_Pizza.pizzas WHERE size = 'L' OR size = 'XL';

-- Pizzas priced between $15.00 and $17.00.
SELECT * FROM IDC_Pizza.pizzas WHERE price BETWEEN 15 AND 17;

-- Pizzas with "Chicken" in the name.
SELECT * FROM IDC_Pizza.pizza_types WHERE name LIKE '%Chicken%';

-- Orders on '2015-02-15' or placed after 8 PM.
SELECT * FROM IDC_Pizza.orders WHERE date = '2015-02-15' OR time = '20:00:00';





-- Phase 3: Sales Performance

-- Total quantity of pizzas sold (SUM).
SELECT SUM(quantity) AS Total_quantity_of_pizzas_sold FROM IDC_Pizza.order_details;

-- Average pizza price (AVG).
SELECT AVG(price) AS Average_pizza_price FROM IDC_Pizza.pizzas;

-- Total order value per order (JOIN, SUM, GROUP BY).

SELECT o_d.order_id, SUM(o_d.quantity * p.price) AS Total_order_value_per_order FROM IDC_Pizza.pizzas p 
JOIN IDC_Pizza.order_details o_d ON p.pizza_id = o_d.pizza_id GROUP BY o_d.order_id ORDER BY o_d.order_id;

-- Total quantity sold per pizza category (JOIN, GROUP BY).

SELECT p_t.category,SUM(o_d.quantity) AS Total_quantity_sold_per_pizza_category  FROM IDC_Pizza.pizza_types p_t JOIN IDC_Pizza.pizzas p ON p_t.pizza_type_id = p.pizza_type_id 
JOIN IDC_Pizza.order_details  o_d ON o_d.pizza_id = p.pizza_id GROUP BY p_t.category;

-- Categories with more than 5,000 pizzas sold (HAVING).
SELECT p_t.category,SUM(o_d.quantity) AS Total_quantity_sold_per_pizza_category  FROM IDC_Pizza.pizza_types p_t JOIN IDC_Pizza.pizzas p ON p_t.pizza_type_id = p.pizza_type_id 
JOIN IDC_Pizza.order_details  o_d ON o_d.pizza_id = p.pizza_id GROUP BY p_t.category HAVING Total_quantity_sold_per_pizza_category> 5000;




-- Pizzas never ordered (LEFT/RIGHT JOIN).
SELECT p_t.name AS Pizzas_never_ordered FROM IDC_Pizza.pizzas p JOIN IDC_Pizza.pizza_types p_t ON p.pizza_type_id = p_t.pizza_type_id 
LEFT JOIN IDC_Pizza.order_details o_d ON o_d.pizza_id = p.pizza_id WHERE o_d.pizza_id IS NULL;

-- Price differences between different sizes of the same pizza (SELF JOIN).

SELECT p_t.name,p.size,p.price,p_p.size,p_p.price ,ROUND(ABS(MAX(p.price) - MIN(p_p.price)),2) AS Price_difference
FROM IDC_Pizza.pizza_types  p_t JOIN IDC_Pizza.pizzas p ON p_t. pizza_type_id = p.pizza_type_id
JOIN IDC_Pizza.pizzas p_p ON p.pizza_type_id = p_p.pizza_type_id WHERE p.size <> p_p.size
GROUP BY p_t.name,p.size,p.price,p_p.size,p_p.price;






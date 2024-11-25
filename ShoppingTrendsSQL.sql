SELECT *
FROM shopping_trends

--Select Data that we are using and order it by the age of the consumer

SELECT customer_id, age, gender, category, purchase_amount, location, season, review_rating, payment_method, shipping_type preferred_payment_method, frequency_of_purchases
FROM shopping_trends
ORDER BY age

-- Looking at location vs. average amount purchased, examines purchasing behaviors for each location

SELECT location, AVG(purchase_amount) average_spent
FROM shopping_trends
GROUP BY location
ORDER BY average_spent desc


-- Looking at age vs. average amount purchased, examines purchasing behaviors of each age group

SELECT age, COUNT(*) total_customers, AVG(purchase_amount) average_spent
FROM shopping_trends
GROUP BY age
ORDER BY average_spent desc


-- Looking at the payment_methods vs. total amount purchased across them

SELECT payment_method, COUNT(*) total_customers, SUM(purchase_amount) total_spent, AVG(review_rating) average_rating
FROM shopping_trends
GROUP BY payment_method
ORDER BY total_spent desc


--Looking at states and their average reviews compared to total customers

SELECT location, COUNT(*) total_customers, SUM(purchase_amount) total_spent, AVG(review_rating) average_rating
FROM shopping_trends
GROUP BY location
ORDER BY average_rating desc


--Looking at seasons with the highest total amount purchased

SELECT season, COUNT(*) total_customers, SUM(purchase_amount) total_spent, AVG(purchase_amount) average_spent_per_customer
FROM shopping_trends
GROUP BY season
ORDER BY total_spent

--Looking at average spend per transaction

SELECT AVG(purchase_amount) average_spend_per_transaction
FROM shopping_trends


--Looking at customers who spent above average and splitting them by category to examine possible reasons across the table

SELECT customer_id, age, gender, category, purchase_amount, location, season, review_rating, payment_method, shipping_type preferred_payment_method, frequency_of_purchases
FROM shopping_trends
WHERE Purchase_amount > (SELECT AVG(purchase_amount)
FROM shopping_trends)
ORDER BY Category


--Looking at the average rating of male and female transactions in each product category

SELECT gender, category, AVG(review_rating) average_rating
FROM shopping_trends
GROUP BY gender, category
ORDER BY average_rating desc


--Looking at average review_rating based on the preferred_shipping method

SELECT Shipping_type, AVG(review_rating) average_rating
FROM shopping_trends
GROUP BY Shipping_type
ORDER BY average_rating desc


--Looking at age vs. frequency of purchasing behavior

SELECT age, frequency_of_purchases, COUNT(*) total_customers
FROM shopping_trends
GROUP BY age, frequency_of_purchases
ORDER BY total_customers desc



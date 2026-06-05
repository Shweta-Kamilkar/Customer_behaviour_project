select * from customer limit 100;

--1. Which gender generates more revenue?
SELECT
    gender,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;

--2. Do customers using discounts spend more than average?
SELECT
    discount_applied,
    AVG(purchase_amount) AS avg_spending
FROM customer
GROUP BY discount_applied;

--3. Which products have the highest customer ratings?
SELECT
    item_purchased,
    round(AVG(review_rating::numeric),2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC;

--4. Do subscribers generate more revenue?
SELECT
    subscription_status,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_order_value
FROM customer
GROUP BY subscription_status;

--5. Which shipping method generates higher spending?
SELECT
    shipping_type,
    AVG(purchase_amount) AS avg_spending
FROM customer
GROUP BY shipping_type
ORDER BY avg_spending DESC;

--6. Which products are most frequently purchased with discounts?
SELECT
    item_purchased,
    COUNT(*) AS discount_purchases
FROM customer
WHERE discount_applied = 'Yes'
GROUP BY item_purchased
ORDER BY discount_purchases DESC;

-- 7. Are repeat buyers more likely to subscribe?
SELECT
    subscription_status,
    AVG(previous_purchases) AS avg_previous_purchases
FROM customer
GROUP BY subscription_status;

--8. Which payment method generates the highest revenue?
SELECT
    payment_method,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;

--9. Which season generates the highest sales?
SELECT
    season,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;

--10. Which are the top 5 states that has generate high revenue?
SELECT
    location,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY location
ORDER BY total_revenue DESC
limit 5;

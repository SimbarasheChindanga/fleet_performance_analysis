-- =============================================
-- FLEET PERFORMANCE ANALYSIS - SQL QUERIES
-- =============================================

-- SECTION 1: FLEET OVERVIEW
-- Q1: Total Trucks
SELECT COUNT(*) as total_trucks FROM trucks;

-- Q2: Total Trips
SELECT COUNT(*) as total_trips FROM trips;

-- Q3: Total Distance
SELECT ROUND(SUM(distance_km), 0) as total_distance_km FROM trips;

-- Q4: Total Revenue
SELECT ROUND(SUM(revenue), 2) as total_revenue FROM trips;

-- Q5: Total Profit
SELECT ROUND(SUM(profit), 2) as total_profit FROM trips;

-- SECTION 2: TRUCK PERFORMANCE
-- Q6: Top 5 Trucks by Revenue
SELECT t.truck_id, t.model, ROUND(SUM(trips.revenue), 2) as total_revenue
FROM trucks t LEFT JOIN trips ON t.truck_id = trips.truck_id
GROUP BY t.truck_id, t.model ORDER BY total_revenue DESC LIMIT 5;

-- Q7: Top 5 Trucks by Trip Count
SELECT t.truck_id, t.model, COUNT(trips.trip_id) as trip_count
FROM trucks t LEFT JOIN trips ON t.truck_id = trips.truck_id
GROUP BY t.truck_id, t.model ORDER BY trip_count DESC LIMIT 5;

-- Q8: Top 5 Trucks by Fuel Efficiency
SELECT t.truck_id,
    t.model,
    ROUND(
        SUM(trips.distance_km) /
        NULLIF(SUM(trips.fuel_consumed_litres), 0),
        2
    ) AS fuel_efficiency
FROM trucks t
LEFT JOIN trips
    ON t.truck_id = trips.truck_id
GROUP BY t.truck_id, t.model
HAVING SUM(trips.fuel_consumed_litres) > 0
ORDER BY fuel_efficiency DESC
LIMIT 5;

-- Q9: Top 5 Trucks by Maintenance Cost
SELECT t.truck_id, t.model, ROUND(SUM(m.cost), 2) as total_maintenance_cost
FROM trucks t LEFT JOIN maintenance m ON t.truck_id = m.truck_id
GROUP BY t.truck_id, t.model ORDER BY total_maintenance_cost DESC LIMIT 5;

-- Q10: Top 5 Trucks by Profit
SELECT t.truck_id, t.model, ROUND(SUM(trips.profit), 2) as total_profit
FROM trucks t LEFT JOIN trips ON t.truck_id = trips.truck_id
GROUP BY t.truck_id, t.model ORDER BY total_profit DESC LIMIT 5;

-- SECTION 3: DRIVER PERFORMANCE
-- Q11: Top 5 Drivers by Deliveries
SELECT d.driver_id, d.full_name, COUNT(trips.trip_id) as delivery_count
FROM drivers d LEFT JOIN trips ON d.driver_id = trips.driver_id
GROUP BY d.driver_id, d.full_name ORDER BY delivery_count DESC LIMIT 5;

-- Q12: Top 5 Drivers by Revenue
SELECT d.driver_id, d.full_name, ROUND(SUM(trips.revenue), 2) as total_revenue
FROM drivers d LEFT JOIN trips ON d.driver_id = trips.driver_id
GROUP BY d.driver_id, d.full_name ORDER BY total_revenue DESC LIMIT 5;

-- Q13: Top 5 Drivers by Fuel Efficiency
SELECT
    d.driver_id,
    d.full_name,
    ROUND(
        SUM(trips.distance_km) /
        NULLIF(SUM(trips.fuel_consumed_litres), 0),
        2
    ) AS fuel_efficiency
FROM drivers d
LEFT JOIN trips
    ON d.driver_id = trips.driver_id
GROUP BY d.driver_id, d.full_name
HAVING SUM(trips.fuel_consumed_litres) > 0
ORDER BY fuel_efficiency DESC
LIMIT 5;

-- Q14: Top 5 Drivers by Fewest Delays
SELECT d.driver_id, d.full_name, 
       COUNT(CASE WHEN trips.has_delay = 1 THEN 1 END) as total_delays,
       ROUND(CAST(COUNT(CASE WHEN trips.has_delay = 1 THEN 1 END) AS FLOAT) / 
             NULLIF(COUNT(trips.trip_id), 0) * 100, 2) as delay_rate_pct
FROM drivers d LEFT JOIN trips ON d.driver_id = trips.driver_id
GROUP BY d.driver_id, d.full_name HAVING COUNT(trips.trip_id) > 0
ORDER BY delay_rate_pct ASC LIMIT 5;

-- Q15: Top 5 Drivers by Profit
SELECT d.driver_id, d.full_name, ROUND(SUM(trips.profit), 2) as total_profit
FROM drivers d LEFT JOIN trips ON d.driver_id = trips.driver_id
GROUP BY d.driver_id, d.full_name ORDER BY total_profit DESC LIMIT 5;

-- SECTION 4: ROUTE ANALYSIS (CTEs)
-- Q16: Top 5 Routes by Revenue
SELECT route, ROUND(SUM(revenue), 2) as total_revenue
FROM trips GROUP BY route ORDER BY total_revenue DESC LIMIT 5;

-- Q17: Top 5 Routes by Profit (CTE)
WITH route_metrics AS (
    SELECT route, ROUND(SUM(revenue), 2) as total_revenue, ROUND(SUM(profit), 2) as total_profit
    FROM trips GROUP BY route
)
SELECT route, total_profit, ROUND((total_profit / NULLIF(total_revenue, 0)) * 100, 2) AS profit_margin_pct
FROM route_metrics WHERE total_revenue > 0 ORDER BY total_profit DESC LIMIT 5;

-- Q18: Loss-Making Routes (CTE)
WITH route_metrics AS (
    SELECT route, ROUND(SUM(revenue), 2) as total_revenue, ROUND(SUM(profit), 2) as total_profit
    FROM trips GROUP BY route
)
SELECT route, total_revenue, total_profit
FROM route_metrics WHERE total_profit < 0 ORDER BY total_profit ASC;

-- SECTION 5: TIME-BASED ANALYSIS (Window Functions)
-- Q19: Monthly Revenue Trend (LAG)
WITH monthly_revenue AS (
    SELECT strftime('%Y-%m', trip_date) as month, ROUND(SUM(revenue), 2) as monthly_revenue
    FROM trips GROUP BY strftime('%Y-%m', trip_date) ORDER BY month
)
SELECT month, monthly_revenue,
       LAG(monthly_revenue, 1) OVER (ORDER BY month) as previous_month,
       ROUND(((monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY month)) / 
              NULLIF(LAG(monthly_revenue, 1) OVER (ORDER BY month), 0)) * 100, 2) as growth_pct
FROM monthly_revenue;

-- Q20: Top Months by Revenue
SELECT strftime('%Y-%m', trip_date) as month, ROUND(SUM(revenue), 2) as total_revenue
FROM trips GROUP BY strftime('%Y-%m', trip_date) ORDER BY total_revenue DESC LIMIT 6;

-- Q21: Monthly Profit with Rolling Average
WITH monthly_profit AS (
    SELECT strftime('%Y-%m', trip_date) as month, ROUND(SUM(profit), 2) as monthly_profit
    FROM trips GROUP BY strftime('%Y-%m', trip_date) ORDER BY month
)
SELECT month, monthly_profit,
       ROUND(AVG(monthly_profit) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as rolling_3month_avg
FROM monthly_profit;

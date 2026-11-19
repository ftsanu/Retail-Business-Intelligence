-- =====================================================
-- 1. ANNUAL SALES AND PROFIT PERFORMANCE
-- Objective: Compare yearly revenue, profit and orders.
-- =====================================================

SELECT
    Year,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY Year
ORDER BY Year;

-- =====================================================
-- 2. REGIONAL PERFORMANCE ANALYSIS
-- Objective: Compare sales and profitability across regions.
-- =====================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY Region
ORDER BY Total_Revenue DESC;


-- =====================================================
-- 3. CATEGORY-WISE SALES AND PROFITABILITY
-- Objective: Evaluate revenue and profit across categories.
-- =====================================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY Category
ORDER BY Total_Revenue DESC;


-- =====================================================
-- 4. SUB-CATEGORY PROFITABILITY ANALYSIS
-- Objective: Identify the most and least profitable
-- product sub-categories.
-- =====================================================

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Units_Sold,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;


-- =====================================================
-- 5. DISCOUNT IMPACT ANALYSIS
-- Objective: Examine the relationship between discount
-- levels and profitability across sub-categories.
-- =====================================================

SELECT
    `Sub-Category`,
    Discount,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

WHERE `Sub-Category` IN ('Tables', 'Bookcases', 'Supplies')

GROUP BY
    `Sub-Category`,
    Discount

ORDER BY
    `Sub-Category`,
    Discount;



-- =====================================================
-- 6. CUSTOMER SEGMENT PERFORMANCE
-- Objective: Compare revenue and profitability across
-- Consumer, Corporate and Home Office segments.
-- =====================================================

SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY Segment
ORDER BY Total_Revenue DESC;


-- =====================================================
-- 7. MONTHLY SALES TREND ANALYSIS
-- Objective: Analyze monthly revenue and profit trends
-- across the four-year reporting period.
-- =====================================================

SELECT
    Year,
    `Month`,
    `Month Number`,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders

FROM retail_orders

GROUP BY
    Year,
    `Month`,
    `Month Number`

ORDER BY
    Year,
    `Month Number`;


-- =====================================================
-- 8. SHIPPING MODE PERFORMANCE ANALYSIS
-- Objective: Compare order volume, revenue, profit and
-- average shipping time across shipping modes.
-- =====================================================

SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(`Shipping Days`), 2) AS Average_Shipping_Days,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
        2
    ) AS Profit_Margin_Percentage

FROM retail_orders

GROUP BY `Ship Mode`
ORDER BY Total_Revenue DESC;



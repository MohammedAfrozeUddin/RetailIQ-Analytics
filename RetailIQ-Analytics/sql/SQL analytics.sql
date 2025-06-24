SELECT * FROM [dbo].[cleaned_superstore];

--Total Sales and Profit by Region
SELECT Region, SUM (CS.Sales) as Total_Sales, SUM (CS.Profit) as Total_Profit
FROM [dbo].[cleaned_superstore] AS CS
GROUP BY Region
ORDER BY Total_Sales DESC;

--Top 5 Most Profitable Products
SELECT TOP 5 Product_Name, SUM (Profit) as Total_Profit
FROM [dbo].[cleaned_superstore]
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

--Top 5 Customers by Sales
SELECT TOP 5 Customer_Name, SUM (Sales) AS Total_Sales
FROM [dbo].[cleaned_superstore]
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

--Average Discount by Category
SELECT Category, AVG (Discount) as AVG_discount
FROM [dbo].[cleaned_superstore]
GROUP BY Category;

--Total Sales and Profit by Category and Sub-Category
SELECT Category, Sub_Category, SUM (Sales) as Total_Sales, SUM (Profit) as Total_Profit
FROM [dbo].[cleaned_superstore]
GROUP BY Category, Sub_Category
ORDER BY Total_Profit DESC;

--Monthly Sales Trend (for Time Series in Power BI)
SELECT FORMAT (Order_Date, 'yyyy-MM') as Month, SUM (Sales) as Total_Sales
FROM [dbo].[cleaned_superstore]
GROUP BY FORMAT (Order_Date, 'yyyy-MM')
ORDER BY Month;

--Profitability by Segment
SELECT Segment, SUM (Sales) as Total_Sales, SUM (Profit) as Total_Profit
FROM [dbo].[cleaned_superstore]
GROUP BY Segment
ORDER BY Total_Profit DESC;

--Discount Impact Analysis (Optional)
SELECT ROUND (Discount, 1) as Discount, AVG (Profit) as Avg_Profit
FROM [dbo].[cleaned_superstore]
GROUP BY ROUND (Discount, 1)
ORDER BY Avg_Profit;

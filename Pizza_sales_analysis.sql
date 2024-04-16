Select * From pizza_sales_new

-- Total Sales

Select Round(SUM(total_price),4) as TotalSales From pizza_sales_new;
---817860.0508

-- Total Quantity Sold

Select SUM(quantity) as TotalPizzasSold From pizza_sales_new;
---49574

-- Total Pizzas Order
Select Count(Distinct order_id) as TotalOrder From pizza_sales_new;
---21350

--Average order value
Select Round(Sum(total_price)/Count(Distinct order_id),2) as AvgOrderValue From pizza_sales_new
---38.31

-- Average pizzas order
Select Cast(Cast(Sum(quantity) as Decimal(10,2))/Cast(Count(Distinct order_id) as Decimal(10,2)) as Decimal(10,2)) as AvgPizzasOrder From pizza_sales_new
---2.32

--Hourly trend for total pizzas sold
Select DATEPART(Hour, order_time) as orderhours, SUM(quantity) as TotalPizzasSold from pizza_sales_new 
Group by DATEPART(Hour, order_time) order by DATEPART(Hour, order_time)

--9	    4
--10	18
--11	2728
--12	6776
--13	6413
--14	3613
--15	3216
--16	4239
--17	5211
--18	5417
--19	4406
--20	3534
--21	2545
--22	1386
--23	68

--Weekly Trend for orders

Select DATEPART(Iso_week, order_date)as Week, Count(Distinct order_id) as TotalOrders from pizza_sales_new 
Group by DATEPART(Iso_week, order_date) order by DATEPART(Iso_week, order_date)

-- % Of sales by pizza category

Select pizza_category, SUM(total_price) as totalsales,
Round(SUM(total_price)*100/(Select SUM(total_price) from pizza_sales_new),2) as PCT From pizza_sales_new
Group By pizza_category Order By pizza_category

-- % Of sales by pizza size

Select pizza_size, SUM(total_price) as totalsales,
Round(SUM(total_price)*100/(Select SUM(total_price) from pizza_sales_new),2) as PCT From pizza_sales_new
Group By pizza_size Order By pizza_size

-- Total pizzas sold by pizza category

Select pizza_category, sum(quantity) as TotalPizzasSold From pizza_sales_new
Group By pizza_category Order By pizza_category

-- Top 5 Pizzas by revenue

Select top 5 pizza_name, sum(total_price) as TotalRevenue From pizza_sales_new
Group By pizza_name Order By TotalRevenue Desc

-- Bottom 5 Pizzas by revenue

Select top 5 pizza_name, sum(total_price) as TotalRevenue From pizza_sales_new
Group By pizza_name Order By TotalRevenue ASC

-- Top 5 Pizzas by quantity

Select top 5 pizza_name, sum(quantity) as TotalPizzaSold From pizza_sales_new
Group By pizza_name Order By TotalPizzaSold Desc

-- Bottom 5 Pizzas by quantity

Select top 5 pizza_name, sum(quantity) as TotalPizzaSold From pizza_sales_new
Group By pizza_name Order By TotalPizzaSold ASC

-- Top 5 Pizzas by Order

Select top 5 pizza_name, COUNT(Distinct order_id) as TotalPizzaOrder From pizza_sales_new
Group By pizza_name Order By TotalPizzaOrder Desc

-- Bottom 5 Pizzas by Order

Select top 5 pizza_name, COUNT(Distinct order_id) as TotalPizzaOrder From pizza_sales_new
Group By pizza_name Order By TotalPizzaOrder Asc

-- Top 5 Pizzas by Maximum Price

Select Top 5 pizza_name, MAX(unit_price) as MaxPrice From pizza_sales_new
Group By pizza_name Order by MaxPrice Desc

-- Bottom 5 Pizzas by Maximum Price

Select Top 5 pizza_name, MAX(unit_price) as MaxPrice From pizza_sales_new
Group By pizza_name Order by MaxPrice Asc


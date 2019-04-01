-- 1. Find customers (customer_id) who have not placed any orders

SELECT c.customerid as [customers] FROM CUSTOMER_T c
EXCEPT SELECT o.customerid FROM ORDER_T o;

-- 2. List the names and numbers of employees supervised (label this value HeadCount) for
--    all the supervisors who supervise more than two employees:

----- DOUBLE CHECK THIS ONE
--    ^^^^^^^^^^^^^^^^^^^^^

SELECT employeename, count(employeesupervisor) as [HeadCount] FROM EMPLOYEE_T
GROUP BY employeename
HAVING COUNT(employeesupervisor) >= 2;

-- 3. Names of states where customers reside, but have no employees residing in that state:

SELECT customerstate FROM CUSTOMER_T MINUS SELECT employeestate FROM EMPLOYEE_T;

-- 4. Display the customer ID, name, and order ID for all customer orders, 
--    For those customers who do not have any orders, include them in the display once,
--    with a 0 value for OrderID. 

SELECT c.CustomerID, CustomerName, isnull (o.OrderID,0) as 'OrderID' FROM CUSTOMER_T c 
LEFT JOIN ORDER_T o on c.customerid = o.customerid;

-- 5. Show the customer ID and name for all the customers who have ordered both products 
-- 	  with IDs 5 and 4 on the same order:

--------------- DOES NOT REMOVE DUPLICATES. unsure if we need to
---             ^^^^^^^^^^^^^^^^^^^^^^^^^^

SELECT c.CustomerID, 
	   o.orderid, 
	   ol.ProductID 
	   FROM CUSTOMER_T c, 
	   		ORDER_T o, 
	   		OrderLine_T ol
WHERE ol.productid in (5,4) 
GROUP BY c.CustomerID, o.OrderID, ol.ProductID;

-- 6. List the IDs and names of all products that cost less than the average product price 
--    in their product line.

SELECT productid, productstandardprice, productlineid FROM PRODUCT_T
WHERE productstandardprice < (SELECT AVG(productstandardprice) FROM PRODUCT_T);

-- 7. List the IDs and names of those sales territories that have at least 50 percent more 
--    customers as the average number of customers per territory.

SELECT t.territoryid, territoryname FROM DOESBUSINESSIN_T dbi
LEFT JOIN TERRITORY_T t ON dbi.territoryid = t.territoryid
GROUP BY t.territoryid, territoryname
HAVING count(customerid) >= (
	SELECT 1.5 * count(customerid) / count(distinct territoryid) FROM DOESBUSINESSIN_T
);

-- 8. List the order number and order quantity for all customer orders for which the order 
--    quantity is greater than the average order quantity of that product: 
--    (Hint: This involves a correlated subquery.)

-- The following is maybe right:

-- SELECT orderid, orderedquantity FROM ORDERLINE_T t
-- WHERE orderedquantity >= (
-- 	SELECT AVG(orderedquantity), productid FROM OrderLine_T
-- 	WHERE productid = t.productid
-- 	GROUP BY productid
-- )


-- 9. For each product display in ascending order by product ID the product ID and description 
--    along with the customer ID and name for the customer who has bought the most of that 
--    product; also show the total quantity ordered by that customer (who has bought the 
--    most of that product). Use a correlated subquery:
select ol.ProductID, p.ProductDescription, c.CustomerID, c.CustomerName, sum(ol.OrderedQuantity) as [TotOrdered]
from OrderLine_T ol, Customer_T c, Order_T o, Product_T p
where ol.ProductID = p.ProductID and ol.OrderID = o.OrderID and o.CustomerID = c.CustomerID 
group by p.ProductDescription, ol.ProductID, c.CustomerID, c.CustomerName, ol.OrderID
having sum(ol.orderedquantity) in (
	select sum(ol2.OrderedQuantity)
	from OrderLine_T ol2
	where ol.OrderId = ol2.OrderId
	group by ol2.ProductID) 
order by ol.ProductID asc
;

-- 10. Write a query to get the product(s) whose total order is the lowest in the organization.  
--     Base the total order on revenue generated (standard price * order quantity).  Outout  
--     the product id and the revenue for this product.

-- 11. Find the bottom 3 customers who generated the lowest amount of revenue.  For these 
--     customers, output the customer name and customer state.  There is a tie for 3rd place,  
--     so your query needs to be dynamic enough to return all 4 customers who match the  
--     criteria, without hardcoding anything like “4” in your query.

SELECT c.customername, c.customerstate
FROM PRODUCT_T p, ORDERLINE_T ol, CUSTOMER_T c, ORDER_T o
WHERE c.customerid = o.customerid and o.orderid = ol.orderid and ol.productid = p.productid
GROUP BY c.customername, c.customerstate
HAVING SUM(p.ProductStandardPrice * ol.OrderedQuantity) in (
    SELECT TOP 3 SUM(p.ProductStandardPrice * ol.OrderedQuantity)
    FROM PRODUCT_T p, ORDERLINE_T ol, CUSTOMER_T c, ORDER_T o
    WHERE c.customerid = o.customerid and o.orderid = ol.orderid and ol.productid = p.productid
    GROUP BY c.customerid
    ORDER BY SUM(p.ProductStandardPrice * ol.OrderedQuantity)
);

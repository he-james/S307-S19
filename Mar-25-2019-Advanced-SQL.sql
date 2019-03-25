-- March 25, 2019 - Working with subqueries and data filtering

-- 1. Output all part names that are greater 
--    than or equal to the average price
SELECT pname FROM part
WHERE price >= (
	
	-- Criteria for main query (subquery)
	SELECT AVG(price) FROM PART

)
ORDER BY pname DESC;

-- 2. Output the top 2 most expensive orders (output the order number)

SELECT TOP 2 SUM(p.price * od.qty) [revenue]
FROM PART p, ODETAILS od
WHERE p.pno = od.pno
GROUP BY od.ono
ORDER BY revenue DESC;

--    THE ABOVE, HOWEVER, IS NOT CORRECT, 
--    since it does NOT output 3 values if there is a tie for second place.
--    The following will demonstrate how to do this.

-- 3. Show the names for the top 3 customers who 
--    placed the highest number of orders

SELECT c.cname  
FROM CUSTOMER c, ORDER1 o1
WHERE c.cno = o1.cno
GROUP BY c.cname
HAVING COUNT(o1.ono) IN (

	-- Subquery to count order numbers and group by customer

	SELECT TOP 3 COUNT(ono) [cono] 
		--^^^-- Consider what you did here. Do the same thing 
	--^^^-- in the main query to tie them together
	FROM ORDER1
	GROUP BY cno
	ORDER BY cono DESC

);
/* Notice this wild shit up here. Somehow query 2, which is effectively the
   subquery in query 3, does NOT show values that 'tie' but query 3 does. 
   Don't fuck it up */

-- 4. Output the top customer who spent the most money with us
SELECT c.cname
FROM CUSTOMER c, ORDER1 o1, ODETAILS od, PART p
WHERE c.cno = o1.cno AND p.pno = od.pno AND od.ono = o1.ono
GROUP BY c.cname
HAVING SUM(p.price * od.qty) >= ALL( --<<----- PULLS TOP 1 VALUE EVEN IN A TIE
	(
	-- subquery to calculate revenue by customer
	SELECT SUM(p.price * od.qty) [revenue]
	FROM PART p, ODETAILS od, ORDER1 o1
	WHERE p.pno = od.pno AND od.ono = o1.ono
	GROUP BY o1.cno
	)
);

-- 5. Show the employee name and salary for all employees who have 
--    a greater salary than the average of all employees

SELECT ename, salary 
FROM EMPLOYEE
WHERE salary >= (
	SELECT AVG(salary)
	FROM EMPLOYEE
	)
ORDER BY salary DESC;

-- 6. Show employee details (employee number, name, dept) of employees
--    with a salary greater than the average salary of people in their dept.
--    Use a CORRELATED SUBQUERY!

SELECT e2.eno, e2.ename, e2.dept, e2.salary 
FROM EMPLOYEE e2
WHERE e2.salary > (

	SELECT AVG(e.salary)
	FROM EMPLOYEE e
	WHERE e2.dept = e.dept --<<--CHECK THIS OUT!

	);
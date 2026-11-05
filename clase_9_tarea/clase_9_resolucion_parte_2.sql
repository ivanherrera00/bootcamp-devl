-- 1. Mostrar todas las ventas de la categoría 'Electronics'.
SELECT *
FROM sales
WHERE category = 'Electronics';

-- 2. Calcular el total de ingresos por categoría (price * quantity).
SELECT
	category,
	SUM(price * quantity) AS TotalIngresos
FROM sales
GROUP BY category;

-- 3. Obtener la categoría con mayor ingreso total.
SELECT
	category,
	SUM(price * quantity) AS TotalIngresos
FROM sales
GROUP BY category
ORDER BY SUM(price * quantity) DESC
LIMIT 1;
 
-- 4. Mostrar todas las ventas donde el precio del producto sea mayor a 20.
SELECT *
FROM sales 
WHERE price > 20;

-- 5. Calcular el total de unidades vendidas (SUM(quantity)) por cada producto.
SELECT
	product,
	SUM(quantity) AS CantidadVendida
FROM sales 
GROUP BY product;

-- 6. Calcular el ingreso promedio por venta (AVG(price * quantity)) para cada producto.
SELECT
	product,
	AVG(price * quantity) AS PromedioPorVenta
FROM sales 
GROUP BY product;

-- 7. Mostrar los 3 productos con mayor cantidad total vendida (SUM(quantity)) usando ORDER BY y LIMIT.
SELECT
	product,
	SUM(quantity) AS CantidadVendida
FROM sales 
GROUP BY product
ORDER BY SUM(quantity) DESC
LIMIT 3;

-- 8. Mostrar todas las ventas realizadas después del 12 de julio de 2023.
SELECT * 
FROM sales 
WHERE sale_date > '2023-07-12'

-- 9. Mostrar la categoría y el ingreso total, pero solo para categorías cuyo ingreso sea mayor a 50 (HAVING SUM(price * quantity) > 50).
SELECT
	category,
	SUM(price * quantity) AS IngresoTotal
FROM sales 
GROUP BY category
HAVING SUM(price * quantity) > 50;

-- 10. Mostrar todas las ventas donde el nombre del producto comience con la letra H (LIKE 'H%').
SELECT *
FROM sales
WHERE product LIKE 'H%'; 

-- 11. Calcular la cantidad promedio de productos vendidos (AVG(quantity)) agrupados por categoría.
SELECT 
	category,
	AVG(quantity) AS PromedioProductosVendidos
FROM sales
GROUP BY category; 

-- 12. Mostrar todas las ventas y calcular el ingreso por fila (price * quantity), ordenadas de mayor a menor ingreso.
SELECT
	id,
  category,
  product,
 	price * quantity AS IngresoVenta
FROM sales
ORDER BY price * quantity DESC;

-- 13. Mostrar todas las ventas de la categoría 'Electronics' donde la cantidad sea mayor a 2 y el precio menor a 40.
SELECT *
FROM sales
WHERE 
	category = 'Electronics' 
	AND quantity > 2
	AND price < 40;
CREATE DATABASE test_db;

CREATE TABLE apartments(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	address VARCHAR(100),
	city VARCHAR(50),
	postal_code VARCHAR(10),
	bedrooms INT,
	area_m2 NUMERIC(6,2),
	price NUMERIC(10,2),
	available BOOLEAN,
	published_date DATE
);

INSERT INTO apartments (name, address, city, postal_code, bedrooms, area_m2, price, available, published_date) VALUES
('Depto B', 'Av. Córdoba 1450', 'Buenos Aires', 'C1055', 1, 42.0, 95000, TRUE, '2024-02-15'),
('Depto C', 'San Martín 320', 'Córdoba', 'X5000', 2, 65.5, 135000, TRUE, '2023-11-20'),
('Depto D', 'Belgrano 890', 'Rosario', 'S2000', 3, 85.0, 180000, FALSE, '2022-06-10'),
('Depto E', 'Av. Alem 560', 'Mendoza', 'M5500', 2, 58.0, 110000, TRUE, '2025-01-05'),
('Depto F', 'Mitre 1200', 'Salta', 'A4400', 1, 38.5, 78000, TRUE, '2024-07-18'),
('Depto G', 'Av. Rivadavia 2100', 'Mar del Plata', 'B7600', 3, 92.0, 195000, FALSE, '2023-04-22'),
('Depto H', '9 de Julio 450', 'Resistencia', 'H3500', 2, 70.0, 125000, TRUE, '2025-03-12'),
('Depto I', 'Av. Pellegrini 780', 'Rosario', 'S2000', 2, 55.0, 118000, TRUE, '2022-09-30'),
('Depto J', 'Las Heras 150', 'San Juan', 'J5400', 1, 40.0, 82000, FALSE, '2024-10-11'),
('Depto K', 'Av. Colón 1750', 'Córdoba', 'X5000', 3, 95.0, 210000, TRUE, '2025-06-25'),
('Depto L', 'Urquiza 620', 'Paraná', 'E3100', 2, 62.5, 115000, TRUE, '2023-01-14'),
('Depto M', 'Av. San Martín 2300', 'San Miguel de Tucumán', 'T4000', 2, 68.0, 128000, FALSE, '2022-12-05'),
('Depto N', 'Sarmiento 340', 'Neuquén', 'Q8300', 1, 45.0, 105000, TRUE, '2025-09-17'),
('Depto O', 'Av. Libertador 980', 'San Luis', 'D5700', 3, 88.0, 175000, TRUE, '2024-05-08'),
('Depto P', 'Brown 760', 'Bahía Blanca', 'B8000', 2, 60.0, 122000, FALSE, '2023-08-19'),
('Depto Q', 'Av. Belgrano 1100', 'Santiago del Estero', 'G4200', 1, 35.0, 69000, TRUE, '2026-01-22'),
('Depto R', 'Moreno 540', 'Corrientes', 'W3400', 2, 72.0, 132000, TRUE, '2024-03-29'),
('Depto S', 'Av. España 1650', 'Mendoza', 'M5500', 3, 105.0, 225000, FALSE, '2022-04-16'),
('Depto T', 'Lavalle 280', 'La Plata', 'B1900', 1, 39.0, 85000, TRUE, '2025-11-03'),
('Depto U', 'Av. Costanera 450', 'Posadas', 'N3300', 2, 64.0, 119000, TRUE, '2023-06-07'),
('Depto V', 'Roca 920', 'Comodoro Rivadavia', 'U9000', 3, 90.0, 190000, FALSE, '2024-12-14'),
('Depto W', 'Av. Illia 1350', 'Santa Fe', 'S3000', 2, 57.5, 112000, TRUE, '2022-02-28'),
('Depto X', 'Perón 670', 'Formosa', 'P3600', 1, 43.0, 76000, TRUE, '2025-04-09'),
('Depto Y', 'Av. Kirchner 1800', 'Río Gallegos', 'Z9400', 2, 75.0, 145000, FALSE, '2023-10-25'),
('Depto Z', 'San Lorenzo 390', 'Jujuy', 'Y4600', 2, 59.0, 98000, TRUE, '2024-08-02'),
('Depto AA', 'Av. Maipú 2200', 'Vicente López', 'B1638', 3, 110.0, 250000, TRUE, '2026-03-15'),
('Depto AB', 'Belgrano 780', 'Catamarca', 'K4700', 1, 41.0, 73000, FALSE, '2022-11-12'),
('Depto AC', 'Av. Perito Moreno 650', 'Ushuaia', 'V9410', 2, 67.0, 155000, TRUE, '2025-07-21'),
('Depto AD', 'Independencia 1050', 'San Rafael', 'M5600', 3, 98.0, 185000, TRUE, '2023-03-04');

-- Ejercicios
-- 1. Mostrar los departamentos disponibles, ordenados del más barato al más caro.
SELECT *
FROM apartments
ORDER BY price ASC;

-- 2. Mostrar el precio promedio por ciudad.
SELECT 
	city,
	AVG(price) AS PromedioPrecio
FROM apartments
GROUP BY city;

-- 3. Mostrar los departamentos con 2 o más habitaciones y menos de 60 m².
SELECT *
FROM apartments
WHERE bedrooms >= 2 AND area_m2 < 60.00;
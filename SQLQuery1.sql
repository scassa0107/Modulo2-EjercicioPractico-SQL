

 CREATE database Modulo2_EjercicioPractico

USE Modulo2_EjercicioPractico;

CREATE table Inventario (
-- INT: Elegido porque los IDs son números enteros secuenciales y permiten indexación rápida
id_producto          INT PRIMARY KEY,  
-- Texto variable optimizado
nombre_producto      VARCHAR(100)  NOT NULL,
-- Categoria de texto corto
categoria            VARCHAR(50) NOT NULL,
-- Tipo numérico exacto para valores monetarios sin errores de redondeo
precio_unitario      DECIMAL(10,2),
-- Cantidad entera de unidades
stock_actual         INT,
-- Umbral entero de re-stock
stock_minimo         INT,
-- Fecha sin hora (YYYY-MM-DD) para ahorrar almacenamiento
fecha_ingreso        DATE,
-- Flag booleano (0 o 1) eficiente de solo 1 byte
activo               TINYINT
);

INSERT into Inventario (
id_producto,
nombre_producto,
categoria,
precio_unitario,
stock_actual,
stock_minimo,
fecha_ingreso,
activo
)
VALUES
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);


SELECT * FROM Inventario

-- Eliminar la tabla si ya existe para re-ejecutar el script sin errores
DROP TABLE IF EXISTS inventario;

INSERT INTO inventario (
    id_producto, 
    nombre_producto, 
    categoria, 
    precio, 
    stock_actual, 
    stock_minimo, 
    fecha_ingreso, 
    activo
) 
VALUES 
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10, 2) NOT NULL, -- <--- Nombre exacto
    stock_actual INT DEFAULT 0,
    stock_minimo INT DEFAULT 0,
    fecha_ingreso DATE NOT NULL,
    activo TINYINT DEFAULT 1
);

SELECT * FROM inventario

INSERT INTO inventario (
    id_producto, 
    nombre_producto, 
    categoria, 
    precio, 
    stock_actual, 
    stock_minimo, 
    fecha_ingreso, 
    activo
) 
VALUES 
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

UPDATE inventario 
SET stock_actual = stock_actual - 3 
WHERE id_producto = 1; 

UPDATE inventario 
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

UPDATE inventario 
SET stock_actual = stock_actual - 5 
WHERE id_producto = 6;

SELECT id_producto, nombre_producto, stock_actual
FROM inventario
WHERE id_producto IN (1,2,6);

UPDATE inventario 
SET stock_actual = stock_actual - 5 
WHERE id_producto = 6;

UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- Ver la tabla completa para confirmar que los datos se cargaron
SELECT * FROM inventario;




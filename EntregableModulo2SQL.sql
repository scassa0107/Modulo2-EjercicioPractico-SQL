-- =========================================================
-- MÓDULO 2: EJERCICIO PRÁCTICO DE INGENIERÍA DE DATOS
-- =========================================================

-- 1. CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS Modulo2_EjercicioPractico;
USE Modulo2_EjercicioPractico;

-- 2. LIMPIEZA INICIAL: Eliminar la tabla si ya existe para re-ejecución limpia
DROP TABLE IF EXISTS inventario;

-- 3. PASO 2 (DDL): Creación de la tabla con tipos de datos e integridad
CREATE TABLE inventario (
    -- INT: PK numérica e indexable para identificación única de productos
    id_producto INT PRIMARY KEY,
    
    -- VARCHAR(100): Texto variable para nombres optimizando almacenamiento
    nombre_producto VARCHAR(100) NOT NULL,
    
    -- VARCHAR(50): Categoría descriptiva de texto corto
    categoria VARCHAR(50) NOT NULL,
    
    -- DECIMAL(10,2): Precisión exacta para valores monetarios sin errores de redondeo
    precio DECIMAL(10, 2) NOT NULL,
    
    -- INT: Cantidad entera de unidades disponibles
    stock_actual INT DEFAULT 0,
    
    -- INT: Umbral de re-stock
    stock_minimo INT DEFAULT 0,
    
    -- DATE: Fecha de ingreso (YYYY-MM-DD) sin consumo innecesario de horas/minutos
    fecha_ingreso DATE NOT NULL,
    
    -- TINYINT: Flag booleano (1=activo, 0=inactivo) eficiente de solo 1 byte
    activo TINYINT DEFAULT 1
);

-- 4. PASO 3 (DML): Inserción de los 10 productos iniciales
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

-- 5. ACTUALIZACIONES DE STOCK (Ventas del día)
UPDATE inventario SET stock_actual = stock_actual - 3 WHERE id_producto = 1;
UPDATE inventario SET stock_actual = stock_actual - 12 WHERE id_producto = 2;
UPDATE inventario SET stock_actual = stock_actual - 5 WHERE id_producto = 6;

-- 6. ACTUALIZACIÓN ADICIONAL: Producto descontinuado
UPDATE inventario SET activo = 0 WHERE id_producto = 8;

-- 7. CONSULTAS DE VERIFICACIÓN
SELECT id_producto, nombre_producto, stock_actual 
FROM inventario 
WHERE id_producto IN (1, 2, 6);

SELECT * FROM inventario;
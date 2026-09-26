-- =============================================
-- RETAILPRO - PRE-ENTREGA MÓDULO 5
-- Consultas SQL con JOIN y UNION ALL
-- Base de datos: Ventas_Tech_DB
-- =============================================

USE Ventas_Tech_DB;

-- =============================================
-- CONSULTA 1: VISTA BASE DEL PROYECTO
-- INNER JOIN entre ventas, clientes,
-- productos y categorias
-- =============================================

SELECT
    v.id_venta,
    v.fecha_venta,
    v.id_cliente,
    c.nombre AS cliente,
    v.id_producto,
    p.nombre_producto AS producto,
    p.id_categoria,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM dbo.ventas AS v
INNER JOIN dbo.clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN dbo.productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN dbo.categorias AS cat
    ON p.id_categoria = cat.id_categoria;


-- =============================================
-- CONSULTA 2: CLIENTES SIN VENTAS
-- Identifica clientes registrados que aún
-- no han realizado ninguna compra
-- =============================================

SELECT
    c.id_cliente,
    c.nombre,
    c.email,
    c.fecha_registro
FROM dbo.clientes AS c
LEFT JOIN dbo.ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- =============================================
-- CONSULTA 3: PRODUCTOS SIN VENTAS
-- Identifica productos del catálogo que aún
-- no registran ninguna venta
-- =============================================

SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM dbo.productos AS p
INNER JOIN dbo.categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN dbo.ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;


-- =============================================
-- CONSULTA 4: CONSOLIDADO POR CANAL
-- Une dos subconjuntos mediante UNION ALL
-- y obtiene el total por cada origen
-- =============================================

SELECT
    canal,
    COUNT(*) AS cantidad_ventas,
    SUM(total_venta) AS total_facturado
FROM (

    SELECT
        v.id_venta,
        v.fecha_venta,
        v.cantidad * v.precio_unitario AS total_venta,
        'Online' AS canal
    FROM dbo.ventas AS v
    WHERE v.fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        v.id_venta,
        v.fecha_venta,
        v.cantidad * v.precio_unitario AS total_venta,
        'Presencial' AS canal
    FROM dbo.ventas AS v
    WHERE v.fecha_venta > '2024-03-10'

) AS ventas_por_canal

GROUP BY canal
ORDER BY canal;

-- =============================================
-- HALLAZGOS DEL ANÁLISIS
-- =============================================

-- 1. La vista base construida con INNER JOIN permitió integrar correctamente las 10 ventas con la información descriptiva de clientes, productos y categorías, sin pérdida de registros.

-- 2. No se identificaron clientes registrados sin compras: los 5 clientes presentes en la base tienen al menos una venta asociada.

-- 3. No se identificaron productos sin ventas: los 6 productos del catálogo aparecen al menos una vez en las transacciones registradas.

-- Nota metodológica:
-- En la Consulta 4, los valores 'Online' y 'Presencial' fueron creados como etiquetas de ejemplo para aplicar UNION ALL y GROUP BY.
-- No representan canales reales almacenados en la base de datos.
-- =========================================================
-- RETAILPRO - PRE-ENTREGA MÓDULO 4
-- Consultas SQL de negocio
-- Base de datos: Ventas_Tech_DB
-- =========================================================

USE Ventas_Tech_DB;

-- =========================================================
-- CONSULTA 1: RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio
-- =========================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM dbo.ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- =============================================
-- CONSULTA 2: RANKING TOP 5 DE PRODUCTOS
-- Unidades vendidas y total facturado por producto
-- =============================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM dbo.ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- =============================================
-- CONSULTA 3: CLIENTES RECURRENTES
-- Clientes con más de un pedido y total gastado
-- =============================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM dbo.ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- =============================================
-- CONSULTA 4: MESES VS PROMEDIO MENSUAL
-- Clasifica cada mes según su facturación
-- =============================================

SELECT
    mes,
    total_facturado,
    promedio_mensual,
    CASE
        WHEN total_facturado > promedio_mensual THEN 'Por encima'
        WHEN total_facturado < promedio_mensual THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado,
        AVG(SUM(cantidad * precio_unitario)) OVER () AS promedio_mensual
    FROM dbo.ventas
    GROUP BY MONTH(fecha_venta)
) AS resumen_mensual
ORDER BY mes;

-- =============================================
-- 5. HALLAZGOS PRINCIPALES
-- =============================================

-- Hallazgo 1:
-- En marzo de 2024 se registraron 10 pedidos, con una facturación total de 6444.00 y un ticket promedio de 644.40.

-- Hallazgo 2:
-- El producto 1 lidera la facturación con 3600.00, aunque solo se vendieron 3 unidades. 
-- En cambio, el producto 2 fue el de mayor volumen, con 13 unidades, pero generó solo 364.00. 
-- Esto demuestra que mayor volumen no implica necesariamente mayor facturación.

-- Hallazgo 3:
-- Los 5 clientes realizaron más de un pedido. 
-- El cliente 1 registró el mayor gasto acumulado con 2640.00, seguido por el cliente 5 con 2100.00.
-- Como la base contiene datos de un solo mes, marzo coincide exactamente con el promedio mensual de facturación.
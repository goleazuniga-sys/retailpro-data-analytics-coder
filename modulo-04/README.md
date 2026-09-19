# Módulo 4 - Consultas SQL de negocio

## Proyecto RetailPro

Este directorio contiene la pre-entrega correspondiente al Módulo 4 del proyecto integrador RetailPro.

El objetivo de esta entrega es utilizar SQL para extraer métricas clave desde la base de datos `Ventas_Tech_DB`, respondiendo preguntas de negocio mediante funciones de agregación, agrupaciones y condiciones.

## Archivo principal

- `m4_consultas_negocio.sql`

## Consultas incluidas

El script contiene las siguientes consultas:

1. **Resumen ejecutivo mensual**
   - Total facturado.
   - Cantidad de pedidos.
   - Ticket promedio.
   - Agrupación por mes.

2. **Ranking Top 5 de productos**
   - Unidades vendidas por producto.
   - Total facturado por producto.
   - Orden descendente según facturación.

3. **Clientes recurrentes**
   - Identificación de clientes con más de un pedido.
   - Cantidad de pedidos por cliente.
   - Total gastado por cliente.

4. **Comparación de facturación mensual**
   - Facturación total por mes.
   - Promedio mensual general.
   - Clasificación de cada mes como:
     - Por encima del promedio.
     - Por debajo del promedio.
     - Igual al promedio.

## Hallazgos principales

- En marzo de 2024 se registraron 10 pedidos, con una facturación total de 6444.00 y un ticket promedio de 644.40.
- El producto 1 lidera la facturación con 3600.00, aunque solo se vendieron 3 unidades. En contraste, el producto 2 registró 13 unidades vendidas, pero generó 364.00.
- Los cinco clientes realizaron más de un pedido. El cliente 1 acumuló el mayor gasto con 2640.00, seguido por el cliente 5 con 2100.00. Como la base contiene información de un único mes, marzo coincide con el promedio mensual de facturación.

## Conceptos SQL aplicados

- `SELECT`
- Alias con `AS`
- `SUM()`
- `COUNT()`
- `AVG()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `CASE WHEN`
- Funciones de fecha en SQL Server

## Base de datos utilizada

`Ventas_Tech_DB`

## Herramienta

SQL Server Management Studio

## Autor

Gabriela Olea Zúñiga

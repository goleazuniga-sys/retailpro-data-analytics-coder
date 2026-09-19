# Módulo 5 - Consultas SQL con JOIN y UNION ALL

Este directorio contiene la pre-entrega correspondiente al Módulo 5 del proyecto integrador RetailPro.

El objetivo de esta etapa es enriquecer el análisis combinando información de distintas tablas mediante JOINs y consolidando subconjuntos de datos mediante UNION ALL.

## Archivo principal

- `m5_consultas_joins.sql`

## Consultas incluidas

1. Vista base del proyecto mediante `INNER JOIN`.
2. Identificación de clientes sin ventas mediante `LEFT JOIN`.
3. Identificación de productos sin ventas mediante `LEFT JOIN`.
4. Consolidado por canal mediante `UNION ALL` y `GROUP BY`.

## Tablas utilizadas

- `ventas`
- `clientes`
- `productos`
- `categorias`

## Resultados principales

- Las 10 ventas pudieron integrarse correctamente con la información descriptiva de clientes, productos y categorías.
- No se identificaron clientes registrados sin compras.
- No se identificaron productos del catálogo sin ventas.
- La consulta consolidada por canal devuelve dos grupos creados con fines del ejercicio.

## Nota metodológica

Los valores `Online` y `Presencial` fueron creados como etiquetas de ejemplo para aplicar `UNION ALL` y `GROUP BY`.

No representan canales reales almacenados en la base de datos.

## Herramienta utilizada

SQL Server Management Studio (SSMS)

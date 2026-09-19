# Módulo 3 - Implementación SQL de RetailPro

Este directorio contiene la pre-entrega correspondiente al Módulo 3 del proyecto integrador RetailPro.

El objetivo de esta etapa es implementar en SQL la estructura de datos definida previamente, creando una base de datos relacional con sus tablas, claves primarias, claves foráneas, restricciones de integridad y carga inicial de datos.

## Archivo principal

- `ventas_tech_db.sql`

## Contenido

El script incluye:

- Creación de la base de datos `Ventas_Tech_DB`.
- Eliminación controlada de tablas existentes mediante `DROP TABLE IF EXISTS`.
- Creación de las tablas:
  - `categorias`
  - `clientes`
  - `productos`
  - `ventas`
- Definición de claves primarias y claves foráneas.
- Restricciones `NOT NULL`, `UNIQUE` y `DEFAULT`.
- Carga inicial de 25 registros.
- Consultas `SELECT` para validar la correcta carga de datos.

## Modelo de relaciones

- Una categoría puede tener varios productos.
- Un cliente puede realizar varias ventas.
- Un producto puede aparecer en varias ventas.

## Herramienta utilizada

SQL Server Management Studio (SSMS).

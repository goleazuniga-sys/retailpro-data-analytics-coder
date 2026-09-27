# Módulo 6 - Pipeline ETL con Power Query y M

## Proyecto RetailPro

Este directorio contiene la pre-entrega correspondiente al Módulo 6 del proyecto integrador RetailPro.

El objetivo de esta etapa es construir un pipeline ETL en Power BI utilizando Power Query, aplicando procesos de extracción, transformación y carga de datos para dejar las tablas preparadas para el análisis y modelado posterior.

## Archivo principal

- `m6_pipeline_etl_power_query.pbix`

## Fuente de datos

Se utilizó el archivo:

- `Pipeline_ETL_Dataset.xlsx`

El archivo contiene las tablas base del proyecto:

- clientes
- productos
- ventas
- categorias

## Consultas finales

Luego del proceso de transformación, las consultas fueron renombradas siguiendo una nomenclatura de modelo dimensional:

- `Dim_Clientes`
- `Dim_Productos`
- `Dim_Categorias`
- `Fact_Ventas`

## Transformaciones aplicadas

### Dim_Clientes

Se realizaron las siguientes transformaciones:

- Eliminación de filas completamente vacías provenientes del rango extendido del archivo Excel.
- Eliminación de registros duplicados utilizando `id_cliente` como clave.
- Reemplazo de valores nulos en `ciudad` por `Sin dato`.
- Conservación del valor nulo en `email`, ya que no corresponde inventar un dato de contacto inexistente.
- Validación de tipos de datos.
- Renombrado de la consulta como `Dim_Clientes`.

Resultado final:

- 11 registros.
- `id_cliente` sin duplicados.

## Dim_Productos

Se realizaron las siguientes transformaciones:

- Eliminación de filas completamente vacías.
- Eliminación de registros duplicados utilizando `id_producto` como clave.
- Reemplazo de la categoría nula por `Sin categoría`.
- Conservación del precio nulo del producto `SSD Externo 1TB`, debido a que no existe un valor confiable en la fuente y una imputación artificial podría distorsionar métricas comerciales.
- Validación de tipos de datos.
- Renombrado de la consulta como `Dim_Productos`.

Resultado final:

- 12 registros.
- `id_producto` sin duplicados.

## Dim_Categorias

Se realizaron las siguientes transformaciones:

- Eliminación de filas completamente vacías.
- Validación de claves y tipos de datos.
- Renombrado de la consulta como `Dim_Categorias`.

Resultado final:

- 4 registros.
- `id_categoria` sin duplicados.

## Fact_Ventas

Se realizaron las siguientes transformaciones:

- Eliminación de filas completamente vacías.
- Conversión de `fecha_venta` desde número serial de Excel a tipo fecha.
- Validación de tipos de datos numéricos y categóricos.
- Renombrado de la consulta como `Fact_Ventas`.
- Merge con `Dim_Productos` mediante `id_producto`.
- Tipo de combinación utilizado: unión externa izquierda.
- Expansión de las columnas:
  - `nombre_producto`
  - `categoria`

Resultado final:

- 50 registros.
- `id_venta` sin duplicados.
- Inclusión de información descriptiva de producto dentro de la tabla de hechos.

## Comentarios técnicos en lenguaje M

Se incorporaron comentarios técnicos directamente en el Editor Avanzado de Power Query.

Las consultas documentadas son:

- `Dim_Clientes`
- `Fact_Ventas`

Los comentarios explican decisiones como:

- eliminación de duplicados;
- tratamiento de valores nulos;
- eliminación de filas completamente vacías;
- combinación entre tablas;
- expansión de columnas provenientes del Merge.

## Relaciones del modelo

Se configuraron las siguientes relaciones:

- `Fact_Ventas[id_cliente]` → `Dim_Clientes[id_cliente]`
- `Fact_Ventas[id_producto]` → `Dim_Productos[id_producto]`

Ambas relaciones tienen:

- cardinalidad varios a uno (`*:1`);
- relación activa;
- dirección de filtro cruzado única.

`Dim_Categorias` se mantiene sin relación directa en esta etapa, ya que el objetivo principal del checkpoint corresponde al proceso ETL y no al desarrollo completo del modelo dimensional.

## Validación final

| Consulta | Registros finales |
|---|---:|
| Dim_Clientes | 11 |
| Dim_Productos | 12 |
| Dim_Categorias | 4 |
| Fact_Ventas | 50 |

## Criterios de aceptación cumplidos

- Las cuatro tablas fueron cargadas y renombradas correctamente con nomenclatura `Dim_` y `Fact_`.
- Se eliminaron duplicados en `Dim_Clientes` y `Dim_Productos`.
- Los valores nulos fueron tratados mediante decisiones técnicas justificadas.
- Las columnas fueron configuradas con tipos de datos adecuados.
- Se aplicó correctamente un Merge entre `Fact_Ventas` y `Dim_Productos`.
- `Fact_Ventas` incluye `nombre_producto` y `categoria`.
- Se incorporaron comentarios técnicos en lenguaje M en al menos dos consultas.

## Herramientas utilizadas

- Microsoft Power BI Desktop
- Power Query
- Lenguaje M
- Microsoft Excel

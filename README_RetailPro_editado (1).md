# RetailPro — Data Analytics

Proyecto de análisis del desempeño comercial de RetailPro usando SQL, Power Query, Power BI y DAX, desarrollado de forma progresiva en el curso de Data Analytics de Coderhouse.

---

## 1. Descripción del proyecto

RetailPro es un caso de estudio de una empresa de retail. El proyecto recorre el flujo completo de un análisis de datos: diseño de la base de datos, consultas SQL, limpieza y transformación con Power Query, modelado en Power BI, medidas DAX y diseño de un dashboard.

## 2. Objetivo de negocio

Entregar al equipo comercial una visión clara del desempeño de ventas que le permita identificar en qué segmentos concentrar sus esfuerzos.

## 3. Pregunta estratégica

> ¿Qué factores explican las diferencias en el desempeño de ventas entre regiones y categorías de producto en RetailPro, y qué segmentos presentan las principales oportunidades de crecimiento?

## 4. Herramientas

| Herramienta | Uso en el proyecto |
|---|---|
| SQL Server | Motor de base de datos |
| SQL Server Management Studio (SSMS) | Creación de tablas y ejecución de consultas |
| Power Query | ETL: limpieza y transformación de datos |
| Power BI Desktop | Modelo de datos y dashboard |
| DAX | Medidas y tabla calendario |
| GitHub | Control de versiones y documentación |

## 5. Estructura del repositorio

El repositorio está organizado por módulo, siguiendo la progresión del curso y manteniendo trazabilidad entre cada pre-entrega.

```text
retailpro-data-analytics-coder/
├── modulo-01/
├── modulo-02/
├── modulo-03/
├── modulo-04/
├── modulo-05/
├── modulo-06/
├── modulo-07/
├── modulo-08/
└── README.md
```

## 6. Módulos del proyecto

| Módulo | Contenido |
|---|---|
| Diseño y modelado de base de datos | Definición de tablas, claves primarias y relaciones |
| Consultas SQL | Agregaciones, resúmenes y rankings |
| JOIN y UNION ALL | Vista base que integra ventas, clientes, productos y categorías |
| ETL con Power Query | Limpieza, tipado y transformación de datos |
| Modelado en Power BI | Relaciones entre tablas del modelo |
| Tabla calendario | Dimensión de fechas para análisis temporal |
| Medidas DAX | Indicadores de ventas y desempeño |
| Dashboard | Boceto y diseño de la visualización final |

## 7. Cómo ejecutar los scripts SQL

1. Abrir SQL Server Management Studio y conectarse a una instancia de SQL Server.
2. Utilizar la base de datos `Ventas_Tech_DB`.
3. Abrir el archivo `.sql` correspondiente al módulo que se quiera revisar.
4. Ejecutar primero los scripts de creación/carga cuando corresponda y luego las consultas de análisis.
5. Verificar los resultados en SSMS antes de utilizarlos en Power BI o en la documentación del proyecto.

## 8. Cómo abrir el archivo Power BI

1. Instalar Power BI Desktop (Windows).
2. Abrir `powerbi/RetailPro.pbix`.
3. Si la conexión a SQL Server falla, ir a **Transformar datos → Configuración de origen de datos** y actualizar el servidor y la base de datos con los de tu entorno.
4. Hacer clic en **Actualizar** para recargar los datos.

## 9. Modelo de datos

Tablas principales:

| Tabla | Tipo | Descripción |
|---|---|---|
| `ventas` | Hechos | Una fila por venta: fecha, cliente, producto, cantidad y precio unitario |
| `clientes` | Dimensión | Datos de los clientes |
| `productos` | Dimensión | Productos y su categoría |
| `categorias` | Dimensión | Categorías de producto |
| Calendario | Dimensión | Tabla de fechas creada para el análisis temporal |

Relaciones principales:

- `ventas.id_cliente` → `clientes.id_cliente`
- `ventas.id_producto` → `productos.id_producto`
- `productos.id_categoria` → `categorias.id_categoria`
- `ventas.fecha_venta` → Calendario

## 10. Limitaciones del análisis

Los resultados de las primeras consultas SQL se construyeron sobre una muestra acotada de datos. En la Pre-entrega 4, por ejemplo, el análisis mensual disponible corresponde a marzo de 2024, por lo que no se utilizan esos resultados para afirmar tendencias temporales o estacionalidad.

Además, en la Pre-entrega 5 las etiquetas `Online` y `Presencial` utilizadas en el ejercicio con `UNION ALL` fueron creadas con fines metodológicos y no representan canales reales almacenados originalmente en la base de datos.

## 11. Uso responsable de IA

En este proyecto se utilizó IA generativa como apoyo para revisar código SQL, proponer documentación y ordenar hallazgos. Todas las cifras y conclusiones fueron validadas manualmente contra los resultados de las consultas originales antes de incorporarse. Las decisiones analíticas y la interpretación final son responsabilidad de la autora.

---

**Autora:** Gabriela Olea · Data Analytics — Coderhouse

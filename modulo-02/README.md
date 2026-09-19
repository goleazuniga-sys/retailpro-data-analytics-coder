# Módulo 2 - Modelo relacional de RetailPro

Este directorio contiene la pre-entrega correspondiente al Módulo 2 del proyecto integrador RetailPro.

El objetivo de esta etapa es diseñar la arquitectura de datos que sostiene el análisis, definiendo entidades, atributos, claves primarias, claves foráneas y relaciones entre tablas, aplicando principios de normalización hasta 3NF.

## Archivos principales

- `m2_modelo_relacional_retailpro.pdf`
- `diagrama_er_retailpro.png`

## Modelo de datos

El modelo contempla las siguientes entidades:

- `clientes`
- `productos`
- `ventas`
- `territorios`

Las relaciones principales corresponden a cardinalidades 1:N:

- Un cliente puede participar en múltiples ventas.
- Un producto puede aparecer en múltiples ventas.
- Un territorio puede asociarse a múltiples ventas.

## Normalización

El modelo fue diseñado aplicando:

- **1NF:** atributos atómicos y registros identificados mediante claves primarias.
- **2NF:** al utilizar claves primarias simples, no existen dependencias parciales; los atributos no clave dependen de la clave primaria completa de su tabla.
- **3NF:** se evitan dependencias transitivas separando clientes, productos y territorios en entidades independientes, de modo que los atributos no clave dependan únicamente de la clave primaria correspondiente.

## Conexión con el negocio

El diseño permite responder preguntas relacionadas con:

- evolución de ventas;
- desempeño por productos y categorías;
- comportamiento de clientes;
- diferencias por región y territorio.

## Herramienta utilizada

dbdiagram.io

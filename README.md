# Análisis SQL — Chinook Database

Proyecto centrado en consultas SQL avanzadas (JOINs, subconsultas, CTEs y funciones de ventana) 
sobre una base de datos relacional de una tienda de música, usando DuckDB como motor de consulta.

## Objetivo

Practicar y demostrar dominio de SQL para resolver preguntas de negocio: 
ingresos por país, clientes de alto valor, ranking de artistas, tendencias mensuales acumuladas.

## Stack Tecnológico

- **Motor SQL:** DuckDB
- **Lenguaje:** Python (para orquestar las consultas y graficar resultados)
- **Librerías:** pandas, matplotlib
- **Dataset:** [Chinook Database](https://github.com/lerocha/chinook-database)

## Estructura del Repositorio
├── data/                       # Base de datos SQLite (Chinook)
├── notebooks/                  # Notebook con las consultas ejecutadas y comentadas
├── sql/                        # Consultas SQL organizadas por nivel de complejidad
│   ├── 01_basico.sql
│   ├── 02_joins.sql
│   ├── 03_subconsultas.sql
│   └── 04_window_functions.sql
├── images/                     # Gráficos generados
└── requirements.txt

## Consultas destacadas

- Ranking de clientes por gasto dentro de cada país (CTE + `RANK() OVER`)
- Ingresos mensuales acumulados (running total con `SUM() OVER`)
- Identificación de clientes de alto valor mediante subconsultas anidadas

![Ingresos acumulados](images/ingresos_acumulados.png)

## Cómo ejecutarlo

1. Clona el repositorio
2. Instala dependencias: `pip install -r requirements.txt`
3. Descarga `Chinook_Sqlite.sqlite` desde el [repositorio oficial](https://github.com/lerocha/chinook-database) y colócalo en `data/`
4. Abre `notebooks/01_consultas_sql.ipynb` con Jupyter
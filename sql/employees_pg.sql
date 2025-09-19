-- employees_pg.sql (se ejecuta automáticamente al levantar el contenedor por /docker-entrypoint-initdb.d)
-- Crea la base de datos y carga datos de ejemplo equivalentes al taller de MySQL
-- Usuario: postgres  | Password: utec

-- Crear BD si no existe (nota: la carpeta de datos se inicializa en el primer arranque)
CREATE DATABASE bd_api_employees;

-- Cambiar al nuevo esquema
\c bd_api_employees;

-- Crear tabla
CREATE TABLE IF NOT EXISTS employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- Insertar filas demo
INSERT INTO employees (name, age) VALUES ('Jake', 21);
INSERT INTO employees (name, age) VALUES ('Mathew', 24);
INSERT INTO employees (name, age) VALUES ('Bob', 35);

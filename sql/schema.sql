-- 📄 schema.sql
-- Script to create base tables for the retail analytics project

-- Drop tables if they exist (to reset environment)
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;

-- Create table: productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    sku TEXT UNIQUE NOT NULL,
    ean TEXT UNIQUE,
    nombre TEXT NOT NULL,
    variante TEXT,
    categoria TEXT,
    subcategoria TEXT,
    marca TEXT,
    precio NUMERIC(10, 2),
    stock INT,
    fecha_ingreso DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- Create table: clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    rut TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    email TEXT,
    ciudad TEXT,
    region TEXT,
    pais TEXT,
    fecha_registro DATE,
    activo BOOLEAN DEFAULT TRUE
);

-- Create table: ventas
CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    producto_id INT REFERENCES productos(id),
    fecha DATE,
    cantidad INT,
    total NUMERIC(10,2)
);

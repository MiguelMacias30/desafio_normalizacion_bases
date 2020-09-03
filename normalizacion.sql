--base de datos biblioteca
CREATE DATABASE biblioteca;
CREATE TABLE autores(id SERIAL, nombre VARCHAR(100) NOT NULL);
ALTER TABLE autores ADD PRIMARY KEY(id);
CREATE TABLE libros(codigo INT, nombre VARCHAR(100) NOT NULL, PRIMARY KEY(codigo));
CREATE TABLE lectores(id SERIAL, nombre VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE editoriales(id SERIAL, nombre VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE autores_libros(libro_cod INT, autor_id INT, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(autor_id) REFERENCES autores(id));
CREATE TABLE editoriales_libros(libro_cod INT UNIQUE, editorial_id INT, FOREIGN KEY(libro_cod) REFERENCES libros(codigo), FOREIGN KEY(editorial_id) REFERENCES editoriales(id));
CREATE TABLE prestamos(id SERIAL, fecha_devolucion DATE NOT NULL, lector_id INT NOT NULL, libro_cod INT NOT NULL, PRIMARY KEY(id), FOREIGN KEY(lector_id) REFERENCES lectores(id), FOREIGN KEY(libro_cod) REFERENCES libros(codigo));

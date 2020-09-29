--PARTE 1 

CREATE DATABASE prueba;

CREATE TABLE fechas
(
    id_fecha INT NOT NULL PRIMARY KEY,
    fecha DATE NOT NULL
);

CREATE TABLE facturas
(
    id_factura INT NOT NULL PRIMARY KEY,
    idfecha_factura INT NOT NULL,
    subtotal_factura INT NOT NULL,
    idcliente_factura INT NOT NULL,
    FOREIGN KEY (idfecha_factura) REFERENCES fechas(id_fecha),
    FOREIGN KEY (idcliente_factura) REFERENCES clientes(id_cliente)
);

CREATE TABLE direcciones
(   
    id_direccion INT NOT NULL PRIMARY KEY,
    direccion VARCHAR(30)
);

CREATE TABLE clientes
(
    id_cliente INT NOT NULL PRIMARY KEY,
    nombre_cliente VARCHAR(30) NOT NULL,
    rut_cliente VARCHAR(10),
    iddireccion_cliente VARCHAR(50),
    FOREIGN KEY (iddireccion_cliente) REFERENCES direcciones(id_direccion)
);

CREATE TABLE categorias
(
    id_categoria INT NOT NULL PRIMARY KEY,
    nombre_categoria VARCHAR(20) NOT NULL,
    descripcion_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE productos
(
    id_producto INT NOT NULL PRIMARY KEY,
    nombre_producto VARCHAR(30) NOT NULL,
    descripcion_producto VARCHAR(30) NOT NULL,
    valorunitario_producto INT NOT NULL,
    idcategoria_producto INT NOT NULL,
    FOREIGN KEY (idcategoria_producto) REFERENCES categorias(id_categoria) 
);

CREATE TABLE facturas_productos
(
    id_facprod INT NOT NULL PRIMARY KEY,
    idfactura_facprod INT NOT NULL,
    idproducto_facprod INT NOT NULL,
    cantidad INT NOT NULL,
    total INT NOT NULL,
    FOREIGN KEY (idfactura_facprod) REFERENCES facturas(id_factura),
    FOREIGN KEY (idproducto_facprod) REFERENCES productos(id_producto)
);


--PARTE 2 

-- 5 clientes
INSERT INTO direcciones(id_direccion, direccion) VALUES (1, 'calle los olivos 1234'), (2, 'pedro torres 2345'), (3, 'julio zegers 3456'), (4, 'calle dorsal 4567'), (5, 'avenida brasil 5678');

INSERT INTO clientes(id_cliente, nombre_cliente, rut_cliente, iddireccion_cliente) VALUES (1, 'juan', 123658970, 1), (2, 'lily', 113567890, 2), (3, 'pedro', 169412480, 3), (4, 'Pablo', 115669786, 4), (5, 'Rosa', 186106695, 5);

-- 3 categorias

INSERT INTO categorias(id_categoria, nombre_categoria, descripcion_categoria) VALUES (1, 'frutas', 'frutas Importadas'), (2, 'carnes', 'carnes nacionales'), (3, 'cosmeticos', 'avon');

-- 8 productos

INSERT INTO productos(id_producto, nombre_producto, descripcion_producto, valorunitario_producto, idcategoria_producto) VALUES (1, 'mango', 'mango grande',60, 1), (2, 'pera', 'pera Verde',90, 1), (3, 'pavo', 'Pavo Criollo',250, 2), (4, 'Cerdo', 'Cerdo Importado',300, 2), (5, 'Pollo', 'Pollo Purina',270, 2), (6, 'Pescado', 'Pescado de Mar',350, 2), (7, 'Labial', 'Labial rojo',220, 3), (8, 'Crema', 'Crema facial',340, 3);


-- 10 facturas
-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

INSERT INTO fechas(id_fecha, fecha) VALUES (1, '2020-02-10'), (2, '2020-03_24'), (3, '2020-01-11'), (4, '2020-03-25'), (5, '2020-05-12'), (6, '2020-06-27'), (7, '2020-09-21'), (8, '2020-10-02'), (9, '2020-10-29'), (10, '2020-11-11');

INSERT INTO facturas(id_factura, idfecha_factura, subtotal_factura, idcliente_factura) VALUES (1, 1, 120, 1), (2, 1, 180, 1), (3, 2, 750, 2), (4, 3, 540, 2), (5, 4, 1050, 2), (6, 5, 340, 3), (7, 7, 120, 4), (8, 9, 270, 4), (9, 9, 1400, 4), (10, 10, 340, 4);

-- total = subtotal_factura+IVA(18%)
INSERT INTO facturas_productos(id_facprod, idfactura_facprod, idproducto_facprod, cantidad, total) VALUES (1, 1, 1, 2, 142), (2, 2, 2, 3, 212), (3, 3, 3, 3, 885), (4, 4, 5, 2, 637), (5, 5, 6, 3, 1239), (6, 6, 8, 1, 401), (7, 7, 1, 2, 142), (8, 8, 2, 3, 319), (9, 9, 6, 4, 1652), (10, 10, 8, 1, 401);


--PARTE 3 

SELECT clientes FROM facturas ORDER BY subtotal_factura DESC limit 1;

SELECT clientes FROM facturas WHERE subtotal_factura > 100 GROUP BY cliente ORDER BY cliente;

SELECT COUNT(DISTINCT clientes) FROM facturas INNER JOIN facturas_productos ON facturas.id_factura = facturas_productos.idfactura_facprod WHERE idproducto_facprod = 6;


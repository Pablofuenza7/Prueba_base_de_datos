CREATE TABLE clientes
(
    id_cliente INT NOT NULL PRIMARY KEY,
    name_cliente VARCHAR(30) NOT NULL,
    rut_cliente VARCHAR(10),
    adress_cliente VARCHAR(50)
);

CREATE TABLE categorias
(
    id_categoria INT NOT NULL PRIMARY KEY,
    name_category VARCHAR(20) NOT NULL,
    description_category VARCHAR(50) NOT NULL
);


CREATE TABLE facturas
(
    id_factura INT NOT NULL PRIMARY KEY,
    number_factura INT NOT NULL,
    date_factura DATE NOT NULL,
    subtotal_factura DOUBLE PRECISION NOT NULL,
    iva_factura DOUBLE PRECISION NOT NULL,
    total_factura DOUBLE PRECISION NOT NULL,
    idcliente_factura INT NOT NULL,
    FOREIGN KEY (idcliente_factura) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos
(
    id_producto INT NOT NULL PRIMARY KEY,
    name_producto VARCHAR(30) NOT NULL,
    description_producto VARCHAR(30) NOT NULL,
    unitvalue_producto DOUBLE PRECISION NOT NULL,
    idcategory_producto INT NOT NULL,
    FOREIGN KEY (idcategory_producto) REFERENCES categorias(id_categoria) 
);

CREATE TABLE factura_productos
(
    id_facprod INT NOT NULL PRIMARY KEY,
    idfactura_facprod INT NOT NULL,
    idproducto_facprod INT NOT NULL,
    cantidad_facprod INT NOT NULL,
    total_facprod DOUBLE PRECISION NOT NULL,
    FOREIGN KEY (idfactura_facprod) REFERENCES facturas(id_factura)
    FOREIGN KEY (idproducto_facprod) REFERENCES productos(id_producto)
);


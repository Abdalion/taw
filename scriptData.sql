--USUARIOS----
INSERT INTO USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('rubengg', 'ruben@gmail.com', 'margarita.8', 'ANALISTA');

INSERT INTO USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
VALUES ('abdalion', 'egon@gmail.com', 'abd.9', 'ADMINISTRADOR');

INSERT INTO USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('lusiMontiel', 'lusi@gmail.com', 'megustalahorchata', 'TELEOPERADOR');

INSERT INTO USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('jesusmd2000', 'jesu@jesu.com', 'jesu', 'AUTOREGISTRADO');

--MAYOR18
INSERT INTO USUARIO_AUTO (ID, NOMBRE, APELLIDOS, DOMICILIO, CIUDAD, EDAD, SEXO) 
VALUES (4, 'Jesus', 'Moreno', 'Calle Carretas', 'Malaga', 21, 'MASCULINO');


INSERT INTO USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
VALUES ('paco82', 'paco@gmail.com', 'Solipandi4', 'AUTOREGISTRADO');

--MENOR18
INSERT INTO USUARIO_AUTO (ID, NOMBRE, APELLIDOS, DOMICILIO, CIUDAD, EDAD, SEXO) 
VALUES (5, 'Francisco', 'Del Valle', 'Calle Flor', 'Malaga', 12, 'MASCULINO');

----EVENTOS----
--PROXIMO
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA_EVENTO, FECHA_LIMITE, PRECIO, AFORO, LIMITE_USUARIO, N_FILAS, N_ASIENTOS_FILA) 
	VALUES ('WEEKEND', 'Festival en Torre del Mar', '2021-07-21', '2021-07-20', 50.0, 40, 4, 4, 10);

--REALIZADO
INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA_EVENTO, FECHA_LIMITE, PRECIO, AFORO, LIMITE_USUARIO, N_FILAS, N_ASIENTOS_FILA) 
	VALUES ('Melendi', 'Concierto', '2021-05-17', '2021-05-15', 20.0, 20, 2, 2, 10);

INSERT INTO EVENTO (TITULO, DESCRIPCION, FECHA_EVENTO, FECHA_LIMITE, PRECIO, AFORO, LIMITE_USUARIO, N_FILAS, N_ASIENTOS_FILA) 
	VALUES ('Los Alamos', 'Festival en la playa', '2020-07-20', '2020-07-13', 50.0, 40, 4, 4, 10);


----ETIQUETAS----
INSERT INTO ETIQUETA (ETIQUETA) 
	VALUES ('Concierto');

INSERT INTO ETIQUETA (ETIQUETA) 
	VALUES ('Festival');
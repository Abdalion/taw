INSERT INTO FASA.USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('rubengg', 'ruben@ruben.com', 'ruben', 'CREADOR');

INSERT INTO FASA.USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('jesus', 'jesu@jesu.com', 'jesu', 'AUTOREGISTRADO');

INSERT INTO FASA.USUARIO_AUTO (ID, NOMBRE, APELLIDOS, DOMICILIO, CIUDAD, EDAD, SEXO) 
	VALUES (2, 'Jesus', 'Moreno nosq', 'su casa', 'campillo', 8, 'FEMENINO');

INSERT INTO FASA.USUARIO (NOMBRE_USUARIO, EMAIL, PASSWORD, ROL) 
	VALUES ('lusilu', 'lusi@lusi.com', 'lusi', 'TELEOPERADOR');

INSERT INTO FASA.EVENTO (TITULO, DESCRIPCION, FECHA_EVENTO, FECHA_LIMITE, PRECIO, AFORO, LIMITE_USUARIO, N_FILAS, N_ASIENTOS_FILA) 
	VALUES ('WEEKEND', 'festival pa partirse', '2021-04-21', '2021-04-20', 4.0, 2000, 5, 82, 4);

INSERT INTO FASA.ENTRADA (ID_USUARIO, ID_EVENTO, FILA, ASIENTO) 
	VALUES (1, 1, 4, 5);

INSERT INTO FASA.ETIQUETA (ETIQUETA, ID_EVENTO) 
	VALUES ('FESTIVAL', 1);

INSERT INTO FASA.CHAT (ID_USUARIO, ID_TELEOPERADOR) 
	VALUES (2, 3);

INSERT INTO FASA.MENSAJE (ID_CHAT, ID_EMISOR, TEXTO) 
	VALUES (1, 2, 'nocena');


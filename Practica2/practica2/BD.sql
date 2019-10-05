 CREATE database practica;
 use  practica;



CREATE TABLE cita (
    codcita             INTEGER NOT NULL,
    cliente_codcliente             INTEGER NOT NULL,
    doctor_coddoctor   INTEGER NOT NULL,
    horario_codhorario   INTEGER NOT NULL,
    status              INTEGER NOT NULL
);
ALTER TABLE cita ADD CONSTRAINT cita_pk PRIMARY KEY ( codcita );

CREATE TABLE resultados (
    codresultados   INTEGER NOT NULL,
    cita_codcita    INTEGER NOT NULL,
    Descripcion       VARCHAR(500) NOT NULL,
    peso     FLOAT NOT NULL,
    altura     FLOAT NOT NULL,
    temperatura   FLOAT NOT NULL
);
ALTER TABLE resultados ADD CONSTRAINT resultados_pk PRIMARY KEY ( codresultados );


CREATE TABLE cliente (
    codcliente   INTEGER NOT NULL,
    nombre       VARCHAR(200) NOT NULL,
    apellido     VARCHAR(200) NOT NULL,
    usuario     VARCHAR(100) NOT NULL,
    contrasena   VARCHAR(50) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( codcliente );

CREATE TABLE horario (
    codhorario               INTEGER NOT NULL,
    fecha                    DATE NOT NULL,
    hora_inicio              TIME NOT NULL,
    hora_fin                 TIME NOT NULL
);

ALTER TABLE horario ADD CONSTRAINT horario_pk PRIMARY KEY ( codhorario );

CREATE TABLE doctor (
    coddoctor             INTEGER NOT NULL,
    nombre                   VARCHAR(100) NOT NULL,
    apellido                VARCHAR(200) NOT NULL,
    usuario                  VARCHAR(100) NOT NULL,
    contrasena               VARCHAR(50) NOT NULL,

);

ALTER TABLE doctor ADD CONSTRAINT doctor_pk PRIMARY KEY ( coddoctor );

ALTER TABLE cita
    ADD CONSTRAINT cita_cliente_fk FOREIGN KEY ( cliente_codcliente )
        REFERENCES cliente ( codcliente );

ALTER TABLE cita
    ADD CONSTRAINT cita_horario_fk FOREIGN KEY ( horario_codhorario )
        REFERENCES horario ( codhorario );

ALTER TABLE cita
    ADD CONSTRAINT cita_doctor_fk FOREIGN KEY ( doctor_coddoctor )
        REFERENCES doctor ( coddoctor );

ALTER TABLE resultados
    ADD CONSTRAINT resultados_cita_fk FOREIGN KEY ( cita_codcita )
        REFERENCES cita ( codcita );



INSERT INTO cliente (codcliente,nombre,apellido,usuario,contrasena)
VALUES (1, "Jason", "Lopez","jasonl",1234); 
INSERT INTO cliente (codcliente,nombre,apellido,usuario,contrasena)
VALUES (2, "Laura", "Lopez","laural",1234); 
INSERT INTO cliente (codcliente,nombre,apellido,usuario,contrasena)
VALUES (3," Maria", "Perez","MariaP",1234); 
INSERT INTO cliente (codcliente,nombre,apellido,usuario,contrasena)
VALUES (4, "Carlos", "Rodriguez","CarlR",1234); 


INSERT INTO doctor (coddoctor,nombre,apellido,usuario,contrasena)
VALUES (1, "jorge", "Valencia","jasonl",1234); 
INSERT INTO doctor (coddoctor,nombre,apellido,usuario,contrasena)
VALUES (2, "Lorena", "Pineda","laural",1234); 
INSERT INTO doctor (coddoctor,nombre,apellido,usuario,contrasena)
VALUES (3," Susan", "Ruiz","MariaP",1234); 
INSERT INTO doctor (coddoctor,nombre,apellido,usuario,contrasena)
VALUES (4, "Jose", "Rodriguez","CarlR",1234); 

INSERT INTO horario (codhorario,fecha,hora_inicio,hora_fin)
VALUES (1, '2019-9-04','08:00:00','08:30:00'); 
INSERT INTO horario (codhorario,fecha,hora_inicio,hora_fin)
VALUES (2, '2019-9-04', '08:30:00','09:00:00'); 
INSERT INTO horario (codhorario,fecha,hora_inicio,hora_fin)
VALUES (3,'2019-9-05','08:00:00','08:30:00'); 
INSERT INTO horario (codhorario,fecha,hora_inicio,hora_fin)
VALUES (4, '2019-9-05','08:30:00','09:00:00'); 

INSERT INTO cita (codcita,cliente_codcliente,doctor_coddoctor,horario_codhorario,status)
VALUES (1, 1,1,1,0); 
INSERT INTO cita (codcita,cliente_codcliente,doctor_coddoctor,horario_codhorario,status)
VALUES (2, 2,1,2,0); 
INSERT INTO cita (codcita,cliente_codcliente,doctor_coddoctor,horario_codhorario,status)
VALUES (3, 3,2,1,0); 
INSERT INTO cita (codcita,cliente_codcliente,doctor_coddoctor,horario_codhorario,status)
VALUES (4, 4,3,1,0); 


INSERT INTO resultados (codresultados,cita_codcita,Descripcion,peso,altura,temperatura)
VALUES (1, 1,"prueba de descripcion",140,1.67,37.1); 


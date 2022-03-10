-- Generado por Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   en:        2022-03-06 02:29:54 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012
--Actualizado o 07-03-2022 con sentencia de creación da base de datos.

Use master;
Go
Create Database Prosegur
Go
Use Prosegur
Go



CREATE TABLE Cliente 
    (
     DNI VARCHAR (9) NOT NULL , 
     Nombre VARCHAR (15) , 
     Apellidos VARCHAR (30) , 
     Numero_de_telefono VARCHAR (10) , 
     N_cuenta VARCHAR (24) 
    )
GO

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY CLUSTERED (DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Contrato 
    (
     ID_Contrato INTEGER NOT NULL , 
     Fecha DATETIME2 , 
     Cliente_DNI VARCHAR (9) NOT NULL 
    )
GO

ALTER TABLE Contrato ADD CONSTRAINT Contrato_PK PRIMARY KEY CLUSTERED (ID_Contrato)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Empleados 
    (
     Nombre VARCHAR (15) , 
     Apellidos VARCHAR (30) , 
     DNI VARCHAR (9) NOT NULL , 
     Horario VARCHAR (50) , 
     N_cuenta VARCHAR (24) 
    )
GO

ALTER TABLE Empleados ADD CONSTRAINT Empleados_PK PRIMARY KEY CLUSTERED (DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Equipamiento 
    (
     Clase VARCHAR (50) , 
     ID_equipamiento INTEGER NOT NULL , 
     Servicios_ID_Servicios INTEGER NOT NULL 
    )
GO

ALTER TABLE Equipamiento ADD CONSTRAINT Equipamiento_PK PRIMARY KEY CLUSTERED (ID_equipamiento)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Historial_de_servicios 
    (
     ID_historial INTEGER NOT NULL , 
     Fecha DATETIME2 , 
     Vehículos_Matricula VARCHAR (10) NOT NULL , 
     Servicios_ID_Servicios INTEGER NOT NULL , 
     Ubicación_servicios_ID_Ubicacion INTEGER NOT NULL 
    )
GO

ALTER TABLE Historial_de_servicios ADD CONSTRAINT Historial_de_servicios_PK PRIMARY KEY CLUSTERED (ID_historial)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Instalaciones 
    (
     Pais VARCHAR (30) , 
     ID_instalaciones INTEGER NOT NULL , 
     Ciudad VARCHAR (30) , 
     Calle VARCHAR (50) , 
     Portal VARCHAR (9) , 
     Piso VARCHAR (9) , 
     CP INTEGER 
    )
GO

ALTER TABLE Instalaciones ADD CONSTRAINT Instalaciones_PK PRIMARY KEY CLUSTERED (ID_instalaciones)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_28 
    (
     Servicios_ID_Servicios INTEGER NOT NULL , 
     Instalaciones_ID_instalaciones INTEGER NOT NULL 
    )
GO

ALTER TABLE Relation_28 ADD CONSTRAINT Relation_28_PK PRIMARY KEY CLUSTERED (Servicios_ID_Servicios, Instalaciones_ID_instalaciones)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_29 
    (
     Historial_de_servicios_ID_historial INTEGER NOT NULL , 
     Empleados_DNI VARCHAR (9) NOT NULL 
    )
GO

ALTER TABLE Relation_29 ADD CONSTRAINT Relation_29_PK PRIMARY KEY CLUSTERED (Historial_de_servicios_ID_historial, Empleados_DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_30 
    (
     Empleados_DNI VARCHAR (9) NOT NULL , 
     Instalaciones_ID_instalaciones INTEGER NOT NULL 
    )
GO

ALTER TABLE Relation_30 ADD CONSTRAINT Relation_30_PK PRIMARY KEY CLUSTERED (Empleados_DNI, Instalaciones_ID_instalaciones)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Servicios 
    (
     ID_Servicios INTEGER NOT NULL , 
     Descripcion VARCHAR (50) , 
     Contrato_ID_Contrato INTEGER NOT NULL 
    )
GO

ALTER TABLE Servicios ADD CONSTRAINT Servicios_PK PRIMARY KEY CLUSTERED (ID_Servicios)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Ubicación_servicios 
    (
     ID_Ubicacion INTEGER NOT NULL , 
     Ciudad VARCHAR (20) , 
     Localidad VARCHAR (30) , 
     Calle VARCHAR (50) , 
     Portal VARCHAR (7) , 
     Piso VARCHAR (5) , 
     CP INTEGER 
    )
GO

ALTER TABLE Ubicación_servicios ADD CONSTRAINT Ubicación_servicios_PK PRIMARY KEY CLUSTERED (ID_Ubicacion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Vehículos 
    (
     Matricula VARCHAR (10) NOT NULL , 
     Tipo VARCHAR (50) , 
     Kilometraje INTEGER , 
     Instalaciones_ID_instalaciones INTEGER NOT NULL 
    )
GO

ALTER TABLE Vehículos ADD CONSTRAINT Vehículos_PK PRIMARY KEY CLUSTERED (Matricula)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Contrato 
    ADD CONSTRAINT Contrato_Cliente_FK FOREIGN KEY 
    ( 
     Cliente_DNI
    ) 
    REFERENCES Cliente 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Equipamiento 
    ADD CONSTRAINT Equipamiento_Servicios_FK FOREIGN KEY 
    ( 
     Servicios_ID_Servicios
    ) 
    REFERENCES Servicios 
    ( 
     ID_Servicios 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Historial_de_servicios 
    ADD CONSTRAINT Historial_de_servicios_Servicios_FK FOREIGN KEY 
    ( 
     Servicios_ID_Servicios
    ) 
    REFERENCES Servicios 
    ( 
     ID_Servicios 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Historial_de_servicios 
    ADD CONSTRAINT Historial_de_servicios_Ubicación_servicios_FK FOREIGN KEY 
    ( 
     Ubicación_servicios_ID_Ubicacion
    ) 
    REFERENCES Ubicación_servicios 
    ( 
     ID_Ubicacion 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Historial_de_servicios 
    ADD CONSTRAINT Historial_de_servicios_Vehículos_FK FOREIGN KEY 
    ( 
     Vehículos_Matricula
    ) 
    REFERENCES Vehículos 
    ( 
     Matricula 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_28 
    ADD CONSTRAINT Relation_28_Instalaciones_FK FOREIGN KEY 
    ( 
     Instalaciones_ID_instalaciones
    ) 
    REFERENCES Instalaciones 
    ( 
     ID_instalaciones 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_28 
    ADD CONSTRAINT Relation_28_Servicios_FK FOREIGN KEY 
    ( 
     Servicios_ID_Servicios
    ) 
    REFERENCES Servicios 
    ( 
     ID_Servicios 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_29 
    ADD CONSTRAINT Relation_29_Empleados_FK FOREIGN KEY 
    ( 
     Empleados_DNI
    ) 
    REFERENCES Empleados 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_29 
    ADD CONSTRAINT Relation_29_Historial_de_servicios_FK FOREIGN KEY 
    ( 
     Historial_de_servicios_ID_historial
    ) 
    REFERENCES Historial_de_servicios 
    ( 
     ID_historial 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_30 
    ADD CONSTRAINT Relation_30_Empleados_FK FOREIGN KEY 
    ( 
     Empleados_DNI
    ) 
    REFERENCES Empleados 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_30 
    ADD CONSTRAINT Relation_30_Instalaciones_FK FOREIGN KEY 
    ( 
     Instalaciones_ID_instalaciones
    ) 
    REFERENCES Instalaciones 
    ( 
     ID_instalaciones 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Servicios 
    ADD CONSTRAINT Servicios_Contrato_FK FOREIGN KEY 
    ( 
     Contrato_ID_Contrato
    ) 
    REFERENCES Contrato 
    ( 
     ID_Contrato 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Vehículos 
    ADD CONSTRAINT Vehículos_Instalaciones_FK FOREIGN KEY 
    ( 
     Instalaciones_ID_instalaciones
    ) 
    REFERENCES Instalaciones 
    ( 
     ID_instalaciones 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

--Creación de base de datos
Drop Database If Exists DB_DPR_10_marzo
Go
Create Database DB_DPR_10_marzo
Go

--Generación de la tabla a partir de la taba Sales.SalesOreder.... de la BBDD Adventureworks2017
Use DB_DPR_10_marzo
Go
Select *into Table_dpr_10_Marzo
From AdventureWorks2017.Sales.SalesOrderHeader
Go

--Creación de la partición
Drop Database If Exists DB_DPR_10_marzo
Go
Create Database BD_DPR_10_marzo
On Primary ( Name = 'BD_DPR_10_marzo ',
Filename = 'C:\Data\BD_DPR_10_marzo_fijo.mdf' ,
SIZE = 15360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0)
LOG ON ( Name = 'BD_DPR_10_marzo_log',
Filename = 'C:\Data\BD_DPR_10_marzo_log.ldf' ,
Size = 10176KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
Go

--Creación de Filegroups
Use BD_DPR_10_marzo
Go
Alter Database [BD_DPR_10_marzo] Add Filegroup [DPR_01]
Go
Alter Database [BD_DPR_10_marzo] Add Filegroup [DPR_02]
Go
Alter Database [BD_DPR_10_marzo] Add Filegroup [DPR_03]
Go
Alter Database [BD_DPR_10_marzo] Add Filegroup [DPR_04]
Go
Alter Database [BD_DPR_10_marzo] Add Filegroup [DPR_05]
Go

--Creación de archivos
Use BD_DPR_10_marzo
Go
Alter Database [BD_DPR_10_marzo]
Add File ( Name = 'DPR_01', Filename = 'c:\DATA\DPR_01.ndf', SIZE =
5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_01]
Go
Alter Database [BD_DPR_10_marzo]
Add File ( Name = 'DPR_02', Filename = 'c:\DATA\DPR_02.ndf', SIZE = 5MB,
MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_02]
Go
Alter Database [BD_DPR_10_marzo]
Add FILE ( Name = 'DPR_03', FILENAME = 'c:\DATA\DPR_03.ndf', SIZE = 5MB,
MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_03]
Go
Alter Database [BD_DPR_10_marzo]
Add FILE ( Name = 'DPR_04', FILENAME = 'c:\DATA\DPR_04.ndf', SIZE = 5MB,
MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_04]
Go
Alter Database [BD_DPR_10_marzo]
Add FILE ( Name = 'DPR_05', FILENAME = 'c:\DATA\DPR_05.ndf', SIZE = 5MB,
MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_05]
Go

--Asignación y creación de rangos
Create Partition Function DPR_Fecha (datetime)
As Range Right
For Values ('2019-01-01','2021-01-01')
Go
Create Partition Scheme Devolucion_data
As Partition DPR_Fecha
To (DPR_01, DPR_02, DPR_03, DPR_04, DPR_05)
Go

--Creación de tablas
Use BD_DPR_10_marzo
Go
Drop Table If Exists dbo.Exame_DPR_10_Marzo_Particions
Go
Create Table dbo.Exame_DPR_10_Marzo_Particions
(ID_Alta Int Not Null,
DNI Varchar(9),
Fecha Datetime)
On Devolucion_data (Fecha)
Go

--Insección de datos
Insert Into dbo.Exame_DPR_10_Marzo_Particions
Values (1, '11111111A', '2019-03-16 10:24:44'),
(2, '22222222B', '2019-04-02 11:27:43'),
(3, '33333333C', '2019-07-19 13:45:55'),
(4, '44444444D', '2019-07-26 16:36:23'),
(5, '55555555E', '2019-08-13 12:29:28'),
(6, '66666666F', '2019-08-14 22:10:32'),
(7, '77777777G', '2019-10-03 17:38:10'),
(8, '88888888H', '2019-11-27 19:22:19'),
(9, '99999999I', '2019-11-29 12:45:51'),
(10, '10101010J', '2019-12-11 07:54:37')
Go
Insert Into dbo.Exame_DPR_10_Marzo_Particions
Values (1, '1212121K', '2020-03-16 10:24:44'),
(2, '13131313L', '2020-04-02 11:27:43'),
(3, '14141414M', '2020-07-19 13:45:55'),
(4, '15151515N', '2020-07-26 16:36:23'),
(5, '16161616Ñ', '2020-08-13 12:29:28'),
(6, '17171717O', '2020-08-14 22:10:32'),
(7, '18181818P', '2020-10-03 17:38:10'),
(8, '19191919Q', '2020-11-27 19:22:19'),
(9, '20202020R', '2020-11-29 12:45:51'),
(10, '21212121S', '2020-12-11 07:54:37')
Go
Insert Into dbo.Exame_DPR_10_Marzo_Particions
Values (1, '23232323T', '2021-03-16 10:24:44'),
(2, '24242424U', '2021-04-02 11:27:43'),
(3, '25252525V', '2021-07-19 13:45:55'),
(4, '26262626W', '2021-07-26 16:36:23'),
(5, '27272727X', '2021-08-13 12:29:28'),
(6, '28282828Y', '2021-08-14 22:10:32'),
(7, '29292929Z', '2021-10-03 17:38:10'),
(8, '30303030Q', '2021-11-27 19:22:19'),
(9, '31313131R', '2021-11-29 12:45:51'),
(10, '32323232S', '2021-12-11 07:54:37')
Go
Insert Into dbo.Exame_DPR_10_Marzo_Particions
Values (1, '77777777K', '2022-03-16 10:24:44'),
(2, '34343434T', '2022-04-02 11:27:43'),
(3, '35353535T', '2022-07-19 13:45:55'),
(4, '36363636J', '2022-07-26 16:36:23'),
(5, '37373737Ñ', '2022-08-13 12:29:28'),
(6, '38383838S', '2022-08-14 22:10:32'),
(7, '39393939R', '2022-10-03 17:38:10'),
(8, '40404040Q', '2022-11-27 19:22:19'),
(9, '41414141W', '2022-11-29 12:45:51'),
(10, '42424242Y', '2022-12-11 07:54:37')
Go

--Split
ALTER PARTITION FUNCTION Devolucion_data()
SPLIT RANGE ('2020-01-01');
GO
Use BD_DPR_10_marzo
Go
Select *,$Partition.Devolucion_data(Fecha) As Partition
From dbo.Exame_DPR_10_Marzo_Particions
Go

--Truncate
Use BD_DPR_10_marzo
Go
TRUNCATE TABLE Exame_DPR_10_Marzo_Particions
WITH (PARTITIONS (2));
go
Select * From dbo.Exame_DPR_10_Marzo_Particions
Go

--Creación de tablas temporales
Use BD_DPR_10_marzo
Go
drop table if exists Departamentos
go
drop table if exists Departamentos
go
IF OBJECT_ID('dbo.Departamentos', 'U') IS NOT NULL
BEGIN
 ALTER TABLE [dbo].[Departamentos] SET ( SYSTEM_VERSIONING =
OFF )
 DROP TABLE dbo.Departamentos
 DROP TABLE dbo.Departamentos
END
create table Info_departamentos
(DeptID int primary key clustered,
DeptName varchar (9) not null,
DeptCreado datetime2 not null,
NumEmpleados int not null,
SysStartTime datetime2 generated always as row start not null,
SysEndTime datetime2 generated always as row end not null,
period for System_time (SysStartTime,SysEndTime) )
with (System_Versioning = ON (History_Table =
dbo.Asignacion_Empleado_Servicio_historico)
)
go

--Insección de datos
Use BD_DPR_10_marzo
Go
Insert Into Info_departamentos ( [DeptID],[DeptName],[DeptCreado],[NumEmpleados] ) values
('1','Departamento_de_ventas','2021-03-10','50'),
('2','Departamento_de_bajas','2021-03-12','30'),
('3','Departamento_de_alineación','2019-07-05','100'),
('4','Departamento_de_fidelización','2020-04-10','30'),
('0','Departamento_de_la_hora','1992-01-12','5')
Go

--Ver movementos dentro da base de datos nun determinado periodo de tempo
Select * From Info_departamentos
For System_Time between '2022-03-10' and '2022-03-10'
Go
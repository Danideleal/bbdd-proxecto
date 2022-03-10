 --Creación de la base de datos:
Drop Database If Exists Prosegur_Particionado
Go
Create Database Prosegur_Particionado
On Primary ( Name = 'Prosegur_Particionado ',
Filename = 'C:\Data\Prosegur_Particionado_Fijo.mdf' ,
SIZE = 15360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 0)
LOG ON ( Name = 'Prosegur_Particionado_log',
Filename = 'C:\Data\Prosegur_Particionado_log.ldf' ,
Size = 10176KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
Go
Use Prosegur_Particionado
Go
 --Creación de los Filegroups:
Use Prosegur_Particionado
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_Archivo]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2019]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2020]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2021]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2022]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2023]
Go
Alter Database [Prosegur_Particionado] Add Filegroup [DPR_2024]
Go
 --Procedemos a la creación de los archivos:
Use Prosegur_Particionado
Go
Alter Database [Prosegur_Particionado]
Add File ( Name = 'Altas_Archivo', Filename = 'c:\DATA\Altas_Archivo.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_Archivo]
Go
Alter Database [Prosegur_Particionado]
Add File ( Name = 'Altas_2019', Filename = 'c:\DATA\Altas_2019.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2019]
Go
Alter Database [Prosegur_Particionado]
Add FILE ( Name = 'Altas_2020', FILENAME = 'c:\DATA\Altas_2020.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2020]
Go
Alter Database [Prosegur_Particionado]
Add FILE ( Name = 'Altas_2021', FILENAME = 'c:\DATA\Altas_2021.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2021]
Go
Alter Database [Prosegur_Particionado]
Add FILE ( Name = 'Altas_2022', FILENAME = 'c:\DATA\Altas_2022.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2022]
Go
Alter Database [Prosegur_Particionado]
Add FILE ( Name = 'Altas_2023', FILENAME = 'c:\DATA\Altas_2023.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2023]
Go
Alter Database [Prosegur_Particionado]
Add FILE ( Name = 'Altas_2024', FILENAME = 'c:\DATA\Altas_2024.ndf', SIZE = 5MB, MAXSIZE = 100MB, FILEGROWTH = 2MB )
To Filegroup [DPR_2024]
Go
 --Creación de rangos de fechas
Use Prosegur_Particionado
Go
Create Partition Function Altas_Fecha (datetime)
As Range Right
	For Values ('2019-01-01','2021-01-01')
Go
 --Asignación de rangos y creación de una tabla de ejemplo
Use Prosegur_Particionado
Go
Create Partition Scheme Devolucion_data
As Partition Altas_Fecha
	To (DPR_Archivo, DPR_2019, DPR_2020, DPR_2021, DPR_2022, DPR_2023, DPR_2024)
Go
Drop Table If Exists dbo.AltasDPR
Go
Create Table dbo.AltasDPR
(ID_Alta Int Not Null,
DNI Varchar(9),
Fecha Datetime)
On Devolucion_data
(Fecha)
Go
 --Generaremos los datos de las altas en las tablas
Use Prosegur_Particionado
Go
Insert Into dbo.AltasDPR
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
Insert Into dbo.AltasDPR
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
Insert Into dbo.AltasDPR
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
Insert Into dbo.AltasDPR
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
 --TRUCATE
Use Prosegur_Particionado
Go
TRUNCATE TABLE AltasDPR
WITH (PARTITIONS (3));
go
Select * From dbo.AltasDPR
Go
 --SWITCH
Use Prosegur_Particionado
Go
Create Table dbo.BajasDPR(
ID_Baja Int Not Null,
DNI Varchar(9),
Fecha Datetime
)
On Bajas_DPR
Go
Use Prosegur_Particionado
Go
Alter Table dbo.AltasDPR
Switch Partition 1 To dbo.BajasDPR
Go
 --Merge
Use Prosegur_Particionado
Go
Alter Partition Function Devolucion_data ()
Merge Range ('2022-01-01')
Go




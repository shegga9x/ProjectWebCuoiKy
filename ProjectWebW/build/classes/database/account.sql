create database java;
go
USE java
set dateformat DMY;
go
CREATE TABLE users (
   username   VARCHAR(45) NOT NULL,
   password VARCHAR(45)   NOT NULL,
   firstName  VARCHAR(45) NOT NULL,
   lastName VARCHAR(45)   NOT NULL,
   PRIMARY KEY (username)
) ;

INSERT INTO users values ( 'sa','sa','phung', 'le dinh') ;
select * from users


CREATE TABLE SanPham (
   id   VARCHAR(45)		NOT NULL,
   name NVARCHAR(45)		NOT NULL,
   gia  int		NOT NULL,
   loai varchar(45) NOT NULL,
   sluong int,
   filename1 VARCHAR(45) NOT NULL,
   description  VARCHAR(max),
   PRIMARY KEY (id)
) ;

INSERT INTO SanPham values ( 'dt01',N'Iphone12 Mini',120,'dienthoai',100,'dienthoai1','') ;
INSERT INTO SanPham values ( 'dt02',N'Iphone 5s kim cương',120,'dienthoai',100,'dienthoai2','') ;
INSERT INTO SanPham values ( 'dt03',N'SamSung Fold',120,'dienthoai',100,'dienthoai3','') ;
INSERT INTO SanPham values ( 'dt04',N'Iphone SE2020',120,'dienthoai',100,'dienthoai4','') ;
INSERT INTO SanPham values ( 'dt05',N'Nokia 1280',120,'dienthoai',100,'dienthoai5','') ;
INSERT INTO SanPham values ( 'dt06',N'Iphone 3GS',120,'dienthoai',100,'dienthoai6','') ;
INSERT INTO SanPham values ( 'dt07',N'Điện thoại bàn',120,'dienthoai',100,'dienthoai7','') ;
INSERT INTO SanPham values ( 'dt08',N'Điện thoại cổ',120,'dienthoai',100,'dienthoai8','') ;
INSERT INTO SanPham values ( 'dt09',N'Iphone 10XXX',120,'dienthoai',100,'dienthoai9','') ;
INSERT INTO SanPham values ( 'dt10',N'Rog 3',120,'dienthoai',100,'dienthoai10','') ;
INSERT INTO SanPham values ( 'dt11',N'SamSung S2',120,'dienthoai',100,'dienthoai11','') ;

INSERT INTO SanPham values ( 'dh01',N'Đồng hồ Elsa',120,'dongho',100,'dongho1','') ;
INSERT INTO SanPham values ( 'dh02',N'Casio A159WA',120,'dongho',100,'dongho2','') ;
INSERT INTO SanPham values ( 'dh03',N'Casio W217H',120,'dongho',100,'dongho3','') ;
INSERT INTO SanPham values ( 'dh04',N'Đồng hồ quả quít',120,'dongho',100,'dongho4','') ;
INSERT INTO SanPham values ( 'dh05',N'G-Shock',120,'dongho',100,'dongho5','') ;
INSERT INTO SanPham values ( 'dh06',N'G-Shock GA700',120,'dongho',100,'dongho6','') ;
INSERT INTO SanPham values ( 'dh07',N'GDucky',120,'dongho',100,'dongho7','') ;
INSERT INTO SanPham values ( 'dh08',N'Hublot Classic 582',120,'dongho',100,'dongho8','') ;
INSERT INTO SanPham values ( 'dh09',N'Rolex',120,'dongho',100,'dongho9','') ;
INSERT INTO SanPham values ( 'dh10',N'Đồng hồ điện tử treo tường',120,'dongho',100,'dongho10','') ;
INSERT INTO SanPham values ( 'dh11',N'Đồng hồ treo tường',120,'dongho',100,'dongho11','') ;

INSERT INTO SanPham values ( 'pk01',N'AirPods',120,'phukien',100,'phukien1','') ;
INSERT INTO SanPham values ( 'pk02',N'USB',120,'phukien',100,'phukien2','') ;
INSERT INTO SanPham values ( 'pk03',N'Tai nghe',120,'phukien',100,'phukien3','') ;
INSERT INTO SanPham values ( 'pk04',N'Dây sạc Anroid',120,'phukien',100,'phukien4','') ;
INSERT INTO SanPham values ( 'pk05',N'Dây sạc apple',120,'phukien',100,'phukien5','') ;
INSERT INTO SanPham values ( 'pk06',N'Sony MDR XB55AP',120,'phukien',100,'phukien6','') ;
INSERT INTO SanPham values ( 'pk07',N'Miếng dán màn hình',120,'phukien',100,'phukien7','') ;
INSERT INTO SanPham values ( 'pk08',N'Ốp Lưng',120,'phukien',100,'phukien8','') ;
INSERT INTO SanPham values ( 'pk09',N'Razer Hammer Wire Less',120,'phukien',100,'phukien9','') ;
INSERT INTO SanPham values ( 'pk10',N'Sạc dự phòng',120,'phukien',100,'phukien10','') ;
INSERT INTO SanPham values ( 'pk11',N'Sạc Nhanh Apple',120,'phukien',100,'phukien11','') ;

INSERT INTO SanPham values ( 'tb01',N'Amazon Fire 7',120,'tablet',100,'tablet1','') ;
INSERT INTO SanPham values ( 'tb02',N'Ipad 2099',120,'tablet',100,'tablet2','') ;
INSERT INTO SanPham values ( 'tb03',N'Ipad Kid',120,'tablet',100,'tablet3','') ;
INSERT INTO SanPham values ( 'tb04',N'Ipad Pro 2020',120,'tablet',100,'tablet4','') ;
INSERT INTO SanPham values ( 'tb05',N'Ipad Mini 2',120,'tablet',100,'tablet5','') ;
INSERT INTO SanPham values ( 'tb06',N'Joy Tab',120,'tablet',100,'tablet6','') ;
INSERT INTO SanPham values ( 'tb07',N'Lenoavo Tab M8',120,'tablet',100,'tablet7','') ;
INSERT INTO SanPham values ( 'tb08',N'Xgody',120,'tablet',100,'tablet8','') ;
INSERT INTO SanPham values ( 'tb09',N'LG Tablet',120,'tablet',100,'tablet9','') ;
INSERT INTO SanPham values ( 'tb10',N'SamSung Tab 6',120,'tablet',100,'tablet10','') ;
INSERT INTO SanPham values ( 'tb11',N'Fire 7 Kid',120,'tablet',100,'tablet11','') ;

select * from SanPham

CREATE TABLE PImg (
   idP   VARCHAR(45)		NOT NULL,
   name NVARCHAR(45)		NOT NULL,
   PRIMARY KEY (idP,name)
) ;

INSERT INTO PImg values ( 'dt01','dienthoai1a') ;
INSERT INTO PImg values ( 'dt01','dienthoai1b') ;
INSERT INTO PImg values ( 'dt01','dienthoai1c') ;

select * from PImg where idP = 'dt01'

CREATE TABLE CART (
   idU   VARCHAR(45)		NOT NULL,
   total  int		NOT NULL,
   PRIMARY KEY (idU)
) ;
INSERT INTO CART values ( 'sa',0) ;
select * from CART where idU ='sa';

CREATE TABLE CARTitem (
   idU   VARCHAR(45)		NOT NULL,
   idP   VARCHAR(45)		NOT NULL,
   sluong int,
   PRIMARY KEY (idU,idP)
  
) ;

INSERT INTO CARTitem values ( 'sa','dt02',3) ;
INSERT INTO CARTitem values ( 'sa','dt03',2) ;
INSERT INTO CARTitem values ( 'sa','dt04',1) ;
INSERT INTO CARTitem values ( 'sa','dt05',1) ;
INSERT INTO CARTitem values ( 'sa','dt06',3) ;

select sp.*,ci.sluong as sl from CART c join CARTitem ci on c.idU = ci.idU  join SanPham sp on sp.id = ci.idP where c.idU = 'sa' 

select sluong from CARTitem where idP = 'dt01' and idU = 'sa'
select * from CARTitem
UPDATE CARTitem SET [idP] = 'sa',[sluong] = 9 WHERE idU = 'dt02' 

select * from CART

CREATE TABLE Receipt (
   idR   VARCHAR(45)		NOT NULL,
   idU   VARCHAR(45)		NOT NULL,
   PRIMARY KEY (idR)
) ;
select * from Receipt
select sluong from SanPham where id = 'dh01'
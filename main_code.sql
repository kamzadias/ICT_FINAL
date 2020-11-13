/*
CREATE TABLE Region (
Region_ID INT PRIMARY KEY,
Region_name CHAR(32),
Number_of_farms INT);

CREATE TABLE Farm (
Farm_ID INT PRIMARY KEY,
Farm_name VARCHAR(50),
Amount_of_livestock INT,
Farm_contact BIGINT,
Region_ID INT,
FOREIGN KEY (Region_ID) REFERENCES Region(Region_ID));

CREATE TABLE Farm_direction(
Farm_direction VARCHAR(50) PRIMARY KEY,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Livestock(
Livestock_id INT PRIMARY KEY,
Cow_number INT,
Horse_number INT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID),
Farm_direction VARCHAR(50),
FOREIGN KEY (Farm_direction) REFERENCES Farm_direction(Farm_direction));

CREATE TABLE Breeds(
Breeds_id INT PRIMARY KEY,
Breeds_name VARCHAR(50),
Origin VARCHAR(50),
Avg_price BIGINT,
Livestock_id INT ,
FOREIGN KEY (Livestock_id) REFERENCES Livestock(Livestock_id),
Farm_ID INT ,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID),
Farm_direction VARCHAR(50) ,
FOREIGN KEY (Farm_direction) REFERENCES Farm_direction(Farm_direction));

CREATE TABLE Import(
Import_id INT PRIMARY KEY,
Import_country VARCHAR(50),
Import_animal VARCHAR(20),
Amount_of_animal DEC(50),
Import_price BIGINT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Export(  
Export_id INT PRIMARY KEY,
Export_country VARCHAR(50),
Export_animal VARCHAR(20),
Amount_of_animal DEC(50),
Export_price BIGINT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Farm_equipments(
Farm_equipments_ID INT PRIMARY KEY,
Equipment_name VARCHAR(50),
Description VARCHAR(100),
Equipment_amount DEC(50),
Equipment_price BIGINT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Farm_production(
Farm_production_ID INT PRIMARY KEY,
Production_type VARCHAR(50),
Cooperation VARCHAR(667),
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Finance(
Subsidy BIGINT,
Annual_Income BIGINT,
Annual_Outcome BIGINT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));

CREATE TABLE Employee(
Director_name VARCHAR(500),
Contact_number BIGINT,
Farm_ID INT,
FOREIGN KEY (Farm_ID) REFERENCES Farm(Farm_ID));
*/

/*
INSERT INTO Region(Region_ID, Region_name, Number_of_farms)
VALUES
(05, 'Almaty', 18),
(03, 'Akmola', 12),
(13, 'Turkestan', 27),
(16, 'East Kazakhstan', 56),
(10, 'Kostanay', 14),
(15, 'North Kazakhstan', 32),
(04, 'Aktobe', 11),
(07, 'West Kazakhstan', 28),
(09, 'Karagandy', 4),
(08, 'Zhambyl', 3);

INSERT INTO Farm(Farm_ID, Farm_name, Amount_of_livestock, Farm_contact, Region_ID)
VALUES
(101, 'Qoshke', 1200, 87020235555, 05),
(102, 'Kyzylashi', 800, 87716667777, 16),
(103, 'Batys Marka Lamb itd.', 2400, 87716665555, 07),
(104, 'Karasu-Et LLP', 400, 87774637777, 10),
(105, 'Kostanay Agra Product LLP', 1100, 87059822222, 10),  
(106, 'Karagandy Aray KZ', 740, 87017025555, 09),
(107, 'Aktobe Meat Klaster', 3200, 87059422222, 04),
(108, 'EURASIA INVEST LTD', 1700,  87771961111, 09),
(109, 'GOLDEM CAMEL LTD GROUP', 4200, 87775878888, 13),  
(110, 'GorMolZavod', 1300,  87778367777, 05);

INSERT INTO Farm_direction(Farm_ID, Farm_direction)
VALUES
(101, 'M1 farm'), 
(102, 'M2 farm'),
(103, 'M3 farm'),
(104, 'Mt1 farm'),
(105, 'Mt2 farm'),  
(106, 'D1 farm'),
(107, 'M4 farm'),
(108, 'D2 farm'),
(109, 'M5 farm'),
(110, 'M6 farm');

INSERT INTO Livestock(Livestock_id, Cow_number, Horse_number, Farm_ID, Farm_direction)
VALUES
(001,NULL,1200,101,'M1 farm'),
(002,NULL,800,102,'M2 farm'),
(003,1900,500,103,'M3 farm'),
(004,400,NULL,104,'Mt1 farm'),
(005,950,250,105,'Mt2 farm'),
(006,630,110,106,'D1 farm'),
(007,2100,1100,107,'M4 farm'),
(008,1700,NULL,108,'D2 farm'),
(009,2500,1700,109,'M5 farm'),
(010,1300,NULL,110,'M6 farm');

INSERT INTO Breeds(Breeds_id, Breeds_name, Origin, Avg_price,Livestock_id, Farm_ID, Farm_direction)
VALUES
(0001,'Cherno-pestriy','Holland',500000,001,107,'M4 farm'),
(0002,'Holstein-Frisian','Canada',1800000,003,103,'M3 farm'),
(0003,'Red-motley','Western Siberia',800000,004,107,'M4 farm'),
(0004,'Alatau','Kazakhstan',700000,001,103,'M3 farm'),
(0005,'Semital','Russian',400000,001,104,'Mt1 farm'),
(0006,'Kazakh white-headed','Kazakhstan',900000,001,108,'D2 farm'),
(0007,'Hereford','Great Britain',1500000,001,105,'Mt2 farm'),
(0008,'Aberdeen Angus','Scotland',2100000,001,109,'M5 farm'),
(0009,'Kalmyk','Japan',500000,001,106,'D1 farm'),
(0010,'Aulekolskaya','Kazakhstan',400000,001,106,'D1 farm'),
(0011,'Kabardinskaya','Kazakhstan',1400000,001,102,'M2 farm'),
(0012,'Canadian','Canada',1800000,001,101,'Mt2 farm');

INSERT INTO Import(Import_id, Import_country, Import_animal,Amount_of_animal, Import_price, Farm_ID)
VALUES(000001,'China','Horse',59,23000000,101),
(000002,'China','Horse',2,2410000,102),
(000003,'Canada','Horse',5,700000,103),
(000004,'USA','Cow',10,14400000,104),
(000005,'China','Cow',14,18074000,105),
(000006,'Turkey','Cow',2,4122000,106),
(000007,'China','Cow',6,955000,107),
(000008,'Japan','Cow',12,1973300,108),
(000009,'China','Horse',11,17741000,109),
(000010,'Shotland','Cow',2,4491000,110);

INSERT INTO Export(Export_ID, delivered_country, Export_country ,Amount_of_animal, Export_price, Farm_ID)
VALUES(00001,'China','Horse',37,50010000,101),
(00002,'China','Horse',19,25007700,102),
(00003,'German','Horse',57,79500400,103),
(00004,'Shotland','Cow',24,54120000,104),
(00005,'China','Cow',10,15774000,105),
(00006,'German','Cow',98,115522000,106),
(00007,'Japan','Cow',57,61525000,107),
(00008,'China','Dairy products',NULL,2273300,108),
(00009,'German','Dairy products',NULL,1471000,109),
(00010,'German','Dairy products',NULL,6641000,110);

INSERT INTO Farm_equipments(Farm_equipments_ID, Equipment_name, Description, Equipment_amount, Equipment_price, Farm_ID)
VALUES
(81,'tractor','An engineering vehicle specifically designed to deliver a high tractive effort at slow speeds',10,85700000,101),
(82,'milking machines','Milking of dairy animals, especially of dairy cattle, without human labour',150,15700000,109),
(83,'milking machines','Milking of dairy animals, especially of dairy cattle, without human labour',190,21000000,110),
(84,'bointer machine','Measurement of the length of livestock',2,9000000,102),
(85,'bointer machine','Measurement of the length of livestock',1,4500000,103),
(86,'tractor','An engineering vehicle specifically designed to deliver a high tractive effort at slow speeds',25,145000000,104),
(87,'bointer machine','Measurement of the length of livestock',2,9000000,105),
(88,'milking machines','Milking of dairy animals, especially of dairy cattle, without human labour',170,60845500,107),
(89,'bointer machine','Measurement of the length of livestock',1,4500000,106),
(90,'tractor','An engineering vehicle specifically designed to deliver a high tractive effort at slow speeds',11,9000000,108);

INSERT INTO Farm_production(Farm_production_ID , Production_type , Cooperation ,Farm_ID )
VALUES(1001,'Meat','8 butcher shops',101),
(1002,'Meat','4 butcher shops',102),
(1003,'Meat','7 butcher shops',103),
(1004,'Meat','12 butcher shops',104),
(1005,'Meat','8 butcher shops',105),
(1006,'Meat','9 butcher shops',106),
(1007,'Meat','15 butcher shops',107),
(1008,'Dairy product','2 dairy factories',108),
(1009,'Dairy product','7 dairy factories',109),
(1010,'Dairy product','3 dairy factories',110);


INSERT INTO Finance(Subsidy ,Annual_Income , Annual_Outcome , Farm_ID)
VALUES(250000000,120000000,45000000,101),
(250000000,90000000,40000000,102),
(250000000,150000000,24000000,103),
(250000000,120000000,45000000,104),
(250000000,190000000,68000000,105),
(250000000,1870000000,54000000,106),
(250000000,890000000,15000000,107),
(250000000,1650000000,72000000,108),
(250000000,9120000000,215000000,109),
(250000000,6120000000,145000000,110);

INSERT INTO Employee(Director_name , Contact_number ,Farm_ID )
VALUES('Zhanbyl Magazov',87052910505,101),
('Sagintay Zhalelov',87054110505,102),
('Zhanayis Askarov',87011510505,103),
('Alibek Abylov',8707888484,104),
('Samat Myrzakulov',87011454559,105),
('Ebrat Kim',87077777770,106),
('Tagir Baianov',87022265656,107),
('Zhan Zhanabulov',87068979779,108),
('Yesentay Tolepov',87017791917,109),
('Sabir Khaidar',87018484654,110);
*/

/*
ALTER TABLE Region ALTER Region_name SET NOT NULL;
ALTER TABLE Employee ADD CONSTRAINT Employee_pkey1 PRIMARY KEY (Director_name);
ALTER TABLE Employee ADD hire_date DATE;
ALTER TABLE Farm_equipments ALTER COLUMN Description TYPE VARCHAR(150);
ALTER TABLE Employee DROP hire_date;
*/

/*
UPDATE Region SET Number_of_farms=20 WHERE Region_ID=05;
UPDATE Farm SET Farm_name='Kublei LLP' WHERE Region_ID='07';
UPDATE Farm_direction SET Farm_ID=102 WHERE farm_direction='M1 farm';
UPDATE Livestock SET Cow_number=250 WHERE Farm_direction LIKE 'D%';
UPDATE Breeds SET Avg_price=50000 WHERE Breeds_name='Kalmyk';
UPDATE Import SET Import_country='USA' WHERE Import_animal='Horse';
UPDATE Export SET Export_animal='Cow' WHERE Export_country='China';
UPDATE Farm_equipments SET Equipment_amount=5 WHERE Equipment_name LIKE 't%';
UPDATE Farm_production SET Production_type='Cows milk' WHERE Farm_ID=102;
UPDATE Finance SET Annual_Income=10000,Annual_Outcome=1 WHERE Farm_ID=102;
UPDATE Employee SET Director_name='Erke Diasov' WHERE Director_name='Sabir Khaidar';
*/

--DELETE FROM Breeds WHERE Breeds_name='Red-motley';
--DELETE FROM Import WHERE Import_country='Japan';
--DELETE FROM Export WHERE Amount_of_animal>=20;
--DELETE FROM Farm_equipments WHERE Equipment_price=9000000;
--DELETE FROM Farm_production WHERE Production_type LIKE 'Meat';
--DELETE FROM Finance WHERE Annual_Income>90000000 and Annual_Outcome<68000000;
--DELETE FROM Employee WHERE Farm_ID=109;
--DELETE FROM Livestock WHERE Cow_number=1200 ;
--DELETE FROM Region WHERE Region_ID=03;
--DELETE FROM Farm WHERE Region_ID=01;

/*
SELECT COUNT(DISTINCT Import_country) AS Imsport_country_number,MAX(Import_price) AS Max_Import_price,MIN(Import_price) AS Min_Import_price ,
COUNT(DISTINCT Export_country) Export_country_number,
MAX(Export_price) Max_Export_price,MIN(Export_price) AS Min_Export_price FROM Import,Export WHERE Export.Farm_ID=Import.Farm_ID

SELECT COUNT(Farm_ID),Director_name FROM Employee WHERE Farm_ID > 108 and Director_name LIKE 'S%' GROUP BY Director_name

SELECT round(AVG(Subsidy),0) AS Average_Subsidy,round(AVG(Annual_Income),0) AS Average_Annual_Income,round(AVG(Annual_Outcome),0)
AS Average_Annual_Outcome
FROM Finance WHERE Farm_ID BETWEEN 105 and 108 

SELECT Farm_name,Amount_of_livestock FROM Farm WHERE (Farm_name='GorMolZavod') OR (Amount_of_livestock<1200) OR (Farm_ID IN (107)) 

SELECT Breeds_name,SUM(Avg_price) FROM Breeds WHERE Breeds.Origin LIKE 'K%' OR Breeds.Origin LIKE '%a' GROUP BY Breeds_name ;

SELECT Equipment_name,SUM(Equipment_price) AS Equipment_price,Description FROM Farm_equipments 
WHERE LENGTH(Description)<39 OR Equipment_name='tractor' GROUP BY Equipment_name,Description ;

SELECT Region.Region_name ,Farm.Farm_name,Employee.Director_name FROM Region INNER JOIN Farm ON Region.Region_ID = Farm.Region_ID 
INNER JOIN Employee ON Employee.Farm_ID = Farm.Farm_ID

SELECT Farm.Farm_name,Livestock.Farm_direction,Breeds.Breeds_name FROM Farm FULL JOIN Livestock ON Farm.Farm_ID=Livestock.Farm_ID 
FULL JOIN Breeds ON Breeds.Livestock_id = Livestock.Livestock_ID

SELECT Farm.Farm_name,Farm_direction.Farm_direction,Import.Import_price FROM Farm_direction RIGHT JOIN Farm ON Farm.Farm_ID=Farm_direction.Farm_ID 
RIGHT JOIN Import ON Import.Farm_id = Farm.Farm_ID

SELECT Employee.Director_name,Farm.Farm_name,Livestock.Cow_number,Livestock.Horse_number,Farm_production.Production_type FROM Employee LEFT JOIN Farm ON Employee.Farm_ID=Farm.Farm_ID 
LEFT JOIN Livestock ON Livestock.Farm_id = Farm.Farm_ID LEFT JOIN Farm_production ON Farm_production.Farm_id = Farm.Farm_ID
*/
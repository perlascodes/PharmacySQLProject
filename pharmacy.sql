CREATE DATABASE PharmacyManagment
CREATE TABLE doctor (
license_id NUMERIC(10) NOT NULL
CONSTRAINT license_id_pk PRIMARY KEY,
speciality VARCHAR(20),
Fname VARCHAR(20),
Lname VARCHAR(20),
address VARCHAR(100),
telephone NUMERIC(10));

CREATE TABLE medicine(
approvalNb NUMERIC(10) NOT NULL
CONSTRAINT approvalNb_pk PRIMARY KEY,
publicName VARCHAR(100)
CONSTRAINT publicName_nn NOT NULL,
prodDate DATE
CONSTRAINT prodDate_nn NOT NULL,
genericName VARCHAR(100)
CONSTRAINT genericName_nn NOT NULL,
expDate DATE 
CONSTRAINT expDate_nn NOT NULL,
quantity NUMERIC (10)
CONSTRAINT  quantity_nn NOT NULL);

ALTER TABLE medicine 
ADD class VARCHAR(100);
ALTER TABLE medicine
ADD prce VARCHAR(10);
ALTER TABLE medicine
ADD type VARCHAR(100);


CREATE TABLE employee (
pharmacistId NUMERIC(10) NOT NULL
CONSTRAINT pharmacistId_pk PRIMARY KEY, 
Fname VARCHAR(100), 
Lname VARCHAR(100)
CONSTRAINT Lname_nn NOT NULL, 
position VARCHAR(100)
CONSTRAINT postion_nn NOT NULL,
username VARCHAR(100)
CONSTRAINT username_nn NOT NULL,
address VARCHAR(100),
telephone NUMERIC(10),
email VARCHAR(100));

ALTER TABLE employee
ADD hireDate DATE;
ALTER TABLE employee
ADD salary VARCHAR(10);

CREATE TABLE contract(
contractID NUMERIC(10)NOT NULL
CONSTRAINT contract_id_pk PRIMARY KEY,
dateOn DATE 
CONSTRAINT dateOn_nn NOT NULL,
dateTo DATE
CONSTRAINT dateTo_nn NOT NULL);


CREATE TABLE medicine_manifacturer(
companyId NUMERIC(10) NOT NULL
CONSTRAINT companyId_pk PRIMARY KEY,
contractID NUMERIC (10)
CONSTRAINT fk_contractId FOREIGN KEY(contractID)
REFERENCES contract (contractID),
telephone NUMERIC(10),
compName VARCHAR (100)
CONSTRAINT compName_nn NOT NULL, 
address VARCHAR(100));


CREATE TABLE prescribe (
number NUMERIC(10)
CONSTRAINT number_nn NOT NULL, 
dosage NUMERIC (10)
CONSTRAINT dosage_nn  NOT NULL, 
quantity NUMERIC(10)
CONSTRAINT quantity_nn NOT NULL,
datePresc DATE
CONSTRAINT datePresc_nn NOT NULL , 
license_id NUMERIC(10) REFERENCES doctor (license_id),
approvalNb NUMERIC(10) REFERENCES medicine(approvalNb),
CONSTRAINT pres_pk PRIMARY KEY (license_id, approvalNb)); 

ALTER TABLE prescribe
ALTER COLUMN dosage VARCHAR(100);

ALTER TABLE prescribe
ADD CONSTRAINT dosage_ck CHECK(quantity<3);

CREATE TABLE supply_by (
supplyDate DATE
CONSTRAINT supplyDate_nn NOT NULL, 
supplier VARCHAR (100)
CONSTRAINT supplier_nn NOT NULL, 
suppliedQuant NUMERIC(10)
CONSTRAINT suppliedQuant_nn NOT NULL, 
approvalNb NUMERIC(10) REFERENCES medicine(approvalNb),
companyId NUMERIC(10) REFERENCES medicine_manifacturer (companyId)
CONSTRAINT supp_pk PRIMARY KEY(  approvalNb, companyId));

CREATE TABLE sold_by(
purchDate DATE 
CONSTRAINT purchDate_nn NOT NULL, 
quantity NUMERIC(10),
approvalNb NUMERIC(10) REFERENCES medicine(approvalNb),
pharmacistId NUMERIC(10)  REFERENCES employee (pharmacistId), 
CONSTRAINT sold_pk PRIMARY KEY (approvalNb, pharmacistId));


INSERT INTO doctor( license_id,speciality,Fname,Lname,address,telephone)
 VALUES ('663122','Psychiatrist','Mark','Beningtone','Wall Street 22','223101');

 INSERT INTO doctor VALUES('212003','Dermatologist','Kate','Stone','Willingtone 32','232868');
 INSERT INTO doctor VALUES('661303','Pediatric','Mirinda','Haile','High Street 22','07223991');
 INSERT INTO doctor VALUES('551301','Gynecologist','Tom','Hamiltone','Peper Street 338','077225603');
 INSERT INTO doctor VALUES('600525','Pediatric','Peter','Wallie','Hanks Street 677','077248881');
 INSERT INTO doctor VALUES('220306','Immunologist','Igor','Mayeks','Samsens Street 55','070229901');
 INSERT INTO doctor VALUES('113303','Dermatologist','Ron','Terreny','Mickle Jakson  333','666203');

INSERT INTO medicine VALUES('11556112','Aerius','2017-12-06','Desoratadine','2019-12-10','10','Antihistamine','200 DEN','Blister');
INSERT INTO medicine VALUES('1169102','Almacin','2015-11-02','Amoxicilin','2019-11-11','100','Antibiotic','350 DEN','Pill');
INSERT INTO medicine VALUES('18697413','Betametazon','2016-03-19','Betametasone','2019-12-11','50','Corticosteroid','235 DEN','Ointment');
INSERT INTO medicine VALUES('15355212','Amoksiklavx2','2015-03-03','AmoxicilineAcid','2019-02-15','10','Antibiotic','330 DEN','Solution');
INSERT INTO medicine VALUES('11162311','Ketanol','2015-06-06','Ketoprofen','2019-09-03','88','Corticosteroid','440 DEN','Ointment');
INSERT INTO medicine VALUES('13225217','Paracetamol','2014-12-03','Paracetamol','2019-12-30','500','Antipyritics','25 DEN','BlisterTablet');
INSERT INTO medicine VALUES('14331112','DiastopProbio','2016-03-02','LactobacilusBifidobacterusStrept','2019-05-19','120','Digestive-antidiarretic','450 DEN','BlisterTablet');
INSERT INTO medicine VALUES('16112214','Diazepam','2014-06-12','Diazepam','2014-04-13','220','Antianxiety','130 DEN','Suppository');
INSERT INTO medicine VALUES('12445210','CVitamin','2015-05-12','CitricAcid','2019-10-15','100','Vitamins','330 DEN','Tablets');
INSERT INTO medicine VALUES('14436203','ACC','2016-03-15','Acetylcysteine','2019-11-12','100','Vitamins','110 DEN','EffervescentTablet');


INSERT INTO employee VALUES('0405997431','Marta','Smith','Pharmacologist','MarSmi','Rusveltova 23','070661232','smithmarta@yahoo.com','2016-03-02','32000');
INSERT INTO employee VALUES('5102991534','Hristina','Popovski','Technician','Hripi','Car Samoil 33','071332515','hristinapopovski@yahoo.com','2016-05-04','26600');
INSERT INTO employee VALUES('0804931182','Marjan','Verter','Technician','MaVi','Main Street 27','07112013','marjanvert@gmail.com','2015-03-03','30500');
INSERT INTO employee VALUES('0912990120','Veljan','Parsh','Pharmacist','VeljPar','Turisticka 223','077621322','veljanparsh@hotmail.com','2017-05-05','23500');
INSERT INTO employee VALUES('0303993156','Ivan','Krstani','Pharmacist','IvKi','Zeleznicka 22','070315666','ivankrstani@gmail.com','2015-09-09','24000');

INSERT INTO contract VALUES('66101','2016-12-30','2020-12-30');
INSERT INTO contract VALUES('66203','2015-11-14','2019-11-14');
INSERT INTO contract VALUES('73804','2016-10-12','2020-10-12');
INSERT INTO contract VALUES('75446','2014-09-14','2019-09-14');
INSERT INTO contract VALUES('81509','2015-12-03','2020-12-03');
INSERT INTO contract VALUES('88109','2014-11-12','2019-11-12');

INSERT INTO medicine_manifacturer VALUES('615312','66101','003212177','Krka AD','Novo Mesto Slovenija');
INSERT INTO medicine_manifacturer VALUES('513222','66203','443122777','BAYER AD','Leverkuseln Germany');
INSERT INTO medicine_manifacturer VALUES('600221','73804','031221435','Alkaloid AD','Alexander the Great Boul');
INSERT INTO medicine_manifacturer VALUES('544377','75446','055113322','Jaka 80 DOO','Prvomajska Radovish');
INSERT INTO medicine_manifacturer VALUES('664532','81509','046121333','Belupo AD','Josip Vargovic HR');
INSERT INTO medicine_manifacturer VALUES('599413','88109','045113212','Galenika DOO','Zemun Srbija');

INSERT INTO prescribe VALUES('311','1 per day','1','2017-08-08','212003','11556112');
INSERT INTO prescribe VALUES('212','3 per day','1','2017-12-16','661303','15355212');
INSERT INTO prescribe VALUES('111','1/2 per day','2','2017-02-02','551301','13225217');
INSERT INTO prescribe VALUES('121','1 per day','1','2017-12-08','113303','14331112');
INSERT INTO prescribe VALUES('222','1 per day','1','2017-08-08','661303','16112214');


INSERT INTO sold_by VALUES('2017-12-08','3','11556112','0405997431');
INSERT INTO sold_by VALUES('2017-12-03','5','1169102','5102991534');
INSERT INTO sold_by VALUES('2017-11-11','4','18697413','0804931182');
INSERT INTO sold_by VALUES('2017-11-08','11','11162311','0912990120');
INSERT INTO sold_by VALUES('2017-11-02','23','13225217','0303993156');
INSERT INTO sold_by VALUES('2017-10-30','44','12445210','0405997431');

INSERT INTO supply_by VALUES('2017-12-10','Farma Trejd','230','11556112','615312');
INSERT INTO supply_by VALUES('2016-11-03','Evropa Lek DOO','400','1169102','513222');
INSERT INTO supply_by VALUES('2016-06-06','Zegin DOO','100','18697413','600221');
INSERT INTO supply_by VALUES('2016-08-03','EUROFARM DOO','140','11162311','544377');
INSERT INTO supply_by VALUES('2015-03-03','Rifarm DOO','150','13225217','664532');
INSERT INTO supply_by VALUES('2017-12-10','ROSH DOOEL','200','12445210','599413');
INSERT INTO supply_by VALUES('2017-08-19','Farma Trejd','220','15355212','615312');
INSERT INTO supply_by VALUES('2017-11-28','ROSH DOOEL','120','14436203','599413');
INSERT INTO supply_by VALUES('2017-10-04','Zegin DOO','100','14331112','600221');
INSERT INTO supply_by VALUES('2017-12-03','EUROFARM DOO','150','16112214','544377');

/*Creating view for suppliers */
CREATE VIEW newerSuppliers AS
SELECT supplyDate,supplier
FROM supply_by
WHERE supplyDate>='2016-01-01';
SELECT * from newerSuppliers;

/*Creating view for drugs exp date*/
CREATE VIEW expDateDrug AS
SELECT publicName+genericName AS medicineName, expDate
FROM medicine;
SELECT * FROM expDateDrug;

/*Creating view of suppliers and their manifacturing partners*/
CREATE VIEW supplierManifacturer AS
SELECT supplier, compName
FROM supply_by 
 INNER JOIN medicine_manifacturer ON   supply_by.companyId=medicine_manifacturer.companyId;
 SELECT * FROM supplierManifacturer;

 /*View of the sold medicines from manifacturer='Alkaloid AD'*/
 CREATE VIEW soldMedAlkaloid AS
 SELECT publicName,m.prce,purchDate
 FROM medicine_manifacturer as mm, supply_by as sb, medicine as m, sold_by as s
 WHERE mm.companyId=sb.companyId AND m.approvalNb=sb.approvalNb AND m.approvalNb= s.approvalNb AND compName='Alkaloid AD';
 SELECT * FROM soldMedAlkaloid;

/* selecting all doctors which prescribed antibiotic*/

SELECT Fname, lname,speciality,d.license_id 
FROM doctor as d, medicine as m, prescribe as p
WHERE d.license_id=p.license_id AND m.approvalNb=p.approvalNb AND class='Antibiotic';

SELECT *
FROM doctor as d
WHERE license_id=(SELECT license_id
FROM prescribe
WHERE approvalNb IN (SELECT approvalNb
FROM medicine
WHERE class='Antibiotic')); 


/*Supplier and date of supply when Diazepam was supplied*/

SELECT supplier , supplyDate
FROM supply_by
WHERE approvalNb=
(SELECT approvalNb
FROM medicine
WHERE genericName='Diazepam');

/* all medicines and all details about them  that start on letter a */
SELECT*
FROM medicine
WHERE publicName LIKE('a%');

/*Quantity of all antibiotics in  the pharmacy */

SELECT sum(quantity) as AllAntibiotics
FROM medicine
WHERE class='Antibiotic';

/*All employees hired after 2016-01-01*/

SELECT fname, lname
FROM employee
WHERE hireDate >='2016-01-01';

/* List all employees, ordered by the time of employment in Descending order*/

SELECT *
FROM employee
ORDER BY hireDate DESC;
/*Show all employees which have salary greater than 30000 DEN*/

SELECT fname,lname,salary
FROM employee
WHERE salary>=30000;

/*In order to find high salary and low salary, we need to write code for salaries out of range from 25000 until 30000*/
SELECT fname, lname, salary
FROm employee
WHERE salary NOT BETWEEN 25000 AND 30000;

/*Show the medicine ordered by their prices in ascending order */

SELECT publicName,genericName, prce
FROM medicine
ORDER BY prce ASC;

/*SHow all details for the medicine and its supplier */

SELECT *
FROM medicine 
FULL OUTER JOIN supply_by ON medicine.approvalNb=supply_by.approvalNb;

/*Display contracts which are in the period from 2015-01-01 until 2017-12-30, ordered from smallest to biggest*/

SELECT *
FROM contract
WHERE dateOn>='2015-01-01' OR dateTo<='2017-12-30'
ORDER BY dateOn ASC;

/*Products that are produced by medicine manifacturer Belupo*/

SELECT *
FROM medicine 
WHERE approvalNb = (SELECT approvalNb
FROM supply_by
WHERE companyId=(SELECT companyId
FROM medicine_manifacturer
WHERE compName='Belupo AD'));

/*Get the date of purchase based on prescripted medicines */
SELECT purchDate
FROM sold_by
WHERE approvalNb IN (SELECT approvalNb
FROM medicine
WHERE approvalNb IN (SELECT approvalNb
FROM prescribe
WHERE purchDate>=datePresc));
/*If we make a supply from supplier Zegin DOO what would be the previous and momental state of the medicine*/
SELECT m.publicName,m.genericName,m.quantity, s.suppliedQuant+ m.quantity AS momentalQuantity
FROM medicine as m, supply_by as s
WHERE m.approvalNb=s.approvalNb AND supplier='Zegin DOO';

/*If we sell particular medicine in a particular quantity what will be the momental state of the medicine*/

SELECT approvalNb,publicName, quantity, quantity-3 as AFTERSELL
FROM medicine 
WHERE approvalNb='15355212' ;

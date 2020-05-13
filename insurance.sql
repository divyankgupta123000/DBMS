create database inssure;
use inssure;

create table person(
driver_id varchar(20),
name_dri varchar(30),
address varchar(30),
primary key(driver_id));

create table car(
reg_num varchar(30),
model varchar(30),
year int,
primary key(reg_num));

create table accident(
report_num varchar(20),
acc_date date,
location varchar(30),
primary key(report_num));

create table owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));

create table participated(
driver_id varchar(4),
reg_num varchar(10),
report_num varchar(5),
damage_amt int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references Person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));

insert into person values('A01','Richard','Srinivas Nagar'),('A02','Pradeep','Rajaji Nagar'),('A03','Smith','Ashok Nagar'),('A04','Venu','NR colony'),('A05','Jhon','Hanumanth Nagar');
insert into car values('KA0522','Indica',1990),('KA0311','Lancer',1957),('KA0954','Toyota',1998),('KA0534','Honda',2008),('KA0417','Audi',2005);
insert into owns values('A01','KA0522'),('A02','KA0534'),('A03','KA0311'),('A04','KA0954'),('A05','KA0417');
insert into accident values('11','2003-01-01','Mysore Road'),('12','2004-02-02','South end Circle'),('13','2003-01-21','Bull Road'),('14','2008-02-17','Mysore Road'),('15','2005-03-04','Kanakapura Road');
insert into participated values('A01','KA0522','11',10000),('A02','KA0534','12',50000),('A03','KA0311','13',25000),('A04','KA0954','14',3000),('A05','KA0417','15',5000);

select * from person;

update participated set damage_amt=25000 where reg_num='KA0534' and report_num='12';

select * from participated;

insert into accident values('16','07-08-09','Whitefield');

select * from accident;

select count(distinct driver_id) CNT from participated,accident 
where participated.report_num=accident.report_num and acc_date like '%08';

select count(participated.reg_num) Cont from participated,car,accident 
where participated.report_num=accident.report_num and car.reg_num=participated.reg_num and model='Audi';

select name_dri from Person 
where driver_id in(
Select driver_id from participated 
where damage_amt>(select avg(damage_amt) from participated));                                            

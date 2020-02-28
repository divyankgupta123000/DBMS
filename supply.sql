create database supply;
use supply;

create table Supplier(
sid int,
sname varchar(30),
city varchar(30),
primary key(sid));

create table Parts(
pid int,
pname varchar(30),
color varchar(30),
primary key(pid));

create table Catalog(
sid int,
pid int,
cost int,
primary key(sid,pid),
foreign key(sid) references Supplier(sid),
foreign key(pid) references Parts(pid));

insert into Supplier values
(10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolkata'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi');

insert into Parts values
(20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');

insert into Catalog values
(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);

select distinct sid from Catalog,Parts where Catalog.pid=Parts.pid and color='Red' or color='Green'; 
select distinct Supplier.sid from Supplier,Catalog,Parts where Supplier.sid=Catalog.sid and Catalog.pid=Parts.pid and Parts.color='Red' or Supplier.city='Bangalore';
select distinct c1.sid,c2.sid from Catalog c1,Catalog c2 where c1.cost>c2.cost and c1.cost!=c2.cost and c1.pid=c2.pid;
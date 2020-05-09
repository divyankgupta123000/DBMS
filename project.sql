create database project;
use project;

create table Customer(
cust_id int unique not null,
cname varchar(30) not null,
csex varchar(10) not null,
cage int not null,
cphone,
primary key(cphone));

create table Discount(
ctype varchar(30),
validity varchar(20) not null,
disc_percent int, 
primary key(ctype));

create table Card(
card_id int,
cphone int not null,
ctype varchar(30) not null,
expdate date,
primary key(card_id), 
foreign key(cphone) references Customer(cphone),
foreign key(ctype) references Discount(ctype));

create table Receipt(
rnumber int,
cphone int not null,
t_date date,
total_items int not null,
total_amt int not null,
disc_amt int,
card_id int,
primary key(rnumber),
foreign key(cphone) references Customer(cphone),
foreign key(card_id) references Card(card_id));

create table PayMode(
pid int,
rnumber int not null unique,
ptype varchar(30) not null,
primary key(pid),
foreign key(rnumber) references Receipt(rnumber));

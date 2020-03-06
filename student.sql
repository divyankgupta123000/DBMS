create database student;
use student;

create table stud(
  snum int,
  sname varchar(20),
  major varchar(20),
  lvl varchar(10),
  age int,
  primary key(snum));
 
create table class(
  cname varchar(20),
  meets_at time,
  room varchar(10),
  fid integer,
  primary key(cname));
 
create table enrolled(
  snum int,
  cname varchar(20),
  primary key(snum,cname),
  foreign key (snum) references stud(snum),
  foreign key (cname) references class(cname));
 
create table faculty(
  fid int,
  fname varchar(20),
  deptid int,
  primary key(fid));

create database student;
use student;

create table stud(
  snum int,
  sname varchar(30),
  major varchar(30),
  lvl varchar(10),
  age int,
  primary key(snum));
 
create table faculty(
  fid int,
  fname varchar(20),
  deptid int,
  primary key(fid));
  
  create table class(
  cname varchar(20),
  meets_at time,
  room varchar(10),
  fid integer,
  primary key(cname),
  foreign key(fid) references faculty(fid));
 
create table enrolled(
  snum int,
  cname varchar(20),
  primary key(snum,cname),
  foreign key (snum) references stud(snum),
  foreign key (cname) references class(cname));
  
  insert into stud values
  (1,'John','CS','SR',19),
  (2,'Smith','CS','JR',20),
  (3,'Jacob','CV','SR',20),
  (4,'Tom','CS','JR',20),
  (5,'Rahul','CS','JR',20);
  
  insert into faculty values
  (11,'Harish',1000),
  (12,'MV',1000),
  (13,'Mira',1001),
  (14,'Shiva',1002),
  (15,'Nupur',1003);
  
  insert into class values
  ('class1','10:15:16','R1',14),
  ('class4','10:15:16','R128',14),
  ('class2','10:15:20','R2',12),
  ('class3','10:15:25','R3',11),
  ('class3','20:15:20','R4',14);
  
  insert into enrolled values
  (1,'class1'),
  (2,'class1'),
  (3,'class3'),
  (4,'class3'),
  (5,'class4');
  
SELECT DISTINCT S.sname
FROM stud S, class C, enrolled E, faculty F
WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND
F.fname = ‘Harish’ AND S.lvl = ‘Jr’;

SELECT C.cname
FROM class C
WHERE C.room = ‘R128’;

SELECT DISTINCT S.sname
FROM stud S
WHERE S.snum IN (SELECT E1.snum
			FROM enrolled E1, enrolled E2, class C1, class C2
			WHERE E1.snum = E2.snum AND E1.cname <> E2.cname
			AND E1.cname = C1.cname
			AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);
            
SELECT DISTINCT F.fname
FROM faculty F WHERE NOT EXISTS((SELECT C.room FROM class C )MINUS(SELECT C1.room FROM class C1 WHERE C1.fid = F.fid));
		
SELECT DISTINCT F.fname
FROM faculty F
WHERE 5 > (SELECT COUNT (E.snum)
FROM class C, enrolled E
WHERE C.cname = E.cname
AND C.fid = F.fid);

SELECT DISTINCT S.sname
FROM stud S
WHERE S.snum NOT IN (SELECT E.snum
FROM enrolled E );

SELECT S.age, S.lvl
FROM stud S
GROUP BY S.age, S.lvl
HAVING S.lvl IN (SELECT S1.lvl FROM stud S1
      WHERE S1.age = S.age
GROUP BY S1.lvl, S1.age
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
FROM stud S2
WHERE S1.age = S2.age
GROUP BY S2.lvl, S2.age));

            


-- SQL Project #11
create database project;
use project;
create table employee(empid int primary key,empname varchar(100),department varchar(50),contactno bigint,emailid varchar(100),empheadid int);
insert into employee values(101,'Isha','E-101',1234567890,'isha@gmail.com',105);
insert into employee values(102,'Priya','E-104',1234567890,'priya@yahoo.com',103);
insert into employee values(103,'Neha','E-101',1234567890,'neha@gmail.com',101);
insert into employee values(104,'Rahul','E-102',1234567890,'rahul@yahoo.com',105);
insert into employee values(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102);
select * from employee;
create table empdept(deptid varchar(50) primary key,deptname varchar(100),dept_off varchar(100),depthead int,foreign key(depthead) references employee(empid));
insert into empdept values('E-101','HR','Monday',105);
insert into empdept values('E-102','Development','Tuesday',101);
insert into empdept values('E-103','House keeping','Saturday',103);
insert into empdept values('E-104','Sales','Sunday',104);
insert into empdept values('E-105','Purchage','Tuesday',104);
select * from empdept;
create table empsalary(empid int,foreign key(empid) references employee(empid),salary bigint,ispermanent varchar(3));
insert into empsalary values(101,2000,'Yes');
insert into empsalary values(102,10000,'Yes');
insert into empsalary values(103,5000,'No');
insert into empsalary values(104,1900,'Yes');
insert into empsalary values(105,2300,'Yes');
select * from empsalary;
create table project(projectid varchar(50) primary key,duration int);
insert into project values('p-1',23);
insert into project values('p-2',15);
insert into project values('p-3',45);
insert into project values('p-4',2);
insert into project values('p-5',30);
select * from project;
create table country(cid varchar(50) primary key,cname varchar(100));
insert into country values('c-1','India');
insert into country values('c-2','USA');
insert into country values('c-3','China');
insert into country values('c-4','Pakistan');
insert into country values('c-5','Russia');
select * from country;
create table clienttable(clientid varchar(50) primary key,clientname varchar(100),cid varchar(50) references country(cid));
insert into clienttable values('cl-1','ABC Group','c-1');
insert into clienttable values('cl-2','PQR','c-1');
insert into clienttable values('cl-3','XYZ','c-2');
insert into clienttable values('cl-4','tech altum','c-3');
insert into clienttable values('cl-5','mnp','c-5');
select * from clienttable;
create table empproject(empid int,foreign key(empid) references employee(empid),projectid varchar(50),foreign key(projectid) references project(projectid),clientid varchar(50),foreign key(clientid) references clienttable(clientid),startyear int,endyear int);
insert into empproject values(101,'p-1','cl-1',2010,2010);
insert into empproject values(102,'p-2','cl-2',2010,2012);
insert into empproject values(103,'p-1','cl-3',2013,null);
insert into empproject values(104,'p-4','cl-1',2014,2015);
insert into empproject values(105,'p-4','cl-5',2015,null);
select * from empproject;

-- Question 1. Select the Department name of the company which is assigned to the employee whose employee Id is greater than 103
Select deptname from empdept where depthead>
(Select empid from employee where empid=103);




-- Question 2. Select the name of the Employee who is working under Abhishek
Select clientname from clienttable where clientid=
(Select clientid from empproject where empid=
(Select empid from employee where empname='Abhishek'));



-- Question 3. Select the name of the employee who is department Head of HR
Select empname from employee where empid=
(Select depthead from empdept where deptname='HR');







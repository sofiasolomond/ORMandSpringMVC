/* create database crmdb; */
use crmdb;
create table customer
(
customerid int primary key auto_increment,
firstname varchar(50),
lastname varchar(50),
email varchar(100)
);
insert into customer (firstname, lastname,email ) values ("Suresh", "Kumar", "suresh.kumar@gmail.com");

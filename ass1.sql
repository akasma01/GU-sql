select abs(-15.35);
select pow(3.25,2.25);
select round(3.1417,3);
select truncate(3.1417,3);
select sqrt(17);
select sqrt(-13);
select exp(5);
select ceil(15.72);
select floor(15.72);
select mod(13,5);
select date_add('2001-05-18', interval 275 month);
select sin(100);
select log10(100);
select log(10,100);

create database assign1;
use assign1;

create table books(
no varchar(10) primary key,
title varchar(30),
author varchar(30),
publication varchar(30),
price int,
edition int );

insert into books values("b101","c++","sma","arihant",353,1),
("b102","dbms","parth","penguin",230,2),
("b103","cs","krunal","oswal",420,1),
("b104","python","sma","arihant",555,3),
("b105","os","sma","oswal",350,1);

select * from books;

insert into books values("b106","gk","Biswojeet","arihant",210,1);

select * from books where author regexp "[A-Z]*";

select upper(title),lower(title) from books;


select charset(65);

select ascii("B");










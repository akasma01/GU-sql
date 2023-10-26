create schema sales;

show databases;
use sales;

create table client_master (
	client_No varchar(6) ,
    Name varchar(20) NOT NULL,
    Address1 varchar(30) ,
	Address2 varchar(30) ,
    City varchar(15),
    PinCode numeric(8),
    State Varchar(15),
    Bal_due float(10,2),
    primary key (Client_No) ,
    CHECK ((Client_No) LIKE 'C%')
);
	
    /*drop table db1.Client_master;
	truncate table db1.Client_master;
    select * from db1.Client_master; */
    
INSERT INTO client_master (Client_No, Name, City, PinCode, State, Bal_due)
VALUES
('C01', 'Ivan Bayross', 'Bombay', 400054, 'Maharashtra', 15000),
('C02', 'Vandana Saitwal', 'Madras', 780001, 'Tamil Nadu', 0),
('C03', 'Pramada Jaguste', 'Bombay', 400057, 'Maharashtra', 5000),
('C04', 'Basu Navindgi', 'Bombay', 400056, 'Maharashtra', 0),
('C05', 'Ravi Sreedharan', 'Delhi', 100001, 'Delhi', 2000),
('C06', 'Rukmini', 'Bombay', 400050, 'Maharashtra', 0);


create table product_master (
	Product_no varchar(6),
    Description varchar(15) NOT NULL,
    Profile_percent float(4,2)NOT NULL,
    Unit_measure varchar(10)NOT NULL,
    Qty_on_hand numeric(8) NOT NULL,
    Recorder_lvl numeric(8)NOT NULL,
	Sell_price numeric(8,2)NOT NULL,
    Cost_price numeric(8,2)NOT NULL,
    primary key (Product_no),
    check (Product_no like 'P%'),
    check (Sell_price > 0) ,
    check (Cost_price > 0)
);
	desc product_master;
    select * from product_master;
    
    INSERT INTO product_master VALUES
	('P00001', '1.44 Floppies', 5.00, 'Piece', 100, 2, 525.00, 500.00),
	('P03453', 'monitors', 6.00, 'Piece', 10, 20, 12000.00, 11280.00),
	('P06734', 'mouse', 5.00, 'Piece', 20, 3, 1050.00, 1000.00),
	('P07865', '1.22 Floppies', 5.00, 'Piece', 100, 5, 525.00, 500.00),
	('P07868', 'keyboards', 2.00, 'Piece', 10, 20, 3150.00, 3050.00),
	('P07885', 'CD Drive', 2.50, 'Piece', 10, 3, 5250.00, 5100.00),
	('P07965', '540 HHD', 4.00, 'Piece', 10, 3, 8400.00, 8000.00),
	('P07975', '1.44 Drive', 5.00, 'Piece', 10, 3, 1050.00, 1000.00),
	('P08865', '1.22 Drive', 5.00, 'Piece', 2, 3, 1050.00, 1000.00);


CREATE TABLE salesman_master (
    salesman_no varchar(6) ,
    Salesman_name varchar(20) NOT NULL,
    Address1 varchar(30) NOT NULL,
    Address2 varchar(30),
    City varchar(20),
    Pincode varchar(8),
    State varchar(20),
    Sal_amt numeric(8, 2) NOT NULL,
    Tgt_to_get numeric(6, 2) NOT NULL,
    Ytd_sales numeric(6, 2) NOT NULL,
    Remarks varchar(60) ,
    primary key (salesman_no) ,
    check (salesman_no like 'S%'),
    CHECK (Sal_amt > 0),
    CHECK (Tgt_to_get > 0)
);
	select * from salesman_master;
    
	INSERT INTO salesman_master (Salesman_no, Salesman_name, Address1, Address2, City, Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks)
	VALUES
	('S01', 'Kiran', 'A/14', 'Worli', 'Bombay', '400002', 'Maharashtra', 3000, 100, 50, 'Good'),
	('S02', 'Manish', '65', 'Nariman', 'Bombay', '400001', 'Maharashtra', 3000, 200, 100, 'Good'),
	('S03', 'Ravi', 'P-7', 'Bandra', 'Bombay', '400032', 'Maharashtra', 3000, 200, 100, 'Good'),
	('S04', 'Aashish', 'A/5', 'Juhu', 'Bombay', '400044', 'Maharashtra', 3500, 200, 150, 'Good');

CREATE TABLE sale_order (
    order_no varchar(6),
    order_date DATE NOT NULL,
    Client_no varchar(6),
    Dely_Addr varchar(25),
    Salesman_no varchar(6),
    Dely_type CHAR(1) Default 'F',
    Billed_yn CHAR(1),
    Dely_date DATE NOT NULL,
    Order_status varchar(10) ,
    primary key (order_no) ,
		check (order_no like 'O%'),
	check (Dely_type like 'P%' OR Dely_type LIKE 'F%'),
    check (Dely_date >= order_date),
    check ((Order_status = 'In Process') OR (Order_status = 'Fulfilled') OR (Order_status = 'Back Order') OR (Order_status = 'Cancelled')),
    FOREIGN KEY (Client_no) REFERENCES client_master(Client_No),
    FOREIGN KEY (Salesman_no) REFERENCES salesman_master(salesman_no)
);
/*
	SELECT * FROM db1.sale_order;
	delete from db1.sale_order;
	drop table db1.sale_order; 
*/

INSERT INTO  sale_order 
		(order_no, order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date, Order_status)
			VALUES
		('O19001', '1996-01-12', 'C01', 'F', 'N', 'S01', '1996-01-20', 'In Process'),
		('O19002', '1996-01-25', 'C02', 'P', 'N', 'S02', '1996-01-27', 'Cancelled'),
		('O46865', '1996-02-18', 'C03', 'F', 'Y', 'S03', '1996-02-20', 'Fulfilled'),
		('O19003', '1996-04-03', 'C01', 'F', 'Y', 'S01', '1996-04-07', 'Fulfilled'),
		('O46866', '1996-05-20', 'C04', 'P', 'N', 'S02', '1996-05-22', 'Cancelled'),  
		('O19008', '1996-05-24', 'C05', 'F', 'N', 'S04', '1996-05-26', 'In Process');


	SELECT * FROM sale_order;

CREATE TABLE sale_order_details(
	order_no varchar(6),
    Product_no varchar(6),
    Qty_ordered Numeric(8),
    Qty_disp Numeric(8),
	Product_rate Numeric(10,2),
    PRIMARY KEY (order_no , Product_no),
    FOREIGN KEY (order_no) REFERENCES sale_order(order_no),
     FOREIGN KEY (Product_no) REFERENCES product_master(Product_no)
);
	
--     INSERT INTO db1.sale_order_details (order_no, Product_no, Qty_ordered, Qty_disp, Product_rate)
-- 		VALUES
-- 		('O19001', 'P00001', 4, 4, 525),
-- 		('O19001', 'P07965', 2, 1, 8400),
-- 		('O19001', 'P07885', 2, 1, 5250),
-- 		('O19002', 'P00001', 10, 0, 525),
-- 		('O46865', 'P07868', 3, 3, 3150),
-- 		('O46865', 'P07885', 3, 1, 5250),
-- 		('O46865', 'P00001', 10, 10, 525),
-- 		('O46865', 'P03453', 4, 4, 1050),
-- 		('O46865', 'P03453', 2, 2, 1050),
-- 		('O46865', 'P06734', 1, 1, 12000),
-- 		('O19003', 'P07965', 1, 0, 8400),
-- 		('O19003', 'P07975', 1, 0, 1050),
-- 		('O46866', 'P00001', 10, 5, 525),
-- 		('O19008', 'P07975', 5, 3, 1050);
    
    INSERT INTO sale_order_details VALUES
('O19001', 'P00001', 4, 4, 525),
('O19001', 'P07965', 2, 1, 8400),
('O19001', 'P07885', 2, 1, 5250),
('O19002', 'P00001', 10, 0, 525),
('O46865', 'P07868', 3, 3, 3150),
('O46865', 'P07885', 3, 1, 5250),
('O46865', 'P00001', 10, 10, 525),
('O46865', 'P03453', 4, 4, 1050),
('O46865', 'P06734', 1, 1, 12000),
('O19003', 'P07965', 1, 0, 8400),
('O19003', 'P07975', 1, 0, 1050),
('O46866', 'P00001', 10, 5, 525),
('O19008', 'P07975', 5, 3, 1050);


select * from client_master;
select * from product_master;
select * from sale_order;
select * from sale_order_details;
select * from salesman_master;
---------------------------------------

select * from client_master where name like "_a%"; 
----------------------------------------
select name from client_master where city like  "_a%"; 
----------------------------------------
select * from client_master where city="bombay" or city="delhi";
----------------------------------------
select * from client_master where bal_due>10000; 
----------------------------------------
select * from sale_order where month(order_date)=1;
#or
select * from sale_order where monthname(order_date)="january";
-----------------------------------------
select * from sale_order where client_no = "C01 "or client_no = "C02";
------------------------------------------
select * from product_master where sell_price >2000 and sell_price<=5000;
-------------------------------------------
select product_no,description,sell_price"Old_Price",sell_price*1.5"New Price" from product_master where sell_price >1500;
-------------------------------------------
select name,city,state from client_master where state not in("maharashtra");
-------------------------------------------
select count(order_no)"No. of orders"from sale_order;
-------------------------------------------
select avg(sell_price)"Average of Sell Price",avg(cost_price)"Average of Cost Price" from product_master;
------------------------------------------
select max(sell_price)"Max price",min(sell_price)"Min price" from product_master; 
--------------------------------------------
select count(product_no) from product_master where sell_price>=1500;
--------------------------------------------
select * from product_master where qty_on_hand<recorder_lvl;
--------------------------------------------




 




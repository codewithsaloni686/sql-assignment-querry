Drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create Table customers (
   customer_id Int primary key auto_increment,
   customer_name varchar(100) not null,
   Email Varchar(100) unique not null,
   phone_number char(10) not null,
   Age  tinyint unsigned check (age >= 0),
   Gender ENUM('male','female','other'),
   country Varchar(50) default 'India',
   city varchar(50) not null,
   Pincode Varchar(6) Default '201301',
   Registration_Date Date default (current_date),
   Registration_Time Time default (current_date),
   created_at_datetime Timestamp default (current_timestamp),
   Address tinytext,
   Customer_status Enum('Active','inactive','blocked') Default 'Active',
   customer_Notes varchar (1023)
   );
   
   select * from customers;
   
   create Table orders (
   order_id Int primary key auto_increment,
   customer_id Int,
   order_Date Date default (current_date),
   order_Amount Decimal (10,2)  not null,
   order_status Enum ('pending','processing','shipped','delivered','cancelled') Default 'pending',
   payment_method Enum ('cash','card','UPI','Net banking'),
   payment_status Enum('pending','paid','Failed') Default 'pending',
   shipping_Address Varchar(250) not null,
   Delivery_pincode char(6),
   quantity INT not null check (quantity > 0),
   Discount_Amount Decimal (10,2) Default '0',
   Delivery_Date Date default Null,
   created_At Timestamp Default (current_timestamp),
   Tracking_number Varchar (30) unique,
   Delivery_status Enum ('NOT Dispatched','Intransit','Delivered','Returned') default 'not dispatched',
   order_notes varchar (1023),
   FOREIGN KEY (customer_ID) REFERENCES customer(customer_Id) ON DELETE CASCADE,
   FOREIGN KEY (customer_ID) REFERENCES customer(customer_Id) ON UPDATE CASCADE 
   );
   
  select * from orders;
   
   

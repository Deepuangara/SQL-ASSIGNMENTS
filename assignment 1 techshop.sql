use TechShop
create table Customers (CustomerID int primary key,FirstName varchar(50),LastName varchar(50),Email varchar(100),Phone varchar(20),Address varchar(255))
insert into Customers values(101,'John', 'Deer', 'john.deer@gmail.com', '9989867879', 'tadepalligudem')
insert into Customers values(102,'Kishore', 'kumar', 'kishore.kumar@gmail.com', '8783873747', 'tadepalligudem')
insert into Customers values(103,'varun', 'kumar', 'varun.kumar@gmail.com', '8989867879', 'tanuku')
insert into Customers values(104,'surya', 'kumar', 'surya.kumar@gmail.com', '7989867879', 'ndd')
insert into Customers values(105,'kelly', 'santosh', 'kelly.santosh@gmail.com', '9989867875', 'tadepalligudem')
insert into Customers values(106,'sanju', 'ajay', 'sanju.ajay@gmail.com', '9989867873', 'ndd')
insert into Customers values(107,'pavan', 'santosh', 'pavan.santosh@gmail.com', '9989867875', 'tanuku')
insert into Customers values(108,'varun', 'dhawan', 'varun.dhawan@gmail.com', '9979867875', 'tadepalligudem')
insert into Customers values(109,'neha', 'rani', 'neha.rani@gmail.com', '9989867845', 'ndd')
insert into Customers values(110,'kiran', 'samyuktha', 'kiran.samyuktha@gmail.com', '9989867870', 'tadepalligudem')

create table Products (
    ProductID int primary key,
    ProductName varchar(100),
	description text,
    Price int,
    Quantity int)
	drop table Products
	insert into Products values(1001,'iphone','electronic',150000,1)
	insert into Products values(1002,'earphones','electronic',1500,2)
	insert into Products values(1003,'iphone','electronic',150000,1)
	insert into Products values(1004,'headset','electronic',15000,2)
	insert into Products values(1005,'charger','electronic',1500,1)
	insert into Products values(1006,'keyboard','electronic',2000,1)
	insert into Products values(1007,'iphone','electronic',150000,1)
	insert into Products values(1008,'mouse','electronic',1000,2)
	insert into Products values(1009,'hometheatre','electronic',150000,1)
	insert into Products values(1010,'tv','electronic',80000,1)




create table Orders (OrderID int primary key ,
                     CustomerID int,OrderDate date,
                     TotalAmount int,
                     foreign key (CustomerID) 
					 references Customers(CustomerID))
insert into Orders values(1001,101,'02-03-2003',5000)
insert into Orders values(1002,102,'03-04-2003',6000)
insert into Orders values(1003,103,'04-08-2003',100000)
insert into Orders values(1004,104,'04-08-2003',5120)
insert into Orders values(1005,105,'02-03-2003',9000)
insert into Orders values(1006,106,'02-03-2004',5000)
insert into Orders values(1007,107,'05-03-2003',6000)
insert into Orders values(1008,108,'04-08-2003',100000)
insert into Orders values(1009,109,'02-04-2003',5120)
insert into Orders values(1010,110,'02-05-2003',9000)


create table OrderDetails (
    OrderDetailID int primary key,
    OrderID int,
    ProductID int,
    Quantity int,
    foreign key(OrderID) references Orders(OrderID),
    foreign key (ProductID) references Products(ProductID))
insert into OrderDetails values(1,1001,1001,1)
insert into OrderDetails values(2,1002,1002,2)
insert into OrderDetails values(3,1003,1003,3)
insert into OrderDetails values(4,1004,1004,1)
insert into OrderDetails values(5,1005,1005,1)
insert into OrderDetails values(6,1006,1006,1)
insert into OrderDetails values(7,1007,1007,2)
insert into OrderDetails values(8,1008,1008,1)
insert into OrderDetails values(9,1009,1009,2)
insert into OrderDetails values(10,1010,1010,2)

create table Inventory (
    InventoryID int primary key,
    ProductID int,
    QuantityInStock int,
    LastStockUpdate date
    foreign key (ProductID) references Products(ProductID))
	insert into Inventory values(1,1001,4,'02-05-2024')
	insert into Inventory values(2,1002,4,'02-06-2024')
	insert into Inventory values(3,1003,5,'04-05-2024')
	insert into Inventory values(4,1004,5,'02-04-2024')
	insert into Inventory values(5,1005,4,'02-03-2024')
	insert into Inventory values(6,1006,4,'05-05-2024')
	insert into Inventory values(7,1007,4,'06-06-2024')
	insert into Inventory values(8,1008,5,'07-05-2024')
	insert into Inventory values(9,1009,5,'08-04-2024')
	insert into Inventory values(10,1010,4,'02-03-2024')

	select * from Customers
	select *from Products
	select *from Orders
	select *from OrderDetails
	select *from Inventory

	/////////task 2//////

	/*1*/
	select FirstName, LastName, Email from Customers
    /*2*/
	select O.OrderID, O.OrderDate, c.FirstName + c.LastName as CustomerName from Orders O JOIN Customers c on O.CustomerID = c.CustomerID;
	/*3*/
	insert into Customers values (111,'ajay', 'varma', 'ajay.varma@gmail.com', 8773546353,'ndd')
	/*4*/
	update Products set Price = Price * 1.1 where description like '%electronic'
	/*5*/ 
DECLARE @InputOrderID INT; 
SET @InputOrderID = 1;
delete from Orders where OrderId= 1001
delete from OrderDetails where OrderId= 1001


/*6*/ 
insert into Orders values(1011,111,'2024-04-08',5000) 

/*7*/
declare @InputEmail varchar(30), @InputCustomerID int
set @InputEmail = 'jack123@email.com'
set @InputCustomerID=101
update Customers set Email='satish@gmail.com' where CustomerID=101
select * from Customers

/*8*/
update Orders SET totalamount=(
select sum(od.quantity*p.price) from OrderDetails od
INNER JOIN Products p on p.ProductID=od.ProductID
where orders.orderID=od.OrderID)


/*9*/ 
declare @InputCustomerID int
set @InputCustomerID=101
delete from Orders where CustomerId= @InputCustomerID
delete from OrderDetails where CustomerId= @InputCustomerID

/*10*/
insert into Products values(1012,'iphone','electronic',150000,1,3)

/*11*/
alter table orders add status varchar(10) 
DECLARE @InputOrderID INT; 
SET @InputOrderID = 1;
update orders set status='Shipped' where OrderId= @InputOrderID
select * from orders

/*12*/
select c.firstname, od.quantity
from Customers c
inner join Orders o on o.customerid=c.CustomerID
inner join OrderDetails od on od.OrderID=o.orderID

select * from orders


/* task-3 */

/*1*/
select o.OrderID,o.OrderDate,c.Firstname,c.LastName
from Orders o
INNER JOIN Customers c on o.CustomerID=c.CustomerID

/*2*/
select p.productname,sum(od.quantity*p.price) as totalrevenue
from orderdetails od
join products p on od.productid = p.productid
group by p.productid, p.productname

/*3*/
select c.firstname,c.phone 
from Customers c
join orders o on o.customerid=c.CustomerID
group by c.FirstName, c.Phone

/*4*/
select top 1 p.productname,sum(od.quantity) as totalquantity
from orderdetails od
join products p on od.productid = p.productid
group by p.productname
order by totalquantity desc

/*5*/
create table category(
categoryID int primary key,
categoryName varchar(30))

ALTER TABLE Products
ADD CategoryID INT;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Category
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

select p.productname,c.categoryname from Products p
join category c on c.categoryID=p.CategoryID

/*6*/
select c.firstname,avg(o.totalamount) as averageordervalue
from customers c
join orders o on c.customerid = o.customerid
group by c.firstname

/*7*/
select top 1 o.orderid,c.firstname,c.lastname,o.totalamount
from orders o
join customers c on o.customerid = c.customerid
order by o.totalamount desc

/*8*/
select p.productname,count(od.productid) from Products p
join OrderDetails od on od.ProductID=p.ProductID
group by p.productname

/*9*/
declare @InputProname varchar(20)
set @InputProname='Router'
select c.firstname from Customers c
join orders o on o.customerID=c.CustomerID
join OrderDetails od on od.OrderID=o.orderID
join Products p on p.ProductID=od.ProductID
where ProductName= 'keyboard'

/*10*/
declare @InputStartdate date, @InputEnddate date
set @InputStartdate='2022-4-20'
set @InputEnddate='2024-01-10'
select sum(o.totalamount) as totalrevenue
from orders o
where o.orderdate between '02-05-2024' and '02-06-2024'

/*task-4*/

/*1*/
select * from customers
where customerid not in(
select customerid from orders);

/*2*/
select count(productid) as available_products
from inventory
where quantityinstock > 0;

/*3*/
select sum(totalamount) as total_amount from orders;

/*4*/
declare @Inputcategoryname varchar(10);
set @Inputcategoryname='computers';
select avg(od.quantity) as averagequantity from orderdetails od
inner join products p on od.productid = p.productid
where p.categoryid=
(select c.categoryid from category c where c.categoryname='electronicgadgets')

/*5*/
declare @InputcustomerID int
set @InputcustomerID=104;
select sum(o.TotalAmount) as TotalAmount
from Orders o
where o.CustomerID=104

/*6 not crt*/
select c.FirstName,o.noofOrders from Customers c
join (select CustomerID,count(OrderID) as noofOrders from Orders group by CustomerID) o
on o.customerid=c.CustomerID

/*7*/
select top 1 categoryname, totalquantity
from(select c.categoryname,sum(od.quantity) as totalquantity
from orderdetails od
join products p on od.productid = p.productid
join category c on p.categoryid = c.categoryid
group by c.categoryname) as categorytotals
order by totalquantity desc;

/*8*/
select top 1 c.firstname, maximum.totalspent
from customers c
join(select CustomerID, sum(totalamount) as totalspent from orders
group by customerid)maximum on c.customerid = maximum.customerid
order by maximum.totalspent desc

/*9*/
select c.firstname, all_orders.avg_order
from customers c
join(select customerid, sum(totalamount)/count(orderid) as avg_order
from orders
group by customerid) all_orders on c.customerid = all_orders.customerid;

/*10*/
select c.FirstName,o.noofOrders from Customers c
join (select CustomerID,count(OrderID) as noofOrders from Orders group by CustomerID) o
on o.customerid=c.CustomerID

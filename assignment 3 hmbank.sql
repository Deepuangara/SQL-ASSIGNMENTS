create table Customers(Customer_id int primary key,first_name varchar(20),last_name varchar(20),DOB date,email varchar(50),phone_no varchar(30),address varchar(20))
create table Accounts(account_id int primary key,Customer_id int,account_type varchar(20),balance int,foreign key (Customer_id) references Customers(Customer_id))
create table Transactions(transaction_id int primary key,account_id int,transaction_type varchar(20),amount int,transaction_date date,foreign key (account_id) references Accounts(account_id))


INSERT INTO Customers (Customer_id, first_name, last_name, DOB, email, phone_no, address)
VALUES
    (1, 'John', 'Doe', '1990-01-01', 'john.doe@gmail.com', '6756473873', 'ndd'),
    (2, 'Jane', 'Smith', '1985-05-15', 'jane.smith@gmail.com', '9876654444', 'tanuku'),
    (3, 'deepak', 'angara', '1991-01-01', 'deepu@gmail.com', '1236545667', 'ndd'),
    (4, 'Jane', 'Smule', '1985-05-15', 'jane.smule@gmail.com', '7777777777', 'tanuku'),
	 (5, 'srikar', 'angara', '1990-01-01', 'srikar@gmail.com', '6756473873', 'ndd'),
    (6, 'justin ', 'bieber', '1985-09-15', 'smith@gmail.com', '9876654444', 'tanuku'),
    (7, 'deepu', 'angara', '1991-02-01', 'deepu@gmail.com', '1236545667', 'ndd'),
    (8, 'ajay', 'varma', '1985-01-12', 'ajay@gmail.com', '7777777777', 'tanuku'),
	    (9, 'deepu', 'anga', '1991-09-01', 'depu@gmail.com', '1236545667', 'ndd'),
    (10, 'akash', 'varma', '1985-11-12', 'akaah@gmail.com', '7777777777', 'tanuku')


	INSERT INTO Accounts (account_id, Customer_id, account_type, balance)
VALUES
    (101, 1, 'savings', 1000.00),
    (102, 2, 'current', 5000.00),
     (103, 3, 'savings', 1000.00),
    (104, 4, 'current', 5000.00),
	(105, 5, 'savings', 1000.00),
    (106, 6, 'current', 5000.00),
     (107, 7, 'savings', 1000.00),
    (108, 8, 'current', 5000.00),
	 (109, 9, 'savings', 1000.00),
    (110, 10, 'current', 5000.00)

	
INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
    (1001, 101, 'deposit', 500.00, '2024-04-10'),
    (1002, 102, 'withdrawal', 1000.00, '2024-04-11'),
    (1003, 103, 'deposit', 500.00, '2024-04-10'),
    (1004, 104, 'withdrawal', 1000.00, '2024-04-11'),
	  (1005, 105, 'deposit', 500.00, '2024-04-10'),
    (1006, 106, 'withdrawal', 1000.00, '2024-04-11'),
	  (1007, 107, 'deposit', 500.00, '2024-04-10'),
    (1008, 108, 'withdrawal', 1000.00, '2024-04-11'),
	  (1009, 109, 'deposit', 500.00, '2024-04-10'),
    (1010, 110, 'withdrawal', 1000.00, '2024-04-11')


	/*task2*/
	/*1*/
	select c.first_name,c.last_name,a.account_type,c.email from Customers c join Accounts a on c.Customer_id=a.Customer_id
	/*2*/
	select c.first_name,c.last_name,t.transaction_type,t.amount,t.transaction_date
	from Customers c join Accounts a on c.Customer_id=a.Customer_id
	                 join Transactions t on a.account_id=t.account_id
     /*3*/
	 update Accounts 
	 set balance = balance + 20000
	 where account_id = 101

	 select *from Accounts
	  /*4*/
	  select concat(first_name,' ',last_name)as full_name
	  from Customers
	   /*5*/
	   delete from accounts where balance = 0 and account_type = 'savings'
	   /*6*/
	   select* from Customers where address = 'tanuku'
	   /*7*/
	   select balance from Accounts where account_id = 102
	   /*8*/
	   select *from Accounts where account_type = 'current' and balance >1000
	   /*9*/
	   select *from Transactions where account_id = 103
	   /*10*/
	  select account_id,balance*2 as interest_accrued from accounts where account_type='savings'
	   /*11*/
	   select *from accounts where balance < 4000
	    /*12*/
		select *from Customers where address!= 'tanuku'


		//task3//
		/*1*/
	    SELECT AVG(balance) AS average_balance
        FROM Accounts;
         /*2*/
	     SELECT *
         FROM Accounts
         ORDER BY balance DESC
		 /*3*/
		 select sum(amount)as total_deposits from Transactions where transaction_type='deposit' and transaction_date = '2024-04-10'
		 /*4*/
		 select min(DOB) as oldest_customer_dob,max(DOB) as newes_customer_dob from Customers
		 /*5*/
		 select t.*,a.account_type from Transactions t join Accounts a on t.account_id=a.account_id
		 /*6*/
		 select c.*,account_type,balance  from Customers c join Accounts a on c.Customer_id=a.Customer_id
		 /*7*/
		 select t.*,c.first_name,c.last_name,c.email from Transactions t  join Accounts a on t.account_id=a.account_id join Customers c on a.customer_id=c.customer_id
		 where transaction_id=1002
		 /*8*/
		 select customer_id from accounts group by customer_id having count(*)>1
		 /*9*/
		 SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS difference
	   FROM Transactions
	   GROUP BY account_id;
	   	 /*10*/
		SELECT account_id, 
       AVG(balance) AS average_daily_balance
       FROM Accounts
        GROUP BY account_id;
		/*11*/
		SELECT account_type, 
       SUM(balance) AS total_balance
      FROM Accounts
       GROUP BY account_type;
	    /*12*/
		SELECT account_id, COUNT(*) AS transaction_count
        FROM Transactions
       GROUP BY account_id
      ORDER BY transaction_count DESC;
	  /*13*/
	  select c.customer_id,c.first_name,a.account_type,SUM(t.amount) AS total_balance
from Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
group by c.customer_id, c.first_name, a.account_type
order by total_balance DESC
	  /*14*/
	  select account_id, transaction_type, amount, transaction_date, count(*) as count
      from Transactions 
      group by account_id, transaction_type, amount, transaction_date
      having count(*) > 1
      order by account_id, transaction_date


	   task 4
	   /*1*/

    SELECT Customer_id, first_name, last_name
FROM Customers
WHERE Customer_id IN (
    SELECT Customer_id
    FROM Accounts
    WHERE balance = (
        SELECT MAX(balance)
        FROM Accounts))
		/*2*/
		SELECT AVG(balance) AS average_balance
        FROM Accounts
        WHERE customer_id IN (
        SELECT customer_id
        FROM Accounts
        GROUP BY customer_id
        HAVING COUNT(*) > 1
);
          /*3*/
		  SELECT account_id, transaction_id, transaction_type, amount
FROM Transactions
WHERE amount > (
    SELECT AVG(amount)
    FROM Transactions
);

         /*4*/
		 SELECT customer_id, first_name, last_name
FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Transactions
);

  /*5*/
  SELECT SUM(balance) AS total_balance
FROM Accounts
WHERE account_id NOT IN (
    SELECT DISTINCT account_id
    FROM Transactions
);
/*6*/
SELECT account_id, transaction_id, transaction_type, amount
FROM Transactions
WHERE account_id IN (
    SELECT account_id
    FROM Accounts
    WHERE balance = (
        SELECT MIN(balance)
        FROM Accounts
    )
);
/*7*/
SELECT customer_id, first_name, last_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Accounts
    GROUP BY customer_id
    HAVING COUNT(DISTINCT account_type) > 1
);
/*8*/
SELECT account_type, COUNT(*) * 100.0 / (
    SELECT COUNT(*)
    FROM Accounts
) AS percentage
FROM Accounts
GROUP BY account_type;

/*9*/
SELECT *
FROM Transactions
WHERE account_id IN (
    SELECT account_id
    FROM Accounts
    WHERE customer_id = 1
);

/*10*/
SELECT account_type, (
    SELECT SUM(balance)
    FROM Accounts a
    WHERE a.account_type = t.account_type
) AS total_balance
FROM Accounts t
GROUP BY account_type;



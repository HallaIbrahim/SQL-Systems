-- Create a Restaurant database
CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE Menu
(
  item_id INT NOT NULL,
  size INT NOT NULL,
  price FLOAT NOT NULL,
  ingredients VARCHAR(255) NOT NULL,
  PRIMARY KEY (item_id)
);


-- Insert values into Menu table
INSERT INTO dbo.Menu (item_id, size, price, ingredients) 
VALUES 
  (1, 2, 10.99, 'Ingredient 1'),
  (2, 1, 5.99, 'Ingredient 2'),
  (3, 3, 12.50, 'Ingredient 3'),
  (4, 2, 8.75, 'Ingredient 4'),
  (5, 1, 6.25, 'Ingredient 5');

CREATE TABLE Manager
(
  Manager_id INT NOT NULL,
  Manager_name VARCHAR(255) NOT NULL,
  Gender VARCHAR(255) NOT NULL,
  Age INT NOT NULL,
  Sallary FLOAT NOT NULL,
  Street VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  E_mail VARCHAR(255) NOT NULL,
  PRIMARY KEY (Manager_id)
);

-- Insert values into Manager table
INSERT INTO Manager (Manager_id, Manager_name, Gender, Age, Sallary, Street, City, E_mail)
VALUES 
  (1, 'Manager1', 'Male', 35, 5000, 'Street 1', 'City A', 'manager1@example.com'),
  (2, 'Manager2', 'Female', 28, 4800, 'Street 2', 'City B', 'manager2@example.com'),
  (3, 'Manager3', 'Male', 40, 5500, 'Street 3', 'City C', 'manager3@example.com'),
  (4, 'Manager4', 'Female', 32, 5200, 'Street 4', 'City D', 'manager4@example.com'),
  (5, 'Manager5', 'Male', 37, 5300, 'Street 5', 'City E', 'manager5@example.com');

CREATE TABLE Delivery_boy
(
  Delboy_ID INT NOT NULL,
  DelBoy_name VARCHAR(255) NOT NULL,
  DelBoy_phone VARCHAR(255) NOT NULL,
  PRIMARY KEY (Delboy_ID)
);
-- Insert values into Delivery_boy table
INSERT INTO Delivery_boy (Delboy_ID, DelBoy_name, DelBoy_phone)
VALUES 
  (1, 'DeliveryBoy1', '123-456-7890'),
  (2, 'DeliveryBoy2', '987-654-3210'),
  (3, 'DeliveryBoy3', '111-222-3333'),
  (4, 'DeliveryBoy4', '444-555-6666'),
  (5, 'DeliveryBoy5', '777-888-9999');

CREATE TABLE Manager_Phone
(
  Phone VARCHAR(255) NOT NULL,
  Manager_id INT NOT NULL,
  PRIMARY KEY (Phone, Manager_id),
  FOREIGN KEY (Manager_id) REFERENCES Manager(Manager_id)
);
-- Insert values into Manager_Phone table
INSERT INTO Manager_Phone (Phone, Manager_id)
VALUES 
  ('123-456-7890', 1),
  ('987-654-3210', 2),
  ('111-222-3333', 3),
  ('444-555-6666', 4),
  ('777-888-9999', 5);


CREATE TABLE Restaurant
(
  Name VARCHAR(255) NOT NULL,
  Hot_line VARCHAR(255) NOT NULL,
  Manager_id INT NOT NULL,
  PRIMARY KEY (Hot_line),
  FOREIGN KEY (Manager_id) REFERENCES Manager(Manager_id)
);
-- Insert values into Restaurant table
INSERT INTO Restaurant (Name, Hot_line, Manager_id)
VALUES 
  ('Restaurant1', '111-111-1111', 1),
  ('Restaurant2', '222-222-2222', 2),
  ('Restaurant3', '333-333-3333', 3),
  ('Restaurant4', '444-444-4444', 4),
  ('Restaurant5', '555-555-5555', 5);

CREATE TABLE Employee
(
  Email VARCHAR(255) NOT NULL,
  Employee_id INT NOT NULL,
  Employee_name VARCHAR(255) NOT NULL,
  Gender VARCHAR(255) NOT NULL,
  City VARCHAR(255) NOT NULL,
  Street VARCHAR(255) NOT NULL,
  Salary FLOAT NOT NULL,
  Age INT NOT NULL,
  Manager_id INT NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Manager_id) REFERENCES Manager(Manager_id)
);
-- Insert values into Employee table
INSERT INTO Employee (Email, Employee_id, Employee_name, Gender, City, Street, Salary, Age, Manager_id)
VALUES 
  ('emp1@example.com', 1, 'Employee1', 'Male', 'City X', 'Street X1', 3000, 25, 1),
  ('emp2@example.com', 2, 'Employee2', 'Female', 'City Y', 'Street Y2', 3200, 27, 2),
  ('emp3@example.com', 3, 'Employee3', 'Male', 'City Z', 'Street Z3', 3500, 29, 3),
  ('emp4@example.com', 4, 'Employee4', 'Female', 'City W', 'Street W4', 3100, 30, 4),
  ('emp5@example.com', 5, 'Employee5', 'Male', 'City V', 'Street V5', 3400, 32, 5);


CREATE TABLE Employee_Phone
(
  Phone VARCHAR(255) NOT NULL,
  Employee_id INT NOT NULL,
  PRIMARY KEY (Phone, Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
-- Insert values into Employee_Phone table
INSERT INTO Employee_Phone (Phone, Employee_id)
VALUES 
  ('111-111-1111', 1),
  ('222-222-2222', 2),
  ('333-333-3333', 3),
  ('444-444-4444', 4),
  ('555-555-5555', 5);

CREATE TABLE Bill
(
  Bill_num INT NOT NULL,
  Datee DATE NOT NULL,
  Unit_price INT NOT NULL,
  Quantity INT NOT NULL,
  Total_price FLOAT NOT NULL,
  Order_details VARCHAR(255) NOT NULL,
  Employee_id INT NOT NULL,
  PRIMARY KEY (Bill_num),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
-- Insert values into Bill table
INSERT INTO Bill (Bill_num, Datee, Unit_price, Quantity, Total_price, Order_details, Employee_id)
VALUES 
  (1, '2023-01-01', 10, 2, 20.00, 'Details 1', 1),
  (2, '2023-01-02', 15, 3, 45.00, 'Details 2', 2),
  (3, '2023-01-03', 8, 5, 40.00, 'Details 3', 3),
  (4, '2023-01-04', 20, 1, 20.00, 'Details 4', 4),
  (5, '2023-01-05', 12, 4, 48.00, 'Details 5', 5);

CREATE TABLE Customer
(
  Customer_id INT NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Phone_No VARCHAR(255) NOT NULL,
  Bill_num INT NOT NULL,
  PRIMARY KEY (Customer_id),
  FOREIGN KEY (Bill_num) REFERENCES Bill(Bill_num)
);
-- Insert values into Customer table
INSERT INTO Customer (Customer_id, Address, Name, Phone_No, Bill_num)
VALUES 
  (1, 'Address 1', 'Customer1', '111-111-1111', 1),
  (2, 'Address 2', 'Customer2', '222-222-2222', 2),
  (3, 'Address 3', 'Customer3', '333-333-3333', 3),
  (4, 'Address 4', 'Customer4', '444-444-4444', 4),
  (5, 'Address 5', 'Customer5', '555-555-5555', 5);
CREATE TABLE Orderr
(
  Order_id INT NOT NULL,
  Order_date DATE NOT NULL,
  Quantity INT NOT NULL,
  item_id INT NOT NULL,
  Customer_id INT NOT NULL,
  Delboy_ID INT NOT NULL,
  PRIMARY KEY (Order_id),
  FOREIGN KEY (item_id) REFERENCES Menu(item_id),
  FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
  FOREIGN KEY (Delboy_ID) REFERENCES Delivery_boy(Delboy_ID)
);
-- Insert values into Orderr table
INSERT INTO Orderr (Order_id, Order_date, Quantity, item_id, Customer_id, Delboy_ID)
VALUES 
  (1, '2023-01-01', 2, 1, 1, 1),
  (2, '2023-01-02', 3, 2, 2, 2),
  (3, '2023-01-03', 5, 3, 3, 3),
  (4, '2023-01-04', 1, 4, 4, 4),
  (5, '2023-01-05', 4, 5, 5, 5);

CREATE TABLE serve
(
  Order_id INT NOT NULL,
  Employee_id INT NOT NULL,
  PRIMARY KEY (Order_id, Employee_id),
  FOREIGN KEY (Order_id) REFERENCES Orderr(Order_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
);
-- Insert values into serve table
INSERT INTO serve (Order_id, Employee_id)
VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


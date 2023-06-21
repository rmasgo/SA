Aquest és un fitxer de mostra per crear les taules de la base de dades.

-- Table: Car
CREATE TABLE Car (
  Car_ID INT PRIMARY KEY,
  Serial_Number VARCHAR(20),
  Make VARCHAR(50),
  Model VARCHAR(150),
  Colour VARCHAR(100),
  Year INT,
  Car_for_Sale CHAR(1)
);

-- Table: Salesperson
CREATE TABLE Salesperson (
  Salesperson_ID INT PRIMARY KEY,
  Last_Name VARCHAR(50),
  First_Name VARCHAR(50)
);

-- Table: Customer
CREATE TABLE Customer (
  Customer_ID INT PRIMARY KEY,
  Last_Name VARCHAR(50),
  First_Name VARCHAR(50),
  Phone_Number VARCHAR(15),
  Address VARCHAR(255),
  City VARCHAR(150),
  State_Province VARCHAR(150),
  Country VARCHAR(150),
  Postal_Code VARCHAR(10)
);

-- Table: Parts
CREATE TABLE Parts (
  Parts_ID INT PRIMARY KEY,
  Part_Number VARCHAR(20),
  Description VARCHAR(255),
  Purchase_Price DECIMAL(10, 2),
  Retail_Price DECIMAL(10, 2)
);



-- Table: Mechanic
CREATE TABLE Mechanic (
  Mechanic_ID INT PRIMARY KEY,
  Last_Name VARCHAR(50),
  First_Name VARCHAR(50)
);

-- Table: Service
CREATE TABLE Service (
  Service_ID INT PRIMARY KEY,
  Service_Name VARCHAR(50),
  Hourly_Rate DECIMAL(10, 2)
);

-- Table: Service Ticket
CREATE TABLE Service_Ticket (
  Service_Ticket_ID INT PRIMARY KEY,
  Car_ID INT,
  Customer_ID INT,
  Date_Received DATE,
  Comments VARCHAR(255),
  Date_Returned_to_Customer DATE,
  FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);

-- Table: Service_Mechanic
CREATE TABLE Service_Mechanic (
  Service_Mechanic_ID INT PRIMARY KEY,
  Mechanic_ID INT,
  Service_Ticket_ID INT,
  Service_ID INT,
  Hours DECIMAL(10, 2),
  Comment VARCHAR(255),
  Rate DECIMAL(10, 2),
  FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic (Mechanic_ID),
  FOREIGN KEY (Service_Ticket_ID) REFERENCES Service_Ticket (Service_Ticket_ID),
  FOREIGN KEY (Service_ID) REFERENCES Service (Service_ID)
);



-- Table: Parts_Used
CREATE TABLE Parts_Used (
  Parts_Used_ID INT PRIMARY KEY,
  Part_ID INT,
  Service_Ticket_ID INT,
  Number_Used INT,
  Price DECIMAL(10, 2),
  FOREIGN KEY (Part_ID) REFERENCES Parts (Parts_ID),
  FOREIGN KEY (Service_Ticket_ID) REFERENCES Service_Ticket (Service_Ticket_ID)
);



-- Table: Sales Invoice
CREATE TABLE Sales_Invoice (
  Invoice_ID INT PRIMARY KEY,
  Invoice_Number VARCHAR(20),
  Date DATE,
  Car_ID INT,
  Customer_ID INT,
  Salesperson_ID INT,
  FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
  FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson (Salesperson_ID)
);

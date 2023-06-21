/*
Aquestes són només algunes exemples de consultes d'inserció, actualització i eliminació que pots realitzar a la base de dades. Modifica-les segons les teves necessitats específiques i les estructures de les taules. Tingues sempre precaució en realitzar operacions d'eliminació ja que esborren les dades de manera permanent de la base de dades.
*/

#Inserir un cotxe nou
INSERT INTO Car (Car_ID, Serial_Number, Make, Model, Colour, Year, Car_for_Sale)
VALUES (1, '123456789', 'Toyota', 'CR-V', 'Blau', 2022, 'Y');


#Actualitzar el color d'un cotxe específic:
UPDATE Car
SET Colour = 'Vermell'
WHERE Car_ID = 1;

#Eliminar un cotxe de la base de dades:
DELETE FROM Car
WHERE Car_ID = 1;


#Inserir una nova factura de venda:
INSERT INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date, Car_ID, Customer_ID, Salesperson_ID)
VALUES (1, 'FRA23-015', '2023-06-21', 1, 1, 1);


#Actualitzar el venedor d'una factura de venda específica:
UPDATE Sales_Invoice
SET Salesperson_ID = 2
WHERE Invoice_ID = 1;


#Eliminar una factura de venda de la base de dades:
DELETE FROM Sales_Invoice
WHERE Invoice_ID = 1;


#Inserir un client nou:
INSERT INTO Customer (Customer_ID, Last_Name, First_Name, Phone_Number, Address, City, State_Province, Country, Postal_Code)
VALUES (1, 'Doe', 'John', '123-456-7890', 'Carrer Major 123', 'Vilanova', 'Andorra', 'Andorra', '12345');


#Actualitzar el número de telèfon d'un client específic:
UPDATE Customer
SET Phone_Number = '687-654-321'
WHERE Customer_ID = 1;


#Eliminar un client de la base de dades:
DELETE FROM Customer
WHERE Customer_ID = 1;

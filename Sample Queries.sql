#Recupera tots els cotxes en venda:
SELECT * FROM Car WHERE Car_for_Sale = 'Y';


#Recupera les factures de venda amb els detalls del cotxe, el client i el venedor associats:
SELECT Sales_Invoice.Invoice_ID, Sales_Invoice.Invoice_Number, Sales_Invoice.Date,
       Car.Make, Car.Model, Car.Year, Car.Colour,
       Customer.First_Name AS Customer_First_Name, Customer.Last_Name AS Customer_Last_Name,
       Salesperson.First_Name AS Salesperson_First_Name, Salesperson.Last_Name AS Salesperson_Last_Name
FROM Sales_Invoice
JOIN Car ON Sales_Invoice.Car_ID = Car.Car_ID
JOIN Customer ON Sales_Invoice.Customer_ID = Customer.Customer_ID
JOIN Salesperson ON Sales_Invoice.Salesperson_ID = Salesperson.Salesperson_ID;


#Recupera tots els tiquets de servei i els detalls del cotxe, el client i el mecànic associats:
SELECT Service_Ticket.Service_Ticket_ID, Service_Ticket.Date_Received, Service_Ticket.Date_Returned_to_Customer,
       Car.Make, Car.Model, Car.Year, Car.Colour,
       Customer.First_Name AS Customer_First_Name, Customer.Last_Name AS Customer_Last_Name,
       Mechanic.First_Name AS Mechanic_First_Name, Mechanic.Last_Name AS Mechanic_Last_Name
FROM Service_Ticket
JOIN Car ON Service_Ticket.Car_ID = Car.Car_ID
JOIN Customer ON Service_Ticket.Customer_ID = Customer.Customer_ID
JOIN Mechanic ON Service_Ticket.Mechanic_ID = Mechanic.Mechanic_ID;


#Calcula el preu total per a cada tiquet de servei sumant els preus de les peces utilitzades:
SELECT Service_Ticket.Service_Ticket_ID, SUM(Parts_Used.Price) AS Total_Price
FROM Service_Ticket
JOIN Parts_Used ON Service_Ticket.Service_Ticket_ID = Parts_Used.Service_Ticket_ID
GROUP BY Service_Ticket.Service_Ticket_ID;


#Recupera la taxa horària mitjana per a cada mecànic de servei:
SELECT Mechanic.Mechanic_ID, Mechanic.First_Name, Mechanic.Last_Name, AVG(Service_Mechanic.Rate) AS Average_Hourly_Rate
FROM Mechanic
JOIN Service_Mechanic ON Mechanic.Mechanic_ID = Service_Mechanic.Mechanic_ID
GROUP BY Mechanic.Mechanic_ID, Mechanic.First_Name, Mechanic.Last_Name;

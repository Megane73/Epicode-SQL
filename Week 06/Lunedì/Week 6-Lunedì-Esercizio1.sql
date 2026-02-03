# 1 - Mi connetto al Database locale o faccio il restore
SHOW databases;
USE AdventureWorksDW;
SHOW TABLES;
DESCRIBE dimproduct;

#2 Esploro la tabelle dei prodotti (DimProduct)
SELECT * 
FROM dimproduct;

#3 Interrogo la tabella, estraggo alcuni campi e assegno degli alias "parlanti"
SELECT
    ProductKey AS Id_product,
    ProductAlternateKey AS alt_Id_product,
    EnglishProductName AS ProductName,
    Color,
    StandardCost AS cost,
    FinishedGoodsFlag AS finished_product
FROM dimproduct;

#4 Espongo solo i prodotti terminati
SELECT
    FinishedGoodsFlag AS finished_product
FROM dimproduct
WHERE finished_product = 1;

#5 Espongo i campi richiesti e ricerco i prodotti che iniziano per la coppia di lettere indicate
SELECT
    ProductKey,
    ModelName,
    EnglishProductName as ProductName,
    StandardCost,
    ListPrice
FROM dimproduct
WHERE ProductAlternateKey LIKE "FR%"
OR ProductAlternateKey LIKE "BK%";

#1 Ripeto l esercizio precedente aggiungendo i campi richiesti e il campo calcolato
SELECT
    ProductKey,
    ModelName,
    EnglishProductName as ProductName,
    StandardCost,
    ListPrice,
    ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey LIKE "FR%"
OR ProductAlternateKey LIKE "BK%";

#2 Esporre i prodotti teminati il cui prezzo è compreso tra 1000 e 2000
SELECT 
	ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    FinishedGoodsFlag,
    ListPrice
FROM dimproduct
WHERE FinishedGoodsFlag = 1 AND ListPrice BETWEEN 1000 AND 2000

#3 Esploro dimemployee
SELECT * FROM dimemployee;

#4 Espongo gli agenti (SalespersonFlag=1)
SELECT 
	EmployeeKey,
    FirstName,
    LastName,
    MiddleName,
    Title,
    Position,
	SalespersonFlag
FROM dimemployee
WHERE SalespersonFlag=1;

#5 Esploro FactResellerSales
SELECT * FROM FactResellerSales;

# Analizzo la tabella e ricavo il profitto per i codici prodotti richiesti
SELECT
	SalesOrderNumber,
    SalesOrderLineNumber,
    OrderDate,
    DueDate,
    ShipDate,
    ProductKey,
    SalesAmount,
    TotalProductCost,
    SalesAmount - TotalProductCost AS Revenue
FROM factresellersales
WHERE OrderDate >= "2020-01-01"
	AND ProductKey IN (597, 598, 477, 214);
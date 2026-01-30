# Creo la tabela fornitore
CREATE TABLE Supplier (
     SupplierID INT AUTO_INCREMENT PRIMARY KEY, # Chiave primaria auto incrementale di tipo intero
     CompanyName VARCHAR(70), # Nome del fornitore
     God VARCHAR(50) # Nome del prodotto fornito
);

#Creo la tabella prodotto
CREATE TABLE Product (
	ProductID INT AUTO_INCREMENT PRIMARY KEY, # Chiave primaria auto incrementale di tipo intero
    SupplierID INT, # Chiave esterna per collegare Supplier con Product
	ProductName VARCHAR(50), # Nome del prodotto in vendta
    Cost DECIMAL (5,2), # Costo del prodotto singolo
    CONSTRAINT FK_Supplier_Product FOREIGN KEY(SupplierID) REFERENCES Supplier(SupplierID) # Vincolo esterno da Product a Suplier
);

# Creo la tabella Ordini
CREATE TABLE Request (
     RequestID INT AUTO_INCREMENT PRIMARY KEY, # Chiave primaria auto incrementale di tipo intero
     ProductID INT, # Chiave esterna per collegare Request con Product
     Number TINYINT, # Numero di prodotti in un singolo odine
     RequestDate DATE, # date del ordine
     RequestCost Decimal (7,2), # Costo del ordine
     CONSTRAINT FK_Product_Request FOREIGN KEY(ProductID) REFERENCES Product(ProductID) # Vincolo esterno da Request a Product
);

#Creo la tabella degli indirizzi dei Clienti
CREATE TABLE Address(
    AddressID INT AUTO_INCREMENT PRIMARY KEY, # Chiave primaria auto incrementale di tipo intero
    Nation VARCHAR (30), # Stato dal quale proviene l ordine
    City VARCHAR (30), # Citta' da cui proviene l'ordine
    Street VARCHAR (50), # Strada del cliente
    ZIP_CODE VARCHAR (5) # CAP del cliente 
);

# Creo la tabella Clienti
CREATE TABLE Client(
    ClientID INT AUTO_INCREMENT PRIMARY KEY, # Chiave primaria auto incrementale di tipo intero
    RequestID INT, # Chiave esterna per collegare Client con Request
    AddressID INT, # Strada dove andra' consegnato l'ordine
    ClientName VARCHAR(40), # Nome del cliente
    ClientSurname VARCHAR (40), # Cognome del cliente
    Email  VARCHAR (50), # email del cliente
    CONSTRAINT FK_Request_Client FOREIGN KEY(RequestID) REFERENCES Request(RequestID), # Vincolo esterno da Client a Request
    CONSTRAINT FK_Address_Client FOREIGN KEY(AddressID) REFERENCES Address(AddressID) # Vincolo esterno da Client ad Address
);
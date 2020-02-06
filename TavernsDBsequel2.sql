DROP DATABASE IF EXISTS taverns_db;
CREATE DATABASE taverns_db;

DROP table IF EXISTS tavernName, locationAddress, OwnerUserName, RoleOwners, Floors, Rats, Supplies, SuppliesRecieved, Services, ServiceStatus, Sales;

USE taverns_db;

CREATE TABLE tavernName (
	idTavern INTEGER NOT NULL AUTO_INCREMENT,
    nameTavern VARCHAR(100),
    idLocation INTEGER,
    idOwner INTEGER,
    idSupplies INTEGER
    -- PRIMARY KEY (idTavern)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

CREATE TABLE locationAddress (
	idLocation INTEGER NOT NULL AUTO_INCREMENT,
    locAddress VARCHAR(100),
    idTavern INTEGER,
    idOwner INTEGER,
    idSupplies INTEGER
    -- PRIMARY KEY (idLocation)
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

CREATE TABLE OwnerUserName (
	idOwner INTEGER NOT NULL AUTO_INCREMENT,
    userName VARCHAR(100),
    idRole INTEGER
    -- PRIMARY KEY (idOwner)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern)
);

CREATE TABLE RoleOwners (
    idRole INTEGER NOT NULL AUTO_INCREMENT,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(500),
    idOwner INTEGER
);

CREATE TABLE Floors (
    idFloors INTEGER NOT NULL AUTO_INCREMENT,
    NumberofFloors INTEGER,
    idLocation INTEGER
);

CREATE TABLE Rats (
    idRats INTEGER NOT NULL AUTO_INCREMENT,
    RatName VARCHAR(100),
    idLocation INTEGER,
    idTavern INTEGER
);

CREATE TABLE Supplies (
    idSupplies INTEGER NOT NULL AUTO_INCREMENT,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount INTEGER,
    idLocation INTEGER
);

CREATE TABLE SuppliesRecieved (
    idSuppliesRecieved INTEGER NOT NULL AUTO_INCREMENT,
    idSupplies INTEGER,
    idTavern INTEGER,
    idLocation INTEGER,
    Cost DECIMAL(38,2),
    AmountReceived INTEGER,
    RecievedDate DATETIME
);

CREATE TABLE Services (
    idServices INTEGER NOT NULL AUTO_INCREMENT,
    ServiceName VARCHAR(100),

)

CREATE TABLE ServiceStatus (
    idServicesStatus INTEGER NOT NULL AUTO_INCREMENT,
    StatusofService BOOLEAN,
    idServices INTEGER,
);

CREATE TABLE Sales (
    idSales INTEGER NOT NULL AUTO_INCREMENT,
    idServices INTEGER,
    GuestName VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased INTEGER,
    idTaver INTEGER
);
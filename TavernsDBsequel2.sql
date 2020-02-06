DROP DATABASE IF EXISTS taverns_db;
CREATE DATABASE taverns_db;

DROP table IF EXISTS tavernName, locationAddress, OwnerUserName, RoleOwners, Floors, Rats, Supplies, SuppliesRecieved, Services, ServiceStatus, Sales;

USE taverns_db;

CREATE TABLE tavernName (
	idTavern int IDENTITY(1,1) PRIMARY KEY,
    nameTavern VARCHAR(100),
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation),
    idOwner int FOREIGN KEY REFERENCES OwnerUserName(idOwner),
    idSupplies int FOREIGN KEY REFERENCES Supplies(idSupplies)
    -- PRIMARY KEY (idTavern)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

INSERT INTO tavernName (nameTavern)
    VALUES
        ("Bob's Tavern"),
        ("Bill's Tavern"),
        ("Will's Tavern"),
        ("Phil's Tavern"),
        ("Carl's Tavern");

CREATE TABLE locationAddress (
	idLocation int IDENTITY(1,1) PRIMARY KEY,
    locAddress VARCHAR(100),
    idTavern int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idOwner int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idSupplies int FOREIGN KEY REFERENCES Supplies(idSupplies)
    -- PRIMARY KEY (idLocation)
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

INSERT INTO locationAddress (locAddress)
    VALUES
        ("100 Main"),
        ("200 Main"),
        ("300 Main"),
        ("400 Main"),
        ("500 Main");

CREATE TABLE OwnerUserName (
	idOwner int IDENTITY(1,1) PRIMARY KEY,
    userName VARCHAR(100),
    idRole int FOREIGN KEY REFERENCES Supplies(idSupplies)
    -- PRIMARY KEY (idOwner)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern)
);

INSERT INTO OwnerUserName (userName)
    VALUES
        ("Bob"),
        ("Bill"),
        ("Will"),
        ("Phil"),
        ("Carl");

CREATE TABLE RoleOwners (
    idRole int IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(500),
    idOwner int FOREIGN KEY REFERENCES Supplies(idSupplies)
);

INSERT INTO RoleOwners (RoleName)
    VALUES
        ("COO"),
        ("CFO"),
        ("President"),
        ("Vice President"),
        ("Janitor");

CREATE TABLE Floors (
    idFloors int IDENTITY(1,1) PRIMARY KEY,
    NumberofFloors int,
    idLocation int FOREIGN KEY REFERENCES Supplies(idSupplies)
);

INSERT INTO Floors (NumberofFloors)
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

CREATE TABLE Rats (
    idRats int IDENTITY(1,1) PRIMARY KEY,
    RatName VARCHAR(100),
    idLocation int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idTavern int FOREIGN KEY REFERENCES Supplies(idSupplies)
);

INSERT INTO Rats (RatName)
    VALUES
        ("Remy"),
        ("Samuel Whiskers"),
        ("Templeton"),
        ("Rattie"),
        ("Scabbers");

CREATE TABLE Supplies (
    idSupplies int IDENTITY(1,1) PRIMARY KEY,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount int,
    idLocation int FOREIGN KEY REFERENCES Supplies(idSupplies)
);

INSERT INTO Supplies (SupplyDate, NameSupply, )
    VALUES
        ("")

CREATE TABLE SuppliesRecieved (
    idSuppliesRecieved int IDENTITY(1,1) PRIMARY KEY,
    idSupplies int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idTavern int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idLocation int FOREIGN KEY REFERENCES Supplies(idSupplies),
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME
);

CREATE TABLE Services (
    idServices int IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100),
);

CREATE TABLE ServiceStatus (
    idServicesStatus int IDENTITY(1,1) PRIMARY KEY,
    StatusofService BOOLEAN,
    idServices int FOREIGN KEY REFERENCES Supplies(idSupplies),
);

CREATE TABLE Sales (
    idSales int IDENTITY(1,1) PRIMARY KEY,
    idServices int FOREIGN KEY REFERENCES Supplies(idSupplies),
    GuestName VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int FOREIGN KEY REFERENCES Supplies(idSupplies)
);


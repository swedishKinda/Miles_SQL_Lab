DROP DATABASE IF EXISTS taverns_db;
CREATE DATABASE taverns_db;

DROP table IF EXISTS tavernName, locationAddress, OwnerUserName, RoleOwners, Floors, Rats, Supplies, SuppliesRecieved, Services, ServiceStatus, Sales;

USE taverns_db;

CREATE TABLE tavernName (
	idTavern int NOT NULL AUTO_INCREMENT,
    nameTavern VARCHAR(100),
    idLocation int,
    idOwner int,
    idSupplies int
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
	idLocation int NOT NULL AUTO_INCREMENT,
    locAddress VARCHAR(100),
    idTavern int,
    idOwner int,
    idSupplies int
    -- PRIMARY KEY (idLocation)
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

INSERT INTO locationAddrss (locAddress)
    VALUES
        ("100 Main"),
        ("200 Main"),
        ("300 Main"),
        ("400 Main"),
        ("500 Main");

CREATE TABLE OwnerUserName (
	idOwner int NOT NULL AUTO_INCREMENT,
    userName VARCHAR(100),
    idRole int
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
    idRole int NOT NULL AUTO_INCREMENT,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(500),
    idOwner int
);

INSERT INTO RoleOwners (RoleName)
    VALUES
        ("COO"),
        ("CFO"),
        ("President"),
        ("Vice President"),
        ("Janitor");

CREATE TABLE Floors (
    idFloors int NOT NULL AUTO_INCREMENT,
    NumberofFloors int,
    idLocation int
);

INSERT INTO Floors (NumberofFloors)
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

CREATE TABLE Rats (
    idRats int NOT NULL AUTO_INCREMENT,
    RatName VARCHAR(100),
    idLocation int,
    idTavern int
);

INSERT INTO Rats (RatName)
    VALUES
        ("Remy"),
        ("Samuel Whiskers"),
        ("Templeton"),
        ("Rattie"),
        ("Scabbers");

CREATE TABLE Supplies (
    idSupplies int NOT NULL AUTO_INCREMENT,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount int,
    idLocation int
);

INSERT INTO Supplies (SupplyDate)
    VALUES
        ("")

CREATE TABLE SuppliesRecieved (
    idSuppliesRecieved int NOT NULL AUTO_INCREMENT,
    idSupplies int,
    idTavern int,
    idLocation int,
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME
);

CREATE TABLE Services (
    idServices int NOT NULL AUTO_INCREMENT,
    ServiceName VARCHAR(100),

)

CREATE TABLE ServiceStatus (
    idServicesStatus int NOT NULL AUTO_INCREMENT,
    StatusofService BOOLEAN,
    idServices int,
);

CREATE TABLE Sales (
    idSales int NOT NULL AUTO_INCREMENT,
    idServices int,
    GuestName VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int
);


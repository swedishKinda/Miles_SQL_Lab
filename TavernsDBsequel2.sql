-- DROP DATABASE IF EXISTS taverns_db;
-- CREATE DATABASE taverns_db;

USE taverns_db;

DROP TABLE IF EXISTS tavernName, locationAddress, OwnerUserName, RoleOwners, Floors, Rats, Supplies, SuppliesRecieved, Services, ServiceStatus, Sales;


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

CREATE TABLE locationAddress (
	idLocation int IDENTITY(1,1) PRIMARY KEY,
    locAddress VARCHAR(100),
    idTavern int FOREIGN KEY REFERENCES tavernName(idTavern),
    idOwner int FOREIGN KEY REFERENCES OwnerUserName(idOwner),
    idSupplies int FOREIGN KEY REFERENCES Supplies(idSupplies)
    -- PRIMARY KEY (idLocation)
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

CREATE TABLE OwnerUserName (
	idOwner int IDENTITY(1,1) PRIMARY KEY,
    userName VARCHAR(100),
    idRole int FOREIGN KEY REFERENCES RoleOwners(idRole),
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation),
    idTavern int FOREIGN KEY REFERENCES tavernName(idTavern)
    -- PRIMARY KEY (idOwner)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern)
);

CREATE TABLE RoleOwners (
    idRole int IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(500),
    idOwner int FOREIGN KEY REFERENCES OwnerUserName(idOwner)
);

CREATE TABLE Floors (
    idFloors int IDENTITY(1,1) PRIMARY KEY,
    NumberofFloors int,
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation)
);

CREATE TABLE Rats (
    idRats int IDENTITY(1,1) PRIMARY KEY,
    RatName VARCHAR(100),
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation),
    idTavern int FOREIGN KEY REFERENCES tavernName(idTavern)
);

CREATE TABLE Supplies (
    idSupplies int IDENTITY(1,1) PRIMARY KEY,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount int,
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation)
);

CREATE TABLE SuppliesRecieved (
    idSuppliesRecieved int IDENTITY(1,1) PRIMARY KEY,
    idSupplies int FOREIGN KEY REFERENCES Supplies(idSupplies),
    idTavern int FOREIGN KEY REFERENCES tavernName(idTavern),
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation),
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME
);

CREATE TABLE Services (
    idServices int IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100),
    idLocation int FOREIGN KEY REFERENCES locationAddress(idLocation)
);

CREATE TABLE ServiceStatus (
    idServicesStatus int IDENTITY(1,1) PRIMARY KEY,
    StatusofService BOOLEAN,
    idServices int FOREIGN KEY REFERENCES Services(idServices)
);

CREATE TABLE Sales (
    idSales int IDENTITY(1,1) PRIMARY KEY,
    idServices int FOREIGN KEY REFERENCES Supplies(idSupplies),
    GuestName VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int FOREIGN KEY REFERENCES tavernName(idTavern)
);

INSERT INTO tavernName (nameTavern)
    VALUES
        ("Bob's Tavern"),
        ("Bill's Tavern"),
        ("Stephanie's Tavern"),
        ("Phil's Tavern"),
        ("Carolyn's Tavern");

INSERT INTO locationAddress (locAddress)
    VALUES
        ("100 Main"),
        ("200 Main"),
        ("300 Main"),
        ("400 Main"),
        ("500 Main");

INSERT INTO OwnerUserName (userName)
    VALUES
        ("Bob"),
        ("Bill"),
        ("Will"),
        ("Phil"),
        ("Carl");

INSERT INTO RoleOwners (RoleName)
    VALUES
        ("COO"),
        ("CFO"),
        ("President"),
        ("Vice President"),
        ("Janitor");

INSERT INTO Floors (NumberofFloors)
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

INSERT INTO Rats (RatName)
    VALUES
        ("Remy"),
        ("Samuel Whiskers"),
        ("Templeton"),
        ("Rattie"),
        ("Scabbers");

INSERT INTO Supplies (SupplyDate, NameSupply, SupplyCount)
    VALUES 
        ("11/16/2012 00:00:00", "Peanuts", 22),
        ("11/16/2012 00:00:00", "Pistachios", 45),
        ("11/16/2012 00:00:00", "Chips", 50),
        ("11/16/2012 00:00:00", "Fish", 40),
        ("11/16/2012 00:00:00", "Meatballs", 60);

INSERT INTO SuppliesRecieved (Cost, AmountReceived, RecievedDate)
    VALUES
        -- (22.22, 22, CONVERT(DATETIME, "12/19/2012 00:00:00")),
                
        (22.22, 22, "12/19/2012 00:00:00"),
        (44.44, 44, "12/19/2012 00:00:00"),
        (55.55, 55, "12/19/2012 00:00:00"),
        (66.66, 66, "12/19/2012 00:00:00"),
        (77.77, 77, "12/19/2012 00:00:00");

INSERT INTO Services (ServiceName)
    VALUES
        ("Pool"),
        ("Darts"),
        ("Bowling"),
        ("Skeet"),
        ("VolleyBall");

INSERT INTO ServiceStatus (StatusofService)
    VALUES
        (true),
        (false),
        (true),
        (false),
        (false);

INSERT INTO Sales (GuestName, Price, DatePurchased, AmountPurchased)
    VALUES
        ("Dilan Bob", 22.22, "05/22/2013 00:00:00", 10),
        ("Stuart Bib", 22.22, "05/22/2013 00:00:00", 10),
        ("Macho Man", 22.22, "05/22/2013 00:00:00", 10),
        ("Jessica Collins", 22.22, "05/22/2013 00:00:00", 10),
        ("Milton Bradley", 22.22, "05/22/2013 00:00:00", 10);

SELECT * FROM tavernName ORDER BY idTavern DESC;
SELECT * FROM locationAddress ORDER BY idLocation DESC;
SELECT * FROM OwnerUserName ORDER BY idOwner DESC;
SELECT * FROM RoleOwners ORDER BY idRole DESC;
SELECT * FROM Floors ORDER BY idFloors DESC;
SELECT * FROM Rats ORDER BY idRats DESC;
SELECT * FROM Supplies ORDER BY idSupplies DESC;
SELECT * FROM SuppliesRecieved ORDER BY idSuppliesRecieved DESC;
SELECT * FROM Services ORDER BY idServices DESC;
SELECT * FROM ServiceStatus ORDER BY idServiceStatus DESC;
SELECT * FROM Sales ORDER BY idSales DESC;
DROP TABLE IF EXISTS Sales, taverns, locationAddress, OwnerUserName, RoleOwners, Floors, Supplies, SuppliesRecieved, Services, ServiceStatus;


CREATE TABLE taverns (
    idTavern int IDENTITY(1,1) PRIMARY KEY,
    nameTavern VARCHAR(100)
);

CREATE TABLE locationAddress (
    idLocation int IDENTITY(1,1) PRIMARY KEY,
    locAddress VARCHAR(100)
);

CREATE TABLE OwnerUserName (
    idOwner int IDENTITY(1,1) PRIMARY KEY,
    userName VARCHAR(100)
);

CREATE TABLE RoleOwners (
    idRole int IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(500)
);

CREATE TABLE Floors (
    idFloors int IDENTITY(1,1) PRIMARY KEY,
    NumberofFloors int
);

CREATE TABLE Supplies (
    idSupplies int IDENTITY(1,1) PRIMARY KEY,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount int
);

CREATE TABLE SuppliesRecieved (
    idSuppliesRecieved int IDENTITY(1,1) PRIMARY KEY,
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME
);

CREATE TABLE Services (
    idServices int IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100)
);

CREATE TABLE ServiceStatus (
    idServicesStatus int IDENTITY(1,1) PRIMARY KEY,
    StatusofService BIT
);

CREATE TABLE Sales (
    idSales int IDENTITY(1,1) PRIMARY KEY,
    idServices int FOREIGN KEY REFERENCES Supplies(idSupplies),
    GuestName VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int FOREIGN KEY REFERENCES taverns(idTavern)
);

INSERT INTO taverns (nameTavern)
    VALUES
        ('Bobs Tavern'),
		('Bills Tavern'),
        ('Stephanies Tavern'),
        ('Phils Tavern'),
        ('Carolyns Tavern');

INSERT INTO locationAddress (locAddress)
    VALUES
        ('100 Main'),
        ('200 Main'),
        ('300 Main'),
        ('400 Main'),
        ('500 Main');

INSERT INTO OwnerUserName (userName)
    VALUES
        ('Bob'),
        ('Bill'),
        ('Will'),
        ('Phil'),
        ('Carl');

INSERT INTO RoleOwners (RoleName, RoleDescription)
    VALUES
        ('COO', 'ginger'),
        ('CFO', 'bread'),
        ('President', 'man'),
        ('Vice President', 'is'),
        ('Janitor', 'cool');

INSERT INTO Floors (NumberofFloors)
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

INSERT INTO Supplies (SupplyDate, NameSupply, SupplyCount)
    VALUES 
        ('11/16/2012 00:00:00', 'Peanuts', 22),
        ('11/16/2012 00:00:00', 'Pistachios', 45),
        ('11/16/2012 00:00:00', 'Chips', 50),
        ('11/16/2012 00:00:00', 'Fish', 40),
        ('11/16/2012 00:00:00', 'Meatballs', 60);

INSERT INTO SuppliesRecieved (Cost, AmountReceived, RecievedDate)
    VALUES
        -- (22.22, 22, CONVERT(DATETIME, "12/19/2012 00:00:00")),
                
        (22.22, 22, '12/19/2012 00:00:00'),
        (44.44, 44, '12/19/2012 00:00:00'),
        (55.55, 55, '12/19/2012 00:00:00'),
        (66.66, 66, '12/19/2012 00:00:00'),
        (77.77, 77, '12/19/2012 00:00:00');

INSERT INTO Services (ServiceName)
    VALUES
        ('Pool'),
        ('Darts'),
        ('Bowling'),
        ('Skeet'),
        ('VolleyBall');

INSERT INTO ServiceStatus (StatusofService)
    VALUES
        (1),
        (0),
        (1),
        (0),
        (0);

INSERT INTO Sales (GuestName, Price, DatePurchased, AmountPurchased)
    VALUES
        ('Dilan Bob', 22.22, '05/22/2013 00:00:00', 10),
        ('Stuart Bib', 22.22, '05/22/2013 00:00:00', 10),
        ('Macho Man', 22.22, '05/22/2013 00:00:00', 10),
        ('Jessica Collins', 22.22, '05/22/2013 00:00:00', 10),
        ('Milton Bradley', 22.22, '05/22/2013 00:00:00', 10);

SELECT * FROM taverns;
SELECT * FROM locationAddress;
SELECT * FROM OwnerUserName;
SELECT * FROM RoleOwners;
SELECT * FROM Floors;
SELECT * FROM Supplies;
SELECT * FROM SuppliesRecieved;
SELECT * FROM Services;
SELECT * FROM ServiceStatus;
SELECT * FROM Sales;
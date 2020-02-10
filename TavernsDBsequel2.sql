DROP TABLE IF EXISTS SalesSupplyLinking, LevelsLinking, Classes, Levels, GuestStatuses, Guests, Sales, ServiceStatus, Services, SuppliesReceived, Supplies, RoleOwners, OwnerUserName, locationAddress, taverns;


CREATE TABLE taverns (
    idTavern int IDENTITY(1,1) PRIMARY KEY,
    nameTavern VARCHAR(100),
	Floors int,
	idLocation int,
	idOwner int
);

CREATE TABLE locationAddress (
    idLocation int IDENTITY(1,1) PRIMARY KEY,
    locAddress VARCHAR(100),
	City VARCHAR(100),
	Country VARCHAR(100)
);

CREATE TABLE OwnerUserName (
    idOwner int IDENTITY(1,1) PRIMARY KEY,
    userName VARCHAR(100),
	idRole int
);

CREATE TABLE RoleOwners (
    idRole int IDENTITY(1,1) PRIMARY KEY,
    RoleName VARCHAR(100),
    RoleDescription VARCHAR(Max)
);

CREATE TABLE Supplies (
    idSupplies int IDENTITY(1,1) PRIMARY KEY,
    SupplyDate DATETIME,
    NameSupply VARCHAR(100),
    SupplyCount int,
	idTavern int
);

CREATE TABLE SuppliesReceived (
    idSuppliesRecieved int IDENTITY(1,1) PRIMARY KEY,
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME,
	idTavern int,
	idSupplies int
);
CREATE TABLE Services (
    idServices int IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100),
	idServicesStatus int
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

CREATE TABLE Guests (
    idGuests int IDENTITY(1,1) PRIMARY KEY,
    NameGuest VARCHAR(250),
    Notes VARCHAR(Max),
    Birthday DATE,
    CakeDay DATE,
	idGuestStatuses tinyint
);

CREATE TABLE GuestStatuses (
    idGuestStatuses tinyint IDENTITY(1,1) PRIMARY KEY,
    NameGuestStatus VARCHAR(50)
);

CREATE TABLE Levels (
    idLevels tinyint IDENTITY(1,1) PRIMARY KEY,
    DateLevel DATE
);

CREATE TABLE Classes (
    idClasses tinyint IDENTITY(1,1) PRIMARY KEY,
    NameClass VARCHAR (50)
);

CREATE TABLE LevelsLinking (
	idClasses tinyint,
	idLevels tinyint
);

CREATE TABLE SalesSupplyLinking (
	idSales int,
	idSupplies int
);


ALTER TABLE taverns ADD FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation);
ALTER TABLE taverns ADD FOREIGN KEY (idOwner) REFERENCES OwnerUserName(idOwner);

ALTER TABLE OwnerUserName ADD FOREIGN KEY (idRole) REFERENCES RoleOwners(idRole);

ALTER TABLE Supplies ADD FOREIGN KEY (idTavern) REFERENCES taverns(idTavern);

ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idTavern) REFERENCES taverns(idTavern);
ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(idSupplies);

ALTER TABLE Services ADD FOREIGN KEY (idServicesStatus) REFERENCES ServiceStatus(idServicesStatus);


ALTER TABLE Guests ADD FOREIGN KEY (idGuestStatuses) REFERENCES GuestStatuses(idGuestStatuses);

ALTER TABLE Supplies ADD Units VARCHAR(50);
ALTER TABLE SuppliesReceived ADD UnitsReceived VARCHAR(50);

ALTER TABLE LevelsLinking ADD FOREIGN KEY (idClasses) REFERENCES Classes(idClasses);
ALTER TABLE LevelsLinking ADD FOREIGN KEY (idLevels) REFERENCES Levels(idLevels);

ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSales) REFERENCES Sales(idSales);
ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(idSupplies);

INSERT INTO taverns (nameTavern, Floors)
    VALUES
        ('Bobs Tavern', 1),
		('Bills Tavern', 2),
        ('Stephanies Tavern', 3),
        ('Phils Tavern', 4),
        ('Carolyns Tavern', 5);

INSERT INTO locationAddress (locAddress, City, Country)
    VALUES
        ('100 Main', 'Baltimore', 'USA'),
        ('200 Main', 'Philadelphia', 'USA'),
        ('300 Main', 'Munich', 'Germany'),
        ('400 Main', 'London', 'England'),
        ('500 Main', 'St. Petersburg', 'Russia');

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

INSERT INTO Supplies (SupplyDate, NameSupply, SupplyCount, Units)
    VALUES 
        ('11/16/2012 00:00:00', 'Peanuts', 22, 'Oz'),
        ('11/16/2012 00:00:00', 'Pistachios', 45, 'Oz'),
        ('11/16/2012 00:00:00', 'Chips', 50, 'Oz'),
        ('11/16/2012 00:00:00', 'Fish', 40, 'Oz'),
        ('11/16/2012 00:00:00', 'Meatballs', 60, 'Oz');

INSERT INTO SuppliesReceived (Cost, AmountReceived, RecievedDate, UnitsReceived)
    VALUES
        (22.22, 22, '12/19/2012 00:00:00', 'Oz'),
        (44.44, 44, '12/19/2012 00:00:00', 'Oz'),
        (55.55, 55, '12/19/2012 00:00:00', 'Oz'),
        (66.66, 66, '12/19/2012 00:00:00', 'Oz'),
        (77.77, 77, '12/19/2012 00:00:00', 'Oz');

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

INSERT INTO Guests (NameGuest, Notes, Birthday, CakeDay)
	Values
		('William Tate', 'Hes Cool', '03/10/1967', '05/08/2000'),
		('Ivo Brook', 'Stuff', '05/11/1960', '06/09/2000'),
		('Dario Weaver', 'More stuff', '06/15/1966', '06/08/2000'),
		('Ahyan Hopkins', 'More more stuff', '05/10/1962', '05/12/2000'),
		('Myrtle Klein', 'More more more stuff', '03/16/1972', '05/22/2000');

INSERT INTO GuestStatuses (NameGuestStatus)
	VALUES
		('Happy'),
		('Hungry'),
		('Tired'),
		('Raging'),
		('Placid');

INSERT INTO Levels (DateLevel)
	VALUES
		('02/01/2020'),
		('02/02/2020'),
		('02/03/2020'),
		('02/04/2020'),
		('02/05/2020');

INSERT INTO Classes (NameClass)
	VALUES
		('Knight'),
		('Mage'),
		('Archer'),
		('Squire'),
		('Alchemist');


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
SELECT * FROM Guests;
SELECT * FROM GuestStatuses;
SELECT * FROM Levels;
SELECT * FROM Classes;
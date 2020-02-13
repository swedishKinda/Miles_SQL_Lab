DROP TABLE IF EXISTS Stays, Rooms, SalesSupplyLinking, LevelsLinking, Classes, Levels, GuestStatuses, Guests, Sales, ServiceStatus, Services, SuppliesReceived, Supplies, RoleOwners, OwnerUserName, locationAddress, taverns;


CREATE TABLE taverns (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
	Floors int,
	idLocation int,
	idOwner int
);

CREATE TABLE locationAddress (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
	City VARCHAR(100),
	Country VARCHAR(100)
);

CREATE TABLE OwnerUserName (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
	idRole int
);

CREATE TABLE RoleOwners (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    RoleDescription VARCHAR(Max)
);

CREATE TABLE Supplies (
    id int IDENTITY(1,1) PRIMARY KEY,
    SupplyDate DATETIME,
    Name VARCHAR(100),
    SupplyCount int,
	idTavern int
);

CREATE TABLE SuppliesReceived (
    id int IDENTITY(1,1) PRIMARY KEY,
    Cost DECIMAL(38,2),
    AmountReceived int,
    RecievedDate DATETIME,
	idTavern int,
	idSupplies int
);

CREATE TABLE Services (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
	idServicesStatus int
);

CREATE TABLE ServiceStatus (
    id int IDENTITY(1,1) PRIMARY KEY,
    StatusofService BIT
);

CREATE TABLE Sales (
    id int IDENTITY(1,1) PRIMARY KEY,
    idServices int FOREIGN KEY REFERENCES Supplies(id),
    Name VARCHAR(100),
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int FOREIGN KEY REFERENCES taverns(id)
);

CREATE TABLE Guests (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(250),
    Notes VARCHAR(Max),
    Birthday DATE,
    CakeDay DATE,
	idGuestStatuses tinyint
);

CREATE TABLE GuestStatuses (
    id tinyint IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Levels (
    id tinyint IDENTITY(1,1) PRIMARY KEY,
    DateLevel DATE
);

CREATE TABLE Classes (
    id tinyint IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR (50),
	DescriptionClass VARCHAR (500)
);

CREATE TABLE LevelsLinking (
	idClasses tinyint,
	idLevels tinyint
);

CREATE TABLE SalesSupplyLinking (
	idSales int,
	idSupplies int
);

CREATE TABLE Rooms (
	id int IDENTITY(1,1) PRIMARY KEY,
	Number int,
	StatusRoom VARCHAR(100),
	Cost DECIMAL(5,2),
	idTavern int,
	idStays int
);

CREATE TABLE Stays (
	id int IDENTITY(1,1) PRIMARY KEY,
	idSale int,
	idGuest int,
	idRoom int,
	DateStayed DATE,
	Rate DECIMAL(5,2)
);


ALTER TABLE taverns ADD FOREIGN KEY (idLocation) REFERENCES locationAddress(id);
ALTER TABLE taverns ADD FOREIGN KEY (idOwner) REFERENCES OwnerUserName(id);

ALTER TABLE OwnerUserName ADD FOREIGN KEY (idRole) REFERENCES RoleOwners(id);

ALTER TABLE Supplies ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);

ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);
ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(id);

ALTER TABLE Services ADD FOREIGN KEY (idServicesStatus) REFERENCES ServiceStatus(id);

ALTER TABLE Guests ADD FOREIGN KEY (idGuestStatuses) REFERENCES GuestStatuses(id);

ALTER TABLE Supplies ADD Units VARCHAR(50);
ALTER TABLE SuppliesReceived ADD UnitsReceived VARCHAR(50);

ALTER TABLE LevelsLinking ADD FOREIGN KEY (idClasses) REFERENCES Classes(id);
ALTER TABLE LevelsLinking ADD FOREIGN KEY (idLevels) REFERENCES Levels(id);

ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSales) REFERENCES Sales(id);
ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(id);

ALTER TABLE Rooms ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);

ALTER TABLE Stays ADD FOREIGN KEY (idSale) REFERENCES Sales(id);
ALTER TABLE Stays ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Stays ADD FOREIGN KEY (idRoom) REFERENCES Rooms(id);

INSERT INTO taverns (Name, Floors)
    VALUES
        ('Bobs Tavern', 1),
		('Bills Tavern', 2),
        ('Stephanies Tavern', 3),
        ('Phils Tavern', 4),
        ('Carolyns Tavern', 5);

INSERT INTO locationAddress (Name, City, Country)
    VALUES
        ('100 Main', 'Baltimore', 'USA'),
        ('200 Main', 'Philadelphia', 'USA'),
        ('300 Main', 'Munich', 'Germany'),
        ('400 Main', 'London', 'England'),
        ('500 Main', 'St. Petersburg', 'Russia');

INSERT INTO OwnerUserName (Name)
    VALUES
        ('Bob'),
        ('Bill'),
        ('Will'),
        ('Phil'),
        ('Carl');

INSERT INTO RoleOwners (Name, RoleDescription)
    VALUES
        ('COO', 'ginger'),
        ('CFO', 'bread'),
        ('President', 'man'),
        ('Vice President', 'is'),
        ('Janitor', 'cool');

INSERT INTO Supplies (SupplyDate, Name, SupplyCount, Units)
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

INSERT INTO Services (Name)
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

INSERT INTO Sales (Name, Price, DatePurchased, AmountPurchased)
    VALUES
        ('Dilan Bob', 22.29, '05/22/2013 00:00:00', 10),
        ('Stuart Bib', 22.28, '05/22/2013 00:00:00', 10),
        ('Macho Man', 22.70, '05/22/2013 00:00:00', 10),
        ('Jessica Collins', 22.26, '05/22/2013 00:00:00', 10),
        ('Milton Bradley', 22.25, '05/22/2013 00:00:00', 10),
		('Dilan Bob', 22.24, '05/22/2013 00:00:00', 10),
        ('Stuart Bib', 22.23, '05/22/2013 00:00:00', 10),
        ('Macho Man', 22.50, '05/22/2013 00:00:00', 10),
        ('Jessica Collins', 22.21, '05/22/2013 00:00:00', 10),
        ('Milton Bradley', 22.20, '05/22/2013 00:00:00', 10),
		('Dilan Bob', 22.19, '05/22/2013 00:00:00', 10),
        ('Stuart Bib', 22.18, '05/22/2013 00:00:00', 10),
        ('Macho Man', 22.17, '05/22/2013 00:00:00', 10),
        ('Jessica Collins', 22.16, '05/22/2013 00:00:00', 10),
        ('Milton Bradley', 42.15, '05/22/2013 00:00:00', 10);

INSERT INTO Guests (Name, Notes, Birthday, CakeDay)
	Values
		('William Tate', 'Hes Cool', '03/10/1967', '05/08/2000'),
		('Ivo Brook', 'Stuff', '05/11/1960', '06/09/2003'),
		('Ahyan Hopkins', 'More stuff', '06/15/1966', '06/08/2000'),
		('Ahyan Hopkins', 'More more stuff', '05/10/1962', '05/12/2000'),
		('Myrtle Klein', 'More more more stuff', '03/16/2004', '05/22/2000');

INSERT INTO GuestStatuses (Name)
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

INSERT INTO Classes (Name, DescriptionClass)
	VALUES
		('Knight', 'Slays monsters'),
		('Mage', 'Uses Magic'),
		('Archer', 'Shoots Shit'),
		('Squire', 'Apprentice to Knight'),
		('Alchemist', 'Makes potions');

INSERT INTO Rooms (Number, StatusRoom, Cost)
	VALUES
		(145, 'Clean', 50),
		(250, 'Dirty', 75),
        (400, 'Destroyed', 100),
        (450, 'Smells', 125),
        (245, 'There is shit everywhere!', 25);

INSERT INTO Stays (DateStayed, Rate)
	VALUES
		('12/24/2019', 100),
		('12/20/2019', 150),
		('11/26/2019', 125),
		('11/27/2019', 175),
		('11/15/2019', 200);

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
SELECT * FROM Rooms;
SELECT * FROM Stays;

/*SELECT * From Rooms
EXCEPT
SELECT * From Rooms
WHERE CostRoom < 100;*/

/*SELECT * From Guests
EXCEPT
SELECT * From Guests
WHERE Birthday > '01/01/2000';*/

--SELECT DISTINCT NameGuest From Guests;

--SELECT * FROM Guests order by NameGuest asc;

--SELECT TOP 10 * FROM Sales ORDER BY Price desc;
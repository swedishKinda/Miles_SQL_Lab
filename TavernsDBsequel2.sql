/*DROP TABLE IF EXISTS Stays, Rooms, SalesSupplyLinking, GuestClass, Classes, GuestStatuses, Guests, Sales, 
ServiceStatus, Services, SuppliesReceived, Supplies, RoleOwners, OwnerUserName, locationAddress, taverns;*/

DROP TABLE IF EXISTS Stays;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS SalesSupplyLinking;
DROP TABLE IF EXISTS GuestClass;
--DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS GuestStatuses;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS SuppliesReceived;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS taverns;
DROP TABLE IF EXISTS RoleOwners;
DROP TABLE IF EXISTS OwnerUserName;
DROP TABLE IF EXISTS locationAddress;


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
	Units VARCHAR(50),
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
	idServicesStatus int,
	idTavern int
);


CREATE TABLE ServiceStatus (
    id int IDENTITY(1,1) PRIMARY KEY,
    StatusofService BIT
);

CREATE TABLE Sales (
    id int IDENTITY(1,1) PRIMARY KEY,
    idServices int FOREIGN KEY REFERENCES Services(id),
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
	idGuest int,
	idClass tinyint,
	Level int,
    DateLevel DATE
);

/*CREATE TABLE Classes (
    id tinyint IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR (50),
	DescriptionClass VARCHAR (500)
);*/

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
ALTER TABLE Services ADD FOREIGN KEY (idTavern) REFERENCES Taverns(id);

ALTER TABLE Guests ADD FOREIGN KEY (idGuestStatuses) REFERENCES GuestStatuses(id);

ALTER TABLE Levels ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Levels ADD FOREIGN KEY (idClass) REFERENCES Classes(id);

--ALTER TABLE Supplies ADD Units VARCHAR(50);
--ALTER TABLE SuppliesReceived ADD UnitsReceived VARCHAR(50);

ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSales) REFERENCES Sales(id);
ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(id);

ALTER TABLE Rooms ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);

ALTER TABLE Stays ADD FOREIGN KEY (idSale) REFERENCES Sales(id);
ALTER TABLE Stays ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Stays ADD FOREIGN KEY (idRoom) REFERENCES Rooms(id);

INSERT INTO taverns (Name, Floors, idOwner, idLocation)
    VALUES
        ('Bobs Tavern', 1, 5, 4),
		('Bills Tavern', 2, 4, 3),
        ('Stephanies Tavern', 3, 3, 2),
        ('Phils Tavern', 4, 2, 1),
        ('Carolyns Tavern', 5, 1, 5);

INSERT INTO locationAddress (Name, City, Country)
    VALUES
        ('100 Main', 'Baltimore', 'USA'),
        ('200 Main', 'Philadelphia', 'USA'),
        ('300 Main', 'Munich', 'Germany'),
        ('400 Main', 'London', 'England'),
        ('500 Main', 'St. Petersburg', 'Russia');

INSERT INTO OwnerUserName (Name, idRole)
    VALUES
        ('Bob', 1),
        ('Bill', 2),
        ('Will', 3),
        ('Phil', 4),
        ('Carl', 5);

INSERT INTO RoleOwners (Name, RoleDescription)
    VALUES
        ('COO', 'ginger'),
        ('CFO', 'bread'),
        ('President', 'admin'),
        ('Vice President', 'is'),
        ('Janitor', 'cool');

INSERT INTO Supplies (SupplyDate, Name, SupplyCount, Units, idTavern)
    VALUES 
        ('11/16/2012 00:00:00', 'Peanuts', 22, 'Oz', 5),
        ('11/16/2012 00:00:00', 'Pistachios', 45, 'Oz', 4),
        ('11/16/2012 00:00:00', 'Chips', 50, 'Oz', 3),
        ('11/16/2012 00:00:00', 'Fish', 40, 'Oz', 2),
        ('11/16/2012 00:00:00', 'Meatballs', 60, 'Oz', 1);

INSERT INTO SuppliesReceived (Cost, AmountReceived, RecievedDate, idTavern, idSupplies)
    VALUES
        (22.22, 22, '12/19/2012 00:00:00', 5, 4),
        (44.44, 44, '12/19/2012 00:00:00', 4, 3),
        (55.55, 55, '12/19/2012 00:00:00', 3, 2),
        (66.66, 66, '12/19/2012 00:00:00', 2, 1),
        (77.77, 77, '12/19/2012 00:00:00', 1, 5);

INSERT INTO Services (Name, idTavern)
    VALUES
        ('Pool', 5),
        ('Darts', 4),
        ('Bowling', 3),
        ('Skeet', 2),
        ('VolleyBall', 1);

INSERT INTO ServiceStatus (StatusofService)
    VALUES
        (1),
        (0),
        (1),
        (0),
        (0);

INSERT INTO Sales (idServices, Name, Price, DatePurchased, AmountPurchased, idTavern)
    VALUES
        (5, 'Dilan Bob', 22.29, '05/22/2013 00:00:00', 10, 1),
        (4,'Stuart Bib', 22.28, '05/22/2013 00:00:00', 10, 2),
        (3, 'Macho Man', 22.70, '05/22/2013 00:00:00', 10, 3),
        (2, 'Jessica Collins', 22.26, '05/22/2013 00:00:00', 10, 4),
        (1,'Milton Bradley', 22.25, '05/22/2013 00:00:00', 10, 5),
		(1, 'Dilan Bob', 22.24, '05/22/2013 00:00:00', 10, 5),
        (2, 'Stuart Bib', 22.23, '05/22/2013 00:00:00', 10, 4),
        (3, 'Macho Man', 22.50, '05/22/2013 00:00:00', 10, 3),
        (4, 'Jessica Collins', 22.21, '05/22/2013 00:00:00', 10, 2),
        (5, 'Milton Bradley', 22.20, '05/22/2013 00:00:00', 10, 1),
		(5, 'Dilan Bob', 22.19, '05/22/2013 00:00:00', 10, 1),
        (4, 'Stuart Bib', 22.18, '05/22/2013 00:00:00', 10, 2),
        (3, 'Macho Man', 22.17, '05/22/2013 00:00:00', 10, 3),
        (2, 'Jessica Collins', 22.16, '05/22/2013 00:00:00', 10, 4),
        (1, 'Milton Bradley', 42.15, '05/22/2013 00:00:00', 10, 5);

INSERT INTO Guests (Name, Notes, Birthday, CakeDay, idGuestStatuses)
	Values
		('William Tate', 'Hes Cool', '03/10/1967', '05/08/2000', 5),
		('Ivo Brook', 'Stuff', '05/11/1960', '06/09/2003', 4),
		('Ahyan Hopkins', 'More stuff', '06/15/1966', '06/08/2000', 3),
		('Ahyan Hopkins', 'More more stuff', '05/10/1962', '05/12/2000', 2),
		('Myrtle Klein', 'More more more stuff', '03/16/2004', '05/22/2000', 1);

INSERT INTO GuestStatuses (Name)
	VALUES
		('Happy'),
		('Hungry'),
		('Tired'),
		('Raging'),
		('Placid');

INSERT INTO Levels (idGuest, idClass, Level, DateLevel)
	VALUES
		(5, 4, 5, '02/01/2020'),
		(4, 3, 15, '02/02/2020'),
		(3, 2, 25, '02/03/2020'),
		(2, 1, 35, '02/04/2020'),
		(1, 5, 45, '02/05/2020'),
		(5, 3, 21, '01/25/2020'),
		(4, 2, 12, '01/20/2020');

/*INSERT INTO Classes (Name, DescriptionClass)
	VALUES
		('Knight', 'Slays monsters'),
		('Mage', 'Uses Magic'),
		('Archer', 'Shoots Shit'),
		('Squire', 'Apprentice to Knight'),
		('Alchemist', 'Makes potions');*/

INSERT INTO SalesSupplyLinking (idSales, idSupplies)
	VALUES
		(5, 4),
		(4, 3),
		(3, 2),
		(2, 1),
		(1, 5);

INSERT INTO Rooms (Number, StatusRoom, Cost, idTavern, idStays)
	VALUES
		(145, 'Clean', 50, 5, 4),
		(250, 'Dirty', 75, 4, 3),
        (400, 'Destroyed', 100, 3, 2),
        (450, 'Smells', 125, 2, 1),
        (245, 'There is shit everywhere!', 25, 1, 5);

INSERT INTO Stays (idSale, idGuest, idRoom, DateStayed, Rate)
	VALUES
		(5, 4, 3, '12/24/2019', 100),
		(4, 3, 2, '12/20/2019', 150),
		(3, 2, 1, '11/26/2019', 125),
		(2, 1, 5, '11/27/2019', 175),
		(1, 5, 4, '11/15/2019', 200);

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


/*HW3*/

--2:
SELECT * From Rooms
EXCEPT
SELECT * From Rooms
WHERE Cost < 100;

--3:
SELECT * From Guests
EXCEPT
SELECT * From Guests
WHERE Birthday > '01/01/2000';

--4:
SELECT DISTINCT Name From Guests;

--5:
SELECT * FROM Guests order by Name asc;

--6:
SELECT TOP 10 * FROM Sales ORDER BY Price desc;

--7
SELECT * FROM INFORMATION_SCHEMA.COLUMNS AS NamesAndids
		WHERE (COLUMN_NAME = 'id' OR COLUMN_NAME = 'Name');
--I'm not sure if this is what you're asking for.

--8
SELECT idGuest, idClass, Level,
	CASE WHEN Level BETWEEN 1 and 10 THEN 'Noob'
		 WHEN Level BETWEEN 11 and 20 THEN 'Intermediate'
		 WHEN Level BETWEEN 21 and 30 THEN 'Pro'
		 WHEN Level BETWEEN 31 and 40 THEN 'Expert'
		 WHEN Level BETWEEN 41 and 50 THEN 'Master'
END AS Brackets FROM Levels;

--9
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (Name, Floors)') AS InsertCommands
	FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Taverns'
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 1), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 1), ')')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 2), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 2), ')')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 3), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 3), ')');

/*HW4*/

--1
SELECT * FROM OwnerUserName INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
	WHERE RoleOwners.RoleDescription = 'admin';

--2
SELECT OwnerUserName.Name, RoleOwners.Name, RoleDescription, Taverns.Name FROM OwnerUserName 
	INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
	INNER JOIN taverns ON (OwnerUserName.id = Taverns.idOwner)
		WHERE RoleOwners.RoleDescription = 'admin';

--3
SELECT Guests.Name, Classes.Name, Level FROM Levels 
	INNER JOIN Guests ON (Guests.id = Levels.idGuest)
	INNER JOIN Classes ON (Classes.id = Levels.idClass)
		ORDER BY Guests.Name asc;
						
--4
SELECT TOP 10 Price, Services.Name FROM Sales 
	INNER JOIN Services ON (Sales.idServices = Services.id)
		ORDER BY Price desc;

--5
SELECT idGuest, idClass, Guests.Name, Classes.Name, Level FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		WHERE idGuest IN (SELECT idGuest FROM Levels GROUP BY idGuest
			HAVING COUNT(*) > 1) ORDER BY idGuest;

--6
SELECT idGuest, idClass, Guests.Name, Classes.Name, Level FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		WHERE Level > 5 AND idGuest IN (SELECT idGuest FROM Levels GROUP BY idGuest
			HAVING COUNT(*) > 1) ORDER BY idGuest;

--7
-- I can't figure this one out yet
SELECT idGuest, idClass, Guests.Name, Classes.Name, MAX(Level) FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		GROUP BY idGuest;

--8
SELECT Guests.Name, Stays.DateStayed FROM Guests
	INNER JOIN Stays ON (Guests.id = Stays.idGuest)
		WHERE DateStayed BETWEEN ('11/01/2019') and ('11/30/2019');

--9
SELECT CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
	FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Taverns'
		UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
	(CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
		Then CONCAT
			('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
		Else '' 
		END),	 
			CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
				Then 
			(CONCAT(' FOREIGN KEY REFERENCES', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
			Else '' 
			END,
				CASE WHEN keys.CONSTRAINT_NAME LIKE '%PK%'
				THEN
					(' IDENTITY(1,1) PRIMARY KEY')
				ELSE ''
				END,
			',') as queryPiece 
FROM INFORMATION_SCHEMA.COLUMNS as cols
	LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
		(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
	LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
		(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
	LEFT JOIN 
		(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
			ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
			WHERE cols.TABLE_NAME = 'Taverns'
				UNION ALL
			SELECT ');';
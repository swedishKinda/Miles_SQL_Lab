/*DROP TABLE IF EXISTS Stays, Rooms, SalesSupplyLinking, GuestClass, Classes, GuestStatuses, Guests, Sales, 
ServiceStatus, Services, SuppliesReceived, Supplies, RoleOwners, OwnerUserName, locationAddress, taverns;*/

DROP TABLE IF EXISTS Stays;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS RoomStatus;
DROP TABLE IF EXISTS SalesSupplyLinking;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS GuestStatuses;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS SuppliesReceived;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS taverns;
DROP TABLE IF EXISTS OwnerUserName;
DROP TABLE IF EXISTS RoleOwners;
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

CREATE TABLE Guests (
    id int IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(250),
    Notes VARCHAR(Max),
    Birthday DATE,
    CakeDay DATE,
	idGuestStatuses tinyint
);

CREATE TABLE Sales (
    id int IDENTITY(1,1) PRIMARY KEY,
    idServices int,
    idGuest int,
    Price DECIMAL(5,2),
    DatePurchased DATETIME,
    AmountPurchased int,
    idTavern int
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

CREATE TABLE Classes (
    id tinyint IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR (50),
	DescriptionClass VARCHAR (500)
);

CREATE TABLE SalesSupplyLinking (
	id int IDENTITY(1,1) PRIMARY KEY,
	idSales int,
	idSupplies int
);

CREATE TABLE Rooms (
	id int IDENTITY(1,1) PRIMARY KEY,
	Number int,
	Cost DECIMAL(5,2),
	idTavern int,
	idRoomStatus int
);

CREATE TABLE RoomStatus (
	id int IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
);

CREATE TABLE Stays (
	id int IDENTITY(1,1) PRIMARY KEY,
	idSale int,
	idGuest int,
	idRoom int,
	CheckedIn DATE,
	CheckedOut DATE,
	Rate DECIMAL(5,2)
);



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

INSERT INTO Sales (idServices, idGuest, Price, DatePurchased, AmountPurchased, idTavern)
    VALUES
        (5, 1, 22.29, '05/22/2013 00:00:00', 10, 1),
        (4, 2, 22.28, '05/22/2013 00:00:00', 10, 2),
        (3, 3, 22.70, '05/22/2013 00:00:00', 10, 3),
        (2, 4, 22.26, '05/22/2013 00:00:00', 10, 4),
        (1, 5, 22.25, '05/22/2013 00:00:00', 10, 5),
		(1, 1, 22.24, '05/22/2013 00:00:00', 10, 5),
        (2, 2, 22.23, '05/22/2013 00:00:00', 10, 4),
        (3, 3, 22.50, '05/22/2013 00:00:00', 10, 3),
        (4, 4, 22.21, '05/22/2013 00:00:00', 10, 2),
        (5, 5, 22.20, '05/22/2013 00:00:00', 10, 1),
		(5, 1, 22.19, '05/22/2013 00:00:00', 10, 1),
        (4, 2, 22.18, '05/22/2013 00:00:00', 10, 2),
        (3, 3, 22.17, '05/22/2013 00:00:00', 10, 3),
        (2, 4, 22.16, '05/22/2013 00:00:00', 10, 4),
        (1, 5, 42.15, '05/22/2013 00:00:00', 10, 5);

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
		(4, 2, 12, '01/20/2020'),
		(3, 3, NULL, '01/21/2020');

INSERT INTO Classes (Name, DescriptionClass)
	VALUES
		('Knight', 'Slays monsters'),
		('Mage', 'Uses Magic'),
		('Archer', 'Shoots Shit'),
		('Squire', 'Apprentice to Knight'),
		('Alchemist', 'Makes potions');

INSERT INTO SalesSupplyLinking (idSales, idSupplies)
	VALUES
		(5, 4),
		(4, 3),
		(3, 2),
		(2, 1),
		(1, 5);

INSERT INTO Rooms (Number, Cost, idTavern, idRoomStatus)
	VALUES
		(145, 50, 5, 1),
		(250, 75, 4, 2),
        (400, 100, 3, 3),
        (450, 125, 2, 4),
        (245, 25, 1, 5);

INSERT INTO RoomStatus (Name)
	Values
		('Clean'),
		('Dirty'),
        ('Destroyed'),
        ('Smells'),
        ('There is shit everywhere!');

INSERT INTO Stays (idSale, idGuest, idRoom, CheckedIn, CheckedOut, Rate)
	VALUES
		(5, 4, 3, '12/24/2019', '03/03/2020', 100),
		(4, 3, 2, '12/20/2019', '12/26/2019', 150),
		(3, 2, 1, '11/26/2019', '12/26/2019', 125),
		(2, 1, 5, '11/27/2019', '12/26/2019', 175),
		(1, 5, 4, '11/15/2019', '11/20/2019', 200);


ALTER TABLE taverns ADD FOREIGN KEY (idLocation) REFERENCES locationAddress(id);
ALTER TABLE taverns ADD FOREIGN KEY (idOwner) REFERENCES OwnerUserName(id);

ALTER TABLE OwnerUserName ADD FOREIGN KEY (idRole) REFERENCES RoleOwners(id);

ALTER TABLE Supplies ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);

ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);
ALTER TABLE SuppliesReceived ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(id);

ALTER TABLE Services ADD FOREIGN KEY (idServicesStatus) REFERENCES ServiceStatus(id);
ALTER TABLE Services ADD FOREIGN KEY (idTavern) REFERENCES Taverns(id);

ALTER TABLE Guests ADD FOREIGN KEY (idGuestStatuses) REFERENCES GuestStatuses(id);

ALTER TABLE Sales ADD FOREIGN KEY (idServices) REFERENCES Services(id);
ALTER TABLE Sales ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Sales ADD FOREIGN KEY (idTavern) REFERENCES Taverns(id);

ALTER TABLE Levels ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Levels ADD FOREIGN KEY (idClass) REFERENCES Classes(id);

--ALTER TABLE Supplies ADD Units VARCHAR(50);
--ALTER TABLE SuppliesReceived ADD UnitsReceived VARCHAR(50);

ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSales) REFERENCES Sales(id);
ALTER TABLE SalesSupplyLinking ADD FOREIGN KEY (idSupplies) REFERENCES Supplies(id);

ALTER TABLE Rooms ADD FOREIGN KEY (idTavern) REFERENCES taverns(id);
ALTER TABLE Rooms ADD FOREIGN KEY (idRoomStatus) REFERENCES RoomStatus(id);

ALTER TABLE Stays ADD FOREIGN KEY (idSale) REFERENCES Sales(id);
ALTER TABLE Stays ADD FOREIGN KEY (idGuest) REFERENCES Guests(id);
ALTER TABLE Stays ADD FOREIGN KEY (idRoom) REFERENCES Rooms(id);


SELECT * FROM taverns;
SELECT * FROM locationAddress;
SELECT * FROM OwnerUserName;
SELECT * FROM RoleOwners;
SELECT * FROM Supplies;
SELECT * FROM SuppliesReceived;
SELECT * FROM Services;
SELECT * FROM ServiceStatus;
SELECT * FROM Sales;
SELECT * FROM Guests;
SELECT * FROM GuestStatuses;
SELECT * FROM Levels;
SELECT * FROM Classes;
SELECT * FROM Rooms;
SELECT * FROM RoomStatus;
SELECT * FROM Stays;


/*HW3*/

--2:
SELECT * From Guests
WHERE Birthday < '01/01/2000';

--3:
SELECT * From Rooms
WHERE Cost > 100;

--4:
SELECT DISTINCT Name From Guests;

--5:
SELECT * FROM Guests order by Name asc;

--6:
SELECT TOP 10 * FROM Sales ORDER BY Price desc;

--7
SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
		WHERE (COLUMN_NAME = 'id' OR COLUMN_NAME = 'Name');
--I'm not sure if this is what you're asking for.

--8
SELECT idGuest, idClass, Level,
	CASE WHEN Level BETWEEN 1 and 10 THEN 'Noob'
		 WHEN Level BETWEEN 11 and 20 THEN 'Intermediate'
		 WHEN Level BETWEEN 21 and 30 THEN 'Pro'
		 WHEN Level BETWEEN 31 and 40 THEN 'Expert'
		 WHEN Level BETWEEN 41 and 50 THEN 'Master'
		 WHEN Level IS NULL THEN 'Noob'
END AS Brackets FROM Levels;

--9
SELECT CONCAT ('INSERT INTO ',TABLE_NAME,' (Name, Floors)') AS InsertCommands
	FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Taverns'
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 1), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 1), '),')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 2), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 2), '),')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 3), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 3), ');');

/*HW4*/

--1
SELECT OwnerUserName.Name, RoleOwners.Name, RoleDescription FROM OwnerUserName 
	INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
		WHERE RoleOwners.RoleDescription LIKE 'admin%';

--2
SELECT OwnerUserName.Name, RoleOwners.Name, RoleDescription, Taverns.Name,
	locationAddress.Name, locationAddress.City, locationAddress.Country FROM OwnerUserName 
		INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
		INNER JOIN taverns ON (OwnerUserName.id = Taverns.idOwner)
		INNER JOIN locationAddress ON (Taverns.idLocation = locationAddress.id)
			WHERE RoleOwners.RoleDescription LIKE 'admin%';

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
SELECT idGuest, Guests.Name, Classes.Name, Level FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		WHERE idGuest IN (SELECT idGuest FROM Levels GROUP BY idGuest HAVING COUNT(idGuest) > 1)
			ORDER BY Guests.Name;

--6
SELECT idGuest, Guests.Name, Classes.Name, Level FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		WHERE Level > 5 AND idGuest IN (SELECT idGuest FROM Levels GROUP BY idGuest HAVING COUNT(idGuest) > 1)
			ORDER BY idGuest;

--7
SELECT idGuest, Guests.Name, Max(Level) AS HighestLevel FROM Levels 
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)	
			GROUP BY idGuest, Guests.Name;

--8
SELECT Guests.Name, Stays.CheckedIn, Stays.CheckedOut FROM Guests
	INNER JOIN Stays ON (Guests.id = Stays.idGuest)
		WHERE CheckedIn BETWEEN ('11/01/2019') and ('11/30/2019') OR
		      CheckedOut BETWEEN ('11/01/2019') and ('11/30/2019');

--9
SELECT CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as CreateTableTemplate 
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
			(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
			Else '' 
			END,
				CASE WHEN keys.CONSTRAINT_NAME LIKE 'PK%'
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

/*HW5*/

--1
SELECT OwnerUserName.Name, RoleOwners.Name, RoleOwners.RoleDescription FROM OwnerUserName
	INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id);

--2
--As query
SELECT Classes.Name, COUNT(Levels.idClass) AS GuestsPerClass FROM Levels
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		GROUP BY Classes.Name;

--As function(for fun)
IF OBJECT_ID (N'dbo.TotalGuestsPerClass', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.TotalGuestsPerClass;  
GO  
CREATE FUNCTION dbo.TotalGuestsPerClass (@Guests int)
RETURNS int
AS  
BEGIN
	DECLARE @TotalGuestsPerClass int
	SELECT @TotalGuestsPerClass = COUNT(Levels.idClass)
    FROM Levels
	WHERE @Guests = Levels.idClass
		IF (@TotalGuestsPerClass IS NULL)   
			SET @TotalGuestsPerClass = 0;    
    RETURN @TotalGuestsPerClass;  
END;
GO

SELECT Classes.Name, dbo.TotalGuestsPerClass(idClass) AS GuestsPerClass FROM Levels
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		GROUP BY Classes.Name, Levels.idClass;

--3
SELECT idGuest, Guests.Name, idClass, Classes.Name, Level,
	CASE WHEN Level BETWEEN 1 and 10 THEN 'Noob'
		 WHEN Level BETWEEN 11 and 20 THEN 'Intermediate'
		 WHEN Level BETWEEN 21 and 30 THEN 'Pro'
		 WHEN Level BETWEEN 31 and 40 THEN 'Expert'
		 WHEN Level BETWEEN 41 and 50 THEN 'Master'
		 WHEN Level IS NULL THEN 'Noob'
END AS Brackets FROM Levels 
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		ORDER BY Guests.Name asc;

--4
GO
IF OBJECT_ID (N'dbo.GetBrackets', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.GetBrackets;  
GO  
CREATE FUNCTION dbo.GetBrackets (@level int)  
RETURNS varchar(50)  
AS    
BEGIN
DECLARE @label varchar(50);     
    IF (@level < 10)
		SET @label = 'Noob';
	IF (@level BETWEEN 10 AND 19)
		SET @label = 'Intermediate';
	IF (@level BETWEEN 20 AND 29)
		SET @label = 'Pro';
	IF (@level BETWEEN 30 AND 39)
		SET @label = 'Expert';
	IF (@level >= 40)
		SET @label = 'Master';
	IF (@level IS NULL)   
		SET @label = 'Noob';
RETURN @label;
END;

GO

SELECT idGuest, Guests.Name, idClass, Classes.Name, Level, dbo.GetBrackets(Level) AS LevelBrackets FROM Levels
	INNER JOIN Guests ON (Levels.idGuest = Guests.id)
	INNER JOIN Classes ON (Levels.idClass = Classes.id)
		ORDER BY Guests.Name asc;
	
--5
GO
IF OBJECT_ID (N'dbo.RoomOpen', N'IF') IS NOT NULL
	DROP FUNCTION dbo.RoomOpen;
GO 
CREATE FUNCTION dbo.RoomOpen (@vacant date)
RETURNS TABLE 
AS
RETURN
(
	SELECT Rooms.Number, Taverns.Name, Rooms.idTavern, Rooms.id AS idRoom
	FROM Stays
		INNER JOIN Rooms ON (Rooms.id = Stays.idRoom)
		INNER JOIN Taverns ON (Taverns.id = Rooms.idTavern)
	WHERE @vacant NOT BETWEEN Stays.CheckedIn AND Stays.Checkedout
);
GO
SELECT * FROM dbo.RoomOpen('2019-12-21');
SELECT * FROM Stays;

--6
GO
IF OBJECT_ID (N'dbo.PriceRange', N'IF') IS NOT NULL
	DROP FUNCTION dbo.PriceRange;
GO 
CREATE FUNCTION dbo.PriceRange (@min DECIMAL(5,2), @max DECIMAL(5,2))
RETURNS TABLE
AS
RETURN
(
	SELECT Rooms.Number, Taverns.Name, Rooms.idTavern, Rooms.id AS idRoom, Rooms.idRoomStatus, Rooms.Cost
	FROM Rooms
		INNER JOIN Stays ON (Rooms.id = Stays.idRoom)
		INNER JOIN Taverns ON (Taverns.id = Rooms.idTavern)
	WHERE Rooms.Cost BETWEEN @min AND @max
);
GO
SELECT * FROM dbo.PriceRange(80, 130);
SELECT * FROM Rooms;

--7
IF OBJECT_ID (N'dbo.CreateARoom', N'P') IS NOT NULL  
    DROP PROCEDURE dbo.CreateARoom;
GO
CREATE PROCEDURE dbo.CreateARoom
	@cost DECIMAL(5,2),
	@newnumber int,
	@tavernsname varchar(50),
	@tavernid int
AS
BEGIN
SET NOCOUNT ON;
SET @cost = (SELECT MIN(Cost) FROM dbo.PriceRange(80, 130));
SET @newnumber = (SELECT TOP 1 Number FROM dbo.PriceRange(80, 130));
SET @tavernsname = (SELECT TOP 1 Name FROM dbo.PriceRange(80, 130)
	WHERE Cost = (
        SELECT MIN(Cost)
        FROM dbo.PriceRange(80, 130)));
SET @tavernid = (SELECT id FROM Taverns WHERE @tavernsname = Name);
INSERT INTO Rooms (Number, Cost, idTavern)
	VALUES (@newnumber - 1, @Cost - 0.01, @Tavernid)		
END;

BEGIN TRANSACTION
EXECUTE dbo.CreateARoom
@Cost = 80,
@newNumber = 1,
@Tavernsname = '',
@Tavernid = '';

ROLLBACK

COMMIT

GO
SELECT * FROM Rooms;

--Procedure for booking cheapest room

SELECT * FROM Rooms;
SELECT * FROM Taverns;

IF OBJECT_ID('dbo.book_cheap_room',N'P') IS NOT NULL
	DROP PROCEDURE dbo.book_cheap_room;
GO
CREATE PROCEDURE dbo.book_cheap_room
	@Guest varchar(50),
	@Min DECIMAL(5,2),
	@Max DECIMAL(5,2),
	@Book Date,
	@checkout Date         
AS 
BEGIN
	SET NOCOUNT ON;
	SET @Book = getdate();
	SET @checkout = getdate() + 3;
	INSERT INTO Stays (idSale, idRoom, idGuest, CheckedIn, CheckedOut, Rate )
	VALUES (	
		(SELECT TOP 1 id FROM Sales ORDER BY id desc),
		(SELECT TOP 1 id FROM ROOMS WHERE number IN  (SELECT number FROM dbo.RoomOpen(@Book))
			AND number IN (SELECT number FROM dbo.PriceRange(@Min, @Max)) ORDER BY cost ASC),
		(SELECT ID FROM Guests WHERE Name Like @Guest),
		@Book,
		@checkout,
		(SELECT TOP 1 cost FROM ROOMS WHERE number IN  (SELECT number FROM dbo.RoomOpen(@Book))
			AND number IN (SELECT number FROM dbo.PriceRange(@Min, @Max)) ORDER BY cost ASC)
	)
END;
GO

BEGIN TRANSACTION
EXEC dbo.book_cheap_room
@Guest = 'William Tate',
@Min = 76,
@Max = 999,
@book = '',
@checkout = '';
GO
ROLLBACK
select * from stays;

GO

DROP TRIGGER addSaleBooking
GO
CREATE TRIGGER addSaleBooking
ON Stays
AFTER INSERT
AS 

INSERT INTO Sales (Price, DatePurchased) SELECT Rate, CheckedIn
FROM inserted;

GO

SELECT *FROM Stays;
SELECT * FROM Sales;
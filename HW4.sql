/*HW4*/

--1
SELECT OwnerUserName.Name, RoleOwners.Name, RoleDescription FROM OwnerUserName 
	INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
		WHERE RoleOwners.RoleDescription LIKE '%admin%';

--2
SELECT OwnerUserName.Name, RoleOwners.Name, RoleDescription, Taverns.Name,
	locationAddress.Name, locationAddress.City, locationAddress.Country FROM OwnerUserName 
		INNER JOIN RoleOwners ON (OwnerUserName.idRole = RoleOwners.id)
		INNER JOIN taverns ON (OwnerUserName.id = Taverns.idOwner)
		INNER JOIN locationAddress ON (Taverns.idLocation = locationAddress.id)
			WHERE RoleOwners.RoleDescription LIKE '%admin%'

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
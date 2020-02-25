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
		WHERE (COLUMN_NAME = 'id' OR COLUMN_NAME = 'Name')
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
						   (SELECT Country FROM locationAddress WHERE id = 1), '),')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 2), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 2), '),')
		UNION ALL
SELECT CONCAT ('VALUES (', (SELECT Name FROM locationAddress WHERE id = 3), ', ',
						   (SELECT Country FROM locationAddress WHERE id = 3), ');');
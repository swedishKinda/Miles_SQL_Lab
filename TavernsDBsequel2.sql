DROP DATABASE IF EXISTS taverns_db;
CREATE DATABASE taverns_db;

DROP table IF EXISTS tavernName, locationAddress, OwnerUserName;

USE taverns_db;

CREATE TABLE tavernName (
	idTavern INTEGER NOT NULL AUTO_INCREMENT,
    nameTavern VARCHAR(100),
    idLocation INTEGER,
    idOwner INTEGER
    -- PRIMARY KEY (idTavern)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

CREATE TABLE locationAddress (
	idLocation INTEGER NOT NULL AUTO_INCREMENT,
    locAddress VARCHAR(100),
    idTavern INTEGER,
    idOwner INTEGER
    -- PRIMARY KEY (idLocation)
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern),
    -- FOREIGN KEY (idOwner) REFERENCES OwnerName(idOwner)
);

CREATE TABLE OwnerUserName (
	idOwner INTEGER NOT NULL AUTO_INCREMENT,
    userName VARCHAR (100),
    idRole INTEGER
    -- PRIMARY KEY (idOwner)
    -- FOREIGN KEY (idLocation) REFERENCES locationAddress(idLocation),
    -- FOREIGN KEY (idTavern) REFERENCES tavernName(idTavern)
);

CREATE TABLE RoleOwner (
    idRole INTEGER NOT NULL AUTO_INCREMENT,
    
)
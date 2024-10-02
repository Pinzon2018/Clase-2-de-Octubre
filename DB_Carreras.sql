DROP DATABASE IF EXISTS Carrera;

CREATE DATABASE Carrera CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

USE Carrera;

CREATE TABLE Equipo (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Equipo VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Personas_Equipo VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Mecanicos_Equipo VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

CREATE TABLE Circuito(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Circuito VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Cantidad_Max_Participantes VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Km_Circuito INT NOT NULL,
    Tiempo_Circuito TIME NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

CREATE TABLE Aviones (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Numero_Avion VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Cantidad_Asientos VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Km_Recorridos INT NOT NULL
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

CREATE TABLE Piloto (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Piloto VARCHAR(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    Num_Identificación VARCHAR(45) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    ID_Circuito INT NOT NULL,
    ID_Equipo INT NOT NULL,
    ID_Aviones INT NOT NULL,
    FOREIGN KEY (ID_Circuito) REFERENCES Circuito(ID),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID),
    FOREIGN KEY (ID_Aviones) REFERENCES Aviones(ID)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

CREATE TABLE Ganador_Carrera (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_Piloto INT NOT NULL,
    Tiempo_Ganador TIME NOT NULL,
    FOREIGN KEY (ID_Piloto) REFERENCES Piloto(ID)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;

-- INSERCIONES

SELECT * FROM Equipo;

INSERT INTO Equipo (Nombre_Equipo, Personas_Equipo, Mecanicos_Equipo) VALUES
('Magics', '6', '1'),
('Stelar', '8', '2'),
('TopGun', '12', '4');

INSERT INTO Circuito (Nombre_Circuito, Cantidad_Max_Participantes, Km_Circuito, Tiempo_Circuito) VALUES
('Alter', '100', 90, '01:20:15'),
('CLean', '60', 30, '02:17-45'),
('Dead', '90', 40, '09:13:34');

INSERT INTO Aviones (Numero_Avion, Cantidad_Asientos, Km_Recorridos) VALUES
('1245234', '2', 90),
('4223542', '1', 100),
('5433234', '1', 250);

INSERT INTO Piloto (Nombre_Piloto, Num_Identificación, ID_Circuito, ID_Equipo, ID_Aviones) VALUES
('Andres', '42334231', 2, 1, 3),
('Julian', '45783476', 1, 2, 2),
('Andrea', '43244334', 3, 3, 1);

INSERT INTO Ganador_Carrera (ID_Piloto, Tiempo_Ganador) VALUES
( 3, '02:15:02'),
( 1, '08:16:04'),
( 2, '10:20:15');

-- CONSULTAS SENCILLAS

-- Seleccionar el Equipo que se llame Magics

SELECT * FROM Equipo WHERE Nombre_Equipo LIKE '%Magics%';

-- Seleccionar el circuito que tenga más de 90 km

SELECT * FROM Circuito WHERE Km_Circuito > 90;

-- Seleccionar los pilotos que en su nombre empiezen por A

SELECT * FROM Piloto WHERE Nombre_Piloto LIKE 'A%';

-- CONSULTAS COMPLEJAS

-- Seleccionar el piloto que este en el Equipo Magics

SELECT Nombre_Piloto FROM Piloto 
INNER JOIN Equipo ON Piloto.ID_Equipo = Equipo.ID
WHERE Nombre_Equipo LIKE '%Magic%';

-- Seleccionar el piloto con un numero de avion especifico

SELECT * FROM Piloto
INNER JOIN Aviones ON Piloto.ID_Equipo = Aviones.ID
WHERE Numero_Avion LIKE '%5433234%';






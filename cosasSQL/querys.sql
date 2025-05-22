-- Tabla principal de computadores
CREATE TABLE Computadores (
    IdComputador INT PRIMARY KEY IDENTITY(1,1),
    PlacaPc INT NOT NULL UNIQUE,
    SerialNumber VARCHAR(50) NOT NULL UNIQUE,
    IdMarca INT,
    IdModelo INT,
    IdSistemaOperativo INT,
    IdTipo INT,
    IdEstado INT,
    IdUbicacion INT,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    Observaciones NVARCHAR(MAX),
    FOREIGN KEY (IdMarca) REFERENCES Marcas(IdMarca),
    FOREIGN KEY (IdModelo) REFERENCES Modelos(IdModelo),
    FOREIGN KEY (IdSistemaOperativo) REFERENCES SistemaOperativo(IdSistemaOperativo),
    FOREIGN KEY (IdTipo) REFERENCES Tipos(IdTipo),
    FOREIGN KEY (IdEstado) REFERENCES Estados(IdEstado),
    FOREIGN KEY (IdUbicacion) REFERENCES Ubicaciones(IdUbicacion)
);

-- Catálogo de marcas
CREATE TABLE Marcas (
    IdMarca INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL
);

-- Catálogo de modelos
CREATE TABLE Modelos (
    IdModelo INT PRIMARY KEY IDENTITY(1,1),
    IdMarca INT,
    Nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (IdMarca) REFERENCES Marcas(IdMarca)
);

-- Catálogo de tipos de computadores
CREATE TABLE Tipos (
    IdTipo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(20) NOT NULL,
);


-- Catálogo de estados
CREATE TABLE Estados (
    IdEstado INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(20) NOT NULL,
);

-- Catálogo de ubicaciones
CREATE TABLE Ubicaciones (
    IdUbicacion INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
);

-- Tabla de características técnicas
CREATE TABLE Caracteristicas (
    IdCaracteristica INT PRIMARY KEY IDENTITY(1,1),
    IdComputador INT,
    Procesador VARCHAR(100),
    GeneracionRam VARCHAR(50),
    MemoriaRAM INT,
    DiscoDuro1 VARCHAR(100) NOT NULL,
	TipoDisco1 VARCHAR(10),
	DiscoDuro2 VARCHAR(100) NULL,
	TipoDisco2 VARCHAR(10) NULL,
    FOREIGN KEY (IdComputador) REFERENCES Computadores(IdComputador)
);

-- Tabla de sistema operativo
CREATE TABLE SistemaOperativo (
    IdSistemaOperativo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Version VARCHAR(50),
);

-- Tabla de red
CREATE TABLE Red (
    IdRed INT PRIMARY KEY IDENTITY(1,1),
    IdComputador INT,
    MacLocal VARCHAR(17),
    MacWifi VARCHAR(17),
    FOREIGN KEY (IdComputador) REFERENCES Computadores(IdComputador)
);

-- Tabla de garantía
CREATE TABLE Garantias (
    IdGarantia INT PRIMARY KEY IDENTITY(1,1),
    IdComputador INT,
    FechaCompra DATE,
    GarantiaHasta DATE,
    Proveedor VARCHAR(100),
    FOREIGN KEY (IdComputador) REFERENCES Computadores(IdComputador)
);




































-- Características técnicas
NucleosCPU INT, -- Número de núcleos
CacheCPU VARCHAR(20), -- Cache del procesador
TarjetaGrafica VARCHAR(100), -- GPU
PuertosUSB INT,
PuertosHDMI INT,
PuertosVGA INT,
PuertosEthernet INT,
TipoConectividad VARCHAR(50), -- WiFi, Ethernet, etc.

-- Información de red
MACAddress VARCHAR(17), -- Dirección MAC
IPAsignada VARCHAR(15), -- IP actual
NombreEquipo VARCHAR(50), -- Nombre en red

-- Mantenimiento
FechaUltimoMantenimiento DATE,
ProximoMantenimiento DATE,
ResponsableMantenimiento VARCHAR(100)

-- Software
LicenciaOffice VARCHAR(50),
LicenciaAntivirus VARCHAR(50)

















----------------CREACION DE LA TABLA BD HOSPITAL--------------------------------
BEGIN
    -- Crear tabla Provincia
    EXECUTE IMMEDIATE '
        CREATE TABLE Provincia (
            idProvincia INT PRIMARY KEY,
            descProvincia VARCHAR(100) NOT NULL,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )';

    -- Crear tabla Distrito
    EXECUTE IMMEDIATE '
        CREATE TABLE Distrito (
            idDistrito INT PRIMARY KEY,
            idProvincia INT,
            descDistrito VARCHAR(100) NOT NULL,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            CONSTRAINT fk_Distrito_Provincia FOREIGN KEY (idProvincia) 
                REFERENCES Provincia(idProvincia)
        )';

    -- Crear tabla Sede
    EXECUTE IMMEDIATE '
        CREATE TABLE Sede (
            idSede INT PRIMARY KEY,
            descSede VARCHAR(100) NOT NULL,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )';

    -- Crear tabla Gerente
    EXECUTE IMMEDIATE '
        CREATE TABLE Gerente (
            idGerente INT PRIMARY KEY,
            descGerente VARCHAR(100) NOT NULL,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )';

    -- Crear tabla Condicion
    EXECUTE IMMEDIATE '
        CREATE TABLE Condicion (
            idCondicion INT PRIMARY KEY,
            descCondicion VARCHAR(100) NOT NULL,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )';

    -- Crear tabla Hospital
    EXECUTE IMMEDIATE '
        CREATE TABLE Hospital (
            idHospital INT PRIMARY KEY,
            idDistrito INT,
            Nombre VARCHAR(100) NOT NULL,
            Antiguedad INT,
            Area DECIMAL(5,2),
            idSede INT,
            idGerente INT,
            idCondicion INT,
            fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            CONSTRAINT fk_Hospital_Distrito FOREIGN KEY (idDistrito) 
                REFERENCES Distrito(idDistrito),
            CONSTRAINT fk_Hospital_Sede FOREIGN KEY (idSede) 
                REFERENCES Sede(idSede),
            CONSTRAINT fk_Hospital_Gerente FOREIGN KEY (idGerente) 
                REFERENCES Gerente(idGerente),
            CONSTRAINT fk_Hospital_Condicion FOREIGN KEY (idCondicion) 
                REFERENCES Condicion(idCondicion)
        )';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
-- Insertar en Provincia
INSERT INTO Provincia (idProvincia, descProvincia) VALUES (1, 'Provincia Norte');
INSERT INTO Provincia (idProvincia, descProvincia) VALUES (2, 'Provincia Sur');
INSERT INTO Provincia (idProvincia, descProvincia) VALUES (3, 'Provincia Este');
INSERT INTO Provincia (idProvincia, descProvincia) VALUES (4, 'Provincia Oeste');
INSERT INTO Provincia (idProvincia, descProvincia) VALUES (5, 'Provincia Central');

-- Insertar en Distrito
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito) VALUES (1, 1, 'Distrito A');
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito) VALUES (2, 2, 'Distrito B');
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito) VALUES (3, 3, 'Distrito C');
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito) VALUES (4, 4, 'Distrito D');
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito) VALUES (5, 5, 'Distrito E');

-- Insertar en Sede
INSERT INTO Sede (idSede, descSede) VALUES (1, 'Sede Lima');
INSERT INTO Sede (idSede, descSede) VALUES (2, 'Sede Cusco');
INSERT INTO Sede (idSede, descSede) VALUES (3, 'Sede Arequipa');
INSERT INTO Sede (idSede, descSede) VALUES (4, 'Sede Piura');
INSERT INTO Sede (idSede, descSede) VALUES (5, 'Sede Trujillo');

-- Insertar en Gerente
INSERT INTO Gerente (idGerente, descGerente) VALUES (1, 'Carlos Gómez');
INSERT INTO Gerente (idGerente, descGerente) VALUES (2, 'Ana López');
INSERT INTO Gerente (idGerente, descGerente) VALUES (3, 'Luis Fernández');
INSERT INTO Gerente (idGerente, descGerente) VALUES (4, 'María Torres');
INSERT INTO Gerente (idGerente, descGerente) VALUES (5, 'José Ramírez');

-- Insertar en Condicion
INSERT INTO Condicion (idCondicion, descCondicion) VALUES (1, 'Activo');
INSERT INTO Condicion (idCondicion, descCondicion) VALUES (2, 'Inactivo');
INSERT INTO Condicion (idCondicion, descCondicion) VALUES (3, 'En Mantenimiento');
INSERT INTO Condicion (idCondicion, descCondicion) VALUES (4, 'Suspendido');
INSERT INTO Condicion (idCondicion, descCondicion) VALUES (5, 'En Evaluación');

-- Insertar en Hospital
BEGIN
    pkg_hospital.registrar(1, 1, 'Hospital San José', 20, 500.00, 1, 1, 1);
    pkg_hospital.registrar(2, 2, 'Hospital Santa Ana', 15, 450.00, 2, 2, 2);
    pkg_hospital.registrar(3, 3, 'Hospital Central', 10, 700.00, 3, 3, 3);
    pkg_hospital.registrar(4, 4, 'Hospital Nuevo Horizonte', 5, 300.00, 4, 4, 4);
    pkg_hospital.registrar(5, 5, 'Hospital Vida Plena', 8, 600.00, 5, 5, 5);
END;
/
------------------- Paquete de listar 
BEGIN
    pkg_hospital.listar;
END;
/
------------------- Paquete de registrar
BEGIN
    pkg_hospital.registrar(6, 3, 'Hospital Nueva Vida', 12, 400.00, 3, 3, 3);
END;
/

------------------- Paquete de actualizar
BEGIN
    pkg_hospital.actualizar(
        1,                -- idHospital
        2,                -- idDistrito (cambiado)
        'Hospital San José Renovado', -- Nuevo nombre
        25,               -- Nueva antigüedad
        550.00,           -- Nueva área
        2,                -- Nueva sede
        2,                -- Nuevo gerente
        2                 -- Nueva condición
    );
END;
/

------------------- Paquete de eliminar
BEGIN
    pkg_hospital.eliminar(6);
END;
/
------------------- Paquete de buscar
BEGIN
    pkg_hospital.buscar_por_nombre('Hospital Central');
END;
/

commit;


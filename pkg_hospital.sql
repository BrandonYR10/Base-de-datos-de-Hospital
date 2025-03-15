-- 1. Especificación del paquete (interfaz pública)
CREATE OR REPLACE PACKAGE pkg_hospital AS
    PROCEDURE registrar(
        p_idHospital IN INT,
        p_idDistrito IN INT,
        p_Nombre IN VARCHAR2,
        p_Antiguedad IN INT,
        p_Area IN NUMBER,
        p_idSede IN INT,
        p_idGerente IN INT,
        p_idCondicion IN INT
    );

    PROCEDURE actualizar(
        p_idHospital IN INT,
        p_idDistrito IN INT,
        p_Nombre IN VARCHAR2,
        p_Antiguedad IN INT,
        p_Area IN NUMBER,
        p_idSede IN INT,
        p_idGerente IN INT,
        p_idCondicion IN INT
    );

    PROCEDURE eliminar(p_idHospital IN INT);

    PROCEDURE listar;
    
    PROCEDURE buscar_por_nombre(p_nombre IN VARCHAR2);
END pkg_hospital;
/

-- 2. Cuerpo del paquete (implementación)
CREATE OR REPLACE PACKAGE BODY pkg_hospital AS

    PROCEDURE registrar(
        p_idHospital IN INT,
        p_idDistrito IN INT,
        p_Nombre IN VARCHAR2,
        p_Antiguedad IN INT,
        p_Area IN NUMBER,
        p_idSede IN INT,
        p_idGerente IN INT,
        p_idCondicion IN INT
    ) IS
        v_count INT;
    BEGIN
        -- Validaciones
        SELECT COUNT(*) INTO v_count FROM Distrito WHERE idDistrito = p_idDistrito;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'El distrito especificado no existe.');
        END IF;

        SELECT COUNT(*) INTO v_count FROM Sede WHERE idSede = p_idSede;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'La sede especificada no existe.');
        END IF;

        SELECT COUNT(*) INTO v_count FROM Gerente WHERE idGerente = p_idGerente;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'El gerente especificado no existe.');
        END IF;

        SELECT COUNT(*) INTO v_count FROM Condicion WHERE idCondicion = p_idCondicion;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'La condición especificada no existe.');
        END IF;

        -- Inserción
        INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idSede, idGerente, idCondicion, fechaRegistro)
        VALUES (p_idHospital, p_idDistrito, p_Nombre, p_Antiguedad, p_Area, p_idSede, p_idGerente, p_idCondicion, SYSDATE);

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Hospital registrado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al registrar el hospital: ' || SQLERRM);
    END registrar;

    PROCEDURE actualizar(
        p_idHospital IN INT,
        p_idDistrito IN INT,
        p_Nombre IN VARCHAR2,
        p_Antiguedad IN INT,
        p_Area IN NUMBER,
        p_idSede IN INT,
        p_idGerente IN INT,
        p_idCondicion IN INT
    ) IS
    BEGIN
        UPDATE Hospital
        SET idDistrito = p_idDistrito,
            Nombre = p_Nombre,
            Antiguedad = p_Antiguedad,
            Area = p_Area,
            idSede = p_idSede,
            idGerente = p_idGerente,
            idCondicion = p_idCondicion
        WHERE idHospital = p_idHospital;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Hospital actualizado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al actualizar el hospital: ' || SQLERRM);
    END actualizar;

    PROCEDURE eliminar(p_idHospital IN INT) IS
    BEGIN
        DELETE FROM Hospital WHERE idHospital = p_idHospital;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Hospital eliminado correctamente.');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al eliminar el hospital: ' || SQLERRM);
    END eliminar;

    PROCEDURE listar IS
        CURSOR c_hospitales IS
            SELECT h.idHospital, h.Nombre, d.descDistrito, s.descSede, g.descGerente, c.descCondicion
            FROM Hospital h
            JOIN Distrito d ON h.idDistrito = d.idDistrito
            JOIN Sede s ON h.idSede = s.idSede
            JOIN Gerente g ON h.idGerente = g.idGerente
            JOIN Condicion c ON h.idCondicion = c.idCondicion;

        v_hospital c_hospitales%ROWTYPE;
    BEGIN
        OPEN c_hospitales;
        LOOP
            FETCH c_hospitales INTO v_hospital;
            EXIT WHEN c_hospitales%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(
                'ID: ' || v_hospital.idHospital || ', ' ||
                'Nombre: ' || v_hospital.Nombre || ', ' ||
                'Distrito: ' || v_hospital.descDistrito || ', ' ||
                'Sede: ' || v_hospital.descSede || ', ' ||
                'Gerente: ' || v_hospital.descGerente || ', ' ||
                'Condición: ' || v_hospital.descCondicion
            );
        END LOOP;
        CLOSE c_hospitales;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error al listar los hospitales: ' || SQLERRM);
    END listar;
    
    PROCEDURE buscar_por_nombre(p_nombre IN VARCHAR2) IS
        v_nombre Hospital.Nombre%TYPE;
        v_idDistrito Distrito.descDistrito%TYPE;
        v_sede Sede.descSede%TYPE;
    BEGIN
        SELECT h.Nombre, d.descDistrito, s.descSede
        INTO v_nombre, v_idDistrito, v_sede
        FROM Hospital h
        JOIN Distrito d ON h.idDistrito = d.idDistrito
        JOIN Sede s ON h.idSede = s.idSede
        WHERE LOWER(h.Nombre) = LOWER(p_nombre);

        DBMS_OUTPUT.PUT_LINE('Hospital: ' || v_nombre);
        DBMS_OUTPUT.PUT_LINE('Distrito: ' || v_idDistrito);
        DBMS_OUTPUT.PUT_LINE('Sede: ' || v_sede);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontró un hospital con el nombre: ' || p_nombre);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error en la búsqueda: ' || SQLERRM);
    END buscar_por_nombre;


END pkg_hospital;
/

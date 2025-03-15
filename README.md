Proyecto de Gestión de Hospitales

Este proyecto consiste en la creación y gestión de un sistema de base de datos para la administración de hospitales, desarrollado en Oracle SQL utilizando paquetes y procedimientos almacenados.

Contenido del Proyecto

Estructura de la Base de Datos:

Tablas principales: Hospital, Distrito, Sede, Gerente, Condicion.

Relaciones entre tablas con claves foráneas.

Paquete Principal:

pkg_hospital: Contiene procedimientos para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre la tabla Hospital.

Procedimientos Incluidos:

registrar: Inserta un nuevo hospital con validaciones de datos.

actualizar: Actualiza los datos de un hospital existente.

eliminar: Elimina un hospital por su ID.

listar: Lista todos los hospitales junto a sus datos relacionados.

buscar: (opcional) Busca hospitales por nombre o ID.

Estructura de Archivos

pkg_hospital.sql: Archivo que contiene la especificación y el cuerpo del paquete.

insert_data.sql: Archivo con instrucciones INSERT para poblar las tablas con datos de prueba.

export_db.sql: Script para exportar la base de datos.

Requisitos

Oracle SQL Developer.

Conexión a una base de datos Oracle.

Instrucciones de Uso

Importar la Base de Datos:

Ejecutar el script insert_data.sql para poblar las tablas.

Crear el Paquete:

Ejecutar el script pkg_hospital.sql para crear los procedimientos.

Probar Procedimientos:

Ejecutar bloques anónimos de ejemplo:

BEGIN
    pkg_hospital.registrar(1, 1, 'Hospital Central', 20, 1000, 1, 1, 1);
END;
/

BEGIN
    pkg_hospital.listar;
END;
/

Exportar la Base de Datos:

Utiliza el script export_db.sql o el asistente de exportación de SQL Developer.

Notas Adicionales

Se recomienda usar DBMS_OUTPUT.PUT_LINE para visualizar resultados en la consola.

Asegúrate de tener habilitada la salida de DBMS_OUTPUT en SQL Developer.

Licencia

Este proyecto es de uso libre para fines académicos y de aprendizaje.


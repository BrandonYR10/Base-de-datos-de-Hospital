----------------CREACION DE USUARIO EN BD HOSPITAL--------------------------------
-- Crear usuario con espacio en el tablespace USERS
CREATE USER adminDoctor IDENTIFIED BY adminDoctor
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;



# Proyecto de Gestión de Hospitales en Oracle PL/SQL

Este proyecto consiste en la creación y gestión de una base de datos para hospitales, utilizando Oracle PL/SQL. Incluye la creación de tablas, procedimientos almacenados dentro de un paquete y scripts para insertar, actualizar, eliminar, listar datos y buscar hospital.

## Estructura del Proyecto

```
├── scripts/
│   ├── create_tables.sql            # Script para crear las tablas del sistema
│   ├── insert_data.sql              # Script para insertar datos de prueba
│   ├── pkg_hospital_spec.sql        # Especificación del paquete (interfaz pública)
│   ├── pkg_hospital_body.sql        # Cuerpo del paquete (implementación)
│   └── test_procedures.sql          # Script para probar los procedimientos
└── README.md                        # Descripción del proyecto
```

## Requisitos
- Oracle SQL Developer
- Oracle Database 21c o superior

## Instrucciones de Uso

### 1. Crear Tablas
Ejecuta el siguiente script para crear las tablas necesarias:

```sql
@scripts/create_tables.sql
```

### 2. Insertar Datos de Prueba
Para poblar las tablas con datos aleatorios:

```sql
@scripts/insert_data.sql
```

### 3. Crear el Paquete PL/SQL
Primero, crea la especificación del paquete:

```sql
@scripts/pkg_hospital_spec.sql
```

Luego, implementa el cuerpo del paquete:

```sql
@scripts/pkg_hospital_body.sql
```

### 4. Probar los Procedimientos
Utiliza el siguiente script para probar los procedimientos (registrar, actualizar, eliminar, listar):

```sql
@scripts/test_procedures.sql
```

### 5. Exportar la Base de Datos
Para exportar la base de datos completa en SQL Developer:
1. Haz clic derecho en la conexión de la base de datos.
2. Selecciona `Exportar Datos`.
3. Elige el formato y las tablas que deseas exportar.
4. Sigue las instrucciones del asistente.

## Nomenclatura de Archivos
- Los scripts de creación y datos comienzan con `create_` e `insert_`.
- Los paquetes se separan en `pkg_hospital_spec.sql` para la especificación y `pkg_hospital_body.sql` para la implementación.
- Los scripts de prueba comienzan con `test_`.

## Contacto
Para dudas o sugerencias, puedes abrir un issue o contactarme directamente.

¡Gracias por utilizar este proyecto! 🚀


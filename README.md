Hospital Management System - Backend & Frontend
Backend (Spring Boot)
Requisitos
Java 17+

Maven 3.8+

Oracle Database 19c (o compatible)

Spring Boot 2.7+

Estructura del Proyecto
Copy
backend/
├── src/
│   ├── main/
│   │   ├── java/com/devBrandon/hospital/
│   │   │   ├── controller/        # Controladores REST
│   │   │   ├── repository/        # Repositorios de datos
│   │   │   ├── model/             # Entidades JPA
│   │   │   └── HospitalApplication.java  # Clase principal
│   │   └── resources/
│   │       ├── application.properties # Configuración BD
│   │       └── data.sql           # Datos iniciales
├── pom.xml                        # Dependencias Maven
└── README.md
Configuración
Configura la conexión a BD en application.properties:

properties
Copy
spring.datasource.url=jdbc:oracle:thin:@localhost:1521:XE
spring.datasource.username=tu_usuario
spring.datasource.password=tu_contraseña
spring.jpa.hibernate.ddl-auto=update
Endpoints Disponibles
GET /api/hospital/listar - Lista todos los hospitales

POST /api/hospital/registrar - Registra nuevo hospital

PUT /api/hospital/actualizar - Actualiza hospital existente

DELETE /api/hospital/eliminar/{id} - Elimina hospital por ID

Ejecución
bash
Copy
mvn spring-boot:run
Frontend (Angular)
Requisitos
Node.js 16+

Angular CLI 14+

Angular Material (opcional)

Estructura del Proyecto
Copy
frontend/
├── src/
│   ├── app/
│   │   ├── services/              # Servicios API
│   │   ├── components/            # Componentes
│   │   │   ├── lista-hospitales   # Listado principal
│   │   │   ├── registrar-hospital # Formulario registro
│   │   │   └── editar-hospital    # Formulario edición
│   ├── assets/
│   └── environments/              # Configuración por entorno
├── angular.json
└── package.json
Configuración
Configura la URL del backend en environment.ts:

typescript
Copy
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
Componentes Principales
ListaHospitalesComponent: Muestra listado con funciones CRUD

RegistrarHospitalComponent: Formulario de registro

EditarHospitalComponent: Formulario de edición

Ejecución
bash
Copy
npm install
ng serve
Despliegue Conjunto
Iniciar backend:

bash
Copy
cd backend && mvn spring-boot:run
Iniciar frontend:

bash
Copy
cd frontend && ng serve
Acceder en navegador:

Copy
http://localhost:4200
Dependencias Clave
Backend	Frontend
Spring Boot Starter	Angular 14+
Spring Data JPA	RxJS
Oracle JDBC	Angular Router
Lombok	Angular Forms
Licencia
MIT License - Libre uso y modificación


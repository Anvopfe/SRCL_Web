# SRCL - Sistema de Reserva de Citas en Línea

## Especificaciones del Proyecto Web
- **Entorno Ideado:** NetBeans 29, JDK 26, Apache Tomcat 11, MySQL 8.
- **Arquitectura:** Modelo-Vista-Controlador (MVC).
- **Librería de Servlets:** `jakarta.servlet.*` (Compatible con Tomcat 10+ y Tomcat 11).

## Credenciales de Prueba
- **Cliente:** `laura@mail.com` / `Clave1234`
- **Cliente (Andres):** `andres@srcl.com` / `1234`
- **Administrador:** `admin@srcl.com` / `Admin1234`

## Pasos de Instalación en NetBeans
1. Ejecuta el archivo SQL `sql/srcl_db.sql` en tu servidor MySQL.
2. Abre la carpeta del proyecto en NetBeans.
3. Agrega la librería `mysql-connector-j` en las bibliotecas del proyecto.
4. Despliega la aplicación en Tomcat 11.

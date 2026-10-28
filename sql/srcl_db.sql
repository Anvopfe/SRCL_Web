-- Base de datos para el Sistema de Reserva de Citas en Línea (SRCL)
CREATE DATABASE IF NOT EXISTS srcl_db;
USE srcl_db;

-- Tabla Rol / Usuario
CREATE TABLE usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passUsuario VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL DEFAULT 'cliente' -- 'cliente' o 'admin'
);

-- Tabla Servicio
CREATE TABLE servicio (
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    nomServicio VARCHAR(100) NOT NULL,
    duracionMin INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Tabla Cita
CREATE TABLE cita (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    usuario_idUsuario INT NOT NULL,
    servicio_idServicio INT NOT NULL,
    fecCita DATE NOT NULL,
    horaCita VARCHAR(10) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'confirmada', -- 'confirmada', 'cancelada'
    FOREIGN KEY (usuario_idUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (servicio_idServicio) REFERENCES servicio(idServicio)
);

-- Datos iniciales de prueba
INSERT INTO usuario (documento, nombre, apellido, email, passUsuario, rol) VALUES
('1001', 'Laura', 'Gómez', 'laura@mail.com', 'Clave1234', 'cliente'),
('1002', 'Carlos', 'Ruiz', 'admin@srcl.com', 'Admin1234', 'admin'),
('1009', 'Andres', 'Cárdenas', 'andres@srcl.com', '1234', 'cliente');

INSERT INTO servicio (nomServicio, duracionMin, precio) VALUES
('Consulta General', 30, 50000.00),
('Odontología', 45, 80000.00),
('Psicología', 60, 90000.00);

INSERT INTO cita (usuario_idUsuario, servicio_idServicio, fecCita, horaCita, estado) VALUES
(1, 1, '2026-11-05', '09:00', 'confirmada'),
(3, 2, '2026-11-06', '10:00', 'confirmada');

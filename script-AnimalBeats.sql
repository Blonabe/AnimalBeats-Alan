-- ===========================
-- Tablas principales
-- ===========================

CREATE TABLE Rol(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rol VARCHAR(100)
);

CREATE TABLE Documento(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100)
);

CREATE TABLE Usuarios(
    n_documento VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correoelectronico VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    id_documento BIGINT UNSIGNED REFERENCES Documento(id) ON DELETE CASCADE,
    id_rol BIGINT UNSIGNED REFERENCES Rol(id),
    estado VARCHAR(100)
);

CREATE TABLE Veterinarios (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    estudios_especialidad VARCHAR(255),
    edad INT CHECK (edad > 0),
    altura NUMERIC(4,2), 
    anios_experiencia INT CHECK (anios_experiencia >= 0),
    imagen_url TEXT, 
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Especie (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    especie VARCHAR(50),
    imagen VARCHAR(300)
);

CREATE TABLE Raza (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    raza VARCHAR(50),
    descripcion TEXT,
    id_especie BIGINT UNSIGNED REFERENCES Especie(id) ON DELETE CASCADE,
    imagen VARCHAR(300)
);

CREATE TABLE Mascota(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    id_especie BIGINT UNSIGNED NOT NULL REFERENCES Especie(id) ON DELETE CASCADE,
    id_cliente VARCHAR(10) NOT NULL REFERENCES Usuarios(n_documento) ON DELETE CASCADE,
    id_raza BIGINT UNSIGNED NOT NULL REFERENCES Raza(id) ON DELETE CASCADE,
    estado VARCHAR(100),
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Enfermedad(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) UNIQUE NOT NULL,
    descripcion TEXT
);

CREATE TABLE Servicios(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    servicio VARCHAR(200)
);

CREATE TABLE Citas(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_mascota BIGINT UNSIGNED NOT NULL REFERENCES Mascota(id) ON DELETE CASCADE,
    id_cliente VARCHAR(10) NOT NULL REFERENCES Usuarios(n_documento) ON DELETE CASCADE,
    id_servicio BIGINT UNSIGNED NOT NULL REFERENCES Servicios(id) ON DELETE CASCADE,
    id_veterinario BIGINT UNSIGNED NOT NULL REFERENCES Veterinarios(id) ON DELETE CASCADE,
    fecha TIMESTAMP NOT NULL,
    descripcion VARCHAR(255),
    estado VARCHAR(100) NOT NULL
);

CREATE TABLE Recordatorios(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_mascota BIGINT UNSIGNED NOT NULL REFERENCES Mascota(id) ON DELETE CASCADE,
    id_cliente VARCHAR(10) NOT NULL REFERENCES Usuarios(n_documento) ON DELETE CASCADE,
    fecha TIMESTAMP NOT NULL,
    descripcion TEXT NOT NULL,
    estado VARCHAR(100) NOT NULL
);



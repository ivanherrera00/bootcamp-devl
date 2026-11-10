CREATE DATABASE relaciones_db;

-- Uno a Uno (1:1)
-- Cada conductor tiene un vehículo y cada vehículo pertenece a un solo conductor.
CREATE TABLE conductores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    licencia VARCHAR(50) UNIQUE,
    fecha_ingreso DATE
);

CREATE TABLE vehiculos (
    id SERIAL PRIMARY KEY,
    patente VARCHAR(20) UNIQUE,
    modelo VARCHAR(100),
    conductor_id INT UNIQUE REFERENCES conductores(id)
);

-- Uno a Muchos (1:N)
-- Un profesor puede dictar muchas clases y cada clase pertenece a un solo profesor.
CREATE TABLE profesores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    fecha_contratacion DATE
);

CREATE TABLE clases (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    horario TIME,
    profesor_id INT REFERENCES profesores(id)
);

-- Muchos a Muchos (N:N)
-- Un paciente puede tener muchas enfermedades y una enfermedad puede afectar a muchos pacientes.
CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(20)
);

CREATE TABLE enfermedades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    nivel_gravedad VARCHAR(50) CHECK (nivel_gravedad IN ('leve', 'moderada', 'grave'))
);

CREATE TABLE pacientes_enfermedades (
    paciente_id INT REFERENCES pacientes(id),
    enfermedad_id INT REFERENCES enfermedades(id),
    fecha_diagnostico DATE,
    PRIMARY KEY (paciente_id, enfermedad_id)
);

-- INSERTS
-- Conductores
INSERT INTO conductores (nombre, licencia, fecha_ingreso) VALUES
('Juan Perez', 'LIC001', '2024-01-15'),
('Maria Lopez', 'LIC002', '2023-06-10'),
('Carlos Gomez', 'LIC003', '2025-02-20');

-- Vehiculos
INSERT INTO vehiculos (patente, modelo, conductor_id) VALUES
('ABC123', 'Toyota Corolla', 1),
('DEF456', 'Ford Focus', 2),
('GHI789', 'Volkswagen Golf', 3);

-- Profesores
INSERT INTO profesores (nombre, especialidad, fecha_contratacion) VALUES
('Laura Martinez', 'Matematica', '2020-03-10'),
('Pedro Sanchez', 'Historia', '2019-08-15'),
('Ana Torres', 'Programacion', '2022-05-20');

-- Clases
INSERT INTO clases (nombre, horario, profesor_id) VALUES
('Algebra', '08:00', 1),
('Historia Argentina', '10:00', 2),
('Programacion SQL', '14:00', 3);

-- Pacientes
INSERT INTO pacientes (nombre, fecha_nacimiento, telefono) VALUES
('Roberto Diaz', '1990-05-12', '3624123456'),
('Sofia Ramirez', '1985-11-20', '3624987654'),
('Martin Fernandez', '2000-03-08', '3624555666');

-- Enfermedades
INSERT INTO enfermedades (nombre, descripcion, nivel_gravedad) VALUES
('Gripe', 'Infeccion viral respiratoria', 'leve'),
('Neumonia', 'Infeccion pulmonar', 'grave'),
('Gastritis', 'Inflamacion del revestimiento del estomago', 'moderada');

-- Pacientes y enfermedades
INSERT INTO pacientes_enfermedades (paciente_id, enfermedad_id, fecha_diagnostico) VALUES
(1, 1, '2026-01-10'),
(1, 3, '2026-02-15'),
(2, 2, '2026-03-20');

-- INSERT QUE FALLA - Asignar dos vehículos al mismo conductor.
-- Insertar uno más del que ya tiene
-- INSERT INTO vehiculos (patente, modelo, conductor_id)
-- VALUES ('JKL012', 'Honda Civic', 1);
/*
	ERROR:  duplicate key value violates unique constraint "vehiculos_conductor_id_key"
	Key (conductor_id)=(1) already exists. 
	
	SQL state: 23505
	Detail: Key (conductor_id)=(1) already exists.
*/

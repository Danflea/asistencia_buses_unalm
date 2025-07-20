-- Tabla de Alumnos
CREATE TABLE alumnos (
    codigo VARCHAR(50) PRIMARY KEY UNIQUE NOT NULL, -- Código institucional, PK y único
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    nombre_facultad VARCHAR(100),
    nombre_especialidad VARCHAR(100),
    año_ingreso INT,
    foto_url VARCHAR(255)
);

-- Tabla de Buses
CREATE TABLE buses (
    bus_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    capacidad INT,
    estado ENUM('activo', 'inactivo', 'mantenimiento') DEFAULT 'activo'
);

-- Tabla de Choferes
CREATE TABLE choferes (
    chofer_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(15) UNIQUE NOT NULL,
    licencia VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla de Rutas
CREATE TABLE rutas (
    ruta_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    origen VARCHAR(100) NOT NULL,
    destino VARCHAR(100) NOT NULL, -- Asumiendo que es la universidad
    distancia_km DECIMAL(10, 2),
    duracion_aproximada TIME
);


CREATE TABLE Delegados (
    delegado_id INT PRIMARY KEY,  -- ya no AUTO_INCREMENT para que tú definas los valores del 10 al 29
    codigo_alumno VARCHAR(50) UNIQUE NOT NULL, -- cada alumno solo puede ser delegado una vez
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    FOREIGN KEY (codigo_alumno) REFERENCES alumnos(codigo) ON DELETE CASCADE
);


-- Tabla de Horarios
CREATE TABLE horarios (
    horario_id INT AUTO_INCREMENT PRIMARY KEY,
    ruta_id INT NOT NULL,
    bus_id INT NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada_estimada TIME,
    dias_operacion VARCHAR(50) NOT NULL, -- Ej: 'Lunes, Martes, Viernes' o 'Todos'
    delegado_asignado_id INT, -- FK a Delegados, nullable
    tipo_horario ENUM('Mañana', 'Mediodia', 'Tarde'),
    FOREIGN KEY (ruta_id) REFERENCES rutas(ruta_id) ON DELETE CASCADE,
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id) ON DELETE CASCADE,
    FOREIGN KEY (delegado_asignado_id) REFERENCES Delegados(delegado_id) ON DELETE SET NULL
);

-- Tabla de Viajes
CREATE TABLE viajes (
    viaje_id INT AUTO_INCREMENT PRIMARY KEY,
    horario_id INT NOT NULL,
    chofer_id INT NOT NULL,
    bus_id INT NOT NULL,
    fecha_salida DATETIME NOT NULL,
    fecha_llegada_real DATETIME,
    estado ENUM('programado', 'en_curso', 'finalizado', 'cancelado') DEFAULT 'programado',
    observaciones TEXT,
    capacidad_ocupada INT DEFAULT 0,
    delegado_principal_id INT, -- FK a Delegados, nullable
    FOREIGN KEY (horario_id) REFERENCES horarios(horario_id) ON DELETE CASCADE,
    FOREIGN KEY (chofer_id) REFERENCES choferes(chofer_id) ON DELETE CASCADE,
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id) ON DELETE CASCADE,
    FOREIGN KEY (delegado_principal_id) REFERENCES Delegados(delegado_id) ON DELETE SET NULL
);

-- Tabla de AsistenciaBus
CREATE TABLE AsistenciaBus (
    asistencia_id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id VARCHAR(50) NOT NULL, -- FK a alumnos.codigo
    viaje_id INT NOT NULL,
    delegado_id INT, -- FK a Delegados, puede ser nulo si se permite auto-escaneo o si no se registra quién hizo el escaneo
    fecha_hora_registro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Se asegura que siempre se registre el timestamp
    observaciones TEXT,
    valido BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(codigo) ON DELETE CASCADE,
    FOREIGN KEY (viaje_id) REFERENCES viajes(viaje_id) ON DELETE CASCADE,
    FOREIGN KEY (delegado_id) REFERENCES Delegados(delegado_id) ON DELETE SET NULL,
    -- NUEVA RESTRICCIÓN UNIQUE: Un alumno solo puede registrarse una vez por viaje.
    UNIQUE (alumno_id, viaje_id)
);

-- Tabla de Solicitudes Especiales
CREATE TABLE SolicitudesEspeciales (
    solicitud_id INT AUTO_INCREMENT PRIMARY KEY,
    solicitante_id VARCHAR(50) NOT NULL, -- FK a alumnos.codigo
    tipo_solicitud ENUM('academica', 'deportiva', 'cultural', 'otros') NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_hora_requerida DATETIME NOT NULL,
    num_pasajeros_estimado INT,
    ruta_sugerida_id INT, -- FK a rutas, puede ser nulo
    estado_solicitud ENUM('pendiente', 'aprobada', 'rechazada', 'completada') DEFAULT 'pendiente',
    fecha_resolucion DATETIME,
    observaciones_admin TEXT,
    viaje_asignado_id INT, -- FK a viajes, nulo hasta que se asigne un viaje
    FOREIGN KEY (solicitante_id) REFERENCES alumnos(codigo) ON DELETE CASCADE,
    FOREIGN KEY (ruta_sugerida_id) REFERENCES rutas(ruta_id) ON DELETE SET NULL,
    FOREIGN KEY (viaje_asignado_id) REFERENCES viajes(viaje_id) ON DELETE SET NULL
);



















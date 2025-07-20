-- data de alumnos

LOAD DATA INFILE 'data_alumnos_asistencia.csv'
	INTO	TABLE alumnos
	CHARACTER SET utf8mb4
	FIELDS TERMINATED BY ';'
	LINES TERMINATED BY '\r\n'
	(codigo, nombre, apellido, dni, nombre_facultad, nombre_especialidad, `año_ingreso`, foto_url);

SELECT COUNT(*) AS total_registros FROM alumnos;

-- data buses

-- Buses
INSERT INTO buses (bus_id, placa, modelo, capacidad, estado) VALUES
(1001, 'ABC-123', 'Mercedes-Benz', 25, 'activo'),
(1002, 'DEF-456', 'Mercedes-Benz', 40, 'activo'),
(1003, 'GHI-789', 'Mercedes-Benz', 35, 'activo'),
(1004, 'JKL-012', 'Mercedes-Benz', 50, 'activo'),
(1005, 'MNO-345', 'Mercedes-Benz', 30, 'activo'),
(1006, 'PQR-678', 'Mercedes-Benz', 40, 'activo'),
(1007, 'STU-901', 'Mercedes-Benz', 32, 'activo'),
(1008, 'VWX-234', 'Mercedes-Benz', 20, 'activo'),
(1009, 'YZA-567', 'Mercedes-Benz', 45, 'activo'),
(1010, 'BCD-890', 'Mercedes-Benz', 38, 'activo');

SELECT *
FROM buses


-- data choferes

INSERT INTO choferes (nombre, dni, licencia, telefono)	VALUES
('Carlos García', '87654321', 'LIC-001', '987654321'),
('María López', '73219876', 'LIC-002', '912345678'),
('Luis Ramos', '70891234', 'LIC-003', '934567890'),
('Ana Torres', '72345678', 'LIC-004', '987123456'),
('José Fernández', '70123456', 'LIC-005', '954321789'),
('Rosa Díaz', '73456789', 'LIC-006', '965432187'),
('Jorge Salazar', '72222222', 'LIC-007', '976543210'),
('Lucía Vega', '71119999', 'LIC-008', '998877665'),
('Juan Martinez', '87659921', 'LIC-009', '98799321'),
('Alberto Carando',	'76659921',	'LIC-010',	'902684608');

SELECT * FROM choferes	

-- data rutas

INSERT INTO rutas (nombre, origen, destino, distancia_km, duracion_aproximada) VALUES
-- Rutas de IDA hacia la UNALM
('SAN JUAN DE LURIGANCHO', 'FRENTE AL MERCADO SAN CARLOS (RUTA: AV.LIMA)', 'Universidad Nacional Agraria La Molina', 20.00, '00:50:00'), -- ruta_id: 1
('SAN JUAN DE MIRAFLORES', 'KONGÓ PLAZA DE TOTTUS ATOCONGO', 'Universidad Nacional Agraria La Molina', 18.00, '00:45:00'), -- ruta_id: 2
('JAVIER PRADO', 'PARQUE ABTAO', 'Universidad Nacional Agraria La Molina', 10.00, '00:30:00'), -- ruta_id: 3
('AV. HABICH', 'AV. HABICH ALTURA DE LA PUERTA 5 DE LA UNI', 'Universidad Nacional Agraria La Molina', 12.00, '00:35:00'), -- ruta_id: 4
('CAQUETA', 'PUENTE CAQUETA (DEBAJO, CON DIRECCIÓN HACIA EL SUR)', 'Universidad Nacional Agraria La Molina', 15.00, '00:40:00'), -- ruta_id: 5
('ATE', 'PARADERO UNIÓN', 'Universidad Nacional Agraria La Molina', 5.00, '00:20:00'), -- ruta_id: 6
('MUSA', 'COSTADO DEL COLEGIO JOSÉ MARELLO', 'Universidad Nacional Agraria La Molina', 8.00, '00:25:00'), -- ruta_id: 7
('GRAU', 'AV. IQUITOS CRUCE CON JR. ANTONIO RAYMONDI', 'Universidad Nacional Agraria La Molina', 7.00, '00:25:00'), -- ruta_id: 8
('MANCHAY', 'OVALO DE MANCHAY EN LA MUN. DE PACHACAMAC', 'Universidad Nacional Agraria La Molina', 25.00, '01:00:00'), -- ruta_id: 9 -- This is the 9th row in the values list.

-- Ruta de IDA adicional de San Juan de Miraflores
('SAN JUAN DE MIRAFLORES (Puente Alipio)', 'Puente Alipio (Metro)', 'Universidad Nacional Agraria La Molina', 20.00, '00:45:00'), -- ruta_id: 10

-- Rutas de MEDIODÍA (Ida y Vuelta del Shuttle)
('UNALM - ESTACION LA CULTURA (Ida)', 'Universidad Nacional Agraria La Molina', 'Estación La Cultura', 10.00, '00:35:00'), -- ruta_id: 11
('ESTACION LA CULTURA - UNALM (Vuelta)', 'Estación La Cultura', 'Universidad Nacional Agraria La Molina', 10.00, '00:20:00'), -- ruta_id: 12

-- Rutas de REGRESO desde la UNALM
('SAN JUAN DE LURIGANCHO (Regreso)', 'Universidad Nacional Agraria La Molina', 'FRENTE AL MERCADO SAN CARLOS (RUTA: AV.LIMA)', 20.00, '00:50:00'), -- ruta_id: 13
('SAN JUAN DE MIRAFLORES (Regreso)', 'Universidad Nacional Agraria La Molina', 'Estación Atocongo', 18.00, '00:45:00'), -- ruta_id: 14 (¡Modificada!)
('JAVIER PRADO (Regreso)', 'Universidad Nacional Agraria La Molina', 'PARQUE ABTAO', 10.00, '00:30:00'), -- ruta_id: 15
('AV. HABICH (Regreso)', 'Universidad Nacional Agraria La Molina', 'AV. HABICH ALTURA DE LA PUERTA 5 DE LA UNI', 12.00, '00:35:00'), -- ruta_id: 16
('CAQUETA (Regreso)', 'Universidad Nacional Agraria La Molina', 'PUENTE CAQUETA (DEBAJO, CON DIRECCIÓN HACIA EL SUR)', 15.00, '00:40:00'), -- ruta_id: 17
('ATE (Regreso)', 'Universidad Nacional Agraria La Molina', 'PARADERO UNIÓN', 5.00, '00:20:00'), -- ruta_id: 18
('MUSA (Regreso)', 'Universidad Nacional Agraria La Molina', 'COSTADO DEL COLEGIO JOSÉ MARELLO', 8.00, '00:25:00'), -- ruta_id: 19
('GRAU (Regreso)', 'Universidad Nacional Agraria La Molina', 'AV. IQUITOS CRUCE CON JR. ANTONIO RAYMONDI', 7.00, '00:25:00'), -- ruta_id: 20
('MANCHAY (Regreso)', 'Universidad Nacional Agraria La Molina', 'OVALO DE MANCHAY EN LA MUN. DE PACHACAMAC', 25.00, '01:00:00'); -- ruta_id: 21

SELECT * FROM rutas

-- data delegados

INSERT INTO Delegados (delegado_id, codigo_alumno, estado) VALUES
(10, 20211642, 'activo'),
(11, 20220763, 'activo'), -- modificar en alumnos ?20220763 a 20220763
(12, 20220780, 'activo'),
(13, 20221468, 'activo'),
(14, 20230117, 'activo'),
(15, 20230151, 'activo'),
(16, 20230176, 'activo'),
(17, 20230302, 'activo'),
(18, 20230311, 'activo'),
(19, 20230321, 'activo'),
(20, 20230483, 'activo'),
(21, 20230531, 'activo'),
(22, 20230693, 'activo'),
(23, 20230992, 'activo'),
(24, 20231225, 'activo'),
(25, 20231248, 'activo'),
(26, 20231288, 'activo'),
(27, 20231289, 'activo'),
(28, 20231326, 'activo'),
(29, 20231377, 'activo');


-- data horarios
--
-- Horarios de la Mañana (06:30 AM) - 10 rutas
--

INSERT INTO horarios (ruta_id, bus_id, hora_salida, hora_llegada_estimada, dias_operacion, delegado_asignado_id, tipo_horario) VALUES
(1, 1001, '06:30:00', '07:20:00', 'Lunes-Viernes', 10, 'Mañana'),   -- SJL (Ruta 1, Bus 3)
(2, 1002, '06:30:00', '07:15:00', 'Lunes-Viernes',11, 'Mañana'),   -- SJM Kongó (Ruta 2, Bus 1)
(10, 1003, '06:30:00', '07:15:00', 'Lunes-Viernes', 12, 'Mañana'),  -- SJM Puente Alipio (Ruta 10, Bus 2)
(3, 1004, '06:30:00', '07:00:00', 'Lunes-Viernes', 13, 'Mañana'),   -- Javier Prado (Ruta 3, Bus 4)
(4, 1005, '06:30:00', '07:05:00', 'Lunes-Viernes', 14, 'Mañana'),   -- Av. Habich (Ruta 4, Bus 5)
(5, 1006, '06:30:00', '07:10:00', 'Lunes-Viernes', 15, 'Mañana'),   -- Caqueta (Ruta 5, Bus 6)
(8, 1007, '06:30:00', '07:00:00', 'Lunes-Viernes', 16, 'Mañana'),   -- Grau (Ruta 8, Bus 9)
(9, 1008, '06:30:00', '07:30:00', 'Lunes-Viernes', 17, 'Mañana'),  -- Manchay (Ruta 9, Bus 10)

-- Rutas de la Mañana (06:40 AM)
(6, 1009, '06:40:00', '07:00:00', 'Lunes-Viernes', 18, 'Mañana'),   -- Ate (Ruta 6, Bus 7)
(7, 1010, '06:40:00', '07:05:00', 'Lunes-Viernes', 19, 'Mañana'); -- Musa (Ruta 7, Bus 8)
--
-- Horarios del Mediodia - 2 rutas
--

INSERT INTO horarios (ruta_id, bus_id, hora_salida, hora_llegada_estimada, dias_operacion, delegado_asignado_id, tipo_horario) VALUES
(11, 1009, '13:00:00', '13:35:00', 'Lunes-Viernes', 20, 'Mediodia'), -- UNALM -> Estación La Cultura (Ruta 11, Bus 11)
(12, 1009, '13:40:00', '14:00:00', 'Lunes-Viernes', 20, 'Mediodia'); -- Estación La Cultura -> UNALM (Ruta 12, Bus 11) - Mismo delegado 11 para el shuttle


--
-- Horarios de la Tarde - 9 rutas 
--

INSERT INTO horarios (ruta_id, bus_id, hora_salida, hora_llegada_estimada, dias_operacion, delegado_asignado_id, tipo_horario) VALUES
-- Rutas de la Tarde (04:00 PM)
(13, 1001, '16:00:00', '16:50:00', 'Lunes-Viernes', 21, 'Tarde'),  -- SJL Regreso (Ruta 13, Bus 3)
(15, 1002, '16:00:00', '16:30:00', 'Lunes-Viernes', 22, 'Tarde'),  -- Javier Prado Regreso (Ruta 15, Bus 4)
(16, 1003, '16:00:00', '16:35:00', 'Lunes-Viernes', 23, 'Tarde'),  -- Av. Habich Regreso (Ruta 16, Bus 5)
(19, 1004, '16:00:00', '16:25:00', 'Lunes-Viernes', 24, 'Tarde'),  -- Musa Regreso (Ruta 19, Bus 8) - Delegado 15
(20, 1005, '16:00:00', '16:25:00', 'Lunes-Viernes', 25, 'Tarde'),  -- Grau Regreso (Ruta 20, Bus 9)
(21, 1006, '16:00:00', '17:00:00', 'Lunes-Viernes', 26, 'Tarde'),  -- Manchay Regreso (Ruta 21, Bus 8) - MISMO Delegado 15 que Musa

-- Horarios de la Tarde (05:00 PM)
(14, 1007, '17:00:00', '17:45:00', 'Lunes-Viernes', 27, 'Tarde'),  -- SJM Regreso (Ruta 14, Bus 1)
(17, 1008, '17:00:00', '17:40:00', 'Lunes-Viernes', 28, 'Tarde'),   -- Caqueta Regreso (Ruta 17, Bus 6)
(18, 1009, '17:00:00', '17:20:00', 'Lunes-Viernes', 29, 'Tarde');   -- Ate Regreso (Ruta 18, Bus 7) - Rotamos al delegado 1 para reusar IDs


SELECT b.bus_id, r.origen, r.destino, a.nombre, h.tipo_horario
FROM horarios AS h
JOIN buses AS b ON b.bus_id = h.bus_id
JOIN rutas AS r ON r.ruta_id = h.ruta_id
JOIN delegados AS d ON d.delegado_id = h.delegado_asignado_id
JOIN alumnos AS a ON a.codigo = h.delegado_asignado_id;


-- data viajes

INSERT INTO viajes (horario_id, chofer_id, bus_id, fecha_salida, estado, delegado_principal_id) VALUES
(1, 1, 1001, '2025-07-01 06:30:00', 'programado', 10),
(2, 2, 1002, '2025-07-01 06:30:00', 'programado', 11),
(3, 3, 1003, '2025-07-01 06:30:00', 'programado', 12),
(4, 4, 1004, '2025-07-01 06:30:00', 'programado', 13),
(5, 5, 1005, '2025-07-01 06:30:00', 'programado', 14),
(6, 6, 1006, '2025-07-01 06:30:00', 'programado', 15),
(7, 7, 1007, '2025-07-01 06:30:00', 'programado', 16),
(8, 8, 1008, '2025-07-01 06:30:00', 'programado', 17),
(9, 9, 1009, '2025-07-01 06:30:00', 'programado', 18),
(10, 10, 1010, '2025-07-01 06:30:00', 'programado', 19),
(11, 1, 1009, '2025-07-01 06:30:00', 'programado', 20),
(12, 2, 1009, '2025-07-01 06:30:00', 'programado', 21),
(13, 3, 1001, '2025-07-01 06:30:00', 'programado', 22),
(14, 4, 1002, '2025-07-01 06:30:00', 'programado', 23),
(15, 5, 1003, '2025-07-01 06:30:00', 'programado', 24),
(16, 6, 1004, '2025-07-01 06:30:00', 'programado', 25),
(17, 7, 1005, '2025-07-01 06:30:00', 'programado', 26),
(18, 8, 1006, '2025-07-01 06:30:00', 'programado', 27),
(19, 9, 1007, '2025-07-01 06:30:00', 'programado', 28),
(20, 10, 1008, '2025-07-01 06:30:00', 'programado', 29);
































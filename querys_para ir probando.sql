SELECT * FROM `asistenciabus`



SELECT  AB.fecha_hora_registro,
        R.destino,
        R.nombre AS ruta_nombre,
        CH.nombre AS nombre_chofer,
        B.placa AS placa_bus,
				AB.delegado_id
FROM    AsistenciaBus AB
JOIN    viajes V ON AB.viaje_id = V.viaje_id
JOIN    horarios H ON V.horario_id = H.horario_id
JOIN    rutas R ON H.ruta_id = R.ruta_id
JOIN    choferes CH ON V.chofer_id = CH.chofer_id
JOIN    buses B ON V.bus_id = B.bus_id

WHERE   AB.alumno_id = '20220763'
ORDER BY AB.fecha_hora_registro DESC;


SELECT a.nombre AS nombre_delegado
FROM alumnos AS a
LEFT	JOIN delegados AS d ON a.codigo = d.delegado_id;



SELECT  AB.fecha_hora_registro,
        R.destino,
        R.nombre AS ruta_nombre,
        CH.nombre AS nombre_chofer,
        B.placa AS placa_bus,
        A.nombre AS nombre_delegado -- agregar
FROM    AsistenciaBus AB
JOIN    viajes V ON AB.viaje_id = V.viaje_id
JOIN    horarios H ON V.horario_id = H.horario_id
JOIN    rutas R ON H.ruta_id = R.ruta_id
JOIN    choferes CH ON V.chofer_id = CH.chofer_id
JOIN    buses B ON V.bus_id = B.bus_id
JOIN   delegados D ON AB.delegado_id = D.delegado_id -- agregar
JOIN   alumnos A ON D.codigo_alumno = A.codigo -- agregar
WHERE   AB.alumno_id = '20220763'
ORDER BY AB.fecha_hora_registro DESC;



SELECT 
    al.foto_url AS foto_delegado
FROM 
    asistenciabus a
JOIN 
    delegados d ON a.delegado_id = d.delegado_id
JOIN 
    alumnos al ON d.codigo_alumno = al.codigo;





SELECT al.foto_url AS foto_delegado
FROM asistenciabus AS a
JOIN delegados AS d ON a.delegado_id = d.delegado_id
JOIN alumnos AS al ON d.codigo_alumno = al.codigo;


SELECT	a.nombre,	a.apellido,	asis.fecha_hora_registro
FROM	asistenciabus asis
JOIN	alumnos a ON asis.alumno_id = a.codigo
WHERE	asis.viaje_id = '1'
	ORDER BY	asis.fecha_hora_registro DESC;













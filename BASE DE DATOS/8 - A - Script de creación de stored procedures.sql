-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE BUSCA REGISTRO DE PESO POR DNI

DELIMITER //
CREATE PROCEDURE BuscarRegistrosPesoPorDNI(IN dniAlumno VARCHAR(45))
BEGIN
  SELECT rp.id, rp.usuario_id, rp.peso, rp.fecha
  FROM registros_de_peso rp
  JOIN alumnos a ON rp.usuario_id = a.id_alumno
  WHERE a.dni = dniAlumno;
END;
//
DELIMITER ;


CALL BuscarRegistrosPesoPorDNI('4202324');



-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE BUSCAR REGISTRO DE PESO POR DNI Y SE PUEDE ORDENAR DE FORMA DESCENDENTE O ASCENDENTE
DELIMITER //

CREATE PROCEDURE BuscarRegistrosPesoPorDNIConOrden(IN dniAlumno VARCHAR(45), IN campoOrden VARCHAR(255), IN direccionOrden VARCHAR(10))
BEGIN
  SET @query = CONCAT(
    'SELECT rp.id, rp.usuario_id, rp.peso, rp.fecha 
    FROM registros_de_peso rp
    JOIN alumnos a ON rp.usuario_id = a.id_alumno
    WHERE a.dni = "', dniAlumno, '" 
    ORDER BY ', campoOrden, ' ', direccionOrden
  );

  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;


CALL BuscarRegistrosPesoPorDNIConOrden('4202324', 'fecha', 'ASC');
CALL BuscarRegistrosPesoPorDNIConOrden('4202324', 'fecha', 'DESC');



-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE INSERTA UN REGISTRO DE PESO SEGUN EL DNI DE LA PERSONA 
DELIMITER //
-- Procedimiento: InsertarRegistroPesoPorDNI
CREATE PROCEDURE InsertarRegistroPesoPorDNI(IN dniAlumno VARCHAR(45), IN peso DECIMAL(4, 1), IN fecha DATE)
BEGIN
  DECLARE usuarioId INT;
  
  -- Buscar el usuario_id a partir del DNI
  SELECT id_alumno INTO usuarioId
  FROM alumnos
  WHERE dni = dniAlumno;
  
  -- Insertar el registro de peso
  INSERT INTO registros_de_peso (usuario_id, peso, fecha)
  VALUES (usuarioId, peso, fecha);
END;
//
DELIMITER ;

CALL InsertarRegistroPesoPorDNI('4202324', 70.5, '2023-03-10');






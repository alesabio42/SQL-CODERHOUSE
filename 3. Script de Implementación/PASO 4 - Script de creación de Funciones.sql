-- //////////////////////////////////////FUNCION 1/////////////////////////////////////////--

-- FUNCION PARA CONTAR CUANTOS MOVIMIENTOS HAY EN LA TABLA DE MOVIMIENTOS
DELIMITER //
CREATE FUNCTION CountMovimientos() RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE count INT;
  SELECT COUNT(*) INTO count FROM Movimientos;
  RETURN count;
END;
//
DELIMITER ;

SELECT CountMovimientos();


-- //////////////////////////////////////FUNCION 2/////////////////////////////////////////--

-- FUNCION PARA SABER CUAL ES EL ULTIMO PESO REGISTRADO SEGUN NUMERO DE DNI
DELIMITER //
CREATE FUNCTION ObtenerUltimoPesoPorDNI(dniAlumno VARCHAR(45)) RETURNS DECIMAL(4, 1)
READS SQL DATA
BEGIN
  DECLARE lastWeight DECIMAL(4, 1);

  SELECT MAX(rp.peso) INTO lastWeight
  FROM registros_de_peso rp
  JOIN alumnos a ON rp.usuario_id = a.id_alumno
  WHERE a.dni = dniAlumno;

  RETURN lastWeight;
END;
//
DELIMITER ;


SELECT ObtenerUltimoPesoPorDNI('4202324');

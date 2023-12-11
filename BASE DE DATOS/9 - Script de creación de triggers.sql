-- //////////////////////TRABAJANDO CON LA TABLA "ALUMNOS"/////////////////////////--


CREATE TABLE `log_alumnos` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `accion` varchar(10) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_log`),
  INDEX `fk_log_alumnos_alumnos_idx` (`id_alumno` ASC),
  CONSTRAINT `fk_log_alumnos_alumnos`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `alumnos` (`id_alumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Trigger BEFORE INSERT
-- Este trigger se ejecutará antes de insertar un nuevo registro en la tabla alumnos. 
-- Registrará el usuario, la fecha y la hora de la operación en la tabla log_alumnos.
DELIMITER //
CREATE TRIGGER before_insert_alumnos
AFTER INSERT ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos (id_alumno, accion, usuario, fecha, hora)
    VALUES (NEW.id_alumno, 'INSERT', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;


-- Trigger AFTER UPDATE
-- Este trigger se ejecutará después de actualizar un registro en la tabla alumnos. 
-- Registrará el usuario, la fecha y la hora de la operación en la tabla log_alumnos.
DELIMITER //
CREATE TRIGGER after_update_alumnos
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos (id_alumno, accion, usuario, fecha, hora)
    VALUES (NEW.id_alumno, 'UPDATE', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- PASO 1
-- Insertar un nuevo alumno
INSERT INTO alumnos (apellido, nombre, fecha_nacimiento, sexo, dni, estado, fecha_creacion, estado_civil, clase)
VALUES ('CARLOS', 'JUAN', '1990-05-15', 'M', '12344321', 'A', NOW(), 'SOLTERO', '1 PM');

-- PASO 2
-- Actualizar el estado civil de un alumno
UPDATE alumnos SET estado_civil = 'SOLTERO' WHERE id_alumno = 5;

-- PASO 3
-- Verificar el registro en la tabla de log
SELECT * FROM log_alumnos;



-- //////////////////////TRABAJANDO CON LA TABLAS "PESO" Y "IMC" /////////////////////////--
DROP TABLE IF EXISTS `log_registros`;
CREATE TABLE `log_registros` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(20) NOT NULL,
  `operacion` varchar(10) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 1- Trigger para registros_de_imc:
-- Este trigger se ejecutará al realizar una inserción o actualización en la tabla registros_de_imc. 
-- Registrará en la tabla de log los detalles de la operación.

DELIMITER //
CREATE TRIGGER before_insert_imc
BEFORE INSERT ON registros_de_imc
FOR EACH ROW
BEGIN
    INSERT INTO log_registros (tabla_afectada, operacion, usuario, fecha, hora)
    VALUES ('registros_de_imc', 'BEFORE INSERT', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_update_imc
AFTER UPDATE ON registros_de_imc
FOR EACH ROW
BEGIN
    INSERT INTO log_registros (tabla_afectada, operacion, usuario, fecha, hora)
    VALUES ('registros_de_imc', 'AFTER UPDATE', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

-- 2- Trigger para registros_de_peso:
-- Este trigger se ejecutará al realizar una inserción o actualización en la tabla registros_de_peso. 
-- Registrará en la tabla de log los detalles de la operación.

DELIMITER //
CREATE TRIGGER before_insert_peso
BEFORE INSERT ON registros_de_peso
FOR EACH ROW
BEGIN
    INSERT INTO log_registros (tabla_afectada, operacion, usuario, fecha, hora)
    VALUES ('registros_de_peso', 'BEFORE INSERT', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_update_peso
AFTER UPDATE ON registros_de_peso
FOR EACH ROW
BEGIN
    INSERT INTO log_registros (tabla_afectada, operacion, usuario, fecha, hora)
    VALUES ('registros_de_peso', 'AFTER UPDATE', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

ALTER TABLE log_registros MODIFY COLUMN operacion VARCHAR(50);


-- EJEMPLOS DE PRUEBA
-- Insertar un nuevo registro en registros_de_imc
INSERT INTO registros_de_imc (usuario_id, imc, fecha) VALUES (11, 35.5, '2023-04-09');


-- Insertar un nuevo registro en registros_de_peso
INSERT INTO registros_de_peso (usuario_id, peso, fecha) VALUES (11, 70.0, '2023-04-09');


-- Actualizar el registro de peso para el usuario 11 con id 9
UPDATE registros_de_peso SET peso = 80.0 WHERE id = 9 AND usuario_id = 11;

-- Actualizar el registro de IMC para el usuario 11 con id 11
UPDATE registros_de_imc SET imc = 27.0 WHERE id = 11 AND usuario_id = 11;

-- Consultar los registros en log_registros
SELECT * FROM log_registros;






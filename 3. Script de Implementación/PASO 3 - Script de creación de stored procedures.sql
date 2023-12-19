
-- //////////////////////////////////////STORED PROCEDURES 1/////////////////////////////////////////--

-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE BUSCA REGISTRO DE PESO POR DNI 
-- Debido a la sugerencia del tutor, se agregan mensajes de error --
DELIMITER //

CREATE PROCEDURE BuscarRegistrosPesoPorDNI(IN dniAlumno VARCHAR(45))
BEGIN
    -- Verificar si el parámetro dniAlumno es un número entero
    IF NOT dniAlumno REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI debe ser un número entero válido.';
    ELSE
        -- Contar registros para el DNI proporcionado
        SELECT COUNT(*) INTO @num_rows
        FROM registros_de_peso rp
        JOIN alumnos a ON rp.usuario_id = a.id_alumno
        WHERE a.dni = dniAlumno;

        -- Si no se encuentran registros, generar un mensaje
        IF @num_rows = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay registros para el DNI proporcionado.';
        ELSE
            -- Se encontraron registros, ejecutar la consulta original
            SELECT rp.id, rp.usuario_id, rp.peso, rp.fecha
            FROM registros_de_peso rp
            JOIN alumnos a ON rp.usuario_id = a.id_alumno
            WHERE a.dni = dniAlumno;
        END IF;
    END IF;
END //

DELIMITER ;


CALL BuscarRegistrosPesoPorDNI('4202324');


-- //////////////////////////////////////STORED PROCEDURES 2/////////////////////////////////////////--

-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE BUSCA REGISTRO DE PESO POR DNI Y SE PUEDE ORDENAR DE FORMA DESCENDENTE O ASCENDENTE

DELIMITER //

CREATE PROCEDURE BuscarRegistrosPesoPorDNIConOrden(IN dniAlumno VARCHAR(45), IN campoOrden VARCHAR(255), IN direccionOrden VARCHAR(10))
BEGIN
    DECLARE dniValido INT DEFAULT 1;
    DECLARE num_rows INT;

    -- Verificar si el DNI es un número
    SET @dniAlumno = dniAlumno;
    SET @dniAlumno = TRIM(BOTH '"' FROM @dniAlumno);

    IF NOT @dniAlumno REGEXP '^[0-9]+$' THEN
        SET dniValido = 0;
    ELSE
        -- Convertir el DNI a un entero
        SET dniAlumno = CAST(@dniAlumno AS SIGNED);
    END IF;

    -- Si el DNI no es válido, generar un error
    IF dniValido = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI debe ser un número entero válido.';
    ELSE
        -- Verificar si los campos de orden y dirección son válidos
        IF NOT campoOrden IN ('id', 'usuario_id', 'peso', 'fecha') OR NOT direccionOrden IN ('ASC', 'DESC') THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Campos de orden o dirección de orden no válidos.';
        ELSE
            SET @query = CONCAT(
                'SELECT rp.id, rp.usuario_id, rp.peso, rp.fecha 
                FROM registros_de_peso rp
                JOIN alumnos a ON rp.usuario_id = a.id_alumno
                WHERE a.dni = ', dniAlumno, ' 
                ORDER BY ', campoOrden, ' ', direccionOrden
            );

            -- Ejecutar la consulta dinámica
            PREPARE stmt FROM @query;
            EXECUTE stmt;

            -- Contar registros
            SELECT COUNT(*) INTO num_rows
            FROM registros_de_peso rp
            JOIN alumnos a ON rp.usuario_id = a.id_alumno
            WHERE a.dni = dniAlumno;

            -- Si no hay registros, generar un mensaje
            IF num_rows = 0 THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay registros para el DNI proporcionado.';
            END IF;

            DEALLOCATE PREPARE stmt;
        END IF;
    END IF;
END;
//

DELIMITER ;


CALL BuscarRegistrosPesoPorDNIConOrden('4202324', 'fecha', 'ASC');
CALL BuscarRegistrosPesoPorDNIConOrden('4202324', 'fecha', 'DESC');


-- //////////////////////////////////////STORED PROCEDURES 3/////////////////////////////////////////--

-- CREACION DE UN PROCEDIMIENTO ALMACENADO QUE INSERTA UN REGISTRO DE PESO SEGUN EL DNI DE LA PERSONA 

DELIMITER //
-- Procedimiento: InsertarRegistroPesoPorDNI
CREATE PROCEDURE InsertarRegistroPesoPorDNI(IN dniAlumno VARCHAR(45), IN peso DECIMAL(4, 1), IN fecha DATE)
BEGIN
    DECLARE usuarioId INT;

    -- Verificar si el DNI es un número
    SET @dniAlumno = dniAlumno;
    SET @dniAlumno = TRIM(BOTH '"' FROM @dniAlumno);

    IF NOT @dniAlumno REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El DNI debe ser un número entero válido.';
    ELSE
        -- Convertir el DNI a un entero
        SET dniAlumno = CAST(@dniAlumno AS SIGNED);

        -- Buscar el usuario_id a partir del DNI
        SELECT id_alumno INTO usuarioId
        FROM alumnos
        WHERE dni = dniAlumno;

        -- Insertar el registro de peso
        INSERT INTO registros_de_peso (usuario_id, peso, fecha)
        VALUES (usuarioId, peso, fecha);
    END IF;
END;
//

DELIMITER ;

CALL InsertarRegistroPesoPorDNI('4202324', 70.5, '2023-03-10');






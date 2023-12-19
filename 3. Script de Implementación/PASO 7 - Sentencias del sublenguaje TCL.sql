-- -----------------------------------------------TABLA NUMERO 1----------------------------------------------------
DELIMITER //
CREATE PROCEDURE gestionar_transaccion()
BEGIN
    -- Iniciar la transacción
    START TRANSACTION;

    -- Variable para almacenar la cantidad de registros en Materiales
    SELECT COUNT(*) INTO @num_registros FROM Materiales;

    -- Si la tabla Materiales tiene registros, eliminar algunos de ellos
    IF @num_registros > 0 THEN
        -- Guardar registros importantes antes de eliminar (pueden ser necesarios para reinsertar)
        -- INSERT INTO Materiales_backup SELECT * FROM Materiales WHERE id IN (1, 2, 3);
        
        -- Eliminar algunos registros
        DELETE FROM Materiales WHERE id IN (1, 2, 3);
    ELSE
        -- Si la tabla Materiales no tiene registros, realizar inserción
        INSERT INTO Materiales (concepto, definicion) VALUES ('NuevoMaterial', 'Definición del nuevo material');
    END IF;

    -- Comentario: Sentencia ROLLBACK (descomentar si es necesario revertir cambios)
	-- ROLLBACK;

    -- Comentario: Sentencia COMMIT (descomentar si todos los cambios son correctos)
    -- COMMIT;

    -- Finalizar el procedimiento almacenado
    END //
DELIMITER ;


-- Llamar al procedimiento almacenado para gestionar la transacción
CALL gestionar_transaccion();



-- -----------------------------------------------TABLA NUMERO 2----------------------------------------------------
DELIMITER //
CREATE PROCEDURE gestionar_insercion_movimientos()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejar errores y hacer un ROLLBACK si ocurre una excepción
        ROLLBACK;
    END;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Inserción de los primeros cuatro registros
    INSERT INTO Movimientos (concepto, definicion) VALUES
        ('NuevoConcepto1', 'Nueva Definición1'),
        ('NuevoConcepto2', 'Nueva Definición2'),
        ('NuevoConcepto3', 'Nueva Definición3'),
        ('NuevoConcepto4', 'Nueva Definición4');

    -- Guardar un savepoint después de la inserción del registro #4
    SAVEPOINT savepoint_despues_de_4;

    -- Inserción de los siguientes cuatro registros
    INSERT INTO Movimientos (concepto, definicion) VALUES
        ('NuevoConcepto5', 'Nueva Definición5'),
        ('NuevoConcepto6', 'Nueva Definición6'),
        ('NuevoConcepto7', 'Nueva Definición7'),
        ('NuevoConcepto8', 'Nueva Definición8');

    -- Guardar un savepoint después de la inserción del registro #8
    SAVEPOINT savepoint_despues_de_8;

    -- Comentario: Sentencia para eliminar el savepoint después de los primeros 4 registros insertados
-- ROLLBACK TO savepoint_despues_de_4;

    -- Comentario: Sentencia ROLLBACK (descomentar si es necesario revertir cambios)
--     ROLLBACK;

    -- Comentario: Sentencia COMMIT (descomentar si todos los cambios son correctos)
--     COMMIT;

END //

DELIMITER ;

-- Iniciar la transacción y realizar inserciones
CALL gestionar_insercion_movimientos();




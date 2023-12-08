CREATE VIEW material AS
 (SELECT concepto, definicion FROM materiales);
SELECT * FROM Material;


CREATE VIEW movimiento AS
 (SELECT concepto, definicion FROM movimientos);
SELECT * FROM movimiento;

CREATE VIEW terminos AS
 (SELECT concepto, definicion FROM TerminosBasicos);
SELECT * FROM terminos;

CREATE VIEW consultas AS
 (SELECT correo, mensaje FROM registros_de_consultas);
SELECT * FROM consultas;

CREATE VIEW alumnosactivos AS
 (SELECT apellido, nombre 
 FROM alumnos
 WHERE estado like upper('A')
 );
SELECT * FROM alumnosactivos;


-- Creación de una vista que presenta información simplificada sobre los alumnos, mostrando su apellido, DNI, la fecha de su último pago y si dicho pago está activo o vencido
CREATE VIEW Vista_Alumnos_Ultimo_Pago AS
SELECT
    a.apellido,
    a.dni,
    subquery.fecha,
    CASE
        WHEN DATEDIFF(CURDATE(), subquery.fecha) < 30 THEN 'ACTIVO'
        ELSE 'VENCIDO'
    END AS estado_pago
FROM (
    SELECT
        a.id_alumno,
        a.apellido,
        a.dni,
        p.fecha,
        ROW_NUMBER() OVER (PARTITION BY a.id_alumno ORDER BY p.fecha DESC) AS rn
    FROM
        alumnos a
        JOIN pagos p ON a.id_alumno = p.id_alumno
) AS subquery
JOIN alumnos a ON subquery.id_alumno = a.id_alumno
WHERE subquery.rn = 1;

-- Mostrar datos de la vista
SELECT * FROM Vista_Alumnos_Ultimo_Pago;



-- Crear vista que muestre las máquinas activas en el gimnasio
CREATE VIEW Vista_Maquinas_Activas AS
SELECT
    `id_maquina`,
    `nombre`,
    `fecha_ingreso`
FROM
    `InventarioMaquinas`
WHERE
    `fecha_egreso` IS NULL; -- Solo muestra las máquinas sin fecha de egreso

-- Mostrar datos de la vista
SELECT * FROM Vista_Maquinas_Activas;

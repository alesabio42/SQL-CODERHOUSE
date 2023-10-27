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
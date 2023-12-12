-- CONUSLTAS QUE SE PUEDEN HACER EN LA BASE DE DATOS 

-- ----------------------------------------TABLA ALUMNOS----------------------------------------
-- 1. Lista de Alumnos Activos
SELECT id_alumno, apellido, nombre
FROM alumnos
WHERE estado = 'A';

-- 2. Detalles de un Alumno Específico
SELECT *
FROM alumnos
WHERE id_alumno = [ID_DEL_ALUMNO];

-- 3. Alumnos por Clase
SELECT clase, COUNT(*) as cantidad_alumnos
FROM alumnos
GROUP BY clase;

-- 4. Edad Promedio de los Alumnos
SELECT AVG(YEAR(CURDATE()) - YEAR(fecha_nacimiento)) as edad_promedio
FROM alumnos;

-- 5. Alumnos por Género
SELECT sexo, COUNT(*) as cantidad_alumnos
FROM alumnos
GROUP BY sexo;

-- 6. Alumnos por Estado Civil
SELECT estado_civil, COUNT(*) as cantidad_alumnos
FROM alumnos
WHERE estado_civil IS NOT NULL
GROUP BY estado_civil;

-- 7. Última Modificación de Alumnos
SELECT id_alumno, apellido, nombre, fecha_modificacion
FROM alumnos
ORDER BY fecha_modificacion DESC
LIMIT 1;


-- --------------------------------------TABLA ASISTENCIAS----------------------------------------
-- 1: Obtener todas las asistencias registradas
SELECT * FROM Asistencias;

-- 2: Contar el número total de asistencias
SELECT COUNT(*) AS total_asistencias FROM Asistencias;

-- 3: Obtener la lista de asistencias de un alumno específico
SELECT * FROM Asistencias WHERE id_alumno = {id_alumno};

-- 4: Obtener la lista de asistencias para un curso específico
SELECT * FROM Asistencias WHERE id_curso = {id_curso};

-- 5: Calcular la cantidad de asistencias por curso
SELECT id_curso, COUNT(*) AS cantidad_asistencias FROM Asistencias GROUP BY id_curso;

-- 6: Buscar asistencias en una fecha específica
SELECT * FROM Asistencias WHERE fecha = '2023-12-31';

-- 7: Obtener la última asistencia registrada para cada alumno
SELECT id_alumno, MAX(fecha) AS ultima_asistencia FROM Asistencias GROUP BY id_alumno;


-- --------------------------------------TABLA CURSOS----------------------------------------
-- 1: Obtener todos los cursos
SELECT * FROM curso;

-- 2: Contar el número total de cursos
SELECT COUNT(*) AS total_cursos FROM curso;

-- 3: Obtener detalles de un curso específico por su ID
SELECT * FROM curso WHERE id_curso = {id_curso};

-- 4: Buscar cursos por nombre
SELECT * FROM curso WHERE nombre LIKE '%{nombre}%';

-- 5: Obtener el ID del curso con un nombre específico
SELECT id_curso FROM curso WHERE nombre = '{nombre_curso}';

-- 6: Actualizar el nombre de un curso por su ID
UPDATE curso SET nombre = '{nuevo_nombre}' WHERE id_curso = {id_curso};

-- 7: Eliminar un curso por su ID
DELETE FROM curso WHERE id_curso = {id_curso};


-- --------------------------------------TABLA ENTRENADORES----------------------------------------
-- 1: Obtener todos los entrenadores
SELECT * FROM Entrenadores;

-- 2: Contar el número total de entrenadores
SELECT COUNT(*) AS total_entrenadores FROM Entrenadores;

-- 3: Obtener detalles de un entrenador específico por su ID
SELECT * FROM Entrenadores WHERE id_entrenador = {id_entrenador};

-- 4: Buscar entrenadores por nombre
SELECT * FROM Entrenadores WHERE nombre LIKE '%{nombre}%';

-- 5: Obtener el ID del entrenador con un nombre específico
SELECT id_entrenador FROM Entrenadores WHERE nombre = '{nombre_entrenador}';

-- 6: Actualizar el nombre o especialidad de un entrenador por su ID
UPDATE Entrenadores SET nombre = '{nuevo_nombre}', especialidad = '{nueva_especialidad}' WHERE id_entrenador = {id_entrenador};

-- 7: Eliminar un entrenador por su ID
DELETE FROM Entrenadores WHERE id_entrenador = {id_entrenador};


-- --------------------------------------TABLA DE INVENTARIO DE MAQUINAS----------------------------------------
-- 1: Obtener todas las máquinas en el inventario
SELECT * FROM InventarioMaquinas;

-- 2: Contar el número total de máquinas en el inventario
SELECT COUNT(*) AS total_maquinas FROM InventarioMaquinas;

-- 3: Obtener detalles de una máquina específica por su ID
SELECT * FROM InventarioMaquinas WHERE id_maquina = {id_maquina};

-- 4: Buscar máquinas por nombre
SELECT * FROM InventarioMaquinas WHERE nombre LIKE '%{nombre_maquina}%';

-- 5: Obtener máquinas con fecha de egreso nula (activas)
SELECT * FROM InventarioMaquinas WHERE fecha_egreso IS NULL;

-- 6: Actualizar el nombre, fecha de ingreso o fecha de egreso de una máquina por su ID
UPDATE InventarioMaquinas SET nombre = '{nuevo_nombre}', fecha_ingreso = '{nueva_fecha_ingreso}', fecha_egreso = '{nueva_fecha_egreso}' WHERE id_maquina = {id_maquina};

-- 7: Eliminar una máquina por su ID
DELETE FROM InventarioMaquinas WHERE id_maquina = {id_maquina};


-- --------------------------------------TABLA DE MATERIALES----------------------------------------
-- 1: Obtener todos los materiales
SELECT * FROM Materiales;

-- 2: Contar el número total de materiales
SELECT COUNT(*) AS total_materiales FROM Materiales;

-- 3: Obtener detalles de un material específico por su ID
SELECT * FROM Materiales WHERE id = {id_material};

-- 4: Buscar materiales por concepto
SELECT * FROM Materiales WHERE concepto LIKE '%{texto_a_buscar}%';

-- 5: Obtener materiales ordenados por concepto de forma ascendente
SELECT * FROM Materiales ORDER BY concepto ASC;

-- 6: Obtener materiales ordenados por concepto de forma descendente
SELECT * FROM Materiales ORDER BY concepto DESC;

-- 7: Actualizar la definición de un material específico por su ID
UPDATE Materiales SET definicion = '{nueva_definicion}' WHERE id = {id_material};

-- 8: Eliminar un material específico por su ID
DELETE FROM Materiales WHERE id = {id_material};


-- --------------------------------------TABLA DE MOVIMIENTOS----------------------------------------
-- 1: Consultar todos los movimientos
SELECT * FROM Movimientos;

-- 2: Consultar movimientos que contienen un concepto específico
SELECT * FROM Movimientos WHERE concepto = 'ConceptoEspecifico';

-- 3: Consultar movimientos que tienen una definición que contiene cierto texto
SELECT * FROM Movimientos WHERE definicion LIKE '%TextoBuscado%';

-- 4: Actualizar la definición de un movimiento específico
UPDATE Movimientos SET definicion = 'NuevaDefinicion' WHERE id = 1;

-- 5: Eliminar un movimiento por su ID
DELETE FROM Movimientos WHERE id = 1;

-- 6: Contar la cantidad total de movimientos
SELECT COUNT(*) AS total_movimientos FROM Movimientos;


----------------------------------------TABLA DE PAGOS----------------------------------------
-- 1: Consultar todos los pagos
SELECT * FROM Pagos;

-- 2: Consultar pagos de un alumno específico
SELECT * FROM Pagos WHERE id_alumno = 1;

-- 3: Consultar pagos realizados en una fecha específica
SELECT * FROM Pagos WHERE fecha = '2023-01-01';

-- 4: Calcular el total de pagos realizados
SELECT SUM(monto) AS total_pagos FROM Pagos;

-- 5: Actualizar el monto de un pago específico
UPDATE Pagos SET monto = 50.00 WHERE id_pago = 1;

-- 6: Eliminar un pago por su ID
DELETE FROM Pagos WHERE id_pago = 1;

----------------------------------------TABLA DE REGISTRO DE CONSULTAS----------------------------------------

-- 1: Consultar todos los registros de consultas
SELECT * FROM registros_de_consultas;

-- 2: Consultar registros de consultas por nombre
SELECT * FROM registros_de_consultas WHERE nombre = 'Nombre';

-- 3: Consultar registros de consultas por correo
SELECT * FROM registros_de_consultas WHERE correo = 'correo@example.com';

-- 4: Consultar registros de consultas por fecha de registro
SELECT * FROM registros_de_consultas WHERE fecha_registro BETWEEN '2023-01-01' AND '2023-01-31';

-- 5: Insertar un nuevo registro de consulta
INSERT INTO registros_de_consultas (nombre, correo, asunto, mensaje) 
VALUES ('Nuevo Usuario', 'nuevo@usuario.com', 'Consulta de Prueba', 'Mensaje de prueba.');

-- 6: Actualizar el mensaje de una consulta específica
UPDATE registros_de_consultas SET mensaje = 'Nuevo mensaje de prueba.' WHERE id = 1;

-- 7: Eliminar una consulta por su ID
DELETE FROM registros_de_consultas WHERE id = 1;


----------------------------------------TABLA DE REGISTRO DE IMC----------------------------------------
-- 1: Consultar todos los registros de IMC
SELECT * FROM registros_de_imc;

-- 2: Consultar registros de IMC por usuario
SELECT * FROM registros_de_imc WHERE usuario_id = 1;

-- 3: Consultar registros de IMC por fecha
SELECT * FROM registros_de_imc WHERE fecha BETWEEN '2023-01-01' AND '2023-01-31';

-- 4: Insertar un nuevo registro de IMC
INSERT INTO registros_de_imc (usuario_id, imc, fecha) VALUES (1, 25.0, '2023-01-15');

-- 5: Actualizar el IMC de un registro específico
UPDATE registros_de_imc SET imc = 26.5 WHERE id = 1;

-- 6: Eliminar un registro de IMC por su ID
DELETE FROM registros_de_imc WHERE id = 1;


---------------------------------------TABLA DE REGISTRO DE PESO----------------------------------------
-- 1: Consultar todos los registros de peso
SELECT * FROM registros_de_peso;

-- 2: Consultar registros de peso por usuario
SELECT * FROM registros_de_peso WHERE usuario_id = 1;

-- 3: Consultar registros de peso por fecha
SELECT * FROM registros_de_peso WHERE fecha BETWEEN '2023-01-01' AND '2023-01-31';

-- 4: Insertar un nuevo registro de peso
INSERT INTO registros_de_peso (usuario_id, peso, fecha) VALUES (1, 70.0, '2023-01-15');

-- 5: Actualizar el peso de un registro específico
UPDATE registros_de_peso SET peso = 75.5 WHERE id = 1;

-- 6: Eliminar un registro de peso por su ID
DELETE FROM registros_de_peso WHERE id = 1;

---------------------------------------TABLA DE REGISTRO DE RM----------------------------------------
-- 1: Consultar todos los registros de RM (Resonancia Magnética)
SELECT * FROM registros_de_rm;

-- 2: Consultar registros de RM por usuario
SELECT * FROM registros_de_rm WHERE usuario_id = 1;

-- 3: Consultar registros de RM por fecha
SELECT * FROM registros_de_rm WHERE fecha BETWEEN '2023-01-01' AND '2023-01-31';

-- 4: Insertar un nuevo registro de RM
INSERT INTO registros_de_rm (usuario_id, concepto, RM, fecha) VALUES (1, 'Cabeza', 'Resultado de la RM', '2023-01-15');

-- 5: Actualizar el resultado de RM de un registro específico
UPDATE registros_de_rm SET RM = 'Nuevo resultado' WHERE id = 1;

-- 6: Eliminar un registro de RM por su ID
DELETE FROM registros_de_rm WHERE id = 1;


---------------------------------------TABLA DE REGISTRO DE RUTINAS----------------------------------------
-- 1: Consultar todas las rutinas
SELECT * FROM Rutinas;

-- 2: Consultar una rutina por su ID
SELECT * FROM Rutinas WHERE id_rutina = 1;

-- 3: Consultar rutinas creadas después de una fecha específica
SELECT * FROM Rutinas WHERE fecha_creacion > '2023-01-01';

-- 4: Insertar una nueva rutina
INSERT INTO Rutinas (nombre, descripcion, fecha_creacion) VALUES ('Rutina de Cardio', 'Ejercicios aeróbicos para mejorar la resistencia', NOW());

-- 5: Actualizar la descripción de una rutina
UPDATE Rutinas SET descripcion = 'Nueva descripción' WHERE id_rutina = 1;

-- 6: Eliminar una rutina por su ID
DELETE FROM Rutinas WHERE id_rutina = 1;


---------------------------------------TABLA DE REGISTRO DE TERMINOS BASICOS----------------------------------------
-- 1. Consultar todos los términos básicos
SELECT * FROM TerminosBasicos;

-- 2. Consultar un término básico por su ID
SELECT * FROM TerminosBasicos WHERE id = 1;

-- 3. Consultar términos básicos cuya definición contenga una palabra específica
SELECT * FROM TerminosBasicos WHERE definicion LIKE '%palabra%';

-- 4. Insertar un nuevo término básico
INSERT INTO TerminosBasicos (concepto, definicion) VALUES ('Nuevo Concepto', 'Nueva Definición');

-- 5. Actualizar la definición de un término básico
UPDATE TerminosBasicos SET definicion = 'Nueva Definición' WHERE id = 1;

-- 6. Eliminar un término básico por su ID
DELETE FROM TerminosBasicos WHERE id = 1;


---------------------------------------TABLA DE REGISTRO DE USUARIOS----------------------------------------
-- 1. Consultar todos los usuarios
SELECT * FROM usuarios;

-- 2. Consultar un usuario por su ID
SELECT * FROM usuarios WHERE id = 1;

-- 3. Consultar usuarios cuyo estado sea 'A' (activo)
SELECT * FROM usuarios WHERE estado = 'A';

-- 4. Consultar usuarios cuyo nombre de usuario o correo electrónico contenga una palabra específica
SELECT * FROM usuarios WHERE username LIKE '%palabra%' OR email LIKE '%palabra%';

-- 5. Insertar un nuevo usuario
INSERT INTO usuarios (username, password, email, apellido_nombre, estado, fecha_creacion) 
VALUES ('NuevoUsuario', 'Contraseña123', 'nuevo@email.com', 'Apellido Nombre', 'A', NOW());

-- 6. Actualizar la contraseña de un usuario
UPDATE usuarios SET password = 'NuevaContraseña' WHERE id = 1;

-- 7. Desactivar un usuario por su ID (cambiar estado a 'B')
UPDATE usuarios SET estado = 'B' WHERE id = 1;

-- 8. Eliminar un usuario por su ID
DELETE FROM usuarios WHERE id = 1;

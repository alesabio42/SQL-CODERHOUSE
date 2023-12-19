-- PASO 1 - CREACIÓN DE USUARIO PARA SOLO LECTURA
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'coderhouse';
-- PASO 2 - Asignar permisos de solo lectura a todas las tablas de la base de datos
GRANT SELECT ON *.* TO 'usuario_lectura'@'localhost';

-- PASO 3 - CREACIÓN DE USUARIO PARA LECTURA, INSERCION Y MODIFICACIÓN
CREATE USER 'usuario_modificacion'@'localhost' IDENTIFIED BY 'coderhouse';
-- PASO 4 - Asignar permisos de lectura, inserción y modificación a todas las tablas de la base de datos
GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuario_modificacion'@'localhost';

-- PASO 6 - No permitir la eliminación de registros para ambos usuarios
REVOKE DELETE ON *.* FROM 'usuario_lectura'@'localhost';
REVOKE DELETE ON *.* FROM 'usuario_modificacion'@'localhost';

-- PASO 7 - Asegurar que los cambios tengan efecto
FLUSH PRIVILEGES;

-- PASO 8 - VERIFICACIÓN
SELECT * FROM mysql.user WHERE User = 'usuario_lectura';
SELECT * FROM mysql.user WHERE User = 'usuario_modificacion';

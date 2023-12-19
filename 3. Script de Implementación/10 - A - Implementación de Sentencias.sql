-- CREACIÓN DE USUARIO PARA SOLO LECTURA
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'coderhouse';
-- Asignar permisos de solo lectura a todas las tablas de la base de datos
GRANT SELECT ON *.* TO 'usuario_lectura'@'localhost';

-- CREACIÓN DE USUARIO PARA LECTURA, INSERCION Y MODIFICACIÓN
CREATE USER 'usuario_modificacion'@'localhost' IDENTIFIED BY 'coderhouse';
-- Asignar permisos de lectura, inserción y modificación a todas las tablas de la base de datos
GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuario_modificacion'@'localhost';

-- No permitir la eliminación de registros para ambos usuarios
REVOKE DELETE ON *.* FROM 'usuario_lectura'@'localhost';
REVOKE DELETE ON *.* FROM 'usuario_modificacion'@'localhost';

-- Asegurar que los cambios tengan efecto
FLUSH PRIVILEGES;

-- VERIFICACIÓN
SELECT * FROM mysql.user WHERE User = 'usuario_lectura';
SELECT * FROM mysql.user WHERE User = 'usuario_modificacion';

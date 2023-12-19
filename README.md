# Proyecto Gimnasio - Base de Datos

En el marco de mi proyecto final para el curso de SQL en Coderhouse, he creado una base de datos diseñada específicamente para la gestión integral de un gimnasio. Esta iniciativa representa un paso crucial hacia la optimización de la administración y el control preciso de diversas áreas de este negocio.

## Descripción del Proyecto

El objetivo principal de esta base de datos es proporcionar una herramienta eficiente para gestionar y organizar la información clave de un gimnasio. A través de un diseño meticuloso, he desarrollado varias tablas, cada una enfocada en satisfacer necesidades específicas y contribuir al seguimiento detallado de información crítica.

## Tablas Principales

1. **Alumnos**
2. **Asistencias**
3. **Cursos**
4. **Entrenadores**
5. **InventarioMaquinas**
6. **Materiales**
7. **Movimientos**
8. **Pagos**
9. **Registros de Consultas**
10. **Registros de IMC**
11. **Registros de Peso**
12. **Registros de RM**
13. **Rutinas**
14. **TerminosBasicos**
15. **Usuarios**

## Estructura del Repositorio
El repositorio de GitHub para el Proyecto Coder se compone de 3 carpetas:
1. **Documentacion Tecnica:** Contiene informacion tecnica adicional sobre el proyecto.
2. **Documentacion de Usuarios:** Proporciona la documentacion del proyecto destinada a los usuarios.
3. **Script de Implementacion:** Contiene scripts necesarios para instalar la base de datos.

### Estructura del Repositorio
- **`ProyectoCoder.sql`:** Contiene el script SQL para la creación de las tablas en la base de datos y la inserción de datos.

- **`7 - B - Script de creación de vistas.sql`:** Contiene la creación de vistas en la base de datos, las cuales son las siguientes: 
1. **AlumnosActivos**
2. **Consultas**
3. **Material**
4. **Movimiento**
5. **Terminos**
6. **VistaAlumnosUltimoPago**
7. **VistaMaquinasActivas**

- **`8 - A - Script de creación de stored procedures.sql`:** Contiene la creación de stored procedures en la base de datos, los cuales son los siguientes: 
1. **BuscarRegistrosPesoPorDNI**
2. **BuscarRegistrosPesoPorDNIConOrden**
3. **GestionarInsercionMovimientos**
4. **GestionarTransaccion**
5. **InsertarRegistroPesoPorDNI**

- **`8 - B - Script de creación de Funciones.sql`:** Contiene funciones SQL específicas para el proyecto, las cuales son: 
1. **CountMovimientos**
2. **ObtenerUltimoPesoPorDNI**

- **`9 - Script de creación de triggers.sql`:** Script que implementa triggers para registrar insercion y cambios de datos en ciertas tablas.

- **`10 - A - Implementación de Sentencias.sql`:** Script con el cual se crean dos usuarios: uno con permiso de sólo lectura y el otro permisos de Lectura, Inserción y Modificación de datos.

- **`10 - B - Sentencias del sublenguaje TCL.sql`:** Script con el cual se realizan modificaciones en ciertas tablas utilizando transacciones.

- **`11 - A - Backup de la base de datos.sql`:** Script con el backup de la base de datos del proyecto, incluyendo en éste solamente las tablas.


## Pre-entregas del Proyecto Final

Para acceder a las Pre-Entregas del Proyecto Final, las cuales cuentan con información detallada sobre el diseño de la base de datos y su implementación, consulte la documentación adjunta en los siguientes archivos PDF:

1. **[Pre-Entrega 1](https://docs.google.com/document/d/1msX8u_Xc83Zj-JVa2dURqtcH3dKcBjHX/edit?usp=sharing&ouid=113864567810544868681&rtpof=true&sd=true)**
2. **[Pre-Entrega 2](https://docs.google.com/document/d/16YlD9URnvxOpOLftrEv61Av6-UKGgP3aC1ugYcx2j0c/edit?usp=sharing)**
3. **[Proyecto Final](https://docs.google.com/document/d/1w8o1piL9l9cTHegAIKH_GGjERrHknMQ7cjMpNpO077U/edit?usp=sharing)** 


¡Gracias por explorar mi proyecto! 

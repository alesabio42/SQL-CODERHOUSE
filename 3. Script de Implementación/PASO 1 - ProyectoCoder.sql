CREATE DATABASE  IF NOT EXISTS `proyecto-coder` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto-coder`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto-coder
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('M','F','I') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dni` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` enum('A','B') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `estado_civil` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `clase` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'MARTINEZ','ALEJANDRO','1991-08-02','M','76567876','A','2022-10-05 18:55:00','2023-03-08 00:13:09','SOLTERO','2 PM'),(3,'GUSTAVO','GERMAN','2001-11-13','M','43712371','A','2022-10-05 00:00:00','2023-03-08 01:42:36','SOLTERO','9 AM'),(4,'MULLER','TOMAS','1981-11-09','M','29953469','A','2022-10-05 00:00:00','2023-03-05 20:03:36','SOLTERO','10 AM'),(5,'MESSI','TOMAS','1993-11-26','M','37590532','A','2022-10-05 18:55:00','2023-03-05 20:04:13','CASADO','2 PM'),(6,'DEL HUERTO','SOPHIA','1985-02-20','M','12332144','A','2022-10-31 19:16:27','2023-03-05 20:04:43','CASADO','3 PM'),(9,'DEL PRADO','JOSE','1987-02-20','M','12332123','A','2022-10-31 19:31:46','2023-03-05 20:05:50','CASADO','11 AM'),(10,'SABIO','ALEJANDRO','1999-08-26','M','543342425','A','2023-02-24 22:16:52','2023-03-05 20:02:10','SOLTERO','10 AM'),(11,'SOSA','ALEJANDRO','1999-06-16','M','4202324','A','2023-02-27 19:34:41','2023-03-05 20:06:10','SOLTERO','9 AM'),(12,'ROBERTO','ALEJADNRO','2015-08-18','M','46372834','A','2023-02-27 19:52:53','2023-03-05 20:06:19','CASADO','8 AM'),(13,'DE PAUL','RODRIGO','2007-03-08','M','3454323','A','2023-02-28 23:05:58',NULL,'SOLTERO','9 AM'),(14,'DE LA FUENTE','IVAN','2006-02-09','M','35434553','A','2023-02-28 23:07:42','2023-02-28 23:07:55','SOLTERO','9 AM'),(15,'FODEN','JACK','2004-01-28','M','34543234','A','2023-03-04 11:26:55',NULL,'SOLTERO','9 AM'),(18,'GERMAN','BEZUS','2005-02-17','M','45665432','A','2023-03-05 13:34:33',NULL,'SOLTERO','10 AM'),(19,'RIQUELME','NACHO','1996-06-12','M','43543213','A','2023-03-07 22:49:34',NULL,'','3 PM'),(20,'GONZALEZ','MARIANO','1990-05-15','M','98765432','A','2023-11-09 20:30:58',NULL,'SOLTERO','1 PM'),(22,'GONZALEZ','MARIANO','1990-05-15','M','4534535','A','2023-12-08 19:28:20',NULL,'SOLTERO','1 PM');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `id_curso` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` VALUES (1,1,15,'2023-01-05'),(2,3,16,'2023-01-06'),(3,1,17,'2023-01-07'),(4,3,18,'2023-01-08'),(5,4,19,'2023-01-09'),(6,5,20,'2023-01-10'),(7,1,15,'2023-12-01'),(8,3,16,'2023-12-02'),(9,4,17,'2023-12-03'),(10,5,18,'2023-12-04'),(11,1,19,'2023-12-05'),(12,3,20,'2023-12-06'),(13,4,15,'2023-12-07'),(14,5,16,'2023-12-08'),(15,1,17,'2023-12-09'),(16,3,18,'2023-12-10'),(17,4,19,'2023-12-01'),(18,5,20,'2023-12-02'),(19,1,15,'2023-12-03'),(20,3,16,'2023-12-04'),(21,4,17,'2023-12-05'),(22,5,18,'2023-12-06'),(23,1,19,'2023-12-07'),(24,3,20,'2023-12-08'),(25,4,15,'2023-12-09'),(26,5,16,'2023-12-10');
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (15,'8 AM'),(16,'9 AM'),(17,'10 AM'),(18,'11 AM'),(19,'2 PM'),(20,'3 PM'),(21,'4 PM'),(22,'5 PM'),(23,'6 PM'),(24,'7 PM'),(25,'8 PM'),(26,'9 PM');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores` (
  `id_entrenador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_entrenador`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (1,'Alex González','Fuerza y acondicionamiento'),(2,'Emily Rodriguez','Cardio y resistencia'),(3,'Carlos Martínez','Yoga y flexibilidad');
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventariomaquinas`
--

DROP TABLE IF EXISTS `inventariomaquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventariomaquinas` (
  `id_maquina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  PRIMARY KEY (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventariomaquinas`
--

LOCK TABLES `inventariomaquinas` WRITE;
/*!40000 ALTER TABLE `inventariomaquinas` DISABLE KEYS */;
INSERT INTO `inventariomaquinas` VALUES (1,'Máquina de pesas','2023-01-01',NULL),(2,'Cinta de correr','2023-02-15','2023-05-10'),(3,'Bicicleta estática','2023-03-10',NULL),(4,'Banco Plano','2023-12-01',NULL),(5,'Banco Inclinado','2023-12-02',NULL),(6,'Mancuera 10kg','2023-12-03',NULL),(7,'Mancuerna 12kg','2023-12-04',NULL),(8,'Mancuerna 14kg','2023-12-05',NULL),(9,'Mancuerna 16kg','2023-12-06',NULL),(10,'Mancuerna 20kg','2023-12-07',NULL),(11,'Mancuerna 22kg','2023-12-08',NULL),(12,'Polea 1','2023-12-09',NULL),(13,'Polea 2','2023-12-10',NULL),(14,'Rack 1','2023-12-01',NULL),(15,'Rack 2','2023-12-02',NULL),(16,'Rack 3','2023-12-03',NULL),(17,'Colchoneta 1','2023-12-04',NULL),(18,'Colchoneta 2','2023-12-05',NULL),(19,'Colchoneta 3','2023-12-06',NULL);
/*!40000 ALTER TABLE `inventariomaquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `definicion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (4,'Bikerg','Bicicleta estática.'),(5,'DB','Dumbbell - Mancuerna.'),(6,'KB','Kettlebell - Pesa rusa.'),(7,'Ring','Anillas utilizadas para realizar movimientos gimnásticos.'),(8,'Rack','Estructura metálica para hacer los diferentes ejercicios de gimnasia: dominadas, T2B, etc.'),(9,'Row','Remo.'),(10,'Skierg','Esquiadora.');
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `definicion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'Arch Rock','Nueva definición'),(2,'BS','Back Squat - Sentadilla trasera con peso detrás de la nuca.'),(3,'BP','Bench Press - Press de banca.'),(4,'Box Jump','Salto al cajón.'),(5,'BRP','Burpee.'),(6,'CLN','Clean - Cargada. Consiste en llevar una carga desde el suelo hasta los hombros. Versiones adicionales incluyen: Hang Clean (HC)(Clean desde rodillas), Power Clean (PC), y Squat Clean (SC).'),(7,'C&J','Clean and Jerk - Cargada y envión. La unión de realizar un clean y seguidamente un Jerk.'),(8,'CTB / C2B','Chest to Bar - Pecho a la barra. Dominadas en las que debes tocar el rack con el pecho.'),(9,'DL','Deadlift - Peso muerto. Levanta un peso del suelo hasta la extensión completa de cadera.'),(10,'DU’s','Double Unders - Dos vueltas de la soga en un salto.'),(11,'FS','Front Squat - Sentadilla Frontal con el peso por delante.'),(12,'Hang','Colgado. En movimientos halterofilia, se utiliza cuando el movimiento (clean o snatch) comienza desde la rodilla o por encima de ella.'),(13,'Hollow','Ejercicio funcional que consiste en estar tumbados boca arriba, con piernas y brazos extendidos (brazos hacia atrás y a los lados de la cabeza) y levantados del suelo contrayendo zona abdominal.'),(14,'Hollow Rock','Balanceo en posición de hollow.'),(15,'HSPU','Hand Stand Push-Up - Pino flexión ó Parada de manos con flexión.'),(16,'K2E','Knees to Elbows - Consiste en estar colgados en la barra y llevar las rodillas a los codos.'),(17,'MU','Muscle Up - Movimientos combinados que encadenan un balanceo con un fondo de Tríceps (puede ser en anillas o en barra).'),(18,'OHS','Over Head Squat - Sentadilla con peso por encima de la cabeza.'),(19,'Pistol','Sentadilla a una pierna.'),(20,'PP','Push Press - Press de hombros con empuje. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza con un impulso con las piernas para empujarla hacia arriba. El movimiento termina con fuerza estricta de hombros.'),(21,'PJ','Push Jerk - Press con Envión. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza con un impulso con las piernas para empujarla hacia arriba y además, una ligera flexión de piernas al final del movimiento para recibir la barra desde más abajo para ayudarnos un poco más a levantarla.'),(22,'PU','Pull Up or Push Up - Dominadas o flexiones.'),(23,'Ring dips','fondos de tríceps en anillas'),(24,'Rope climb','escalar la cuerda con o sin ayuda de las piernas (Es el momento en el que todos nos sentimos bomberos).'),(25,'SDL','Sumo Deadlift - Peso Muerto en con las piernas en posición de sumo.'),(26,'SDHP','Sumo Deadlift High Pull - Consiste en realizar un peso muerto en posición de sumo, y luego de que la barra llegue a la cadera, realizar un empuje y tirar con los brazos la barra hasta la altura de la barbilla.'),(27,'SP','Shoulder Press - Press de hombros estrictos. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza únicamente con la fuerza estricta de tus hombros.'),(28,'SN','Snatch - Arrancada: Consiste en levantar la barra del suelo hasta arriba de la cabeza en un solo tiempo. Versiones adicionales incluyen, Hang Snatch (HS), Power Snatch (PS), y Squat Snatch (SS).'),(29,'Split Jerk','Envión. La técnica es similar al Push Jerk, con la diferencia que al momento de flexionar las piernas para terminar el movimiento, las piernas se mueven una hacia delante, y otra hacia atrás.'),(30,'SQ','Squat - Sentadilla.'),(31,'S-ups','Sit ups.'),(32,'SU’s','Single Unders - Una vuelta a la soga en un salto.'),(33,'Superman','Ejercicio funcional que consiste en estar tumbados boca abajo, con piernas y brazos extendidos y elevados lo más que se pueda para que no toquen suelo ni cuádriceps ni brazos.'),(34,'T2B','Toes to Bar - Consiste en estar colgados en la barra y toca la barra con los pies.'),(35,'V-ups','Abdominales en V.'),(36,'WBS','Wall Ball Shot - Lanzamiento de bola a la pared.'),(37,'Arch Rock','Balanceo en posición de superman.'),(38,'BS','Back Squat - Sentadilla trasera con peso detrás de la nuca.'),(39,'BP','Bench Press - Press de banca.'),(40,'Box Jump','Salto al cajón.'),(41,'BRP','Burpee.'),(42,'CLN','Clean - Cargada. Consiste en llevar una carga desde el suelo hasta los hombros. Versiones adicionales incluyen: Hang Clean (HC)(Clean desde rodillas), Power Clean (PC), y Squat Clean (SC).'),(43,'C&J','Clean and Jerk - Cargada y envión. La unión de realizar un clean y seguidamente un Jerk.'),(44,'CTB / C2B','Chest to Bar - Pecho a la barra. Dominadas en las que debes tocar el rack con el pecho.'),(45,'DL','Deadlift - Peso muerto. Levanta un peso del suelo hasta la extensión completa de cadera.'),(46,'DU’s','Double Unders - Dos vueltas de la soga en un salto.'),(47,'FS','Front Squat - Sentadilla Frontal con el peso por delante.'),(48,'Hang','Colgado. En movimientos halterofilia, se utiliza cuando el movimiento (clean o snatch) comienza desde la rodilla o por encima de ella.'),(49,'Hollow','Ejercicio funcional que consiste en estar tumbados boca arriba, con piernas y brazos extendidos (brazos hacia atrás y a los lados de la cabeza) y levantados del suelo contrayendo zona abdominal.'),(50,'Hollow Rock','Balanceo en posición de hollow.'),(51,'HSPU','Hand Stand Push-Up - Pino flexión ó Parada de manos con flexión.'),(52,'K2E','Knees to Elbows - Consiste en estar colgados en la barra y llevar las rodillas a los codos.'),(53,'MU','Muscle Up - Movimientos combinados que encadenan un balanceo con un fondo de Tríceps (puede ser en anillas o en barra).'),(54,'OHS','Over Head Squat - Sentadilla con peso por encima de la cabeza.'),(55,'Pistol','Sentadilla a una pierna.'),(56,'PP','Push Press - Press de hombros con empuje. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza con un impulso con las piernas para empujarla hacia arriba. El movimiento termina con fuerza estricta de hombros.'),(57,'PJ','Push Jerk - Press con Envión. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza con un impulso con las piernas para empujarla hacia arriba y además, una ligera flexión de piernas al final del movimiento para recibir la barra desde más abajo para ayudarnos un poco más a levantarla.'),(58,'PU','Pull Up or Push Up - Dominadas o flexiones.'),(59,'Ring dips','fondos de tríceps en anillas'),(60,'Rope climb','escalar la cuerda con o sin ayuda de las piernas (Es el momento en el que todos nos sentimos bomberos).'),(61,'SDL','Sumo Deadlift - Peso Muerto en con las piernas en posición de sumo.'),(62,'SDHP','Sumo Deadlift High Pull - Consiste en realizar un peso muerto en posición de sumo, y luego de que la barra llegue a la cadera, realizar un empuje y tirar con los brazos la barra hasta la altura de la barbilla.'),(63,'SP','Shoulder Press - Press de hombros estrictos. Consiste en llevar la barra desde tus hombros hasta arriba de tu cabeza únicamente con la fuerza estricta de tus hombros.'),(64,'SN','Snatch - Arrancada: Consiste en levantar la barra del suelo hasta arriba de la cabeza en un solo tiempo. Versiones adicionales incluyen, Hang Snatch (HS), Power Snatch (PS), y Squat Snatch (SS).'),(65,'Split Jerk','Envión. La técnica es similar al Push Jerk, con la diferencia que al momento de flexionar las piernas para terminar el movimiento, las piernas se mueven una hacia delante, y otra hacia atrás.'),(66,'SQ','Squat - Sentadilla.'),(67,'S-ups','Sit ups.'),(68,'SU’s','Single Unders - Una vuelta a la soga en un salto.'),(69,'Superman','Ejercicio funcional que consiste en estar tumbados boca abajo, con piernas y brazos extendidos y elevados lo más que se pueda para que no toquen suelo ni cuádriceps ni brazos.'),(70,'T2B','Toes to Bar - Consiste en estar colgados en la barra y toca la barra con los pies.'),(71,'V-ups','Abdominales en V.'),(72,'WBS','Wall Ball Shot - Lanzamiento de bola a la pared.');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,1000.00,'2023-01-05'),(2,3,1000.00,'2023-01-05'),(3,3,1000.00,'2023-11-11'),(4,1,1000.00,'2023-11-11');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_de_consultas`
--

DROP TABLE IF EXISTS `registros_de_consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_de_consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_de_consultas`
--

LOCK TABLES `registros_de_consultas` WRITE;
/*!40000 ALTER TABLE `registros_de_consultas` DISABLE KEYS */;
INSERT INTO `registros_de_consultas` VALUES (1,'alejandro','alejandrosabio@gmail.com','HORARIOS','Quisiera saber en que horarios atiende el gimnasio?','2023-12-08 01:29:11'),(3,'Juan Pérez','juan@gmail.com','Consulta sobre horarios','Hola, me gustaría obtener más información sobre que horarios dan musculacion.','2023-12-01 11:30:00'),(4,'María Rodríguez','maria@gmail.com','Problema con la factura','He tenido un problema con la factura de mi último pago. ¿Podrían ayudarme a resolverlo?','2023-12-02 13:15:00'),(5,'Carlos Sánchez','carlos@gmail.com','Solicitud de precio','Quisiera saber cuanto es la cuota para musculacion','2023-12-03 15:45:00'),(6,'Alejandro Martínez','alejandro@gmail.com','Consulta técnica','Necesito ayuda con un problema, no estoy podiendo ingresar con mi usuario','2023-12-05 19:10:00'),(7,'Ana López','ana@gmail.com','Información de entrenamientos','Estoy interesada en conocer más detalles sobre que entrenamientos tienen. ¿Pueden proporcionarme información?','2023-12-06 21:00:00'),(8,'Sofía Ruiz','sofia@gmail.com','Agradecimiento','Quería expresar mi agradecimiento por el excelente servicio que me brindaron. ¡Muchas gracias!','2023-12-10 14:05:00');
/*!40000 ALTER TABLE `registros_de_consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_de_imc`
--

DROP TABLE IF EXISTS `registros_de_imc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_de_imc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `imc` decimal(4,1) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registros_de_imc_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_de_imc`
--

LOCK TABLES `registros_de_imc` WRITE;
/*!40000 ALTER TABLE `registros_de_imc` DISABLE KEYS */;
INSERT INTO `registros_de_imc` VALUES (11,11,27.0,'2023-02-02'),(12,11,31.0,'2023-03-06'),(14,11,25.5,'2023-03-08'),(15,11,25.5,'2023-03-08'),(16,11,24.5,'2023-12-01'),(17,11,24.0,'2023-12-03'),(18,11,23.5,'2023-12-05'),(19,11,23.0,'2023-12-07'),(20,11,22.5,'2023-12-09'),(21,11,22.0,'2023-12-10');
/*!40000 ALTER TABLE `registros_de_imc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_de_peso`
--

DROP TABLE IF EXISTS `registros_de_peso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_de_peso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `peso` decimal(4,1) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registros_de_peso_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_de_peso`
--

LOCK TABLES `registros_de_peso` WRITE;
/*!40000 ALTER TABLE `registros_de_peso` DISABLE KEYS */;
INSERT INTO `registros_de_peso` VALUES (9,11,80.0,'2023-02-02'),(12,11,67.0,'2023-03-02'),(13,11,70.5,'2023-03-10'),(14,11,75.0,'2023-03-08'),(15,11,75.0,'2023-03-08'),(16,11,70.5,'2023-03-10'),(17,11,75.0,'2023-03-08'),(18,11,78.5,'2023-12-01'),(19,11,78.2,'2023-12-03'),(20,11,77.8,'2023-12-05'),(21,11,77.5,'2023-12-07'),(22,11,77.0,'2023-12-09'),(23,11,76.8,'2023-12-10'),(24,11,75.8,'2023-12-17'),(25,11,75.5,'2023-12-19');
/*!40000 ALTER TABLE `registros_de_peso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_de_rm`
--

DROP TABLE IF EXISTS `registros_de_rm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_de_rm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `RM` varchar(200) DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registros_de_rm_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_de_rm`
--

LOCK TABLES `registros_de_rm` WRITE;
/*!40000 ALTER TABLE `registros_de_rm` DISABLE KEYS */;
INSERT INTO `registros_de_rm` VALUES (12,11,'PULL UPS','200 REPETICIONES','2023-03-02'),(13,11,'Press de Banca','120kg','2023-12-01'),(14,11,'Sentadillas','180kg','2023-12-03'),(15,11,'Peso Muerto','220kg','2023-12-05'),(16,11,'Flexiones','20 repes','2023-12-07'),(17,11,'Dominadas','10 repes','2023-12-09'),(18,11,'Curl de Bíceps','40kg','2023-12-11'),(19,11,'Tríceps en Polea','50kg','2023-12-13'),(20,11,'Prensa de Piernas','250kg','2023-12-15'),(21,11,'Remo con Barra','90kg','2023-12-17'),(22,11,'Fondos en Paralelas','Peso Corporal + 20kg','2023-12-19');
/*!40000 ALTER TABLE `registros_de_rm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutinas`
--

DROP TABLE IF EXISTS `rutinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutinas` (
  `id_rutina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_rutina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutinas`
--

LOCK TABLES `rutinas` WRITE;
/*!40000 ALTER TABLE `rutinas` DISABLE KEYS */;
INSERT INTO `rutinas` VALUES (1,'Rutina de Cardio','Ejercicios de cardio para mejorar la resistencia.','2023-01-10 08:00:00'),(2,'Rutina de Fuerza','Entrenamiento de fuerza para desarrollar músculos.','2023-02-15 10:30:00'),(3,'Rutina de Flexibilidad','Ejercicios para mejorar la flexibilidad y movilidad.','2023-03-20 15:45:00'),(4,'Rutina de Full Body','Trabajo completo del cuerpo en una sesión.','2023-04-25 12:20:00');
/*!40000 ALTER TABLE `rutinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminosbasicos`
--

DROP TABLE IF EXISTS `terminosbasicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminosbasicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) NOT NULL,
  `definicion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminosbasicos`
--

LOCK TABLES `terminosbasicos` WRITE;
/*!40000 ALTER TABLE `terminosbasicos` DISABLE KEYS */;
INSERT INTO `terminosbasicos` VALUES (2,'AHAP','As Heavy As Possible - Tan pesado como puedas.'),(3,'AMRAP','As Many Repetitions (or Rounds) As Possible - Todas las repeticiones (o rondas) posibles.'),(4,'BW','Body weight - Peso corporal.'),(5,'Box','Espacio, gimnasio o centro donde se entrena CrossFit.'),(6,'Cal','Calorías.'),(7,'Chipper','Entrenamiento con muchas repeticiones y muchos movimientos.'),(8,'CrossFit','Entrenamiento funcional, constantemente variado, ejecutado a alta intensidad.'),(9,'CrossFitter','Persona que hace CrossFit.'),(10,'EMOM','Every Minute on the Minute - Hacer un número determinado de repeticiones dentro de cada minuto.'),(11,'False Grip','Agarre Falso. Es un tipo de agarre empleado en movimientos de gimnasia, especialmente en las anillas. Se realiza metiendo la mano en la anilla hasta que la muñeca la toque, rodeando con los dedos la anilla.'),(12,'For Quality','Cuando no importa el tiempo en el que realices el movimiento, sino la técnica y calidad del mismo.'),(13,'For Time','Por tiempo.'),(14,'Hook Grip','Agarre de Gancho. Es un tipo de agarre empleado en movimientos de halterofilia para mejorar la estabilidad y dar mayor seguridad. Se basa en utilizar el dedo pulgar como gancho, sujetando la barra, mientras el resto de los dedos rodean al pulgar.'),(15,'MetCon','Metabolic Conditioning - Acondicionamiento metabólico.'),(16,'PR','Personal record - Record Personal.'),(17,'Rep','Repetición.'),(18,'Rest Day','Día de descanso.'),(19,'RM','Repetition maximum - Máxima carga que un individuo puede mover.'),(20,'ROM','Range of Motion - Rango de movimiento.'),(21,'Rx’d','As prescribed - Entrenamiento o ejercicio realizado correctamente sin ninguna modificación.'),(22,'Scaled','Ejercicio escalado o modificado.'),(23,'Set','Cantidad de veces que se realiza un determinado número de repeticiones. Por ejemplo 4 sets de 5 reps.'),(24,'Strength','Fuerza.'),(25,'TABATA','Tipo de entrenamiento que consiste en 8 intervalos de 20 segundos de trabajo intenso y 10 segundos de descanso. Su nombre viene del creador de este método el doctor Izumi Tabata.'),(26,'Time Cap','Tiempo límite que tiene un WOD para completarse.'),(27,'UB','Unbroken - Es cuando se realiza un ejercicio de principio a fin sin descanso.'),(28,'Warm up','Calentamiento.'),(29,'WOD','Workout of the day - Entrenamiento del día.'),(33,'AFAP','As Fast As Possible - Lo más rápido que puedas.');
/*!40000 ALTER TABLE `terminosbasicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apellido_nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` enum('A','B') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'A',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11,'alesabio10','$2b$10$WRN7peegTQyC9iTA2UBB0OWzozHmonHIfFRjnZxqSMFMYttNodSEO','alejandrosabio15@gmail.com','Sabio Bezus Alejandro','A','2023-02-24 21:59:25',NULL),(12,'alegerman','$2b$10$ZsPMk5iTJAuhM0y2CRkYuOvASVGeDKaMnj9fBHTh6TWCiFeIItXLa','alejandrosabio@icloud.com','ALEJANDRO GERMAN','A','2023-03-07 21:00:18',NULL),(13,'leomessi','$2b$10$ayt6K.bnvqV08Ia0GjSe2O4bMPtMCvktdKhOpXAURqNlg.sEgZugS','leomessi@gmail.com','LEO MESSI','A','2023-03-08 01:36:11',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19 11:45:21

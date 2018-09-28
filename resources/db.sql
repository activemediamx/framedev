/*
 Navicat Premium Data Transfer

 Source Server         : framedev.server
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : framework

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/09/2018 05:38:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cm_catalogo
-- ----------------------------
DROP TABLE IF EXISTS `cm_catalogo`;
CREATE TABLE `cm_catalogo`  (
  `id_cat` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_padre` int(11) UNSIGNED NULL DEFAULT NULL,
  `catalogo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `etiqueta` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `activo` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `orden` int(11) NULL DEFAULT NULL,
  `valor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cat`) USING BTREE,
  INDEX `fk_cm_catalogo_cm_catalogo_1`(`id_padre`) USING BTREE,
  CONSTRAINT `FK__cm_catalo__id_pa__70A8B9AE` FOREIGN KEY (`id_padre`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_catalogo
-- ----------------------------
INSERT INTO `cm_catalogo` VALUES (1, NULL, 'tipo_ubicacion', 'Oficinas Centrales', '1', 0, '', 1, 1, '2016-11-16 14:41:31', '2017-11-15 18:25:59');
INSERT INTO `cm_catalogo` VALUES (2, NULL, 'tipo_ubicacion', 'Base', '1', 2, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (3, NULL, 'status', 'Activo', '1', 1, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (4, NULL, 'status', 'Inactivo', '1', 2, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (5, NULL, 'status', 'Eliminado', '1', 3, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (6, NULL, 'tiporol', 'Framework', '1', 1, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (7, NULL, 'tiporol', 'Cliente', '1', 2, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (8, NULL, 'tiporol', 'Operacion', '1', 3, '', 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:14');
INSERT INTO `cm_catalogo` VALUES (9, NULL, 'status', 'Login Fallido', '1', 4, NULL, 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `cm_catalogo` VALUES (10, NULL, 'pass_chge', 'Requerir cambio de password', '1', 1, NULL, 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:52:04');
INSERT INTO `cm_catalogo` VALUES (11, NULL, 'pass_chge', 'No requerir cambio de password', '1', 1, NULL, 1, 1, '2016-11-16 14:41:31', '2016-11-16 14:52:40');

-- ----------------------------
-- Table structure for fw_area
-- ----------------------------
DROP TABLE IF EXISTS `fw_area`;
CREATE TABLE `fw_area`  (
  `id_area` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int(11) UNSIGNED NULL DEFAULT NULL,
  `cat_status` int(11) UNSIGNED NULL DEFAULT NULL,
  `area_area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_area`) USING BTREE,
  INDEX `fk_area_ubicacion_1`(`id_ubicacion`) USING BTREE,
  INDEX `fk_area_ae_catalogo_1`(`cat_status`) USING BTREE,
  CONSTRAINT `FK__fw_area__cat_sta__719CDDE7` FOREIGN KEY (`cat_status`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_area__id_ubic__72910220` FOREIGN KEY (`id_ubicacion`) REFERENCES `fw_ubicacion` (`id_ubicacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fw_config
-- ----------------------------
DROP TABLE IF EXISTS `fw_config`;
CREATE TABLE `fw_config`  (
  `id_config` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_site` int(11) UNSIGNED NULL DEFAULT NULL,
  `descripcion` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `valor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `tmp_val` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_config`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_config
-- ----------------------------
INSERT INTO `fw_config` VALUES (1, 1, 'login_permitido', '1', '0', '0', 1, 1, '2016-05-28 21:15:57', '2017-08-30 05:22:03');

-- ----------------------------
-- Table structure for fw_login
-- ----------------------------
DROP TABLE IF EXISTS `fw_login`;
CREATE TABLE `fw_login`  (
  `id_login` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NULL DEFAULT NULL,
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL,
  `fecha_login` datetime(0) NULL DEFAULT NULL,
  `ultima_verificacion` datetime(0) NULL DEFAULT NULL,
  `fecha_logout` datetime(0) NULL DEFAULT NULL,
  `tiempo_session` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ipv4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `ipv6` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_login`) USING BTREE,
  INDEX `fk_fw_login_fw_usuarios_1`(`id_usuario`) USING BTREE,
  CONSTRAINT `FK__fw_login__id_usu__73852659` FOREIGN KEY (`id_usuario`) REFERENCES `fw_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for fw_login_log
-- ----------------------------
DROP TABLE IF EXISTS `fw_login_log`;
CREATE TABLE `fw_login_log`  (
  `id_login_log` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `intentos` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id_login_log`) USING BTREE,
  INDEX `fk_login_log_usuarios_1`(`id_usuario`) USING BTREE,
  CONSTRAINT `FK__fw_login___id_us__74794A92` FOREIGN KEY (`id_usuario`) REFERENCES `fw_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fw_lost_password
-- ----------------------------
DROP TABLE IF EXISTS `fw_lost_password`;
CREATE TABLE `fw_lost_password`  (
  `id_lost` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_usuario` int(11) UNSIGNED NULL DEFAULT NULL,
  `correo` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `cat_status` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_lost`) USING BTREE,
  INDEX `fk_lost_password_usuarios_1`(`id_usuario`) USING BTREE,
  INDEX `fk_lost_password_ae_catalogo_1`(`cat_status`) USING BTREE,
  CONSTRAINT `FK__fw_lost_p__cat_s__756D6ECB` FOREIGN KEY (`cat_status`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_lost_p__id_us__76619304` FOREIGN KEY (`id_usuario`) REFERENCES `fw_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fw_metodos
-- ----------------------------
DROP TABLE IF EXISTS `fw_metodos`;
CREATE TABLE `fw_metodos`  (
  `id_metodo` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `controlador` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `metodo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_metodo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_metodos
-- ----------------------------
INSERT INTO `fw_metodos` VALUES (1, 'Area', 'index', 'Indice', 'No tiene acción asignada envía a un error 404', 0, 1, '2016-11-16 14:41:31', '2017-11-15 18:26:17');
INSERT INTO `fw_metodos` VALUES (2, 'Area', 'select_area', 'Seleccionar areas', 'Muestra un combo de seleccion con las areas', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (3, 'Controllers', 'index', 'Indice', 'Muestra la tabla con los metodos que se pueden relacionar a los roles', 0, 1, '2016-11-16 14:41:31', '2016-11-17 20:11:31');
INSERT INTO `fw_metodos` VALUES (4, 'Controllers', 'obtener_controllers', 'Lista de Controladores', 'Realiza la peticion al modelo para obtener la lista de modelos', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (5, 'Controllers', 'data_controller', 'Modal Metodos', 'Solicita una ventana modal para la edicion de metodos', 0, 1, '2016-11-16 14:41:31', '2016-06-17 18:59:56');
INSERT INTO `fw_metodos` VALUES (6, 'Controllers', 'editar_metodo', 'Editar Metodo', 'Envia los datos para editar el metodo', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (7, 'Controllers', 'modal_add_metodo', 'Modal Agregar Metodo', 'Solicita una modal para el alta de un nuevo par Controlador - Metodo', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (8, 'Controllers', 'agregar_metodo', 'Agregar Metodo', 'Envía datos para un nuevo par de Controlador - Método', 0, 1, '2016-11-16 14:41:31', '2017-11-09 02:07:04');
INSERT INTO `fw_metodos` VALUES (9, 'Controllers', 'eliminar_par', 'Elimina Metodo', 'Envía la petición para eliminar el par Controlador - Método, esta acción elimina en cascada los identificadores que se ligaron dentro de la tabla permisos', 0, 1, '2016-11-16 14:41:31', '2017-11-09 02:07:33');
INSERT INTO `fw_metodos` VALUES (10, 'Extensions', 'init', 'Inicializa las extensiones', 'Clase principal que permite inicializar las extensiones', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (11, 'Inicio', 'index', 'Ventana Principal', 'Muestra la ventana principal que se muestra al usuario despues de loguearse', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (12, 'Login', 'salir', 'Salir', 'Sale del sistema, es necesario hacer universal para todos los usuarios', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (13, 'Roles', 'index', 'Indice', 'No tiene accion asignada envia a un error 404', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (14, 'Roles', 'modal_roles', 'Modal Roles', 'Muestra una ventana modal donde se listan los Roles', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (15, 'Roles', 'agregar_rol', 'Inserta Nivel', 'Inserta un nuevo nivel o rol a la lista de roles del sistema', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (16, 'Roles', 'permisos', 'Administracion de permisos', 'Pagina donde se listan todos los permisos para asignarlos a los roles', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (17, 'Roles', 'establecer_permiso', 'Setear permiso', 'Setea el permiso de una actividad en true o false', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (18, 'Roles', 'clonar', 'Clonar roles', 'clona los permisos de un rol a otro para facilitar la creacion de roles basados en uno ya establecido', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (19, 'Ubicacion', 'index', 'Indice', 'No tiene accion asignada envia a un error 404', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (20, 'Ubicacion', 'obtener_ubicaciones', 'Obtiene ubicaciones', 'Obtiene un arreglo con las ubicaciones', 0, 1, '2016-11-16 14:41:31', '2015-10-08 20:13:31');
INSERT INTO `fw_metodos` VALUES (21, 'Usuarios', 'index', 'Indice', 'Muestra la lista de los usuarios del sistema', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (22, 'Usuarios', 'obtener_usuarios', 'Lista de usuarios', 'Obtiene los datos de todos los usuarios para presentarlos en una lista para su administracion', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (23, 'Usuarios', 'datos_usuario', 'Datos de usuario', 'Obtiene los datos de un usuario en particular para mostrarlo en una ventana modal', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (24, 'Usuarios', 'modal_add_usr', 'Modal agregar usuario', 'Muestra una ventana modal con un formulario para dar de alta un nuevo usuario', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (25, 'Usuarios', 'agregar_usuario', 'Insert Usuario', 'Inserta un nuevo registro para un nuevo usuario', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (26, 'Usuarios', 'editar_usuario', 'Update Usuario', 'Realiza la actualizacion de datos de usuario', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (27, 'Usuarios', 'baja_usuario', 'Update status baja', 'marca a un usuario para su baja ya que no esta permitido en el sistema la eliminacion de usuarios', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (28, 'Usuarios', 'perfil', 'Modificar Perfil', 'Obtiene la vista de edicion del perfil para el usuario actual.', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (29, 'Usuarios', 'editar_perfil', 'Actualiza el perfil', 'Envia la solicitud de actualizacion de perfil al modelo.', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (30, 'Usuarios', 'upload_avatar', 'Subir o cambiar avatar', 'Establece el avatar para el usuario, de manera predeterminada el usuario tiene un avatar generico, que se puede cambiar con esta opcion, tambien establece los permisos para tres funciones estaticas complementarias y relacionadas a esta funcion.', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (31, 'Sidebar', 'obtenerExtensiones', 'Obtener extensiones con controladores y metodos', 'Obtiene un arreglo con las extensiones sus controladores y metodos de acuerdo a los permisos asignados para los usuarios, es necesario para renderear el menu lateral o sidebar, y deberia de estar disponible para todos los usuarios que tienen acceso a las ', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');
INSERT INTO `fw_metodos` VALUES (32, 'Pdf', 'resguardo_telefonico', 'Resguardo telefónico', 'Permite descargar el formato de resguardo telefónico', 1, NULL, '2016-03-17 01:50:59', '2016-03-17 08:50:59');
INSERT INTO `fw_metodos` VALUES (33, 'Usuarios', 'logueados', 'Logueados', 'Muestra los usuarios que tienen una sessión abierta actual', 1, NULL, '2016-04-13 13:56:42', '2016-04-13 19:56:42');
INSERT INTO `fw_metodos` VALUES (34, 'Login', 'force_sign_out', 'Forzar Deslogueo del sistema', 'Forza la salida del usuario deslogueandolo del sistema', 1, NULL, '2016-04-13 18:54:04', '2016-04-14 00:54:04');
INSERT INTO `fw_metodos` VALUES (35, 'Login', 'force_all_sign_out', 'Forzar el deslogueo glabal', 'Elimina las sesiones de todos los usuarios y provoca una nueva solicitud de logueo', 1, NULL, '2016-05-09 18:05:18', '2016-05-10 00:05:18');
INSERT INTO `fw_metodos` VALUES (36, 'Login', 'switch_login_op', 'Deshabilita y habilita el logueo de los operadores', 'Permite permutar entre permitir el logueo y des habilitar el logueo de los operadores', 1, 1, '2016-05-10 02:24:20', '2017-11-06 06:14:55');
INSERT INTO `fw_metodos` VALUES (37, 'Catalogo', 'index', 'Indice', 'Lista el catalogo de claves ', 1, NULL, '2016-06-17 18:29:49', '2016-06-17 18:29:49');
INSERT INTO `fw_metodos` VALUES (38, 'Catalogo', 'editar_catalogo', 'Edita los elementos del catalogo', 'Muestra un a modal que permite la edición de un elemento del catalogo seleccionado', 1, 1, '2016-06-17 18:52:32', '2016-06-17 19:01:26');
INSERT INTO `fw_metodos` VALUES (39, 'Catalogo', 'eliminar_elemento', 'Eliminar elemento de catalogo', 'Permite eliminar un elemento del catalogo', 1, NULL, '2016-06-17 23:46:29', '2016-06-17 23:46:29');
INSERT INTO `fw_metodos` VALUES (40, 'Catalogo', 'add_elemento', 'Agrega un nuevo elemento', 'Agrega un nuevo elemento al catalogo', 1, NULL, '2016-06-18 00:19:02', '2016-06-18 00:19:02');
INSERT INTO `fw_metodos` VALUES (41, 'Mobile', 'index', 'Acceso desde el mobil', 'página inicial de acceso desde el móvil', 1, NULL, '2016-11-14 22:01:13', '2016-11-14 22:01:13');
INSERT INTO `fw_metodos` VALUES (42, 'Usuarios', 'desbloquea_usuario', 'Usuarios Bloqueados', 'Desbloquea un usuario ', 1, NULL, '2017-11-20 03:10:59', '2017-11-20 09:10:59');
INSERT INTO `fw_metodos` VALUES (43, 'Usuarios', 'desbloquear_usuarios', 'Desbloquear usuarios', 'Desbloquea a todos los usuarios', 1, NULL, '2017-11-20 03:12:09', '2017-11-20 09:12:09');
INSERT INTO `fw_metodos` VALUES (44, 'Login', 'loginlogger', 'Registro de accesos', '', 1, NULL, '2018-05-20 05:26:47', NULL);

-- ----------------------------
-- Table structure for fw_nivel
-- ----------------------------
DROP TABLE IF EXISTS `fw_nivel`;
CREATE TABLE `fw_nivel`  (
  `id_nivel` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_origen` int(11) UNSIGNED NULL DEFAULT NULL,
  `origen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `nivel` int(11) NULL DEFAULT NULL,
  `n0` int(11) NULL DEFAULT NULL,
  `n1` int(11) NULL DEFAULT NULL,
  `n2` int(11) NULL DEFAULT NULL,
  `n3` int(11) NULL DEFAULT NULL,
  `n4` int(11) NULL DEFAULT NULL,
  `n5` int(11) NULL DEFAULT NULL,
  `n6` int(11) NULL DEFAULT NULL,
  `n7` int(11) NULL DEFAULT NULL,
  `n8` int(11) NULL DEFAULT NULL,
  `n9` int(11) NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_nivel`) USING BTREE,
  INDEX `fk_nivel_area_1`(`id_origen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fw_permisos
-- ----------------------------
DROP TABLE IF EXISTS `fw_permisos`;
CREATE TABLE `fw_permisos`  (
  `id_permiso` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_metodo` int(11) UNSIGNED NULL DEFAULT NULL,
  `id_rol` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_permiso`) USING BTREE,
  INDEX `fk_permisos_roles_1`(`id_rol`) USING BTREE,
  INDEX `fk_permisos_metodos_1`(`id_metodo`) USING BTREE,
  CONSTRAINT `FK__fw_permis__id_me__7755B73D` FOREIGN KEY (`id_metodo`) REFERENCES `fw_metodos` (`id_metodo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_permis__id_ro__7849DB76` FOREIGN KEY (`id_rol`) REFERENCES `fw_roles` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_permisos
-- ----------------------------
INSERT INTO `fw_permisos` VALUES (1, 1, 1, 1, NULL, '2018-03-06 21:06:29', NULL);
INSERT INTO `fw_permisos` VALUES (2, 2, 1, 1, NULL, '2018-03-06 21:06:29', NULL);
INSERT INTO `fw_permisos` VALUES (3, 37, 1, 1, NULL, '2018-03-06 21:06:31', NULL);
INSERT INTO `fw_permisos` VALUES (4, 38, 1, 1, NULL, '2018-03-06 21:06:31', NULL);
INSERT INTO `fw_permisos` VALUES (5, 39, 1, 1, NULL, '2018-03-06 21:06:32', NULL);
INSERT INTO `fw_permisos` VALUES (6, 40, 1, 1, NULL, '2018-03-06 21:06:33', NULL);
INSERT INTO `fw_permisos` VALUES (7, 3, 1, 1, NULL, '2018-03-06 21:06:34', NULL);
INSERT INTO `fw_permisos` VALUES (8, 4, 1, 1, NULL, '2018-03-06 21:06:34', NULL);
INSERT INTO `fw_permisos` VALUES (9, 5, 1, 1, NULL, '2018-03-06 21:06:35', NULL);
INSERT INTO `fw_permisos` VALUES (10, 6, 1, 1, NULL, '2018-03-06 21:06:36', NULL);
INSERT INTO `fw_permisos` VALUES (11, 7, 1, 1, NULL, '2018-03-06 21:06:37', NULL);
INSERT INTO `fw_permisos` VALUES (12, 8, 1, 1, NULL, '2018-03-06 21:06:37', NULL);
INSERT INTO `fw_permisos` VALUES (13, 9, 1, 1, NULL, '2018-03-06 21:06:38', NULL);
INSERT INTO `fw_permisos` VALUES (14, 10, 1, 1, NULL, '2018-03-06 21:06:41', NULL);
INSERT INTO `fw_permisos` VALUES (15, 11, 1, 1, NULL, '2018-03-06 21:06:42', NULL);
INSERT INTO `fw_permisos` VALUES (16, 12, 1, 1, NULL, '2018-03-06 21:06:43', NULL);
INSERT INTO `fw_permisos` VALUES (17, 34, 1, 1, NULL, '2018-03-06 21:06:44', NULL);
INSERT INTO `fw_permisos` VALUES (18, 35, 1, 1, NULL, '2018-03-06 21:06:44', NULL);
INSERT INTO `fw_permisos` VALUES (19, 36, 1, 1, NULL, '2018-03-06 21:06:46', NULL);
INSERT INTO `fw_permisos` VALUES (20, 41, 1, 1, NULL, '2018-03-06 21:06:47', NULL);
INSERT INTO `fw_permisos` VALUES (21, 32, 1, 1, NULL, '2018-03-06 21:06:49', NULL);
INSERT INTO `fw_permisos` VALUES (22, 13, 1, 1, NULL, '2018-03-06 21:06:50', NULL);
INSERT INTO `fw_permisos` VALUES (23, 14, 1, 1, NULL, '2018-03-06 21:06:51', NULL);
INSERT INTO `fw_permisos` VALUES (24, 15, 1, 1, NULL, '2018-03-06 21:06:51', NULL);
INSERT INTO `fw_permisos` VALUES (25, 16, 1, 1, NULL, '2018-03-06 21:06:52', NULL);
INSERT INTO `fw_permisos` VALUES (26, 17, 1, 1, NULL, '2018-03-06 21:06:53', NULL);
INSERT INTO `fw_permisos` VALUES (27, 18, 1, 1, NULL, '2018-03-06 21:06:53', NULL);
INSERT INTO `fw_permisos` VALUES (28, 31, 1, 1, NULL, '2018-03-06 21:06:55', NULL);
INSERT INTO `fw_permisos` VALUES (29, 19, 1, 1, NULL, '2018-03-06 21:06:55', NULL);
INSERT INTO `fw_permisos` VALUES (30, 20, 1, 1, NULL, '2018-03-06 21:06:56', NULL);
INSERT INTO `fw_permisos` VALUES (31, 21, 1, 1, NULL, '2018-03-06 21:06:57', NULL);
INSERT INTO `fw_permisos` VALUES (32, 22, 1, 1, NULL, '2018-03-06 21:06:58', NULL);
INSERT INTO `fw_permisos` VALUES (33, 23, 1, 1, NULL, '2018-03-06 21:06:58', NULL);
INSERT INTO `fw_permisos` VALUES (34, 24, 1, 1, NULL, '2018-03-06 21:07:00', NULL);
INSERT INTO `fw_permisos` VALUES (35, 25, 1, 1, NULL, '2018-03-06 21:07:00', NULL);
INSERT INTO `fw_permisos` VALUES (36, 26, 1, 1, NULL, '2018-03-06 21:07:02', NULL);
INSERT INTO `fw_permisos` VALUES (37, 27, 1, 1, NULL, '2018-03-06 21:07:02', NULL);
INSERT INTO `fw_permisos` VALUES (38, 28, 1, 1, NULL, '2018-03-06 21:07:03', NULL);
INSERT INTO `fw_permisos` VALUES (39, 29, 1, 1, NULL, '2018-03-06 21:07:04', NULL);
INSERT INTO `fw_permisos` VALUES (40, 30, 1, 1, NULL, '2018-03-06 21:07:04', NULL);
INSERT INTO `fw_permisos` VALUES (41, 33, 1, 1, NULL, '2018-03-06 21:07:06', NULL);
INSERT INTO `fw_permisos` VALUES (42, 42, 1, 1, NULL, '2018-03-06 21:07:06', NULL);
INSERT INTO `fw_permisos` VALUES (43, 43, 1, 1, NULL, '2018-03-06 21:07:07', NULL);
INSERT INTO `fw_permisos` VALUES (45, 0, 1, 1, NULL, '2018-05-20 05:26:56', NULL);
INSERT INTO `fw_permisos` VALUES (46, 44, 1, 1, NULL, '2018-09-28 05:32:57', NULL);

-- ----------------------------
-- Table structure for fw_roles
-- ----------------------------
DROP TABLE IF EXISTS `fw_roles`;
CREATE TABLE `fw_roles`  (
  `id_rol` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_tiporol` int(11) UNSIGNED NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE,
  INDEX `fk_fw_roles_cm_catalogo_1`(`cat_tiporol`) USING BTREE,
  CONSTRAINT `FK__fw_roles__cat_ti__793DFFAF` FOREIGN KEY (`cat_tiporol`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_roles
-- ----------------------------
INSERT INTO `fw_roles` VALUES (1, 6, 'Desarrollador', 0, 0, '2016-11-16 14:41:31', '2016-11-16 14:41:31');

-- ----------------------------
-- Table structure for fw_roles_alta
-- ----------------------------
DROP TABLE IF EXISTS `fw_roles_alta`;
CREATE TABLE `fw_roles_alta`  (
  `id_rol_alta` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) UNSIGNED NULL DEFAULT NULL,
  `access` int(11) NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol_alta`) USING BTREE,
  INDEX `fk_fw_roles_alta_fw_roles_1`(`id_rol`) USING BTREE,
  CONSTRAINT `FK__fw_roles___id_ro__7A3223E8` FOREIGN KEY (`id_rol`) REFERENCES `fw_roles` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_roles_alta
-- ----------------------------
INSERT INTO `fw_roles_alta` VALUES (1, 1, 1, 1, NULL, '2018-03-06 21:07:48', NULL);

-- ----------------------------
-- Table structure for fw_ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `fw_ubicacion`;
CREATE TABLE `fw_ubicacion`  (
  `id_ubicacion` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion_ubicacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `direccion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `cat_tipo_ubicacion` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`) USING BTREE,
  INDEX `fk_ubicacion_ae_catalogo_1`(`cat_tipo_ubicacion`) USING BTREE,
  CONSTRAINT `FK__fw_ubicac__cat_t__7B264821` FOREIGN KEY (`cat_tipo_ubicacion`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_ubicacion
-- ----------------------------
INSERT INTO `fw_ubicacion` VALUES (1, 'Oficinas Centrales', 'Direccion', 1, 0, 0, '2016-11-16 14:41:31', '2016-11-09 07:31:50');

-- ----------------------------
-- Table structure for fw_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `fw_usuarios`;
CREATE TABLE `fw_usuarios`  (
  `id_usuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_area` int(11) UNSIGNED NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_rol` int(11) UNSIGNED NULL DEFAULT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `apellido_paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `apellido_materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id_ubicacion` int(11) UNSIGNED NULL DEFAULT NULL,
  `cat_pass_chge` int(11) UNSIGNED NULL DEFAULT NULL,
  `cat_status` int(11) UNSIGNED NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  INDEX `fk_fw_usuarios_cm_catalogo_1`(`cat_status`) USING BTREE,
  INDEX `fk_usuarios_area_1`(`id_area`) USING BTREE,
  INDEX `fk_usuarios_roles_1`(`id_rol`) USING BTREE,
  INDEX `fk_usuarios_ubicacion_1`(`id_ubicacion`) USING BTREE,
  CONSTRAINT `FK__fw_usuari__cat_s__7C1A6C5A` FOREIGN KEY (`cat_status`) REFERENCES `cm_catalogo` (`id_cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_usuari__id_ar__7D0E9093` FOREIGN KEY (`id_area`) REFERENCES `fw_area` (`id_area`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_usuari__id_ro__7E02B4CC` FOREIGN KEY (`id_rol`) REFERENCES `fw_roles` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK__fw_usuari__id_ub__7EF6D905` FOREIGN KEY (`id_ubicacion`) REFERENCES `fw_ubicacion` (`id_ubicacion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_usuarios
-- ----------------------------
INSERT INTO `fw_usuarios` VALUES (1, NULL, '21232f297a57a5a743894a0e4a801fc3', 'admin', 'framedev@gmail.com', 1, 'Usuario1', 'ap', 'ap', 1, 11, 3, 1, 1, '2016-11-16 14:41:31', '2017-11-22 07:23:02');

-- ----------------------------
-- Table structure for fw_usuarios_config
-- ----------------------------
DROP TABLE IF EXISTS `fw_usuarios_config`;
CREATE TABLE `fw_usuarios_config`  (
  `id_usuario_config` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `paginacion` int(11) NULL DEFAULT NULL,
  `activar_paginado` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `aceptar_tyc` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `fecha_ingreso` date NULL DEFAULT NULL,
  `user_alta` int(11) NULL DEFAULT NULL,
  `user_mod` int(11) NULL DEFAULT NULL,
  `fecha_alta` datetime(0) NULL DEFAULT NULL,
  `fecha_mod` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario_config`) USING BTREE,
  INDEX `fk_usuarios_config_usuarios_1`(`id_usuario`) USING BTREE,
  CONSTRAINT `FK__fw_usuari__id_us__7FEAFD3E` FOREIGN KEY (`id_usuario`) REFERENCES `fw_usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fw_usuarios_config
-- ----------------------------
INSERT INTO `fw_usuarios_config` VALUES (1, 1, 'MjRX39.jpg', 20, '1', 'SI', '1900-01-01', NULL, 1, NULL, '2017-11-23 01:39:47');

-- ----------------------------
-- View structure for view_log
-- ----------------------------
DROP VIEW IF EXISTS `view_log`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_log` AS select `fw_login`.`id_login` AS `id_login`,`fw_login`.`open` AS `open`,`fw_login`.`fecha_login` AS `fecha_login`,`fw_login`.`ultima_verificacion` AS `ultima_verificacion`,`fw_login`.`fecha_logout` AS `fecha_logout`,`fw_login`.`tiempo_session` AS `tiempo_session`,`fw_login`.`ipv4` AS `ipv4`,`fw_usuarios`.`usuario` AS `usuario`,`fw_roles`.`descripcion` AS `descripcion` from ((`fw_login` join `fw_usuarios` on((`fw_login`.`id_usuario` = `fw_usuarios`.`id_usuario`))) join `fw_roles` on((`fw_usuarios`.`id_rol` = `fw_roles`.`id_rol`)));

-- ----------------------------
-- View structure for view_logins
-- ----------------------------
DROP VIEW IF EXISTS `view_logins`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_logins` AS select `fw_login`.`id_login` AS `id_login`,`fw_usuarios`.`usuario` AS `usuario`,concat(`fw_usuarios`.`nombres`,' ',`fw_usuarios`.`apellido_paterno`,' ',`fw_usuarios`.`apellido_materno`) AS `nombre`,`fw_login`.`fecha_login` AS `fecha_login`,`fw_login`.`ultima_verificacion` AS `ultima_verificacion`,`fw_login`.`ipv4` AS `ipv4`,`fw_login`.`session_id` AS `session_id`,`fw_usuarios`.`id_usuario` AS `id_usuario` from (`fw_login` join `fw_usuarios` on((`fw_login`.`id_usuario` = `fw_usuarios`.`id_usuario`))) where (`fw_login`.`open` = 1);

-- ----------------------------
-- View structure for view_usuarios
-- ----------------------------
DROP VIEW IF EXISTS `view_usuarios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_usuarios` AS select `fw_usuarios`.`id_usuario` AS `id_usuario`,`fw_usuarios`.`usuario` AS `usuario`,`fw_usuarios`.`correo` AS `correo`,`fw_usuarios`.`nombres` AS `nombres`,`fw_usuarios`.`apellido_paterno` AS `apellido_paterno`,`fw_usuarios`.`apellido_materno` AS `apellido_materno`,`fw_roles`.`descripcion` AS `descripcion`,`fw_usuarios`.`cat_status` AS `cat_status` from (`fw_usuarios` join `fw_roles` on((`fw_usuarios`.`id_rol` = `fw_roles`.`id_rol`)));

SET FOREIGN_KEY_CHECKS = 1;

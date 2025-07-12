BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS curso (
id INTEGER PRIMARY KEY,
nombre TEXT NOT NULL,
duracion INTEGER);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS estudiante ( id INTEGER PRIMARY KEY, nombre TEXT, email TEXT );
CREATE TABLE IF NOT EXISTS "portfolio_proyecto" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "titulo" varchar(100) NOT NULL, "descripcion" text NOT NULL, "fecha" date NOT NULL, "url" varchar(200) NOT NULL);
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_proyecto','Can add proyecto'),
 (26,7,'change_proyecto','Can change proyecto'),
 (27,7,'delete_proyecto','Can delete proyecto'),
 (28,7,'view_proyecto','Can view proyecto');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$1000000$ej8BSkrckhGwkmnrpvCjqh$tAtXAcaJ4pTwIqVJyWVA8JsqG4/TMT0EXk/Tgghjz9o=',NULL,1,'xioga','','admin@gmail.com',1,1,'2025-07-04 23:52:13.828199','');
INSERT INTO "curso" ("id","nombre","duracion") VALUES (1,'Python Básico',40),
 (2,'Django Web',60);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'portfolio','proyecto');
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2025-07-04 23:44:00.296289'),
 (2,'auth','0001_initial','2025-07-04 23:44:00.319025'),
 (3,'admin','0001_initial','2025-07-04 23:44:00.337641'),
 (4,'admin','0002_logentry_remove_auto_add','2025-07-04 23:44:00.352381'),
 (5,'admin','0003_logentry_add_action_flag_choices','2025-07-04 23:44:00.361920'),
 (6,'contenttypes','0002_remove_content_type_name','2025-07-04 23:44:00.382604'),
 (7,'auth','0002_alter_permission_name_max_length','2025-07-04 23:44:00.397010'),
 (8,'auth','0003_alter_user_email_max_length','2025-07-04 23:44:00.411315'),
 (9,'auth','0004_alter_user_username_opts','2025-07-04 23:44:00.421367'),
 (10,'auth','0005_alter_user_last_login_null','2025-07-04 23:44:00.433885'),
 (11,'auth','0006_require_contenttypes_0002','2025-07-04 23:44:00.439997'),
 (12,'auth','0007_alter_validators_add_error_messages','2025-07-04 23:44:00.452061'),
 (13,'auth','0008_alter_user_username_max_length','2025-07-04 23:44:00.465344'),
 (14,'auth','0009_alter_user_last_name_max_length','2025-07-04 23:44:00.477327'),
 (15,'auth','0010_alter_group_name_max_length','2025-07-04 23:44:00.491084'),
 (16,'auth','0011_update_proxy_permissions','2025-07-04 23:44:00.500545'),
 (17,'auth','0012_alter_user_first_name_max_length','2025-07-04 23:44:00.513646'),
 (18,'portfolio','0001_initial','2025-07-04 23:44:00.522429'),
 (19,'sessions','0001_initial','2025-07-04 23:44:00.537192'),
 (20,'portfolio','0002_proyecto_url','2025-07-04 23:47:11.676574');
INSERT INTO "estudiante" ("id","nombre","email") VALUES (1,'Ana Pérez','ana@example.com'),
 (2,'Carlos Ruiz','c.ruiz@example.com');
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;

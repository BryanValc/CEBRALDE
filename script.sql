/*A continuación se eliminará la base de datos Consultec
si es que ya existe, y se creará*/

DROP DATABASE IF EXISTS Consultec;
CREATE DATABASE IF NOT EXISTS Consultec;

USE Consultec;

/*A continuación se creará la tabla de pacientes llamada
Paciente, con una llave primaria llamada id_paciente de tipo int not null*/

CREATE TABLE IF NOT EXISTS Paciente (  
    id_paciente int not null primary key,
    nombre varchar(32) not null,
    ap_paterno varchar(32) not null,
    ap_materno varchar(32),
    fecha_naci date not null,
    alergias varchar(128));

/*Ahora se creará la tabla de citas llamada Cita, tendrá una
llave primaria llamada id_cita y una llave foránea llamada 
id_paciente*/

CREATE TABLE IF NOT EXISTS Cita (
    id_cita int not null primary key,
    id_paciente int not null,
    fecha_cita date not null,
    hora_cita time not null,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente));

/*Se creará la tabla de recetas llamada Receta, tendrá una
llave primaria llamada id_receta y una llave foránea llamada
id_cita*/

CREATE TABLE IF NOT EXISTS Receta (
    id_receta int not null primary key,
    id_cita int not null,
    descripcion varchar(120) not null,
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita));

/*Se hará una tabla con el historial médico, tendra un
id_historial, una llave foránea llamada id_paciente*/

CREATE TABLE IF NOT EXISTS Historial_medico (
    id_historial int not null primary key,
    id_paciente int not null,
    fecha date not null,
    diagnostico varchar(128),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente));

/*Ahora se hará la tabla de usuarios llamada Usuarios, tendrá una
tendrá campo de tipo_usuario, nombre_usuario, contraseña, todos de tipo varchar*/

CREATE TABLE IF NOT EXISTS Usuarios (
    tipo_usuario varchar(15) not null,
    nombre_usuario varchar(32) not null,
    contraseña varchar(32) not null);
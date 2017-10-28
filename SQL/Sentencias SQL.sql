create database datos;
use datos;

create table paciente(
    id_paciente int(11) primary key auto_increment,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    direccion varchar(100) not null,
    id_ciudad int(11) not null
);

create table ciudad(
    id_ciudad int(11) primary key auto_increment,
    nombre varchar(100) not null
);

create table remision(
    id_remision int(11) primary key auto_increment,
    id_paciente int(11) not null,
    fecha date not null,
    id_medico int(11) not null
);

create table medico(
    id_medico int(11) primary key auto_increment,
    nombres varchar(100) not null,
    apellidos varchar(100) not null
);

create table remision_examen(
    id_remision int(11),
    id_examen int(11),
    primary key(id_remision, id_examen)
);

create table examen(
    id_examen int(11) primary key auto_increment,
    nombre varchar(100) not null,
    descripcion text not null
);

create table bacteriologa(
    id_bacteriologa int(11) primary key auto_increment,
    nombres varchar(100) not null,
    apellidos varchar(100) not null
);

create table laboratorio(
    id_laboratorio int(11) primary key auto_increment,
    nit varchar(100) not null,
    nombre varchar(100) not null
);

create table parametro(
    id_parametro int(11) primary key auto_increment,
    id_examen int(11) not null,
    valor_maximo varchar(100) not null,
    valor_minimo varchar(100) not null,
    nombre varchar(100) not null,
    descripcion text not null
);

create table resultado(
    id_resultado int(11) primary key auto_increment,
    id_paciente int(11) not null,
    id_parametro int(11) not null
);

--Relación llaves foráneas;
alter table paciente add constraint paciente_ciudad foreign key(id_ciudad) references ciudad(id_ciudad) ON DELETE CASCADE;
alter table remision add constraint remision_paciente foreign key(id_paciente) references paciente(id_paciente) ON DELETE CASCADE;
alter table remision add constraint remision_medico foreign key(id_medico) references medico(id_medico) ON DELETE CASCADE;
alter table remision_examen add constraint remision_examen foreign key(id_remision) references remision(id_remision) ON DELETE CASCADE;
alter table remision_examen add constraint examen_remision foreign key(id_examen) references examen(id_examen) ON DELETE CASCADE;
alter table parametro add constraint parametro_examen foreign key(id_examen) references examen(id_examen) ON DELETE CASCADE;
alter table resultado add constraint resultado_paciente foreign key(id_paciente) references paciente(id_paciente) ON DELETE CASCADE;
alter table resultado add constraint resultado_parametro foreign key(id_parametro) references parametro(id_parametro) ON DELETE CASCADE;

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

Bacteriologa

insert into bacteriologa(nombres, apellidos) values ('Camila', 'Garzón Calle');
insert into bacteriologa(nombres, apellidos) values ('Andrea ', 'Cruz Ávila');

Ciudad
insert into ciudad (nombre) values ('Leticia');
insert into ciudad (nombre) values ('Medellín');
insert into ciudad (nombre) values ('Arauca');
insert into ciudad (nombre) values ('Barranquilla');
insert into ciudad (nombre) values ('Cartagena');
insert into ciudad (nombre) values ('Tunja');
insert into ciudad (nombre) values ('Manizales');
insert into ciudad (nombre) values ('Florencia');
insert into ciudad (nombre) values ('Yopal');
insert into ciudad (nombre) values ('Popayán');
insert into ciudad (nombre) values ('Valledupar');
insert into ciudad (nombre) values ('Quibdó');
insert into ciudad (nombre) values ('Montería');
insert into ciudad (nombre) values ('Bogotá');
insert into ciudad (nombre) values ('Puerto Inírida');
insert into ciudad (nombre) values ('San José del Guaviare');
insert into ciudad (nombre) values ('Neiva');
insert into ciudad (nombre) values ('Riohacha');
insert into ciudad (nombre) values ('Santa Marta');
insert into ciudad (nombre) values ('Villavicencio');
insert into ciudad (nombre) values ('Pasto');
insert into ciudad (nombre) values ('Cucuta');
insert into ciudad (nombre) values ('Mocoa');
insert into ciudad (nombre) values ('Armenia');
insert into ciudad (nombre) values ('Pereira');
insert into ciudad (nombre) values ('San Andrés');
insert into ciudad (nombre) values ('Bucaramanga');
insert into ciudad (nombre) values ('Sincelejo');
insert into ciudad (nombre) values ('Ibagué');
insert into ciudad (nombre) values ('Calí');
insert into ciudad (nombre) values ('Mitú');
insert into ciudad (nombre) values ('Puerto Carreño');

examenes

insert into examen (nombre, descripcion) values ('Hemograma completo', 'El hemograma consiste en un conteo de los elementos celulares de la sangre como son las células rojas, blancas y plaquetas.');
insert into examen (nombre, descripcion) values ('Urinálisis', 'Unos cuantos mililitros de este desecho humano, pueden ser la clave para detectar un problema de salud relacionado con el sistema urinario: una infección, diabetes, pobre funcionamiento de los riñones, cálculos o el primer indicio de una malignidad.');
insert into examen (nombre, descripcion) values ('Heces por Parásito', 'En el trópico es frecuente, especialmente en los niños, encontrar parásitos en las heces.');
insert into examen (nombre, descripcion) values ('Perfil Renal', 'Urea es el producto final del metabolismo de la proteína. La cantidad de urea excretada varia directamente con la ingesta de proteínas.');
insert into examen (nombre, descripcion) values ('Perfil Lipídico', 'El colesterol elevado es el principal factor de riesgo en las enfermedades cardiovasculares y ateroesclerosis. Las lipoproteínas HDL y LDL son responsables del transporte de este colesterol.');
insert into examen (nombre, descripcion) values ('Perfil Hepático', 'La bilirrubina resulta de la desintegración de la hemoglobina en las células rojas, resultado de la destrucción de las células rojas que normalmente son eliminadas por el hígado.');
insert into examen (nombre, descripcion) values ('Perfil Tirodeo', 'Las pruebas de laboratorio para evaluar la función de las glándulas tiroides o para confirmar o excluir el hipertiroidismo son T4 total, T4 libre, T3 y TSH. Para detectar el hipotiroidismo son el T4 total, T4 libre y TSH.');
insert into examen (nombre, descripcion) values ('Panel básico metabólico', 'Glucosa, electrolitos (sodio, potasio, cloro y dióxido de carbono). El nivel de glucosa puede revelar una de las enfermedades más frecuentes en nuestro país: la diabetes. El tener elevada la “azúcar” en la sangre sin el control adecuado, puede dar inicio a una cadena de otros trastornos fatales a nuestro cuerpo como lo son las enfermedades del corazón y riñones.');

laboratotio

insert into laboratorio (nit, nombre) values ('321.231.873 - 2', 'Laboratorio Genfira');
insert into laboratorio (nit, nombre) values ('725.231.873 - 2', 'Laboratorio Charles S.A');
insert into laboratorio (nit, nombre) values ('746.231.873 - 2', 'Laboratorio Medicaritas');
insert into laboratorio (nit, nombre) values ('167.231.873 - 2', 'Laboratorio Biológico Salud solar S.A');
insert into laboratorio (nit, nombre) values ('492.231.873 - 2', 'Laboratorio Médico Militar');

medico
insert into medico (nombres, apellidos) values ('Andrés Camilo', 'Rodriguez Farfán'); 
insert into medico (nombres, apellidos) values ('Michael', 'Sierra Wern');
insert into medico (nombres, apellidos) values ('Juana', 'Uribe Merchán');
insert into medico (nombres, apellidos) values ('Mónica Paola', 'Peña Castillo');
insert into medico (nombres, apellidos) values ('Charles', 'Truman Sang');
insert into medico (nombres, apellidos) values ('Sergio Andrés', 'Ortega Murcia');

paciente

insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Cristian', 'Urrutia García', 'Krr 34#52 A-2', 21);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Carmen Isabella', 'Garzón Pineda', 'AV 52#12- 42', 14);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Sandra Elvira', 'Sánchez Moreno', 'Cll 12#37 B-3', 22);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Pedro', 'Perdomo Grisales', 'Krr 43#83 D-21', 2);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Juan David','Gómez Avella', 'Krr 2#32-54', 10);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('María José', 'Santís Celis', 'AV 15-52#2B', 14);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Donald', 'Santos  Maduro', 'Cll 60# 32B sur', 20);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Álvaro', 'Pinilla Rojas ', 'Cll 13#21 53- D', 23);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('Laura Vanessa', 'Poveda Osorio', 'Krr 21#52 22E', 27);
insert into paciente (nombres, apellidos, direccion, id_ciudad) values ('María Juliana', 'Cárdenas García', 'Cll 32#84 30Norte', 19);

parametro

insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (2,'15mg/g','68mg/g', 'Relación proteínas/Creatinina', 'Rango normal de proteínas presentes en la orina de los hombres');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (2,'10mg/g','107mg/g', 'Relación proteínas/Creatinina', 'Rango normal de proteínas presentes en la orina de las mujeres');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (3,'ausencia de patogenos','presencia de patogenos', 'Estado de las Heces', 'Las heces normales no deben presentar parásitos ni sangre oculta');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (4,'0.6mg/dl','1.5mg/dl', 'Nivles Nitrógeno de Urea (BUN)', 'Rango Normal de BUN en la sangre en adultos');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (5,'30mg/dl','70mg/dl', 'Lipoproteínas HDL', 'Rango normal de transporte del colesterol hacía el higado en hombres');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (5,'40mg/dl','85mg/dl', 'Lipoproteínas HDL', 'Rango normal de transporte del colesterol hacía el higado en mujeres');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (6,'0.8mg/dl','1.3mg/dl', 'Nivel de blilirrubina', 'Rango normal de Bilirrubina');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (7,'T4 Total T4 Libre','T3 TSH', 'Nivel TSH', 'Rango para detectar hipertiroidismo');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (7,'T4 Total T4 Libre','T4 TSH', 'Nivel TSH', 'Rango para detectar hipotiroidismo');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (8,'80mg/dl','120mg/dl', 'Nivel Glucosa', 'Rango normal de glucosa en la sangre en ayunas');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (1,'13.5g/dl','17.5g/dl', 'Hemoglobina', 'Rango normal de la hemoglobina en la sangre de los hombres');
insert into parametro (id_examen, valor_minimo, valor_maximo, nombre, descripcion) values (1,'12g/dl','16g/dl', 'Hemoglobina', 'Rango normal de la hemoglobina en la sangre de las mujeres');

remision 

insert into remision (id_paciente, fecha, id_medico) values (1, '2016-03-02', 1);
insert into remision (id_paciente, fecha, id_medico) values (2, '2016-08-12', 3);
insert into remision (id_paciente, fecha, id_medico) values (3, '2017-02-22', 2);
insert into remision (id_paciente, fecha, id_medico) values (4, '2017-03-02', 4);
insert into remision (id_paciente, fecha, id_medico) values (5, '2017-05-12', 6);
insert into remision (id_paciente, fecha, id_medico) values (6, '2017-06-02', 5);
insert into remision (id_paciente, fecha, id_medico) values (7, '2017-07-30', 1);
insert into remision (id_paciente, fecha, id_medico) values (8, '2017-09-11', 2);
insert into remision (id_paciente, fecha, id_medico) values (9, '2017-10-01', 4);
insert into remision (id_paciente, fecha, id_medico) values (10, '2017-12-04',6);

remision_ examen

insert into remision_examen (id_remision, id_examen) values (1,2);
insert into remision_examen (id_remision, id_examen) values (2,1);
insert into remision_examen (id_remision, id_examen) values (3,3);
insert into remision_examen (id_remision, id_examen) values (4,4);
insert into remision_examen (id_remision, id_examen) values (5,5);
insert into remision_examen (id_remision, id_examen) values (6,5);
insert into remision_examen (id_remision, id_examen) values (7,1);
insert into remision_examen (id_remision, id_examen) values (8,6);
insert into remision_examen (id_remision, id_examen) values (9,7);
insert into remision_examen (id_remision, id_examen) values (10,8);

resultado

insert into resultado (id_paciente, id_parametro) values (1,1);
insert into resultado (id_paciente, id_parametro) values (2,11);
insert into resultado (id_paciente, id_parametro) values (3,3);
insert into resultado (id_paciente, id_parametro) values (4,4);
insert into resultado (id_paciente, id_parametro) values (5,5);
insert into resultado (id_paciente, id_parametro) values (6,6);
insert into resultado (id_paciente, id_parametro) values (7,11);
insert into resultado (id_paciente, id_parametro) values (8,6);
insert into resultado (id_paciente, id_parametro) values (9,9);
insert into resultado (id_paciente, id_parametro) values (10,10);

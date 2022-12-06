
-- Creamos un esquema de trabajo:
create schema keepcoches authorization cbhkryry;

-- Creamos tablas:

-- Tabla coches:
CREATE TABLE keepcoches.coches(
	id_coche integer NOT NULL, -- PK
	id_modelo integer NOT NULL, -- FK (modelo)
	id_color integer NOT NULL, -- FK (color)
	matricula varchar(7) NOT NULL,
	km_total integer NOT NULL,
	fecha_compra date NOT NULL
	);

alter table keepcoches.coches
	add constraint pk_coche PRIMARY KEY (id_coche);


-- Tabla modelo:
CREATE TABLE keepcoches.modelo(
	id_modelo integer NOT NULL, --PK
	id_marca integer NOT NULL, --FK (marca)
	modelo varchar(15) NOT NULL
	);

alter table keepcoches.modelo
	add constraint pk_modelo PRIMARY KEY (id_modelo);


-- Tabla color:
CREATE TABLE keepcoches.color(
	id_color integer NOT NULL, --PK
	descripcion_color varchar(15) NOT NULL
	);

alter table keepcoches.color
	add constraint pk_color PRIMARY KEY (id_color);


-- Tabla marca:
CREATE TABLE keepcoches.marca(
	id_marca integer NOT NULL, --PK
	id_empresa integer NOT NULL, --FK(grupoEmpresarial)
	marca varchar(15) NOT NULL
	);

alter table keepcoches.marca
	add constraint pk_marca PRIMARY KEY (id_marca);



-- Tabla grupoEmpresarial:
CREATE TABLE keepcoches.grupoEmpresarial(
	id_empresa integer NOT NULL, --PK
	empresa varchar(15) NOT NULL
	);
alter table keepcoches.grupoEmpresarial
	add constraint pk_grupoEmpresarial PRIMARY KEY (id_empresa);


-- Tabla revision:
CREATE TABLE keepcoches.revision(
	id_coche integer NOT NULL, --FK(coche), PK
	km integer NOT NULL, --PK
	id_moneda integer NOT NULL, --FK(moneda)
	fecha_revision timestamp NOT NULL, 
	importe integer NOT NULL
	);

alter table keepcoches.revision
	add constraint pk_revision PRIMARY KEY (id_coche, km);



-- Tabla moneda:
CREATE TABLE keepcoches.moneda(
	id_moneda integer NOT NULL, -- PK
	tipo_moneda varchar(20)
	);
alter table keepcoches.moneda
	add constraint pk_moneda PRIMARY KEY (id_moneda);


-- Tabla polizaCoche:
CREATE TABLE keepcoches.polizaCoche(
	id_poliza integer NOT NULL, -- PK
	id_coche integer NOT NULL, --FK(coche)
	id_companiaAseg integer NOT NULL, --FK(empresaAseguradora)
	num_poliza integer NOT NULL
	);

alter table keepcoches.polizaCoche
	add constraint pk_polizaCoche PRIMARY KEY (id_poliza);



-- Tabla empresaAseguradora:
CREATE TABLE keepcoches.empresaAseguradora(
	id_companiaAseg integer NOT NULL, -- PK
	compania_aseguradora varchar NOT NULL
	);

alter table keepcoches.empresaAseguradora
	add constraint pk_empresaAseguradora PRIMARY KEY (id_companiaAseg);


------------------------
--FK: 

alter table keepcoches.coches
	add constraint modelo FOREIGN KEY (id_modelo)
	references keepcoches.modelo (id_modelo);

alter table keepcoches.coches
	add constraint color_coche FOREIGN KEY (id_color)
	references keepcoches.color (id_color);

alter table keepcoches.modelo
	add constraint marca_coche FOREIGN KEY (id_marca)
	references keepcoches.marca (id_marca);

alter table keepcoches.marca
	add constraint empresa_coche FOREIGN KEY (id_empresa)
	references keepcoches.grupoEmpresarial(id_empresa);

alter table keepcoches.revision
	add constraint moneda_importe FOREIGN KEY (id_moneda)
	references keepcoches.moneda(id_moneda);

alter table keepcoches.revision
	add constraint coche_revisado FOREIGN KEY (id_coche)
	references keepcoches.coches(id_coche);

alter table keepcoches.polizaCoche
	add constraint poliza_coche FOREIGN KEY (id_coche)
	references keepcoches.coches(id_coche);

alter table keepcoches.polizaCoche
	add constraint compania_poliza FOREIGN KEY (id_companiaAseg)
	references keepcoches.empresaAseguradora(id_companiaAseg);


------------------
--Insertamos los datos:

--Color:
INSERT INTO keepcoches.color 
	(id_color, descripcion_color)
	VALUES('002', 'Beige');

INSERT INTO keepcoches.color 
	(id_color, descripcion_color)
	VALUES('003', 'Plata');

INSERT INTO keepcoches.color 
	(id_color, descripcion_color)
	VALUES('001', 'Azul');


--GrupoEmpresarial:
INSERT INTO keepcoches.grupoempresarial  
	(id_empresa, empresa)
	VALUES('02', 'FCA');

INSERT INTO keepcoches.grupoempresarial  
	(id_empresa, empresa)
	VALUES('03', 'Volkswagen');

INSERT INTO keepcoches.grupoempresarial  
	(id_empresa, empresa)
	VALUES('01', 'Suzuki');

INSERT INTO keepcoches.grupoempresarial  
	(id_empresa, empresa)
	VALUES('04', 'Renault Nissan');


--Marca:
INSERT INTO keepcoches.marca 
	(id_marca, id_empresa, marca)
	VALUES('002', '02', 'Fiat');
	
INSERT INTO keepcoches.marca 
	(id_marca, id_empresa, marca)
	VALUES('003', '03', 'Seat');	
	
INSERT INTO keepcoches.marca 
	(id_marca, id_empresa, marca)
	VALUES('001', '01', 'Suzuki');
	
INSERT INTO keepcoches.marca 
	(id_marca, id_empresa, marca)
	VALUES('004', '04', 'Dacia');


--Modelo:
INSERT INTO keepcoches.modelo
	(id_modelo, id_marca, modelo)
	VALUES('01', '002', '500 Híbrido');

INSERT INTO keepcoches.modelo
	(id_modelo, id_marca, modelo)
	VALUES('03', '003', 'Arona');

INSERT INTO keepcoches.modelo
	(id_modelo, id_marca, modelo)
	VALUES('02', '001', 'Ignis');

INSERT INTO keepcoches.modelo
	(id_modelo, id_marca, modelo)
	VALUES('11', '001', 'Swift');

INSERT INTO keepcoches.modelo
	(id_modelo, id_marca, modelo)
	VALUES('09', '004', 'Sandero');


--Coches:
INSERT INTO keepcoches.coches
	(id_coche, id_modelo, id_color, matricula, km_total, fecha_compra)
	VALUES('01', '01', '003', '5266BBD', 12000, '2022-02-01');

INSERT INTO keepcoches.coches
	(id_coche, id_modelo, id_color, matricula, km_total, fecha_compra)
	VALUES('02', '03', '003', '7894ETL', 19001, '2021-03-01');

INSERT INTO keepcoches.coches
	(id_coche, id_modelo, id_color, matricula, km_total, fecha_compra)
	VALUES('03', '02', '002', '4242SQL', 32000, '2017-02-05');

INSERT INTO keepcoches.coches
	(id_coche, id_modelo, id_color, matricula, km_total, fecha_compra)
	VALUES('04', '11', '001', '7667RRR', 27000, '2016-06-01');

INSERT INTO keepcoches.coches
	(id_coche, id_modelo, id_color, matricula, km_total, fecha_compra)
	VALUES('05', '09', '001', '7443TBL', 49000, '2015-07-09');


--Moneda:
INSERT INTO keepcoches.moneda 
	(id_moneda, tipo_moneda)
	VALUES('01', 'EUR');
	
INSERT INTO keepcoches.moneda 
	(id_moneda, tipo_moneda)
	VALUES('02', 'USD');
	

--Revision:
INSERT INTO keepcoches.revision 
	(id_coche, km, id_moneda, fecha_revision, importe)
	VALUES('01', 10000, '01', '2022-11-01', 100);
	
INSERT INTO keepcoches.revision 
	(id_coche, km, id_moneda, fecha_revision, importe)
	VALUES('02', 15000, '01', '2022-08-02', 70);
	
INSERT INTO keepcoches.revision 
	(id_coche, km, id_moneda, fecha_revision, importe)
	VALUES('03', 30000, '01', '2022-07-03', 85);
	
INSERT INTO keepcoches.revision 
	(id_coche, km, id_moneda, fecha_revision, importe)
	VALUES('04', 20000, '01', '2022-08-04', 85);
	
INSERT INTO keepcoches.revision 
	(id_coche, km, id_moneda, fecha_revision, importe)
	VALUES('05', 10000, '01', '2022-06-06', 100);


--EmpresaAseguradora:
INSERT INTO keepcoches.empresaaseguradora 
	(id_companiaaseg, compania_aseguradora)
	VALUES('01', 'MAPFRE');

INSERT INTO keepcoches.empresaaseguradora 
	(id_companiaaseg, compania_aseguradora)
	VALUES('02', 'AXA');
	
INSERT INTO keepcoches.empresaaseguradora 
	(id_companiaaseg, compania_aseguradora)
	VALUES('03', 'ALLIANZ');

--PolizaCoche:
INSERT INTO keepcoches.polizacoche 
	(id_poliza, id_coche, id_companiaaseg, num_poliza)
	VALUES('152', '01', '01', '4500152');
	
INSERT INTO keepcoches.polizacoche 
	(id_poliza, id_coche, id_companiaaseg, num_poliza)
	VALUES('221', '02', '02', '22154221');

INSERT INTO keepcoches.polizacoche 
	(id_poliza, id_coche, id_companiaaseg, num_poliza)
	VALUES('033', '03', '02', '0334033');
	
INSERT INTO keepcoches.polizacoche 
	(id_poliza, id_coche, id_companiaaseg, num_poliza)
	VALUES('015', '04', '03', '200015');
	
INSERT INTO keepcoches.polizacoche 
	(id_poliza, id_coche, id_companiaaseg, num_poliza)
	VALUES('488', '05', '01', '006448');
	
-------------

-- Consulta SQL: 
-- Nombre modelo, marca y grupo de coches (los nombre de todos)
-- Fecha de compra
-- Matricula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza
	
-------------
	
SELECT mo.modelo, m.marca, g.empresa, c.fecha_compra, c.matricula, col.descripcion_color, c.km_total, e.compania_aseguradora, p.num_poliza
	FROM keepcoches.grupoempresarial g
	JOIN keepcoches.marca m ON m.id_empresa = g.id_empresa  
	JOIN keepcoches.modelo mo ON mo.id_marca = m.id_marca 
	JOIN keepcoches.coches c ON c.id_modelo = mo.id_modelo
	JOIN keepcoches.color col ON c.id_color = col.id_color 
	JOIN keepcoches.polizacoche p ON p.id_coche = c.id_coche
	JOIN keepcoches.empresaaseguradora e ON e.id_companiaaseg = p.id_companiaaseg 
	;
	

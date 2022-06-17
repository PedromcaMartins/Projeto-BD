--1.BASE DE DADOS

CREATE DATABASE vendingmachineDB; 

--ESQUEMA

create table categoria (
    nome    varchar(255),
    primary key(name)
);

create table categoria_simples(
    nome    varchar(255),
    primary key(nome),
    foreign key(nome)references categoria(nome)
);

create table super_categoria(
    nome    varchar(255),
    primary key(nome),
    foreign key(nome)references categoria(nome)
);

create  table tem_outra(
    super_categoria varchar(255),
    categoria   varchar(255),
    primary key(categoria),
    foreign key(super_categoria) references super_categoria(super_categoria), --FIXME #2
    foreign key(categoria) references categoria(categoria)
);

create table produto (
    ean float,
    cat varchar(255),
    descr   varchar(255),
    primary key(ean),
    foreign key(cat) references categoria(cat)--FIXME #2
);

create table tem_categoria(
    ean float,
    nome    varchar(255),
    foreign key(ean) references produto(ean),
    foreign key(nome) references categoria(nome)
);

create table IVM(
    num_serie   float,
    fabricante  varchar(255),
    primary key(num_serie, fabricante)
);

create table ponto_de_retalho(
    nome    varchar(255),
    distrito    varchar(255),
    concelho    varchar(255),
    primary key(nome)
);

create table instalada_em(
    num_serie   float,
    fabricante  varchar(255),
    local   varchar(255), --FIXME #3
    primary key(num_serie, fabricante),
    foreign key(local) references ponto_de_retalho(local) --FIXME
);

create table prateleira(
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    altura  decimal(2,3),
    nome    varchar(255),
    primary key(nro, num_serie,fabricante),
    foreign key(num_serie) references IVM(num_serie),
    foreign key(fabricante) references IVM(fabricante),
    foreign key(nome) references categoria(nome)
);

create table planograma(
    ean float,
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    faces   smallint,
    unidades    smallint,
    loc     varchar(255),
    primary key (ean, nro, num_serie, fabricante),
    foreign key(ean) references produto(ean),
    foreign key(nro) references prateleira(nro),
    foreign key(num_serie) references prateleira(num_serie),
    foreign key(fabricante) references prateleira(fabricante)
);

create table retalhista(
    tin float,
    name varchar(255) UNIQUE, --FIXME #4
    primary key(tin)
);

create table responsavel_por(
    nome_cat    varchar(255),
    tin float,
    num_serie   float,
    fabricante varchar(255),
    primary key(num_serie,fabricante),
    foreign key(tin) references retalhista(tin),
    foreign key(nome_cat) references categoria(nome_cat) --FIXME
);

create table evento_reposicao(
    ean float,
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    instante    decimal(4,3), --FIXME
    unidades    smallint,
    tin float,
    primary key(ean, nro, num_serie, fabricante, instante),
    foreign key(ean) references planograma(ean),
    foreign key(nro) references planograma(nro),
    foreign key(num_serie) references planograma(num_serie),
    foreign key(fabricante) references planograma(fabricante),
    foreign key(tin) references retalhista(tin)
);

--CARREGAMENTO

--categorias
insert into categoria values('Sumos');
insert into categoria values('Sumos Naturais');
insert into categoria values('Batatas Fritas');
insert into categoria values('Batatas Fritas de Beterraba');
insert into categoria values('Batatas Fritas de Bacon');
insert into categoria values('Bolachas');
insert into categoria values('Bolachas de Chocolate');
insert into categoria values('Bolachas de Aveia');
insert into categoria values('Barras de Cereais');
insert into categoria values('Barras Energeticas');
insert into categoria values('Pastilhas de Menta');
insert into categoria values('Pastilhas de Morango');
insert into categoria values('Waffles');
insert into categoria values('Gomas');
insert into categoria values('Agua');
insert into categoria values('Barras');
insert into categoria values('Pastilhas');
insert into categoria values('Doces');
insert into categoria values('Refrigerantes');
insert into categoria values('Bebidas');

--categorias simples
insert into categoria_simples values('Sumos Naturais');
insert into categoria_simples values('Refrigerantes');
insert into categoria_simples values('Batatas Fritas de Beterraba');
insert into categoria_simples values('Batatas Fritas de Bacon');
insert into categoria_simples values('Bolachas de Chocolate');
insert into categoria_simples values('Bolachas de Aveia');
insert into categoria_simples values('Barras de Cereais');
insert into categoria_simples values('Barras Energeticas');
insert into categoria_simples values('Pastilhas de Menta');
insert into categoria_simples values('Pastilhas de Morango');
insert into categoria_simples values('Waffles');
insert into categoria_simples values('Gomas');
insert into categoria_simples values('Agua');

--super categorias
insert into super_categoria values('Sumos');
insert into super_categoria values('Batatas Fritas');
insert into super_categoria values('Bolachas');
insert into super_categoria values('Barras');
insert into super_categoria values('Pastilhas');
insert into super_categoria values('Doces');
insert into super_categoria values('Bebidas');

--tem outra
insert into tem_outra values('Sumos','Sumos Naturais');
insert into tem_outra values('Sumos','Refrigerantes');
insert into tem_outra values('Batatas Fritas','Batatas Fritas de Beterraba');
insert into tem_outra values('Batatas Fritas','Batatas Fritas de Bacon');
insert into tem_outra values('Bolachas','Bolachas de Chocolate');
insert into tem_outra values('Bolachas','Bolachas de Aveia');
insert into tem_outra values('Barras','Barras de Cereais');
insert into tem_outra values('Barras','Barras Energeticas');
insert into tem_outra values('Pastilhas','Pastilhas de Menta');
insert into tem_outra values('Pastilhas','Pastilhas de Morango');
insert into tem_outra values('Doces','Waffles');
insert into tem_outra values('Doces','Gomas');
insert into tem_outra values('Bebidas','Sumos');
insert into tem_outra values('Bebidas','Agua');

--produto
insert into produto values(1234567891201,'Sumos Naturais','Compal de Laranja');
insert into produto values(1234567891202,'Sumos Naturais','Compal de Manga');
insert into produto values(1234567891203,'Refrigerantes','Fanta');
insert into produto values(1234567891204,'Refrigerantes','Sumol');
insert into produto values(1234567891205,'Batatas Fritas de Beterraba','Ruffles De Beterraba Artesanais');
insert into produto values(1234567891206,'Batatas Fritas de Bacon','Lays de Bacon');
insert into produto values(1234567891207,'Bolachas de Chocolate','Milka');
insert into produto values(1234567891208,'Bolachas de Chocolate','Oreos');
insert into produto values(1234567891209,'Bolachas de Aveia','Digestive');
insert into produto values(1234567891210,'Barras de Cereais','Kellog');
insert into produto values(1234567891211,'Barras Energeticas','Prozis');
insert into produto values(1234567891212,'Pastilhas de Menta','Trident Menta');
insert into produto values(1234567891213,'Pastilhas de Morango','Trident Morango');
insert into produto values(1234567891214,'Waffles','Waffles com mel');
insert into produto values(1234567891215,'Gomas','Gomas minhocas');
insert into produto values(1234567891216,'Agua','Luso');

--Tem categoria
insert into tem_categoria values(1234567891201,'Sumos Naturais');
insert into tem_categoria values(1234567891202,'Sumos Naturais');
insert into tem_categoria values(1234567891203,'Refrigerantes');
insert into tem_categoria values(1234567891204,'Refrigerantes');
insert into tem_categoria values(1234567891205,'Batatas Fritas de Beterraba');
insert into tem_categoria values(1234567891206,'Batatas Fritas de Bacon');
insert into tem_categoria values(1234567891207,'Bolachas de Chocolate');
insert into tem_categoria values(1234567891208,'Bolachas de Chocolate');
insert into tem_categoria values(1234567891209,'Bolachas de Aveia');
insert into tem_categoria values(1234567891210,'Barras de Cereais');
insert into tem_categoria values(1234567891211,'Barras Energeticas');
insert into tem_categoria values(1234567891212,'Pastilhas de Menta');
insert into tem_categoria values(1234567891213,'Pastilhas de Morango');
insert into tem_categoria values(1234567891214,'Waffles');
insert into tem_categoria values(1234567891215,'Gomas');
insert into tem_categoria values(1234567891216,'Agua');

--IVM
insert into IVM values(111111,'Fabricante 1');
insert into IVM values(222222,'Fabricante 2');
insert into IVM values(333333,'Fabricante 1');
insert into IVM values(444444,'Fabricante 2');
insert into IVM values(555555,'Fabricante 1');
insert into IVM values(666666,'Fabricante 1');

--ponto de retalho
insert into ponto_de_retalho values('Colombo','Lisboa','Lisboa');
insert into ponto_de_retalho values('Vasco Da Gama','Lisboa','Lisboa');
insert into ponto_de_retalho values('Forum Aveiro','Aveiro','Aveiro');
insert into ponto_de_retalho values('Centro de Congressos','Coimbra','Coimbra');

--instalda em
insert into instalada_em values(111111,'Fabricante 1','Colombo');
insert into instalada_em values(222222,'Fabricante 2','Colombo');
insert into instalada_em values(333333,'Fabricante 1','Vasco Da Gama');
insert into instalada_em values(444444,'Fabricante 2','Vasco Da Gama');
insert into instalada_em values(555555,'Fabricante 1','Forum Aveiro');
insert into instalada_em values(666666,'Fabricante 1','Centro de Congressos');

--prateleira
insert into prateleira values(1,111111,'Fabricante 1', 15, 'Sumos');
insert into prateleira values(2,111111,'Fabricante 1', 15, 'Agua');
insert into prateleira values(3,111111,'Fabricante 1', 15, 'Doces');
insert into prateleira values(4,111111,'Fabricante 1', 5, 'Pastilhas');
insert into prateleira values(5,111111,'Fabricante 1', 15, 'Batatas Fritas');
insert into prateleira values(6,111111,'Fabricante 1', 10, 'Barras');

insert into prateleira values(1,222222,'Fabricante 2', 20, 'Sumos');
insert into prateleira values(2,222222,'Fabricante 2', 15, 'Bebidas');
insert into prateleira values(3,222222,'Fabricante 2', 15, 'Batatas Fritas');
insert into prateleira values(4,222222,'Fabricante 2', 15, 'Bolachas');

insert into prateleira values(1,333333,'Fabricante 1', 15, 'Bolachas');
insert into prateleira values(2,333333,'Fabricante 1', 15, 'Barras');
insert into prateleira values(3,333333,'Fabricante 1', 15, 'Bebidas');
insert into prateleira values(4,333333,'Fabricante 1', 15, 'Pastilhas');
insert into prateleira values(5,333333,'Fabricante 1', 15, 'Batatas Fritas');

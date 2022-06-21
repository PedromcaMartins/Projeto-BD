--1.BASE DE DADOS

CREATE DATABASE vendingmachineDB; 

--ESQUEMA

create table categoria (
    nome_cat    varchar(255),
    primary key(nome_cat)
);

create table categoria_simples(
    nome_cat    varchar(255),
    primary key(nome_cat),
    foreign key(nome_cat)references categoria(nome_cat)
);

create table super_categoria(
    nome_cat    varchar(255),
    primary key(nome_cat),
    foreign key(nome_cat)references categoria(nome_cat)
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
    nome_cat varchar(255),
    descr   varchar(255),
    primary key(ean),
    foreign key(nome_cat) references categoria(nome_cat)--FIXME #2
);

create table tem_categoria(
    ean float,
    nome_cat    varchar(255),
    foreign key(ean) references produto(ean),
    foreign key(nome_cat) references categoria(nome_cat)
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
    localidade   varchar(255), --FIXME #3
    primary key(num_serie, fabricante),
    foreign key(localidade) references ponto_de_retalho(localidade) --FIXME
);

create table prateleira(
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    altura  decimal(2,2),
    nome_cat    varchar(255),
    primary key(nro, num_serie,fabricante),
    foreign key(num_serie) references IVM(num_serie),
    foreign key(fabricante) references IVM(fabricante),
    foreign key(nome_cat) references categoria(nome_cat)
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



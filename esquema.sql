drop table tem_outra;
drop table tem_categoria;
drop table instalada_em;
drop table responsavel_por;
drop table evento_reposicao;
drop table planograma;
drop table prateleira;
drop table retalhista;
drop table produto;
drop table categoria_simples;
drop table super_categoria;
drop table categoria;
drop table IVM;
drop table ponto_de_retalho;
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
    nome_cat_super  varchar(255),
    nome_cat   varchar(255),
    primary key(nome_cat),
    foreign key(nome_cat) references categoria(nome_cat),
    foreign key(nome_cat_super) references super_categoria(nome_cat)
);

create table produto (
    ean float,
    nome_cat varchar(255),
    descr   varchar(255),
    primary key(ean),
    foreign key(nome_cat) references categoria(nome_cat)
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
    nome   varchar(255), --FIXME #3
    primary key(num_serie, fabricante),
    foreign key(nome) references ponto_de_retalho(nome) 
);

create table prateleira(
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    altura  decimal(2,2),
    nome_cat    varchar(255),
    primary key(nro, num_serie,fabricante),
    foreign key(num_serie, fabricante) references IVM(num_serie, fabricante),
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
    foreign key(nro, num_serie, fabricante) references prateleira(nro, num_serie, fabricante)
);

create table retalhista(
    tin float,
    nome varchar(255) UNIQUE,
    primary key(tin)
);

create table responsavel_por(
    nome_cat    varchar(255),
    tin float,
    num_serie   float,
    fabricante varchar(255),
    primary key(num_serie,fabricante),
    foreign key(tin) references retalhista(tin),
    foreign key(nome_cat) references categoria(nome_cat)
);

create table evento_reposicao(
    ean float,
    nro smallint,
    num_serie   float,
    fabricante  varchar(255),
    instante    date,
    unidades    smallint,
    tin float,
    primary key(ean, nro, num_serie, fabricante, instante),
    foreign key(ean, nro, num_serie, fabricante) references planograma(ean, nro, num_serie, fabricante),
    foreign key(tin) references retalhista(tin)
);



--CARREGAMENTO

--categorias
insert into categoria values('Sumos');
insert into categoria values('Sumos Naturais');
insert into categoria values('Batatas Fritas');
insert into categoria values('Batatas Fritas de Beterraba');
insert into categoria values('Batatas Fritas de Bacon Vegan');
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
insert into categoria_simples values('Batatas Fritas de Bacon Vegan');
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
insert into tem_outra values('Batatas Fritas','Batatas Fritas de Bacon Vegan');
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
insert into produto values(1234567891206,'Batatas Fritas de Bacon Vegan','Lays de Bacon Vegan');
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

--ponto de retalho
insert into ponto_de_retalho values('Colombo','Lisboa','Lisboa');
insert into ponto_de_retalho values('Vasco Da Gama','Lisboa','Lisboa');
insert into ponto_de_retalho values('Forum Aveiro','Aveiro','Aveiro');

--instalda em
insert into instalada_em values(111111,'Fabricante 1','Colombo');
insert into instalada_em values(333333,'Fabricante 1','Vasco Da Gama');
insert into instalada_em values(222222,'Fabricante 1','Forum Aveiro');
insert into instalada_em values(444444,'Fabricante 1','Colombo');

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

insert into prateleira values(1,444444,'Fabricante 2', 15, 'Batatas Fritas');
insert into prateleira values(2,444444,'Fabricante 2', 15, 'Bolachas');
insert into prateleira values(3,444444,'Fabricante 2', 15, 'Doces');
insert into prateleira values(4,444444,'Fabricante 2', 15, 'Aguas');
insert into prateleira values(5,444444,'Fabricante 2', 15, 'Sumos');
insert into prateleira values(6,444444,'Fabricante 2', 15, 'Pastilhas');

--planograma
insert into planograma values(1234567891201, 1, 111111, 'Fabricante 1', 1, 10, 'Colombo'); -- loc check w/dani
insert into planograma values(1234567891201, 1, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891201, 5, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891202, 1, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891202, 5, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891203, 1, 111111, 'Fabricante 1', 1, 10, 'Colombo');

insert into planograma values(1234567891204, 1, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');

insert into planograma values(1234567891205, 5, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891205, 3, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891205, 5, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');

insert into planograma values(1234567891206, 5, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891206, 5, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891206, 1, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891207, 4, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891207, 1, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891207, 2, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891208, 4, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891208, 1, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891208, 2, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891209, 4, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891209, 1, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891209, 2, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891210, 6, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891210, 2, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');

insert into planograma values(1234567891211, 6, 111111, 'Fabricante 1', 1, 10, 'Colombo');

insert into planograma values(1234567891212, 4, 111111, 'Fabricante 1', 1, 10, 'Colombo');

insert into planograma values(1234567891213, 4, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891213, 6, 444444, 'Fabricante 2', 1, 10, 'Colombo');
insert into planograma values(1234567891213, 4, 111111, 'Fabricante 1', 1, 10, 'Colombo');

insert into planograma values(1234567891214, 3, 111111, 'Fabricante 1', 1, 10, 'Colombo');

insert into planograma values(1234567891215, 3, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891215, 3, 444444, 'Fabricante 2', 1, 10, 'Colombo');

insert into planograma values(1234567891216, 2, 111111, 'Fabricante 1', 1, 10, 'Colombo');
insert into planograma values(1234567891216, 2, 222222, 'Fabricante 2', 1, 10, 'Vasco Da Gama');
insert into planograma values(1234567891216, 3, 333333, 'Fabricante 1', 1, 10, 'Forum Aveiro');
insert into planograma values(1234567891216, 4, 444444, 'Fabricante 2', 1, 10, 'Colombo');

--retalhista
insert into retalhista values(123456701, 'ABC');
insert into retalhista values(123456702, 'DEF');
insert into retalhista values(123456703, 'GHI');

--responsavel por
insert into responsavel_por values(123456701, 111111, 'Fabricante 1');
insert into responsavel_por values(123456701, 222222, 'Fabricante 2');
insert into responsavel_por values(123456702, 333333, 'Fabricante 1');
insert into responsavel_por values(123456703, 444444, 'Fabricante 2');

--evento reposicao
insert into evento_reposicao values(1234567891201, 1, 111111, 'Fabricante 1', '2022-02-09 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891202, 1, 111111, 'Fabricante 1', '2022-02-10 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891203, 1, 111111, 'Fabricante 1', '2022-02-11 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891204, 1, 222222, 'Fabricante 2', '2022-02-12 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891205, 3, 222222, 'Fabricante 2', '2022-08-13 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891206, 5, 111111, 'Fabricante 1', '2022-02-14 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891207, 4, 222222, 'Fabricante 2', '2022-01-15 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891208, 4, 222222, 'Fabricante 2', '2022-02-16 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891209, 4, 222222, 'Fabricante 2', '2022-11-17 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891210, 6, 111111, 'Fabricante 1', '2022-02-18 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891211, 6, 111111, 'Fabricante 1', '2022-02-19 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891212, 4, 111111, 'Fabricante 1', '2022-07-20 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891213, 4, 111111, 'Fabricante 1', '2022-02-21 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891214, 3, 111111, 'Fabricante 1', '2022-02-22 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891215, 3, 111111, 'Fabricante 1', '2022-05-23 07:00:00', 5, 123456701);
insert into evento_reposicao values(1234567891216, 2, 111111, 'Fabricante 1', '2022-02-24 07:00:00', 5, 123456701);

insert into evento_reposicao values(1234567891210, 2, 333333, 'Fabricante 1', '2022-11-01 07:00:00', 5, 123456702);
insert into evento_reposicao values(1234567891216, 3, 333333, 'Fabricante 1', '2022-02-01 07:00:00', 5, 123456702);

insert into evento_reposicao values(1234567891216, 4, 444444, 'Fabricante 2', '2022-02-02 07:00:00', 5, 123456703);

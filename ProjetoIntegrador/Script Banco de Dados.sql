create database projetointegrador4;

use projetointegrador4;

-- ---------------------------------- criação das tabelas --------------------------------------------------

create table categoria(
id int primary key auto_increment,
categoria char(13) not null
);

create table usuario(
id int primary key auto_increment,
nome varchar(50) not null,
telefone varchar(50) not null,
email varchar(30) unique not null,
nascimento Date not null,
id_categoria int not null,
cpf varchar(30) unique not null,
senha varchar(80) not null,
ativo bit not null
);

create table produto(
código int primary key auto_increment,
nome varchar(200),
quantidade int(11),
avaliacao float,
valor double,
ativo bit,
descricao varchar(500)
);

create table imagem(
codigo_produto int,
nome_imagem varchar(100),
caminho varchar(100)
);

create table cliente(
id int primary key auto_increment,
usuario varchar(150),
nome varchar(150),
cpf varchar(30),
nascimento date,
genero varchar(100),
senha varchar(80)
);

create table endereco_cliente(
id int primary key auto_increment,
id_cliente int,
CEP varchar(100),
logradouro varchar(100),
Número bigint,
complemento varchar(100),
bairro varchar(100),
cidade varchar(100),
uf char(2)
);


create table pedido(
 id int primary key auto_increment,
 id_cliente int not null,
 id_endereco int not null,
 forma_pagamento varchar(100) not null,
 frete double not null,
 valor double not null,
 data date not null,
 status varchar(100) not null
);

create table lista(
id_pedido int not null,
id_produto int not null,
quantidade int not null,
valor double not null
);

-- ---------------------------------------------------Constraints-------------------------------------------

Alter table usuario add constraint fk_usuario_categoria foreign key usuario(id_categoria) 
references categoria(id);

alter table endereco_cliente add constraint fk_endereco_cliente_cliente 
foreign key endereco_cliente(id_cliente) references cliente(id);

alter table carrinho add constraint  fk_carrinho_cliente foreign key carrinho(id_cliente) 
references cliente(id);

alter table carrinho add constraint  fk_carrinho_produto foreign key carrinho(id_produto) 
references produto(código);

alter table pedido add constraint  fk_pedido_cliente foreign key pedido(id_cliente) 
references cliente(id);

alter table pedido add constraint  fk_pedido_endereco foreign key pedido(id_endereco) 
references endereco_cliente(id);

alter table cliente add constraint check_sexo check (genero = 'Masculino' or genero= 'Feminino'
or genero = 'Outros');

-- ------------------------------------------------ Procedures ---------------------------------------------

delimiter $

CREATE PROCEDURE sp_altStatus(cpf_aux varchar(50))
begin

declare _status int;

set _status = (select ativo from usuario where cpf = cpf_aux);

update usuario set ativo = (select case when _status = 1 then 0 else 1 end) where cpf = cpf_aux;


end $

delimiter ;

delimiter $

CREATE PROCEDURE sp_altStatusProduto(id int)
begin

declare _status int;

set _status = (select ativo from produto where código = id);

update produto set ativo = (select case when _status = 1 then 0 else 1 end)
where código = id;

end $

delimiter ;

delimiter $

CREATE PROCEDURE sp_getProdutos(contador int)
begin

if contador = 0
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 10;

end if;

if contador = 1
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 10,10;

end if;

if contador = 2
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 20,10;

end if;

if contador = 3
then

select p.código codigo
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.valor
       , case when p.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from produto p
order by p.código desc
LIMIT 30,10;

end if;

end $

delimiter ;

delimiter $

CREATE PROCEDURE sp_getUsuario(contador int)
begin

if contador = 0
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.cpf
       ,u.email
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10;

end if;

if contador = 1
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10,10;

end if;

if contador = 2
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 20,10;

end if;

if contador = 3
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 30,10;

end if;

end $

delimiter ;

delimiter $

CREATE PROCEDURE sp_inserirCliente(email varchar(250),nome varchar(100), cpf varchar(30)
				,Nascimento datetime,Genero varchar(100),Senha varchar(100), cep varchar(10)
                ,rua varchar(500), numero bigint, complemento varchar(500), bairro varchar(100)
                ,cidade varchar(100), uf varchar(2))
begin

insert into cliente values(null,email,nome,cpf,Nascimento,Genero,Senha);

insert into endereco_cliente values(null,(select max(id) from cliente),cep,rua,numero,complemento,bairro,cidade,uf);

end $

delimiter ;

delimiter $

CREATE PROCEDURE sp_getPedidos(contador int)
begin

if contador = 0
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.cpf
       ,u.email
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10;

end if;

if contador = 1
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10,10;

end if;

if contador = 2
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 20,10;

end if;

if contador = 3
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativo' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 30,10;

end if;

end $

delimiter ;

-- ------------------------------------------------------Inserts--------------------------------------------------
insert into categoria values(null,'administrador'),
							(null,'estoquista');

insert into usuario values(null,'Douglas Proença Rolim de Souza','(11)95436-0397','Douglasp.r.desouza@gmail.com','1998-04-04',1,'488.654.963-78','$2a$08$fH2uvGnb70vzY7jS.vSn4OLEjjRE6u7J.Zpwh7Oa8FfQjyVCz6Qoq',1),
						  (null,'Rafael Gomes Camilo','(11)94002-8922','Rafa.gomes@gmail.com','1986-04-04',2,'488.654.963-70','$2a$08$1BdA7ANRBwhdnpWeE4UBM.38Iej0g8SAGCJALeEoOwTDFshQJlo8W',1);

                            
insert into produto values (1,'Samsung Galaxy S21',10,5,40000,1,'O Galaxy S21 Ultra 5G é extraordinário em cada detalhe.'),
						   (2,'Samsung Galaxy S22',10,5,40000,1,'O Samsung Galaxy S22 5G é um smartphone Android de bom nível, ótimo para fotos, que pode satisfazer até o mais exigente dos usuários.'),
						   (3,'Samsung Galaxy S22 Ultra',10,5,40000,1,'Smartphone Samsung Galaxy S22 Ultra com 256GB, 12GB ram e Tela Infinita de 6,8.'),
						   (4,'Apple Iphone 11',10,5,40000,1,'É o IPhone com preço mais baixo da décima terceira geração, sucedendo ao IPhone XR.'),
						   (5,'Apple Iphone 13',10,5,40000,1,'IPhone 13. O sistema de câmera dupla mais avançado em um iPhone.'),
						   (6,'Apple Iphone 12',10,5,40000,1,'A14 Bionic, o chip mais rápido em um smartphone. Tela OLED de ponta a ponta.');
                            
insert into imagem values (1,'s21-rosa.jpg','Resources/s21-rosa.jpg'),
                          (1,'s21-violeta.jpg','Resources/s21-violeta.jpg'),
						  (1,'s21-cinza.jpg','Resources/s21-cinza.jpg'),
	                      (1,'s21-branco.jpg','Resources/s21-branco.jpg'),
                          (2,'s22-preto.jpg','Resources/s22-preto.jpg'),
                          (2,'s22-branco.jpg','Resources/s22-branco.jpg'),
                          (2,'s22-rose.jpg','Resources/s22-rose.jpg'),
                          (2,'s22-verde.jpg','Resources/s22-verde.jpg'),
                          (3,'s22-ultra-branco.jpg','Resources/s22-ultra-branco.jpg'),
                          (3,'s22-ultra-preto.jpg','Resources/s22-ultra-preto.jpg'),
                          (3,'s22-ultra-verde.jpg','Resources/s22-ultra-verde.jpg'),
                          (3,'s22-ultra-vinho.jpg','Resources/s22-ultra-vinho.jpg'),
                          (4,'iphone11-black-select-2019.png','Resources/iphone11-black-select-2019.png'),
                          (4,'iphone11-green-select-2019.png','Resources/iphone11-green-select-2019.png'),
                          (4,'iphone11-purple-select-2019','Resources/iphone11-purple-select-2019.png'),
                          (4,'iphone11-red-select-2019.png','Resources/iphone11-red-select-2019.png'),
                          (4,'iphone11-white-select-2019.png','Resources/iphone11-white-select-2019.png'),
                          (4,'iphone11-yellow-select-2019.png','Resources/iphone11-yellow-select-2019.png'),
                          (5,'iphone-13-blue-select-2021.png','Resources/iphone-13-blue-select-2021.png'),
                          (5,'iphone-13-green-select.png','Resources/iphone-13-green-select.png'),
                          (5,'iphone-13-midnight-select-2021.png','Resources/iphone-13-midnight-select-2021.png'),
                          (5,'iphone-13-pink-select-2021.png','Resources/iphone-13-pink-select-2021.png'),
                          (5,'iphone-13-product-red-select-2021.png','Resources/iphone-13-product-red-select-2021.png'),
                          (6,'iphone-12-black-select-2020.png','Resources/iphone-12-black-select-2020.png'),
                          (6,'iphone-12-blue-select-2020.png','Resources/iphone-12-blue-select-2020.png'),
                          (6,'iphone-12-green-select-2020.png','Resources/iphone-12-green-select-2020.png'),
                          (6,'iphone-12-purple-select-2021.png','Resources/iphone-12-purple-select-2021.png'),
                          (6,'iphone-12-red-select-2020.png','Resources/iphone-12-red-select-2020.png'),
                          (6,'iphone-12-white-select-2020.png','Resources/iphone-12-white-select-2020.png');
                          
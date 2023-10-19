create database projetointegrador4;

use projetointegrador4;

create table categoria(
id int primary key auto_increment,
categoria char(13) not null
);

insert into categoria values(null,'administrador'),
							(null,'estoquista');

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

Alter table usuario add constraint fk_usuario_categoria foreign key usuario(id_categoria) references categoria(id);

insert into usuario values(null,'Douglas Proença Rolim de Souza','(11)95436-0397','Douglasp.r.desouza@gmail.com','1998-04-04',1,'488.654.963-78','$2a$08$fH2uvGnb70vzY7jS.vSn4OLEjjRE6u7J.Zpwh7Oa8FfQjyVCz6Qoq',1),
						  (null,'Rafael Gomes Camilo','(11)94002-8922','Rafa.gomes@gmail.com','1986-04-04',2,'488.654.963-70','$2a$08$1BdA7ANRBwhdnpWeE4UBM.38Iej0g8SAGCJALeEoOwTDFshQJlo8W',1);

select * from usuario;

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativos' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome;

update usuario set ativo = 1 where id = 3;

select * from usuario;

call sp_al

delimiter $

create procedure sp_altStatus (cpf_aux varchar(50))
begin

declare _status int;

set _status = (select ativo from usuario where cpf = cpf_aux);

update usuario set ativo = (select case when _status = 1 then 0 else 1 end);


end $
delimiter ;

create table produto(
código int primary key auto_increment,
 nome varchar(200) not null,
 quantidade int not null,
 avaliacao float(24,1),
 valor double(24,2) not null,
 ativo bit not null 
);

delimiter $
create procedure sp_getUsuario(contador int)
begin

if contador = 0
then

select u.id
       ,u.nome
       ,u.telefone
       ,u.nascimento
       ,c.categoria
	   ,u.email
       ,u.cpf
       ,u.senha
       , case when u.ativo = 1 then 'Ativo' else 'Não Ativos' end ativo
from usuario u
inner join categoria c
on c.id = u.id_categoria
order by u.nome
LIMIT 10;

end if;

if contador = 1
then

select p.código
       ,p.nome
       ,p.quantidade
       ,p.avaliacao
       ,p.categoria
       ,u.cpf
       ,u.email
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
create procedure sp_getProdutos(contador int)
begin

if contador = 0
then

select p.código
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

select p.código
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

select p.código
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

select p.código
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

select * from produto;

insert into produto values(null,'Smart Tv Samsung',100,10,1000.99,1);
insert into produto values(null,'Samsung Galaxy S10',100,10,800.60,1);

delimiter $

create procedure sp_altStatusProduto (id int)
begin

declare _status int;

set _status = (select ativo from produto where código = id);

update produto set ativo = (select case when _status = 1 then 0 else 1 end) 
where código = id;


end $
delimiter ;

call sp_altStatusProduto(2)
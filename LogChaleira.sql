drop database if exists Usuarios; 

create database Usuarios; 

use Usuarios; 

create table cadastro ( 

id			int				primary key 		auto_increment 		unique		not null, 

nome 		varchar (60), 

cpf 		varchar (60), 

rg 			varchar(60), 

email 		varchar(60), 

telefone  	varchar(60),

senha		varchar(60)
); 

create table produto( 

id_produto	int		primary key 		auto_increment		unique 		not null,

imagem_produto varchar(120), 

nome_produto varchar(120), 

descri_produto varchar(684), 

preco_produto decimal(20,2) ,

FK_vendedor int references cadastro (id)

); 

create table Log_deletions (
id		int 		primary key		auto_increment,
nome_produto 	varchar(60),
ultima_atualizacao	datetime,
quem	varchar(40)
);

create table Log_inserts (
id		int		primary key		auto_increment,
nome_produto	varchar(60),
ultimo_insert	datetime,
quem	varchar(60)
);

delimiter $

create trigger Log_deletions after delete on produto
	for each row
    begin insert into Log_deletions values (null,old.nome_produto, sysdate(),user());

end$

delimiter ;

delimiter $

create trigger Log_inserts after insert on produto
	for each row
    begin insert into Log_inserts values (null,new.nome_produto, sysdate(),user());

end$

delimiter ;

insert into produto values (null,'URL','Chaleira','Muitas palavras',500.00,null);

delete from produto where id_produto =1;

select * from Log_inserts;

select * from Log_deletions;
CREATE DATABASE  IF NOT EXISTS fabrica ;
USE fabrica;
DROP TABLE IF EXISTS cadastro;

CREATE TABLE cadastro (
  id 			int(11) 		NOT NULL 	AUTO_INCREMENT		primary key,
  nome 			varchar(45) NOT NULL,
  email 		varchar(60)	NOT NULL,
  senha			varchar(60)	NOT NULL
);

DROP TABLE IF EXISTS produto;
create table produto( 

id_produto		int		primary key 		auto_increment		unique 		not null, 

imagem_produto varchar(120), 

nome_produto 	varchar(120), 

descri_produto 	varchar(684), 

preco_produto 	varchar(60),

FK_vendedor 	int references cadastro (id)

); 





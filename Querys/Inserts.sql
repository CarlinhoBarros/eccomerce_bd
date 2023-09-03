use ecommerce;

		-- inserts
insert into Perfil(Nome, Contato, Endereco) values
	('Maria M Silva', 1122223333, 'rua silva de prata 29, Carangola - Cidade das flores'),
    ('Matheus O Pimentel', 4455556666,'rua alemeda 289, Centro - Cidade das flores'),
    ('Ricardo F Silva', 7788889999,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
    ('Julia S França', 2233334444,'rua lareijras 861, Centro - Cidade das flores'),
    ('Roberta G Assis', 5566667777,'avenidade koller 19, Centro - Cidade das flores'),
    ('Isabela M Cruz', 8899990000,'rua alemeda das flores 28, Centro - Cidade das flores'),
	('Tech eletronics', 2195678953,'rua alemeda das flores 28, Centro - Rio de Janeiro'),
    ('Botique Durgas', 2195678953,'rua alemeda das flores 28, Centro - Rio de Janeiro'),
    ('Kids World', 2195678953,'rua alemeda das flores 28, Centro - São Paulo');

insert into Cliente values
	(1, 5588888888),
    (2, 8899999999),
    (5, 1477777777),
    (6, 3155555555);

insert into Fornecedor values
	(3, 'Almeida e filhos', 438888999922244),
    (4, 'Eletrônicos Silva', 775555555533355);

insert into Vendedor(Id_perfil, Razao_social, CNPJ, CPF) values
	(7, null, 123456789456321, null),
    (8, null, 441132214000144, null),
    (9, 456789123654485, null, null);
-- vendedor que tambem é fornecedor
insert into Vendedor(Id_perfil, Razao_social, CNPJ, CPF) values
	(4, 'Eletrônicos Silva', 775555555533355, null);

insert into Estoque(Localizacao, Quantidade) values
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);

insert into Produto (Nome, Classificacao_infantil, Categoria, Avaliacao, Dimensao) values
	('Fone de ouvido',false,'Eletrônico','4',null),
    ('Barbie Elsa',true,'Brinquedos','3',null),
    ('Body Carters',true,'Vestimenta','5',null),
    ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
    ('Sofá retrátil',False,'Móveis','3','3x57x80'),
    ('Farinha de arroz',False,'Alimentos','2',null),
    ('Fire Stick Amazon',False,'Eletrônico','3',null);

insert into pagamento(Tipo, Limite_disponivel) values
	('Boleto', 0),
    ('Dois cartões', 50),
    ('Boleto', 0),
    ('Cartão', 0),
    ('Cartão', 0);

insert into local_armazenamento values
	(1,2,'RJ'),
    (2,6,'GO');

insert into fornecedor_do_produto values
	(3,1,500),
    (4,2,400),
    (4,4,633),
    (3,3,5),
    (3,5,10);

insert into vendedor_do_produto values
	(2,6,80),
    (3,7,10);

insert into Pedido(Id_cliente, _Status, Descricao, Frete, Id_pagamento) values
	(1, default,'compra via aplicativo',null,1),
    (2,default,'compra via aplicativo',50,2),
    (5,'Confirmado',null,null,3),
    (6,default,'compra via web site',150,5);

insert into Pedido(Id_cliente, _Status, Descricao, Frete, Id_pagamento) values
	(1, default,'compra via web site',30,1);


insert into pedido_do_produto() values
	(1,2,2,null),
    (2,3,1,null),
    (3,1,1,null);

		-- updates
update Vendedor
	-- set Razao_Social=null, CPF=456789123654485
    set CNPJ=null, CPF=45789145236
	where Id_perfil=9;

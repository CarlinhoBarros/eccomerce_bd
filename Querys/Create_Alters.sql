		-- criação do banco de dados ecommerce 
create database if not eXists ecommerce;
		-- acessando ecommerce
use ecommerce;

		-- criação das tabelas
-- tabela produto
create table produto(
		id_produto int auto_increment,
        Nome varchar(255) not null,
        Classificacao_infantil bool default false,
        Categoria enum('eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
        Avaliacao float default null, -- troquei '0' por 'null' para avaliar apenas qnd tiver nota
        Dimensao varchar(10),
        CONSTRaint pk_produto PRIMARy key(id_produto)
) auto_increment = 1;

-- tabela pagamento
create table pagamento(
	-- Id_cliente int not null,
    Id_pagamento int not null autO_inCremeNt,
    tipo enum('Boleto','cartão','Dois cartões'),
    Limite_disponivel float,
    -- ConstraINT pk_pagamento primary key(Id_cliente, Id_pagamento),
    -- constraint fk_cliente FOREIGN KEY(Id_cliente) REFERENCES Cliente(Id_cliente) on update cascade
    CONSTRAINT pk_pagamento primary key(Id_pagamento)
) AUTO_INCREMeNt=1;

-- tabela estoque
create table Estoque(
	id_estoque int auto_increment,
    localizacao varchar(255),
    quantidade int default 0,
    constraInt pk_estoque priMARY KEY(Id_estoque)
) auto_increment=1;

-- tabela perfil que irá gerar cliente, fornecedor e vendedor
create table Perfil(
	id_perfil int auto_increment,
    nome varchar(255) not null,
    Contato char(11) not null,
    Endereco varchar(255) not null,
	conStraInt pk_perfil primARY KEY(Id_perfil)
) auto_increment=1;

-- tabela cliente
create table Cliente(
		id_perfil int auto_increment,
        cpf char(11) not null,
        ConstrAINT pk_cliente priMARY KEY(Id_perfil),
        CONStrAINT fk_perfil foreIGN KEY(Id_perfil) refeRENCES Perfil(id_perfil),
        constraint unique_cpf_cliente unique (CPF)        
) auto_increment = 1;

-- tabela fornecedor
create table Fornecedor(
	id_perfil int auto_increment,
    razao_social varchar(255) not null,
    Cnpj char(15) not null,
    constraint unique_cnpj unique (CNPJ),
    coNsTRAInt pk_fornecedor PRIMARY KEY(Id_perfil),
    FOREIGN keY(Id_perfil) refeRENCES Perfil(id_perfil)
) auto_increment=1;

-- tabela vendedor
create table Vendedor(
	id_vendedor int auto_increment,
    id_perfil int,
    Nome_fantasia varchar(255),
    cnpj char(15),
    Cpf char(11),
    constraint unique_cnpj unique (CNPJ),
    constraint unique_cpf unique (CPF),
    conStRAInt pk_vendedor prIMARY KEY(Id_vendedor),
    FOREIGN keY(Id_perfil) refeRENCES Perfil(id_perfil)
) auto_increment=1;

-- modificar o campo CPF para receber 11 caracteres
alter table Vendedor modify COLUMN Cpf char(11);

-- tabela pedido
create table Pedido(
	id_pedido int auto_increment,
    id_cliente int,
    _Status enum('Cancelado','confirmado','processando') default 'Processando' not null,
    Descricao varchar(255),
    frete float default 10,
    -- paymentCash boolean default false, 
    Id_pagamento int not null, 
    conStrainT pk_pedido primARY KEY(Id_pedido),
    constraint fk_pagamento fOREIGN KEY(Id_pagamento) rEFERENCES Pagamento(id_pagamento) on UPDATE CAScAde,
    constraint fk_cliente foreign key (Id_cliente) references Cliente(id_perfil) on update cascade
) auto_increment=1;

-- tabelas de relacionamentos M:N
create table Vendedor_do_produto(
	Id_vendedor int not null,
    Id_produto int not null,
    Quantidade_produto int default 1,
    constraInt pk_vendedor_do_produto primary key (Id_vendedor, Id_produto),
    constraint fk_vendedor foreign key (Id_vendedor) references Vendedor(id_vendedor),
    constraint fk_produto foreign key (Id_produto) references Produto(id_produto)
);

create table Pedido_do_produto(
	Id_produto int not null,
    Id_pedido int not null,
    Quantidade int default 1,
    _status enum('Disponível', 'Sem estoque') default 'Disponível',
    CONSTRAINT pk_pedido_do_produto primary key (Id_produto, id_pedido),
    foreign key (Id_produto) references Produto(id_produto),
    foreign key (Id_pedido) references Pedido(id_pedido)
);

create table local_armazenamento(
	Id_produto int not null,
    id_estoque int not null,
    localizacao varchar(255) not null,
    coNstrAint pk_local_armazenamento primary key (Id_produto, id_estoque),
    foreign key (Id_produto) references Produto(id_produto),
    constraint fk_estoque foreign key (Id_estoque) references Estoque(id_estoque)
);

create table fornecedor_do_produto(
	Id_fornecedor int not null,
    id_produto int not null,
    quantidade int not null,
    constraint pk_fornecedor_do_produto primary key (Id_fornecedor, Id_produto),
    constraint fk_fornecedor foreign key (Id_fornecedor) references Fornecedor(id_perfil),
    -- foreign key (Id_produto) references Produto(Id_produto)
    foreign key (Id_produto) references Produto(id_produto) on update cascade
);


		-- Selects
use ecommerce;

	-- consultas simples
select * from perfil;
select * from Cliente;
select * from fornecedor;
select * from estoque;
select * from fornecedor_do_produto;
select * from local_armazenamento;
select * from pagamento;
select * from pedido;
select * from pedido_do_produto;
select * from produto;
select * from vendedor;
select * from vendedor_do_produto;

-- vendedores com venda
select Id_vendedor, Nome, CNPJ, CPF 
	from Vendedor
    INNER JOIN Perfil using(Id_perfil)
    inner join Vendedor_do_produto using(Id_vendedor)
    order by Nome;

-- vendedores sem venda
select Id_vendedor, CNPJ, CPF, Nome 
	from Vendedor
    INNER JOIN Perfil using(Id_perfil)
    left outer join Vendedor_do_produto as VP using(Id_vendedor)
    where VP.Id_vendedor is null;

-- quantos produtos cada fornecedor disponibilizou?
select Razao_social, sum(Quantidade) as Quantidade_total
	from  Fornecedor as F
    inner join fornecedor_do_produto as FP on F.Id_perfil = Id_fornecedor
    GROUP BY Razao_social
    ORDER BY Razao_social;

-- situação dos pedidos
select _Status, count(_Status) as Quantidade_pedidos from Pedido
	GROUP BY _Status;

-- Quantos pedidos foram feitos por cada cliente?
select Id_cliente, count(Id_cliente) as Pedidos
	from pedido
    GROUP BY Id_cliente;

-- Algum vendedor também é fornecedor?
select * from vendedor as V
	inner join fornecedor as F on V.CNPJ = F.CNPJ;

-- Relação de produtos fornecedores e estoques;


-- Relação de nomes dos fornecedores e nomes dos produtos;




	-- uteis
show tables;

SELECT * FROM information_schema.referential_constraints
WHERE CONSTRAINT_SCHEMA = 'ecommerce';

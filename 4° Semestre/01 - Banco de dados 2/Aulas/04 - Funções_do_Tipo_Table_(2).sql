use Vendas_BDII_ADS_ENC
go
-- Funções do Tipo Table - Tipo 2 --

-- Buscar um produto consirando o estoque --

create function getEstoque (@qtd int)
returns @prod table (codigo int, produto varchar(50),
                     estoque int, preco money)
as
begin
	insert into @prod 
	         select prd_codigo, prd_descricao, 
			        prd_qtd,    prd_valor
			 from produtos 
			 where prd_qtd >= @qtd
	insert into @prod values (500, 'Estojo', 50, 25) 
	return	     
end
go
-- Teste --
update produtos set prd_qtd = 5 where prd_codigo in (3,1)
select * from getEstoque(10)
go

------------------------------------------------------------

-- Buscar os itens de um pedido --

create function getPedItens (@pedido int)
returns @itens table (codigo int, produto varchar(50), qtd_vendida int,
                preco_unitario money, valor_item money)
as
begin
    insert into @itens
	       select ip.prd_codigo Codigo, p.prd_descricao Produto,
				  ip.itp_qtd Qtd_Vendida, ip.itp_valor Preco_Unitario,
				  ip.itp_qtd * ip.itp_valor Valor_Item
		  from itens_pedidos ip, produtos p
		  where ped_numero = @pedido and ip.prd_codigo = p.prd_codigo
	return
end
go

-- Teste --
select * from getPedItens(3)
select sum(valor_item) Total from getPedItens(3)
go


-- Buscar todos os pedidos de um cliente --

create function getPeds (@cliente int)
returns @ped table (pedido int, data datetime, 
                    total money, vendedor varchar(50))
as
begin
    insert into @ped 
	         select p.ped_numero Pedido, p.ped_data Data, 
					p.ped_valor Total,   f.pes_nome Vendedor 
			 from pedidos p, pessoas f
			where cli_codigo = @cliente and p.fun_codigo = f.pes_codigo
	return
end
go

-- Teste --
select * from getPeds (1)
select sum(total) Total from getPeds(1)


select * from getPeds (2)
go




---------------------------------------------------------------------
-- Aula 01 - Views: ped_total e v_pedidos
-- Aula 02 - Funções Escalares: reajustar e getTotal
-- Aula 03 - Funções do Tipo Table - Tipo 1: getItens e getPedCli
-- Aula 04 - Funções do Tipo Table - Tipo 2: getEstoque e getPedItens
---------------------------------------------------------------------





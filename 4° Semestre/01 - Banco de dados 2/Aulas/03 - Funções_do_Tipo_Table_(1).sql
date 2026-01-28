-- Funções do Tipo Table (1) --

create function getProdutos (@preco money)
returns table 
as
  return (select * from produtos  where prd_valor > @preco)
go

-- Teste --
select * from getProdutos(2)
go

create view v_prods
as
select * from produtos
go

-- Teste --
select * from v_prods where prd_valor > 2
go

select * from getProdutos(2)
go
------------------------------------

-- Buscar os itens de um pedido --
    

create function getItens (@pedido int)
returns table
as
return
(
	select ip.prd_codigo   Codigo,
		   p.prd_descricao Produto,
		   ip.itp_qtd      Qtd_Vendida,
		   ip.itp_valor    Valor_Unitario,
		   ip.itp_qtd * ip.itp_valor Valor_Item
	from itens_pedidos ip, produtos p
	where ped_numero = @pedido and ip.prd_codigo = p.prd_codigo
)
go
-- Teste --
select * from getItens(3)
go
-------------------------------------------------
-- Buscar todos os pedidos de um cliente --

alter function getPedCli (@cliente int)
returns table
as
return
(
	select p.ped_numero Pedido, p.ped_data Data,
		   p.ped_valor  Total, f.pes_nome Vendedor
	from pedidos p, pessoas f
	where cli_codigo = @cliente and p.fun_codigo = f.pes_codigo
)
go
-- Teste --
select * from getPedcli(1)
select * from getPedcli(2)
go

-- buscar todos os pedidos de um cliente a partir de uma data --

create function getPedCliData (@cliente int, @data datetime)
returns table
as
return
(
	select p.ped_numero Pedido, p.ped_data Data,
		   p.ped_valor  Total, f.pes_nome Vendedor
	from pedidos p, pessoas f
	where p.cli_codigo = @cliente and p.fun_codigo = f.pes_codigo and
	      p.ped_data >= @data
)
go
-- Teste --
select * from getPedcliData(2, '20/08/2009')
select * from pedidos

-- Data --
select * from pedidos where ped_data = '19/08/2009 12:00'
select * from pedidos where ped_data = '20/08/2009'

update pedidos set ped_data = '20/08/2009 00:00' where ped_numero = 6
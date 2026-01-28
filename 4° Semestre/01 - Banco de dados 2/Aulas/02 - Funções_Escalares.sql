use Vendas_BDII_ADS_ENC

select * from itens_pedidos
go

-- Função Escalar --
create function reajustar
(  
   @valor decimal(10,2),
   @taxa  decimal(10,2)
)
returns decimal(10,2)
as
begin
	return (@valor * (1 + @taxa/100))
end
go
-- teste --
select p.*, dbo.reajustar(prd_valor, 10) Aumento,
            dbo.reajustar(prd_valor, -10) Desconto
from produtos p

update produtos set
     prd_valor = dbo.reajustar(prd_valor, 20)
where prd_codigo in (2,4)

select * from produtos

-- Coluna Calculada --

create table colaboradores
(
	id	    int		      not null primary key identity,
	nome    varchar(50)   not null,
	salario decimal(10,2) not null,
	credito as dbo.reajustar(salario,  50)
)
go
-- Teste -- 
insert into colaboradores(nome, salario) values
('Batman', 5000)

insert into colaboradores(nome, salario) values
('Robin', 2000)

select * from colaboradores

-- Função para calcular o total de um pedido --

select sum(itp_qtd * itp_valor)
from itens_pedidos
where ped_numero = 1
go

create function getTotal (@pedido int)
returns decimal(10,2) -- tipo de retorno
as
begin
    return -- valor de retorno
	(
	    select sum(itp_qtd * itp_valor)
		from itens_pedidos
		where ped_numero = @pedido
	)
end
go
-- Teste --
select dbo.getTotal(4) Total
select dbo.getTotal(1) Total

select * from pedidos

update pedidos set ped_valor = dbo.getTotal(ped_numero)
go

create function soma(@x int, @y int)
returns int
as
begin
	declare @soma int
	set @soma = @x + @y
	return @soma
end
go
-- Teste --
select dbo.soma(10,5) Soma

-- Verificar se o BD está na máquina: Vendas_BDII_ADS_ENC

select * from itens_pedidos

-------------------------------------------
-- 26/08 --

select * from pedidos
go

create function getQtdPedCli (@cliente int)
returns int
as
begin
	return (select count(*) from pedidos
	        where cli_codigo = @cliente)  
end
go
-- Teste --
select dbo.getQtdPedCli(1) Qtd
select dbo.getQtdPedCli(25) Qtd

----------------------------------------
select * from itens_pedidos where prd_codigo = 4
go


create function getEstoqueMedio (@codigo int)
returns int
as
begin
	return (select avg(itp_qtd)
			from itens_pedidos
		    where prd_codigo  =  @codigo)
end
go
-- Teste --
select dbo.getEstoqueMedio(1) Qtd

select * from produtos
alter table produtos add estoque_minimo int

update produtos set estoque_minimo = dbo.getEstoqueMedio(prd_codigo)
select * from produtos

insert into itens_pedidos values (6, 5, 500, 1)




                                                                                                                                                                                                                                                                                                                                                                                                                                                          
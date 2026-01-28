use Vendas_BDII_ADS_ENC

begin try 
  select 10/0
end try
begin catch
   print @@error
end catch

select * from sys.messages where language_id = 2070


-- Transações: ACID --
begin tran

select @@TRANCOUNT
drop table itens_pedidos
drop table produtos
drop table pedidos

create table a(a int)
insert into a values (1)
select * from a

rollback -- commit

select * from produtos
alter table produtos drop column estoque_minimo

select getdate()
begin tran
declare @i int
set @i = 1 
while @i <= 1000000
begin
	insert into produtos values ('Estojo', 100, 15, 1)
	set @i = @i + 1
end
commit
select getdate()

----------------------------------

select * from produtos
go

create procedure cadProd
(
	@descricao varchar(50), @qtd int, @valor decimal(10,2)
)
as
begin
	insert into produtos values (@descricao, @qtd, @valor,1)
	if @@ROWCOUNT = 1 
	   return 0
    
	return 1
end
-- Teste --
exec cadProd 'Lapiseira', 100, 25

declare @r int
exec @r = cadProd 'Regua', 1000, 5
if @r = 0 
   print 'deu certo'
else
   print 'deu errado'

-----------------------------------------------

begin try
	select 10/0
end try
begin catch
	raiserror('Opa, infelizmente, divisão por zero não é possível',16, 1) 
end catch




 














                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
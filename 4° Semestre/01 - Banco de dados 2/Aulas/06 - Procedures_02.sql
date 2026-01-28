select * from pessoas
select * from clientes
go

create procedure cadCli
(
	@nome varchar(50), @cpf varchar(12), @renda decimal(10,2)
)
as
begin
	insert into pessoas  values (@nome, @cpf, 1)
	insert into clientes values (@@IDENTITY, @renda, @renda*0.25)
end
go
-- Teste --
exec cadCli 'Flash', '101010', 3000

select * from pessoas
select * from clientes
go
------------------------------------------

alter procedure cadCli
(
	@nome varchar(50), @cpf varchar(12), @renda decimal(10,2)
)
as
begin
    begin try
		insert into pessoas  values (@nome, @cpf, 1)
		insert into clientes values (@@IDENTITY, @renda, @renda*0.25)
		return 0 -- cliente cadastrado
	end try
	begin catch
	    raiserror ('Cliente não cadastrado', 16, 1)
	    return 1 -- erros
	end catch
end
go
-- Teste --
declare @r int
exec @r = cadCli 'Flash Neto', '101030', 3000
if @r = 0
   print 'OK'
else
   print 'Not ok'

-- > criar mensagem na lista de mensagens
-- > transações



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
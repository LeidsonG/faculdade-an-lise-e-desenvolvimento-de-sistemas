alter procedure cadCli
(
	@nome varchar(50), @cpf varchar(12), @renda decimal(10,2)
)
as
begin
    begin try
	  begin tran
		insert into pessoas  values (@nome, @cpf, 1)
		insert into clientes values (@@IDENTITY, @renda, @renda*0.25)
		commit
		return 0 -- cliente cadastrado
	end try
	begin catch
		rollback	
	    raiserror ('Problema com o cadastro de cliente', 16, 1)
	    return 1 -- erros
	end catch
end
go
-- Teste --
declare @r int
exec @r = cadCli 'Flash Bisneto', '101032', 300
if @r = 0
   print 'OK'
else
   print 'Not ok'

----------------------------------------------------------

select * from sys.messages
where language_id = 2070

sp_addmessage @msgnum   = 50015,
              @lang     = 'English',
			  @severity = 16,
			  @msgtext  = 'Customer resgistration error!'

sp_addmessage @msgnum   = 50015,
              @lang     = 'Português',
			  @severity = 16,
			  @msgtext  = 'Erro no cadastro do Cliente!'

select * from sys.messages where language_id = 2070
 
alter procedure cadCli
(
	@nome varchar(50), @cpf varchar(12), @renda decimal(10,2)
)
as
begin
    begin try
	  begin tran
		insert into pessoas  values (@nome, @cpf, 1)
		insert into clientes values (@@IDENTITY, @renda, @renda*0.25)
		commit
		return 0 -- cliente cadastrado
	end try
	begin catch
		rollback	
	    raiserror (50015, 16, 1)
	    return 1 -- erros
	end catch
end
go
-- Teste --
declare @r int
exec @r = cadCli 'Flash Bisneto', '101032', 300
if @r = 0
   print 'OK'
else
   print 'Not ok'

set language português





                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
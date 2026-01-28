alter procedure cadCli
(
	@nome varchar(50), @cpf varchar(12), @renda decimal(10,2)
)
as
begin
	begin try
		begin tran 
			declare @codigo int
			select @codigo = pes_codigo from pessoas where pes_cpf = @cpf
			if @@rowcount = 0 -- pessoa não cadastrada
			begin
				insert into pessoas  values (@nome, @cpf, 1)
				insert into clientes values (@@IDENTITY, @renda, @renda * 0.25)
				commit
				return 0 -- sucesso
			end
			else -- a pessoa já está cadastrada
			begin
				if not exists (select * from clientes where pes_codigo = @codigo)
				begin
					insert into clientes values (@codigo, @renda, @renda * 0.25)
					commit
					return 0 -- sucesso
				end
				rollback
				return 2 -- o cliente já estava cadastrado				
			end
	end try
	begin catch
		rollback
		return 1 -- insucesso
	end catch
end

-- Teste -- 
select * from pessoas 

declare @r int
exec @r = cadCli 'Buslabinho', '0070', 1
if @r = 0
   print 'Cadastrado com sucesso'
else
  if @r = 1
      print 'Erro brabo'
  else
     print 'Cliente já estava cadastrado'




















                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
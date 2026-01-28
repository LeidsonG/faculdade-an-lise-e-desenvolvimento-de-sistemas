use Vendas_BDII_ADS_ENC

select * from produtos

select * from sys.triggers

select * from produtos
insert into produtos values ('Compasso', 100, 5, 1)
go

create table copy_prod
(
	cod	int not null primary key identity,
	nome varchar(50) not null,
	estoque int not null,
	preco money not null,
	data  datetime not null
)
go

create trigger tr_copy
on produtos
instead of insert
as
begin
   insert into copy_prod select prd_descricao, prd_qtd, prd_valor,
                                getdate()
						 from inserted 
end
-- Teste --
insert into produtos values ('Makita', 100, 1500, 1)
insert into produtos values ('Grampeador MasterBlaster',100, 20, 1)
insert into produtos values ('Furadeira Bosh', 10, 650, 1)

select * from produtos
select * from copy_prod

------------------------------

select * from produtos
go

create table log_precos
(
	codigo		 int		  not null,
	data	     datetime     not null,
	preco_antigo money		  not null,
	preco_novo   money		  not null,
	usuario      varchar(100) not null
	primary key (codigo, data)
)
go

create trigger tr_auditoria
on produtos
after update
as if update(prd_valor)
begin
	insert into log_precos select i.prd_codigo, getdate(),
	                              d.prd_valor, i.prd_valor, system_user
						   from inserted i, deleted d
						   where i.prd_codigo = d.prd_codigo and
						         i.prd_valor != d.prd_valor

end
-- Teste --
select * from produtos
update produtos set prd_valor = 0.87 where prd_codigo = 1
update produtos set prd_valor = prd_valor * 1.01

-- Bug --
update produtos set prd_qtd = 1000 where prd_codigo = 1
select * from log_precos

-- bug --
update produtos set prd_valor = 2 where prd_codigo = 1 
                                                                                                                                                                                                                                                                                                
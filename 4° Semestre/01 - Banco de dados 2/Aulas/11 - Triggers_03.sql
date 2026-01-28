use Vendas_BDII_ADS_ENC

create table pedidos_finalizados
(
	numero	int			not null primary key,
	data	datetime	not null,
	valor	money		null,
	status	int			not null,
	fun_codigo int		not	null references funcionarios,
	cli_codigo int		not null references clientes,
	est_codigo int		not null references estagiarios
)
go

create table itens_finalizados
(
	ped_numero	  int	not null references pedidos_finalizados,
	prd_codigo	  int   not	null references produtos,
	qtd_vendida   int	not null,
	preco_vendido money not null,
	primary key(ped_numero, prd_codigo)
)
go

create trigger tr_movePedidos
on pedidos
after update
as if update(ped_status)
begin
	insert into pedidos_finalizados  select * from pedidos where
									 ped_numero in (select ped_numero from inserted where ped_status = 2)


	insert into itens_finalizados    select * from itens_pedidos 
									 where ped_numero in (select ped_numero from inserted where ped_status = 2)

	delete from itens_pedidos where ped_numero in (select ped_numero from inserted where ped_status = 2)
	delete from pedidos		  where ped_numero in (select ped_numero from inserted where ped_status = 2)
end

-- Teste --
select * from pedidos
select * from pedidos_finalizados
select * from itens_finalizados
update pedidos set ped_status = 2 where ped_numero in (2,3)




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
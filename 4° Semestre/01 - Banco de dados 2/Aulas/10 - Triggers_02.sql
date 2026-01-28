use Vendas_BDII_ADS_ENC

select * from pedidos
update pedidos set ped_valor = null

create trigger tr_finalizaPed
on pedidos
after update
as if update(ped_status)
begin
	update pedidos set
	   ped_valor = (select sum(itp_qtd * itp_valor) Total
					from itens_pedidos ip
					where pedidos.ped_numero = ip.ped_numero)
	
	where ped_numero in (select i.ped_numero 
	                     from inserted i, deleted d 
						 where i.ped_status != d.ped_status and
							    i.ped_status = 2)	   
end
-- teste --

select * from pedidos
update pedidos set ped_status = 2
where ped_numero in (1,6)

-------------------------------------------

select * from pessoas

create trigger tr_delpes
on pessoas
instead of delete
as
begin
	update pessoas set pes_status = 2
	where pes_codigo in (select pes_codigo from deleted where pes_status != 2)
end

select * from pessoas where pes_status = 1
delete from pessoas where pes_codigo > 10




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

select sum(itp_qtd*itp_valor) Total
from itens_pedidos
where ped_numero = 1

select sum(itp_qtd*itp_valor) Total
from itens_pedidos
go

create view ped_total
as
select ped_numero Pedido,
       sum(itp_qtd*itp_valor) Total
from itens_pedidos
group by ped_numero
go

-- Teste --
select * from ped_total
select * from pedidos
go

create view v_pedidos
as
select t.Pedido Pedido,
       p.ped_data Data, 
	   t.Total Total,
	   f.pes_nome Funcionario,
	   c.pes_nome Cliente,
	   e.pes_nome Estagiario,
	   case p.ped_status 
	      when 1 then 'Ativo'
		  when 2 then 'Cancelado'
		  when 3 then 'Pendente'
		  when 4 then 'Finalizado'
	   end Situação
from pedidos p, ped_total t,
     pessoas f, pessoas c, pessoas e
where p.ped_numero = t.Pedido and
      p.fun_codigo = f.pes_codigo and
	  p.cli_codigo = c.pes_codigo and
	  p.est_codigo = e.pes_codigo
go

-- Teste --
select * from v_pedidos
go

create view v_produtos
as
select prd_codigo Codigo,
       prd_descricao Produto,
	   prd_qtd Estoque,
	   prd_valor Preço,
    case
	   when prd_qtd <= 5 then 'Estoque Baixo'
	   else 'Normal'
	end Situação_Estoque
from produtos
go
-- Teste --
select * from v_produtos


update produtos set prd_qtd = 1 
where prd_codigo in (2, 4)



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
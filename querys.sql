use DB_A5A76C_raul966

select * from clientes

create procedure USP_ListarClientes2
@FechaInicio datetime,
@FechaFin datetime
as
begin
	select c.idCliente, c.NombreCompañia, dp.preciounidad, dp.cantidad, (dp.preciounidad * dp.cantidad) as 'Total'
	from clientes c
	join pedidos p
	on (c.idCliente = p.IdCliente)
	join detallesdepedidos dp
	on (p.IdPedido = dp.idpedido)
	where p.FechaPedido between @FechaInicio and @FechaFin;
end;

execute USP_ListarClientes2 '1994-08-04','1994-08-16'

create procedure USP_FECHAFECHA
@Fecha1 datetime,
@Fecha2 datetime
as
begin
	select *
	from dbo.Pedidos
	where FechaPedido between @Fecha1 and @Fecha2;
end;

exec USP_FECHAFECHA '1994-08-08','1994-08-09';

select * from dbo.Pedidos;
select * from dbo.detallesdepedidos;


create procedure usp_Detalle_pedido
@idPedido int
as
begin
	select *
	from dbo.detallesdepedidos
	where idpedido = @idPedido
end;

drop proc usp_Detalle_pedido

exec usp_Detalle_pedido 10248
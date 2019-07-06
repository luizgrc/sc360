/*..........-------------CHANGELOG 1.1----------------........ */
alter table seyci add column MODIFICADO_POR varchar(50);
alter table seyci add column MODIFICADO_FECHA varchar(50);
alter table TRASLADOSEYCI add column MODIFICADO_POR varchar(50);
alter table TRASLADOSEYCI add column MODIFICADO_FECHA varchar(50);
--Cambios en SP_LISTAR_DETALLE_SOLICITUD  se quito EXP
--Cambios en SP_ACTUALIZAR_SEYCI_DG aumendo de MODIFICADO_POR y MODIFICADO_FECHA
--Cambios en SP_ACTUALIZAR_SEYCI_TAB aumendo de MODIFICADO_POR y MODIFICADO_FECHA
--Cambios en SP_LISTAR_TRASLADO_SEYCI
--Cambios en SP_INSERT_UPDATE_TRASLADO aumendo de MODIFICADO_POR y MODIFICADO_FECHA 
/*..........-------------CHANGELOG 1.1----------------........ */
SELECT * FROM TRASLADOSEYCI

/*..........-------------CONSULTAS----------------........ */
/*TAB 1*/
--SP_LISTAR_DETALLE_SOLICITUD 
call SP_LISTAR_DETALLE_SOLICITUD('107030')
select * from seyci
/*TAB 2*/
--SP_LISTAR_DETALLE_SEYCI
call SP_LISTAR_DETALLE_SEYCI('107030')
select * from seyci
/*TAB 3*/
--SP_LISTAR_TRASLADO_SEYCI
select * from TRASLADOSEYCI

/*TAB 4*/
--SP_LISTAR_REEVALUACION
select * from REEVALUACION
/*TAB 5*/
--SP_LISTAR_DICTAMEN
select * from SEYCI
/*TAB 6*/
--SP_LISTAR_APELACION
/*..........-------------CONSULTAS----------------........ */


/*..........-------------UPDATE----------------........ */
/*TAB 1*/
--SP_ACTUALIZAR_SEYCI_DG


/*TAB 2*/
--SP_ACTUALIZAR_SEYCI_TAB
/*TAB 3*/
--SP_INSERT_UPDATE_TRASLADO
/*TAB 4*/
--SP_INSERT_UPDATE_REEVALUACION

/*TAB 5*/
/*TAB 6*/




/*..........-------------UPDATE----------------........ */
select * from seyci
describe usuario
select NUMEROSOLICITUD , count(NUMEROSOLICITUD) from SEYCI 
group by NUMEROSOLICITUD
having count(NUMEROSOLICITUD) >1
describe reevaluacion





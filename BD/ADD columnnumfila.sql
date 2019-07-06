select EXP from seyci

select numfila from tipoarchivo where idTipoArchivo=1
show SP_LISTAR_SOLICITUDES


ALTER TABLE tipoarchivo
  ADD numfila int   --NOT NULL O NULL?
  AFTER fechaRegistro;

update tipoarchivo set numfila =9 where idTipoArchivo=1; --  'ARCHIVO DE SOLICITUDES'
update tipoarchivo set numfila =2 where idTipoArchivo=2; --  'ARCHIVO DE BENEFICIARIOS'
update tipoarchivo set numfila =13 where idTipoArchivo=3; -- 'ARCHIVO DE SEYCI'
update tipoarchivo set numfila =0 where idTipoArchivo=4; --  'ARCHIVO DE CARGA DE NOMINA'

update tipoarchivo set numfila =0 where idTipoArchivo=5; --   'ARCHIVO DE CARGA DE BONOS REDIMIDOS'
update tipoarchivo set numfila =0 where idTipoArchivo=6; --   'ARCHIVO DE CARGA DE DICTAMENES COMAFP Y COMEC'
update tipoarchivo set numfila =0 where idTipoArchivo=7; --   'ARCHIVO DE CARGA DE APORTE ADICIONAL' 
update tipoarchivo set numfila =0 where idTipoArchivo=8; --   'ARCHIVO DE CARGA DE PRIMER PAGO'
update tipoarchivo set numfila =0 where idTipoArchivo=9; --   'ARCHIVO DE RETIRO 95.5 - 25% / DECRETO DE URGENCIA(DU)' 
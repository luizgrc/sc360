﻿CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRASLADO_SEYCI`(
IN INIDSOLICITUD VARCHAR(10)
)
BEGIN
     SELECT
        t.IDTRASLADO,
        t.NROEXPSEYCI ,
        t.NROTRASLADO ,
        t.FECHACITA ,
        t.ACOMPANANTE ,
        t.TIPO ,
        (SELECT DEPARTAMENTO FROM DEPARTAMENTOS WHERE IDDEPARTAMENTO=t.ORIGEN) `ORIGEN`,
        (SELECT DEPARTAMENTO FROM DEPARTAMENTOS WHERE IDDEPARTAMENTO=t.DESTINO) `DESTINO`,
        t.FECHAAPROBACION ,
        t.MONEDA1 ,
        t.TIPOMOVILIDAD ,
        t.MONTOMOVILIDAD ,
        t.MONEDA2 ,
        t.DIASALIMENTACION,
        t.MONTOALIMENTACION ,
        t.MONTO3 ,
        t.DIASALOJAMIENTO ,
        t.MONTOALOJAMIENTO ,
        t.MONTOEXTRAMEDICOS ,
        t.TOTALGASTO ,
        t.EJECUTIVA ,
        t.ANALISTA  
     FROM TRASLADOSEYCI t 
     WHERE t.NROEXPSEYCI= INIDSOLICITUD;
    
END;

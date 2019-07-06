﻿CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_SOLICITUD`(
IN INIDSOLICITUD VARCHAR(10)
)
BEGIN

      
      /*SELECT 
      IDSOLICITUD,
      NUMEROEXPEDIENTE,
      CUSPP,
      PRIMERNOMBRE,
      SEGUNDONOMBRE,
      PRIMERAPELLIDO,
      SEGUNDOAPELLIDO 
      FROM SOLICITUD WHERE IDSOLICITUD=INIDSOLICITUD;*/

      SELECT
      SE.`EXP`,
      SE.`CUSPP`,
      SE.`PRIMERNOMBRE`,
      SE.`SEGUNDONOMBRE`,
      SE.`PRIMERAPELLIDO`,
      SE.`SEGUNDOAPELLIDO`,
      SE.`FECHANACEVALUADO`,
      SE.`EMAILAFI`,
      SE.`SEXO`,
      SE.`TELEFONOAFI`,
      ''  ESTADOCIVIL,
      SE.`DIRECCIONAFI`,
      SE.`DEPARTAMENTOAFI`,
      (SELECT IDDEPARTAMENTO FROM DEPARTAMENTOS WHERE DEPARTAMENTO=SE.`DEPARTAMENTOAFI`)IDDEPARTAMENTO,
       SE.`PROVINCIAAFI`,
      (SELECT IDPROVINCIA from PROVINCIAS WHERE IDDEPARTAMENTO = (SELECT IDDEPARTAMENTO FROM DEPARTAMENTOS WHERE DEPARTAMENTO=SE.`DEPARTAMENTOAFI`) AND PROVINCIA= SE.`PROVINCIAAFI`)IDPROVINCIA,
      SE.`DISTRITOAFI`,
      (SELECT IDDISTRITO FROM DISTRITOS WHERE IDPROVINCIA=(SELECT IDPROVINCIA from PROVINCIAS WHERE IDDEPARTAMENTO = (SELECT IDDEPARTAMENTO FROM DEPARTAMENTOS WHERE DEPARTAMENTO=SE.`DEPARTAMENTOAFI`) AND PROVINCIA= SE.`PROVINCIAAFI`) AND DISTRITO=SE.`DISTRITOAFI`)IDDISTRITO
      FROM SEYCI SE
      WHERE SE.`EXP` = INIDSOLICITUD;
    

   END;
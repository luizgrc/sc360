/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;

import com.sc360.struts.dto.TiposDocumento;
import com.sc360.struts.dto.EstadoSolicitud;
import com.sc360.struts.dto.Archivo;
import com.sc360.struts.dto.TipoArchivo;
import com.sc360.struts.dto.Parametro;
import com.sc360.struts.dto.Asignacion;
import java.util.List;

/**
 *
 * @author epuma
 */
public interface IfaceUtil {
    
     public List<TiposDocumento> tiposDpcumentoQry();
     public List<EstadoSolicitud> tiposEstadosQry();
     public String getMessage();
     public String insertarDataCarga(Archivo dto);
     public List<Archivo> ListadoCarga(Archivo dto);
     public List<TipoArchivo> tiposArchivoQry();
     public List<Parametro>  departamentosCbo();
     public List<Parametro> provinciasXdepa(String idDepartamento);
     public List<Parametro> distritoXprovincia(String idProvincia);
     public List<Archivo> ListarErrores(Archivo dto);
     public String insertarLineaError(Archivo dto);
     public List<Asignacion> ListadoAsignacion(Asignacion dto);
     public List<Parametro> provinciasXdepaAjax(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito);
     public List<Parametro> distritoXprovinciaAjax(String tipoUbigeo, String idDepartamento,String idProvincia, String idDistrito);
     public List<Parametro> ListadoEjecutivos();
     public List<Parametro> ListadoAgencias();
    
}

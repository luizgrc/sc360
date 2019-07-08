/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.jdbc.dao;
import com.sc360.struts.dto.Solicitud;
import com.sc360.struts.dto.Beneficiario;
import com.sc360.struts.dto.SEYCI;
import com.sc360.struts.dto.Nomina;
import com.sc360.struts.dto.Detalle;
import com.sc360.struts.dto.Traslado;
import com.sc360.struts.dto.Reevaluacion;
import com.sc360.struts.dto.Dictamen;
import com.sc360.struts.dto.Apelacion;
import com.sc360.struts.dto.Parametro;
import java.util.List;

/**
 *
 * @author epuma
 */

public interface IfaceSolicitud {
    
    public String getMessage();
    public String InsertarSolicitud(Solicitud dto);
    public List<Solicitud> ListadoSolicitud(Solicitud dto);  
    public String InsertarBeneficiario(Beneficiario dto);
    public String InsertarSEYCI(SEYCI dto);
    public String InsertarNomina(Nomina dto);
    public List<Detalle> ListadoDetalleSolicitud(Solicitud dto);
    public List<SEYCI> ListadoSeyci(SEYCI dto);
    public Parametro ActualizarSEYCI(SEYCI dto);
    public Parametro ActualizarSEYCITab(SEYCI dto);
    public List<Traslado> ListadoTraslado(Traslado dto);
    public List<Traslado> ListadoTrasladoItem(Traslado dto);
    public Parametro InsertarActualizarTraslado(Traslado dto);
    public List<Reevaluacion> ListadoReevaluacion(Reevaluacion dto);
    public Parametro InsertarActualizarReevaluacion(Reevaluacion dto);
    public List<Dictamen> ListadoDictamen(Dictamen dto);
    public List<Dictamen> ListadoDictamenItem(Dictamen dto);
    public Parametro InsertarActualizarDictamen(Dictamen dto);
    public List<Apelacion> ListadoApelacion(Apelacion dto);
    public Parametro InsertarActualizarApelacion(Apelacion dto);
   
    
}

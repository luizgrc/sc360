/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import com.sc360.struts.dto.Apelacion;
import com.sc360.struts.dto.Parametro;
import com.sc360.struts.form.ApelacionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.jdbc.dao.ImpUtil;
import java.util.List;

/**
 *
 * @author epuma
 */
public class ApelacionAction extends DispatchAction{
    
    
    public ActionForward inicioApelacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {
        System.out.println(" Inicio Dictamen Action ");
        String numeroExpediente  =  req.getParameter("nroExp");
        System.out.println(" nroExp " + numeroExpediente);
        Gson json  = new Gson();
        Apelacion dto = new Apelacion();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
       
        dto.setNroSeyci(numeroExpediente);
        
        List<Apelacion>   listaApelacion = daoSolicitud.ListadoApelacion(dto);
        String jsonstring = "";
        if(listaApelacion != null){
            jsonstring = json.toJson(listaApelacion);
        }
        res.getWriter().write(jsonstring);
             
    
    return null;
        
    }
    
    public ActionForward guardarApelacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

        Gson json = new Gson();
        Parametro mensaje = new Parametro();
        Apelacion apelacion = new Apelacion();     
        
        String nroExp = req.getParameter("nroExpA");
        String nickUsuario = req.getParameter("nickUsuario");
        String nroDictamenApelado = req.getParameter("txtNroDictamenApelado");
        String personaApela = req.getParameter("txtPersonaApela");
        String fechaApelacion = req.getParameter("fechaApelacion");
        String fechaIngBeneficios = req.getParameter("fechaIngBeneficios");
        String fechaEnvCarta = req.getParameter("fechaEnvCarta");
        String fechaRecepCOMAFP = req.getParameter("txtRecepCOMAFP");
        String Analista = req.getParameter("txtAnalista");
        String motivoApela = req.getParameter("txtMotivoApela");
        //observar
       // String NroDictamenApela = req.getParameter("txtNroDictamentApelado");
        String DIS_PACIFICO = req.getParameter("txtDIS_PACIFICO");
        String fechaDictamen = req.getParameter("fechaDictamen");
        String fechaEnvDIS = req.getParameter("fechaEnvioDIS");
        String fechaNotiAfi = req.getParameter("fechaNotiAfiliado");
        String fechaNotiCOMEC = req.getParameter("fechaNotiCOMEC");
        String Observaciones = req.getParameter("Observaciones");
                 
        apelacion.setNroSeyci(nroExp);
        apelacion.setModificadopor(nickUsuario);
        apelacion.setNroDictamenApelado(nroDictamenApelado);
        apelacion.setPersonaApela(personaApela);
        apelacion.setFechaApelacion(fechaApelacion);
        apelacion.setFecIngBeneficios(fechaIngBeneficios);
        apelacion.setFecEnvCarta(fechaEnvCarta);
        apelacion.setRecepCOMAFP(fechaRecepCOMAFP);
        apelacion.setAnalista(Analista);
        apelacion.setMotivoApelacion(motivoApela);
        apelacion.setNroExpDictamenApelado(""); // not map front
        apelacion.setDisPacifico(DIS_PACIFICO);
        apelacion.setFecDictamen(fechaDictamen);
        apelacion.setFecEnvioDis(fechaEnvDIS);
        apelacion.setOK("");// not map front
        apelacion.setFecNotAfiliado(fechaNotiAfi);
        apelacion.setFecNotCOMEC(fechaNotiCOMEC);        
        apelacion.setObservaciones(Observaciones);

        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        mensaje = daoSolicitud.InsertarActualizarApelacion(apelacion);
        
        String jsonString = json.toJson(mensaje);
        
        res.getWriter().write(jsonString);
        
        System.out.println(" Fin Guardar Reevaluacion Action ");
        
        return null;
        
    }
    
}

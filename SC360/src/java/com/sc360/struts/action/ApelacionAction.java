/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.sc360.struts.dto.Apelacion;
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
        String numeroExpediente  =  req.getParameter("numeroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Apelacion dto = new Apelacion();
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        ApelacionForm formS =(ApelacionForm)form;
        
        if(numeroExpediente==null){
  
              numeroExpediente = formS.getNroSeyci();
              System.out.println(" numeroExpediente Null " + numeroExpediente);
          }
        
        dto.setNroSeyci(numeroExpediente);
        
        List<Apelacion>   listaApelacion = daoSolicitud.ListadoApelacion(dto);
        
        try
           {
                for(int cant=0;cant < listaApelacion.size();cant++ )
                {
                 Apelacion dtoDetalle = (Apelacion)listaApelacion.get(cant);
                 
                 formS.setNroSeyci(dtoDetalle.getNroSeyci());
                 formS.setNroDictamenApelado(dtoDetalle.getNroDictamenApelado());
                 formS.setPersonaApela(dtoDetalle.getPersonaApela());
                 formS.setFechaApelacion(dtoDetalle.getFechaApelacion());
                 formS.setFecIngBeneficios(dtoDetalle.getFecIngBeneficios());
                 formS.setFecEnvCarta(dtoDetalle.getFecEnvCarta());
                 formS.setRecepCOMAFP(dtoDetalle.getRecepCOMAFP());
                 formS.setAnalista(dtoDetalle.getAnalista());
                 formS.setMotivoApelacion(dtoDetalle.getMotivoApelacion());
                 formS.setNroExpDictamenApelado(dtoDetalle.getNroDictamenApelado());
                 formS.setDisPacifico(dtoDetalle.getDisPacifico());
                 formS.setFecDictamen(dtoDetalle.getFecDictamen());
                 formS.setFecEnvioDis(dtoDetalle.getFecEnvioDis());
                 formS.setoK(dtoDetalle.getOK());
                 formS.setFecNotAfiliado(dtoDetalle.getFecNotAfiliado());
                 formS.setFecNotCOMEC(dtoDetalle.getFecNotCOMEC());
                 formS.setObservaciones(dtoDetalle.getObservaciones());
                 
                } 
       
            }catch(Exception e)
            {
                e.printStackTrace();
            }
             
    
    return mapping.findForward("inicioApelacion");
        
    }
    
    public ActionForward guardarApelacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        Apelacion apelacion = new Apelacion();
        ApelacionAction cons = new ApelacionAction();
        
        ApelacionForm formS =(ApelacionForm)form;
        
        
                 String NroSeyci = formS.getNroSeyci();
                 String NroDictamenApelado = formS.getNroDictamenApelado();
                 String PersonaApela = formS.getPersonaApela();
                 String FechaApelacion = formS.getFechaApelacion();
                 String FecIngBeneficios = formS.getFecIngBeneficios();
                 String FecEnvCarta = formS.getFecEnvCarta();
                 String RecepCOMAFP = formS.getRecepCOMAFP();
                 String Analista = formS.getAnalista();
                 String MotivoApelacion = formS.getMotivoApelacion();
                 String NroExpDictamenApelado = formS.getNroExpDictamenApelado();
                 String DisPacifico = formS.getDisPacifico();
                 String FecDictamen = formS.getFecDictamen();
                 String FecEnvioDis = formS.getFecEnvioDis();
                 String OK = formS.getoK();
                 String FecNotAfiliado = formS.getFecNotAfiliado();
                 String FecNotCOMEC = formS.getFecNotCOMEC();
                 String Observaciones = formS.getObservaciones();
                 
        apelacion.setNroSeyci(NroSeyci);
        apelacion.setNroDictamenApelado(NroDictamenApelado);
        apelacion.setPersonaApela(PersonaApela);
        apelacion.setFechaApelacion(FechaApelacion);
        apelacion.setFecIngBeneficios(FecIngBeneficios);
        apelacion.setFecEnvCarta(FecEnvCarta);
        apelacion.setRecepCOMAFP(RecepCOMAFP);
        apelacion.setAnalista(Analista);
        apelacion.setMotivoApelacion(MotivoApelacion);
        apelacion.setNroExpDictamenApelado(NroExpDictamenApelado);
        apelacion.setDisPacifico(DisPacifico);
        apelacion.setFecDictamen(FecDictamen);
        apelacion.setFecEnvioDis(FecEnvioDis);
        apelacion.setOK(OK);
        apelacion.setFecNotAfiliado(FecNotAfiliado);
        apelacion.setFecNotCOMEC(FecNotCOMEC);        
        apelacion.setObservaciones(Observaciones);

        
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        daoSolicitud.InsertarActualizarApelacion(apelacion);
        
        System.out.println(" Fin Guardar Reevaluacion Action ");
        
        return cons.inicioApelacion(mapping, form, req, res);
        
    }
    
}

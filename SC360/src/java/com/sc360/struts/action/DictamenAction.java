/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.sc360.struts.dto.Dictamen;
import com.sc360.struts.form.DictamenForm;
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
public class DictamenAction extends DispatchAction{
    
    public ActionForward inicioDictamen(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

        
        System.out.println(" Inicio Dictamen Action ");
        String numeroExpediente  =  req.getParameter("numeroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Dictamen dto = new Dictamen();
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        DictamenForm formS =(DictamenForm)form;
        
        formS.setNroSeyci(numeroExpediente);
        
        if(numeroExpediente==null){
  
              numeroExpediente = formS.getNroSeyci();
              System.out.println(" numeroExpediente Null " + numeroExpediente);
          }
        
        dto.setNroSeyci(numeroExpediente);
        
        List<Dictamen>   listaDictamen = daoSolicitud.ListadoDictamen(dto);
        
        if (listaDictamen.size()>0) {
                    req.setAttribute("listaDictamen", listaDictamen);
                }
        
        try
           {
                for(int cant=0;cant < listaDictamen.size();cant++ )
                {
                 Dictamen dtoDetalle = (Dictamen)listaDictamen.get(cant);
                 
                 formS.setNroSeyci(dtoDetalle.getNroSeyci());
                 formS.setFecRecAFP(dtoDetalle.getFecRecAFP());
                 formS.setFecEmision(dtoDetalle.getFecEmision());
                 formS.setInstancia(dtoDetalle.getInstancia());
                 formS.setNroEvaluacion(dtoDetalle.getNroEvaluacion());
                 formS.setNroDictamen(dtoDetalle.getNroDictamen());
                 formS.setPorcMenoscabio(dtoDetalle.getPorcMenoscabio());
                 formS.setCalifica(dtoDetalle.getCalifica());
                 formS.setIndEnf(dtoDetalle.getIndEnf());
                 formS.setDefinitivo(dtoDetalle.getDefinitivo());
                 formS.setGrado(dtoDetalle.getGrado());
                 formS.setNaturaleza(dtoDetalle.getNaturaleza());
                 formS.setMeses(dtoDetalle.getMeses());
                 formS.setFecInicial(dtoDetalle.getFecInicial());
                 formS.setFecFinal(dtoDetalle.getFecFinal());
                 formS.setFecOcurrencia(dtoDetalle.getFecOcurrencia());
                 formS.setProximaEvaluacion(dtoDetalle.getProximaEvaluacion());
                 formS.setFecNotificacion(dtoDetalle.getFecNotificacion());
                 formS.setFecRecNotificacion(dtoDetalle.getFecRecNotificacion());
                 formS.setEdad(dtoDetalle.getEdad());
                 formS.setAnalista(dtoDetalle.getAnalista());
                 formS.setObservaciones(dtoDetalle.getObservaciones());
                 
                } 
       
            }catch(Exception e)
            {
                e.printStackTrace();
            }
             
    
    return mapping.findForward("inicioDictamen");
        
    }
    
    public ActionForward guardarDictamen(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {
        
        Dictamen dictamen = new Dictamen();
        DictamenAction cons = new DictamenAction();
        
        DictamenForm formS =(DictamenForm)form;
        
        String NroSeyci = formS.getNroSeyci();
        String FecRecAFP   = formS.getFecRecAFP();
        String FecEmision = formS.getFecEmision();
        String Instancia =  formS.getInstancia();
        String NroEvaluacion = formS.getNroEvaluacion();
        String NroDictamen = formS.getNroDictamen();
        String PorcMenoscabio = formS.getPorcMenoscabio();
        String Califica = formS.getCalifica();
        String IndEnf = formS.getIndEnf();
        String Definitivo = formS.getDefinitivo();
        String Grado = formS.getGrado();
        String Naturaleza = formS.getNaturaleza();
        String Meses = formS.getMeses();
        String FecInicial = formS.getFecInicial();
        String FecFinal = formS.getFecFinal();
        String FecOcurrencia = formS.getFecOcurrencia();
        String ProximaEvaluacion = formS.getProximaEvaluacion();
        String FecNotificacion = formS.getFecNotificacion();
        String FecRecNotificacion = formS.getFecRecNotificacion();
        String Edad = formS.getEdad();
        String Analista = formS.getAnalista();
        String Observaciones = formS.getObservaciones();
        
        dictamen.setNroSeyci(NroSeyci);
        dictamen.setFecRecAFP(FecRecAFP);
        dictamen.setFecEmision(FecEmision);
        dictamen.setInstancia(Instancia);
        dictamen.setNroEvaluacion(NroEvaluacion);
        dictamen.setNroDictamen(NroDictamen);
        dictamen.setPorcMenoscabio(PorcMenoscabio);
        dictamen.setCalifica(Califica);
        dictamen.setIndEnf(IndEnf);
        dictamen.setDefinitivo(Definitivo);
        dictamen.setGrado(Grado);
        dictamen.setNaturaleza(Naturaleza);
        dictamen.setMeses(Meses);
        dictamen.setFecInicial(FecInicial);
        dictamen.setFecFinal(FecFinal);
        dictamen.setFecOcurrencia(FecOcurrencia);
        dictamen.setProximaEvaluacion(ProximaEvaluacion);
        dictamen.setFecNotificacion(FecNotificacion);
        dictamen.setFecRecNotificacion(FecRecNotificacion);
        dictamen.setEdad(Edad);
        dictamen.setAnalista(Analista);
        dictamen.setObservaciones(Observaciones);

        
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        daoSolicitud.InsertarActualizarDictamen(dictamen);
        
        System.out.println(" Fin Guardar Reevaluacion Action ");
        
        return cons.inicioDictamen(mapping, form, req, res);
        
        //return mapping.findForward("inicioSeyci");
        
    }
    
    public ActionForward mostrarDictamen(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {
        
        
        System.out.println(" Inicio Mostrar Dictamen Action ");
        String numeroExpediente  =  req.getParameter("idNroTraslado");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Dictamen dto = new Dictamen();
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        DictamenForm formS =(DictamenForm)form;
        
        formS.setNroSeyci(numeroExpediente);
        
        if(numeroExpediente==null){
  
              numeroExpediente = formS.getNroSeyci();
              System.out.println(" numeroExpediente Null " + numeroExpediente);
          }
        
        dto.setNroSeyci(numeroExpediente);
        
        List<Dictamen>   listaDictamen = daoSolicitud.ListadoDictamen(dto);
        
        if (listaDictamen.size()>0) {
                    req.setAttribute("listaDictamen", listaDictamen);
                }
        
        try
           {
                for(int cant=0;cant < listaDictamen.size();cant++ )
                {
                 Dictamen dtoDetalle = (Dictamen)listaDictamen.get(cant);
                 
                 formS.setNroSeyci(dtoDetalle.getNroSeyci());
                 formS.setFecRecAFP(dtoDetalle.getFecRecAFP());
                 formS.setFecEmision(dtoDetalle.getFecEmision());
                 formS.setInstancia(dtoDetalle.getInstancia());
                 formS.setNroEvaluacion(dtoDetalle.getNroEvaluacion());
                 formS.setNroDictamen(dtoDetalle.getNroDictamen());
                 formS.setPorcMenoscabio(dtoDetalle.getPorcMenoscabio());
                 formS.setCalifica(dtoDetalle.getCalifica());
                 formS.setIndEnf(dtoDetalle.getIndEnf());
                 formS.setDefinitivo(dtoDetalle.getDefinitivo());
                 formS.setGrado(dtoDetalle.getGrado());
                 formS.setNaturaleza(dtoDetalle.getNaturaleza());
                 formS.setMeses(dtoDetalle.getMeses());
                 formS.setFecInicial(dtoDetalle.getFecInicial());
                 formS.setFecFinal(dtoDetalle.getFecFinal());
                 formS.setFecOcurrencia(dtoDetalle.getFecOcurrencia());
                 formS.setProximaEvaluacion(dtoDetalle.getProximaEvaluacion());
                 formS.setFecNotificacion(dtoDetalle.getFecNotificacion());
                 formS.setFecRecNotificacion(dtoDetalle.getFecRecNotificacion());
                 formS.setEdad(dtoDetalle.getEdad());
                 formS.setAnalista(dtoDetalle.getAnalista());
                 formS.setObservaciones(dtoDetalle.getObservaciones());
                 
                } 
       
            }catch(Exception e)
            {
                e.printStackTrace();
            }
        
        System.out.println(" Fin Mostrar Dictamen Action ");
        
        return mapping.findForward("inicioDictamen");
    }
    
}

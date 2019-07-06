/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import com.sc360.struts.dto.TiposDocumento;
import com.sc360.struts.dto.Reevaluacion;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.sc360.struts.form.ReevaluacionForm;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.jdbc.dao.ImpUtil;
import java.util.List;

/**
 *
 * @author epuma
 */
public class ReevaluacionAction extends DispatchAction {
    
    public ActionForward inicioReevaluacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        System.out.println(" Inicio Reevaluacion Action ");
                String numeroExpediente = req.getParameter("nroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Reevaluacion dto = new Reevaluacion();
        Gson gson = new Gson();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        dto.setNumeroSeyci(numeroExpediente);

        List<Reevaluacion>   listaReevaluacion= daoSolicitud.ListadoReevaluacion(dto);
        String jsonstring = "";
        if(listaReevaluacion != null){
            jsonstring = gson.toJson(listaReevaluacion);
        }
        res.getWriter().write(jsonstring);
      
        
        
        


        System.out.println(" Fin Reevaluacion Action ");
        
        return null;
        
    }
    
     public ActionForward guardaReevaluacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        System.out.println(" Inicio Guadar Reevaluacion Action ");
        
        Reevaluacion reevaluacion = new Reevaluacion();
        ReevaluacionAction cons = new ReevaluacionAction();
        
        ReevaluacionForm formT =(ReevaluacionForm)form;
        
        String NumeroSeyci = formT.getNumeroSeyci();
        String FechaIngresoBeneficios =  formT.getFechaIngresoBeneficios();
        String TipoDocumento =  formT.getTipoDocumento();
        String FechaEvaluacion =  formT.getFechaEvaluacionDoc();
        String analista =  formT.getAnalista();
        String FechaNotificacion =  formT.getFechaNotificacion();
        String Responsable = formT.getRespDis();
        String Observaciones =  formT.getObservacionesReevaluacion();
        
        reevaluacion.setNumeroSeyci(NumeroSeyci);
        reevaluacion.setFechaIngresoBeneficios(FechaIngresoBeneficios);
        reevaluacion.setTipoDocumento(TipoDocumento);
        reevaluacion.setFechaEvaluacion(FechaEvaluacion);
        reevaluacion.setAnalista(analista);
        reevaluacion.setFechaNotificacion(FechaNotificacion);
        reevaluacion.setResponsable(Responsable);
        reevaluacion.setObservaciones(Observaciones);
        
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        daoSolicitud.InsertarActualizarReevaluacion(reevaluacion);
        
        List<TiposDocumento> list = daoUtil.tiposDpcumentoQry();
        
        if (list != null) {
                    req.setAttribute("list", list);
                }
        
        ReevaluacionForm formS =(ReevaluacionForm)form;

        System.out.println(" Fin Guardar Reevaluacion Action ");
        
        return cons.inicioReevaluacion(mapping, form, req, res);
        
        //return mapping.findForward("inicioReevaluacion");
        
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;


import com.sc360.struts.form.AsignacionForm;
import com.sc360.struts.dto.Asignacion;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpUtil;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author Elgar
 */
public class AsignacionAction extends DispatchAction {
    
    public ActionForward inicio(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
        throws Exception
    {
        System.out.println(" Entro Metodo Inicio Asignacion ");
        
        IfaceUtil daoUtil = new ImpUtil();
        
        Asignacion asignacion = new Asignacion();
        
        List<Asignacion> listAsignacion = daoUtil.ListadoAsignacion(asignacion);
               
        
        if (listAsignacion != null) {
                    req.setAttribute("listAsignacion", listAsignacion);
        }

        return mapping.findForward("success");
    } 
    
}

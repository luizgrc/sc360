/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

/**
 *
 * @author agarcia
 */
public class MantenimientoCorreos extends DispatchAction {
    
    public ActionForward inicio(ActionMapping mapping,ActionForm from,HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println("com.sc360.struts.action.MantenimientoCorreos.inicio()");

        return mapping.findForward("success");
    }
  
 
}

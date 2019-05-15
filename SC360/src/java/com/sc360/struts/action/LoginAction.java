/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.sc360.struts.jdbc.dao.IfaceLogin;
import com.sc360.struts.jdbc.dao.ImpLogin;
import com.sc360.struts.form.LoginForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author epuma
 */
public class LoginAction extends org.apache.struts.action.Action{
    
    
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LoginForm login = (LoginForm)form;
        HttpSession sesion = request.getSession();
        
        System.out.println(" Usuario : " + login.getNickUsuario());
        System.out.println(" Clave : " + login.getPassword());
        
        IfaceLogin iface = new ImpLogin();
        
        login = iface.validaLogin(login);
        
        if(login !=null){
            sesion.setAttribute("nickUsuario", login.getNickUsuario());
             return mapping.findForward(SUCCESS);
        }else{
        
             return mapping.findForward("error");
        }
        
        
        
    }
    
    
    public ActionForward signOut(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        System.out.println(" ENTRO A METODO SIGNOUT ");
        return mapping.findForward("error");
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import com.sc360.struts.dto.Detalle;
import com.sc360.struts.dto.Parametro;
import com.sc360.struts.form.SeyciForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.sc360.struts.dto.SEYCI;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.jdbc.dao.ImpUtil;
import java.util.List;

/**
 *
 * @author epuma
 */
public class SeyciAction extends DispatchAction {

    public ActionForward inicioSeyci(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        String idExp = req.getParameter("idExp");
        System.out.println(" Entro Metodo inicioSeyci " + idExp);
        Gson gson = new Gson();
        SEYCI dto = new SEYCI();
        //IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        dto.setExp(idExp);
        List<SEYCI> listaSeyci = daoSolicitud.ListadoSeyci(dto);
        String jsonString = "";
        if (listaSeyci != null) {
            jsonString = gson.toJson(listaSeyci);
        }
        res.getWriter().write(jsonString);
        System.out.println(" Fin Seyci Action ");
        return null;

    }

    public ActionForward listarEjecutivos(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Entro Metodo listarEjecutivos ");
        Gson gson = new Gson();
        IfaceUtil daoUtil = new ImpUtil();
        List<Parametro> listEjecutivo = daoUtil.ListadoEjecutivos();
        String jsonString = "";
        if (listEjecutivo != null) {
            jsonString = gson.toJson(listEjecutivo);
        }

        res.getWriter().write(jsonString);
        return null;
    }

    public ActionForward listarAgencias(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Entro Metodo listarAgencias");
        Gson gson = new Gson();
        IfaceUtil daoUtil = new ImpUtil();
        List<Parametro> listAgencias = daoUtil.ListadoAgencias();
        String jsonString = "";
        if (listAgencias != null) {
            jsonString = gson.toJson(listAgencias);
        }

        res.getWriter().write(jsonString);
        return null;
    }

    public ActionForward guardarSeyci(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {

        System.out.println(" Inicio Guardar Seyci ");
        String numeroExpediente = req.getParameter("nroExpS");
        String EjecutivaAgencia = req.getParameter("sltEjecutivo");
        String NSolicitudSysde = req.getParameter("txtNroSolS");
        String TipoSolicitud = req.getParameter("slttipoSolicitud");
        String primerNombre = req.getParameter("txtpnomS");
        String segundoNombre = req.getParameter("txtsnomS");
        String primerApellido = req.getParameter("txtpapeS");
        String segundoApellido = req.getParameter("txtsapeS");
        String FecNacBen = req.getParameter("txtfecNacS");
        String Parentesco = req.getParameter("sltparentesco");
        String ActividadRiesgo = req.getParameter("actRiesgo");
        String FechaSeccI  = req.getParameter("txtFecSecIS");
        String FechaEnvioSeyciCOMAFP = req.getParameter("txtFecEnvCOMAFPS");
        String Observaciones = req.getParameter("txtObsSeyci");
        
        Gson gson = new Gson();
        Parametro mensaje = new Parametro();
        SEYCI seyci = new SEYCI();
        seyci.setExp(numeroExpediente);
        seyci.setEjecutivaAgencia(EjecutivaAgencia);
        seyci.setNumeroSolicitud(NSolicitudSysde);
        seyci.setTipoSolicitud(TipoSolicitud);
        seyci.setPrimerNombre(primerNombre);
        seyci.setSegundoNombre(segundoNombre);
        seyci.setPrimerApellido(primerApellido);
        seyci.setSegundoApellido(segundoApellido);
        seyci.setParentescoSolicitanteBnef(Parentesco);
        seyci.setFechaNacEvaluado(FecNacBen);
        seyci.setActividadLaboral(ActividadRiesgo);
        seyci.setFechaSeccionI(FechaSeccI);
        seyci.setFechaEnvioCOMAFP(FechaEnvioSeyciCOMAFP);
        seyci.setObservacionesSeyci(Observaciones);
        
        IfaceSolicitud daoSolicitud = new ImpSolicitud();


        
        mensaje = (daoSolicitud.ActualizarSEYCITab(seyci));
        String jsonstring = gson.toJson(mensaje);
        res.getWriter().write(jsonstring);

        System.out.println(" Fin Guardar Seyci ");

        return null;

        //return mapping.findForward("inicioSeyci");
    }

}

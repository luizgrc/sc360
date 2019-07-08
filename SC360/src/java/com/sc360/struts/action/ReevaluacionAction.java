/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import com.sc360.struts.dto.Parametro;
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

    public ActionForward inicioReevaluacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {

        System.out.println(" Inicio Reevaluacion Action ");
        String numeroExpediente = req.getParameter("nroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Reevaluacion dto = new Reevaluacion();
        Gson gson = new Gson();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        dto.setNumeroSeyci(numeroExpediente);

        List<Reevaluacion> listaReevaluacion = daoSolicitud.ListadoReevaluacion(dto);
        String jsonstring = "";
        if (listaReevaluacion != null) {
            jsonstring = gson.toJson(listaReevaluacion);
        }
        res.getWriter().write(jsonstring);

        System.out.println(" Fin Reevaluacion Action ");

        return null;

    }

    public ActionForward listarDocumento(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        IfaceUtil daoUtil = new ImpUtil();
        List<TiposDocumento> listdocs = daoUtil.tiposDpcumentoQry();
        Gson gson = new Gson();
        if (listdocs != null) {
            req.setAttribute("listdocs", listdocs);
        }
        String jsonString = "";
        if (listdocs != null) {
            jsonString = gson.toJson(listdocs);
        }
        res.getWriter().write(jsonString);

        return null;

    }

       public ActionForward guardarReevaluacion(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {

        Gson gson = new Gson();
        Parametro mensaje = new Parametro();
        Reevaluacion reevaluacion = new Reevaluacion();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        String nroExp = req.getParameter("nroExpR");
        String usuario = req.getParameter("nickUsuario");
        String FechaIngresoBen = req.getParameter("txtFechaIngresoBen");
        String tipoDocumento = req.getParameter("sltipoDoc");
        String FechaEvaluacion = req.getParameter("fechaEvaluacion");
        String Analista = req.getParameter("txtAnalista");
        String FechaNotificacion = req.getParameter("fechaNotificacion");
        String Responsable = req.getParameter("txtResponsable");
        String Observaciones = req.getParameter("txtObservaciones");
        
        reevaluacion.setNumeroSeyci(nroExp);
        reevaluacion.setFechaIngresoBeneficios(FechaIngresoBen);
        reevaluacion.setTipoDocumento(tipoDocumento);
        reevaluacion.setFechaEvaluacion(FechaEvaluacion);
        reevaluacion.setAnalista(Analista);
        reevaluacion.setFechaNotificacion(FechaNotificacion);
        reevaluacion.setResponsable(Responsable);
        reevaluacion.setObservaciones(Observaciones);
        reevaluacion.setModificadopor(usuario);
        reevaluacion.setIngresadopor(usuario);

        mensaje = daoSolicitud.InsertarActualizarReevaluacion(reevaluacion);
        
        String jsonstring = gson.toJson(mensaje);
        res.getWriter().write(jsonstring);

        return null;
    }
}

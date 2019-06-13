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
        SEYCI seyci = new SEYCI();
        SeyciAction cons = new SeyciAction();

        SeyciForm formS = (SeyciForm) form;

        String Agencia = formS.getAgencia();
        String EjecutivaAgencia = formS.getEjecutivo();
        String NSolicitudSysde = formS.getNroSolicitud();

        String TipoSolicitud = formS.getTipoSolicitud();
        String primerNombre = formS.getPrimerNombreEvaluado();
        String segundoNombre = formS.getSegundoNombreEvaluado();
        String primerApellido = formS.getPrimerApellidoEvaluado();
        String segundoApellido = formS.getSegundoApellidoEvaluado();
        String Parentesco = formS.getParentesco();
        String FecNacBen = formS.getFechaNacimientoSeyci();
        String ActividadRiesgo = formS.getActRiesgo();

        String ResultadoEvaluacion = formS.getResultadoEvaluacion();
        String FechaSeccI = formS.getFechaSeccionI();
        String FechaIngBeneficios = formS.getFechaIngresoBenef();
        String FechaFirmaMedico = formS.getFechaFirmaMedico();
        String DJBenef = formS.getDjBenef();
        String FechaEnvioSeyciCOMAFP = formS.getFechaEnvioCOMAFP();
        String FechaRecepSeyciCOMAFP = formS.getFechaRecepCOMAFP();
        String fechaEnvioDIS = formS.getFechaEnvioDIS();
        String fechaRecepDIS = formS.getFechaRecepcionDIS();
        String nombreAchivo = formS.getNombreArchivoOKDis();
        String Analista = formS.getAnalista();
        String Observaciones = formS.getObservacionesSEYCI();
        String FechaConclusion = formS.getFecConclusion();

        String numeroExpediente = formS.getNumeroExpediente();

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

        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        daoSolicitud.ActualizarSEYCITab(seyci);

        System.out.println(" Fin Guardar Seyci ");

        return cons.inicioSeyci(mapping, form, req, res);

        //return mapping.findForward("inicioSeyci");
    }

}

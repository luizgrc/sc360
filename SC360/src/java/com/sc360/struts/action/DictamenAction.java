/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import com.sc360.struts.dto.Dictamen;
import com.sc360.struts.dto.Parametro;
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
public class DictamenAction extends DispatchAction {

    public ActionForward inicioDictamen(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Inicio Dictamen Action ");
        String numeroExpediente = req.getParameter("nroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        Dictamen dto = new Dictamen();
        Gson gson = new Gson();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        dto.setNroSeyci(numeroExpediente);

        List<Dictamen> listaDictamen = daoSolicitud.ListadoDictamen(dto);
        String jsonstring = "";
        if(listaDictamen != null){
            jsonstring = gson.toJson(listaDictamen);
        }
        res.getWriter().write(jsonstring);

        return null;

    }

    public ActionForward guardarDictamen(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        String nroExp = req.getParameter("nroExpD");
        String nickUsuario = req.getParameter("nickUsuario");
        String fechaRecepcion = req.getParameter("fechaRecepcion");
        String fechaEmision = req.getParameter("fechaEmision");
        String Instancia = req.getParameter("txtInstancia");
        String nroEvaluacion = req.getParameter("txtNroEvaluacion");
        String nroDictamen = req.getParameter("txtNroDictamen");
        String PorcentajeMenosCamb = req.getParameter("txtProcentajeMenoC");
        String Califica = req.getParameter("txtCalifica");
        String Invalidez = req.getParameter("txtInvalidez");
        String Definitivo = req.getParameter("txtDefinitivo");
        String Grado = req.getParameter("txtGrado");
        String Naturaleza = req.getParameter("txtNaturaleza");
        String Meses= req.getParameter("txtMeses");
        String fechaIniVigencia = req.getParameter("fechaIniVigencia");
        String fechaFinVigencia = req.getParameter("fechaFinVigencia");
        String fechaOcurrencia = req.getParameter("fechaOcurrencia");
        String fechaProxEva = req.getParameter("fechaProxEvaluacion");
        String fechaNotificacionAfi = req.getParameter("fechaNotificacionAfi");
        String fechaRecpNoti = req.getParameter("fechaRecpNoti");
        String Analista = req.getParameter("txtAnalista");
        
        

        Dictamen dictamen = new Dictamen();
        DictamenAction cons = new DictamenAction();

        dictamen.setNroSeyci(nroExp);
        dictamen.setModificadoPor(nickUsuario);
        dictamen.setFecRecAFP(fechaRecepcion);
        dictamen.setFecEmision(fechaEmision);
        dictamen.setInstancia(Instancia);
        dictamen.setNroEvaluacion(nroEvaluacion);
        dictamen.setNroDictamen(nroDictamen);
        dictamen.setPorcMenoscabio(PorcentajeMenosCamb);
        dictamen.setCalifica(Califica);
        dictamen.setIndEnf(Invalidez);
        dictamen.setDefinitivo(Definitivo);
        dictamen.setGrado(Grado);
        dictamen.setNaturaleza(Naturaleza);
        dictamen.setMeses(Meses);
        dictamen.setFecInicial(fechaIniVigencia);
        dictamen.setFecFinal(fechaFinVigencia);
        dictamen.setFecOcurrencia(fechaOcurrencia);
        dictamen.setProximaEvaluacion(fechaProxEva);
        dictamen.setFecNotificacion(fechaNotificacionAfi);
        dictamen.setFecRecNotificacion(fechaRecpNoti);
        dictamen.setEdad("");//No Map en Front
        dictamen.setAnalista(Analista);
        dictamen.setObservaciones(""); //No Map en Front

        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Parametro mensaje = new Parametro();
        Gson json = new Gson();
        
        mensaje = daoSolicitud.InsertarActualizarDictamen(dictamen);
        
        String jsonString = json.toJson(mensaje);
        res.getWriter().write(jsonString);
        
        
        System.out.println(" Fin Guardar Reevaluacion Action ");

        return null;

        //return mapping.findForward("inicioSeyci");
    }

   

}

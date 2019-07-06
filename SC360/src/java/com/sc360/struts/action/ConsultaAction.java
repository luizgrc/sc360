
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.action;

import com.google.gson.Gson;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpUtil;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.dto.TiposDocumento;
import com.sc360.struts.dto.EstadoSolicitud;
import com.sc360.struts.dto.Solicitud;
import com.sc360.struts.dto.Parametro;
import com.sc360.struts.dto.Detalle;
import com.sc360.struts.dto.SEYCI;
import java.util.List;
import javax.servlet.http.HttpSession;
import com.sc360.struts.form.ConsultaForm;
import com.sc360.struts.form.SeyciForm;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Elgar Eduardo Puma Cruz
 */
public class ConsultaAction extends DispatchAction {
    
    public ActionForward inicio(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
            throws Exception {
        System.out.println(" Entro Metodo Inicio ");
        HttpSession session = req.getSession();
        IfaceUtil daoUtil = new ImpUtil();
        
        List<TiposDocumento> list = daoUtil.tiposDpcumentoQry();
        
        List<EstadoSolicitud> listEstado = daoUtil.tiposEstadosQry();
        
        List<Parametro> listDepartamento = daoUtil.departamentosCbo();
        if (list != null) {
            req.setAttribute("list", list);
            System.out.println(" Tamanio de la Lista " + list.size());
        }
        
        if (listEstado != null) {
            req.setAttribute("listEstado", listEstado);
            System.out.println(" Tamanio de la Lista Estados " + listEstado.size());
        }
        if (listDepartamento != null) {
            session.setAttribute("listDepartamento", listDepartamento);
            System.out.println(" Tamanio de la Lista Departamentos " + listDepartamento.size());
        }
        return mapping.findForward("success");
    }
    
    public ActionForward buscarSolicitud(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)
            throws Exception {
        System.out.println(" Entro Metodo Buscar Solicitud ");
        
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Solicitud dto = new Solicitud();
        List<TiposDocumento> list = daoUtil.tiposDpcumentoQry();
        List<EstadoSolicitud> listEstado = daoUtil.tiposEstadosQry();
        HttpSession sesion = req.getSession();
        //String numeroDocumento  =  req.getParameter("numDocumento");

        ConsultaForm forma = (ConsultaForm) form;
        
        String tipoDocumento = forma.getTipoDocumento();
        String numeroDocumento = forma.getNumeroDocumento();
        String fechaSeccionIni = forma.getFechaSeccionIni();
        String fechaSeccionFin = forma.getFechaSeccionFin();
        String fechaAsigIni = forma.getFechaAsignacionIni();
        String fechaAsigFin = forma.getFechaAsignacionFin();
        String fechaVencIni = forma.getFechaVencimientoIni();
        String fevhaVencFin = forma.getFechaVencimientoFin();
        String analista = forma.getAnalista();
        String estadoSolictud = forma.getEstadoSolicitud();
        
        dto.setTipoDocumento(tipoDocumento);
        dto.setNumeroDocumento(numeroDocumento);
        dto.setFechaSeccionIni(fechaSeccionIni);
        dto.setFechaSeccionFin(fechaSeccionFin);
        dto.setFechaAsigIni(fechaAsigIni);
        dto.setFechaAsigFin(fechaAsigFin);
        dto.setFechaVencIni(fechaVencIni);
        dto.setFevhaVencFin(fevhaVencFin);
        dto.setAnalista(analista);
        dto.setEstadoSolicitud(estadoSolictud);
        
        if (list != null) {
            req.setAttribute("list", list);
        }
        
        if (listEstado != null) {
            req.setAttribute("listEstado", listEstado);
        }
        
        try {

            //Listando todas las Solicitudes que se cargaron
            List<Solicitud> listSolicitud = daoSolicitud.ListadoSolicitud(dto);
            
            System.out.println(" Tamanio de la Lista Solicitudes " + listSolicitud.size());
            
            if (listSolicitud.size() > 0) {
                req.setAttribute("listSolicitud", listSolicitud);
            }
            
        } catch (Exception e) {
            
            System.out.println(" Error Metodo Buscar Solicitud " + e.getMessage());
        }
        return mapping.findForward("success");
    }

    
    public ActionForward provinciasXdepa(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Entro Metodo obtenerProviciasxidep ");
        String codigodepartamento = req.getParameter("codigodep");
        IfaceUtil daoUtil = new ImpUtil();
        
        Gson gson = new Gson();

        //add code here to update parentInvoiceNo to the db
        List<Parametro> listaProvincia = daoUtil.provinciasXdepa(codigodepartamento);
        System.out.println(listaProvincia);
        String jsonString = "";
        if (listaProvincia != null) {
            jsonString = gson.toJson(listaProvincia);
        }
        res.getWriter().write(jsonString);

        //since this is an ajax call, just return null so that struts does not take any further action
        return null;
    }
    
    public ActionForward distritoXprovincia(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Entro Metodo obtenerProviciasxidep ");
        String idProvincia = req.getParameter("idProvincia");
        IfaceUtil daoUtil = new ImpUtil();
        
        Gson gson = new Gson();

        //add code here to update parentInvoiceNo to the db
        List<Parametro> listaDistrito = daoUtil.distritoXprovincia(idProvincia);
        System.out.println(listaDistrito);
        String jsonString = "";
        if (listaDistrito != null) {
            jsonString = gson.toJson(listaDistrito);
        }
        res.getWriter().write(jsonString);

        //since this is an ajax call, just return null so that struts does not take any further action
        return null;
    }
        
    public ActionForward verDetalleDocumento(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        System.out.println(" Entro Metodo window Modal ");
        String idSolicitud = req.getParameter("idSolicitud");
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Gson gson = new Gson();
        Solicitud dto = new Solicitud();
        dto.setIdSolicitud(idSolicitud);
        List<Detalle> listaDetalle = daoSolicitud.ListadoDetalleSolicitud(dto);
        System.out.println(listaDetalle);
        String jsonString = "";
        if (listaDetalle != null) {
            jsonString = gson.toJson(listaDetalle);
        }
        res.setCharacterEncoding("UTF8");
        res.setContentType("application/json");
        res.getWriter().write(jsonString);

        //since this is an ajax call, just return null so that struts does not take any further action
        return null;
    }
    
    public ActionForward guardarSolicitud(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        System.out.println(" Inicio Guardar  Consulta detalle");
        String Exp = req.getParameter("txtExp");
        String cuspp = req.getParameter("txtCuspp");
        String primerNombre = req.getParameter("txtpNom");
        String segundoNombre = req.getParameter("txtsNom");
        String primerApellido = req.getParameter("txtpApe");
        String segundoApellido = req.getParameter("txtsApe");
        String fechaNacimiento = req.getParameter("txtfecNac");
        String correo = req.getParameter("txtcorreo");
        String sexo = req.getParameter("txtSexo");
        String phone = req.getParameter("txtTelefono");
        String direccion = req.getParameter("txtDireccion");
        String departamento = req.getParameter("txtdepartamento");
        String provincia = req.getParameter("txtprovincia");
        String distrito = req.getParameter("distrito");
        String nickUsuario = req.getParameter("nickUsuario");
        Gson gson = new Gson();
        Parametro mensaje = new Parametro();
        SEYCI seyci = new SEYCI();
        seyci.setExp(Exp);
        seyci.setCuspp(cuspp);
        seyci.setPrimerNombre(primerNombre);
        seyci.setSegundoNombre(segundoNombre);
        seyci.setPrimerApellido(primerApellido);
        seyci.setSegundoApellido(segundoApellido);
        seyci.setFechaNacEvaluado(fechaNacimiento);
        seyci.setEmailAfi(correo);
        seyci.setSexo(sexo);
        seyci.setTelefonoAfi(phone);
        seyci.setDireccionAfi(direccion);
        seyci.setDepartamentoAfi(departamento);
        seyci.setProvinciaAfi(provincia);
        seyci.setDistritoAfi(distrito);
        seyci.setModificadopor(nickUsuario);
        
        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        /*ACTUALIZAR DATOS SEYCI*/
        
        mensaje = (daoSolicitud.ActualizarSEYCI(seyci));
        String jsonstring = gson.toJson(mensaje);
        res.getWriter().write(jsonstring);
        return null;

        //return mapping.findForward("datosGenerales");
    }
}

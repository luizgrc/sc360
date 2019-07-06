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
import com.sc360.struts.form.TrasladoForm;
import com.sc360.struts.jdbc.dao.IfaceSolicitud;
import com.sc360.struts.jdbc.dao.IfaceUtil;
import com.sc360.struts.jdbc.dao.ImpSolicitud;
import com.sc360.struts.jdbc.dao.ImpUtil;
import com.sc360.struts.dto.Parametro;
import com.sc360.struts.dto.Traslado;
import java.util.List;

/**
 *
 * @author epuma
 */
public class TrasladoAction extends DispatchAction {

    public ActionForward inicioTraslado(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {

        System.out.println(" Inicio Traslado Action ");
        Gson gson = new Gson();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Traslado dto = new Traslado();
        String numeroExpediente = req.getParameter("numeroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);

        dto.setNroExpSeyci(numeroExpediente);

        List<Traslado> listaTraslado = daoSolicitud.ListadoTraslado(dto);
        String jsonstring = "";
        if (listaTraslado != null) {
            jsonstring = gson.toJson(listaTraslado);
        }
        res.getWriter().write(jsonstring);

        System.out.println(" Fin Traslado Action ");

        return null;

    }

    public ActionForward guardarTraslado(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res) throws Exception {

        System.out.println(" Inicio Guardar Traslado ");

        Traslado traslado = new Traslado();
        Parametro mensaje = new Parametro();
        Gson gson = new Gson();

        String nickUsuario = req.getParameter("nickUsuario");
        String nrotraslado = req.getParameter("txtnroTrasladoT");
        String FechaCita = req.getParameter("txtFecCitaT");
        String Acompanante = req.getParameter("sltAcomT");
        switch (Acompanante.trim()) {
            case "00":
                Acompanante = "SI";
                break;
            case "01":
                Acompanante = "NO";
                break;
        }
        String Tipo = req.getParameter("txtFecCitaT");
        String Origen = req.getParameter("sltOrigenT");
        String Destino = req.getParameter("sltDestinoT");
        String FechaAprobacion = req.getParameter("txtFecAprobT");
        String Moneda1 = req.getParameter("sltMonedaMovT");
        switch (Moneda1.trim()) {
            case "01":
                Moneda1 = "[SOLES]";
                break;
            case "02":
                Moneda1 = "[DOLARES]";
                break;
        }
        String TipoMovilidad = req.getParameter("slttipoMovilidadT");
        switch (TipoMovilidad.trim()) {
            case "01":
                TipoMovilidad = "[PASAJES AVION]";
                break;
            case "02":
                TipoMovilidad = "[PASAJES TIERRA]";
                break;
            case "03":
                TipoMovilidad = "[MOVILIDAD INTERNA]";
                break;
        }
        String MontoMovilidad = req.getParameter("txtMontoMov");
        String Moneda2 = req.getParameter("sltMonedaAlimT");
        switch (Moneda2.trim()) {
            case "01":
                Moneda2 = "[SOLES]";
                break;
            case "02":
                Moneda2 = "[DOLARES]";
                break;
        }
        String DiasAlimentacion = req.getParameter("txtDiasAlimenT");
        String MontoAlimentacion = req.getParameter("txtMontoAlimenT");
        String Monto3 = req.getParameter("sltMonedaAlojT");
        switch (Monto3.trim()) {
            case "01":
                Monto3 = "[SOLES]";
                break;
            case "02":
                Monto3 = "[DOLARES]";
                break;
        }
        String DiasAlojamiento = req.getParameter("txtDiasAlojT");
        String MontoAlojamiento = req.getParameter("txtMontoAloT");
        String MontoMedico = req.getParameter("txtMontoMedicoT");
        String TotalGasto = req.getParameter("txtTotalGastoT");
        String Ejecutivo = req.getParameter("txtEjecutivoT");
        String Analista = req.getParameter("txtanalistaT");
        String NroExpSeyci = req.getParameter("nroExpT");

        traslado.setModificadopor(nickUsuario);
        traslado.setNroTraslado(nrotraslado);
        traslado.setFechaCita(FechaCita);
        traslado.setAcompanante(Acompanante);
        traslado.setTipo(Tipo);
        traslado.setOrigen(Origen);
        traslado.setDestino(Destino);
        traslado.setFechaAprobacion(FechaAprobacion);
        traslado.setMoneda1(Moneda1);
        traslado.setTipoMovilidad(TipoMovilidad);
        traslado.setMontoMovilidad(MontoMovilidad);
        traslado.setMoneda2(Moneda2);
        traslado.setDiasAlimentacion(DiasAlimentacion);
        traslado.setMontoAlimentacion(MontoAlimentacion);
        traslado.setMonto3(Monto3);
        traslado.setDiasAlojamiento(DiasAlojamiento);
        traslado.setMontoAlojamiento(MontoAlojamiento);
        traslado.setMontoExtraMedicos(MontoMedico);
        traslado.setTotalGasto(TotalGasto);
        traslado.setEjecutiva(Ejecutivo);
        traslado.setAnalista(Analista);
        traslado.setNroExpSeyci(NroExpSeyci);

        IfaceSolicitud daoSolicitud = new ImpSolicitud();

        mensaje = daoSolicitud.InsertarActualizarTraslado(traslado);
        String jsonstring = gson.toJson(mensaje);
        res.getWriter().write(jsonstring);

        System.out.println(" Fin Guardar Traslado ");

        return null;

        //return mapping.findForward("inicioTraslado");
    }
}

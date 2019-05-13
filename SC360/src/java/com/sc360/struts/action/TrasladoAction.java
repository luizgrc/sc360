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
public class TrasladoAction extends DispatchAction{
    
    public ActionForward inicioTraslado(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        System.out.println(" Inicio Traslado Action ");
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Traslado dto = new Traslado();
        String numeroExpediente  =  req.getParameter("numeroExp");
        System.out.println(" numeroExpediente " + numeroExpediente);
        
        TrasladoForm formT =(TrasladoForm)form;
        
        //formT.setNroExpSeyci(numeroExpediente);
        
        if(numeroExpediente==null){
  
              numeroExpediente = formT.getNroExpSeyci();
              System.out.println(" numeroExpediente Null " + numeroExpediente);
        }else{
              formT.setNroExpSeyci(numeroExpediente);
        }
        
        List<Parametro>  listDepartamento = daoUtil.departamentosCbo();
        
        if (listDepartamento != null) {
                    req.setAttribute("listDepartamento", listDepartamento);
        }
        
        dto.setNroExpSeyci(numeroExpediente);
        
        List<Traslado>   listaTraslado= daoSolicitud.ListadoTraslado(dto);
        
        if (listaTraslado.size()>0) {
                    req.setAttribute("listaTraslado", listaTraslado);
                }
        
                 formT.setFechaCita(null);
                 formT.setAcompanante(null);
                 formT.setNroTraslado(null);
                 formT.setTipo(null);
                 formT.setOrigen(null);
                 formT.setDestino(null);
                 formT.setFechaAprobacion(null);
                 formT.setMoneda(null);
                 formT.setTipoMovilidad(null);
                 formT.setMontoMovilidad(null);
                 formT.setMoneda1(null);
                 formT.setDiasAlimentacion(null);
                 formT.setMontoAlimentacion(null);
                 formT.setMoneda2(null);
                 formT.setDiasAlojamiento(null);
                 formT.setMontoAlojamiento(null);
                 formT.setMontoMedico(null);
                 formT.setTotalGasto(null);
                 formT.setEjecutivo(null);
                 formT.setAnalista(null);
        
        //if (listaTraslado.size()>0) {
        
        /*try
           {
                for(int cant=0;cant < listaTraslado.size();cant++ )
                {
                 Traslado dtoDetalle = (Traslado)listaTraslado.get(cant);
                 
                 formT.setFechaCita(dtoDetalle.getFechaCita());
                 formT.setAcompanante(dtoDetalle.getAcompanante());
                 formT.setNroTraslado(dtoDetalle.getNroTraslado());
                 formT.setTipo(dtoDetalle.getTipo());
                 formT.setOrigen(dtoDetalle.getOrigen());
                 formT.setDestino(dtoDetalle.getDestino());
                 formT.setFechaAprobacion(dtoDetalle.getFechaAprobacion());
                 formT.setMoneda(dtoDetalle.getMoneda1());
                 formT.setTipoMovilidad(dtoDetalle.getTipoMovilidad());
                 formT.setMontoMovilidad(dtoDetalle.getMontoMovilidad());
                 formT.setMoneda1(dtoDetalle.getMoneda1());
                 formT.setDiasAlimentacion(dtoDetalle.getDiasAlimentacion());
                 formT.setMontoAlimentacion(dtoDetalle.getMontoAlimentacion());
                 formT.setMoneda2(dtoDetalle.getMoneda2());
                 formT.setDiasAlojamiento(dtoDetalle.getDiasAlojamiento());
                 formT.setMontoAlojamiento(dtoDetalle.getMontoAlojamiento());
                 formT.setMontoMedico(dtoDetalle.getMontoExtraMedicos());
                 formT.setTotalGasto(dtoDetalle.getTotalGasto());
                 formT.setEjecutivo(dtoDetalle.getEjecutiva());
                 formT.setAnalista(dtoDetalle.getAnalista());
                 formT.setNroExpSeyci(dtoDetalle.getNroExpSeyci());
                 
                } 
       
            }catch(Exception e)
            {
                e.printStackTrace();
            }*/
  
        //}
        System.out.println(" Fin Traslado Action ");
        
        return mapping.findForward("inicioTraslado");
        
    }
    
    public ActionForward guardarTraslado(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        System.out.println(" Inicio Guardar Traslado ");
        
        Traslado traslado = new Traslado();
        TrasladoAction cons = new TrasladoAction();
        
        TrasladoForm formT =(TrasladoForm)form;
        
        
                 String FechaCita = formT.getFechaCita();
                 String Acompanante = formT.getAcompanante();
                 String NroTraslado = formT.getNroTraslado();
                 String Tipo = formT.getTipo();
                 String Origen = formT.getOrigen();
                 String Destino = formT.getDestino();
                 String FechaAprobacion = formT.getFechaAprobacion();
                 String Moneda  = formT.getMoneda();
                 String TipoMovilidad = formT.getTipoMovilidad();
                 String MontoMovilidad = formT.getMontoMovilidad();
                 String Moneda1 = formT.getMoneda1();
                 String DiasAlimentacion = formT.getDiasAlimentacion();
                 String MontoAlimentacion = formT.getMontoAlimentacion();
                 String Moneda2 = formT.getMoneda2();
                 String DiasAlojamiento = formT.getDiasAlojamiento();
                 String MontoAlojamiento = formT.getMontoAlojamiento();
                 String MontoMedico = formT.getMontoMedico();
                 String TotalGasto = formT.getTotalGasto();
                 String Ejecutivo = formT.getEjecutivo();
                 String Analista = formT.getAnalista();
                 String NroExpSeyci = formT.getNroExpSeyci();
                 
                 formT.setNroExpSeyci(NroExpSeyci);
                 
                    traslado.setFechaCita(FechaCita);
                    traslado.setAcompanante(Acompanante);
                    traslado.setNroTraslado(NroTraslado);
                    traslado.setTipo(Tipo);
                    traslado.setOrigen(Origen);
                    traslado.setDestino(Destino);
                    traslado.setFechaAprobacion(FechaAprobacion);
                    traslado.setMoneda1(Moneda);
                    traslado.setTipoMovilidad(TipoMovilidad);
                    traslado.setMontoMovilidad(MontoMovilidad);
                    traslado.setMoneda1(Moneda1);
                    traslado.setDiasAlimentacion(DiasAlimentacion);
                    traslado.setMontoAlimentacion(MontoAlimentacion);
                    traslado.setMoneda2(Moneda2);
                    traslado.setDiasAlojamiento(DiasAlojamiento);
                    traslado.setMontoAlojamiento(MontoAlojamiento);
                    traslado.setMontoExtraMedicos(MontoMedico);
                    traslado.setTotalGasto(TotalGasto);
                    traslado.setEjecutiva(Ejecutivo);
                    traslado.setAnalista(Analista);
                    traslado.setNroExpSeyci(NroExpSeyci);
        
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        
        daoSolicitud.InsertarActualizarTraslado(traslado);
        
        List<Parametro>  listDepartamento = daoUtil.departamentosCbo();
        
        if (listDepartamento != null) {
                    req.setAttribute("listDepartamento", listDepartamento);
        }
  
        
        System.out.println(" Fin Guardar Traslado ");
        
        return cons.inicioTraslado(mapping,  form,  req,  res);
        
        //return mapping.findForward("inicioTraslado");
        
    }
    
    public ActionForward mostrarTraslado(ActionMapping mapping, ActionForm form, HttpServletRequest req, HttpServletResponse res)throws Exception {

    
        System.out.println(" Inicio Mostrar Traslado Action ");
        IfaceUtil daoUtil = new ImpUtil();
        IfaceSolicitud daoSolicitud = new ImpSolicitud();
        Traslado dto = new Traslado();
        String numeroExpediente  =  req.getParameter("numeroExp");
        String idNroTraslado = req.getParameter("idNroTraslado");
        System.out.println(" numeroExpediente " + numeroExpediente);
        
        TrasladoForm formT =(TrasladoForm)form;
        
        formT.setNroExpSeyci(numeroExpediente);
        
        if(numeroExpediente==null){
  
              numeroExpediente = formT.getNroExpSeyci();
              System.out.println(" numeroExpediente Null " + numeroExpediente);
          }
        
        List<Parametro>  listDepartamento = daoUtil.departamentosCbo();
        
        if (listDepartamento != null) {
                    req.setAttribute("listDepartamento", listDepartamento);
        }
        
        dto.setNroExpSeyci(numeroExpediente);
        dto.setIdTraslado(idNroTraslado);
        
        List<Traslado>   listaTraslado= daoSolicitud.ListadoTraslado(dto);
        List<Traslado>   listaTrasladoItem= daoSolicitud.ListadoTrasladoItem(dto);
        
        if (listaTraslado.size()>0) {
                    req.setAttribute("listaTraslado", listaTraslado);
                }
        
        //if (listaTraslado.size()>0) {
        
        try
           {
                for(int cant=0;cant < listaTrasladoItem.size();cant++ )
                {
                 Traslado dtoDetalle = (Traslado)listaTrasladoItem.get(cant);
                 
                 formT.setFechaCita(dtoDetalle.getFechaCita());
                 formT.setAcompanante(dtoDetalle.getAcompanante());
                 formT.setNroTraslado(dtoDetalle.getNroTraslado());
                 formT.setTipo(dtoDetalle.getTipo());
                 formT.setOrigen(dtoDetalle.getOrigen());
                 formT.setDestino(dtoDetalle.getDestino());
                 formT.setFechaAprobacion(dtoDetalle.getFechaAprobacion());
                 formT.setMoneda(dtoDetalle.getMoneda1());
                 formT.setTipoMovilidad(dtoDetalle.getTipoMovilidad());
                 formT.setMontoMovilidad(dtoDetalle.getMontoMovilidad());
                 formT.setMoneda1(dtoDetalle.getMoneda1());
                 formT.setDiasAlimentacion(dtoDetalle.getDiasAlimentacion());
                 formT.setMontoAlimentacion(dtoDetalle.getMontoAlimentacion());
                 formT.setMoneda2(dtoDetalle.getMoneda2());
                 formT.setDiasAlojamiento(dtoDetalle.getDiasAlojamiento());
                 formT.setMontoAlojamiento(dtoDetalle.getMontoAlojamiento());
                 formT.setMontoMedico(dtoDetalle.getMontoExtraMedicos());
                 formT.setTotalGasto(dtoDetalle.getTotalGasto());
                 formT.setEjecutivo(dtoDetalle.getEjecutiva());
                 formT.setAnalista(dtoDetalle.getAnalista());
                 formT.setNroExpSeyci(dtoDetalle.getNroExpSeyci());
                 
                } 
       
            }catch(Exception e)
            {
                e.printStackTrace();
            }
  
        //}
        System.out.println(" Fin Mostrar Traslado Action ");
        
        return mapping.findForward("inicioTraslado");
        
    }
    
}

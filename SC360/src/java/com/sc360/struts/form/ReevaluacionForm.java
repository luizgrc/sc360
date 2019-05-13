/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.form;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author epuma
 */
public class ReevaluacionForm extends ActionForm{
    
    private String fechaIngresoBeneficios;
    private String tipoDocumento;
    private String fechaEvaluacionDoc;
    private String analista;
    private String fechaNotificacion;
    private String respDis;
    private String observacionesReevaluacion;
    private String numeroSeyci;

    public String getFechaIngresoBeneficios() {
        return fechaIngresoBeneficios;
    }

    public void setFechaIngresoBeneficios(String fechaIngresoBeneficios) {
        this.fechaIngresoBeneficios = fechaIngresoBeneficios;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getFechaEvaluacionDoc() {
        return fechaEvaluacionDoc;
    }

    public void setFechaEvaluacionDoc(String fechaEvaluacionDoc) {
        this.fechaEvaluacionDoc = fechaEvaluacionDoc;
    }

    public String getAnalista() {
        return analista;
    }

    public void setAnalista(String analista) {
        this.analista = analista;
    }

    public String getFechaNotificacion() {
        return fechaNotificacion;
    }

    public void setFechaNotificacion(String fechaNotificacion) {
        this.fechaNotificacion = fechaNotificacion;
    }

    public String getRespDis() {
        return respDis;
    }

    public void setRespDis(String respDis) {
        this.respDis = respDis;
    }

    public String getObservacionesReevaluacion() {
        return observacionesReevaluacion;
    }

    public void setObservacionesReevaluacion(String observacionesReevaluacion) {
        this.observacionesReevaluacion = observacionesReevaluacion;
    }

    public String getNumeroSeyci() {
        return numeroSeyci;
    }

    public void setNumeroSeyci(String numeroSeyci) {
        this.numeroSeyci = numeroSeyci;
    }
    
    
    
}

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
public class SeyciForm extends ActionForm{
    
    private String ejecutivo;
    private String agencia;
    private String nroSolicitud;
    private String tipoSolicitud;
    private String tipoEvaluado;
    private String primerNombreEvaluado;
    private String segundoNombreEvaluado;
    private String primerApellidoEvaluado;
    private String segundoApellidoEvaluado;
    private String parentesco;
    private String fechaNacimientoSeyci;
    private String actRiesgo;
    private String resultadoEvaluacion;
    private String fechaSeccionI;
    private String fechaIngresoBenef;
    private String fechaFirmaMedico;
    private String djBenef;
    private String fechaEnvioCOMAFP;
    private String fechaRecepCOMAFP;
    private String fechaEnvioDIS;
    private String fechaRecepcionDIS;
    private String nombreArchivoOKDis;
    private String fecConclusion;
    private String analista;
    private String observacionesSEYCI;
    private String numeroExpediente;

    public String getFechaNacimientoSeyci() {
        return fechaNacimientoSeyci;
    }

    public void setFechaNacimientoSeyci(String fechaNacimientoSeyci) {
        this.fechaNacimientoSeyci = fechaNacimientoSeyci;
    }

    public String getFechaRecepcionDIS() {
        return fechaRecepcionDIS;
    }

    public void setFechaRecepcionDIS(String fechaRecepcionDIS) {
        this.fechaRecepcionDIS = fechaRecepcionDIS;
    }
    
    

    public String getEjecutivo() {
        return ejecutivo;
    }

    public void setEjecutivo(String ejecutivo) {
        this.ejecutivo = ejecutivo;
    }

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    public String getNroSolicitud() {
        return nroSolicitud;
    }

    public void setNroSolicitud(String nroSolicitud) {
        this.nroSolicitud = nroSolicitud;
    }

    public String getTipoSolicitud() {
        return tipoSolicitud;
    }

    public void setTipoSolicitud(String tipoSolicitud) {
        this.tipoSolicitud = tipoSolicitud;
    }

    public String getTipoEvaluado() {
        return tipoEvaluado;
    }

    public void setTipoEvaluado(String tipoEvaluado) {
        this.tipoEvaluado = tipoEvaluado;
    }

    public String getPrimerNombreEvaluado() {
        return primerNombreEvaluado;
    }

    public void setPrimerNombreEvaluado(String primerNombreEvaluado) {
        this.primerNombreEvaluado = primerNombreEvaluado;
    }

    public String getSegundoNombreEvaluado() {
        return segundoNombreEvaluado;
    }

    public void setSegundoNombreEvaluado(String segundoNombreEvaluado) {
        this.segundoNombreEvaluado = segundoNombreEvaluado;
    }

    public String getPrimerApellidoEvaluado() {
        return primerApellidoEvaluado;
    }

    public void setPrimerApellidoEvaluado(String primerApellidoEvaluado) {
        this.primerApellidoEvaluado = primerApellidoEvaluado;
    }

    public String getSegundoApellidoEvaluado() {
        return segundoApellidoEvaluado;
    }

    public void setSegundoApellidoEvaluado(String segundoApellidoEvaluado) {
        this.segundoApellidoEvaluado = segundoApellidoEvaluado;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }


    public String getActRiesgo() {
        return actRiesgo;
    }

    public void setActRiesgo(String actRiesgo) {
        this.actRiesgo = actRiesgo;
    }

    public String getResultadoEvaluacion() {
        return resultadoEvaluacion;
    }

    public void setResultadoEvaluacion(String resultadoEvaluacion) {
        this.resultadoEvaluacion = resultadoEvaluacion;
    }

    public String getFechaSeccionI() {
        return fechaSeccionI;
    }

    public void setFechaSeccionI(String fechaSeccionI) {
        this.fechaSeccionI = fechaSeccionI;
    }

    public String getFechaIngresoBenef() {
        return fechaIngresoBenef;
    }

    public void setFechaIngresoBenef(String fechaIngresoBenef) {
        this.fechaIngresoBenef = fechaIngresoBenef;
    }

    public String getFechaFirmaMedico() {
        return fechaFirmaMedico;
    }

    public void setFechaFirmaMedico(String fechaFirmaMedico) {
        this.fechaFirmaMedico = fechaFirmaMedico;
    }

    public String getDjBenef() {
        return djBenef;
    }

    public void setDjBenef(String djBenef) {
        this.djBenef = djBenef;
    }

    public String getFechaEnvioCOMAFP() {
        return fechaEnvioCOMAFP;
    }

    public void setFechaEnvioCOMAFP(String fechaEnvioCOMAFP) {
        this.fechaEnvioCOMAFP = fechaEnvioCOMAFP;
    }

    public String getFechaRecepCOMAFP() {
        return fechaRecepCOMAFP;
    }

    public void setFechaRecepCOMAFP(String fechaRecepCOMAFP) {
        this.fechaRecepCOMAFP = fechaRecepCOMAFP;
    }

    public String getFechaEnvioDIS() {
        return fechaEnvioDIS;
    }

    public void setFechaEnvioDIS(String fechaEnvioDIS) {
        this.fechaEnvioDIS = fechaEnvioDIS;
    }

    public String getNombreArchivoOKDis() {
        return nombreArchivoOKDis;
    }

    public void setNombreArchivoOKDis(String nombreArchivoOKDis) {
        this.nombreArchivoOKDis = nombreArchivoOKDis;
    }

    public String getFecConclusion() {
        return fecConclusion;
    }

    public void setFecConclusion(String fecConclusion) {
        this.fecConclusion = fecConclusion;
    }

    public String getAnalista() {
        return analista;
    }

    public void setAnalista(String analista) {
        this.analista = analista;
    }

    public String getObservacionesSEYCI() {
        return observacionesSEYCI;
    }

    public void setObservacionesSEYCI(String observacionesSEYCI) {
        this.observacionesSEYCI = observacionesSEYCI;
    }

    public String getNumeroExpediente() {
        return numeroExpediente;
    }

    public void setNumeroExpediente(String numeroExpediente) {
        this.numeroExpediente = numeroExpediente;
    }
    
    

    
    
}

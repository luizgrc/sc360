/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.dto;

/**
 *
 * @author Elgar
 */
public class Asignacion {
    
    private String fecha;
    private String numeroSolicitud;
    private String cuspp;
    private String afiliado;
    private String ejecutivoServicioAtencion;
    private String analista;
    
    public Asignacion() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNumeroSolicitud() {
        return numeroSolicitud;
    }

    public void setNumeroSolicitud(String numeroSolicitud) {
        this.numeroSolicitud = numeroSolicitud;
    }

    public String getCuspp() {
        return cuspp;
    }

    public void setCuspp(String cuspp) {
        this.cuspp = cuspp;
    }

    public String getAfiliado() {
        return afiliado;
    }

    public void setAfiliado(String afiliado) {
        this.afiliado = afiliado;
    }

    public String getEjecutivoServicioAtencion() {
        return ejecutivoServicioAtencion;
    }

    public void setEjecutivoServicioAtencion(String ejecutivoServicioAtencion) {
        this.ejecutivoServicioAtencion = ejecutivoServicioAtencion;
    }

    public String getAnalista() {
        return analista;
    }

    public void setAnalista(String analista) {
        this.analista = analista;
    }
    
    
}

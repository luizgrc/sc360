/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.dto;

/**
 *
 * @author epuma
 */
public class EstadoSolicitud {
    
    private Integer idTipoEstado;
    private String codigoTipoEstado;
    private String descripcionTipoEstado;
    
    public EstadoSolicitud() {
    }

    public Integer getIdTipoEstado() {
        return idTipoEstado;
    }

    public void setIdTipoEstado(Integer idTipoEstado) {
        this.idTipoEstado = idTipoEstado;
    }

    public String getCodigoTipoEstado() {
        return codigoTipoEstado;
    }

    public void setCodigoTipoEstado(String codigoTipoEstado) {
        this.codigoTipoEstado = codigoTipoEstado;
    }

    public String getDescripcionTipoEstado() {
        return descripcionTipoEstado;
    }

    public void setDescripcionTipoEstado(String descripcionTipoEstado) {
        this.descripcionTipoEstado = descripcionTipoEstado;
    }
    
    
    
}

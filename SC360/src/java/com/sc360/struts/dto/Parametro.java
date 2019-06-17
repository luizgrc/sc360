/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.dto;

import java.io.Serializable;

/**
 *
 * @author Elgar
 */
public class Parametro implements Serializable{
    
    private static final long serialVersionUID = 8799656478674716638L;
    private String codigo;
    private String descripcion;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
     
     public Parametro() {
     }
    
}

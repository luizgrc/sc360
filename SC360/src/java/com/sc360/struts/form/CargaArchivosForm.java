/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author epuma
 */
public class CargaArchivosForm extends ActionForm{
    
    private FormFile archivo;
    private String tipoArchivo;

    public String getTipoArchivo() {
        return tipoArchivo;
    }

    public void setTipoArchivo(String tipoArchivo) {
        this.tipoArchivo = tipoArchivo;
    }
    
    

    public FormFile getArchivo() {
        return archivo;
    }

    public void setArchivo(FormFile archivo) {
        this.archivo = archivo;
    }
    
  
    
}

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
public class ConsultaForm extends ActionForm{
    
    private String tipoDocumento;
    private String numeroDocumento;
    private String fechaSeccionIni;
    private String fechaSeccionFin;
    private String fechaAsignacionIni;
    private String fechaAsignacionFin;
    private String fechaVencimientoIni;
    private String fechaVencimientoFin;
    private String analista;
    private String estadoSolicitud;
    
    private String numeroExpediente;
    private String cuspp;
    private String primerNombre;
    private String segundoNombre;
    private String primerApellido;
    private String segundoApellido;
    private String primerNombreAct;
    private String segundoNombreAct;
    private String primerApellidoAct;
    private String segundoApellidoAct;
    private String fechaNacimiento;
    private String correo;
    private String sexo;
    private String telefono;
    private String estadoCivil;
    private String direccion;
    private String distrito;
    private String provincia;
    private String departamento;
    
    private String idSolicitud;

    public String getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(String idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    
    

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
    

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getPrimerNombreAct() {
        return primerNombreAct;
    }

    public void setPrimerNombreAct(String primerNombreAct) {
        this.primerNombreAct = primerNombreAct;
    }

    public String getSegundoNombreAct() {
        return segundoNombreAct;
    }

    public void setSegundoNombreAct(String segundoNombreAct) {
        this.segundoNombreAct = segundoNombreAct;
    }

    public String getPrimerApellidoAct() {
        return primerApellidoAct;
    }

    public void setPrimerApellidoAct(String primerApellidoAct) {
        this.primerApellidoAct = primerApellidoAct;
    }

    public String getSegundoApellidoAct() {
        return segundoApellidoAct;
    }

    public void setSegundoApellidoAct(String segundoApellidoAct) {
        this.segundoApellidoAct = segundoApellidoAct;
    }
    
            

    public String getNumeroExpediente() {
        return numeroExpediente;
    }

    public void setNumeroExpediente(String numeroExpediente) {
        this.numeroExpediente = numeroExpediente;
    }

    public String getCuspp() {
        return cuspp;
    }

    public void setCuspp(String cuspp) {
        this.cuspp = cuspp;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getFechaSeccionIni() {
        return fechaSeccionIni;
    }

    public void setFechaSeccionIni(String fechaSeccionIni) {
        this.fechaSeccionIni = fechaSeccionIni;
    }

    public String getFechaSeccionFin() {
        return fechaSeccionFin;
    }

    public void setFechaSeccionFin(String fechaSeccionFin) {
        this.fechaSeccionFin = fechaSeccionFin;
    }

    public String getFechaAsignacionIni() {
        return fechaAsignacionIni;
    }

    public void setFechaAsignacionIni(String fechaAsignacionIni) {
        this.fechaAsignacionIni = fechaAsignacionIni;
    }

    public String getFechaAsignacionFin() {
        return fechaAsignacionFin;
    }

    public void setFechaAsignacionFin(String fechaAsignacionFin) {
        this.fechaAsignacionFin = fechaAsignacionFin;
    }

    public String getFechaVencimientoIni() {
        return fechaVencimientoIni;
    }

    public void setFechaVencimientoIni(String fechaVencimientoIni) {
        this.fechaVencimientoIni = fechaVencimientoIni;
    }

    public String getFechaVencimientoFin() {
        return fechaVencimientoFin;
    }

    public void setFechaVencimientoFin(String fechaVencimientoFin) {
        this.fechaVencimientoFin = fechaVencimientoFin;
    }

    public String getAnalista() {
        return analista;
    }

    public void setAnalista(String analista) {
        this.analista = analista;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }
    
}

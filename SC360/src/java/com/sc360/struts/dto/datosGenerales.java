/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sc360.struts.dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author agarcia
 */
public class datosGenerales {

    private String exp;

    private String cuspp;

    private String prinom;

    private String segnom;

    private String priape;

    private String segape;

    private String fechnac;

    private String correo;

    private List<Parametro> sexo;

    private String telefono;

    private List<Parametro> civilEst;

    private String direccion;

    private List<Parametro> departamento;

    private List<Parametro> provincia;

    private List<Parametro> distrito;

    public void setExp(String exp) {
        this.exp = exp;
    }

    public String getExp() {
        return this.exp;
    }

    public void setCuspp(String cuspp) {
        this.cuspp = cuspp;
    }

    public String getCuspp() {
        return this.cuspp;
    }

    public void setPrinom(String prinom) {
        this.prinom = prinom;
    }

    public String getPrinom() {
        return this.prinom;
    }

    public void setSegnom(String segnom) {
        this.segnom = segnom;
    }

    public String getSegnom() {
        return this.segnom;
    }

    public void setPriape(String priape) {
        this.priape = priape;
    }

    public String getPriape() {
        return this.priape;
    }

    public void setSegape(String segape) {
        this.segape = segape;
    }

    public String getSegape() {
        return this.segape;
    }

    public void setFechnac(String fechnac) {
        this.fechnac = fechnac;
    }

    public String getFechnac() {
        return this.fechnac;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCorreo() {
        return this.correo;
    }

    public void setSexo(List<Parametro> sexo) {
        this.sexo = sexo;
    }

    public List<Parametro> getSexo() {
        return this.sexo;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTelefono() {
        return this.telefono;
    }

    public void setCivilEst(List<Parametro> civilEst) {
        this.civilEst = civilEst;
    }

    public List<Parametro> getCivilEst() {
        return this.civilEst;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDepartamento(List<Parametro> departamento) {
        this.departamento = departamento;
    }

    public List<Parametro> getDepartamento() {
        return this.departamento;
    }

    public void setProvincia(List<Parametro> provincia) {
        this.provincia = provincia;
    }

    public List<Parametro> getProvincia() {
        return this.provincia;
    }

    public void setDistrito(List<Parametro> distrito) {
        this.distrito = distrito;
    }

    public List<Parametro> getDistrito() {
        return this.distrito;
    }
}

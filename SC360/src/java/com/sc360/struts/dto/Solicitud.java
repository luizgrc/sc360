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
public class Solicitud {
    
    private String cuspp;
    private String expediente;
    private String afiliado;
    private String primerNombre;
    private String segundoNombre;
    private String primerApellido;
    private String segundoApellido;

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
    private String estadoCuenta;
    private String causalAfiliado;
    private String planTramite;
    private String agenciaInicio;
    private String plan;
    private String beneficio;
    private String nroSolicitudFisico;
    private String solicitudSysde;
    private String etapa;
    private String estado;
    private String cobertura;
    private String causalCobertura;
    private String indicadorTuitiva;
    private String ciaProvisional;
    private String fechaSiniestro;
    private String fechaDevengue;
    private String tipoPago;
    private String fechaSeccionI;
    private String calculoExcedente;
    private String retiroAPV;
    private String retiroParcialTotal;
    private String montoRetiroAPV;
    private String fechaSeccionII;
    private String fechaImpSeccionII;
    private String pensionPreliminar;
    private String fechaElecMonSeccionII;
    private String montoTipoActSeccionII;
    private String montoBDRSeccionII;
    private String estadoBDRSeccionII;
    private String docCompletoSeccionII;
    private String pensionCalculada;
    private String premAFP;
    private String premCIASeguros;
    private String tipoCambioAA;
    private String capitalRequeridoAA;
    private String reservaGSAA;
    private String CICInformadaAA;
    private String pensionDevengada;
    private String pensionPagadas;
    private String montoAAMeller;
    private String fechaValorCuotaAA;
    private String cuotasAA;
    private String valorCuotaAA;
    private String fechaPagoAA;
    private String fechaAcreditacionAA;
    private String montoBDRMeller;
    private String fechaValorCuotaBDR;
    private String cuotasBDR;
    private String valorCuotaBDR;
    private String fechaPagoBDR;
    private String fechaAcreditacionBDR;
    private String fechaSeccionIII;
    private String devengueDefinitivo;
    private String capitalPension;
    private String CICMeller;
    private String montoAAMellerActualizado;
    private String montoBDRMellerActualizado;
    private String fechaSeccionIV;
    private String fechaEleccionModalidad;
    private String ciaAsegurosAFP;
    private String nroCotizacion;
    private String producto;
    private String monedaProductoGanador;
    private String caractMoneda;
    private String anioRT;
    private String porcRT;
    private String anioPG;
    private String porcPG;
    private String derechoCrecer;
    private String grati;
    private String tasaInteresAFP;
    private String pensionBaseRT;
    private String tasaInteresCIASeguro;
    private String pensionBaseRVD;
    private String fechaNotificacion;
    private String fechaEmisionRecalculo;
    private String fechaRecepcionRecalculo;
    private String montoTrxCiaSeguro;
    private String montoPagoAfpRT;
    private String nuevaPensionRT;
    private String nuevaPensionBaseRVD;
    private String mtoTransPagado;
    private String fecTransferencia_FechaOperacion;
    private String montoPagoGS;
    private String fecPagoGS;
    private String fecPrimerPago;
    private String montoPrimerPago;
    private String fechaUltimoPago;
    private String indicadorCargoCuenta;
    private String numeroPoliza;
    private String fechaPoliza;
    private String indicadorEndoso;
    
    private String tipoDocumento;
    private String numeroDocumento;
    private String fechaSeccionIni;
    private String fechaSeccionFin;
    private String fechaAsigIni;
    private String fechaAsigFin;
    private String fechaVencIni;
    private String fevhaVencFin;
    private String analista;
    private String estadoSolicitud;
    private String idSolicitud;

    public String getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(String idSolicitud) {
        this.idSolicitud = idSolicitud;
    }
    
    
    private String fechaVencimientoSolicitud;

    public String getFechaVencimientoSolicitud() {
        return fechaVencimientoSolicitud;
    }

    public void setFechaVencimientoSolicitud(String fechaVencimientoSolicitud) {
        this.fechaVencimientoSolicitud = fechaVencimientoSolicitud;
    }
    
    public Solicitud() {
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

    public String getFechaAsigIni() {
        return fechaAsigIni;
    }

    public void setFechaAsigIni(String fechaAsigIni) {
        this.fechaAsigIni = fechaAsigIni;
    }

    public String getFechaAsigFin() {
        return fechaAsigFin;
    }

    public void setFechaAsigFin(String fechaAsigFin) {
        this.fechaAsigFin = fechaAsigFin;
    }

    public String getFechaVencIni() {
        return fechaVencIni;
    }

    public void setFechaVencIni(String fechaVencIni) {
        this.fechaVencIni = fechaVencIni;
    }

    public String getFevhaVencFin() {
        return fevhaVencFin;
    }

    public void setFevhaVencFin(String fevhaVencFin) {
        this.fevhaVencFin = fevhaVencFin;
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
    

    public String getEstadoCuenta() {
        return estadoCuenta;
    }

    public void setEstadoCuenta(String estadoCuenta) {
        this.estadoCuenta = estadoCuenta;
    }

    public String getCausalAfiliado() {
        return causalAfiliado;
    }

    public void setCausalAfiliado(String causalAfiliado) {
        this.causalAfiliado = causalAfiliado;
    }

    public String getPlanTramite() {
        return planTramite;
    }

    public void setPlanTramite(String planTramite) {
        this.planTramite = planTramite;
    }

    public String getAgenciaInicio() {
        return agenciaInicio;
    }

    public void setAgenciaInicio(String agenciaInicio) {
        this.agenciaInicio = agenciaInicio;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getBeneficio() {
        return beneficio;
    }

    public void setBeneficio(String beneficio) {
        this.beneficio = beneficio;
    }

    public String getNroSolicitudFisico() {
        return nroSolicitudFisico;
    }

    public void setNroSolicitudFisico(String nroSolicitudFisico) {
        this.nroSolicitudFisico = nroSolicitudFisico;
    }

    public String getSolicitudSysde() {
        return solicitudSysde;
    }

    public void setSolicitudSysde(String solicitudSysde) {
        this.solicitudSysde = solicitudSysde;
    }

    public String getEtapa() {
        return etapa;
    }

    public void setEtapa(String etapa) {
        this.etapa = etapa;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCobertura() {
        return cobertura;
    }

    public void setCobertura(String cobertura) {
        this.cobertura = cobertura;
    }

    public String getCausalCobertura() {
        return causalCobertura;
    }

    public void setCausalCobertura(String causalCobertura) {
        this.causalCobertura = causalCobertura;
    }

    public String getIndicadorTuitiva() {
        return indicadorTuitiva;
    }

    public void setIndicadorTuitiva(String indicadorTuitiva) {
        this.indicadorTuitiva = indicadorTuitiva;
    }

    public String getCiaProvisional() {
        return ciaProvisional;
    }

    public void setCiaProvisional(String ciaProvisional) {
        this.ciaProvisional = ciaProvisional;
    }

    public String getFechaSiniestro() {
        return fechaSiniestro;
    }

    public void setFechaSiniestro(String fechaSiniestro) {
        this.fechaSiniestro = fechaSiniestro;
    }

    public String getFechaDevengue() {
        return fechaDevengue;
    }

    public void setFechaDevengue(String fechaDevengue) {
        this.fechaDevengue = fechaDevengue;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public String getFechaSeccionI() {
        return fechaSeccionI;
    }

    public void setFechaSeccionI(String fechaSeccionI) {
        this.fechaSeccionI = fechaSeccionI;
    }

    public String getCalculoExcedente() {
        return calculoExcedente;
    }

    public void setCalculoExcedente(String calculoExcedente) {
        this.calculoExcedente = calculoExcedente;
    }

    public String getRetiroAPV() {
        return retiroAPV;
    }

    public void setRetiroAPV(String retiroAPV) {
        this.retiroAPV = retiroAPV;
    }

    public String getRetiroParcialTotal() {
        return retiroParcialTotal;
    }

    public void setRetiroParcialTotal(String retiroParcialTotal) {
        this.retiroParcialTotal = retiroParcialTotal;
    }

    public String getMontoRetiroAPV() {
        return montoRetiroAPV;
    }

    public void setMontoRetiroAPV(String montoRetiroAPV) {
        this.montoRetiroAPV = montoRetiroAPV;
    }

    public String getFechaSeccionII() {
        return fechaSeccionII;
    }

    public void setFechaSeccionII(String fechaSeccionII) {
        this.fechaSeccionII = fechaSeccionII;
    }

    public String getFechaImpSeccionII() {
        return fechaImpSeccionII;
    }

    public void setFechaImpSeccionII(String fechaImpSeccionII) {
        this.fechaImpSeccionII = fechaImpSeccionII;
    }

    public String getPensionPreliminar() {
        return pensionPreliminar;
    }

    public void setPensionPreliminar(String pensionPreliminar) {
        this.pensionPreliminar = pensionPreliminar;
    }

    public String getFechaElecMonSeccionII() {
        return fechaElecMonSeccionII;
    }

    public void setFechaElecMonSeccionII(String fechaElecMonSeccionII) {
        this.fechaElecMonSeccionII = fechaElecMonSeccionII;
    }

    public String getMontoTipoActSeccionII() {
        return montoTipoActSeccionII;
    }

    public void setMontoTipoActSeccionII(String montoTipoActSeccionII) {
        this.montoTipoActSeccionII = montoTipoActSeccionII;
    }

    public String getMontoBDRSeccionII() {
        return montoBDRSeccionII;
    }

    public void setMontoBDRSeccionII(String montoBDRSeccionII) {
        this.montoBDRSeccionII = montoBDRSeccionII;
    }

    public String getEstadoBDRSeccionII() {
        return estadoBDRSeccionII;
    }

    public void setEstadoBDRSeccionII(String estadoBDRSeccionII) {
        this.estadoBDRSeccionII = estadoBDRSeccionII;
    }

    public String getDocCompletoSeccionII() {
        return docCompletoSeccionII;
    }

    public void setDocCompletoSeccionII(String docCompletoSeccionII) {
        this.docCompletoSeccionII = docCompletoSeccionII;
    }

    public String getPensionCalculada() {
        return pensionCalculada;
    }

    public void setPensionCalculada(String pensionCalculada) {
        this.pensionCalculada = pensionCalculada;
    }

    public String getPremAFP() {
        return premAFP;
    }

    public void setPremAFP(String premAFP) {
        this.premAFP = premAFP;
    }

    public String getPremCIASeguros() {
        return premCIASeguros;
    }

    public void setPremCIASeguros(String premCIASeguros) {
        this.premCIASeguros = premCIASeguros;
    }

    public String getTipoCambioAA() {
        return tipoCambioAA;
    }

    public void setTipoCambioAA(String tipoCambioAA) {
        this.tipoCambioAA = tipoCambioAA;
    }

    public String getCapitalRequeridoAA() {
        return capitalRequeridoAA;
    }

    public void setCapitalRequeridoAA(String capitalRequeridoAA) {
        this.capitalRequeridoAA = capitalRequeridoAA;
    }

    public String getReservaGSAA() {
        return reservaGSAA;
    }

    public void setReservaGSAA(String reservaGSAA) {
        this.reservaGSAA = reservaGSAA;
    }

    public String getCICInformadaAA() {
        return CICInformadaAA;
    }

    public void setCICInformadaAA(String CICInformadaAA) {
        this.CICInformadaAA = CICInformadaAA;
    }

    public String getPensionDevengada() {
        return pensionDevengada;
    }

    public void setPensionDevengada(String pensionDevengada) {
        this.pensionDevengada = pensionDevengada;
    }

    public String getPensionPagadas() {
        return pensionPagadas;
    }

    public void setPensionPagadas(String pensionPagadas) {
        this.pensionPagadas = pensionPagadas;
    }

    public String getMontoAAMeller() {
        return montoAAMeller;
    }

    public void setMontoAAMeller(String montoAAMeller) {
        this.montoAAMeller = montoAAMeller;
    }

    public String getFechaValorCuotaAA() {
        return fechaValorCuotaAA;
    }

    public void setFechaValorCuotaAA(String fechaValorCuotaAA) {
        this.fechaValorCuotaAA = fechaValorCuotaAA;
    }

    public String getCuotasAA() {
        return cuotasAA;
    }

    public void setCuotasAA(String cuotasAA) {
        this.cuotasAA = cuotasAA;
    }

    public String getValorCuotaAA() {
        return valorCuotaAA;
    }

    public void setValorCuotaAA(String valorCuotaAA) {
        this.valorCuotaAA = valorCuotaAA;
    }

    public String getFechaPagoAA() {
        return fechaPagoAA;
    }

    public void setFechaPagoAA(String fechaPagoAA) {
        this.fechaPagoAA = fechaPagoAA;
    }

    public String getFechaAcreditacionAA() {
        return fechaAcreditacionAA;
    }

    public void setFechaAcreditacionAA(String fechaAcreditacionAA) {
        this.fechaAcreditacionAA = fechaAcreditacionAA;
    }

    public String getMontoBDRMeller() {
        return montoBDRMeller;
    }

    public void setMontoBDRMeller(String montoBDRMeller) {
        this.montoBDRMeller = montoBDRMeller;
    }

    public String getFechaValorCuotaBDR() {
        return fechaValorCuotaBDR;
    }

    public void setFechaValorCuotaBDR(String fechaValorCuotaBDR) {
        this.fechaValorCuotaBDR = fechaValorCuotaBDR;
    }

    public String getCuotasBDR() {
        return cuotasBDR;
    }

    public void setCuotasBDR(String cuotasBDR) {
        this.cuotasBDR = cuotasBDR;
    }

    public String getValorCuotaBDR() {
        return valorCuotaBDR;
    }

    public void setValorCuotaBDR(String valorCuotaBDR) {
        this.valorCuotaBDR = valorCuotaBDR;
    }

    public String getFechaPagoBDR() {
        return fechaPagoBDR;
    }

    public void setFechaPagoBDR(String fechaPagoBDR) {
        this.fechaPagoBDR = fechaPagoBDR;
    }

    public String getFechaAcreditacionBDR() {
        return fechaAcreditacionBDR;
    }

    public void setFechaAcreditacionBDR(String fechaAcreditacionBDR) {
        this.fechaAcreditacionBDR = fechaAcreditacionBDR;
    }

    public String getFechaSeccionIII() {
        return fechaSeccionIII;
    }

    public void setFechaSeccionIII(String fechaSeccionIII) {
        this.fechaSeccionIII = fechaSeccionIII;
    }

    public String getDevengueDefinitivo() {
        return devengueDefinitivo;
    }

    public void setDevengueDefinitivo(String devengueDefinitivo) {
        this.devengueDefinitivo = devengueDefinitivo;
    }

    public String getCapitalPension() {
        return capitalPension;
    }

    public void setCapitalPension(String capitalPension) {
        this.capitalPension = capitalPension;
    }

    public String getCICMeller() {
        return CICMeller;
    }

    public void setCICMeller(String CICMeller) {
        this.CICMeller = CICMeller;
    }

    public String getMontoAAMellerActualizado() {
        return montoAAMellerActualizado;
    }

    public void setMontoAAMellerActualizado(String montoAAMellerActualizado) {
        this.montoAAMellerActualizado = montoAAMellerActualizado;
    }

    public String getMontoBDRMellerActualizado() {
        return montoBDRMellerActualizado;
    }

    public void setMontoBDRMellerActualizado(String montoBDRMellerActualizado) {
        this.montoBDRMellerActualizado = montoBDRMellerActualizado;
    }

    public String getFechaSeccionIV() {
        return fechaSeccionIV;
    }

    public void setFechaSeccionIV(String fechaSeccionIV) {
        this.fechaSeccionIV = fechaSeccionIV;
    }

    public String getFechaEleccionModalidad() {
        return fechaEleccionModalidad;
    }

    public void setFechaEleccionModalidad(String fechaEleccionModalidad) {
        this.fechaEleccionModalidad = fechaEleccionModalidad;
    }

    public String getCiaAsegurosAFP() {
        return ciaAsegurosAFP;
    }

    public void setCiaAsegurosAFP(String ciaAsegurosAFP) {
        this.ciaAsegurosAFP = ciaAsegurosAFP;
    }

    public String getNroCotizacion() {
        return nroCotizacion;
    }

    public void setNroCotizacion(String nroCotizacion) {
        this.nroCotizacion = nroCotizacion;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getMonedaProductoGanador() {
        return monedaProductoGanador;
    }

    public void setMonedaProductoGanador(String monedaProductoGanador) {
        this.monedaProductoGanador = monedaProductoGanador;
    }

    public String getCaractMoneda() {
        return caractMoneda;
    }

    public void setCaractMoneda(String caractMoneda) {
        this.caractMoneda = caractMoneda;
    }

    public String getAnioRT() {
        return anioRT;
    }

    public void setAnioRT(String anioRT) {
        this.anioRT = anioRT;
    }

    public String getPorcRT() {
        return porcRT;
    }

    public void setPorcRT(String porcRT) {
        this.porcRT = porcRT;
    }

    public String getAnioPG() {
        return anioPG;
    }

    public void setAnioPG(String anioPG) {
        this.anioPG = anioPG;
    }

    public String getPorcPG() {
        return porcPG;
    }

    public void setPorcPG(String porcPG) {
        this.porcPG = porcPG;
    }

    public String getDerechoCrecer() {
        return derechoCrecer;
    }

    public void setDerechoCrecer(String derechoCrecer) {
        this.derechoCrecer = derechoCrecer;
    }

    public String getGrati() {
        return grati;
    }

    public void setGrati(String grati) {
        this.grati = grati;
    }

    public String getTasaInteresAFP() {
        return tasaInteresAFP;
    }

    public void setTasaInteresAFP(String tasaInteresAFP) {
        this.tasaInteresAFP = tasaInteresAFP;
    }

    public String getPensionBaseRT() {
        return pensionBaseRT;
    }

    public void setPensionBaseRT(String pensionBaseRT) {
        this.pensionBaseRT = pensionBaseRT;
    }

    public String getTasaInteresCIASeguro() {
        return tasaInteresCIASeguro;
    }

    public void setTasaInteresCIASeguro(String tasaInteresCIASeguro) {
        this.tasaInteresCIASeguro = tasaInteresCIASeguro;
    }

    public String getPensionBaseRVD() {
        return pensionBaseRVD;
    }

    public void setPensionBaseRVD(String pensionBaseRVD) {
        this.pensionBaseRVD = pensionBaseRVD;
    }

    public String getFechaNotificacion() {
        return fechaNotificacion;
    }

    public void setFechaNotificacion(String fechaNotificacion) {
        this.fechaNotificacion = fechaNotificacion;
    }

    public String getFechaEmisionRecalculo() {
        return fechaEmisionRecalculo;
    }

    public void setFechaEmisionRecalculo(String fechaEmisionRecalculo) {
        this.fechaEmisionRecalculo = fechaEmisionRecalculo;
    }

    public String getFechaRecepcionRecalculo() {
        return fechaRecepcionRecalculo;
    }

    public void setFechaRecepcionRecalculo(String fechaRecepcionRecalculo) {
        this.fechaRecepcionRecalculo = fechaRecepcionRecalculo;
    }

    public String getMontoTrxCiaSeguro() {
        return montoTrxCiaSeguro;
    }

    public void setMontoTrxCiaSeguro(String montoTrxCiaSeguro) {
        this.montoTrxCiaSeguro = montoTrxCiaSeguro;
    }

    public String getMontoPagoAfpRT() {
        return montoPagoAfpRT;
    }

    public void setMontoPagoAfpRT(String montoPagoAfpRT) {
        this.montoPagoAfpRT = montoPagoAfpRT;
    }

    public String getNuevaPensionRT() {
        return nuevaPensionRT;
    }

    public void setNuevaPensionRT(String nuevaPensionRT) {
        this.nuevaPensionRT = nuevaPensionRT;
    }

    public String getNuevaPensionBaseRVD() {
        return nuevaPensionBaseRVD;
    }

    public void setNuevaPensionBaseRVD(String nuevaPensionBaseRVD) {
        this.nuevaPensionBaseRVD = nuevaPensionBaseRVD;
    }

    public String getMtoTransPagado() {
        return mtoTransPagado;
    }

    public void setMtoTransPagado(String mtoTransPagado) {
        this.mtoTransPagado = mtoTransPagado;
    }

    public String getFecTransferencia_FechaOperacion() {
        return fecTransferencia_FechaOperacion;
    }

    public void setFecTransferencia_FechaOperacion(String fecTransferencia_FechaOperacion) {
        this.fecTransferencia_FechaOperacion = fecTransferencia_FechaOperacion;
    }

    public String getMontoPagoGS() {
        return montoPagoGS;
    }

    public void setMontoPagoGS(String montoPagoGS) {
        this.montoPagoGS = montoPagoGS;
    }

    public String getFecPagoGS() {
        return fecPagoGS;
    }

    public void setFecPagoGS(String fecPagoGS) {
        this.fecPagoGS = fecPagoGS;
    }

    public String getFecPrimerPago() {
        return fecPrimerPago;
    }

    public void setFecPrimerPago(String fecPrimerPago) {
        this.fecPrimerPago = fecPrimerPago;
    }

    public String getMontoPrimerPago() {
        return montoPrimerPago;
    }

    public void setMontoPrimerPago(String montoPrimerPago) {
        this.montoPrimerPago = montoPrimerPago;
    }

    public String getFechaUltimoPago() {
        return fechaUltimoPago;
    }

    public void setFechaUltimoPago(String fechaUltimoPago) {
        this.fechaUltimoPago = fechaUltimoPago;
    }

    public String getIndicadorCargoCuenta() {
        return indicadorCargoCuenta;
    }

    public void setIndicadorCargoCuenta(String indicadorCargoCuenta) {
        this.indicadorCargoCuenta = indicadorCargoCuenta;
    }

    public String getNumeroPoliza() {
        return numeroPoliza;
    }

    public void setNumeroPoliza(String numeroPoliza) {
        this.numeroPoliza = numeroPoliza;
    }

    public String getFechaPoliza() {
        return fechaPoliza;
    }

    public void setFechaPoliza(String fechaPoliza) {
        this.fechaPoliza = fechaPoliza;
    }

    public String getIndicadorEndoso() {
        return indicadorEndoso;
    }

    public void setIndicadorEndoso(String indicadorEndoso) {
        this.indicadorEndoso = indicadorEndoso;
    }
    
    
    
    
    
    
    
            
    

    public String getCuspp() {
        return cuspp;
    }

    public void setCuspp(String cuspp) {
        this.cuspp = cuspp;
    }

    public String getExpediente() {
        return expediente;
    }

    public void setExpediente(String expediente) {
        this.expediente = expediente;
    }

    public String getAfiliado() {
        return afiliado;
    }

    public void setAfiliado(String afiliado) {
        this.afiliado = afiliado;
    }
    
}

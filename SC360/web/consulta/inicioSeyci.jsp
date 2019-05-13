<%-- 
    Document   : inicioSeyci
    Created on : 07/04/2019, 04:49:40 PM
    Author     : Elgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SEYCI</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/css/bootstrap.min.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/3.3.1/jquery.min.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap.min.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/main.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}"/>/jq/style.css">
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-1.12.4.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/jq/jquery-ui.js"></script>
        <script src="<c:out value="${pageContext.request.contextPath}"/>/js/ajax.js"></script>
        <script src="../scripts/jquery.js"></script>
        <link rel=stylesheet type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/layout-default.css">
        <script>

            $(function () {
                $("#fechaNacimientoSeyci").datepicker();
                $("#fechaSeccionI").datepicker();
                $("#fechaIngresoBenef").datepicker();
                $("#fechaFirmaMedico").datepicker();
                $("#fechaEnvioCOMAFP").datepicker();
                $("#fechaRecepCOMAFP").datepicker();
                $("#fechaEnvioDIS").datepicker();
                $("#fechaRecepcionDIS").datepicker();
                $("#fecConclusion").datepicker();
            });

            function irDetalle() {
                var form = document.frmSeyci;
                var url = "Consulta.do?method=verDetalleDocumento";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function irTraslado() {
                var form = document.frmSeyci;
                var numeroExp = form.numeroExpediente.value;
                var url = 'Traslado.do?method=inicioTraslado&numeroExp='+numeroExp;
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function fncGuardarSeyci() {
                var form = document.getElementById("frmSeyci");
                form.action = "Seyci.do?method=guardarSeyci";
                form.method = "post";
                form.submit();
            }


        </script>
    </head>
    <body style="text-align: center ">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" href="javascript:irDetalle()">Detalle Consulta</a></li>
                <li class="nav-item active"><a class="nav-link" href="#">SEYCI</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irTraslado()">TRASLADO</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
                <li class="nav-item"><a class="nav-link" href="#">DICTAMEN</a></li>
                <li class="nav-item"><a class="nav-link" href="#">APELACION</a></li>
            </ul>
        </div>
        <html:form action="Seyci.do" styleId="frmSeyci" >

            <div class="form-group div-align-l dv-align-2030">
                <div class="row">
                    <div class="col-6 form-inline">
                        <STRONG>SEYCI</STRONG>&nbsp;
                        <html:hidden property="numeroExpediente"></html:hidden>
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Ejecutivo&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:select property="ejecutivo" styleClass="form-control" styleId="ejecutivo" >
                            <html:option value="0">[EJECUTIVO]</html:option>
                            <html:options collection="listEjecutivo" property="codigo" labelProperty="descripcion"/>
                        </html:select>
                        <input type="checkbox" id="ejecutivo" >
                    </div>
                    <div class="col-2 form-inline">
                        Agencia&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:select property="agencia" styleClass="form-control" styleId="agencia" >
                            <html:option value="0">[AGENCIA]</html:option>
                            <html:options collection="listAgencias" property="codigo" labelProperty="descripcion"/>
                        </html:select>
                        <input type="checkbox" id="agencia" >
                    </div>
                    <div class="col-2 form-inline">
                        N Solicitud&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                    <html:text property="nroSolicitud" styleClass="form-control" size="12" maxlength="12" disabled="true" />
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Tipo Solicitud&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="tipoSolicitud" name="tipoSolicitud" class="form-control" >
                            <option value="00">[SELECCIONE]</option>
                            <option value="01">Invalidez</option>
                            <option value="02">Invalidez y Cáncer</option>
                            <option value="03">Invalidez y Enfermedad Terminal</option>
                        </select>
                        <input type="checkbox" id="tipoSolicitud" >
                    </div>
                    <div class="col-2 form-inline">
                        Tipo Evaluado&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="tipoEvaluado" name="tipoEvaluado" class="form-control" >
                            <option value="00">[SELECCIONE]</option>
                            <option value="01">Afiliado</option>
                            <option value="02">Beneficiario</option>
                        </select>
                        <input type="checkbox" id="tipoEvaluado" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-5 form-inline">
                        Nombre del Evaluado&nbsp;
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-5 form-inline">
                        <html:text property="primerNombreEvaluado" styleClass="form-control" styleId="primerNombre" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="primerNombreEvaluado" >
                        <html:text property="segundoNombreEvaluado" styleClass="form-control" styleId="segundoNombre" size="20" maxlength="20" />
                        <input type="checkbox" id="segundoNombreEvaluado" >
                    </div>
                    <div class="col-1 form-inline">&nbsp;</div>
                    <div class="col-5 form-inline">
                        <html:text property="primerApellidoEvaluado" styleClass="form-control" styleId="primerApellido" size="20" maxlength="20" />
                        &nbsp;
                        <input type="checkbox" id="primerApellidoEvaluado" >
                        <html:text property="segundoApellidoEvaluado" styleClass="form-control" styleId="segundoApellido" size="20" maxlength="20" />
                        <input type="checkbox" id="segundoApellidoEvaluado" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Parentesco&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="parentesco" name="parentesco" class="form-control" >
                            <option value="00">[SELECCIONE]</option>
                            <option value="01">Titular</option>
                            <option value="02">Conyugue</option>
                            <option value="03">Hijos</option>
                            <option value="04">Padres</option>
                        </select>
                        <input type="checkbox" id="parentesco" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Nac&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaNacimientoSeyci" styleClass="form-control" styleId="fechaNacimientoSeyci" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 
                        <input type="checkbox" id="fechaNacimientoSeyci" >
                    </div>
                    <div class="col-2 form-inline">
                        Act Riesgo&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="actRiesgo" name="actRiesgo" class="form-control" >
                            <option value="00">[NO]</option>
                            <option value="01">[SI]</option>
                        </select>
                        <input type="checkbox" id="actRiesgo" >
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Resultados Evaluacion&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="resultadoEvaluacion" name="resultadoEvaluacion" class="form-control" >
                            <option value="00">[PROCEDE]</option>
                            <option value="00">[RECHAZADO]</option>
                            <option value="00">[SUSPENDIDO]</option>
                        </select>
                        <input type="checkbox" id="resultadoEvaluacion" >
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Sec I&nbsp;
                    </div>
                    <div class="col-6 form-inline">
                        <html:text property="fechaSeccionI" styleClass="form-control" styleId="fechaSeccionI" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaSeccionI" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Ingreso Benef&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaIngresoBenef" styleClass="form-control" styleId="fechaIngresoBenef" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 
                        <input type="checkbox" id="fechaIngresoBenef" >
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Fima Medico&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaFirmaMedico" styleClass="form-control" styleId="fechaFirmaMedico" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaFirmaMedico" >
                    </div>
                    <div class="col-2 form-inline">
                        DJ de no Beneficiarios&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <select id="djBenef" name="djBenef" class="form-control" >
                            <option value="01">[SI]</option>
                            <option value="02">[NO]</option>
                        </select>
                        <input type="checkbox" id="djBenef" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Envio COMAFP&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaEnvioCOMAFP" styleClass="form-control" styleId="fechaEnvioCOMAFP" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaEnvioComafp" >
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Fecha Recep COMAFP&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaRecepCOMAFP" styleClass="form-control" styleId="fechaRecepCOMAFP" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaRecepcionComafp" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Envio DIS&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaEnvioDIS" styleClass="form-control" styleId="fechaEnvioDIS" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaEnvioDis" >
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Recep DIS&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fechaRecepcionDIS" styleClass="form-control" styleId="fechaRecepcionDIS" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                        <input type="checkbox" id="fechaRecepcionDis" >
                    </div>
                </div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Nombre Archivo ok Dis&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="nombreArchivoOKDis" styleClass="form-control" styleId="nombreArchivoOKDis" size="12" />
                    </div>
                    <div class="col-2 form-inline">
                        Fecha Conclusion&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="fecConclusion" styleClass="form-control" styleId="fecConclusion" size="12" />
                        <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 
                        <input type="checkbox" id="fechaConclusion" >
                    </div>
                    <div class="col-2 form-inline">
                        Analista&nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <html:text property="analista" styleClass="form-control" styleId="analista" size="12" />   
                    </div>
                </div>
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-2 form-inline">
                        Observaciones SEYCI&nbsp;
                    </div>
                    <div class="col-7 form-inline">
                        <html:textarea cols="120" rows="2" styleClass="form-control" property="observacionesSEYCI" readonly="false" />
                    </div>
                </div>
                
                
                <div class="space">&nbsp;</div>
                <div class="row">
                    <div class="col-10 form-inline">
                        &nbsp;
                    </div>
                    <div class="col-2 form-inline">
                        <a href="javascript:fncGuardarSeyci()">
                        <input type="button" value="Guardar" alt="Guardar" class="btn btn-custom">
                        </a>
                    </div>
                </div>
            </div>
        </html:form>
    </body>
</html>

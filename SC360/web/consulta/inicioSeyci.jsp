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
                var url = 'Traslado.do?method=inicioTraslado&numeroExp=' + numeroExp;
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
    <body style="background-color:#FFFFFF;">
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
                <div class="col-md-6">
                    <div class="row show-grid">
                        <div class="col-md-6"><STRONG>SEYCI</STRONG>&nbsp;</div>
                        <div class="col-md-6"> <html:hidden property="numeroExpediente"></html:hidden></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row show-grid form-group">
                            <div class="col-md-6 ">
                                <label  col-sm-2 control-label>N Solicitud&nbsp;</label>
                            </div>
                            <div class="col-md-6">
                            <html:text property="nroSolicitud" styleClass="form-control input-sm" size="12" maxlength="12" disabled="true" />


                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="row show-grid form-group">
                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label>Ejecutivo&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <html:select property="ejecutivo" styleClass="form-control input-sm" styleId="ejecutivo" >
                                <html:option value="0">[EJECUTIVO]</html:option>
                                <html:options collection="listEjecutivo" property="codigo" labelProperty="descripcion"/>
                            </html:select>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="ejecutivo" >
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label> Tipo Solicitud&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <select id="tipoSolicitud" name="tipoSolicitud" class="form-control input-sm" >
                                <option value="00">[SELECCIONE]</option>
                                <option value="01">Invalidez</option>
                                <option value="02">Invalidez y Cáncer</option>
                                <option value="03">Invalidez y Enfermedad Terminal</option>
                            </select>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="tipoSolicitud" >
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row show-grid form-group">
                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label> Agencia&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <html:select property="agencia" styleClass="form-control input-sm" styleId="agencia" >
                                <html:option value="0">[AGENCIA]</html:option>
                                <html:options collection="listAgencias" property="codigo" labelProperty="descripcion"/>
                            </html:select>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="agencia" >
                        </div>
                    </div>
                    <div class="row show-grid form-group">
                        <div class="col-md-4 ">
                            <label  col-sm-2 control-label> Tipo Evaluado&nbsp;</label>
                        </div>
                        <div class="col-md-6">
                            <select id="tipoEvaluado" name="tipoEvaluado" class="form-control input-sm" >
                                <option value="00">[SELECCIONE]</option>
                                <option value="01">Afiliado</option>
                                <option value="02">Beneficiario</option>
                            </select>

                        </div>
                        <div class="col-md-2" >
                            <input type="checkbox" id="tipoEvaluado" >
                        </div>
                    </div>
                </div>
                <div class="col-md-12">

                    <STRONG>Nombre del Evaluado&nbsp;</STRONG>&nbsp;                   
                </div>
                <div class="space">&nbsp;</div>



                <div class="col-md-2">
                    <html:text property="primerNombreEvaluado" styleClass="form-control input-sm" styleId="primerNombre" size="20" maxlength="20" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" id="primerNombreEvaluado" >
                </div>
                <div class="col-md-2">
                    <html:text property="segundoNombreEvaluado" styleClass="form-control input-sm" styleId="segundoNombre" size="20" maxlength="20" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" id="segundoNombreEvaluado" >
                </div>
                <div class="col-md-2">
                    <html:text property="primerApellidoEvaluado" styleClass="form-control input-sm" styleId="primerApellido" size="20" maxlength="20" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" id="primerApellidoEvaluado" >
                </div>
                <div class="col-md-2">
                    <html:text property="segundoApellidoEvaluado" styleClass="form-control input-sm" styleId="segundoApellido" size="20" maxlength="20" />

                </div>
                <div class="col-md-1">
                    <input type="checkbox" id="segundoApellidoEvaluado" >
                </div>
                <div class="space">&nbsp;</div>


                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Parentesco&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-12">
                                <select id="parentesco" name="parentesco" class="form-control input-sm" >
                                    <option value="00">[SELECCIONE]</option>
                                    <option value="01">Titular</option>
                                    <option value="02">Conyugue</option>
                                    <option value="03">Hijos</option>
                                    <option value="04">Padres</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="parentesco" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Nac&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaNacimientoSeyci" styleClass="form-control input-sm" styleId="fechaNacimientoSeyci" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaNacimientoSeyci" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Act Riesgo&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-12">
                                <select id="actRiesgo" name="actRiesgo" class="form-control input-sm" >
                                    <option value="00">[NO]</option>
                                    <option value="01">[SI]</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="actRiesgo" >
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="row show-grid form-group">
                        <div class="col-md-4">
                            Resultados Evaluacion&nbsp;
                        </div>
                        <div class="col-md-6">
                            <select id="resultadoEvaluacion" name="resultadoEvaluacion" class="form-control input-sm" >
                                <option value="00">[PROCEDE]</option>
                                <option value="00">[RECHAZADO]</option>
                                <option value="00">[SUSPENDIDO]</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="resultadoEvaluacion" >
                        </div>
                    </div>
                </div>

                <div class="space">&nbsp;</div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Sec I&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaSeccionI" styleClass="form-control input-sm" styleId="fechaSeccionI" size="12" />
                            </div>
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaSeccionI" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">

                        </div>
                        <div class="col-md-7">

                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Ingreso Benef&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaIngresoBenef" styleClass="form-control input-sm" styleId="fechaIngresoBenef" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaIngresoBenef" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Firma Medico&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaFirmaMedico" styleClass="form-control input-sm" styleId="fechaFirmaMedico" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaFirmaMedico" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            DJ de no Beneficiarios&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-12">
                                <select id="djBenef" name="djBenef" class="form-control input-sm" >
                                    <option value="01">[SI]</option>
                                    <option value="02">[NO]</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="djBenef" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Envio COMAFP&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaEnvioCOMAFP" styleClass="form-control input-sm" styleId="fechaEnvioCOMAFP" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaRecepcionComafp" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Recep COMAFP&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaRecepCOMAFP" styleClass="form-control input-sm" styleId="fechaRecepCOMAFP" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaRecepcionComafp" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Envio DIS&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaEnvioDIS" styleClass="form-control input-sm" styleId="fechaEnvioDIS" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaEnvioDis" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Recep DIS&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fechaRecepcionDIS" styleClass="form-control input-sm" styleId="fechaRecepcionDIS" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaRecepcionDis" >
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Nombre Archivo ok Dis&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-12">
                                <html:text property="nombreArchivoOKDis" styleClass="form-control input-sm" styleId="nombreArchivoOKDis" size="12" />
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Fecha Conclusion&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-10">
                                <html:text property="fecConclusion" styleClass="form-control input-sm" styleId="fecConclusion" size="12" />
                            </div>
                            <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/> 

                        </div>
                        <div class="col-md-2">
                            <input type="checkbox" id="fechaConclusion" >
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row show-grid form-group">
                        <div class="col-md-3">
                            Analista&nbsp;
                        </div>
                        <div class="col-md-7">
                            <div class="col-xs-12">
                                <html:text property="analista" styleClass="form-control input-sm" styleId="analista" size="12" />   
                            </div>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row show-grid form-group">
                        <div >
                            Observaciones SEYCI&nbsp;
                        </div>
                        <div >
                            <div class="col-xs-12">
                                <html:textarea cols="120" rows="2" styleClass="form-control input-sm" property="observacionesSEYCI" readonly="false" />
                            </div>
                        </div>

                    </div>
                </div>


                <div class="col-2 form-inline">
                    <a href="javascript:fncGuardarSeyci()">
                        <input type="button" value="Guardar" alt="Guardar" class="btn btn-custom">
                    </a>
                </div>

            </div>            




        </html:form>
    </body>
</html>

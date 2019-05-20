<%-- 
    Document   : apelacion
    Created on : 17/04/2019, 10:24:49 PM
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
        <title>APELACION</title>
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
                $("#fechaApelacion").datepicker();
                $("#fecIngBeneficios").datepicker();
                $("#fecEnvCarta").datepicker();
                $("#fecDictamen").datepicker();
                $("#fecEnvioDis").datepicker();
                $("#fecNotAfiliado").datepicker();
                $("#fecNotCOMEC").datepicker();
            });

            function irReevaluacion() {
                var form = document.frmDictamen;
                var url = "Reevaluacion.do?method=inicioReevaluacion";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function irDictamen() {
                var form = document.frmApelacion;
                var url = "Dictamen.do?method=inicioDictamen";
                var form = document.forms(0);
                form.action = url;
                form.method = "post";
                form.submit();
            }

            function fncGuardarApelacion() {
                var form = document.getElementById("frmApelacion");
                form.action = "Apelacion.do?method=guardarApelacion";
                form.method = "post";
                form.submit();
            }


        </script>

    </head>

    <body style="background-color:#FFFFFF;">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link" href="javascript:irDetalle()">Detalle Consulta</a></li>
                <li class="nav-item"><a class="nav-link" href="#">SEYCI</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irTraslado()">TRASLADO</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irReevaluacion()">REEVALUACION</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:irDictamen()">DICTAMEN</a></li>
                <li class="nav-item active"><a class="nav-link" href="#">APELACION</a></li>
            </ul>
        </div>
        <html:form action="Apelacion.do" styleId="frmApelacion" >


            <div class="form-group div-align-l dv-align-2030">

                <div class="row show-grid">

                    <STRONG>APELACION</STRONG>&nbsp;
                        <html:hidden property="nroSeyci"></html:hidden>
                        <div class="space">&nbsp;</div>
                        <div class="col-md-4">
                            <div class="row show-grid form-group">
                                <div class="col-md-4">
                                    Nro Dictamen Apelado&nbsp;
                                </div>
                                <div class="col-md-6">

                                <html:text property="nroDictamenApelado" styleClass="form-control input-sm" styleId="nroDictamenApelado" size="12" />                                

                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="nroDictamenApelado" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Persona Apela&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="personaApela" styleClass="form-control input-sm" styleId="personaApela" size="12" />

                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="personaApela" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Apelacion&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="fechaApelacion" styleClass="form-control input-sm" styleId="fechaApelacion" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>

                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fechaApelacion" >
                            </div>
                        </div>
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Ingreso Beneficios&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="fecIngBeneficios" styleClass="form-control input-sm" styleId="fecIngBeneficios" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecIngBeneficios" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Envio Carta&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="fecEnvCarta" styleClass="form-control input-sm" styleId="fecEnvCarta" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecEnvcarta" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Recepcion COMAFP&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="recepCOMAFP" styleClass="form-control input-sm" styleId="recepCOMAFP" size="12" />
                                <input type="checkbox" id="recepCOMAFP" >
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="recepCOMAFP" >
                            </div>
                        </div>
                    </div>
                                <div class="space">&nbsp;</div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Analista&nbsp;
                            </div>
                            <div class="col-md-6">

                                <html:text property="analista" styleClass="form-control input-sm" styleId="analista" size="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="analista" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Motivo Apelacion&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="motivoApelacion" styleClass="form-control input-sm" styleId="motivoApelacion" size="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="motivoApelacion" >
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Nro Dictamen Apelado&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="nroExpDictamenApelado" styleClass="form-control input-sm" styleId="nroExpDictamenApelado" size="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="nroExpDictamenApelado" >
                            </div>
                        </div>
                    </div>
                            <div class="space">&nbsp;</div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                DIS / PACIFICO&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="disPacifico" styleClass="form-control input-sm" styleId="disPacifico" size="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="disPacifico" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Dictamen&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecDictamen" styleClass="form-control input-sm" styleId="fecDictamen" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecDictamen" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Envio DIS&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecEnvioDis" styleClass="form-control input-sm" styleId="fecEnvioDis" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecEnvioDis" >
                            </div>
                        </div>
                    </div> 
                            <div class="space">&nbsp;</div>
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                SOL&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="oK" styleClass="form-control input-sm" styleId="oK" size="12" />
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="ok" >
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Notificacion Afiliado&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecNotAfiliado" styleClass="form-control input-sm" styleId="fecNotAfiliado" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecNotAfiliado" >
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-4">
                        <div class="row show-grid form-group">
                            <div class="col-md-4">
                                Fecha Notificacion COMEC&nbsp;
                            </div>
                            <div class="col-md-6">
                                <html:text property="fecNotCOMEC" styleClass="form-control input-sm" styleId="fecNotCOMEC" size="12" />
                                <img id="imagen_calendario1" src="<c:out value="${pageContext.request.contextPath}"/>/images/calendario.gif" alt="Calendario"/>
                            </div>
                            <div class="col-md-2">
                                <input type="checkbox" id="fecNotCOMEC" >
                            </div>
                        </div>
                    </div> 


                    <div class="space">&nbsp;</div>


                    <div class="col-2 form-inline">
                        Observaciones&nbsp;
                    </div>
                    <div class="space">&nbsp;</div>
                    <div class="col-7 form-inline">
                        <html:textarea cols="120" rows="2" styleClass="form-control input-sm" property="observaciones" readonly="false" />
                    </div>

                     <div class="space">&nbsp;</div>
                  
                        <div class="col-2 form-inline">
                            <a href="javascript:fncGuardarApelacion()">
                                <div style="text-align: center"><input type="button" value="Guardar" alt="Guardar" class="btn btn-custom"></div>
                            </a>
                        </div>
                   

                </div>



            </div>

        </html:form>
    </body>


</html>
